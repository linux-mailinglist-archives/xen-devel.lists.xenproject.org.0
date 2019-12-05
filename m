Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815D114367
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:19:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icsrh-0005ar-Jb; Thu, 05 Dec 2019 15:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rQYf=Z3=amazon.com=prvs=235266773=sjpark@srs-us1.protection.inumbo.net>)
 id 1icsrg-0005ak-J8
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:16:24 +0000
X-Inumbo-ID: 33054b3e-1772-11ea-822b-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33054b3e-1772-11ea-822b-12813bfff9fa;
 Thu, 05 Dec 2019 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575558984; x=1607094984;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3b67Jvba8gIZpJXfm/xkjZkiUlmiLZrVurEcjDQr9gM=;
 b=Dmnked13jT0UiEApZAy281HL9UYhEcsYtHuv6ZiYOyHZh5atLetBNSYa
 mbKGdr5bjoGuPll/2sdqRh35TQOVB1a7i6GLhFQwC+tu6ABb8TwNyWw/X
 OzLlLNq33hiIJQYKwAQSnYcTdBnaFVdiihSeS0bobnP5MxFPolRRU/Edj 4=;
IronPort-SDR: P0031kteqDJXom+suS0YoL3vZtyZhvtmuu8SxhbS0cp8MRcu2sQ04TvZ7dRBYg+AB6KE8ujlDo
 HL4sA5jG+dLQ==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="6355523"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 05 Dec 2019 15:16:22 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id C0567A18DE; Thu,  5 Dec 2019 15:16:21 +0000 (UTC)
Received: from EX13D04UEA001.ant.amazon.com (10.43.61.40) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 15:16:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D04UEA001.ant.amazon.com (10.43.61.40) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 15:16:21 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.28.85.76) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 5 Dec 2019 15:16:20 +0000
To: <axboe@kernel.dk>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>
References: <20191205150932.3793-1-sjpark@amazon.com>
From: <sjpark@amazon.com>
Message-ID: <af195033-23d5-38ed-b73b-f6e2e3b34541@amazon.com>
Date: Thu, 5 Dec 2019 16:16:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205150932.3793-1-sjpark@amazon.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 0/1] xen/blkback: Aggressively shrink
 page pools if a memory pressure is detected
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, sj38.park@gmail.com,
 linux-kernel@vger.kernel.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMTkgMTY6MDksIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gRWFjaCBgYmxraWZgIGhh
cyBhIGZyZWUgcGFnZXMgcG9vbCBmb3IgdGhlIGdyYW50IG1hcHBpbmcuICBUaGUgc2l6ZSBvZgo+
IHRoZSBwb29sIHN0YXJ0cyBmcm9tIHplcm8gYW5kIGJlIGluY3JlYXNlZCBvbiBkZW1hbmQgd2hp
bGUgcHJvY2Vzc2luZwo+IHRoZSBJL08gcmVxdWVzdHMuICBJZiBjdXJyZW50IEkvTyByZXF1ZXN0
cyBoYW5kbGluZyBpcyBmaW5pc2hlZCBvciAxMDAKPiBtaWxsaXNlY29uZHMgaGFzIHBhc3NlZCBz
aW5jZSBsYXN0IEkvTyByZXF1ZXN0cyBoYW5kbGluZywgaXQgY2hlY2tzIGFuZAo+IHNocmlua3Mg
dGhlIHBvb2wgdG8gbm90IGV4Y2VlZCB0aGUgc2l6ZSBsaW1pdCwgYG1heF9idWZmZXJfcGFnZXNg
Lgo+Cj4gVGhlcmVmb3JlLCBgYmxrZnJvbnRgIHJ1bm5pbmcgZ3Vlc3RzIGNhbiBjYXVzZSBhIG1l
bW9yeSBwcmVzc3VyZSBpbiB0aGUKPiBgYmxrYmFja2AgcnVubmluZyBndWVzdCBieSBhdHRhY2hp
bmcgYSBsYXJnZSBudW1iZXIgb2YgYmxvY2sgZGV2aWNlcyBhbmQKPiBpbmR1Y2luZyBJL08uICBT
eXN0ZW0gYWRtaW5pc3RyYXRvcnMgY2FuIGF2b2lkIHN1Y2ggcHJvYmxlbWF0aWMKPiBzaXR1YXRp
b25zIGJ5IGxpbWl0aW5nIHRoZSBtYXhpbXVtIG51bWJlciBvZiBkZXZpY2VzIGVhY2ggZ3Vlc3Qg
Y2FuCj4gYXR0YWNoLiAgSG93ZXZlciwgZmluZGluZyB0aGUgb3B0aW1hbCBsaW1pdCBpcyBub3Qg
c28gZWFzeS4gIEltcHJvcGVyCj4gc2V0IG9mIHRoZSBsaW1pdCBjYW4gcmVzdWx0IGluIHRoZSBt
ZW1vcnkgcHJlc3N1cmUgb3IgYSByZXNvdXJjZQo+IHVuZGVydXRpbGl6YXRpb24uICBUaGlzIGNv
bW1pdCBhdm9pZHMgc3VjaCBwcm9ibGVtYXRpYyBzaXR1YXRpb25zIGJ5Cj4gc2hyaW5raW5nIHRo
ZSBwb29scyBhZ2dyZXNzaXZlbHkgKGZ1cnRoZXIgdGhlIGxpbWl0KSBmb3IgYSB3aGlsZSAodXNl
cnMKPiBjYW4gc2V0IHRoaXMgZHVyYXRpb24gdmlhIGEgbW9kdWxlIHBhcmFtZXRlcikgaWYgYSBt
ZW1vcnkgcHJlc3N1cmUgaXMKPiBkZXRlY3RlZC4KPgo+Cj4gQmFzZSBWZXJzaW9uCj4gLS0tLS0t
LS0tLS0tCj4KPiBUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIHY1LjQuICBBIGNvbXBsZXRlIHRyZWUg
aXMgYWxzbyBhdmFpbGFibGUgYXQgbXkKPiBwdWJsaWMgZ2l0IHJlcG86Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL3NqcDM4L2xpbnV4L3RyZWUvYmxrYmFja19hZ2dyZXNzaXZlX3Nocmlua2luZ192Mgo+
Cj4KPiBQYXRjaCBIaXN0b3J5Cj4gLS0tLS0tLS0tLS0tLQo+Cj4gQ2hhbmdlcyBmcm9tIHYxICho
dHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAxOTEyMDQxMTM0MTkuMjI5OC0xLXNq
cGFya0BhbWF6b24uY29tLykKPiAgLSBBZGp1c3QgdGhlIGRlc2NyaXB0aW9uIHRvIG5vdCB1c2Ug
dGhlIHRlcm0sIGBhcmJpdHJhcmlseWAgKHN1Z2dlc3RlZAo+ICAgIGJ5IFBhdWwgRHVycmFudCkK
PiAgLSBTcGVjaWZ5IHRpbWUgdW5pdCBvZiB0aGUgZHVyYXRpb24gaW4gdGhlIHBhcmFtZXRlciBk
ZXNjcmlwdGlvbiwKPiAgICAoc3VnZ2VzdGVkIGJ5IE1heGltaWxpYW4gSGV5bmUpCj4gIC0gQ2hh
bmdlIGRlZmF1bHQgYWdncmVzc2l2ZSBzaHJpbmtpbmcgZHVyYXRpb24gZnJvbSAxbXMgdG8gMTBt
cwo+ICAtIE1lcmdlZCB0d28gcGF0Y2hlcyBpbnRvIG9uZSBzaW5nbGUgcGF0Y2gKPgo+Cj4gU2Vv
bmdKYWUgUGFyayAoMSk6Cj4gICB4ZW4vYmxrYmFjazogQWdncmVzc2l2ZWx5IHNocmluayBwYWdl
IHBvb2xzIGlmIGEgbWVtb3J5IHByZXNzdXJlIGlzCj4gICAgIGRldGVjdGVkCj4KPiAgZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysr
KysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCgpDQy1pbmcgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgoKVGhhbmtzLApTZW9u
Z0phZSBQYXJrCgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
