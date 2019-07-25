Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EB474C45
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:57:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqbOL-0003hz-5M; Thu, 25 Jul 2019 10:54:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqbOK-0003hu-AL
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:54:32 +0000
X-Inumbo-ID: 948a0a4c-aeca-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 948a0a4c-aeca-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:54:31 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zIjBZJcTUB8JrypjwiQuGLoABtWRox1TLfTtoLp1657NZCiU0ZdfUiP/ZRlPVcsXeJgmWQd9NU
 IBI6N5c79WBj6gHANtgNf0wpAybdYzU8XFmZC6vFjqUhIP6yE6WHPlKU/1SQAaR/r0lyqrATgN
 N790xhnhkVSMzlyQ8hFcP7+9e4UdYnU2C8QrRcU9fAaWXlCaKmgqYlncRGjo8EruzpuQMZ9Z8M
 ll8Vr8a0t1OPXHUwNq3fVFjZ/nli0Pr1xVIIMU3UzPYQKLriAdZe1amY4QlQVZvgXQXEB9ayUx
 cDE=
X-SBRS: 2.7
X-MesageID: 3544990
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3544990"
Date: Thu, 25 Jul 2019 12:54:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190725105422.cymulz7ynruwycfy@Air-de-Roger>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-2-roger.pau@citrix.com>
 <502a2fd8-5a03-0921-bf5f-bb88feae35c1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <502a2fd8-5a03-0921-bf5f-bb88feae35c1@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/iommu: avoid mapping the interrupt
 address range for hwdom
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTA6MjI6MTdBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjMuMDcuMjAxOSAxNzo0OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQ3Vy
cmVudCBjb2RlIG9ubHkgcHJldmVudCBtYXBwaW5nIHRoZSBsYXBpYyBwYWdlIGludG8gdGhlIGd1
ZXN0Cj4gPiBwaHlzaWNhbCBtZW1vcnkgbWFwLiBFeHBhbmQgdGhlIHJhbmdlIHRvIGJlIDB4RkVF
eF94eHh4IGFzIGRlc2NyaWJlZAo+ID4gaW4gdGhlIEludGVsIFZUZCBzcGVjaWZpY2F0aW9uIHNl
Y3Rpb24gMy4xMyAiSGFuZGxpbmcgUmVxdWVzdHMgdG8KPiA+IEludGVycnVwdCBBZGRyZXNzIFJh
bmdlIi4KPiA+IAo+ID4gQU1EIGFsc28gbGlzdHMgdGhpcyBhZGRyZXNzIHJhbmdlIGluIHRoZSBB
TUQgU1I1NjkwIERhdGFib29rLCBzZWN0aW9uCj4gPiAyLjQuNCAiTVNJIEludGVycnVwdCBIYW5k
bGluZyBhbmQgTVNJIHRvIEhUIEludGVycnVwdCBDb252ZXJzaW9uIi4KPiA+IAo+ID4gUmVxdWVz
dGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4g
SSd2ZSBjb21taXR0ZWQgdGhpcyBvbiB0aGUgYmFzaXMgdGhhdCBpdCBzaG91bGRuJ3QgaHVydCwg
YnV0IGhhdmluZwo+IHRob3VnaHQgYWJvdXQgdGhpcyBzb21lIG1vcmUgSSdtIG5vdCByZWFsbHkg
c3VyZSBJIHNlZSB0aGUgcG9pbnQ6Cj4gVGhlIElPTU1VIHNwZWNpYWwgY2FzZXMgYWNjZXNzZXMg
aW50byB0aGlzIHJhbmdlIGFueXdheSwgdG8gcmVkaXJlY3QKPiBsb29rdXAgdG8gdGhlIGludGVy
cnVwdCByZW1hcHBpbmcgdGFibGUgaW5zdGVhZCBvZiB0aGUgRE1BIHJlbWFwcGluZwo+IG9uZS4g
SGVuY2UgYW55IG1hcHBpbmdzIGluc2VydGVkIGludG8gdGhpcyByYW5nZSBhcmUgc2ltcGx5IHVz
ZWxlc3MsCj4gYnV0IHNob3VsZG4ndCBvdGhlcndpc2UgaHVydC4KCkludGVsIFNETSBjb250YWlu
czoKCiJTb2Z0d2FyZSBtdXN0IGVuc3VyZSB0aGUgc2Vjb25kLWxldmVsIHBhZ2luZy1zdHJ1Y3R1
cmUgZW50cmllcyBhcmUKcHJvZ3JhbW1lZCBub3QgdG8gcmVtYXAgaW5wdXQgYWRkcmVzc2VzIHRv
IHRoZSBpbnRlcnJ1cHQgYWRkcmVzcwpyYW5nZS4gSGFyZHdhcmUgYmVoYXZpb3IgaXMgdW5kZWZp
bmVkIGZvciBtZW1vcnkgcmVxdWVzdHMgcmVtYXBwZWQgdG8KdGhlIGludGVycnVwdCBhZGRyZXNz
IHJhbmdlLiIKCkluIHNlY3Rpb24gMy4xMyAoSGFuZGxpbmcgUmVxdWVzdHMgdG8gSW50ZXJydXB0
IEFkZHJlc3MgUmFuZ2UpLgoKU2luY2UgYXJjaF9pb21tdV9od2RvbV9pbml0L2h3ZG9tX2lvbW11
X21hcCBhZGRzIGVudHJpZXMgdG8gYm90aCB0aGUKaGFwIGFuZCB0aGUgaW9tbXUgcGFnZSB0YWJs
ZXMgKG9yIHRvIGhhcCBvbmx5IGlmIHNoYXJlZCkgWGVuIHNob3VsZCBiZQpjYXJlZnVsIHRvIG5v
dCBtYXAgdGhpcyByYW5nZSBiZWNhdXNlIHRoZSBpb21tdSBzcGVjaWFsIGNhc2VzIHRoaXMKcmFu
Z2UsIGJ1dCBJJ20gbm90IHN1cmUgd2hhdCBoYXAgZG9lcy4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
