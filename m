Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E717311298E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 11:50:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icSCT-00023X-0Q; Wed, 04 Dec 2019 10:48:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icSCR-00023S-1Y
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 10:48:03 +0000
X-Inumbo-ID: 8b012ad2-1683-11ea-aea8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b012ad2-1683-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575456483;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cViWVwRY3IWgCLA5LYrUTBNxsRMoPY6UX712vsvCg6k=;
 b=cy+w8rV8hcRDQYf6B1PPEZ8TpzadPpx8/vHEdTZTcEodVg4fRlDHit2m
 MisrPZ3gVZmVEml0Bv8O7WZteeffecZR1wOnEQvcRDt9/NEv3VfU19TNy
 oNeLbrzoXcIr+Bgt97M8wbc+p4mjHvRBS1J/gKIHnvK0NmZfM1ZR4uj8/ Q=;
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
IronPort-SDR: 1W/UCkKUJoBVjy4uE4TLZP498P/3829LFTLcw4zLvmEElPk4zBKWdohokb2gKQ3WQN4yR8Eup+
 Fey51h1VLUImJ8Ky5icSMkDZgWVlyAXF6UNjti1kXJO7J8m4A8Z2okb1ABxkWTyhr+vXlA7a38
 NUdmCK1l5vlgKc/l366QjbQVqUx/Bz7KmP4LqKbIcXCdGTEJj5sy6u3vEiwCWLmKKhr4DFRPQP
 dQT7cESktUGHTsYv4ubG5SD3PyH9qpKMpnW/GhHQdA8vmlE4Qd2NVBtr52XVv/EvfqtqEfojez
 j3I=
X-SBRS: 2.7
X-MesageID: 9182191
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9182191"
Date: Wed, 4 Dec 2019 11:47:54 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191204104754.GH980@Air-de-Roger>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-2-roger.pau@citrix.com>
 <0bcf69cf-646a-fd72-4216-6819554e34d9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0bcf69cf-646a-fd72-4216-6819554e34d9@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/ioapic: only use dest32 with
 x2apic and interrupt remapping enabled
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDQ6MTE6MDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMTEuMjAxOSAxMjoyOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2lvX2FwaWMuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2lvX2FwaWMu
Ywo+ID4gQEAgLTU2Miw3ICs1NjIsNyBAQCBzZXRfaW9hcGljX2FmZmluaXR5X2lycShzdHJ1Y3Qg
aXJxX2Rlc2MgKmRlc2MsIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKPiA+ICAKPiA+ICAgICAgZGVz
dCA9IHNldF9kZXNjX2FmZmluaXR5KGRlc2MsIG1hc2spOwo+ID4gICAgICBpZiAoZGVzdCAhPSBC
QURfQVBJQ0lEKSB7Cj4gPiAtICAgICAgICBpZiAoICF4MmFwaWNfZW5hYmxlZCApCj4gPiArICAg
ICAgICBpZiAoICFpb21tdV9pbnRyZW1hcCApCj4gCj4gVG8gbWF0Y2ggZGVzY3JpcHRpb24gYXMg
d2VsbCBhcyB0aGUgb3RoZXIgY2hhbmdlcyBkb25lLCBkb2Vzbid0Cj4gdGhpcyBuZWVkIHRvIGJl
ICIheDJhcGljX2VuYWJsZWQgfHwgIWlvbW11X2ludHJlbWFwIj8KClllcywgaW4gZmFjdCBJIGFs
cmVhZHkgaGFkIHRoaXMgY2hhbmdlIG9uIG15IGxvY2FsIGJyYW5jaCwgbm90IHN1cmUKd2h5IGl0
IGRpZG4ndCBlbmQgdXAgaW4gdGhlIHBhdGNoIEkgc2VudC4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
