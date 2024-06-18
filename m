Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A9590C573
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 11:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742911.1149800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVMZ-0002sY-0s; Tue, 18 Jun 2024 09:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742911.1149800; Tue, 18 Jun 2024 09:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVMY-0002qA-UI; Tue, 18 Jun 2024 09:42:50 +0000
Received: by outflank-mailman (input) for mailman id 742911;
 Tue, 18 Jun 2024 09:42:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x1Qc=NU=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1sJVMX-0002bQ-HV
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 09:42:49 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e94caf9-2d57-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 11:42:47 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-705fff50de2so1318800b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 02:42:47 -0700 (PDT)
Received: from localhost ([122.172.82.13]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb92c89sm8582018b3a.213.2024.06.18.02.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:42:45 -0700 (PDT)
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
X-Inumbo-ID: 1e94caf9-2d57-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718703766; x=1719308566; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSBvd6UdPXxQAYikzAX9WnO+l3sKpqabC3P6H43CjNw=;
        b=RLTRwGd40dE3Q8y3kuTkx25H0711nLMlpxztcrfr3F/bbJSK0Eb8yjXunbbbAqb8ZU
         lv6b6SFthbg7ESD2PnYUO8WSVylKYT3HdgdGkuGZ09AZUMOFw3p8tvzEU7skT7pW1dK1
         CjdQR9YaboaFXq0DqA7v6zldvfB4o8ddgr0dGshCsBSFzlMzMtSxpHfJdHPiDlAdRKKY
         cZMFTBf9Kf8Tu+IX/bAC3K7ADNFqS3ypPTlk9qQ8i1f+ILbMfjIutsrv/OUWxQuJPSlY
         eEeMO//O7fCeDAfRwzCjQsPgcHmTFEKnrn3jLkeUPKWSxqZESYxMOr+rD4izooWFeAt3
         zZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718703766; x=1719308566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSBvd6UdPXxQAYikzAX9WnO+l3sKpqabC3P6H43CjNw=;
        b=q93f5cRtSMTOknJjqiM3w9Tu+9eXNTS/zyW+esjyCiZKPEoart6OBrbbzbndTzFJRO
         yevkSX3ZK9oJebt1B1awEfYXpW1k28lfRLbXnLqLnKc2ccwCNIC8h1PJwLfn3w230aYg
         9raEwBqKXk/3ialWKEUsvQIJF+EQCtC3zHVAhPRsTB9Qf20l/e/Wq+bYX/bQTuSdvoqi
         41LN8dtFb7YHwUMtKnQhTHYUlZHPEodKXZyj/7HfHzGbuJ6DkdIx4iHoT3S8Rf/4WRRP
         K1Pyj47p+PE8cWt8xdbibmEpojkdxbXpb2PZ0fbD5AQ2p3WoD8SlV8XeZCPQWNYWFhSW
         zPvw==
X-Forwarded-Encrypted: i=1; AJvYcCX/IimIETHjuQeQCf2mIX5FqrPT+EzRaZ4Dh+Xa0yiAqFGFqIPYenriA8RA6wy3HZVPmgsf3XSxJ3/S0vy8KMSayTarE4cJxa5fpSbEnIA=
X-Gm-Message-State: AOJu0Ywz5H/QwOsCBIwVuR9afmEaCOkt2IW1xPHtkk33aiOfkn/uNMj+
	QZ2YYFRzzK9J3z2IN1mt6JcNO2zsi1bQucNiQ3az3eYhNbEhkVGDzMqBnX3a6jA=
X-Google-Smtp-Source: AGHT+IHcl/2RoXVQ+71aHNYVjn3NoTwhv2qPyWAbcWs0ParO44xZQCCVzutKlPjbF2/gE9SyhHgTKQ==
X-Received: by 2002:a05:6a00:4b47:b0:706:1bb3:fb1d with SMTP id d2e1a72fcca58-7061bb3fc6amr3055052b3a.7.1718703766091;
        Tue, 18 Jun 2024 02:42:46 -0700 (PDT)
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
Subject: [PATCH 2/2] xen: privcmd: Fix possible access to a freed kirqfd instance
Date: Tue, 18 Jun 2024 15:12:29 +0530
Message-Id: <9e884af1f1f842eacbb7afc5672c8feb4dea7f3f.1718703669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <a66d7a7a9001424d432f52a9fc3931a1f345464f.1718703669.git.viresh.kumar@linaro.org>
References: <a66d7a7a9001424d432f52a9fc3931a1f345464f.1718703669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing prevents simultaneous ioctl calls to privcmd_irqfd_assign() and
privcmd_irqfd_deassign(). If that happens, it is possible that a kirqfd
created and added to the irqfds_list by privcmd_irqfd_assign() may get
removed by another thread executing privcmd_irqfd_deassign(), while the
former is still using it after dropping the locks.

This can lead to a situation where an already freed kirqfd instance may
be accessed and cause kernel oops.

Use SRCU locking to prevent the same, as is done for the KVM
implementation for irqfds.

Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/xen/privcmd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 5ceb6c56cf3e..041774750e52 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -16,6 +16,7 @@
 #include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/srcu.h>
 #include <linux/string.h>
 #include <linux/workqueue.h>
 #include <linux/errno.h>
@@ -845,6 +846,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 /* Irqfd support */
 static struct workqueue_struct *irqfd_cleanup_wq;
 static DEFINE_SPINLOCK(irqfds_lock);
+DEFINE_STATIC_SRCU(irqfds_srcu);
 static LIST_HEAD(irqfds_list);
 
 struct privcmd_kernel_irqfd {
@@ -872,6 +874,9 @@ static void irqfd_shutdown(struct work_struct *work)
 		container_of(work, struct privcmd_kernel_irqfd, shutdown);
 	u64 cnt;
 
+	/* Make sure irqfd has been initialized in assign path */
+	synchronize_srcu(&irqfds_srcu);
+
 	eventfd_ctx_remove_wait_queue(kirqfd->eventfd, &kirqfd->wait, &cnt);
 	eventfd_ctx_put(kirqfd->eventfd);
 	kfree(kirqfd);
@@ -934,7 +939,7 @@ static int privcmd_irqfd_assign(struct privcmd_irqfd *irqfd)
 	__poll_t events;
 	struct fd f;
 	void *dm_op;
-	int ret;
+	int ret, idx;
 
 	kirqfd = kzalloc(sizeof(*kirqfd) + irqfd->size, GFP_KERNEL);
 	if (!kirqfd)
@@ -980,6 +985,7 @@ static int privcmd_irqfd_assign(struct privcmd_irqfd *irqfd)
 		}
 	}
 
+	idx = srcu_read_lock(&irqfds_srcu);
 	list_add_tail(&kirqfd->list, &irqfds_list);
 	spin_unlock_irqrestore(&irqfds_lock, flags);
 
@@ -991,6 +997,8 @@ static int privcmd_irqfd_assign(struct privcmd_irqfd *irqfd)
 	if (events & EPOLLIN)
 		irqfd_inject(kirqfd);
 
+	srcu_read_unlock(&irqfds_srcu, idx);
+
 	/*
 	 * Do not drop the file until the kirqfd is fully initialized, otherwise
 	 * we might race against the EPOLLHUP.
-- 
2.31.1.272.g89b43f80a514


