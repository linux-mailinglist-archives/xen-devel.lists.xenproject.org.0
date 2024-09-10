Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48097312D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795239.1204517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoH-0008DF-61; Tue, 10 Sep 2024 10:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795239.1204517; Tue, 10 Sep 2024 10:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoG-000874-QP; Tue, 10 Sep 2024 10:09:20 +0000
Received: by outflank-mailman (input) for mailman id 795239;
 Tue, 10 Sep 2024 10:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoE-0006hI-AU
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd7ee6d3-6f5c-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:09:18 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 623FC4EE07BC;
 Tue, 10 Sep 2024 12:09:17 +0200 (CEST)
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
X-Inumbo-ID: bd7ee6d3-6f5c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962957; bh=Wzd19j+5sdHV5ycixT7bH8d010X065zNVcpGpfr7Qh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yQcXn6UqvvTYA/+d8iwzKMdvnAAyAabOwroyHaI81cEKFydQtk4qejFgWX7Qzx2z2
	 zrsEdFJq6RJjcZ1/GAZSEQ9nmjOv59fxaLZ6ez8ng7bHGOB7aHuMCp7UkwSgTraDDc
	 UtKdY06Ad5+s/Hy3is5k7rwiPULRpZFvhqlOer9G7Q0WRvKE7Q4HRHpnBRTQPyul25
	 8Zu6OtKMzg/pCIcKotbKE7lTxun4YNcKYIHDaQr8ToPKGUKxEcLo6ZEp6J1RbLg3DB
	 CQok6PkqcAWYaRm1g8yJ8J0/2gOtbOuQlKtnT2z6lKcfT7QByqZmShNd1ovmb0IS4j
	 dWP5QZrdKmI3g==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 12/12] xen/pci: address a violation of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:09:04 +0200
Message-Id: <fd3bb0369cc1666a6c4ad79c54ee8772c1e561c2.1725958417.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address violations of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/passthrough/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5a446d3dce..a5705def3f 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
     {
     case 1: case 2: case 4:
         if ( *s )
-    default:
             return -EINVAL;
+        break;
+    default:
+        return -EINVAL;
     }
 
     phantom_devs[nr_phantom_devs++] = phantom;
-- 
2.34.1


