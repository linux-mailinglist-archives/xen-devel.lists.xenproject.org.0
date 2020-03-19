Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD518AB9F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 05:12:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEmTL-0003Wr-Td; Thu, 19 Mar 2020 04:07:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hP2b=5E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jEmTK-0003Wm-8k
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 04:07:54 +0000
X-Inumbo-ID: 342c75b0-6997-11ea-b34e-bc764e2007e4
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 342c75b0-6997-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 04:07:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2CA815C02B0;
 Thu, 19 Mar 2020 00:07:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 19 Mar 2020 00:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JqZGVe
 m4rI66UrgmQlCfN5l+r//ZyO/zrduFLQUqFkQ=; b=Kbx8CKEieLma6upRs2muMG
 15H4EBafz+XjJQCJYzbgTzoFdPa7GoiTeRe0ngQIgIqCP1OR5fojIDYoQQXGMfWJ
 zW9hFwlygiMbyXLHCF8VRPEQi6Ya93W2sonbg0CvGdinOf5gIs/mpqgiefDZ4ngp
 YT4L7NeWlTomatV4tiVG/653NJCUZ0yBBxZ+iHqTlShWKOvTo4q7mG7wMwDs4jfY
 03tlTocXY9F//JkFyOTcVlcig5GnRL655lfJJ2qUJ1Upm8jsgZqMxOrtdKqfT7q1
 tU6WbGsxkE9Qt8eKQRbHFE/X2fFFrSWeVBoLLCHkfe70TSJQoNus97iHXwVZRihQ
 ==
X-ME-Sender: <xms:F_ByXqiQHFbdBhZ9t5M5tuCLPpCYaJkXOd7dYJKvgClZwXb6EEvqDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefkedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:F_ByXjwefj1gpPsuFiKhObTjzLgT6DDx0fKtYczU-RB8I5Boa2awYQ>
 <xmx:F_ByXnjId9SiDnq8kOSIZ-qZYeVOPw8Y1CCLPLgk6RYvXsq5d1V-xg>
 <xmx:F_ByXm-zpA_CzFV5V020hSAuP3Y5XtuHnU15vgsq6rLA42ClYpKgig>
 <xmx:GPByXmHgGU4oG5hvRaaju3aTq_A6lsheNjXe3CbttaMwLhGHBYTFng>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8C7763280063;
 Thu, 19 Mar 2020 00:07:50 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 19 Mar 2020 05:06:40 +0100
Message-Id: <20200319040648.10396-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH] xen-pciback: fix INTERRUPT_TYPE_* defines
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
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SU5URVJSVVBUX1RZUEVfTk9ORSBzaG91bGQgYmUgMCwgYXMgaXQgaXMgYXNzdW1lZCBpbgp4ZW5f
cGNpYmtfZ2V0X2ludGVycnVwdF90eXBlKCkuIEZpeCB0aGUgZGVmaW5pdGlvbiwgYW5kIGFsc28g
c2hpZnQgb3RoZXIKdmFsdWVzIHRvIG5vdCBsZWF2ZSBob2xlcy4KQnV0IGFsc28gdXNlIElOVEVS
UlVQVF9UWVBFX05PTkUgaW4geGVuX3BjaWJrX2dldF9pbnRlcnJ1cHRfdHlwZSgpIHRvCmF2b2lk
IHNpbWlsYXIgY29uZnVzaW9ucyBpbiB0aGUgZnV0dXJlLgoKRml4ZXM6IDQ3Njg3OGU0YjJiZSAo
Inhlbi1wY2liYWNrOiBvcHRpb25hbGx5IGFsbG93IGludGVycnVwdCBlbmFibGUgZmxhZyB3cml0
ZXMiKQpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVr
QGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQogZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29u
Zl9zcGFjZS5jIHwgMiArLQogZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5oIHwg
OCArKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5jIGIv
ZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5jCmluZGV4IGIyMGU0M2UxNDhjZS4u
YjRlNGVjOWNkNDk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9jb25mX3Nw
YWNlLmMKKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5jCkBAIC0yOTAs
NyArMjkwLDcgQEAgaW50IHhlbl9wY2lia19nZXRfaW50ZXJydXB0X3R5cGUoc3RydWN0IHBjaV9k
ZXYgKmRldikKIHsKIAlpbnQgZXJyOwogCXUxNiB2YWw7Ci0JaW50IHJldCA9IDA7CisJaW50IHJl
dCA9IElOVEVSUlVQVF9UWVBFX05PTkU7CiAKIAllcnIgPSBwY2lfcmVhZF9jb25maWdfd29yZChk
ZXYsIFBDSV9DT01NQU5ELCAmdmFsKTsKIAlpZiAoZXJyKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy94
ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5oIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29u
Zl9zcGFjZS5oCmluZGV4IDI4YzQ1MTgwYTEyZS4uNWZlNDMxYzc5ZjI1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3hlbi94ZW4tcGNpYmFjay9jb25mX3NwYWNlLmgKKysrIGIvZHJpdmVycy94ZW4veGVu
LXBjaWJhY2svY29uZl9zcGFjZS5oCkBAIC02NSwxMCArNjUsMTAgQEAgc3RydWN0IGNvbmZpZ19m
aWVsZF9lbnRyeSB7CiAJdm9pZCAqZGF0YTsKIH07CiAKLSNkZWZpbmUgSU5URVJSVVBUX1RZUEVf
Tk9ORSAoMTw8MCkKLSNkZWZpbmUgSU5URVJSVVBUX1RZUEVfSU5UWCAoMTw8MSkKLSNkZWZpbmUg
SU5URVJSVVBUX1RZUEVfTVNJICAoMTw8MikKLSNkZWZpbmUgSU5URVJSVVBUX1RZUEVfTVNJWCAo
MTw8MykKKyNkZWZpbmUgSU5URVJSVVBUX1RZUEVfTk9ORSAoMCkKKyNkZWZpbmUgSU5URVJSVVBU
X1RZUEVfSU5UWCAoMTw8MCkKKyNkZWZpbmUgSU5URVJSVVBUX1RZUEVfTVNJICAoMTw8MSkKKyNk
ZWZpbmUgSU5URVJSVVBUX1RZUEVfTVNJWCAoMTw8MikKIAogZXh0ZXJuIGJvb2wgeGVuX3BjaWJr
X3Blcm1pc3NpdmU7CiAKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
