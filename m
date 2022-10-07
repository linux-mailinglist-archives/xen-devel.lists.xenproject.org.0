Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536F5F744E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 08:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417409.662135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogh3d-0002Ms-Pq; Fri, 07 Oct 2022 06:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417409.662135; Fri, 07 Oct 2022 06:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogh3d-0002JO-KX; Fri, 07 Oct 2022 06:42:05 +0000
Received: by outflank-mailman (input) for mailman id 417409;
 Fri, 07 Oct 2022 06:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogh3c-0001O7-8Q
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 06:42:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2729d57f-460b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 08:42:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49B921F8A8;
 Fri,  7 Oct 2022 06:42:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF47A13A3D;
 Fri,  7 Oct 2022 06:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rb3eLDrKP2P+SQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Oct 2022 06:42:02 +0000
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
X-Inumbo-ID: 2729d57f-460b-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665124923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7rX4NNfG5xbGtkfHQ3yryrnm26fT7MI5fpGm+XeZVo=;
	b=StxRIPs7AKtt4D0aOz64z0LpwokqK4ZWIDpbns1hmPaE3IuoSO6t7p30tXIYHDHYMDSIve
	eSdTcsGlR/qc2tGcmsUYg/Ya6wjb4gLkx9+rmMkxmAEKGMsR80426ZF+eyUYbCclA2gsKE
	b9KQmEMxe5EKcqEuSNSMSFbWYWlYwRg=
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
Subject: [PATCH v2 3/3] xen/virtio: enable grant based virtio on x86
Date: Fri,  7 Oct 2022 08:41:43 +0200
Message-Id: <20221007064143.10049-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221007064143.10049-1-jgross@suse.com>
References: <20221007064143.10049-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use an x86-specific virtio_check_mem_acc_cb() for Xen in order to setup
the correct DMA ops.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add missing PV check in xen_virtio_mem_acc() (Oleksandr Tyshchenko)
- add xen_virtio_restricted_mem_acc() stub (Oleksandr Tyshchenko)
---
 arch/x86/xen/enlighten_hvm.c |  2 +-
 arch/x86/xen/enlighten_pv.c  |  2 +-
 drivers/xen/grant-dma-ops.c  | 12 +++++++++++-
 include/xen/xen-ops.h        |  6 ++++++
 4 files changed, 19 insertions(+), 3 deletions(-)

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
index c703b77b33c9..63c3f0dac066 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -297,7 +297,7 @@ bool xen_is_grant_dma_device(struct device *dev)
 
 bool xen_virtio_mem_acc(struct virtio_device *dev)
 {
-	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT))
+	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain())
 		return true;
 
 	return xen_is_grant_dma_device(dev->dev.parent);
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
index dae0f350c678..a34f4271a2e9 100644
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
@@ -234,6 +235,11 @@ static inline bool xen_virtio_mem_acc(struct virtio_device *dev)
 {
 	return false;
 }
+
+static inline bool xen_virtio_restricted_mem_acc(struct virtio_device *dev)
+{
+	return false;
+}
 #endif /* CONFIG_XEN_GRANT_DMA_OPS */
 
 #endif /* INCLUDE_XEN_OPS_H */
-- 
2.35.3


