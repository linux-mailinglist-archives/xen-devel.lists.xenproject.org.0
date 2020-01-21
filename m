Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35100143FD2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 15:42:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itufQ-0003Xg-5I; Tue, 21 Jan 2020 14:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=li9x=3K=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1itufO-0003Xb-Hq
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 14:38:06 +0000
X-Inumbo-ID: 9cdc9c3e-3c5b-11ea-aecd-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9cdc9c3e-3c5b-11ea-aecd-bc764e2007e4;
 Tue, 21 Jan 2020 14:37:57 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 09:39:26 -0500
Message-ID: <20200121143926.125116-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_10_69
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH] xen/arm: Implement GICD_IGRPMODR as RAZ/WI for
 VGICv3
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

VGhlIFZHSUN2MyBtb2R1bGUgZG9lcyBub3QgaW1wbGVtZW50IHNlY3VyaXR5IGV4dGVuc2lvbnMg
Zm9yIGd1ZXN0cy4KRnVydGhlcm1vcmUsIHBlciB0aGUgQVJNIEdlbmVyaWMgSW50ZXJydXB0IENv
bnRyb2xsZXIgQXJjaGl0ZWN0dXJlClNwZWNpZmljYXRpb24gKEFSTSBJSEkgMDA2OUUpLCBzZWN0
aW9uIDkuOS4xNSwgdGhlIEdJQ0RfSUdSUE1PRFIKcmVnaXN0ZXIgc2hvdWxkIGJlIFJBWi9XSSB0
byBub24tc2VjdXJlIGFjY2Vzc2VzIHdoZW4gR0lDRF9DVExSLkRTID0gMC4KVGhpcyBpbXBsZW1l
bnRzIHRoZSBHSUNEX0lHUlBNT0RSIHJlZ2lzdGVyIGZvciBndWVzdCBWTXMgYXMgUkFaL1dJLCB0
bwphdm9pZCBhIGRhdGEgYWJvcnQgaW4gdGhlIGNhc2UgdGhlIGd1ZXN0IGF0dGVtcHRzIHRvIHJl
YWQgb3Igd3JpdGUgdGhlCnJlZ2lzdGVyLgoKU2lnbmVkLW9mZi1ieTogSmVmZiBLdWJhc2NpayA8
amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3ZnaWMtdjMu
YyAgICAgICAgICAgIHwgOCArKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLWFybS9naWNfdjNfZGVm
cy5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKaW5kZXgg
NDIyYjk0ZjkwMi4uYzQzMDVkMjVlMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMu
YworKysgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jCkBAIC0xMTkzLDYgKzExOTMsMTAgQEAgc3Rh
dGljIGludCB2Z2ljX3YzX2Rpc3RyX21taW9fcmVhZChzdHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZv
X3QgKmluZm8sCiAgICAgICAgICAqLwogICAgICAgICByZXR1cm4gX192Z2ljX3YzX2Rpc3RyX2Nv
bW1vbl9tbWlvX3JlYWQoInZHSUNEIiwgdiwgaW5mbywgZ2ljZF9yZWcsIHIpOwogCisgICAgY2Fz
ZSBWUkFOR0UzMihHSUNEX0lHUlBNT0RSLCBHSUNEX0lHUlBNT0RSTik6CisgICAgICAgIC8qIFdl
IGRvIG5vdCBpbXBsZW1lbnQgc2VjdXJpdHkgZXh0ZW5zaW9ucyBmb3IgZ3Vlc3RzLCByZWFkIHpl
cm8gKi8KKyAgICAgICAgZ290byByZWFkX2FzX3plcm9fMzI7CisKICAgICBjYXNlIFZSQU5HRTMy
KEdJQ0RfTlNBQ1IsIEdJQ0RfTlNBQ1JOKToKICAgICAgICAgLyogV2UgZG8gbm90IGltcGxlbWVu
dCBzZWN1cml0eSBleHRlbnNpb25zIGZvciBndWVzdHMsIHJlYWQgemVybyAqLwogICAgICAgICBn
b3RvIHJlYWRfYXNfemVyb18zMjsKQEAgLTEzNzksNiArMTM4MywxMCBAQCBzdGF0aWMgaW50IHZn
aWNfdjNfZGlzdHJfbW1pb193cml0ZShzdHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8s
CiAgICAgICAgIHJldHVybiBfX3ZnaWNfdjNfZGlzdHJfY29tbW9uX21taW9fd3JpdGUoInZHSUNE
IiwgdiwgaW5mbywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnaWNkX3JlZywgcik7CiAKKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUdSUE1PRFIsIEdJ
Q0RfSUdSUE1PRFJOKToKKyAgICAgICAgLyogV2UgZG8gbm90IGltcGxlbWVudCBzZWN1cml0eSBl
eHRlbnNpb25zIGZvciBndWVzdHMsIHdyaXRlIGlnbm9yZSAqLworICAgICAgICBnb3RvIHdyaXRl
X2lnbm9yZV8zMjsKKwogICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9OU0FDUiwgR0lDRF9OU0FDUk4p
OgogICAgICAgICAvKiBXZSBkbyBub3QgaW1wbGVtZW50IHNlY3VyaXR5IGV4dGVuc2lvbnMgZm9y
IGd1ZXN0cywgd3JpdGUgaWdub3JlICovCiAgICAgICAgIGdvdG8gd3JpdGVfaWdub3JlXzMyOwpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9naWNfdjNfZGVmcy5oIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9naWNfdjNfZGVmcy5oCmluZGV4IDVhNTc4ZTdjMTEuLjQyYzFiMzQ2NWMgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljX3YzX2RlZnMuaAorKysgYi94ZW4vaW5j
bHVkZS9hc20tYXJtL2dpY192M19kZWZzLmgKQEAgLTMwLDYgKzMwLDggQEAKICNkZWZpbmUgR0lD
RF9DTFJTUElfTlNSICAgICAgICAgICAgICAoMHgwNDgpCiAjZGVmaW5lIEdJQ0RfU0VUU1BJX1NS
ICAgICAgICAgICAgICAgKDB4MDUwKQogI2RlZmluZSBHSUNEX0NMUlNQSV9TUiAgICAgICAgICAg
ICAgICgweDA1OCkKKyNkZWZpbmUgR0lDRF9JR1JQTU9EUiAgICAgICAgICAgICAgICAoMHhEMDAp
CisjZGVmaW5lIEdJQ0RfSUdSUE1PRFJOICAgICAgICAgICAgICAgKDB4RDdDKQogI2RlZmluZSBH
SUNEX0lST1VURVIgICAgICAgICAgICAgICAgICgweDYwMDApCiAjZGVmaW5lIEdJQ0RfSVJPVVRF
UjMyICAgICAgICAgICAgICAgKDB4NjEwMCkKICNkZWZpbmUgR0lDRF9JUk9VVEVSMTAxOSAgICAg
ICAgICAgICAoMHg3RkQ4KQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
