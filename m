Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D7819E6
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 14:46:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hucKX-0000bx-8d; Mon, 05 Aug 2019 12:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VNZ=WB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hucKW-0000bf-56
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 12:43:12 +0000
X-Inumbo-ID: 92c76bfa-b77e-11e9-b10e-ebcefecdaf85
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92c76bfa-b77e-11e9-b10e-ebcefecdaf85;
 Mon, 05 Aug 2019 12:43:07 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: thI0nk3aE+pepOXHNB3/TTVCXu2WO1oR8LtCldt4N+pULzhd+Adqk4MncBMf6RC/uMrW0qSXSZ
 hHz4V0tbbi70OtnH5Z3JHJqwf6G1ehvkQUpKuf/2FF+l3nBGwQbBC9n/b2OrYQT4DvTmfDSpiT
 4XK5JcYr7dX4XLLGmwY7I7gSPfx4glZTLq9vocywAq3C6TYUpXpEp0S+XugS0SxnVMM/VajI+Z
 nU5JwIGB6Sg3pbZ2ENMatrcr8agPShdsL4ATz4RavWACgi6BEgeGknC2GPeASswMCNJk7p2c0g
 mOM=
X-SBRS: 2.7
X-MesageID: 3859932
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,349,1559534400"; 
   d="scan'208";a="3859932"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 5 Aug 2019 13:42:58 +0100
Message-ID: <20190805124301.12887-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805124301.12887-1-andrew.cooper3@citrix.com>
References: <20190805124301.12887-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] x86/asm: Include msr-index.h rather than
 msr.h
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

VGhlcmUgaXMgbm90aGluZyBpbnRlcmVzdGluZyBmb3IgYXNzZW1ibHkgY29kZSBpbiBtc3IuaAoK
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgICAgICAgIHwgMiArLQogeGVuL2FyY2gveDg2L3g4
Nl82NC9rZXhlY19yZWxvYy5TIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5T
IGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCmluZGV4IGQ3OGJlZDM5NGEuLmFiMmQ1MmE3OWQg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUworKysgYi94ZW4vYXJjaC94ODYv
Ym9vdC9oZWFkLlMKQEAgLTYsNyArNiw3IEBACiAjaW5jbHVkZSA8YXNtL2ZpeG1hcC5oPgogI2lu
Y2x1ZGUgPGFzbS9wYWdlLmg+CiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgotI2luY2x1ZGUg
PGFzbS9tc3IuaD4KKyNpbmNsdWRlIDxhc20vbXNyLWluZGV4Lmg+CiAjaW5jbHVkZSA8YXNtL2Nw
dWZlYXR1cmUuaD4KICNpbmNsdWRlIDxwdWJsaWMvZWxmbm90ZS5oPgogCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYveDg2XzY0L2tleGVjX3JlbG9jLlMgYi94ZW4vYXJjaC94ODYveDg2XzY0L2tl
eGVjX3JlbG9jLlMKaW5kZXggNGQ1MjdkYmZjZS4uNWJmNjFkNWMyZCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L3g4Nl82NC9rZXhlY19yZWxvYy5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQv
a2V4ZWNfcmVsb2MuUwpAQCAtMTYsNyArMTYsNyBAQAogI2luY2x1ZGUgPHhlbi9raW1hZ2UuaD4K
IAogI2luY2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KLSNpbmNsdWRlIDxhc20vbXNyLmg+CisjaW5j
bHVkZSA8YXNtL21zci1pbmRleC5oPgogI2luY2x1ZGUgPGFzbS9wYWdlLmg+CiAjaW5jbHVkZSA8
YXNtL21hY2hpbmVfa2V4ZWMuaD4KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
