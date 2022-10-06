Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7410D5F6185
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 09:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416628.661299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogL6I-0004z6-4U; Thu, 06 Oct 2022 07:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416628.661299; Thu, 06 Oct 2022 07:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogL6I-0004xF-00; Thu, 06 Oct 2022 07:15:22 +0000
Received: by outflank-mailman (input) for mailman id 416628;
 Thu, 06 Oct 2022 07:15:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogL6H-0004aP-4F
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 07:15:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2ef4024-4546-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 09:15:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1BC02219B0;
 Thu,  6 Oct 2022 07:15:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B51CE1376E;
 Thu,  6 Oct 2022 07:15:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MqLUKoeAPmNJEwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Oct 2022 07:15:19 +0000
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
X-Inumbo-ID: a2ef4024-4546-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665040520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ps9KwyB3HzeWHTtk+TkXmbcFpLo/S34tHtBoU7GquI=;
	b=mqv/aQ0xhf3jHn27YkkjHI6JbMnzF0R/hfiYz+yvCI+4IpL/79Wa0CyW8t1leaae0aWx3m
	uHS7KHzrKvYdOxsxpiBr+vlF4gxQSdJ2xILjF6blKUTRNxvsgaQNfGLfyfkbRvGFjuUMEd
	4QKwMuqh9zjDVwgXZYgeQ0aTcivnjro=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] xen/virtio: enable grant based virtio on x86
Date: Thu,  6 Oct 2022 09:15:00 +0200
Message-Id: <20221006071500.15689-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221006071500.15689-1-jgross@suse.com>
References: <20221006071500.15689-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use an x86-specific virtio_check_mem_acc_cb() for Xen in order to setup
the correct DMA ops.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_hvm.c |  2 +-
 arch/x86/xen/enlighten_pv.c  |  2 +-
 drivers/xen/grant-dma-ops.c  | 10 ++++++++++
 include/xen/xen-ops.h        |  1 +
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 1c1ac418484b..c1cd28e915a3 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -212,7 +212,7 @@ static void __init xen_hvm_guest_init(void)
 		return;
 
 	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT))
-		virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
+		virtio_set_mem_acc_cb(xen_virtio_restricted_mem_acc);
 
 	init_hvm_pv_info();
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 9b1a58dda935..45b24c1b646a 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -112,7 +112,7 @@ static void __init xen_pv_init_platform(void)
 {
 	/* PV guests can't operate virtio devices without grants. */
 	if (IS_ENABLED(CONFIG_XEN_VIRTIO))
-		virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
+		virtio_set_mem_acc_cb(xen_virtio_restricted_mem_acc);
 
 	populate_extra_pte(fix_to_virt(FIX_PARAVIRT_BOOTMAP));
 
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index a00112235877..60a7acc334ed 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -372,6 +372,16 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	dev_err(dev, "Cannot set up Xen grant DMA ops, retain platform DMA ops\n");
 }
 
+bool xen_virtio_restricted_mem_acc(struct virtio_device *dev)
+{
+	bool ret = xen_virtio_mem_acc(dev);
+
+	if (ret)
+		xen_grant_setup_dma_ops(dev->dev.parent);
+
+	return ret;
+}
+
 MODULE_DESCRIPTION("Xen grant DMA-mapping layer");
 MODULE_AUTHOR("Juergen Gross <jgross@suse.com>");
 MODULE_LICENSE("GPL");
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index dae0f350c678..3dd5aa936f1d 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -219,6 +219,7 @@ static inline void xen_preemptible_hcall_end(void) { }
 void xen_grant_setup_dma_ops(struct device *dev);
 bool xen_is_grant_dma_device(struct device *dev);
 bool xen_virtio_mem_acc(struct virtio_device *dev);
+bool xen_virtio_restricted_mem_acc(struct virtio_device *dev);
 #else
 static inline void xen_grant_setup_dma_ops(struct device *dev)
 {
-- 
2.35.3


