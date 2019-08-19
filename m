Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFE9234D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 14:18:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzgaQ-0004u3-I9; Mon, 19 Aug 2019 12:16:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vhgn=WP=amazon.com=prvs=1276fb681=elnikety@srs-us1.protection.inumbo.net>)
 id 1hzgaP-0004ty-7z
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 12:16:33 +0000
X-Inumbo-ID: 2e5d2396-c27b-11e9-aee9-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e5d2396-c27b-11e9-aee9-bc764e2007e4;
 Mon, 19 Aug 2019 12:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1566216992; x=1597752992;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FiQy6hpqXNlBUwgZwXdFH6tVUnR9opQlBKAQig+Bz6Q=;
 b=Wu+DAaUDte/4xa7DVEzip59GqZOUXl+KTK+8MjczyRMfNQnZKZsTGVen
 WBOH050i52Aes8bsrjbUdl64242UBKe3M4v/CFANEDz46VGVBCJpsdfnc
 gLirruepWcnDRdw1L358atyQiXf32F2SUtJWBEVXSTWkuGMMofGcBA3gJ 4=;
X-IronPort-AV: E=Sophos;i="5.64,403,1559520000"; d="scan'208";a="416078666"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 19 Aug 2019 12:16:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id E1388A1C9F; Mon, 19 Aug 2019 12:16:28 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 19 Aug 2019 12:16:28 +0000
Received: from 8c859093ddbb.ant.amazon.com (10.43.161.230) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 19 Aug 2019 12:16:23 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
 <d0c34b24-697e-fbc1-3d7d-741e0f37c768@suse.com>
 <83a583e2-f4f2-8519-ce58-b200987dcab5@citrix.com>
 <057d72ef-bbec-0e91-b79b-3ebe6da35ba9@suse.com>
 <d2ff9dcf-233b-ac02-1034-310f97e2c215@citrix.com>
 <9e248c4b-4c7d-6450-b5fe-f6d40379ebab@suse.com>
 <67f94dcf-98e8-cea0-b24d-8ca0ee76f0b3@citrix.com>
 <fc77dd42-f8c6-a8f2-2389-3e7e4e75edeb@citrix.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <24cf6091-200b-06ac-6ce7-74630d1114ba@amazon.com>
Date: Mon, 19 Aug 2019 14:16:17 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc77dd42-f8c6-a8f2-2389-3e7e4e75edeb@citrix.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.230]
X-ClientProxiedBy: EX13D01UWA003.ant.amazon.com (10.43.160.107) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad RzeszutekWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC4wOC4xOSAxNTowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNC8wOC8yMDE5
IDEzOjUxLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiA4LzcvMTkgNTowMyBQTSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBXaGF0ZXZlciB3ZSBkbyBpbiBYZW4sIGl0J2xsIG9ubHkgYWxsb3cg
dG8gd29yayBhcm91bmQgdGhhdCBpc3N1ZS4KPj4+IEFuIGFjdHVhbCBmaXggYmVsb25ncyBpbiB0
aGUga2VybmVsKHMpLiBGb3IgdGhpcyByZWFzb24gSSBzdXBwb3NlCj4+PiB3aGF0IHdlJ3JlIHRh
bGtpbmcgYWJvdXQgaGVyZSBpcyBhIGZlYXR1cmUgKGZyb20gWGVuJ3MgcG92KSwgbm90IGEKPj4+
IGJ1ZyBmaXguIEFuZCBpdCBiZWluZyBhIGZlYXR1cmUsIGl0IHNob3VsZCBwcmVmZXJhYmx5IGJl
IGNvZGVkIGluCj4+PiBhIHdheSB0aGF0J3MgdXNhYmxlIGFsc28gZ29pbmcgZm9yd2FyZC4KPj4g
RldJVywgSSBhZ3JlZSB3aXRoIHdoYXQgSSB1bmRlcnN0YW5kIEphbiB0byBiZSBzYXlpbmc6Cj4+
Cj4+IDEuIEl0IHdvdWxkIGJlIGdvb2QgdG8gYmUgYWJsZSB0byBkaXNhYmxlIEZJRk8gZXZlbnQg
Y2hhbm5lbHMsIGJ1dAo+Pgo+PiAyLiBEaXNhYmxpbmcgdGhlbSBpbiBYZW4gaXNuJ3QgcmVhbGx5
IHRoZSByaWdodCB3YXkgdG8gZml4IEFtYXpvbidzCj4+IGlzc3VlLiBSYXRoZXIsIHByb2JhYmx5
IHRoZSBzb2Z0IHJlYm9vdCBzaG91bGQgcmVzZXQgdGhlIGV2ZW50IGNoYW5uZWwKPj4gc3RhdGUu
Cj4gCj4gRGVwZW5kcyB3aGF0IHlvdSBtZWFuIGFib3V0ICJmaXggdGhlIGlzc3VlIi4KPiAKPiBB
bWF6b24gaGF2ZSByZWFsIGN1c3RvbWVyIFZNcyBpbiB0aGlzIHNpdHVhdGlvbiB3aGljaCB3aWxs
IGJyZWFrIG9uIGEKPiBYZW4gb2xkID0+IG5ldyB1cGdyYWRlLsKgIE1vZGlmeWluZyBYZW4gaXMg
dGhlIG9ubHkgcmF0aW9uYWwgb3B0aW9uLgo+IAo+IFRoZXkgYXJlIGFsc28gZG9pbmcgdGhpcyBp
biBhbiB1cHN0cmVhbSBjb21wYXRpYmxlIG1hbm5lciAod2hpY2ggaXMKPiBncmVhdCkuwqAgT25l
IHdheSBvciBhbm90aGVyLCBYZW4gbmVlZHMgdG8gZ2FpbiB0aGlzIGFiaWxpdHkgdG8gd29yawo+
IGFyb3VuZCBicm9rZW4tbGludXggd2hpY2ggaXMgYWxyZWFkeSBpbiB0aGUgZmllbGQuCj4gCj4g
QXMgZm9yIHRoZSBpZGVhbCB3YXkgdG8gZml4IHRoaXMsIHRoaXMgYnVnIGhhcyBleGlzdGVkIGlu
IExpbnV4IGxvbmdlcgo+IHRoYW4gc29mdC1yZXNldCBoYXMgYmVlbiBhIHRoaW5nLCBhbmQgZnJh
bmtseSwgaXRzIHN0aWxsIGEgZ3J1ZXNvbWUKPiBoYWNrLsKgIFdlIG5lZWQgc29tZSBpbnRlcmZh
Y2VzIHdoaWNoIGRvbid0IHN1Y2sgc28gdGVycmlibHkuCj4gCj4gfkFuZHJldwo+IAoKVGhhbmtz
LCBBbmRyZXcuIEkgc2Vjb25kIHRob3NlIHBvaW50cy4KCkkgaGF2ZSBqdXN0IHNlbnQgdjMgb2Yg
dGhpcyBwYXRjaCwgbW9zdGx5IGFkZHJlc3NpbmcgY29tbWVudHMgZnJvbSBKYW4uIApIYXZlIGEg
bG9vaywgYW5kIGxldCBtZSBrbm93IGlmIHRoZXJlIGFyZSBmdXJ0aGVyIHR3ZWFrcyB5b3Ugd291
bGQgCnJhdGhlciBzZWUuIFRoYW5rcy4KCkNoZWVycywKRXNsYW0KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
