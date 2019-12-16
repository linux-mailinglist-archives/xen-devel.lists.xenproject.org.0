Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB19120F47
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 17:23:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igt6S-0000uw-DH; Mon, 16 Dec 2019 16:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SuIK=2G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1igt6R-0000uq-GE
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 16:20:11 +0000
X-Inumbo-ID: edff7fe4-201f-11ea-93ce-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edff7fe4-201f-11ea-93ce-12813bfff9fa;
 Mon, 16 Dec 2019 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576513210;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=HBxs8UIf8Pud+IjotW2Neqws+22+wjfkoJoV876hFn8=;
 b=PwcX28t7/rL4QcINtniF6OEADXPfgr3B50rjfHamD1p/C/wKHKi7Oxzc
 OZemw82DWX8UcfcOiKwtNmRGOXj3oIhWlLHNS1uOcipzSLrh1T7PUOs+d
 O8U2cjNx9iWBDHgJi4jryn7B7ujwHwUjZpfi+LzX0Kf7nbi4+OY4o+JE0 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: blMCTRamy8ugChA5EGQ7GHCC5jnUFzi/6nC4UAqOXepCaF/USxXtkyGQb6nazgWkTlVDRwVJUq
 X12Yv4kDMnoeD3H2zDp6BbkEcACxCs4VcoaJYN/Wvaaf3YCs3/0SW5OJuDtPsX9kTzq+5LvuF3
 G5TI4M1bFwkadAuPRRjq40ywTj4I3AvIJKutInrXcHHj3xgJLxbRlAl35AtSpVsMPJrX22pPdo
 VmyGbYNKSdcgmUtS2W7gEYYxUUnuSzapgQIQKCcOtGh81/ozQXDz8YF1akQEdnulr+HEnFT11r
 yig=
X-SBRS: 2.7
X-MesageID: 9729309
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,322,1571716800"; 
   d="scan'208";a="9729309"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 16 Dec 2019 16:20:06 +0000
Message-ID: <20191216162006.15260-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/mm: Simplify promote_l4_table()'s exit
 semantics
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cHJvbW90ZV9sNF90YWJsZSgpIGlzIGRpZmZlcmVudCBmcm9tIGl0cyBsb3dlciBsZXZlbCBoZWxw
ZXJzLCBieSBoYXZpbmcgYW4KZXh0cmEgcmV0dXJuIHBhdGggb3V0IG9mIHRoZSBtaWRkbGUgb2Yg
dGhlIGxvb3AgaW4gdGhlIGNhc2Ugb2YgYSBmYWlsdXJlLgoKQnJlYWsgZnJvbSB0aGUgbG9vcCwg
d2hpY2ggaXMgY29uc2lzdGVudCB3aXRoIHRoZSBvdGhlciBoZWxwZXJzLCBhbmQKZnVuY3Rpb25h
bGx5IGVxdWl2YWxlbnQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4K
Q0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KLS0tCiB4ZW4v
YXJjaC94ODYvbW0uYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNo
L3g4Ni9tbS5jCmluZGV4IGMxNGM2NzdhNjIuLjU5NGYxYmQyOTAgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC0xODU2LDEwICsxODU2LDcg
QEAgc3RhdGljIGludCBwcm9tb3RlX2w0X3RhYmxlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiAg
ICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICAgICAgaWYgKCByYyA8IDAgKQotICAgICAgICB7
Ci0gICAgICAgICAgICB1bm1hcF9kb21haW5fcGFnZShwbDRlKTsKLSAgICAgICAgICAgIHJldHVy
biByYzsKLSAgICAgICAgfQorICAgICAgICAgICAgYnJlYWs7CiAKICAgICAgICAgcGw0ZVtpXSA9
IGFkanVzdF9ndWVzdF9sNGUobDRlLCBkKTsKICAgICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
