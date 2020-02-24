Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B214916A393
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:11:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Ag7-0000yU-O8; Mon, 24 Feb 2020 10:09:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6Ag6-0000yD-AB
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:09:30 +0000
X-Inumbo-ID: bd9fa39c-56ed-11ea-8ad8-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd9fa39c-56ed-11ea-8ad8-12813bfff9fa;
 Mon, 24 Feb 2020 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582538968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Wgf6uPifeEksL0B1BBcxNW5fFE7qHsTdBCsCnozylB8=;
 b=TNnfUXpKmEObpf5Mfz5usCw5NHsPyllg3t0n7knTaXhsFLSJP3Vf1MGi
 MXJiVPNOrYyReVavDQE1Fc54NhsYaGVzSFX734uVIavgpELlIVGtInHV1
 4NpJKZYS/+6ZSFIE7nYo2cDivdNJWHcdYS2pBZ3/Qxat7qrJRxCxJTfei k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PDZu4TubKjyloDmnfbEjjm50QLNFHShgjm57lDXCFkjmT9R/KqlNhB0ZcrhyoBAMngtiqJx8En
 Wg8bMqWiPz5RXPu5NNRI4oeAyIU3qaSXbbthnQczTnqAyhuKuIlDajygJwWEzGQxtsZAXn0Ws9
 /ES7+rCSXf22Fi1jjqU506xD+ivowHJXtcpoVOFDIKEOYW/4gYApNqvmhqfpcawEknYNErVoZN
 HgSl6prRzFCt2BZ3TjL/EPVuRjMHWWA74wFYv702CxLwLG7HCKLQE+ZtTvzZszpSrAYcZZCXzK
 bYs=
X-SBRS: 2.7
X-MesageID: 12902401
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="12902401"
Date: Mon, 24 Feb 2020 11:09:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200224100919.GH4679@Air-de-Roger>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
 <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTA6MDI6NTNBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFJvZ2VyLAo+IAo+IFRoZSBsb2dpYyBmb3IgQXJtNjQgYW5kIEFybTMyIGxvb2tz
IGdvb2QgdG8gbWUuIEkganVzdCBoYXZlIG9uZSBxdWVzdGlvbgo+IGJlbG93Lgo+IAo+IE9uIDI0
LzAyLzIwMjAgMDg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+IFRvIHg4NiBhbmQgQXJt
LiBUaGlzIHBlcmZvcm1zIGFuIGF0b21pYyBBTkQgb3BlcmF0aW9uIGFnYWluc3QgYW4KPiA+IGF0
b21pY190IHZhcmlhYmxlIHdpdGggdGhlIHByb3ZpZGVkIG1hc2suCj4gPiAKPiA+IFJlcXVlc3Rl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICAgeGVu
L2luY2x1ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMuaCB8IDE3ICsrKysrKysrKysrKysrKysrCj4g
PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYXRvbWljLmggfCAxNCArKysrKysrKysrKysr
Kwo+ID4gICB4ZW4vaW5jbHVkZS9hc20teDg2L2F0b21pYy5oICAgICAgIHwgIDggKysrKysrKysK
PiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9hcm0zMi9hdG9taWMuaAo+ID4gaW5kZXggYzAzZWI2ODRjZC4uNDYzNzM4MWJjYyAxMDA2
NDQKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvYXRvbWljLmgKPiA+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvYXRvbWljLmgKPiA+IEBAIC05Niw2ICs5NiwyMyBA
QCBzdGF0aWMgaW5saW5lIGludCBhdG9taWNfc3ViX3JldHVybihpbnQgaSwgYXRvbWljX3QgKnYp
Cj4gPiAgIAlyZXR1cm4gcmVzdWx0Owo+ID4gICB9Cj4gPiArc3RhdGljIGlubGluZSB2b2lkIGF0
b21pY19hbmQodW5zaWduZWQgaW50IG0sIGF0b21pY190ICp2KQo+IAo+IEFsbCB0aGUgYXRvbWlj
IGhlbHBlcnMgaGF2ZSB0YWtlbiBhIHNpZ25lZCBpbnQgc28gZmFyIGJlY2F1c2UgdGhlIGNvdW50
ZXIgaXMKPiBhbiBpbnQuIEFueSByZWFzb24gdG8gZGl2ZXJnZSBmcm9tIHRoYXQ/CgpTaW5jZSB0
aGlzIGlzIG5vdCBhbiBhcml0aG1ldGljIG9wZXJhdGlvbiBJIGZlbHQgdW5zaWduZWQgaW50IHdh
cyBhCm1vcmUgc3VpdGFibGUgdHlwZSB0byBkZXNjcmliZSBhIGJpdG1hc2s6IGl0IGZlbHQgd2Vp
cmQgdG8gcGFzcyBhCmJpdG1hc2sgd2l0aCB0eXBlIGludCwgYmVjYXVzZSBzaWduZWRuZXNzIGRv
ZXNuJ3QgbWFrZSBzZW5zZSB3aGVuCnJlZmVycmluZyB0byBhIG1hc2suCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
