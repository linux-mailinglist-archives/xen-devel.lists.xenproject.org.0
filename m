Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D690C574
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 11:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742910.1149789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVMV-0002e6-Nm; Tue, 18 Jun 2024 09:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742910.1149789; Tue, 18 Jun 2024 09:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVMV-0002bW-L4; Tue, 18 Jun 2024 09:42:47 +0000
Received: by outflank-mailman (input) for mailman id 742910;
 Tue, 18 Jun 2024 09:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x1Qc=NU=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1sJVMU-0002bQ-6c
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 09:42:46 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c6c19f9-2d57-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 11:42:44 +0200 (CEST)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6fb840d8ffdso2493323a34.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 02:42:44 -0700 (PDT)
Received: from localhost ([122.172.82.13]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6fedf0bef16sm7753098a12.43.2024.06.18.02.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:42:42 -0700 (PDT)
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
X-Inumbo-ID: 1c6c19f9-2d57-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718703763; x=1719308563; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8UALesfbksrHHNtNwGYa4E+DNFkRXivhYiDbx6+KbJc=;
        b=S+74Pnur6hpPfzhn/qtKmLoZ3J1fVWoLtYJQkVpqpm8Rsz+XPBfu/OiEHwUt81k307
         nrIWbLVS9z43ZtMP8KPs0fn3a8/dZQsxRZHFxqcbEhSZ1PpMod4j+dqN5BhSFRuppqUu
         qyCF+v9maudBj38cK1xCcNOXZc2jxb4/7uCfJ7fTF7IIbYarQOSELxqg8BJgwEyvv29a
         JEvl0pUgEtnn0GdRGE3bYEXxZX5SqQYQEkMNbtZWKQD3SSIpoaXGI+CM9W4Q7ujOw5wl
         6Rel2CVqsrQYkhESv5kjmhbHIsB15CopEK1xYttYptzOmmE9fVRUP3N4V/1Vm4KLa1Tq
         NO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718703763; x=1719308563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UALesfbksrHHNtNwGYa4E+DNFkRXivhYiDbx6+KbJc=;
        b=UALrsZawBzkdHSuxS+TP/mtYkcV0fei8N7BbkKZMthClE8ULJ7+JgJrQc9kJ8maUEz
         PNbZ9FDdqEa5YwHgwa2gYnG2G51A2tAOkRCCG6vPbyhC34inDsuQHe9si88JBnclPhvK
         GkLLXAqObPCz90HlY2/N5tWHMN5Qq4AEQxBJX7x9ITAliRZ46y0DTin71SheaaZPOnWJ
         7U5wi7BK0y3lAsUaF2loGdRktgok26cnYtMvi1218uesFYg8vEeJmD9DG2iAdhHtvR77
         mBXZOJFAshFUzv/491AAVHvpuSiVSjL2E78RWe21morCPikomIRXuZzkFdR5y5PZJtRZ
         buMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3byWCaxn3dVyGkdu4ofaKYkEYGKSuNoEDrZ6ikYUMNLMUVUFWdJTg8EmnqzKqkBKrsVCqxB7Gt3wpYV9rC/4pQmMHP07vyvcO5A7sMpY=
X-Gm-Message-State: AOJu0Yx2Gpe4gbU3hCCaNa4Y0ZSE5ia4qjg6AxbO/YG22VgfPVX0aNr2
	Q36lXSnQLQRxHwtNL3+/tYlJYJq/wtFcPeE5DER4n3E+txvwMF/CtvLshLnY/GQ=
X-Google-Smtp-Source: AGHT+IHduV0HGFrVmQSxIvryeJgCIEd+h/riwq126F2u6x4F+za92Uiu45uPCTH4ThXJnQkPLkaziw==
X-Received: by 2002:a9d:4d91:0:b0:6fa:81b:d4f8 with SMTP id 46e09a7af769-6fb9364ecd9mr12749877a34.1.1718703762611;
        Tue, 18 Jun 2024 02:42:42 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] xen: privcmd: Switch from mutex to spinlock for irqfds
Date: Tue, 18 Jun 2024 15:12:28 +0530
Message-Id: <a66d7a7a9001424d432f52a9fc3931a1f345464f.1718703669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irqfd_wakeup() gets EPOLLHUP, when it is called by
eventfd_release() by way of wake_up_poll(&ctx->wqh, EPOLLHUP), which
gets called under spin_lock_irqsave(). We can't use a mutex here as it
will lead to a deadlock.

Fix it by switching over to a spin lock.

Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/xen/privcmd.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 67dfa4778864..5ceb6c56cf3e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -13,7 +13,6 @@
 #include <linux/file.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -845,7 +844,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 #ifdef CONFIG_XEN_PRIVCMD_EVENTFD
 /* Irqfd support */
 static struct workqueue_struct *irqfd_cleanup_wq;
-static DEFINE_MUTEX(irqfds_lock);
+static DEFINE_SPINLOCK(irqfds_lock);
 static LIST_HEAD(irqfds_list);
 
 struct privcmd_kernel_irqfd {
@@ -909,9 +908,11 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned int mode, int sync, void *key)
 		irqfd_inject(kirqfd);
 
 	if (flags & EPOLLHUP) {
-		mutex_lock(&irqfds_lock);
+		unsigned long flags;
+
+		spin_lock_irqsave(&irqfds_lock, flags);
 		irqfd_deactivate(kirqfd);
-		mutex_unlock(&irqfds_lock);
+		spin_unlock_irqrestore(&irqfds_lock, flags);
 	}
 
 	return 0;
@@ -929,6 +930,7 @@ irqfd_poll_func(struct file *file, wait_queue_head_t *wqh, poll_table *pt)
 static int privcmd_irqfd_assign(struct privcmd_irqfd *irqfd)
 {
 	struct privcmd_kernel_irqfd *kirqfd, *tmp;
+	unsigned long flags;
 	__poll_t events;
 	struct fd f;
 	void *dm_op;
@@ -968,18 +970,18 @@ static int privcmd_irqfd_assign(struct privcmd_irqfd *irqfd)
 	init_waitqueue_func_entry(&kirqfd->wait, irqfd_wakeup);
 	init_poll_funcptr(&kirqfd->pt, irqfd_poll_func);
 
-	mutex_lock(&irqfds_lock);
+	spin_lock_irqsave(&irqfds_lock, flags);
 
 	list_for_each_entry(tmp, &irqfds_list, list) {
 		if (kirqfd->eventfd == tmp->eventfd) {
 			ret = -EBUSY;
-			mutex_unlock(&irqfds_lock);
+			spin_unlock_irqrestore(&irqfds_lock, flags);
 			goto error_eventfd;
 		}
 	}
 
 	list_add_tail(&kirqfd->list, &irqfds_list);
-	mutex_unlock(&irqfds_lock);
+	spin_unlock_irqrestore(&irqfds_lock, flags);
 
 	/*
 	 * Check if there was an event already pending on the eventfd before we
@@ -1011,12 +1013,13 @@ static int privcmd_irqfd_deassign(struct privcmd_irqfd *irqfd)
 {
 	struct privcmd_kernel_irqfd *kirqfd;
 	struct eventfd_ctx *eventfd;
+	unsigned long flags;
 
 	eventfd = eventfd_ctx_fdget(irqfd->fd);
 	if (IS_ERR(eventfd))
 		return PTR_ERR(eventfd);
 
-	mutex_lock(&irqfds_lock);
+	spin_lock_irqsave(&irqfds_lock, flags);
 
 	list_for_each_entry(kirqfd, &irqfds_list, list) {
 		if (kirqfd->eventfd == eventfd) {
@@ -1025,7 +1028,7 @@ static int privcmd_irqfd_deassign(struct privcmd_irqfd *irqfd)
 		}
 	}
 
-	mutex_unlock(&irqfds_lock);
+	spin_unlock_irqrestore(&irqfds_lock, flags);
 
 	eventfd_ctx_put(eventfd);
 
@@ -1073,13 +1076,14 @@ static int privcmd_irqfd_init(void)
 static void privcmd_irqfd_exit(void)
 {
 	struct privcmd_kernel_irqfd *kirqfd, *tmp;
+	unsigned long flags;
 
-	mutex_lock(&irqfds_lock);
+	spin_lock_irqsave(&irqfds_lock, flags);
 
 	list_for_each_entry_safe(kirqfd, tmp, &irqfds_list, list)
 		irqfd_deactivate(kirqfd);
 
-	mutex_unlock(&irqfds_lock);
+	spin_unlock_irqrestore(&irqfds_lock, flags);
 
 	destroy_workqueue(irqfd_cleanup_wq);
 }
-- 
2.31.1.272.g89b43f80a514


