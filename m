Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E9B619B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:43:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXOT-0002X7-GN; Wed, 18 Sep 2019 10:41:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4j=XN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAXOS-0002X0-J8
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:41:04 +0000
X-Inumbo-ID: cff85fd0-da00-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cff85fd0-da00-11e9-b299-bc764e2007e4;
 Wed, 18 Sep 2019 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568803264;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=EdDVZO9lEv2whGR40IQFXiPTjDdP7/4X0EsDE140Pqo=;
 b=aLls1xZb3VZZGy85HUHhoY+yyapc1dau0fVPmYKtjxM3C5nS69O/Oe1Q
 jA1JJsVJ7K+x6Tl3xZGslf7jelKk0GEYliRhq8u8S4pzvQgKkBAP2JnVI
 Uy0/nBiMLKDu9X2w5GA0ZfFX2Mysuir8I5uD+0rOSt3tkd9kl8zPKtgup Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: teUMVM5o+NZx3BgFn9xtxn66IPMByGqabjCKrMFS1DtC/2TLGeadVsppAl+8Tr6Js+QIdFY6yz
 puugc5IXP+9ffXGmJNyyQzw/sDKh6b2XT9W6nYD2cXgkHsKXiBlOAZJdu+MZzNTRviKwt7M5Un
 2W4vA8NUR4jVVG03RmwBBjlzYNhxO20+WvynBV8X0wwb3ougvX2xL2axXMyDgqOA3dXxq95zHb
 nuRDf97wK3cDHKklkC5Pqvzz1k+oRGtw4ku9jwmO8cAA4eMQgzfZiLYM9XDYbcgf2Y/kJwTmkn
 5zs=
X-SBRS: 2.7
X-MesageID: 5922042
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5922042"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23938.2492.424579.175738@mariner.uk.xensource.com>
Date: Wed, 18 Sep 2019 11:41:00 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIGNyZWF0ZS1kaWZmLW9iamVjdDogbW9y
ZSBwcmVjaXNlbHkgaWRlbnRpZnkgLnJvZGF0YSBzZWN0aW9ucyIpOgo+IE9uIDE4LzA5LzIwMTkg
MTA6NTIsIFdpZWN6b3JraWV3aWN6LCBQYXdlbCB3cm90ZToKPiA+ICQgc2NyaXB0cy8uL2FkZF9t
YWludGFpbmVycy5wbCAtZCB+L2dpdC9saXZlcGF0Y2gtYnVpbGQtdG9vbHMKPiAKPiAnLWQnIG9u
bHkgdGVsbHMgeW91IHdoZXJlIHRoZSBwYXRjaGVzIGZpbGVzIGFyZS4gVGhlIHNjcmlwdCB3aWxs
IGxvb2sgdXAgZm9yIHRoZSAKPiBNQUlOVEFJTkVSUyBmaWxlIGluIHRoZSBjdXJyZW50IGRpcmVj
dG9yeS4KCkhtbW0uICBJIHdvbmRlciBpZiB3ZSBjb3VsZCBkZXRlY3QgdGhpcyBzaXR1YXRpb24g
c29tZWhvdy4gIFRoaXMgd2lsbApiZSBhIGNvbW1vbiB1c2VyIGVycm9yIEkgdGhpbmsuCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
