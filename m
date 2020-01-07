Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC661325EA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:17:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ionmE-0006eM-Ds; Tue, 07 Jan 2020 12:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cF2B=24=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ionmC-0006eH-P9
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:16:00 +0000
X-Inumbo-ID: 76f578c0-3147-11ea-abed-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76f578c0-3147-11ea-abed-12813bfff9fa;
 Tue, 07 Jan 2020 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578399360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eNkmeQxisq9+kssii+wPXQkKEzPh6kc5Xp1VdqvdyMw=;
 b=SlttaywSvj0itOfoaA/Tm697k2cmJGg382yFz19PNmWmjoSd5XEqxWpK
 2VO8TG2sCU+NLkGri0tC7pDG/lHp7JGE8uB7J5TT7olFJxuS35rlGjRsU
 xcvNlg2gXUxktKTdr87Spdpcf6AjUjyQrpF+DoZ1apcnXF58UKr3gv0eO 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jdQdhq5yHLVgVDQ8e5wktuf6f7AXWRYBobQ/AgUiRq013B+/qE6Ze3RHerPSwjDLXHxodLN7am
 v2aFlQpw39f8fvTpW7Nzfl0gBnjDrSV4iSh2pGrDUlnh23gNTSb/c0c2n6k2vZ4Mz1Vedf830G
 htWjWu6AwWOxuoSNf1LfQ64Cc9HqlU4eKc2RjqABZBlP9Cb3JNZwsUR8wZMK6TKTU4F0YtRZcI
 cWaCGcaFr+xAi3AaUhHcpWqFC1c2NlZkeSHIlx3GALbzIRBC/vGd4b7WXqX9IoRs2eyEHHaqgo
 eU8=
X-SBRS: 2.7
X-MesageID: 10969977
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,406,1571716800"; d="scan'208";a="10969977"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 12:15:56 +0000
Message-ID: <20200107121556.13994-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/trampoline: boot_vid_mode doesn't need to
 be global
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QUZBSUNULCBpdCBoYXMgbmV2ZXIgaGFkIGFuIGV4dGVybmFsIHVzZXIgc2luY2UgaXRzIGludHJv
ZHVjdGlvbgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQogeGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5T
CmluZGV4IDgyNGY0NWVjMGYuLjZiNDAzYTZkMWEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9i
b290L3RyYW1wb2xpbmUuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKQEAg
LTI2MSw3ICsyNjEsNyBAQCBvcHRfZWRpZDoKICAgICAgICAgLmJ5dGUgICAwCiAKICNpZmRlZiBD
T05GSUdfVklERU8KLUdMT0JBTChib290X3ZpZF9tb2RlKQorYm9vdF92aWRfbW9kZToKICAgICAg
ICAgLndvcmQgICBWSURFT184MHgyNSAgICAgICAgICAgICAgICAgICAgIC8qIElmIHdlIGRvbid0
IHJ1biBhdCBhbGwsIGFzc3VtZSBiYXNpYyB2aWRlbyBtb2RlIDMgYXQgODB4MjUuICovCiB2ZXNh
X3NpemU6CiAgICAgICAgIC53b3JkICAgMCwwLDAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
KiB3aWR0aCB4IGRlcHRoIHggaGVpZ2h0ICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
