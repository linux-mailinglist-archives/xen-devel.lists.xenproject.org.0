Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA914F317
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 21:14:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixccy-0001pa-6c; Fri, 31 Jan 2020 20:10:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DGHf=3U=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1ixccx-0001pV-3D
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 20:10:55 +0000
X-Inumbo-ID: c812b78c-4465-11ea-b211-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c812b78c-4465-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 20:10:54 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 15:10:46 -0500
Message-ID: <20200131201046.44996-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_10_69
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v2] xen/arm: Handle unimplemented VGICv3 dist
 registers as RAZ/WI
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGVyIHRoZSBBUk0gR2VuZXJpYyBJbnRlcnJ1cHQgQ29udHJvbGxlciBBcmNoaXRlY3R1cmUgU3Bl
Y2lmaWNhdGlvbiAoQVJNCklISSAwMDY5RSksIHJlc2VydmVkIHJlZ2lzdGVycyBzaG91bGQgZ2Vu
ZXJhbGx5IGJlIHRyZWF0ZWQgYXMgUkFaL1dJLgpUbyBzaW1wbGlmeSB0aGUgVkdJQ3YzIGRlc2ln
biBhbmQgaW1wcm92ZSBndWVzdCBjb21wYXRhYmlsaXR5LCB0cmVhdCB0aGUKZGVmYXVsdCBjYXNl
IGZvciBHSUNEIHJlZ2lzdGVycyBhcyByZWFkX2FzX3plcm8vd3JpdGVfaWdub3JlLgoKU2lnbmVk
LW9mZi1ieTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+Ci0t
LQogeGVuL2FyY2gvYXJtL3ZnaWMtdjMuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3ZnaWMtdjMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKaW5kZXggNDIyYjk0Zjkw
Mi4uOGQwODU2YWMzMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYworKysgYi94
ZW4vYXJjaC9hcm0vdmdpYy12My5jCkBAIC0xMjUwLDkgKzEyNTAsOSBAQCBzdGF0aWMgaW50IHZn
aWNfdjNfZGlzdHJfbW1pb19yZWFkKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywK
ICAgICAgICAgIGdvdG8gcmVhZF9pbXBsX2RlZmluZWQ7CiAKICAgICBkZWZhdWx0OgotICAgICAg
ICBwcmludGsoWEVOTE9HX0dfRVJSICIlcHY6IHZHSUNEOiB1bmhhbmRsZWQgcmVhZCByJWQgb2Zm
c2V0ICUjMDh4XG4iLAotICAgICAgICAgICAgICAgdiwgZGFidC5yZWcsIGdpY2RfcmVnKTsKLSAg
ICAgICAgcmV0dXJuIDA7CisgICAgICAgIC8qIFNpbmNlIHJlc2VydmVkIHJlZ2lzdGVycyBzaG91
bGQgYmUgcmVhZC1hcy16ZXJvLCBtYWtlIHRoaXMgdGhlCisgICAgICAgICAqIGRlZmF1bHQgY2Fz
ZSAqLworICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsKICAgICB9CiAKIGJhZF93aWR0aDoKQEAg
LTE0MzUsMTAgKzE0MzUsOSBAQCBzdGF0aWMgaW50IHZnaWNfdjNfZGlzdHJfbW1pb193cml0ZShz
dHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8sCiAgICAgICAgICBnb3RvIHdyaXRlX2lt
cGxfZGVmaW5lZDsKIAogICAgIGRlZmF1bHQ6Ci0gICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIK
LSAgICAgICAgICAgICAgICIlcHY6IHZHSUNEOiB1bmhhbmRsZWQgd3JpdGUgciVkPSUiUFJJcmVn
aXN0ZXIiIG9mZnNldCAlIzA4eFxuIiwKLSAgICAgICAgICAgICAgIHYsIGRhYnQucmVnLCByLCBn
aWNkX3JlZyk7Ci0gICAgICAgIHJldHVybiAwOworICAgICAgICAvKiBTaW5jZSByZXNlcnZlZCBy
ZWdpc3RlcnMgc2hvdWxkIGJlIHdyaXRlLWlnbm9yZSwgbWFrZSB0aGlzIHRoZQorICAgICAgICAg
KiBkZWZhdWx0IGNhc2UgKi8KKyAgICAgICAgZ290byB3cml0ZV9pZ25vcmU7CiAgICAgfQogCiBi
YWRfd2lkdGg6Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
