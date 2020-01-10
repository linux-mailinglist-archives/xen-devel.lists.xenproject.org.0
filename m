Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E268A13729F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:16:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipww1-0001PZ-5S; Fri, 10 Jan 2020 16:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vEkf=27=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipww0-0001PU-FP
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:14:52 +0000
X-Inumbo-ID: 546a2f2e-33c4-11ea-bf54-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 546a2f2e-33c4-11ea-bf54-12813bfff9fa;
 Fri, 10 Jan 2020 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578672892;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P2DI2M8fXsW+K1ac5KRwLOmjK996+1bpcgPeFfE51PE=;
 b=Gv9UMzoi2iUiQnj0GzhSuW4ZPWn/UPy5LYKjSp9YHSGGfv6xF/5CG8Ct
 wqIBFWQHi2iMxNAHeOBXjg6TX2Dnv0FnSCQ4CpenetSgKSL00CGay7cd0
 3kQjrPAZ59r7RhpMo1LKYW+T+TMnqTz1wqLaDfCnyt/74SBi8cMw2wdaI 8=;
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
IronPort-SDR: Yp6Sx5deUafaF7TAT29DI6qznmASR0Q2+rUQKLV3jcbJ0473frTqQjP8V2JogrSVAbhs5M5DIs
 fSrhiZF15ish8U5Siaph39xwFEMGAfzQY3WOTD0z2AM7UbdNsJmiEMn5RmHZDduANObPxIShbM
 YvjqOFenQsTKREYrTf+ahQ09WElAbgJztzUQikOlyC1QMFJkh2CYEMXPrVZ9Z3RBDScy8jYcEa
 9jR5Rgrjk8IPgsulqF2GzzK6ITvwK8wNRSVoXzQZOAPopzHu+0OHUT+Uy4Au5X/n4Uj4PbJy0l
 bFk=
X-SBRS: 2.7
X-MesageID: 10913602
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="10913602"
Date: Fri, 10 Jan 2020 17:14:44 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200110161444.GD11756@Air-de-Roger>
References: <20200110160404.15573-1-roger.pau@citrix.com>
 <43caf284-1725-19b9-94a6-a2545ff5f21e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43caf284-1725-19b9-94a6-a2545ff5f21e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 0/3] x86: improve assisted tlb flush and
 use it in guest mode
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDU6MDg6MTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTAuMDEuMjAyMCAxNzowNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gUGF0
Y2ggIzIgaXMgbGlrZWx5IHRoZSBtb3N0IGNvbnRyb3ZlcnNpYWwgb25lLCBhcyBpdCBjaGFuZ2Vz
IHRoZQo+ID4gaW1wbGVtZW50YXRpb24gb2YgYXNzaXN0ZWQgVExCIGZsdXNoZXMuIEkgaGF2ZSB0
byBhZG1pdCBJIGhhdmVuJ3QgYmVlbgo+ID4gYWJsZSB0byBmaWd1cmUgb3V0IHdoeSBIVk0gZ3Vl
c3QgY29udGV4dCBmbHVzaGVzIGlzc3VlZCBhCj4gPiBmbHVzaF90bGJfbWFzaywgYW5kIHRoZSBj
b21taXQgaW50cm9kdWNpbmcgc3VjaCBiZWhhdmlvciBkb2Vzbid0IGNvbnRhaW4KPiA+IGEgaGVs
cGZ1bCBjb21taXQgbWVzc2FnZS4KPiAKPiBBIHNoYWRvdyBtb2RlIHRoaW5nLCBtYXliZT8KCkht
LCBJIGNvdWxkIGJlIHdyb25nLCBidXQgdGhhdCBmbHVzaCBkb2Vzbid0IHNlZW0gdG8gbWFrZSBz
ZW5zZSBmb3IKc2hhZG93IG1vZGUgZWl0aGVyLgoKSWYgVlBJRC9BU0lEIGlzIHVzZWQsIHRpY2tp
bmcgaXQgd2lsbCBkcm9wIGFsbCB0aGUgZ3Vlc3QgY2FjaGVzLCBhbmQKaWYgVlBJRC9BU0lEIG5v
dCB1c2VkIGEgdm1leGl0L3ZtZW50cnkgd2lsbCBjbGVhciB0aGUgY2FjaGUuCkFjY29yZGluZyB0
byBteSByZWFkaW5nIG9mIHRoZSBJbnRlbCBTRE0gdGhpcyBhcHBsaWVzIHJlZ2FyZGxlc3Mgb2YK
d2hldGhlciBIQVAgKEVQVCkgaXMgdXNlZCBvciBub3QuCgpUaGUgZmx1c2ggZG9uZSBieSBmbHVz
aF90bGJfbWFzayBpcyBpbiByb290IG1vZGUsIGFuZCBoZW5jZSBkb2Vzbid0CmFmZmVjdCB0aGUg
Z3Vlc3QgKG5vbi1yb290KSBjYWNoZXMgd2hlbiBTVk0vVlR4IGlzIHVzZWQuCgpSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
