Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C259737F8C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 12:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552632.862810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBv1E-0002wV-Dy; Wed, 21 Jun 2023 10:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552632.862810; Wed, 21 Jun 2023 10:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBv1E-0002uG-AL; Wed, 21 Jun 2023 10:24:56 +0000
Received: by outflank-mailman (input) for mailman id 552632;
 Wed, 21 Jun 2023 10:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30K1=CJ=citrix.com=prvs=529504c83=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qBv1C-0002u4-Rq
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 10:24:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8e88d74-101d-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 12:24:49 +0200 (CEST)
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
X-Inumbo-ID: d8e88d74-101d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687343089;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=haGiUgHRHqD5BrAJs/jmezqb+r3ELNJ5UIOJ2LCUy44=;
  b=Ihncm2OcW6RneaDpsbfQEF0ADs3jq/idW7RuvWghF6mdu/ODuu/FWVDw
   FwJISA01NW3pnwOEFBI6+f0QvuEw9TXcMmvrG/8k6w7ZhMnRkdbN+QVQq
   VicLiENR1ZsRK5/ulgd+3WGRbkFAfQij3o26Aice81lym2emOeLMiam+a
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113489353
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:XYroUq1taYS2oXAfYvbD5bZxkn2cJEfYwER7XKvMYLTBsI5bpzJUz
 jEeUGuCbPmLMTP1eIx3Ydy1oEsGuZPdztJgQQprpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJkPKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfRn5A0
 qA8NDE0USu9lfCI2vG/QdJ8iZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwOwhbJ/
 T+dl4j/KjY1EczGkiOlyG+tj92Tgj2jR7wQKKLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPIJTbd8slvUjPOJvUDAXDNsoiN9hMIO89A4YmAOy
 l6woOjXFy5Rqv6RQkmN+eLBxd+tAhT5PVPudAddE1tauYm8+dFp5v7cZo09SfDo17UZDRm1m
 mnX93Zm2t3/mOZRj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 1BewaByFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Ld8KsG8meRczYpxsldrVj
 Kj741k52XOuFCHyMf8fj3yZVqzGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zmFraTYqolmY
 c3zWZ/1XR4n5VFPkGLeqxE1jeV6mUjTBAr7GfjG8vhQ+ePFOC/FF+9UYAHmgyJQxPrsnTg5O
 u13b6OioyizmsWnCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:jHULdqD1kqVR3u/lHeilsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPHjP+UMssRAb6KK90cy7IU80mqQFkbX5UY3SIDUO/VHYT72KjrGSsAEIeReOi9K1vJ
 0IG8QQaeEYT2IK7/oShjPIbOrIqOP3hJxA7t2uvkuFODsaDp2IgT0JdDpzX3cGCDVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+ww+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlZQnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDyqISU+G4Wfd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7m16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklV6voJBiKrrzPLd
 MeTv00pcwmMm9yVkqp/lWHFebcG0jaHX+9MwA/U4KuomFrtUE863Fd5NcehDMl+I80ZpFY74
 3/Q95VfYp1P4YrhJJGdZE8qPSMexvwqDL3QSivyAfcZew60jT22t/KyYRw29uRPLAWwJwu3L
 THUE5ZvXM1YCvVeLSz9awOzSr2BEmjUTPxjuFY54V4sqD7X/7CKyeCSDkV4rOdisRaPffgH9
 qtNJVKR8L5LWXhFZ0h5XyEZ7BibUYlaok4pdo9RhaystvGQ7ea0dDzQbLtHoCoKzwjQ2+XOA
 pmYBHDYPp71ASQRnTjigPQQm7sfEu63b8YKtm9w9Qu
X-Talos-CUID: 9a23:qh3Dqmy5AXB3aKBj/hPzBgVTBc4CLlnBzU7vGHGqG1hzC7meck+frfY=
X-Talos-MUID: 9a23:D3euCwiQQYXh5nG1XFYdCcMpE+hN8/31EWA3jJQPiZWbK3RvBTWhk2Hi
X-IronPort-AV: E=Sophos;i="6.00,260,1681185600"; 
   d="scan'208";a="113489353"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [OSSTEST PATCH] Use updated mirror for buster armhf, and update debian-installer
Date: Wed, 21 Jun 2023 11:24:26 +0100
Message-ID: <20230621102426.19955-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit b838a9daeb3b ("production-config: Use a snapshot
for buster armhf")

Installation now fails with "Invalid Release signature", while
downloading the "Release" file of a repo.

But, using the main mirror for armhf boxes seems to work fine now.

To use the live mirror, we need to update the debian-installer as
there's a newer version of the kernel. Otherwise, installation fails
with the installer not able to find the disk.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I've tested this with just the *armhf* jobs, which works. So I'm going
    to push that to osstest right away and let it do a full flight test.

 production-config | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/production-config b/production-config
index 78ad768e..2c44805c 100644
--- a/production-config
+++ b/production-config
@@ -91,9 +91,7 @@ TftpNetbootGroup osstest
 TftpDiVersion_wheezy 2016-06-08
 TftpDiVersion_jessie 2018-06-26
 TftpDiVersion_stretch 2020-09-24
-TftpDiVersion_buster 2022-03-28
-
-DebianMirror_buster_armhf http://snapshot.debian.org/archive/debian/20210124T203726Z/
+TftpDiVersion_buster 2023-06-20
 
 DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/20190206T211314Z/
 
-- 
Anthony PERARD


