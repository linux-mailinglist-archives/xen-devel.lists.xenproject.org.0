Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50123131
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:21:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfN9-00084w-0F; Mon, 20 May 2019 10:18:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSfN7-00084a-3O
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:18:21 +0000
X-Inumbo-ID: 977aba84-7ae8-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 977aba84-7ae8-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 10:18:20 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: LKv5Zr2d4JflOrzLK105P6AbjiMap8a2SxIsNWKV8Kvevb77qalPy3K91Obvj4qnuSk1ZH3nbu
 /3NNQ9blhKRZAlcE3RR1He8wO54NcIaThuH/Gof1Gc28KPV5fbSWwvScSNPTGZD1UQN1rpviQK
 eYtYUT/UAKa3p9dKyzEk4HZZUT4IhxeqbjYcRtRZlVQDMomZfWm3JKWQdWx95JgxwhIajBMQr8
 zDDcwSkAkxbuO4+sbFowI2wF80RXYEGLhLjPVqm+rZx8BnTj7zwB4SKa/JhEj+7VKFkFh/oqUB
 wVo=
X-SBRS: 2.7
X-MesageID: 641031
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="641031"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 11:18:14 +0100
Message-ID: <1558347494-21640-5-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
References: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] x86/boot: Link opt_dom0_verbose to
 CONFIG_VERBOSE_DEBUG
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgY3VycmVudGx5IGhhdmUgYW4gYXN5bW1ldHJpYyBzZXR1cCB3aGVyZSBDT05GSUdfVkVSQk9T
RV9ERUJVRyBjb250cm9scwpleHRyYSBkaWFnbm9zdGljcyBmb3IgYSBQViBkb20wLCBhbmQgb3B0
X2RvbTBfdmVyYm9zZSBjb250cm9scyBleHRyYQpkaWFnbm9zdGljcyBmb3IgYSBQVkggZG9tMC4K
CkRlZmF1bHQgb3B0X2RvbTBfdmVyYm9zZSB0byBDT05GSUdfVkVSQk9TRV9ERUJVRyBhbmQgdXNl
IG9wdF9kb20wX3ZlcmJvc2UKY29uc2lzdGVudGx5LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jIHwgMyArKy0KIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAg
ICAgICB8IDIgKy0KIHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgICAgICB8IDcgKysrKy0t
LQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUucGFuZG9jCmluZGV4IGU2ZDI0MWUuLjUxZGM4YWUgMTAwNjQ0Ci0tLSBh
L2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYworKysgYi9kb2NzL21pc2MveGVuLWNv
bW1hbmQtbGluZS5wYW5kb2MKQEAgLTY4Nyw3ICs2ODcsOCBAQCBDb250cm9scyBmb3IgaG93IGRv
bTAgaXMgY29uc3RydWN0ZWQgb24geDg2IHN5c3RlbXMuCiAgICAgZ3Vlc3RzIGRvIG5vIHJlcXVp
cmUgYW55IHBhZ2luZyBzdXBwb3J0IGJ5IGRlZmF1bHQuCiAKICogICBUaGUgYHZlcmJvc2VgIGJv
b2xlYW4gaXMgaW50ZW5kZWQgZm9yIGRpYWdub3N0aWNzLCBhbmQgcHJpbnRzIG91dCBleHRyYQot
ICAgIGluZm9ybWF0aW9uIGR1cmluZyB0aGUgZG9tMCBidWlsZC4gIEl0IGRlZmF1bHRzIHRvIGZh
bHNlLgorICAgIGluZm9ybWF0aW9uIGR1cmluZyB0aGUgZG9tMCBidWlsZC4gIEl0IGRlZmF1bHRz
IHRvIHRoZSBjb21waWxlIHRpbWUgY2hvaWNlCisgICAgb2YgYENPTkZJR19WRVJCT1NFX0RFQlVH
YC4KIAogIyMjIGRvbTAtaW9tbXUKICAgICA9IExpc3Qgb2YgWyBwYXNzdGhyb3VnaD08Ym9vbD4s
IHN0cmljdD08Ym9vbD4sIG1hcC1pbmNsdXNpdmU9PGJvb2w+LApkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKaW5kZXggOTNl
NTUzMS4uOWIwNjM2MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYworKysg
Yi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCkBAIC0yODEsNyArMjgxLDcgQEAgc3RydWN0IHZj
cHUgKl9faW5pdCBhbGxvY19kb20wX3ZjcHUwKHN0cnVjdCBkb21haW4gKmRvbTApCiBib29sIF9f
aW5pdGRhdGEgb3B0X2RvbTBfc2hhZG93OwogI2VuZGlmCiBib29sIF9faW5pdGRhdGEgb3B0X2Rv
bTBfcHZoID0gIUlTX0VOQUJMRUQoQ09ORklHX1BWKTsKLWJvb2wgX19pbml0ZGF0YSBvcHRfZG9t
MF92ZXJib3NlOworYm9vbCBfX2luaXRkYXRhIG9wdF9kb20wX3ZlcmJvc2UgPSBJU19FTkFCTEVE
KENPTkZJR19WRVJCT1NFX0RFQlVHKTsKIAogc3RhdGljIGludCBfX2luaXQgcGFyc2VfZG9tMF9w
YXJhbShjb25zdCBjaGFyICpzKQogewpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBf
YnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKaW5kZXggNGExNTI2YS4uOTAz
NjExZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4v
YXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCkBAIC0zNDUsOSArMzQ1LDEwIEBAIGludCBfX2luaXQg
ZG9tMF9jb25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFpbiAqZCwKIAogICAgIGlmICggKHJjID0gZWxm
X2luaXQoJmVsZiwgaW1hZ2Vfc3RhcnQsIGltYWdlX2xlbikpICE9IDAgKQogICAgICAgICByZXR1
cm4gcmM7Ci0jaWZkZWYgQ09ORklHX1ZFUkJPU0VfREVCVUcKLSAgICBlbGZfc2V0X3ZlcmJvc2Uo
JmVsZik7Ci0jZW5kaWYKKworICAgIGlmICggb3B0X2RvbTBfdmVyYm9zZSApCisgICAgICAgIGVs
Zl9zZXRfdmVyYm9zZSgmZWxmKTsKKwogICAgIGVsZl9wYXJzZV9iaW5hcnkoJmVsZik7CiAgICAg
aWYgKCAocmMgPSBlbGZfeGVuX3BhcnNlKCZlbGYsICZwYXJtcykpICE9IDAgKQogICAgICAgICBn
b3RvIG91dDsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
