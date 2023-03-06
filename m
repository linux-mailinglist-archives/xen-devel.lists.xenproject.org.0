Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93736AC206
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 14:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506952.780168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBM0-0006By-Iq; Mon, 06 Mar 2023 13:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506952.780168; Mon, 06 Mar 2023 13:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBM0-000698-Fx; Mon, 06 Mar 2023 13:58:16 +0000
Received: by outflank-mailman (input) for mailman id 506952;
 Mon, 06 Mar 2023 13:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6QT=66=citrix.com=prvs=4224746ab=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pZBLy-000692-Sb
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 13:58:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed4f2775-bc26-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 14:58:11 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ed4f2775-bc26-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678111091;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HSSPGEMrvDoYUxkiAfHI8fUzcy+d6Oq56HQF6eBirVo=;
  b=fNByOjc8ILMZMUMjzFllzXNcoDJZ76MS6iHwCVNJMwjm5fcMLgfSUXd6
   XKUVntv7HUbw8Khl9mIEFz6aYeY8/g9Dw6nIMFe4YGryUe6I3w3Kel/iL
   64YI/mnq9hBYXfuWlQEfZFNMi6sth9sjXN/xu/E1AQ8CZxMHiHONU9Zfo
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99677393
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:1YZL/q1w+CZMzAsv7fbD5dFxkn2cJEfYwER7XKvMYLTBsI5bpz1Wz
 zMfWjrQbP6KMDD1eop3bt7i9kwOsMeAn4NnHlM/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdmO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDlke/
 qBDLGg0My/fuaXxx5ilSuQziZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJQLwRnD9
 zmuE2LROC09EtmTmT689X+h2e7xgGT0eY00LejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslh8DWfJAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPxomybdByjFGLYX2lprzI9jfqAHUqcVFFIiguUwsIvNa29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWG3jaD/LF7rVxBHkJPmqgBiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SoS9CqmOM4cSP8QZmOq7EMZGPxP44owQuBJ0zfFX1
 WmzKq5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI503P7FZqX1bMEe1tGALXPogEAFas/F29H
 yB3a5HblH2ykYTWPkHqzGLkBQlScSlmW8mr+pQ/myzqClMOJVzNwsT5mdsJE7GJVYwP/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:R3oZ+qy3xSDDRTcvocCVKrPwBL1zdoMgy1knxilNoH1uHfBw8v
 rEoB11726StN98YhAdcKm7Scy9qBDnm6Kdn7NhWYtKBzOW21dARbsKheGOrwEIcBefygcy79
 YZT0FWMqyTMXFKyer8/QmkA5IB7bC8gduVbD7lvhFQpNdRGthd0zs=
X-IronPort-AV: E=Sophos;i="5.98,238,1673931600"; 
   d="scan'208";a="99677393"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH] ap-common: Fix qemu.git URL
Date: Mon, 6 Mar 2023 13:57:31 +0000
Message-ID: <20230306135731.43329-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Cloning from "git://git.qemu.org/qemu.git" haven't work for maybe a
month.

While "https://git.qemu.org/qemu.git" seems to work, it only redirects
to gitlab.com.

qemu.org website point to a repo hosted by gitlab.com.

So, switch to "https://gitlab.com/qemu-project/qemu.git".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ap-common | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ap-common b/ap-common
index 547b48ed..292553ed 100644
--- a/ap-common
+++ b/ap-common
@@ -90,7 +90,7 @@ fi
 
 : ${TREE_QEMU_UPSTREAM:=${BASE_TREE_QEMU_UPSTREAM}}
 
-: ${TREE_QEMU_MAINLINE:=git://git.qemu.org/qemu.git}
+: ${TREE_QEMU_MAINLINE:=https://gitlab.com/qemu-project/qemu.git}
 
 info_linux_tree () {
 	case $1 in
-- 
Anthony PERARD


