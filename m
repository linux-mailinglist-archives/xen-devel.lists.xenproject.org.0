Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F73C3C5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 08:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haZrk-0000DY-Pd; Tue, 11 Jun 2019 06:02:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tchP=UK=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1haZrj-0000DT-Lk
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 06:02:39 +0000
X-Inumbo-ID: 82ad88bb-8c0e-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 82ad88bb-8c0e-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 06:02:37 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Tue, 11 Jun 2019 13:59:26 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 11 Jun 2019 14:02:29 +0800
Message-ID: <1560232949-10673-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen/coverage: wrap coverage related things
 under 'CONFIG_COVERAGE'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Baodong Chen <chenbaodong@mxnavi.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29uc3RydWN0b3JzIGJldHdlZW4gJ19fY3RvcnNfc3RhcnQnIGFuZCAnX19jdG9yc19lbmQnIG9u
bHkgdXNlZApmb3IgY29kZS1jb3ZlcmFnZSwgbm90IGJ5IHhlbiBpdHNlbGYsIHNvIHVzZSAnQ09O
RklHX0NPVkVSQUdFJyB3cmFwIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNo
ZW5iYW9kb25nQG14bmF2aS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyB8IDIgKysK
IHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgfCAyICsrCiB4ZW4vY29tbW9uL2xpYi5jICAgICAgIHwg
NSArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwppbmRleCAxZTcy
OTA2Li4zMjBmZjY4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCisrKyBiL3hl
bi9hcmNoL2FybS94ZW4ubGRzLlMKQEAgLTE3MiwxMiArMTcyLDE0IEBAIFNFQ1RJT05TCiAgICAg
ICAgKiguaW5pdC5kYXRhLnJlbCkKICAgICAgICAqKC5pbml0LmRhdGEucmVsLiopCiAKKyNpZiBk
ZWZpbmVkKENPTkZJR19DT1ZFUkFHRSkKICAgICAgICAuID0gQUxJR04oOCk7CiAgICAgICAgX19j
dG9yc19zdGFydCA9IC47CiAgICAgICAgKiguY3RvcnMpCiAgICAgICAgKiguaW5pdF9hcnJheSkK
ICAgICAgICAqKFNPUlQoLmluaXRfYXJyYXkuKikpCiAgICAgICAgX19jdG9yc19lbmQgPSAuOwor
I2VuZGlmCiAKICNpZiBkZWZpbmVkKENPTkZJR19IQVNfVlBDSSkgJiYgIWRlZmluZWQoQ09ORklH
X0xBVEVfSFdET00pCiAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOwpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKaW5kZXgg
Y2I0MmRjOC4uNjA0MzUzZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUworKysg
Yi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCkBAIC0yNDAsMTIgKzI0MCwxNCBAQCBTRUNUSU9OUwog
ICAgICAgICAqKC5hbHRpbnN0cnVjdGlvbnMpCiAgICAgICAgIF9fYWx0X2luc3RydWN0aW9uc19l
bmQgPSAuOwogCisjaWYgZGVmaW5lZChDT05GSUdfQ09WRVJBR0UpCiAgICAgICAgLiA9IEFMSUdO
KDgpOwogICAgICAgIF9fY3RvcnNfc3RhcnQgPSAuOwogICAgICAgICooLmN0b3JzKQogICAgICAg
ICooLmluaXRfYXJyYXkpCiAgICAgICAgKihTT1JUKC5pbml0X2FycmF5LiopKQogICAgICAgIF9f
Y3RvcnNfZW5kID0gLjsKKyNlbmRpZgogCiAjaWYgZGVmaW5lZChDT05GSUdfSEFTX1ZQQ0kpICYm
ICFkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQogICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FM
SUdOKTsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbGliLmMgYi94ZW4vY29tbW9uL2xpYi5jCmlu
ZGV4IDhlYmVjODEuLmI4ZmMxNjUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vbGliLmMKKysrIGIv
eGVuL2NvbW1vbi9saWIuYwpAQCAtNDkxLDE1ICs0OTEsMjAgQEAgdW5zaWduZWQgbG9uZyBsb25n
IHBhcnNlX3NpemVfYW5kX3VuaXQoY29uc3QgY2hhciAqcywgY29uc3QgY2hhciAqKnBzKQogICAg
IHJldHVybiByZXQ7CiB9CiAKKyNpZiBkZWZpbmVkKENPTkZJR19DT1ZFUkFHRSkKIHR5cGVkZWYg
dm9pZCAoKmN0b3JfZnVuY190KSh2b2lkKTsKIGV4dGVybiBjb25zdCBjdG9yX2Z1bmNfdCBfX2N0
b3JzX3N0YXJ0W10sIF9fY3RvcnNfZW5kW107CisjZW5kaWYKIAorLyogc2VlICdkb2NzL2h5cGVy
dmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QnICovCiB2b2lkIF9faW5pdCBpbml0X2NvbnN0
cnVjdG9ycyh2b2lkKQogeworI2lmIGRlZmluZWQoQ09ORklHX0NPVkVSQUdFKQogICAgIGNvbnN0
IGN0b3JfZnVuY190ICpmOwogICAgIGZvciAoIGYgPSBfX2N0b3JzX3N0YXJ0OyBmIDwgX19jdG9y
c19lbmQ7ICsrZiApCiAgICAgICAgICgqZikoKTsKIAorI2VuZGlmCiAgICAgLyogUHV0dGluZyB0
aGlzIGhlcmUgc2VlbXMgYXMgZ29vZCAob3IgYmFkKSBhcyBhbnkgb3RoZXIgcGxhY2UuICovCiAg
ICAgQlVJTERfQlVHX09OKHNpemVvZihzaXplX3QpICE9IHNpemVvZihzc2l6ZV90KSk7CiB9Ci0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
