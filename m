Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE34D41DF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 08:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288151.488617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJc-0000gp-21; Thu, 10 Mar 2022 07:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288151.488617; Thu, 10 Mar 2022 07:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJb-0000c5-Qn; Thu, 10 Mar 2022 07:34:27 +0000
Received: by outflank-mailman (input) for mailman id 288151;
 Thu, 10 Mar 2022 07:34:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHx9=TV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSDJa-0000ZQ-AR
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 07:34:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82788018-a044-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 08:34:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AEF8B1F443;
 Thu, 10 Mar 2022 07:34:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 806F413FA3;
 Thu, 10 Mar 2022 07:34:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yHLoHQCqKWIkIAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Mar 2022 07:34:24 +0000
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
X-Inumbo-ID: 82788018-a044-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646897664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LH5iekQAujtfbCT5ppRY8SHnDyE773eE100u+22phKg=;
	b=fNXoM2VvH1hDPn2/XMCrGU0trY+SNYGEIxO658FKhJA0Eo1c2RLvAmkXnqVsq7z2OGIfof
	c0a+tIf/rIoixdf64gF6eLSIp2UzbEfCNrDL4hWI+g+uz0tAUhFeSh8DfNdEv0FkXZbicS
	KBreRyro5YcrP018qp4ekZqG2/BoFFc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 01/11] xen/arm: rename do_phydev_op() to do_arm_physdev_op()
Date: Thu, 10 Mar 2022 08:34:10 +0100
Message-Id: <20220310073420.15622-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310073420.15622-1-jgross@suse.com>
References: <20220310073420.15622-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_physdev_op() prototypes on Arm and x86 differ in their return type,
so rename the Arm one in order to prepare using a common generated
header file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 xen/arch/arm/include/asm/hypercall.h | 2 +-
 xen/arch/arm/physdev.c               | 2 +-
 xen/arch/arm/traps.c                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
index a0c5a31a2f..39d2e7889d 100644
--- a/xen/arch/arm/include/asm/hypercall.h
+++ b/xen/arch/arm/include/asm/hypercall.h
@@ -2,7 +2,7 @@
 #define __ASM_ARM_HYPERCALL_H__
 
 #include <public/domctl.h> /* for arch_do_domctl */
-int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+int do_arm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
 long do_arm_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg);
 
diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index f9aa274dda..95a8cdc0ee 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -11,7 +11,7 @@
 #include <xen/hypercall.h>
 
 
-int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+int do_arm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
 #ifdef CONFIG_HAS_PCI
     return pci_physdev_op(cmd, arg);
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 7a1b679b8c..f8c3ef0ca2 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1371,7 +1371,7 @@ static arm_hypercall_t arm_hypercall_table[] = {
     HYPERCALL(xsm_op, 1),
     HYPERCALL(event_channel_op, 2),
     HYPERCALL_DEPRECATED(event_channel_op_compat, 1),
-    HYPERCALL(physdev_op, 2),
+    HYPERCALL_ARM(physdev_op, 2),
     HYPERCALL_DEPRECATED(physdev_op_compat, 1),
     HYPERCALL(sysctl, 2),
     HYPERCALL(hvm_op, 2),
-- 
2.34.1


