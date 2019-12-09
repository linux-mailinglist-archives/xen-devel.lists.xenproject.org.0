Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5518116B08
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:30:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGGM-00005c-GE; Mon, 09 Dec 2019 10:27:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieGGL-00005T-A9
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:27:33 +0000
X-Inumbo-ID: 81f4630c-1a6e-11ea-87bb-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81f4630c-1a6e-11ea-87bb-12813bfff9fa;
 Mon, 09 Dec 2019 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575887252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZXIbK8bnuVBDwncwwgPv4pOTcEKwVds+62u08kklrrQ=;
 b=YRg+FboWTD23J7L6BIOD4V/kJoc7lNdDRbMjFCNJ1CAkTvcQY1cjnOeM
 9Qn+jWdBCqWX15UCBFR3YGecmRfgYYiKpuqeklKu4LKhLE56LxEuxGQgW
 ME1A9xBquqsYFnEGg2lHp9Pw1dSuVm2619FBO+z4kAdViC4IKRsD8K5m9 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yW9h7plBrq0TR/Pw5I/hKgqd3c5zCZu56o97fwYSx6OorliJOrF21oGUv/dvT68yu12Fr9Rw6O
 LeCR8I2srcfkY8uoJKt0dRARjOFaxZcZbts3Gny4SVV2dpCBHt3+ha9jK2gGKNJLa62G/VxCp5
 ZwVZNjdEmKMGtqbU/nPe0ReSYUNQUQGviIHO8j1cQI+7b2q0v9rIwrinkOREmNGmNDZpIFSfuI
 rPCSTdXRHUSSgvcswAtGb0uMyIKjb9brdTU8Fyaj8Ka4Jbnrwklukut8wrJoXUty+WIuJ35zuH
 f7Q=
X-SBRS: 2.7
X-MesageID: 9739210
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9739210"
Date: Mon, 9 Dec 2019 11:27:24 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209102724.GP980@Air-de-Roger>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-4-roger.pau@citrix.com>
 <02ce4cc5-6da9-3383-df9e-39890f622177@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02ce4cc5-6da9-3383-df9e-39890f622177@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v3 3/4] x86/smp: check APIC ID on AP bringup
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

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMTA6MzM6NDRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAxNzoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQ2hl
Y2sgdGhhdCB0aGUgcHJvY2Vzc29yIHRvIGJlIHdva2VuIHVwIEFQSUMgSUQgaXMgYWRkcmVzc2Fi
bGUgaW4gdGhlCj4gPiBjdXJyZW50IEFQSUMgbW9kZS4KPiA+IAo+ID4gTm90ZSB0aGF0IGluIHBy
YWN0aWNlIHN5c3RlbXMgd2l0aCBBUElDIElEcyA+IDI1NSBzaG91bGQgYWxyZWFkeSBoYXZlCj4g
PiB4MkFQSUMgZW5hYmxlZCBieSB0aGUgZmlybXdhcmUsIGFuZCBoZW5jZSB0aGlzIGlzIG1vc3Rs
eSBhIHNhZmV0eQo+ID4gYmVsdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiB3aXRoIC4uLgo+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2
L3NtcGJvb3QuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ID4gQEAgLTEzMTcs
NiArMTMxNywxMyBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQgaW50IGNwdSkKPiA+ICAgICAgaWYg
KCAoYXBpY2lkID0geDg2X2NwdV90b19hcGljaWRbY3B1XSkgPT0gQkFEX0FQSUNJRCApCj4gPiAg
ICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiA+ICAKPiA+ICsgICAgaWYgKCAoIXgyYXBpY19lbmFi
bGVkIHx8ICFpb21tdV9pbnRyZW1hcCkgJiYgKGFwaWNpZCA+PiA4KSApCj4gPiArICAgIHsKPiA+
ICsgICAgICAgIHByaW50aygiVW5zdXBwb3J0ZWQ6IEFQSUMgSUQgJSN4IGluIHhBUElDIG1vZGUg
dy9vIGludGVycnVwdCByZW1hcHBpbmciLAo+ID4gKyAgICAgICAgICAgICAgIGFwaWNpZCk7Cj4g
Cj4gLi4uIHRoZSBsb3N0IG5ld2xpbmUgYWRkZWQgYmFjayAoY2FuIGJlIGRvbmUgd2hpbGUgY29t
bWl0aW5nKS4KClNvcnJ5IGZvciBkcm9wcGluZyBpdCwgcGxlYXNlIGFkZCBpdCBhdCBjb21taXQu
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
