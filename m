Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DC96989BE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 02:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496308.766988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSSnz-0007tN-28; Thu, 16 Feb 2023 01:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496308.766988; Thu, 16 Feb 2023 01:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSSny-0007qN-Us; Thu, 16 Feb 2023 01:11:22 +0000
Received: by outflank-mailman (input) for mailman id 496308;
 Thu, 16 Feb 2023 01:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QjYw=6M=weissschuh.net=linux@srs-se1.protection.inumbo.net>)
 id 1pSSnx-0007qF-F5
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 01:11:21 +0000
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d02a8c93-ad96-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 02:11:17 +0100 (CET)
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
X-Inumbo-ID: d02a8c93-ad96-11ed-93b5-47a8fe42b414
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1676509875;
	bh=m6ujeRpdfOK/ExLf0oC3JKdeaOfOHj5ANo4y+Xyc7GY=;
	h=From:Date:Subject:To:Cc:From;
	b=gSkPlaVUEK8XCxDKTPzpUqjl9Sj0DEdap9GrK1j86v07YTpvTLLdwcKxIujqhkWB+
	 XgYRtg03IY4LSvnmAhX3Qaz4hjJpbsjxnynrgHkvSOBxHfJDU27yrdWGRUUJ5JRsRz
	 Lnvj6RvH7X9KBpZJ6xcf5rigeR7QEen4I31aShSU=
Date: Thu, 16 Feb 2023 01:10:59 +0000
Subject: [PATCH] xen: sysfs: make kobj_type structure constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230216-kobj_type-xen-v1-1-742423de7d71@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAKKC7WMC/x2NXQrCQAwGr1LybCBdf0CvIiK7208bLWnZVamU3
 t3g4wwMs1BFUVQ6NQsVfLTqaA7tpqHcR7uDtXOmIGEroT3wc0yP6+s7gWcYd0cJe5GcdgB5k2I
 FpxIt917ZexhcTgU3nf+T82VdfzDVeXV0AAAA
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676509873; l=995;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=m6ujeRpdfOK/ExLf0oC3JKdeaOfOHj5ANo4y+Xyc7GY=;
 b=BSGS1rU5dMp0UG5XucdetX/M4JSycNQ6bQiZOMnjBqP9UUfa2dOu+1rbACy/WpsfD/SxzWpCb
 DiLmvhDGWHKDZlz1T5Tt4NbRLtZoQNjF1h3XY5tKryMcADg00hd0MNh
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
the driver core allows the usage of const struct kobj_type.

Take advantage of this to constify the structure definition to prevent
modification at runtime.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/xen/sys-hypervisor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index fcb0792f090e..ef62acb354a7 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -594,7 +594,7 @@ static const struct sysfs_ops hyp_sysfs_ops = {
 	.store = hyp_sysfs_store,
 };
 
-static struct kobj_type hyp_sysfs_kobj_type = {
+static const struct kobj_type hyp_sysfs_kobj_type = {
 	.sysfs_ops = &hyp_sysfs_ops,
 };
 

---
base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
change-id: 20230216-kobj_type-xen-d902500cb4ee

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


