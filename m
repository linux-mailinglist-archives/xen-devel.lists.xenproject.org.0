Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA7D110050
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9FZ-0008FS-Rt; Tue, 03 Dec 2019 14:34:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jXxe=ZZ=amazon.com=prvs=2337975f3=sjpark@srs-us1.protection.inumbo.net>)
 id 1ic9FX-0008FN-Ul
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:33:59 +0000
X-Inumbo-ID: f153e5fe-15d9-11ea-a55d-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f153e5fe-15d9-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575383640; x=1606919640;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RXSZcs/qVPDPyswC2jRGt//36h8Hc2BlXBaBEjUudjQ=;
 b=il6epCO4ma+ExV8mRzyG2EYPtFqWLOgHV4SMHhA48pyigKM1hUTHM6BG
 7IIviF8uxQrsxIerP49PjCEoIMTmR0Vn6+If9BgUjdWKufTWCXs5UxZht
 LrUiJ49/DnDeI9MhEblFJ+PrN2rSoAmH+DzRzaQqCyuqR+Au0UBjfL7S5 A=;
IronPort-SDR: coc3S0BFg7Yzigp7n7nUbxLeudhPKgshlx19TdBKmZeiBGKBdRS0F5W3etCiCBhBBo4Uwe2x2V
 JWuoaX8mHwvw==
X-IronPort-AV: E=Sophos;i="5.69,273,1571702400"; d="scan'208";a="12661880"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 03 Dec 2019 14:33:46 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id D515EA17D7; Tue,  3 Dec 2019 14:33:45 +0000 (UTC)
Received: from EX13D12UEA003.ant.amazon.com (10.43.61.184) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Dec 2019 14:33:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D12UEA003.ant.amazon.com (10.43.61.184) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Dec 2019 14:33:45 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.28.85.76) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 14:33:44 +0000
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 <konrad.wilk@oracle.com>, <axboe@kernel.dk>
References: <20191126153605.27564-1-sjpark@amazon.com>
 <20191127091314.GK980@Air-de-Roger>
From: <sjpark@amazon.com>
Message-ID: <11ff29ea-ee0f-1dd1-a93e-84d1dd45418e@amazon.com>
Date: Tue, 3 Dec 2019 15:33:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127091314.GK980@Air-de-Roger>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] xen/blkback: Avoid unmapping unmapped grant
 pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMTA6MTMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBOb3Yg
MjYsIDIwMTkgYXQgMDQ6MzY6MDVQTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3cm90ZToKPj4gRnJv
bTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPj4KPj4gRm9yIGVhY2ggSS9PIHJl
cXVlc3QsIGJsa2JhY2sgZmlyc3QgbWFwcyB0aGUgZm9yZWlnbiBwYWdlcyBmb3IgdGhlCj4+IHJl
cXVlc3QgdG8gaXRzIGxvY2FsIHBhZ2VzLiAgSWYgYW4gYWxsb2NhdGlvbiBvZiBhIGxvY2FsIHBh
Z2UgZm9yIHRoZQo+PiBtYXBwaW5nIGZhaWxzLCBpdCBzaG91bGQgdW5tYXAgZXZlcnkgbWFwcGlu
ZyBhbHJlYWR5IG1hZGUgZm9yIHRoZQo+PiByZXF1ZXN0Lgo+Pgo+PiBIb3dldmVyLCBibGtiYWNr
J3MgaGFuZGxpbmcgbWVjaGFuaXNtIGZvciB0aGUgYWxsb2NhdGlvbiBmYWlsdXJlIGRvZXMKPj4g
bm90IG1hcmsgdGhlIHJlbWFpbmluZyBmb3JlaWduIHBhZ2VzIGFzIHVubWFwcGVkLiAgVGhlcmVm
b3JlLCB0aGUgdW5tYXAKPj4gZnVuY3Rpb24gbWVyZWx5IHRyaWVzIHRvIHVubWFwIGV2ZXJ5IHZh
bGlkIGdyYW50IHBhZ2UgZm9yIHRoZSByZXF1ZXN0LAo+PiBpbmNsdWRpbmcgdGhlIHBhZ2VzIG5v
dCBtYXBwZWQgZHVlIHRvIHRoZSBhbGxvY2F0aW9uIGZhaWx1cmUuICBPbiBhCj4+IHN5c3RlbSB0
aGF0IGZhaWxzIHRoZSBhbGxvY2F0aW9uIGZyZXF1ZW50bHksIHRoaXMgcHJvYmxlbSBsZWFkcyB0
bwo+PiBmb2xsb3dpbmcga2VybmVsIGNyYXNoLgo+Pgo+PiAgIFsgIDM3Mi4wMTI1MzhdIEJVRzog
dW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IDAwMDAw
MDAwMDAwMDAwMDEKPj4gICBbICAzNzIuMDEyNTQ2XSBJUDogWzxmZmZmZmZmZjgxNDA3MWFjPl0g
Z250dGFiX3VubWFwX3JlZnMucGFydC43KzB4MWMvMHg0MAo+PiAgIFsgIDM3Mi4wMTI1NTddIFBH
RCAxNmYzZTkwNjcgUFVEIDE2NDI2ZTA2NyBQTUQgMAo+PiAgIFsgIDM3Mi4wMTI1NjJdIE9vcHM6
IDAwMDIgWyMxXSBTTVAKPj4gICBbICAzNzIuMDEyNTY2XSBNb2R1bGVzIGxpbmtlZCBpbjogYWN0
X3BvbGljZSBzY2hfaW5ncmVzcyBjbHNfdTMyCj4+ICAgLi4uCj4+ICAgWyAgMzcyLjAxMjc0Nl0g
Q2FsbCBUcmFjZToKPj4gICBbICAzNzIuMDEyNzUyXSAgWzxmZmZmZmZmZjgxNDA3MjA0Pl0gZ250
dGFiX3VubWFwX3JlZnMrMHgzNC8weDQwCj4+ICAgWyAgMzcyLjAxMjc1OV0gIFs8ZmZmZmZmZmZh
MDMzNWFlMz5dIHhlbl9ibGtia191bm1hcCsweDgzLzB4MTUwIFt4ZW5fYmxrYmFja10KPj4gICAu
Li4KPj4gICBbICAzNzIuMDEyODAyXSAgWzxmZmZmZmZmZmEwMzM2YzUwPl0gZGlzcGF0Y2hfcndf
YmxvY2tfaW8rMHg5NzAvMHg5ODAgW3hlbl9ibGtiYWNrXQo+PiAgIC4uLgo+PiAgIERlY29tcHJl
c3NpbmcgTGludXguLi4gUGFyc2luZyBFTEYuLi4gZG9uZS4KPj4gICBCb290aW5nIHRoZSBrZXJu
ZWwuCj4+ICAgWyAgICAwLjAwMDAwMF0gSW5pdGlhbGl6aW5nIGNncm91cCBzdWJzeXMgY3B1c2V0
Cj4+Cj4+IFRoaXMgY29tbWl0IGZpeGVzIHRoaXMgcHJvYmxlbSBieSBtYXJraW5nIHRoZSBncmFu
dCBwYWdlcyBvZiB0aGUgZ2l2ZW4KPj4gcmVxdWVzdCB0aGF0IGRpZG4ndCBtYXBwZWQgZHVlIHRv
IHRoZSBhbGxvY2F0aW9uIGZhaWx1cmUgYXMgaW52YWxpZC4KPj4KPj4gRml4ZXM6IGM2Y2MxNDJk
YWM1MiAoInhlbi1ibGtiYWNrOiB1c2UgYmFsbG9vbiBwYWdlcyBmb3IgYWxsIG1hcHBpbmdzIikK
Pj4KPj4gU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPj4g
UmV2aWV3ZWQtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uZGU+Cj4+IFJldmlld2Vk
LWJ5OiBNYXhpbWlsaWFuIEhleW5lIDxtaGV5bmVAYW1hem9uLmRlPgo+PiBSZXZpZXdlZC1ieTog
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Cj4gVGhhbmtzLCBSb2dlci4KCgpN
YXkgSSBhc2sgc29tZSBtb3JlIGNvbW1lbnRzPwoKCgpUaGFua3MsCgpTZW9uZ0phZSBQYXJrCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
