Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2918C599
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 04:12:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jF82Z-00087E-Js; Fri, 20 Mar 2020 03:09:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LtBW=5F=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jF82X-000879-QA
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 03:09:42 +0000
X-Inumbo-ID: 3d8cf334-6a58-11ea-92cf-bc764e2007e4
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d8cf334-6a58-11ea-92cf-bc764e2007e4;
 Fri, 20 Mar 2020 03:09:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E25955C00D8;
 Thu, 19 Mar 2020 23:09:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 19 Mar 2020 23:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jBBs34
 ifVHQ0aVecQlyYvVN7oUaD2V0VfvCaG76C/2c=; b=YVr08bjp5poGxs01hCJ8iZ
 Mg8A978WUliOLV6tKVX/QW+nuVYoedFY8bSWcgaOrocmUdIAk7toA7j1IMY26ZMz
 w5dwqL6RVIo6WVs8J88GGHKZ1BwK7PLqOimQqYYeCAvkSzlM4G09ZxouwQcyt6JY
 UksDfti7CbwUHpiqopap6bcrDaWVdQhKNdH/AEUM/ST97c1F0+W6rj2WnOX+cwuA
 cxtoLOrZkkoCGMDr+2VY0U2aW69Fd136cUpdtBeR9UvPqCsoCzgemebsTWXTLuAX
 oYfxkqkv7SXVe98Yh+nmYIdu5OVBP7QOf4wHiNyurJ20iCoWYSl78ocrX2Sj+zCg
 ==
X-ME-Sender: <xms:9DN0XgTb57k-FI1iRGuhtqwsI7bVWb6E_d6Q3Q4d4JyEsVoCWzJc-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegtddgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:9DN0XpL3bPRpU4iAoFhcTi8QWn-V6J-GIPuHJdAXN2EA53JLSbwnOg>
 <xmx:9DN0XnObG_zP_4pClfj_ABVOIQkzcFh7lUFh0MAXDb70Cq8b0PfU1Q>
 <xmx:9DN0XrzJ2aBuC-BbGGGfSd8ylxR9tSS9UR5TOVEjWVejta6BGZnjbQ>
 <xmx:9DN0XjWAP_SLFfYETPh6ujhwj2HXbfo2FaKHboWP2_Cx35VpeHCboQ>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 76E073280059;
 Thu, 19 Mar 2020 23:09:39 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 20 Mar 2020 04:09:18 +0100
Message-Id: <20200320030929.24735-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH v2] xen-pciback: fix INTERRUPT_TYPE_* defines
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

eGVuX3BjaWJrX2dldF9pbnRlcnJ1cHRfdHlwZSgpIGFzc3VtZXMgSU5URVJSVVBUX1RZUEVfTk9O
RSBiZWluZyAwCihpbml0aWFsaXplIHJldCB0byAwIGFuZCByZXR1cm4gYXMgSU5URVJSVVBUX1RZ
UEVfTk9ORSkuCkZpeCB0aGUgZGVmaW5pdGlvbiB0byBtYWtlIElOVEVSUlVQVF9UWVBFX05PTkUg
cmVhbGx5IDAsIGFuZCBhbHNvIHNoaWZ0Cm90aGVyIHZhbHVlcyB0byBub3QgbGVhdmUgaG9sZXMu
CkJ1dCBhbHNvLCBkbyBub3QgYXNzdW1lIElOVEVSUlVQVF9UWVBFX05PTkUgYmVpbmcgMCBhbnlt
b3JlIHRvIGF2b2lkCnNpbWlsYXIgY29uZnVzaW9ucyBpbiB0aGUgZnV0dXJlLgoKRml4ZXM6IDQ3
Njg3OGU0YjJiZSAoInhlbi1wY2liYWNrOiBvcHRpb25hbGx5IGFsbG93IGludGVycnVwdCBlbmFi
bGUgZmxhZyB3cml0ZXMiKQpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgog
LSBkb24ndCBkZXBlbmQgb24gSU5URVJSVVBUX1RZUEVfTk9ORSBiZWluZyAwCi0tLQogZHJpdmVy
cy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5jIHwgMiArLQogZHJpdmVycy94ZW4veGVuLXBj
aWJhY2svY29uZl9zcGFjZS5oIHwgOCArKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBj
aWJhY2svY29uZl9zcGFjZS5jIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5j
CmluZGV4IGIyMGU0M2UxNDhjZS4uZGE1MWE1ZDM0ZTZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hl
bi94ZW4tcGNpYmFjay9jb25mX3NwYWNlLmMKKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sv
Y29uZl9zcGFjZS5jCkBAIC0zMjAsNyArMzIwLDcgQEAgaW50IHhlbl9wY2lia19nZXRfaW50ZXJy
dXB0X3R5cGUoc3RydWN0IHBjaV9kZXYgKmRldikKIAkJaWYgKHZhbCAmIFBDSV9NU0lYX0ZMQUdT
X0VOQUJMRSkKIAkJCXJldCB8PSBJTlRFUlJVUFRfVFlQRV9NU0lYOwogCX0KLQlyZXR1cm4gcmV0
OworCXJldHVybiByZXQgPzogSU5URVJSVVBUX1RZUEVfTk9ORTsKIH0KIAogdm9pZCB4ZW5fcGNp
YmtfY29uZmlnX2ZyZWVfZHluX2ZpZWxkcyhzdHJ1Y3QgcGNpX2RldiAqZGV2KQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5oIGIvZHJpdmVycy94ZW4veGVu
LXBjaWJhY2svY29uZl9zcGFjZS5oCmluZGV4IDI4YzQ1MTgwYTEyZS4uNWZlNDMxYzc5ZjI1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9jb25mX3NwYWNlLmgKKysrIGIvZHJp
dmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5oCkBAIC02NSwxMCArNjUsMTAgQEAgc3Ry
dWN0IGNvbmZpZ19maWVsZF9lbnRyeSB7CiAJdm9pZCAqZGF0YTsKIH07CiAKLSNkZWZpbmUgSU5U
RVJSVVBUX1RZUEVfTk9ORSAoMTw8MCkKLSNkZWZpbmUgSU5URVJSVVBUX1RZUEVfSU5UWCAoMTw8
MSkKLSNkZWZpbmUgSU5URVJSVVBUX1RZUEVfTVNJICAoMTw8MikKLSNkZWZpbmUgSU5URVJSVVBU
X1RZUEVfTVNJWCAoMTw8MykKKyNkZWZpbmUgSU5URVJSVVBUX1RZUEVfTk9ORSAoMCkKKyNkZWZp
bmUgSU5URVJSVVBUX1RZUEVfSU5UWCAoMTw8MCkKKyNkZWZpbmUgSU5URVJSVVBUX1RZUEVfTVNJ
ICAoMTw8MSkKKyNkZWZpbmUgSU5URVJSVVBUX1RZUEVfTVNJWCAoMTw8MikKIAogZXh0ZXJuIGJv
b2wgeGVuX3BjaWJrX3Blcm1pc3NpdmU7CiAKLS0gCjIuMjEuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
