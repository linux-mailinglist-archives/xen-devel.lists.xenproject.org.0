Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460E814D30C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 23:24:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwvjE-0001e1-8S; Wed, 29 Jan 2020 22:22:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BF16=3S=amazon.com=prvs=29084464a=jgrall@srs-us1.protection.inumbo.net>)
 id 1iwvjC-0001dp-Qf
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 22:22:30 +0000
X-Inumbo-ID: d634059a-42e5-11ea-89a2-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d634059a-42e5-11ea-89a2-12813bfff9fa;
 Wed, 29 Jan 2020 22:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580336550; x=1611872550;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Hr++Xm5/SV7JXThAprauznben7RfJdieVJTXWnIIrzU=;
 b=JQXI+8WCD8Q5Dc2Yde402ulueVr3aH0h40PbHNJSEWmKwkAHGxoqnnZy
 XYN8YJxsUBupggGSK54Db92m7krB0PCZn2MxmdGiNL/o1h3awAWovG10s
 fKanrbgIcY+L7COg0Y9JhHFptGLPTDBdB7I3s5HZonhN23Z+HHR9+yiyj 0=;
IronPort-SDR: duQNqjC0vKtnAwnN17m+Ex5lKeC3uKAZlerF7G6ef6Is9JC9wCVNCuSaFbosyFZoifP796SDj4
 yciI89LZxk5w==
X-IronPort-AV: E=Sophos;i="5.70,379,1574121600"; d="scan'208";a="21907583"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Jan 2020 22:22:19 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6DF74A1762; Wed, 29 Jan 2020 22:22:18 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 22:22:18 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 22:22:17 +0000
Received: from a483e7b01a66.ant.amazon.com (10.95.157.113) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1236.3 via Frontend Transport; Wed, 29 Jan 2020 22:22:15 +0000
To: Anthony PERARD <anthony.perard@citrix.com>, Paul Durrant
 <pdurrant@amazon.com>
References: <20191216143451.19024-1-pdurrant@amazon.com>
 <20191219171158.GF1267@perard.uk.xensource.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <b2762e84-1cc4-649c-9b53-8754678525f6@amazon.com>
Date: Wed, 29 Jan 2020 22:22:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191219171158.GF1267@perard.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen-bus/block: explicitly assign event
 channels to an AioContext
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKCk9uIDE5LzEyLzIwMTkgMTc6MTEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+
IE9uIE1vbiwgRGVjIDE2LCAyMDE5IGF0IDAyOjM0OjUxUE0gKzAwMDAsIFBhdWwgRHVycmFudCB3
cm90ZToKPj4gSXQgaXMgbm90IHNhZmUgdG8gY2xvc2UgYW4gZXZlbnQgY2hhbm5lbCBmcm9tIHRo
ZSBRRU1VIG1haW4gdGhyZWFkIHdoZW4KPj4gdGhhdCBjaGFubmVsJ3MgcG9sbGVyIGlzIHJ1bm5p
bmcgaW4gSU9UaHJlYWQgY29udGV4dC4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IHhlbl9k
ZXZpY2Vfc2V0X2V2ZW50X2NoYW5uZWxfY29udGV4dCgpIGZ1bmN0aW9uCj4+IHRvIGV4cGxpY2l0
bHkgYXNzaWduIHRoZSBjaGFubmVsIEFpb0NvbnRleHQsIGFuZCBtb2RpZmllcwo+PiB4ZW5fZGV2
aWNlX2JpbmRfZXZlbnRfY2hhbm5lbCgpIHRvIGluaXRpYWxseSBhc3NpZ24gdGhlIGNoYW5uZWwn
cyBwb2xsZXIKPj4gdG8gdGhlIFFFTVUgbWFpbiB0aHJlYWQgY29udGV4dC4gVGhlIGNvZGUgaW4g
eGVuLWJsb2NrJ3MgZGF0YXBsYW5lIGlzCj4+IHRoZW4gbW9kaWZpZWQgdG8gYXNzaWduIHRoZSBj
aGFubmVsIHRvIElPVGhyZWFkIGNvbnRleHQgZHVyaW5nCj4+IHhlbl9ibG9ja19kYXRhcGxhbmVf
c3RhcnQoKSBhbmQgZGUtYXNzaWduIGl0IGR1cmluZyBpbgo+PiB4ZW5fYmxvY2tfZGF0YXBsYW5l
X3N0b3AoKSwgc3VjaCB0aGF0IHRoZSBjaGFubmVsIGlzIGFsd2F5cyBhc3NpZ25lZAo+PiBiYWNr
IHRvIG1haW4gdGhyZWFkIGNvbnRleHQgYmVmb3JlIGl0IGlzIGNsb3NlZC4gYWlvX3NldF9mZF9o
YW5kbGVyKCkKPj4gYWxyZWFkeSBkZWFscyB3aXRoIGFsbCB0aGUgbmVjZXNzYXJ5IHN5bmNocm9u
aXphdGlvbiB3aGVuIG1vdmluZyBhbiBmZAo+PiBiZXR3ZWVuIEFpb0NvbnRleHQtcyBzbyBubyBl
eHRyYSBjb2RlIGlzIG5lZWRlZCB0byBtYW5hZ2UgdGhpcy4KPj4KPj4gUmVwb3J0ZWQtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpJIGNhbid0IGZpbmQgdGhlIHBhdGNoIGlu
IFFFTVUgdXBzdHJlYW0uIEFyZSB3ZSBtaXNzaW5nIGFueSBhY2svcmV2aWV3IApmb3IgdGhpcyBw
YXRjaD8KCj4gCj4+IFRlc3RlZCBhZ2FpbnN0IGFuIEhWTSBkZWJpYW4gZ3Vlc3Qgd2l0aCBhIFFD
T1cyIGltYWdlIGFzIHN5c3RlbSBkaXNrLCBhbmQKPj4gYXMgYSBob3QtcGx1Z2dlZC91bnBsZ2dl
ZCBzZWNvbmRhcnkgZGlzay4KPiAKPiBBbmQgSSd2ZSBydW4gYW4gb3NzdGVzdCBmbGlnaHQgd2l0
aCB0aGUgcGF0Y2guCj4gCj4gVGhhbmtzLAo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
