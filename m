Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708512E8AB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 17:25:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in3Dj-0001YW-Rl; Thu, 02 Jan 2020 16:21:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WNQ8=2X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1in3Dh-0001YQ-Te
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 16:21:09 +0000
X-Inumbo-ID: e0e25891-2d7b-11ea-a395-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0e25891-2d7b-11ea-a395-12813bfff9fa;
 Thu, 02 Jan 2020 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577982068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G59bT/s2bClMeMJZzj2TVitVDW258Qkl3HO2a9sKut4=;
 b=hkXew3ylcxjTgfDXhrQ98WYfn/YwRiNBB2Dez6BzTd+1oPoyK7gvYOQK
 I5asozo63rRXtPS7m+Dwe5VbYJJRUpdrjxGqkJaMUAV2AiN/A3Fb5/5qm
 qhl/Jv8PgyCSU0c7QMZ6RD7iTxnsROnGd/j1On+pK5mHn2pamxu9+jqub M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bXhkKghN4svx7E3CvagAj7xTYOFhYMkN6gJQy8oqCqQhRdMKYyK6pYVOEid6ajoMWXGXjx9tcS
 VGOqDuvyPgbjQcth3wBjNTMInC+jNDwTZRqz6LJeagipXTrLLfYsdSFeSzY9W/d/hmvgrvmDEo
 OSJAnkPREz2Jbm1joID/aXbJTJGUpLoIC1O0FCaJ3I1SlxIE3crjzHiH2m4WnvTNR2O3ZsNBNi
 QDX435z86pnfNp80ql9KBfaLaFGkl4X3foDdnCpTNnBUunZIXdjihSnU0rpMHqm/WoWwDHLpBc
 kGw=
X-SBRS: 2.7
X-MesageID: 10974217
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10974217"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 2 Jan 2020 16:21:04 +0000
Message-ID: <20200102162104.5102-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/trampoline: Drop stale comment
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

VGhpcyBvdWdodCB0byBoYXZlIGRpc2FwcGVhcmVkIGluIGMvcyA2MDY4NTA4OWNiMAoKU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2Fy
Y2gveDg2L2Jvb3QveDg2XzY0LlMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyBiL3hlbi9hcmNoL3g4
Ni9ib290L3g4Nl82NC5TCmluZGV4IDY0YTA0YTY1YTUuLmVjNzI1MTg0M2QgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82
NC5TCkBAIC0zNiw4ICszNiw2IEBAIEVOVFJZKF9faGlnaF9zdGFydCkKICAgICAgICAgY2FsbCAg
ICBfX3N0YXJ0X3hlbgogICAgICAgICBCVUcgICAgIC8qIF9fc3RhcnRfeGVuKCkgc2hvdWxkbid0
IHJldHVybi4gKi8KIAotLyoqKiBERVNDUklQVE9SIFRBQkxFUyAqKiovCi0KICAgICAgICAgLmRh
dGEKICAgICAgICAgLmFsaWduIDgKIG11bHRpYm9vdF9wdHI6Ci0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
