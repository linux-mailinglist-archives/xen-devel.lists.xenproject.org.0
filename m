Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C771162461
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 11:18:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3zuX-0002IP-MA; Tue, 18 Feb 2020 10:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3zuW-0002IK-Bf
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 10:15:24 +0000
X-Inumbo-ID: 92e61b0a-5237-11ea-ade5-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92e61b0a-5237-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582020924;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3Ha1Om4c0dn6Cb1+YjEKSkIYd3BdxfAUgNibyRd0d+A=;
 b=bqbikfT7CxT6laLA+HRyQ5CnWFyuj5xr0QJ+pXjCJmqv2CINvX0Dd+/T
 n0a4Uz1sj0ZblG70VJB8u9fzTGIyWwmwRmXEHWZuSrCw5HuVmt3jGPkin
 1Ylg3qpo5sBVaPgTEHITf1VWxgZBE1ZJu8O51K4CL0LFgJpmVRyiPh4+Q 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ThF2rKI8WEjkCNJLahqUY7Pc3IiNfsNe2Zia+dpoKMCW0EQT5fbl1cNZ70X+zlFDT0hNsRetJt
 u9kKfiRXGfu9sn7fiZHpmVZMl2EUaFALhuusI6eKXiSVhMsA7iUyXPVUfRWN/MvP5Gx4J0burI
 lxu0WQkXhF/qvGnCXmNhT7jbLRYLR69O3koqRV050bKJg5z1uwqY3yzibRUBs07I7nBF3g0XUX
 8mc/4OBGU1ckDmWW8EvI6PAhmsWkpds4FIdbYDVpNGTsAEO1n+x6Uuc/GE1QZA0GMxKCQsc34w
 lVw=
X-SBRS: 2.7
X-MesageID: 12783387
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12783387"
Date: Tue, 18 Feb 2020 11:15:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200218101515.GQ4679@Air-de-Roger>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <cec31639-00ce-8ef1-4a7e-1d85a92b820e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cec31639-00ce-8ef1-4a7e-1d85a92b820e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 0/6] x86: fixes/improvements for scratch
 cpumask
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDg6NDA6NThBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxNy4wMi4yMCAxOTo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gSGVs
bG8sCj4gPiAKPiA+IENvbW1pdDoKPiA+IAo+ID4gNTUwMGQyNjVhMmE4ZmE2M2Q2MGMwOGJlYjU0
OWRlOGVjODJmZjdhNQo+ID4geDg2L3NtcDogdXNlIEFQSUMgQUxMQlVUIGRlc3RpbmF0aW9uIHNo
b3J0aGFuZCB3aGVuIHBvc3NpYmxlCj4gPiAKPiA+IEludHJvZHVjZWQgYSBib2d1cyB1c2FnZSBv
ZiB0aGUgc2NyYXRjaCBjcHVtYXNrOiBpdCB3YXMgdXNlZCBpbiBhCj4gPiBmdW5jdGlvbiB0aGF0
IGNvdWxkIGJlIGNhbGxlZCBmcm9tIGludGVycnVwdCBjb250ZXh0LCBhbmQgaGVuY2UgdXNpbmcK
PiA+IHRoZSBzY3JhdGNoIGNwdW1hc2sgdGhlcmUgaXMgbm90IHNhZmUuIFBhdGNoICM1IGlzIGEg
Zml4IGZvciB0aGF0IHVzYWdlLAo+ID4gdG9nZXRoZXIgd2l0aCBhbHNvIHByZXZlbnRpbmcgdGhl
IHVzYWdlIG9mIGFueSBwZXItQ1BVIHZhcmlhYmxlcyB3aGVuCj4gPiBzZW5kX0lQSV9tYXNrIGlz
IGNhbGxlZCBmcm9tICNNQyBvciAjTk1JIGNvbnRleHQuIFByZXZpb3VzIHBhdGNoZXMgYXJlCj4g
PiBwcmVwYXJhdG9yeSBjaGFuZ2VzLgo+ID4gCj4gPiBQYXRjaCAjNiBhZGRzIHNvbWUgZGVidWcg
aW5mcmFzdHJ1Y3R1cmUgdG8gbWFrZSBzdXJlIHRoZSBzY3JhdGNoIGNwdW1hc2sKPiA+IGlzIHVz
ZWQgaW4gdGhlIHJpZ2h0IGNvbnRleHQsIGFuZCBoZW5jZSBzaG91bGQgcHJldmVudCBmdXJ0aGVy
IG1pc3N1c2VzLgo+IAo+IEkgd29uZGVyIHdoZXRoZXIgaXQgd291bGRuJ3QgYmUgYmV0dGVyIHRv
IGhhdmUgYSBjb21tb24gcGVyY3B1IHNjcmF0Y2gKPiBjcHVtYXNrIGhhbmRsaW5nIGluc3RlYWQg
b2YgaW50cm9kdWNpbmcgbG9jYWwgb25lcyBhbGwgb3ZlciB0aGUKPiBoeXBlcnZpc29yLgoKQnV0
IHRoZSBzY3JhdGNoIENQVSBtYXNrIGFscmVhZHkgYWNjb21wbGlzaGVzIHRoaXMsIGl0J3MgYSBz
aW5nbGUKcGVyLUNQVSBtYXNrIGFsbG9jYXRlZCB3aGVuIHRoZSBDUFUgaXMgYnJvdWdodCB1cC4K
Cj4gU28gYmFzaWNhbGx5IGFuIGFycmF5IG9mIHBlcmNwdSBjcHVtYXNrcyBhbGxvY2F0ZWQgd2hl
biBicmluZ2luZyB1cCBhCj4gY3B1ICh0aGlzIHNwYXJlcyBtZW1vcnkgYXMgdGhlIG1hc2tzIHdv
dWxkbid0IG5lZWQgdG8gY292ZXIgTlJfQ1BVUwo+IGNwdXMpLCBhIHBlcmNwdSBjb3VudGVyIG9m
IHRoZSBuZXh0IGZyZWUgaW5kZXggYW5kIGdldF8gYW5kIHB1dF8KPiBmdW5jdGlvbnMgYWN0aW5n
IGluIGEgbGlmbyBtYW5uZXIuCgpTaXppbmcgdGhpcyBhcnJheSB3b3VsZCBiZSBjb21wbGljYXRl
ZCBJTU8sIGFuZCBpdCdzIHBvc3NpYmxlIHRoYXQgYQpmYWlsdXJlIHRvIGdldCBhIG1hc2sgaW4g
Y2VydGFpbiBwbGFjZXMgY291bGQgbGVhZCB0byBhIHBhbmljLgoKPiBUaGlzIHdvdWxkIGhlbHAg
cmVtb3ZpbmcgYWxsIHRoZSBzdGlsbCBleGlzdGluZyBjcHVtYXNrcyBvbiB0aGUgc3RhY2sKPiBh
bmQgYW55IGlsbGVnYWwgbmVzdGluZyB3b3VsZCBiZSBhdm9pZGVkLiBUaGUgb25seSByZW1haW5p
bmcgcXVlc3Rpb24KPiB3b3VsZCBiZSB0aGUgc2l6ZSBvZiB0aGUgYXJyYXkuCj4gCj4gVGhvdWdo
dHM/CgpJJ20gbW9zdGx5IHdvcnJpZWQgYWJvdXQgdGhlIHNpemUgb2Ygc3VjaCBzdGFjaywgc2lu
Y2Ugd2Ugd291bGQgdGhlbgphbGxvdyBuZXN0ZWQgY2FsbHMgdG8gdGhlIGdldF8gY3B1bWFzayBo
ZWxwZXIuIEFsc28gSSdtIG5vdCBzdXJlCndoZXRoZXIgd2Ugc2hvdWxkIHByZXZlbnQgdGhlIHVz
YWdlIGluIGludGVycnVwdCBjb250ZXh0IHRoZW4sIGluCm9yZGVyIHRvIHRyeSB0byBsaW1pdCB0
aGUgbmVzdGluZyBhcyBtdWNoIGFzIHBvc3NpYmxlLgoKSSB0aGluayB0aGlzIHNlcmllcyBpcyBh
IG1vdmUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiwgYW5kIHdlIGNhbiBhZGQKdGhlIHBlci1DUFUg
c3RhY2sgYWZ0ZXJ3YXJkcyAoYXMgdGhlIGdldF8vcHV0XyBoZWxwZXJzIHdpbGwgYWxyZWFkeSBi
ZQp0aGVyZSkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
