Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2950958A9
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 09:40:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzyh8-0005MW-2v; Tue, 20 Aug 2019 07:36:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B9c3=WQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hzyh7-0005MR-2D
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 07:36:41 +0000
X-Inumbo-ID: 3da2b274-c31d-11e9-8bf4-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3da2b274-c31d-11e9-8bf4-12813bfff9fa;
 Tue, 20 Aug 2019 07:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566286597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1ikwuyV5aHiUY6ihfiQ8TUnV2SWmXGpslwkLq86DlCI=;
 b=XM7MtUwMASsFexJlWOuEW+katvrdY6ollG6jEYDkdxemxjfZMVEoqtKN
 WLzu9n4Qpnt9rkXV0uzCHrcmxGIbjE7wKBTEFM4f1cXu659PJslNhXReS
 7rVOyeYfRotodnqlC294crz/gD42wmFJLChd6HYt1hpXaN3R9XyT4M+rs U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AYCI1S/u8BtSukVh1fWx/hmWaxTh3sXo6IzrVYp2zS26pyZC7XygU1U/ZxrQeiI3nan+WwJPAK
 kyeboTIRExo+tFu6UoHmwe/FN7SH5xqcvOR5+WXNutII1cx+/d/Uthh/16BsXMDer8SX6z9w5+
 +lRQBrjAuMsiGvcqaCi3eZ4DD6Rkc0j6WFvaJSxH6EpmLx6vKQ/BHtjyyeqIda/i4861xc5wUr
 2fLT+BUcMbP6+SaeE2+Jy5N3mP0u1ZEZbEhCNGvBG86GrXesse4k2RrR+Oi7fdBqoO1kg40EEN
 Chk=
X-SBRS: 2.7
X-MesageID: 4508259
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4508259"
Date: Tue, 20 Aug 2019 09:36:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190820073626.vlbvpjyqqmh4ovyw@Air-de-Roger>
References: <20190722153209.73107-1-roger.pau@citrix.com>
 <CAMmSBy8-RjAfKbd4zgNkdP30WB6B3knYySW9Q=i-V7177Ur3Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy8-RjAfKbd4zgNkdP30WB6B3knYySW9Q=i-V7177Ur3Ww@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/p2m: fix non-translated handling of
 iommu mappings
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDY6NTc6MDZQTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCA4OjMzIEFNIFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSBjdXJyZW50IHVzYWdl
IG9mIG5lZWRfaW9tbXVfcHRfc3luYyBpbiBwMm0gZm9yIG5vbi10cmFuc2xhdGVkCj4gPiBndWVz
dHMgaXMgd3JvbmcgYmVjYXVzZSBpdCBkb2Vzbid0IGNvcnJlY3RseSBoYW5kbGUgYSByZWxheGVk
IFBWCj4gPiBoYXJkd2FyZSBkb21haW4sIHRoYXQgaGFzIG5lZWRfc3luYyBzZXQgdG8gZmFsc2Us
IGJ1dCBzdGlsbCBuZWVkCj4gPiBlbnRyaWVzIHRvIGJlIGFkZGVkIGZyb20gY2FsbHMgdG8ge3Nl
dC9jbGVhcn1faWRlbnRpdHlfcDJtX2VudHJ5Lgo+ID4KPiA+IEFkanVzdCB0aGUgY29kZSBpbiBn
dWVzdF9waHlzbWFwX2FkZF9wYWdlIHRvIGFsc28gY2hlY2sgd2hldGhlciB0aGUKPiA+IGRvbWFp
biBoYXMgYW4gaW9tbXUgaW5zdGVhZCBvZiB3aGV0aGVyIGl0IG5lZWRzIHN5bmNpbmcgb3Igbm90
IGluCj4gPiBvcmRlciB0byB0YWtlIGEgcmVmZXJlbmNlIHRvIGEgcGFnZSB0byBiZSBtYXBwZWQu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gPiAtLS0KPiA+IENjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNp
dHJpeC5jb20+Cj4gPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gQ2M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBDYzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KPiA+IENjOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXgu
Y29tPgo+IAo+IFRlc3RlZC1ieTogUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVkZWRhLmNvbT4K
ClRoZXJlJ3MgYSB2MiBvZiB0aGUgcGF0Y2gsIGJ1dCBJIGd1ZXNzIHlvdXIgVEIgYWxzbyBhcHBs
aWVzIHRvIGl0LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
