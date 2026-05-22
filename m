Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHt1O4p0EGoZXgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:21:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 936285B6CF9
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316989.1586314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRgv-00051I-QI; Fri, 22 May 2026 15:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316989.1586314; Fri, 22 May 2026 15:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRgv-0004z4-N9; Fri, 22 May 2026 15:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1316989;
 Fri, 22 May 2026 15:21:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wQRgt-0004uj-Ky
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:21:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQRgt-0073CX-1x
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:21:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a107474-2eae-0a2a0a5409dd-0a2a4505b378-14
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:21:34 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a10747e-aaa8-0a2a45050019-c387df82c270-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:21:34 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A91746BBD8;
 Fri, 22 May 2026 15:21:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E048593A8;
 Fri, 22 May 2026 15:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7o7QGX50EGrVHwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 22 May 2026 15:21:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779463294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCDUi9/RCG0k6XPy+CbzV9Ct7VcOObJCbIUaokAKjPU=;
	b=ewOWPVBKcmYLjAU7Tr8kN9vFuA5Jbq9hNeqRydeQiqFBUFrbN2jv/DswfEYISBRAhs7+MV
	DjrK4bU2bD359aaojUm1QcL02Rs9tGNzvQUxpvq19tqjcbBVcu1Q4S/3cDFcnYUYQsTbQl
	r41viA0p71FsSdvJ/nPJsJlDPZjWeBw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779463294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCDUi9/RCG0k6XPy+CbzV9Ct7VcOObJCbIUaokAKjPU=;
	b=ewOWPVBKcmYLjAU7Tr8kN9vFuA5Jbq9hNeqRydeQiqFBUFrbN2jv/DswfEYISBRAhs7+MV
	DjrK4bU2bD359aaojUm1QcL02Rs9tGNzvQUxpvq19tqjcbBVcu1Q4S/3cDFcnYUYQsTbQl
	r41viA0p71FsSdvJ/nPJsJlDPZjWeBw=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] x86/xen: Remove Xen debugfs support
Date: Fri, 22 May 2026 17:21:14 +0200
Message-ID: <20260522152114.77319-4-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522152114.77319-1-jgross@suse.com>
References: <20260522152114.77319-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-purgate-ID: tlsNG-c201ff/1779463294-DA374443-8E72E2CF/0/0
X-purgate-type: clean
X-purgate-size: 4613
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:mid,suse.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 936285B6CF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The only Xen file in debugfs is for dumping the p2m table when running
as a Xen PV guest. This might have been useful when the PV code was
young, but there haven't been any p2m related bugs requiring the p2m
dump since ages.

Remove the code and the related config option.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Kind of RFC, as there might be different opinions. The only time I
have used the p2m dump was when I reworked the p2m coding more than
10 years ago.
An alternative would be to make CONFIG_XEN_DEBUG_FS dependant on
CONFIG_XEN_PV and to fix the help text (it is completely wrong, as
it enables neither statistics output, nor tuning options, nor is it
relevant to performance at all - the only existing functionality
isn't mentioned either).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/Kconfig   |  7 -------
 arch/x86/xen/Makefile  |  2 --
 arch/x86/xen/debugfs.c | 16 ---------------
 arch/x86/xen/p2m.c     | 45 ------------------------------------------
 arch/x86/xen/xen-ops.h |  2 --
 5 files changed, 72 deletions(-)
 delete mode 100644 arch/x86/xen/debugfs.c

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index aa4040fd9215..51b53ce66efb 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -65,13 +65,6 @@ config XEN_PVHVM_GUEST
 	help
 	  Support running as a Xen PVHVM guest.
 
-config XEN_DEBUG_FS
-	bool "Enable Xen debug and tuning parameters in debugfs"
-	depends on XEN && DEBUG_FS
-	help
-	  Enable statistics output and various tuning options in debugfs.
-	  Enabling this option may incur a significant performance overhead.
-
 config XEN_PVH
 	bool "Xen PVH guest support"
 	depends on XEN && XEN_PVHVM && ACPI
diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index a9ec8c9f5c5d..717264ae269b 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -43,8 +43,6 @@ obj-$(CONFIG_XEN_PVHVM_SMP)  	+= smp_hvm.o
 
 obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= spinlock.o
 
-obj-$(CONFIG_XEN_DEBUG_FS)	+= debugfs.o
-
 obj-$(CONFIG_XEN_DOM0)		+= vga.o
 
 obj-$(CONFIG_XEN_EFI)		+= efi.o
diff --git a/arch/x86/xen/debugfs.c b/arch/x86/xen/debugfs.c
deleted file mode 100644
index b8c9f2a7d9b6..000000000000
--- a/arch/x86/xen/debugfs.c
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/init.h>
-#include <linux/debugfs.h>
-#include <linux/slab.h>
-
-#include "xen-ops.h"
-
-static struct dentry *d_xen_debug;
-
-struct dentry * __init xen_init_debugfs(void)
-{
-	if (!d_xen_debug)
-		d_xen_debug = debugfs_create_dir("xen", NULL);
-	return d_xen_debug;
-}
-
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 2dd12b61a230..d007ccf6e7a1 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -883,48 +883,3 @@ void __init xen_add_remap_nonram(phys_addr_t maddr, phys_addr_t paddr,
 
 	nr_nonram_remap++;
 }
-
-#ifdef CONFIG_XEN_DEBUG_FS
-#include <linux/debugfs.h>
-static int p2m_dump_show(struct seq_file *m, void *v)
-{
-	static const char * const type_name[] = {
-				[P2M_TYPE_IDENTITY] = "identity",
-				[P2M_TYPE_MISSING] = "missing",
-				[P2M_TYPE_PFN] = "pfn",
-				[P2M_TYPE_UNKNOWN] = "abnormal"};
-	unsigned long pfn, first_pfn;
-	int type, prev_type;
-
-	prev_type = xen_p2m_elem_type(0);
-	first_pfn = 0;
-
-	for (pfn = 0; pfn < xen_p2m_size; pfn++) {
-		type = xen_p2m_elem_type(pfn);
-		if (type != prev_type) {
-			seq_printf(m, " [0x%lx->0x%lx] %s\n", first_pfn, pfn,
-				   type_name[prev_type]);
-			prev_type = type;
-			first_pfn = pfn;
-		}
-	}
-	seq_printf(m, " [0x%lx->0x%lx] %s\n", first_pfn, pfn,
-		   type_name[prev_type]);
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(p2m_dump);
-
-static struct dentry *d_mmu_debug;
-
-static int __init xen_p2m_debugfs(void)
-{
-	struct dentry *d_xen = xen_init_debugfs();
-
-	d_mmu_debug = debugfs_create_dir("mmu", d_xen);
-
-	debugfs_create_file("p2m", 0600, d_mmu_debug, NULL, &p2m_dump_fops);
-	return 0;
-}
-fs_initcall(xen_p2m_debugfs);
-#endif /* CONFIG_XEN_DEBUG_FS */
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index a27ab1f50cf9..6808010ac379 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -254,8 +254,6 @@ static inline void xen_hvm_post_suspend(int suspend_cancelled) {}
 
 void xen_add_extra_mem(unsigned long start_pfn, unsigned long n_pfns);
 
-struct dentry * __init xen_init_debugfs(void);
-
 bool __set_phys_to_machine(unsigned long pfn, unsigned long mfn);
 void xen_hvm_init_mmu_ops(void);
 
-- 
2.54.0


