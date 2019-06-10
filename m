Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC003AE95
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 07:19:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haCf7-0006I8-Th; Mon, 10 Jun 2019 05:16:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y1/0=UJ=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1haCf6-0006I3-Ov
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 05:16:04 +0000
X-Inumbo-ID: d25bcde0-8b3e-11e9-a047-abdf9327b909
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d25bcde0-8b3e-11e9-a047-abdf9327b909;
 Mon, 10 Jun 2019 05:15:57 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 10 Jun 2019 13:12:44 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Jun 2019 13:15:47 +0800
Message-ID: <1560143748-11027-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen/arm: domain: remove redundant memset for
 arch's saved_context when creating vcpu
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
Cc: Baodong Chen <chenbaodong@mxnavi.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxyZWFkeSBkb25lIGJ5IGNsZWFyX3BhZ2UoKSBpbiBhbGxvY192Y3B1X3N0cnVjdCgpCgpTaWdu
ZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+Ci0tLQogeGVu
L2FyY2gvYXJtL2RvbWFpbi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4u
YwppbmRleCBmZjMzMGIzLi5hZDFiMTA2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWlu
LmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCkBAIC01NTcsNyArNTU3LDYgQEAgaW50IGFy
Y2hfdmNwdV9jcmVhdGUoc3RydWN0IHZjcHUgKnYpCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLSBzaXplb2Yoc3RydWN0IGNwdV9pbmZvKSk7CiAgICAgbWVtc2V0
KHYtPmFyY2guY3B1X2luZm8sIDAsIHNpemVvZigqdi0+YXJjaC5jcHVfaW5mbykpOwogCi0gICAg
bWVtc2V0KCZ2LT5hcmNoLnNhdmVkX2NvbnRleHQsIDAsIHNpemVvZih2LT5hcmNoLnNhdmVkX2Nv
bnRleHQpKTsKICAgICB2LT5hcmNoLnNhdmVkX2NvbnRleHQuc3AgPSAocmVnaXN0ZXJfdCl2LT5h
cmNoLmNwdV9pbmZvOwogICAgIHYtPmFyY2guc2F2ZWRfY29udGV4dC5wYyA9IChyZWdpc3Rlcl90
KWNvbnRpbnVlX25ld192Y3B1OwogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
