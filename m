Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E5F75BF09
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 08:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567354.886289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjnQ-0002jN-0x; Fri, 21 Jul 2023 06:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567354.886289; Fri, 21 Jul 2023 06:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjnP-0002g2-UK; Fri, 21 Jul 2023 06:39:23 +0000
Received: by outflank-mailman (input) for mailman id 567354;
 Fri, 21 Jul 2023 06:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2N6Z=DH=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qMjnO-0002fw-D6
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 06:39:22 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 523ce1a2-2791-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 08:39:20 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b8b318c5cfso11914315ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 23:39:20 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b001b7ebb6a2d4sm2573471pll.163.2023.07.20.23.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 23:39:18 -0700 (PDT)
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
X-Inumbo-ID: 523ce1a2-2791-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689921559; x=1690526359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWHdr1UYRJW9VJcQhEmLRZZfGjs4LZPTuEuEN5VniGg=;
        b=HoKbJJZVoe8s84WHtBeOcgYw4WZFlrwiNjuyu0pQIdWVe6mC2MvJBWaW5O7xtyMzOz
         hqfGDomdoMd6icWK/EzF6OQIXJeqF41BFiX3H6w0UkFLowGWUk2oexd0gEYauBySsT5A
         Y8tb7AzGqC89XXPVwdl3scpYfoQFlXhUQpRapww8Q4Yr6VyeMWlvri+k6o2vmef1O/gY
         hSgi6ip6hfofsZhqmxcG3LaerO6wmx8SJYbxfoOXipr9E6TvEU3sA67ybeq4oKSFNTNZ
         nxD687W+/XNWrMD6KT+H1HFnH+id68A5+3/vkyeKtQL+770XKGkPOia0+vipWTB0FDNE
         lulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689921559; x=1690526359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWHdr1UYRJW9VJcQhEmLRZZfGjs4LZPTuEuEN5VniGg=;
        b=G/3r4/yJPRc6/pUuVVsHVRjVDgoOuL5uocReA5XoIr89zvkv3raXL56Yebhw9SMChd
         3c3tSZs6sS2vdD/JzFKdwlkQOOkzl1bNeNUBRgHkUSDOTFus/UmPp89F+qcFhwmcaCx4
         tg2Au3RZ5dVS4AVQPxnLQuxqlzmjU+kybRHM0U44fCBTgKRRh/2crDlP1dKYOSixABbj
         BLMTbIIqrbMvBGk7FScyFiDyDSUda4o5ri12sTJJoNxizkYD4XEmiqZdzkTR9HlprQDi
         5WOM5NCRaBi3jkW3D8BgsLhiKUAN8lHPwqRR7OLU8YoEF4ToZdreaVV5wvEcMpCsPKH1
         iIbg==
X-Gm-Message-State: ABy/qLaTXbK2NXItj8f3hUDk0N+CVV6NIj49po8YzsaA9Hptia8mqgwI
	/N0KqWM0shiK3g8c3Vf+w2Eexw==
X-Google-Smtp-Source: APBJJlFENksIN70Ox7KO10Fsypcj1FJKNqqLpSbBDBOXtyS7l3me2e/S1YHUubPyvwvdVs1ClfxDJQ==
X-Received: by 2002:a17:902:cec6:b0:1b8:53b5:8518 with SMTP id d6-20020a170902cec600b001b853b58518mr1647637plg.63.1689921559181;
        Thu, 20 Jul 2023 23:39:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2.1 2/2] xen: privcmd: Add support for irqfd
Date: Fri, 21 Jul 2023 12:09:06 +0530
Message-Id: <24293535aaac8a84f836c8fc75c6ce4a2c343f16.1689921432.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <c923befe0a016891e7dee3e1ccb3c00d676f2b3d.1689845210.git.viresh.kumar@linaro.org>
References: <c923befe0a016891e7dee3e1ccb3c00d676f2b3d.1689845210.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen provides support for injecting interrupts to the guests via the
HYPERVISOR_dm_op() hypercall. The same is used by the Virtio based
device backend implementations, in an inefficient manner currently.

Generally, the Virtio backends are implemented to work with the Eventfd
based mechanism. In order to make such backends work with Xen, another
software layer needs to poll the Eventfds and raise an interrupt to the
guest using the Xen based mechanism. This results in an extra context
switch.

This is not a new problem in Linux though. It is present with other
hypervisors like KVM, etc. as well. The generic solution implemented in
the kernel for them is to provide an IOCTL call to pass the interrupt
details and eventfd, which lets the kernel take care of polling the
eventfd and raising of the interrupt, instead of handling this in user
space (which involves an extra context switch).

This patch adds support to inject a specific interrupt to guest using
the eventfd mechanism, by preventing the extra context switch.

Inspired by existing implementations for KVM, etc..

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2->V2.1
- Select EVENTFD from Kconfig

V1->V2:
- Improve error handling.
- Remove the unnecessary usage of list_for_each_entry_safe().
- Restrict the use of XEN_DMOP_set_irq_level to only ARM64.

 drivers/xen/Kconfig        |   1 +
 drivers/xen/privcmd.c      | 276 ++++++++++++++++++++++++++++++++++++-
 include/uapi/xen/privcmd.h |  14 ++
 3 files changed, 289 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index d5d7c402b651..7967393c55a4 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -261,6 +261,7 @@ config XEN_SCSI_BACKEND
 config XEN_PRIVCMD
 	tristate "Xen hypercall passthrough driver"
 	depends on XEN
+	select EVENTFD
 	default m
 	help
 	  The hypercall passthrough driver allows privileged user programs to
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index e2f580e30a86..0debc5482253 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -9,11 +9,16 @@
 
 #define pr_fmt(fmt) "xen:" KBUILD_MODNAME ": " fmt
 
+#include <linux/eventfd.h>
+#include <linux/file.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 #include <linux/errno.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
@@ -833,6 +838,257 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 	return rc;
 }
 
+/* Irqfd support */
+static struct workqueue_struct *irqfd_cleanup_wq;
+static DEFINE_MUTEX(irqfds_lock);
+static LIST_HEAD(irqfds_list);
+
+struct privcmd_kernel_irqfd {
+	domid_t dom;
+	u8 level;
+	bool error;
+	u32 irq;
+	struct eventfd_ctx *eventfd;
+	struct work_struct shutdown;
+	wait_queue_entry_t wait;
+	struct list_head list;
+	poll_table pt;
+};
+
+static void irqfd_deactivate(struct privcmd_kernel_irqfd *kirqfd)
+{
+	lockdep_assert_held(&irqfds_lock);
+
+	list_del_init(&kirqfd->list);
+	queue_work(irqfd_cleanup_wq, &kirqfd->shutdown);
+}
+
+static void irqfd_shutdown(struct work_struct *work)
+{
+	struct privcmd_kernel_irqfd *kirqfd =
+		container_of(work, struct privcmd_kernel_irqfd, shutdown);
+	u64 cnt;
+
+	eventfd_ctx_remove_wait_queue(kirqfd->eventfd, &kirqfd->wait, &cnt);
+	eventfd_ctx_put(kirqfd->eventfd);
+	kfree(kirqfd);
+}
+
+static void irqfd_inject(struct privcmd_kernel_irqfd *kirqfd)
+{
+	/* Different architectures support this differently */
+	struct xen_dm_op dm_op = {
+#ifdef CONFIG_ARM64
+		.op = XEN_DMOP_set_irq_level,
+		.u.set_irq_level.irq = kirqfd->irq,
+		.u.set_irq_level.level = kirqfd->level,
+#endif
+	};
+	struct xen_dm_op_buf xbufs = {
+		.size = sizeof(dm_op),
+	};
+	u64 cnt;
+	long rc;
+
+	eventfd_ctx_do_read(kirqfd->eventfd, &cnt);
+	set_xen_guest_handle(xbufs.h, &dm_op);
+
+	xen_preemptible_hcall_begin();
+	rc = HYPERVISOR_dm_op(kirqfd->dom, 1, &xbufs);
+	xen_preemptible_hcall_end();
+
+	/* Don't repeat the error message for consecutive failures */
+	if (rc && !kirqfd->error) {
+		pr_err("Failed to configure irq: %d to level: %d for guest domain: %d\n",
+		       kirqfd->irq, kirqfd->level, kirqfd->dom);
+	}
+
+	kirqfd->error = !!rc;
+}
+
+static int
+irqfd_wakeup(wait_queue_entry_t *wait, unsigned int mode, int sync, void *key)
+{
+	struct privcmd_kernel_irqfd *kirqfd =
+		container_of(wait, struct privcmd_kernel_irqfd, wait);
+	__poll_t flags = key_to_poll(key);
+
+	if (flags & EPOLLIN)
+		irqfd_inject(kirqfd);
+
+	if (flags & EPOLLHUP) {
+		mutex_lock(&irqfds_lock);
+		irqfd_deactivate(kirqfd);
+		mutex_unlock(&irqfds_lock);
+	}
+
+	return 0;
+}
+
+static void
+irqfd_poll_func(struct file *file, wait_queue_head_t *wqh, poll_table *pt)
+{
+	struct privcmd_kernel_irqfd *kirqfd =
+		container_of(pt, struct privcmd_kernel_irqfd, pt);
+
+	add_wait_queue_priority(wqh, &kirqfd->wait);
+}
+
+static int privcmd_irqfd_assign(struct privcmd_irqfd *irqfd)
+{
+	struct privcmd_kernel_irqfd *kirqfd, *tmp;
+	struct eventfd_ctx *eventfd;
+	__poll_t events;
+	struct fd f;
+	int ret;
+
+	kirqfd = kzalloc(sizeof(*kirqfd), GFP_KERNEL);
+	if (!kirqfd)
+		return -ENOMEM;
+
+	kirqfd->irq = irqfd->irq;
+	kirqfd->dom = irqfd->dom;
+	kirqfd->level = irqfd->level;
+	INIT_LIST_HEAD(&kirqfd->list);
+	INIT_WORK(&kirqfd->shutdown, irqfd_shutdown);
+
+	f = fdget(irqfd->fd);
+	if (!f.file) {
+		ret = -EBADF;
+		goto error_kfree;
+	}
+
+	eventfd = eventfd_ctx_fileget(f.file);
+	if (IS_ERR(eventfd)) {
+		ret = PTR_ERR(eventfd);
+		goto error_fd_put;
+	}
+
+	kirqfd->eventfd = eventfd;
+
+	/*
+	 * Install our own custom wake-up handling so we are notified via a
+	 * callback whenever someone signals the underlying eventfd.
+	 */
+	init_waitqueue_func_entry(&kirqfd->wait, irqfd_wakeup);
+	init_poll_funcptr(&kirqfd->pt, irqfd_poll_func);
+
+	mutex_lock(&irqfds_lock);
+
+	list_for_each_entry(tmp, &irqfds_list, list) {
+		if (kirqfd->eventfd == tmp->eventfd) {
+			ret = -EBUSY;
+			mutex_unlock(&irqfds_lock);
+			goto error_eventfd;
+		}
+	}
+
+	list_add_tail(&kirqfd->list, &irqfds_list);
+	mutex_unlock(&irqfds_lock);
+
+	/*
+	 * Check if there was an event already pending on the eventfd before we
+	 * registered, and trigger it as if we didn't miss it.
+	 */
+	events = vfs_poll(f.file, &kirqfd->pt);
+	if (events & EPOLLIN)
+		irqfd_inject(kirqfd);
+
+	/*
+	 * Do not drop the file until the kirqfd is fully initialized, otherwise
+	 * we might race against the EPOLLHUP.
+	 */
+	fdput(f);
+	return 0;
+
+error_eventfd:
+	eventfd_ctx_put(eventfd);
+
+error_fd_put:
+	fdput(f);
+
+error_kfree:
+	kfree(kirqfd);
+	return ret;
+}
+
+static int privcmd_irqfd_deassign(struct privcmd_irqfd *irqfd)
+{
+	struct privcmd_kernel_irqfd *kirqfd;
+	struct eventfd_ctx *eventfd;
+
+	eventfd = eventfd_ctx_fdget(irqfd->fd);
+	if (IS_ERR(eventfd))
+		return PTR_ERR(eventfd);
+
+	mutex_lock(&irqfds_lock);
+
+	list_for_each_entry(kirqfd, &irqfds_list, list) {
+		if (kirqfd->eventfd == eventfd) {
+			irqfd_deactivate(kirqfd);
+			break;
+		}
+	}
+
+	mutex_unlock(&irqfds_lock);
+
+	eventfd_ctx_put(eventfd);
+
+	/*
+	 * Block until we know all outstanding shutdown jobs have completed so
+	 * that we guarantee there will not be any more interrupts once this
+	 * deassign function returns.
+	 */
+	flush_workqueue(irqfd_cleanup_wq);
+
+	return 0;
+}
+
+static long privcmd_ioctl_irqfd(struct file *file, void __user *udata)
+{
+	struct privcmd_data *data = file->private_data;
+	struct privcmd_irqfd irqfd;
+
+	if (copy_from_user(&irqfd, udata, sizeof(irqfd)))
+		return -EFAULT;
+
+	/* No other flags should be set */
+	if (irqfd.flags & ~PRIVCMD_IRQFD_FLAG_DEASSIGN)
+		return -EINVAL;
+
+	/* If restriction is in place, check the domid matches */
+	if (data->domid != DOMID_INVALID && data->domid != irqfd.dom)
+		return -EPERM;
+
+	if (irqfd.flags & PRIVCMD_IRQFD_FLAG_DEASSIGN)
+		return privcmd_irqfd_deassign(&irqfd);
+
+	return privcmd_irqfd_assign(&irqfd);
+}
+
+static int privcmd_irqfd_init(void)
+{
+	irqfd_cleanup_wq = alloc_workqueue("privcmd-irqfd-cleanup", 0, 0);
+	if (!irqfd_cleanup_wq)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void privcmd_irqfd_exit(void)
+{
+	struct privcmd_kernel_irqfd *kirqfd, *tmp;
+
+	mutex_lock(&irqfds_lock);
+
+	list_for_each_entry_safe(kirqfd, tmp, &irqfds_list, list)
+		irqfd_deactivate(kirqfd);
+
+	mutex_unlock(&irqfds_lock);
+
+	destroy_workqueue(irqfd_cleanup_wq);
+}
+
 static long privcmd_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long data)
 {
@@ -868,6 +1124,10 @@ static long privcmd_ioctl(struct file *file,
 		ret = privcmd_ioctl_mmap_resource(file, udata);
 		break;
 
+	case IOCTL_PRIVCMD_IRQFD:
+		ret = privcmd_ioctl_irqfd(file, udata);
+		break;
+
 	default:
 		break;
 	}
@@ -992,15 +1252,27 @@ static int __init privcmd_init(void)
 	err = misc_register(&xen_privcmdbuf_dev);
 	if (err != 0) {
 		pr_err("Could not register Xen hypercall-buf device\n");
-		misc_deregister(&privcmd_dev);
-		return err;
+		goto err_privcmdbuf;
+	}
+
+	err = privcmd_irqfd_init();
+	if (err != 0) {
+		pr_err("irqfd init failed\n");
+		goto err_irqfd;
 	}
 
 	return 0;
+
+err_irqfd:
+	misc_deregister(&xen_privcmdbuf_dev);
+err_privcmdbuf:
+	misc_deregister(&privcmd_dev);
+	return err;
 }
 
 static void __exit privcmd_exit(void)
 {
+	privcmd_irqfd_exit();
 	misc_deregister(&privcmd_dev);
 	misc_deregister(&xen_privcmdbuf_dev);
 }
diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index d2029556083e..47334bb91a09 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -98,6 +98,18 @@ struct privcmd_mmap_resource {
 	__u64 addr;
 };
 
+/* For privcmd_irqfd::flags */
+#define PRIVCMD_IRQFD_FLAG_DEASSIGN (1 << 0)
+
+struct privcmd_irqfd {
+	__u32 fd;
+	__u32 flags;
+	__u32 irq;
+	domid_t dom;
+	__u8 level;
+	__u8 pad;
+};
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -125,5 +137,7 @@ struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(struct privcmd_mmap_resource))
+#define IOCTL_PRIVCMD_IRQFD					\
+	_IOC(_IOC_NONE, 'P', 8, sizeof(struct privcmd_irqfd))
 
 #endif /* __LINUX_PUBLIC_PRIVCMD_H__ */
-- 
2.31.1.272.g89b43f80a514


