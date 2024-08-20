Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF509580CC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780139.1189767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgK6n-0001pr-3L; Tue, 20 Aug 2024 08:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780139.1189767; Tue, 20 Aug 2024 08:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgK6m-0001n5-Vt; Tue, 20 Aug 2024 08:20:52 +0000
Received: by outflank-mailman (input) for mailman id 780139;
 Tue, 20 Aug 2024 08:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bKv/=PT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sgK6l-0007ny-PP
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:20:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bffdcbf-5ecd-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 10:20:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17AC32253C;
 Tue, 20 Aug 2024 08:20:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ABCFB13A17;
 Tue, 20 Aug 2024 08:20:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EhB9KOFRxGbIKwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 20 Aug 2024 08:20:49 +0000
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
X-Inumbo-ID: 1bffdcbf-5ecd-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1724142050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1k9ZAtPeUmpOdU1rHd9Jn9Q4sZ5l1eGaWrOuL1YLFsk=;
	b=QcZPiNlniKs3SAqJPfQCQX2AUHxnNnLom/mfporth+idthV/6j0mIKq8feTDkjFhM1HacA
	7Eb4p1nl2f+1qHFO1tdL9HFBUiderZDZH0vQEtKRpYN7769wRjV6JUiwAifXcM7KRqnZnL
	CR9WJ+UVehcS1Wm5eLoTbHgPjlqPRJ0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QcZPiNln
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1724142050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1k9ZAtPeUmpOdU1rHd9Jn9Q4sZ5l1eGaWrOuL1YLFsk=;
	b=QcZPiNlniKs3SAqJPfQCQX2AUHxnNnLom/mfporth+idthV/6j0mIKq8feTDkjFhM1HacA
	7Eb4p1nl2f+1qHFO1tdL9HFBUiderZDZH0vQEtKRpYN7769wRjV6JUiwAifXcM7KRqnZnL
	CR9WJ+UVehcS1Wm5eLoTbHgPjlqPRJ0=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-acpi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 6/7] xen: allow mapping ACPI data using a different physical address
Date: Tue, 20 Aug 2024 10:20:11 +0200
Message-ID: <20240820082012.31316-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820082012.31316-1-jgross@suse.com>
References: <20240820082012.31316-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 17AC32253C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

When running as a Xen PV dom0 the system needs to map ACPI data of the
host using host physical addresses, while those addresses can conflict
with the guest physical addresses of the loaded linux kernel.

This conflict can be solved by mapping the ACPI data to a different
guest physical address, but mapping the data via acpi_os_ioremap()
must still be possible using the host physical address, as this
address might be generated by AML when referencing some of the ACPI
data.

When configured to support running as a Xen PV dom0, have an
implementation of acpi_os_ioremap() being aware of the possibility to
need above mentioned translation of a host physical address to the
guest physical address.

This modification requires to fix some #include of asm/acpi.h in x86
code to use linux/acpi.h instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch (Jan Beulich)
---
 arch/x86/include/asm/acpi.h        |  8 ++++++++
 arch/x86/kernel/acpi/boot.c        | 10 ++++++++++
 arch/x86/kernel/mmconf-fam10h_64.c |  2 +-
 arch/x86/kernel/x86_init.c         |  2 +-
 arch/x86/xen/p2m.c                 | 30 ++++++++++++++++++++++++++++++
 arch/x86/xen/setup.c               |  2 +-
 6 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index 21bc53f5ed0c..42067643e615 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -174,6 +174,14 @@ void acpi_generic_reduced_hw_init(void);
 void x86_default_set_root_pointer(u64 addr);
 u64 x86_default_get_root_pointer(void);
 
+#ifdef CONFIG_XEN_PV_DOM0
+/* A Xen PV dom0 needs a special acpi_os_ioremap() handling. */
+extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
+					 acpi_size size);
+void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
+#define acpi_os_ioremap acpi_os_ioremap
+#endif
+
 #else /* !CONFIG_ACPI */
 
 #define acpi_lapic 0
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 9f4618dcd704..6dd01d15f277 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -1778,3 +1778,13 @@ u64 x86_default_get_root_pointer(void)
 {
 	return boot_params.acpi_rsdp_addr;
 }
+
+#ifdef CONFIG_XEN_PV_DOM0
+void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
+{
+	return ioremap_cache(phys, size);
+}
+
+void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys, acpi_size size) =
+	x86_acpi_os_ioremap;
+#endif
diff --git a/arch/x86/kernel/mmconf-fam10h_64.c b/arch/x86/kernel/mmconf-fam10h_64.c
index c94dec6a1834..8347a29f9db4 100644
--- a/arch/x86/kernel/mmconf-fam10h_64.c
+++ b/arch/x86/kernel/mmconf-fam10h_64.c
@@ -9,12 +9,12 @@
 #include <linux/pci.h>
 #include <linux/dmi.h>
 #include <linux/range.h>
+#include <linux/acpi.h>
 
 #include <asm/pci-direct.h>
 #include <linux/sort.h>
 #include <asm/io.h>
 #include <asm/msr.h>
-#include <asm/acpi.h>
 #include <asm/mmconfig.h>
 #include <asm/pci_x86.h>
 
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index 82b128d3f309..47ef8af23101 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -8,8 +8,8 @@
 #include <linux/ioport.h>
 #include <linux/export.h>
 #include <linux/pci.h>
+#include <linux/acpi.h>
 
-#include <asm/acpi.h>
 #include <asm/bios_ebda.h>
 #include <asm/paravirt.h>
 #include <asm/pci_x86.h>
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index bb55e0fe1a04..61aaf066bf3e 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -70,6 +70,7 @@
 #include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/acpi.h>
 
 #include <asm/cache.h>
 #include <asm/setup.h>
@@ -838,6 +839,31 @@ void __init xen_do_remap_nonram(void)
 	pr_info("Remapped %u non-RAM page(s)\n", remapped);
 }
 
+/*
+ * Xen variant of acpi_os_ioremap() taking potentially remapped non-RAM
+ * regions into acount.
+ * Any attempt to map an area crossing a remap boundary will produce a
+ * WARN() splat.
+ */
+static void __iomem *xen_acpi_os_ioremap(acpi_physical_address phys,
+					 acpi_size size)
+{
+	unsigned int i;
+	struct nonram_remap *remap = xen_nonram_remap;
+
+	for (i = 0; i < nr_nonram_remap; i++) {
+		if (phys + size > remap->maddr &&
+		    phys < remap->maddr + remap->size) {
+			WARN_ON(phys < remap->maddr ||
+				phys + size > remap->maddr + remap->size);
+			phys = remap->paddr + phys - remap->maddr;
+			break;
+		}
+	}
+
+	return x86_acpi_os_ioremap(phys, size);
+}
+
 /*
  * Add a new non-RAM remap entry.
  * In case of no free entry found, just crash the system.
@@ -850,6 +876,10 @@ void __init xen_add_remap_nonram(phys_addr_t maddr, phys_addr_t paddr,
 		BUG();
 	}
 
+	/* Switch to the Xen acpi_os_ioremap() variant. */
+	if (nr_nonram_remap == 0)
+		acpi_os_ioremap = xen_acpi_os_ioremap;
+
 	xen_nonram_remap[nr_nonram_remap].maddr = maddr;
 	xen_nonram_remap[nr_nonram_remap].paddr = paddr;
 	xen_nonram_remap[nr_nonram_remap].size = size;
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index d678c0330971..88b2ebd23da3 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -15,12 +15,12 @@
 #include <linux/cpuidle.h>
 #include <linux/cpufreq.h>
 #include <linux/memory_hotplug.h>
+#include <linux/acpi.h>
 
 #include <asm/elf.h>
 #include <asm/vdso.h>
 #include <asm/e820/api.h>
 #include <asm/setup.h>
-#include <asm/acpi.h>
 #include <asm/numa.h>
 #include <asm/idtentry.h>
 #include <asm/xen/hypervisor.h>
-- 
2.43.0


