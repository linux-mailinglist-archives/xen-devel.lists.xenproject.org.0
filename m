Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B707135A96
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 14:52:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipYBU-0003J8-CB; Thu, 09 Jan 2020 13:49:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3305=26=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipYBT-0003Ix-8i
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 13:49:11 +0000
X-Inumbo-ID: cb123d62-32e6-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb123d62-32e6-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 13:49:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55D8FAD78;
 Thu,  9 Jan 2020 13:48:28 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 Jan 2020 14:48:24 +0100
Message-Id: <20200109134825.31482-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200109134825.31482-1-jgross@suse.com>
References: <20200109134825.31482-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 1/2] xen: add config option to include
 failing condition in BUG_ON() message
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgYSB0cmlnZ2VyaW5nIEJVR19PTigpIHdpbGwgb25seSBwcmludCBzb3VyY2UgZmlsZSBh
bmQgbGluZQppbmZvcm1hdGlvbi4gQWRkIHRoZSBwb3NzaWJpbGl0eSB0byBwcmludCB0aGUgdHJp
Z2dlcmluZyBjb25kaXRpb24gbGlrZQpBU1NFUlQoKS4KCkRvIHRoYXQgYnkgaW50cm9kdWNpbmcg
QlVHX09OX1ZFUkJPU0UoKSBhbmQgYWRkIGEgS2NvbmZpZyBvcHRpb24gdG8KbWFrZSBCVUdfT04g
dXNlIEJVR19PTl9WRVJCT1NFKCkuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Ci0tLQogeGVuL0tjb25maWcuZGVidWcgICAgICAgICB8IDYgKysrKysrCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2J1Zy5oIHwgNSArKystLQogeGVuL2luY2x1ZGUveGVuL2xpYi5o
ICAgICB8IDUgKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vS2NvbmZpZy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRl
YnVnCmluZGV4IGIzNTExZTgxYTIuLmRmYmNhYzU3NWEgMTAwNjQ0Ci0tLSBhL3hlbi9LY29uZmln
LmRlYnVnCisrKyBiL3hlbi9LY29uZmlnLmRlYnVnCkBAIC04MSw2ICs4MSwxMiBAQCBjb25maWcg
UEVSRl9BUlJBWVMKIAktLS1oZWxwLS0tCiAJICBFbmFibGVzIHNvZnR3YXJlIHBlcmZvcm1hbmNl
IGNvdW50ZXIgYXJyYXkgaGlzdG9ncmFtcy4KIAorY29uZmlnIERFQlVHX0JVR1ZFUkJPU0UKKwli
b29sICJWZXJib3NlIEJVR19PTiBtZXNzYWdlcyIKKwlkZWZhdWx0IERFQlVHCisJLS0taGVscC0t
LQorCSAgSW4gY2FzZSBhIEJVR19PTiB0cmlnZ2VycyBhZGRpdGlvbmFsbHkgcHJpbnQgdGhlIHRy
aWdnZXJpbmcKKwkgIGNvbmRpdGlvbiBvbiB0aGUgY29uc29sZS4KIAogY29uZmlnIFZFUkJPU0Vf
REVCVUcKIAlib29sICJWZXJib3NlIGRlYnVnIG1lc3NhZ2VzIgpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9idWcuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYnVnLmgKaW5kZXggOWJi
NGExOTQyMC4uNDZkMjgyNzc3ZiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9idWcu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2J1Zy5oCkBAIC02MCwxMCArNjAsMTEgQEAgc3Ry
dWN0IGJ1Z19mcmFtZSB7CiAKIAogI2RlZmluZSBXQVJOKCkgQlVHX0ZSQU1FKEJVR0ZSQU1FX3dh
cm4sIF9fTElORV9fLCBfX0ZJTEVfXywgMCwgTlVMTCkKLSNkZWZpbmUgQlVHKCkgZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgQlVHX0ZSQU1F
KEJVR0ZSQU1FX2J1ZywgIF9fTElORV9fLCBfX0ZJTEVfXywgMCwgTlVMTCk7ICAgICAgXAorI2Rl
ZmluZSBCVUdfVkVSQk9TRShtc2cpIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKKyAgICBCVUdfRlJBTUUoQlVHRlJBTUVfYnVnLCAgX19MSU5FX18sIF9fRklMRV9fLCAw
LCBtc2cpOyAgICAgICBcCiAgICAgdW5yZWFjaGFibGUoKTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogfSB3aGlsZSAoMCkKKyNkZWZpbmUgQlVHKCkgQlVH
X1ZFUkJPU0UoTlVMTCkKIAogI2RlZmluZSBydW5faW5fZXhjZXB0aW9uX2hhbmRsZXIoZm4pIEJV
R19GUkFNRShCVUdGUkFNRV9ydW5fZm4sIDAsIGZuLCAwLCBOVUxMKQogCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vbGliLmggYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKaW5kZXggOGZiZTg0
MDMyZC4uZTc3NzBiMGQyNCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi5oCisrKyBi
L3hlbi9pbmNsdWRlL3hlbi9saWIuaApAQCAtOCw3ICs4LDEyIEBACiAjaW5jbHVkZSA8eGVuL3N0
cmluZy5oPgogI2luY2x1ZGUgPGFzbS9idWcuaD4KIAorI2RlZmluZSBCVUdfT05fVkVSQk9TRShw
KSBkbyB7IGlmICh1bmxpa2VseShwKSkgQlVHX1ZFUkJPU0UoI3ApOyAgfSB3aGlsZSAoMCkKKyNp
ZmRlZiBDT05GSUdfREVCVUdfQlVHVkVSQk9TRQorI2RlZmluZSBCVUdfT04ocCkgIEJVR19PTl9W
RVJCT1NFKHApCisjZWxzZQogI2RlZmluZSBCVUdfT04ocCkgIGRvIHsgaWYgKHVubGlrZWx5KHAp
KSBCVUcoKTsgIH0gd2hpbGUgKDApCisjZW5kaWYKICNkZWZpbmUgV0FSTl9PTihwKSBkbyB7IGlm
ICh1bmxpa2VseShwKSkgV0FSTigpOyB9IHdoaWxlICgwKQogCiAjaWYgX19HTlVDX18gPiA0IHx8
IChfX0dOVUNfXyA9PSA0ICYmIF9fR05VQ19NSU5PUl9fID49IDYpCi0tIAoyLjE2LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
