Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5415BFA0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 14:44:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Eky-0002ZW-N9; Thu, 13 Feb 2020 13:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o3LU=4B=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j2Ekx-0002ZR-Lz
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 13:42:15 +0000
X-Inumbo-ID: a459fdeb-4e66-11ea-b8a3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a459fdeb-4e66-11ea-b8a3-12813bfff9fa;
 Thu, 13 Feb 2020 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581601335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+9cR1RcyO3hRz8yf3+jgqv5GGPcVOrr3ohSAKVGVIgo=;
 b=B7GgjEXiGPa4kJpKrq30TFy/SgxdAsFBcB3NPhAnohzWFn94wbdpjCDa
 /pML55v+oofuytMfm3NcGhLdBJUzc/s3oqfb7ar9Xph2hY+x3Yu9bqvxV
 UqoW6qIn4WeuLZj8mT95wXikCrA2288VqgjpCBt3oDLCysYw10Fad6RCX 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sqBcha9xpTpXXzif6yuohIs5eZhuUSRFVkF2v+B11tY1bNGDxFkG3sQ9dF5sFtnwSNaTJgrtM7
 RVagCbUKM1q1xL0Qu1qjL6VpWkR0gdlyFHi1xpoWl2X6Hc4sjtcpeASzbAKUXM+wDM2PV6PLWf
 8/fAGgB+Ak9wWXx3Rydx1GKZgKAU1Sgmjk+WLPu0BRrVEI2D2iDMz1t0lx1XX6oCc78zopy5eV
 GXXmIKZzsgpZxZ6pexs4SEqc4mA+mZEnpGRniUTYfglp51/0isdCsZ0XhSFFxxSjPC9eotWwU4
 iVk=
X-SBRS: 2.7
X-MesageID: 12402809
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,436,1574139600"; d="scan'208";a="12402809"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 13 Feb 2020 13:42:00 +0000
Message-ID: <20200213134200.638199-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH] automation: update debian:unstable-arm64v8
 to have python3-config
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEFybSBjb250YWluZXIgd2Fzbid0IHVwZGF0ZWQgaW4gdGhlIG9yaWdpbmFsIHBhdGNoLgoK
Rml4ZXM6IDFhMzY3M2RhNjQ4MiAoImF1dG9tYXRpb246IHVwZGF0aW5nIGNvbnRhaW5lciB0byBo
YXZlIHB5dGhvbjMtY29uZmlnIGJpbmFyeSIpClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJE
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0tClBsZWFzZSB1cGRhdGUgdGhlIEFybSBj
b250YWluZXIsIGFzIEkgZG9uJ3QgaGF2ZSBhbiBlbnZpcm9ubWVudCB0byBkbwppdC4KClRoZXJl
IHdlcmUgdGFsayBhYm91dCByZW1vdmluZyBiaW44NiBhbmQgbmFzbSBwYWNrYWdlcyB0aGF0IGFy
ZQpwcm9iYWJseSBub3QgbmVlZGVkLCBidXQgSSBoYXZlbid0IGRvbmUgc28gaW4gdGhpcyBwYXRj
aC4KLS0tCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi91bnN0YWJsZS1hcm02NHY4LmRvY2tlcmZp
bGUgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2F1
dG9tYXRpb24vYnVpbGQvZGViaWFuL3Vuc3RhYmxlLWFybTY0djguZG9ja2VyZmlsZSBiL2F1dG9t
YXRpb24vYnVpbGQvZGViaWFuL3Vuc3RhYmxlLWFybTY0djguZG9ja2VyZmlsZQppbmRleCBjNzAx
Nzc3YzhkNTcuLjg0NTVkNjdiNzI4OSAxMDA2NDQKLS0tIGEvYXV0b21hdGlvbi9idWlsZC9kZWJp
YW4vdW5zdGFibGUtYXJtNjR2OC5kb2NrZXJmaWxlCisrKyBiL2F1dG9tYXRpb24vYnVpbGQvZGVi
aWFuL3Vuc3RhYmxlLWFybTY0djguZG9ja2VyZmlsZQpAQCAtMTYsNiArMTYsNyBAQCBSVU4gYXB0
LWdldCB1cGRhdGUgJiYgXAogICAgICAgICBsaWJuY3Vyc2VzNS1kZXYgXAogICAgICAgICBsaWJz
c2wtZGV2IFwKICAgICAgICAgcHl0aG9uLWRldiBcCisgICAgICAgIHB5dGhvbjMtZGV2IFwKICAg
ICAgICAgeG9yZy1kZXYgXAogICAgICAgICB1dWlkLWRldiBcCiAgICAgICAgIGxpYnlhamwtZGV2
IFwKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
