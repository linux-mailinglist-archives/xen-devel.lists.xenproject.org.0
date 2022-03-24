Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE04E601D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 09:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294184.500041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXIas-0006xP-Oo; Thu, 24 Mar 2022 08:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294184.500041; Thu, 24 Mar 2022 08:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXIas-0006v8-K2; Thu, 24 Mar 2022 08:13:18 +0000
Received: by outflank-mailman (input) for mailman id 294184;
 Thu, 24 Mar 2022 08:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+IHq=UD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nXIar-0006ux-Jj
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 08:13:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4193b57c-ab4a-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 09:13:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1F23210E4;
 Thu, 24 Mar 2022 08:13:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E16613B98;
 Thu, 24 Mar 2022 08:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WNGZGRsoPGIpEwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Mar 2022 08:13:15 +0000
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
X-Inumbo-ID: 4193b57c-ab4a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648109595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRQkQM3nkX048Co0Ei4MgctIFOzk/2kWV1vK88mLPKE=;
	b=ncIXpUgOyhiseKvoEXjWOT0jwyemrN8QMJ8gtYurzvzUcqlZNE5X185rc2LH262IeZPhAH
	nIJEI0QJ8mrmnBd3DpF5KE+udbPfehWKhEIjrUeqJ9SepvIsRzuhDrM+XAntq2EaWeJZx3
	Jznq39XSKVAMEIwLXD2vhbkwL7quw/I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 01/10] xen/arm: rename do_phydev_op() to do_arm_physdev_op()
Date: Thu, 24 Mar 2022 09:13:03 +0100
Message-Id: <20220324081312.18222-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220324081312.18222-1-jgross@suse.com>
References: <20220324081312.18222-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_physdev_op() prototypes on Arm and x86 differ in their return type,
so rename the Arm one in order to prepare using a common generated
header file.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
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
index 11f970d926..43f30747cf 100644
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


