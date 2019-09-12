Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C77B147F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 20:35:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Tss-0001Gu-C4; Thu, 12 Sep 2019 18:31:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SE6f=XH=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i8Tsr-0001Gp-6R
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 18:31:57 +0000
X-Inumbo-ID: 9920b9f4-d58b-11e9-95a3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9920b9f4-d58b-11e9-95a3-12813bfff9fa;
 Thu, 12 Sep 2019 18:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568313117;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=QsmWD8PSnspupJVf6MZ4cYzKMM/9pg8rauF0BOWjV+Q=;
 b=ggZiiTroFaCk+w72oS3T4sN0rYKfesrWzJFe9ur+ofKGWYRbeX4XPesX
 2BY3SWgcQsMfjP52Cz2GWIXwXO2crwmGzkMKtLAdS0jggigGfYwo2eQx5
 /poGZqOsNnwifaq72YhT4r3s57ufU1gU3ZzED/nF5NuWPT/FmdA5gUtul Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vyFn2YGzrF12PmyQmb3fO0TiOJTIiZV85vHIiOfuWOEobyx2em/gJnpGBZ212ZJWa+ilwnk5sA
 gE1+NP0NfSlzda9Y82we2igs+/m6zaYqGEKGsHb1SeH8ZyP5Pu9lWhuQjKePkc4OaQ1qivua9D
 6HB2KGlM63h4LeBOkI7Ymb4z130ACkvZTcgvWUKMZp1M1Cjee7wnZ3LjYy0u7cPV8onpbSjnCK
 SrCm7T/c+GXfeisyoG2CofO5wPNA5qtgxKX/2vAd24sSGZiPIHJ7ahZiZtc1fKxean4+Zj9kCp
 LPg=
X-SBRS: 2.7
X-MesageID: 5500270
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,498,1559534400"; 
   d="scan'208";a="5500270"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 12 Sep 2019 19:31:51 +0100
Message-ID: <1568313111-14726-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/pci: reserve MCFG areas earlier
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgTUNGRyBhcmVhIGlzIG5vdCByZXNlcnZlZCBpbiBFODIwLCBYZW4gYnkgZGVmYXVsdCB3aWxs
IGRlZmVyIGl0cyB1c2FnZQp1bnRpbCBEb20wIHJlZ2lzdGVycyBpdCBleHBsaWNpdGx5IGFmdGVy
IEFDUEkgcGFyc2VyIHJlY29nbml6ZXMgaXQgYXMKYSByZXNlcnZlZCByZXNvdXJjZSBpbiBEU0RU
LiBIYXZpbmcgaXQgcmVzZXJ2ZWQgaW4gRTgyMCBpcyBub3QKbWFuZGF0b3J5IGFjY29yZGluZyB0
byAiUENJIEZpcm13YXJlIFNwZWNpZmljYXRpb24sIHJldiAzLjIiIChwYXIuIDQuMS4yKQphbmQg
ZmlybXdhcmUgaXMgZnJlZSB0byBrZWVwIGEgaG9sZSBpbiBFODIwIGluIHRoYXQgcGxhY2UuIFhl
biBkb2Vzbid0IGtub3cKd2hhdCBleGFjdGx5IGlzIGluc2lkZSB0aGlzIGhvbGUgc2luY2UgaXQg
bGFja3MgZnVsbCBBQ1BJIHZpZXcgb2YgdGhlCnBsYXRmb3JtIHRoZXJlZm9yZSBpdCdzIHBvdGVu
dGlhbGx5IGhhcm1mdWwgdG8gYWNjZXNzIE1DRkcgcmVnaW9uCndpdGhvdXQgYWRkaXRpb25hbCBj
aGVja3MgYXMgc29tZSBtYWNoaW5lcyBhcmUga25vd24gdG8gcHJvdmlkZQppbmNvbnNpc3RlbnQg
aW5mb3JtYXRpb24gb24gdGhlIHNpemUgb2YgdGhlIHJlZ2lvbi4KCk5vdyB4ZW5fbWNmZ19sYXRl
KCkgcnVucyBhZnRlciBhY3BpX2luaXQoKSB3aGljaCBpcyB0b28gbGF0ZSBhcyBzb21lIGJhc2lj
ClBDSSBlbnVtZXJhdGlvbiBzdGFydHMgZXhhY3RseSB0aGVyZSBhcyB3ZWxsLiBUcnlpbmcgdG8g
cmVnaXN0ZXIgYSBkZXZpY2UKcHJpb3IgdG8gTUNGRyByZXNlcnZhdGlvbiBjYXVzZXMgbXVsdGlw
bGUgcHJvYmxlbXMgd2l0aCBQQ0llIGV4dGVuZGVkCmNhcGFiaWxpdHkgaW5pdGlhbGl6YXRpb25z
IGluIFhlbiAoZS5nLiBTUi1JT1YgVkYgQkFSIHNpemluZykuIFRoZXJlIGFyZQpubyBjb252ZW5p
ZW50IGhvb2tzIGZvciB1cyB0byBzdWJzY3JpYmUgdG8gc28gcmVnaXN0ZXIgTUNGRyBhcmVhcyBl
YXJsaWVyCnVwb24gdGhlIGZpcnN0IGludm9jYXRpb24gb2YgeGVuX2FkZF9kZXZpY2UoKS4gSXQg
c2hvdWxkIGJlIHNhZmUgdG8gZG8gb25jZQpzaW5jZSBhbGwgdGhlIGJvb3QgdGltZSBidXNlcyBt
dXN0IGhhdmUgdGhlaXIgTUNGRyBhcmVhcyBpbiBNQ0ZHIHRhYmxlCmFscmVhZHkgYW5kIHdlIGRv
bid0IHN1cHBvcnQgUENJIGJ1cyBob3QtcGx1Zy4KClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhp
bmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KIGRyaXZlcnMveGVuL3BjaS5jIHwg
MjEgKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9wY2kuYyBiL2RyaXZl
cnMveGVuL3BjaS5jCmluZGV4IDc0OTRkYmUuLmRiNThhYWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
eGVuL3BjaS5jCisrKyBiL2RyaXZlcnMveGVuL3BjaS5jCkBAIC0yOSw2ICsyOSw4IEBACiAjaW5j
bHVkZSAiLi4vcGNpL3BjaS5oIgogI2lmZGVmIENPTkZJR19QQ0lfTU1DT05GSUcKICNpbmNsdWRl
IDxhc20vcGNpX3g4Ni5oPgorCitzdGF0aWMgaW50IHhlbl9tY2ZnX2xhdGUodm9pZCk7CiAjZW5k
aWYKIAogc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBwY2lfc2VnX3N1cHBvcnRlZCA9IHRydWU7
CkBAIC00MCw3ICs0MiwxOCBAQCBzdGF0aWMgaW50IHhlbl9hZGRfZGV2aWNlKHN0cnVjdCBkZXZp
Y2UgKmRldikKICNpZmRlZiBDT05GSUdfUENJX0lPVgogCXN0cnVjdCBwY2lfZGV2ICpwaHlzZm4g
PSBwY2lfZGV2LT5waHlzZm47CiAjZW5kaWYKLQorI2lmZGVmIENPTkZJR19QQ0lfTU1DT05GSUcK
KwlzdGF0aWMgYm9vbCBwY2lfbWNmZ19yZXNlcnZlZCA9IGZhbHNlOworCS8qCisJICogUmVzZXJ2
ZSBNQ0ZHIGFyZWFzIGluIFhlbiBvbiBmaXJzdCBpbnZvY2F0aW9uIGR1ZSB0byB0aGlzIGJlaW5n
CisJICogcG90ZW50aWFsbHkgY2FsbGVkIGZyb20gaW5zaWRlIG9mIGFjcGlfaW5pdCBpbW1lZGlh
dGVseSBhZnRlcgorCSAqIE1DRkcgdGFibGUgaGFzIGJlZW4gZmluYWxseSBwYXJzZWQuCisJICov
CisJaWYgKCFwY2lfbWNmZ19yZXNlcnZlZCkgeworCQl4ZW5fbWNmZ19sYXRlKCk7CisJCXBjaV9t
Y2ZnX3Jlc2VydmVkID0gdHJ1ZTsKKwl9CisjZW5kaWYKIAlpZiAocGNpX3NlZ19zdXBwb3J0ZWQp
IHsKIAkJc3RydWN0IHsKIAkJCXN0cnVjdCBwaHlzZGV2X3BjaV9kZXZpY2VfYWRkIGFkZDsKQEAg
LTIxMyw3ICsyMjYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCByZWdpc3Rlcl94ZW5fcGNpX25vdGlm
aWVyKHZvaWQpCiBhcmNoX2luaXRjYWxsKHJlZ2lzdGVyX3hlbl9wY2lfbm90aWZpZXIpOwogCiAj
aWZkZWYgQ09ORklHX1BDSV9NTUNPTkZJRwotc3RhdGljIGludCBfX2luaXQgeGVuX21jZmdfbGF0
ZSh2b2lkKQorc3RhdGljIGludCB4ZW5fbWNmZ19sYXRlKHZvaWQpCiB7CiAJc3RydWN0IHBjaV9t
bWNmZ19yZWdpb24gKmNmZzsKIAlpbnQgcmM7CkBAIC0yNTIsOCArMjY1LDQgQEAgc3RhdGljIGlu
dCBfX2luaXQgeGVuX21jZmdfbGF0ZSh2b2lkKQogCX0KIAlyZXR1cm4gMDsKIH0KLS8qCi0gKiBO
ZWVkcyB0byBiZSBkb25lIGFmdGVyIGFjcGlfaW5pdCB3aGljaCBhcmUgc3Vic3lzX2luaXRjYWxs
LgotICovCi1zdWJzeXNfaW5pdGNhbGxfc3luYyh4ZW5fbWNmZ19sYXRlKTsKICNlbmRpZgotLSAK
Mi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
