Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D2173A43
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 15:50:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7guq-0005IE-Sc; Fri, 28 Feb 2020 14:47:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7gup-0005I9-6a
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 14:46:59 +0000
X-Inumbo-ID: 2b3c5514-5a39-11ea-8e51-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b3c5514-5a39-11ea-8e51-bc764e2007e4;
 Fri, 28 Feb 2020 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582901217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c6oNMk2x1ocuhLm1qp2B5cNKnO4SqagkPBuka8aQg2M=;
 b=IVX5ECr6aBm9pXzny9WDqucdDH44yEpa2Jif1E4E1060oiYoQnY7db7K
 HZiE4osVGrUdlQu5iN5asaa4Pxc5mBxifDWj37uAA+bBBqeCk+YcVQ8ty
 7uqthoci3OQtev/yYlqy3WmcIp3NDu0jpxuPaOkpgysPDmS7JXpmHm7W/ I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xU18oL7xB5BwvT57Hsz7jZsJA4re9a2oU58F0fPuShqsLzGJRJz3bXtiSgKo9OLtJTH34Z6ZGS
 KdMry82QA9RZ1mCjbBCqE1o8OD7SzgQ5lEVDVZniSCRkQv8QbIFy35XQJFNtfHui3TxPv63Hqs
 FeC1kqbuoDDzMZQTgX2aQQES++yEcqm7WYBhQ9LkZrmarUE9jlXGymBRHJ0FtgjAA/4C3IKWkV
 4i2disiPpt5Lnc61rs73DHgdV9p7tE7IbnJ8A9Yr2GifQxmL+uyz4IHI+9LyiBtV2KPdliSM6H
 w58=
X-SBRS: 2.7
X-MesageID: 13799623
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13799623"
Date: Fri, 28 Feb 2020 15:46:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228144650.GY24458@Air-de-Roger.citrite.net>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <116e417c-f8bb-5eab-2356-7fa3532e219f@suse.com>
 <20200228123331.GX24458@Air-de-Roger.citrite.net>
 <a6a0791f-e9ed-46c4-4acd-91999a132a32@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6a0791f-e9ed-46c4-4acd-91999a132a32@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 1/2] AMD/IOMMU: correct handling when
 XT's prereq features are unavailable
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDI6MTM6NDVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxMzo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDI4LCAyMDIwIGF0IDAxOjEwOjU5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IFdlIHNob3VsZCBuZWl0aGVyIGNhdXNlIElPTU1VIGluaXRpYWxpemF0aW9uIGFzIGEg
d2hvbGUgdG8gZmFpbCBpbiB0aGlzCj4gPj4gY2FzZSAod2Ugc2hvdWxkIHN0aWxsIGJlIGFibGUg
dG8gYnJpbmcgdXAgdGhlIHN5c3RlbSBpbiBub24teDJBUElDIG9yCj4gPj4geDJBUElDIHBoeXNp
Y2FsIG1vZGUpLCBub3Igc2hvdWxkIHRoZSByZW1haW5kZXIgb2YgdGhlIGZ1bmN0aW9uIGJlCj4g
Pj4gc2tpcHBlZCAoYXMgdGhlIG1haW4gcGFydCBvZiBpdCB3b24ndCBnZXQgZW50ZXJlZCBhIDJu
ZCB0aW1lKQo+ID4gCj4gPiBJJ20gbm90IHN1cmUgSSBzZWUgd2h5IGl0IHdvbid0IGdldCBlbnRl
cmVkIGEgc2Vjb25kIHRpbWUuIEFGQUlDVAo+ID4gaW5pdF9kb25lIHdvbid0IGJlIHNldCBpZiBh
bWRfaW9tbXVfaW5pdCBmYWlscywgYW5kIGhlbmNlIHdpbGwgYmUKPiA+IGNhbGxlZCBhZ2FpbiB3
aXRoIHh0ID09IGZhbHNlIGluIGlvdl9kZXRlY3Q/Cj4gCj4gTm90IHZlcnkgZmFyIGZyb20gdGhl
IHRvcCBvZiB0aGUgZnVuY3Rpb24gdGhlcmUgaXMKPiAKPiAgICAgLyogSGF2ZSB3ZSBiZWVuIGhl
cmUgYmVmb3JlPyAqLwo+ICAgICBpZiAoIGl2cnNfYmRmX2VudHJpZXMgKQo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gCj4gSGVuY2UgbWUgc2F5aW5nICJtYWluIHBhcnQiIHJhdGhlciB0aGFuICJ0aGUg
ZnVuY3Rpb24gYXMgYSB3aG9sZSIuCgpPaCwgeWVzLCBzb3JyeS4KClJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
