Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA6BE535
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 20:53:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDCLy-00049K-FQ; Wed, 25 Sep 2019 18:49:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cfsh=XU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDCLx-00048t-7Y
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 18:49:29 +0000
X-Inumbo-ID: 33f8a17e-dfc5-11e9-963a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 33f8a17e-dfc5-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 18:49:28 +0000 (UTC)
Received: from localhost.localdomain (c-67-164-102-47.hsd1.ca.comcast.net
 [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0D6C21D7F;
 Wed, 25 Sep 2019 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569437368;
 bh=cZfU+ZaJQV9+aGXjGetaWpdYkf8k4n0GafB88UY6dRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gSYN6XuMjct2FsfpNLZiKITkeE0+fd+zE5e7E+lz4zhxL8ppXWuxOuBk20czA1kkh
 HK/FLvrVwMFrjWm3/T/Nrt7HHHYHP/X4I+Av+F46u2tAHcCf+eyYodkOK7JZfR4Tl8
 nPNcNDoSIZe+nEmmqQOieOjKCRcrvZpz4qSFDdkM=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Wed, 25 Sep 2019 11:49:18 -0700
Message-Id: <20190925184924.21691-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v5 2/8] xen/arm: export device_tree_get_reg and
 device_tree_get_u32
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 andrii_anisov@epam.com, Achin.Gupta@arm.com, xen-devel@lists.xen.org,
 Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhleSdsbCBiZSB1c2VkIGluIGxhdGVyIHBhdGNoZXMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CgotLS0KQ2hhbmdlcyBpbiB2NToKLSBt
b3ZlIGRlY2xhcmF0aW9ucyB0byB4ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgKCkNoYW5nZXMg
aW4gdjQ6Ci0gbmV3IHBhdGNoCi0tLQogeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgIHwgOCAr
KysrLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIHwgNiArKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwppbmRleCA2MjMx
NzNiYzdmLi5hNzgxMGFiYjE1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCisr
KyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKQEAgLTU1LDE1ICs1NSwxNSBAQCBzdGF0aWMgYm9v
bCBfX2luaXQgZGV2aWNlX3RyZWVfbm9kZV9jb21wYXRpYmxlKGNvbnN0IHZvaWQgKmZkdCwgaW50
IG5vZGUsCiAgICAgcmV0dXJuIGZhbHNlOwogfQogCi1zdGF0aWMgdm9pZCBfX2luaXQgZGV2aWNl
X3RyZWVfZ2V0X3JlZyhjb25zdCBfX2JlMzIgKipjZWxsLCB1MzIgYWRkcmVzc19jZWxscywKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBzaXplX2NlbGxzLCB1NjQg
KnN0YXJ0LCB1NjQgKnNpemUpCit2b2lkIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfcmVnKGNvbnN0
IF9fYmUzMiAqKmNlbGwsIHUzMiBhZGRyZXNzX2NlbGxzLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1MzIgc2l6ZV9jZWxscywgdTY0ICpzdGFydCwgdTY0ICpzaXplKQogewogICAg
ICpzdGFydCA9IGR0X25leHRfY2VsbChhZGRyZXNzX2NlbGxzLCBjZWxsKTsKICAgICAqc2l6ZSA9
IGR0X25leHRfY2VsbChzaXplX2NlbGxzLCBjZWxsKTsKIH0KIAotc3RhdGljIHUzMiBfX2luaXQg
ZGV2aWNlX3RyZWVfZ2V0X3UzMihjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIHUzMiBk
Zmx0KQordTMyIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQgKmZkdCwgaW50
IG5vZGUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9u
YW1lLCB1MzIgZGZsdCkKIHsKICAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOwog
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmggYi94ZW4vaW5jbHVkZS9h
c20tYXJtL3NldHVwLmgKaW5kZXggZWZjYmE1NDVjMi4uZmEwYTg3MjFiMiAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vc2V0
dXAuaApAQCAtMTE1LDYgKzExNSwxMiBAQCBjb25zdCBjaGFyICpib290X21vZHVsZV9raW5kX2Fz
X3N0cmluZyhib290bW9kdWxlX2tpbmQga2luZCk7CiBleHRlcm4gdWludDMyX3QgaHlwX3RyYXBz
X3ZlY3RvcltdOwogdm9pZCBpbml0X3RyYXBzKHZvaWQpOwogCit2b2lkIGRldmljZV90cmVlX2dl
dF9yZWcoY29uc3QgX19iZTMyICoqY2VsbCwgdTMyIGFkZHJlc3NfY2VsbHMsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgdTMyIHNpemVfY2VsbHMsIHU2NCAqc3RhcnQsIHU2NCAqc2l6ZSk7CisK
K3UzMiBkZXZpY2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCisgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIHUzMiBkZmx0KTsKKwog
I2VuZGlmCiAvKgogICogTG9jYWwgdmFyaWFibGVzOgotLSAKMi4xNy4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
