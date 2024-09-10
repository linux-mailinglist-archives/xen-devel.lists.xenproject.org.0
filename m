Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D697345E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795327.1204660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyI3-00084j-7m; Tue, 10 Sep 2024 10:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795327.1204660; Tue, 10 Sep 2024 10:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyI3-000822-2F; Tue, 10 Sep 2024 10:40:07 +0000
Received: by outflank-mailman (input) for mailman id 795327;
 Tue, 10 Sep 2024 10:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1snyI2-0005DK-C4
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:40:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a31dd94-6f61-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:40:04 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5800421A38;
 Tue, 10 Sep 2024 10:40:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C687132CB;
 Tue, 10 Sep 2024 10:40:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aZefAQQi4GblYwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 10 Sep 2024 10:40:04 +0000
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
X-Inumbo-ID: 0a31dd94-6f61-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1725964804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1OTBnbU0Cg6MUB5ceFz53X47rGkxeO4kHY4qHKG4c9Y=;
	b=NCFDhewe+Ku8mZ4IijmGn7g9aanmVpHhRPtUd8D+fOlOetOjF678GjDnCuWQrMAqDLrtnn
	m3gu22qPVXbiOYUiNHrXKzgpYMD4UtKyjA4sJ/dy4j3QU4QJ+wgtYrs33JbNTqDLof4Mvu
	mMhrWRI0AJQ8F7QHuIp5QiOpqt7NMXI=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1725964804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1OTBnbU0Cg6MUB5ceFz53X47rGkxeO4kHY4qHKG4c9Y=;
	b=NCFDhewe+Ku8mZ4IijmGn7g9aanmVpHhRPtUd8D+fOlOetOjF678GjDnCuWQrMAqDLrtnn
	m3gu22qPVXbiOYUiNHrXKzgpYMD4UtKyjA4sJ/dy4j3QU4QJ+wgtYrs33JbNTqDLof4Mvu
	mMhrWRI0AJQ8F7QHuIp5QiOpqt7NMXI=
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
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 5/7] xen: add capability to remap non-RAM pages to different PFNs
Date: Tue, 10 Sep 2024 12:39:30 +0200
Message-ID: <20240910103932.7634-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910103932.7634-1-jgross@suse.com>
References: <20240910103932.7634-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

When running as a Xen PV dom0 it can happen that the kernel is being
loaded to a guest physical address conflicting with the host memory
map.

In order to be able to resolve this conflict, add the capability to
remap non-RAM areas to different guest PFNs. A function to use this
remapping information for other purposes than doing the remap will be
added when needed.

As the number of conflicts should be rather low (currently only
machines with max. 1 conflict are known), save the remap data in a
small statically allocated array.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- split off from patch 5 of V1 of the series
- moved to p2m.c
V3:
- add const qualifier (Jan Beulich)
- change remap size type to size_t (Jan Beulich)
- add __ro_after_init qualifier (Jan Beulich)
- log frame numbers in hex (Jan Beulich)
- always issue message regarding number of remapped pages (Jan Beulich)
- add sanity check (Jan Beulich)
- fix remap loop (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/p2m.c     | 65 ++++++++++++++++++++++++++++++++++++++++++
 arch/x86/xen/xen-ops.h |  3 ++
 2 files changed, 68 insertions(+)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 7c735b730acd..5b2aeae6f9e4 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -80,6 +80,7 @@
 #include <asm/xen/hypervisor.h>
 #include <xen/balloon.h>
 #include <xen/grant_table.h>
+#include <xen/hvc-console.h>
 
 #include "xen-ops.h"
 
@@ -792,6 +793,70 @@ int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
 	return ret;
 }
 
+/* Remapped non-RAM areas */
+#define NR_NONRAM_REMAP 4
+static struct nonram_remap {
+	phys_addr_t maddr;
+	phys_addr_t paddr;
+	size_t size;
+} xen_nonram_remap[NR_NONRAM_REMAP] __ro_after_init;
+static unsigned int nr_nonram_remap __ro_after_init;
+
+/*
+ * Do the real remapping of non-RAM regions as specified in the
+ * xen_nonram_remap[] array.
+ * In case of an error just crash the system.
+ */
+void __init xen_do_remap_nonram(void)
+{
+	unsigned int i;
+	unsigned int remapped = 0;
+	const struct nonram_remap *remap = xen_nonram_remap;
+	unsigned long pfn, mfn, end_pfn;
+
+	for (i = 0; i < nr_nonram_remap; i++) {
+		end_pfn = PFN_UP(remap->paddr + remap->size);
+		pfn = PFN_DOWN(remap->paddr);
+		mfn = PFN_DOWN(remap->maddr);
+		while (pfn < end_pfn) {
+			if (!set_phys_to_machine(pfn, mfn)) {
+				pr_err("Failed to set p2m mapping for pfn=%lx mfn=%lx\n",
+				       pfn, mfn);
+				BUG();
+			}
+
+			pfn++;
+			mfn++;
+			remapped++;
+		}
+
+		remap++;
+	}
+
+	pr_info("Remapped %u non-RAM page(s)\n", remapped);
+}
+
+/*
+ * Add a new non-RAM remap entry.
+ * In case of no free entry found, just crash the system.
+ */
+void __init xen_add_remap_nonram(phys_addr_t maddr, phys_addr_t paddr,
+				 unsigned long size)
+{
+	BUG_ON((maddr & ~PAGE_MASK) != (paddr & ~PAGE_MASK));
+
+	if (nr_nonram_remap == NR_NONRAM_REMAP) {
+		xen_raw_console_write("Number of required E820 entry remapping actions exceed maximum value\n");
+		BUG();
+	}
+
+	xen_nonram_remap[nr_nonram_remap].maddr = maddr;
+	xen_nonram_remap[nr_nonram_remap].paddr = paddr;
+	xen_nonram_remap[nr_nonram_remap].size = size;
+
+	nr_nonram_remap++;
+}
+
 #ifdef CONFIG_XEN_DEBUG_FS
 #include <linux/debugfs.h>
 static int p2m_dump_show(struct seq_file *m, void *v)
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 9a27d1d653d3..e1b782e823e6 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -47,6 +47,9 @@ void xen_mm_unpin_all(void);
 #ifdef CONFIG_X86_64
 void __init xen_relocate_p2m(void);
 #endif
+void __init xen_do_remap_nonram(void);
+void __init xen_add_remap_nonram(phys_addr_t maddr, phys_addr_t paddr,
+				 unsigned long size);
 
 void __init xen_chk_is_e820_usable(phys_addr_t start, phys_addr_t size,
 				   const char *component);
-- 
2.43.0


