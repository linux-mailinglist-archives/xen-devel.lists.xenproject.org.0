Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964931700B4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 15:04:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6xGp-0002dC-Vr; Wed, 26 Feb 2020 14:02:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6xGn-0002d7-VV
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 14:02:38 +0000
X-Inumbo-ID: a423092c-58a0-11ea-9428-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a423092c-58a0-11ea-9428-12813bfff9fa;
 Wed, 26 Feb 2020 14:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582725756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7XPqfxVZ0jqdvwsSGMr8oRyozFzxBfJDPzKRpUITy8M=;
 b=EIypxYBjSlGNoU2BGPSUyPgc5qlexIE5OmE59ynRh0TPu+MeXkTYK9gL
 2UDWmZ03okXUOp4CR++LyxH8aHdBh4BnLVVP/dWA7lqPoLyyU8xgv4X9P
 BZ6+hCwJgU1CSIXzJYSCp9bxIdlb4/Aom3kjK56EAT1caXOfs0hFvAQ9o I=;
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
IronPort-SDR: ySh91M1nj+/owjwpq+HA4dJB1DKa4yyPvXebQocTn9R3ErlKDRpJeiJ9Rj7q2c4m3iOaOyxqw4
 o1Q8d499bFmHOBDirzqFRHiwyDbnd7diWTIBnsrIkwUYnw/nNnW4t/Jac1dIKMzLD+lKLFajY9
 Pa+W+v/dMmEjj4zN4R3rSegOeqxNAd8Bxz7vqOpvAZ+BNQIPguu9PoiEJtJIWDNXOCI9RnmPjV
 B1CUUCxMRqt1dAcf3Tf1pkPRFR+b5zARYyuqKpM/tnYz8S+T0fNovsxi5tzzf+2jutmn4IOacn
 HW0=
X-SBRS: 2.7
X-MesageID: 13666383
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13666383"
Date: Wed, 26 Feb 2020 15:02:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200226140228.GE24458@Air-de-Roger.citrite.net>
References: <20200226121921.28627-5-roger.pau@citrix.com>
 <20200226123844.29519-1-roger.pau@citrix.com>
 <3cea2d54-345b-d632-2d2f-320fe586e0ea@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cea2d54-345b-d632-2d2f-320fe586e0ea@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/smp: do not use scratch_cpumask
 when in interrupt or exception context
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDI6MTA6NDRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMzozOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVXNp
bmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hc2sgaXMgbm90IHNhZmUgaW4gSVJRIG9y
IGV4Y2VwdGlvbgo+ID4gY29udGV4dCBiZWNhdXNlIGl0IGNhbiBuZXN0LCBhbmQgaGVuY2Ugc2Vu
ZF9JUElfbWFzayBjb3VsZCBiZQo+ID4gb3ZlcndyaXRpbmcgYW5vdGhlciB1c2VyIHNjcmF0Y2gg
Y3B1bWFzayBkYXRhIHdoZW4gdXNlZCBpbiBzdWNoCj4gPiBjb250ZXh0cy4KPiA+IAo+ID4gSW5z
dGVhZCBpbnRyb2R1Y2UgYSBuZXcgY3B1bWFzayB0byBiZSB1c2VkIGJ5IHNlbmRfSVBJX21hc2ss
IGFuZAo+ID4gZGlzYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nIGl0Lgo+IAo+IFdpdGggdGhp
cyBub3cgYXBwYXJlbnRseSBzdGFsZSBzZW50ZW5jZSBkcm9wcGVkIChlYXNpbHkgZG9uZQo+IHdo
aWxlIGNvbW1pdHRpbmcpCgpVaCwgSSB0aG91Z2h0IEkgZml4ZWQgdGhlIGNvbW1pdCBtZXNzYWdl
LCBidXQgbG9va3MgbGlrZSBJIG1pc3NlZCB0aGF0CmJpdC4KClRoYW5rcy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
