Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4FE94A5E6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 12:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773385.1183861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbe6z-0004w2-1B; Wed, 07 Aug 2024 10:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773385.1183861; Wed, 07 Aug 2024 10:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbe6y-0004tQ-TV; Wed, 07 Aug 2024 10:41:44 +0000
Received: by outflank-mailman (input) for mailman id 773385;
 Wed, 07 Aug 2024 10:41:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sbe6y-0003I0-1R
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 10:41:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e7a1a5-54a9-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 12:41:43 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E24351F38C;
 Wed,  7 Aug 2024 10:41:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 803AB13297;
 Wed,  7 Aug 2024 10:41:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DVfIHWZPs2Y9IgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Aug 2024 10:41:42 +0000
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
X-Inumbo-ID: a2e7a1a5-54a9-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723027302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu33IF37KPV2peySpoH2AKulwBtPRZshtpTGtlDrC4o=;
	b=m0w7vF4UF9VBkwcbgKeJEkLaQfkFICc7DrOR73PQmWVbjIhve+gSA1r7kmLJH60K/SXQ5q
	9JatpbIuObHmzIz8s7IvNf/DheM0hxg3ru6+5S0XE/yPUaI19Ar1nynPwEyQtOEgme+J34
	KFd9vXZ88IUg0jUpqcCc3BAOkhiSkjg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723027302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu33IF37KPV2peySpoH2AKulwBtPRZshtpTGtlDrC4o=;
	b=m0w7vF4UF9VBkwcbgKeJEkLaQfkFICc7DrOR73PQmWVbjIhve+gSA1r7kmLJH60K/SXQ5q
	9JatpbIuObHmzIz8s7IvNf/DheM0hxg3ru6+5S0XE/yPUaI19Ar1nynPwEyQtOEgme+J34
	KFd9vXZ88IUg0jUpqcCc3BAOkhiSkjg=
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
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 5/5] xen: tolerate ACPI NVS memory overlapping with Xen allocated memory
Date: Wed,  7 Aug 2024 12:41:10 +0200
Message-ID: <20240807104110.18117-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807104110.18117-1-jgross@suse.com>
References: <20240807104110.18117-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-7.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,invisiblethingslab.com:email]
X-Spam-Score: -7.30
X-Spam-Flag: NO
X-Spam-Level: 

In order to minimize required special handling for running as Xen PV
dom0, the memory layout is modified to match that of the host. This
requires to have only RAM at the locations where Xen allocated memory
is living. Unfortunately there seem to be some machines, where ACPI
NVS is located at 64 MB, resulting in a conflict with the loaded
kernel or the initial page tables built by Xen.

As ACPI NVS needs to be accessed by the kernel only for saving and
restoring it across suspend operations, it can be relocated in the
dom0's memory map by swapping it with unused RAM (this is possible
via modification of the dom0 P2M map).

While the E820 map can (and should) be modified right away, the P2M
map can be updated only after memory allocation is working, as the P2M
map might need to be extended.

Fixes: 808fdb71936c ("xen: check for kernel memory conflicting with memory layout")
Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 arch/x86/xen/setup.c | 133 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 132 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index d678c0330971..dbb5d13ca61a 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -49,6 +49,15 @@ static struct e820_table xen_e820_table __initdata;
 /* Number of initially usable memory pages. */
 static unsigned long ini_nr_pages __initdata;
 
+/* Remapped non-RAM areas */
+#define NR_NONRAM_REMAP 4
+static struct nonram_remap {
+	unsigned long maddr;
+	unsigned long size;
+	unsigned long paddr;
+} xen_nonram_remap[NR_NONRAM_REMAP] __initdata;
+static unsigned int nr_nonram_remap __initdata;
+
 /*
  * Buffer used to remap identity mapped pages. We only need the virtual space.
  * The physical page behind this address is remapped as needed to different
@@ -452,6 +461,8 @@ static unsigned long __init xen_foreach_remap_area(
  * to be remapped memory itself in a linked list anchored at xen_remap_mfn.
  * This scheme allows to remap the different chunks in arbitrary order while
  * the resulting mapping will be independent from the order.
+ * In case xen_e820_resolve_conflicts() did relocate some non-RAM E820
+ * entries, set the correct P2M information for the affected pages.
  */
 void __init xen_remap_memory(void)
 {
@@ -495,6 +506,29 @@ void __init xen_remap_memory(void)
 	set_pte_mfn(buf, mfn_save, PAGE_KERNEL);
 
 	pr_info("Remapped %ld page(s)\n", remapped);
+
+	if (nr_nonram_remap == 0)
+		return;
+
+	remapped = 0;
+	for (i = 0; i < nr_nonram_remap; i++) {
+		struct nonram_remap *remap = xen_nonram_remap + i;
+
+		pfn = PFN_DOWN(remap->paddr);
+		mfn_save = PFN_DOWN(remap->maddr);
+		for (len = 0; len < remap->size; len += PAGE_SIZE) {
+			if (!set_phys_to_machine(pfn, mfn_save)) {
+				WARN(1, "Failed to set p2m mapping for pfn=%ld mfn=%ld\n",
+				     pfn, mfn_save);
+				BUG();
+			}
+			pfn++;
+			mfn_save++;
+			remapped++;
+		}
+	}
+
+	pr_info("Remapped %ld non-RAM page(s)\n", remapped);
 }
 
 static unsigned long __init xen_get_pages_limit(void)
@@ -625,14 +659,111 @@ phys_addr_t __init xen_find_free_area(phys_addr_t size)
 	return 0;
 }
 
+/*
+ * Swap a non-RAM E820 map entry with RAM above ini_nr_pages.
+ * Note that the E820 map is modified accordingly, but the P2M map isn't yet.
+ * The adaption of the P2M must be deferred until page allocation is possible.
+ */
+static void __init xen_e820_swap_entry_with_ram(struct e820_entry *swap_entry)
+{
+	struct e820_entry *entry;
+	unsigned int mapcnt;
+	phys_addr_t mem_end = PFN_PHYS(ini_nr_pages);
+	struct nonram_remap *remap;
+	phys_addr_t swap_addr, swap_size, entry_end;
+
+	if (nr_nonram_remap == NR_NONRAM_REMAP) {
+		xen_raw_console_write("Number of required E820 entry remapping actions exceed maximum value\n");
+		BUG();
+	}
+
+	swap_addr = PAGE_ALIGN_DOWN(swap_entry->addr);
+	swap_size = PAGE_ALIGN(swap_entry->addr - swap_addr + swap_entry->size);
+	remap = xen_nonram_remap + nr_nonram_remap;
+	entry = xen_e820_table.entries;
+
+	for (mapcnt = 0; mapcnt < xen_e820_table.nr_entries; mapcnt++) {
+		entry_end = entry->addr + entry->size;
+		if (entry->type == E820_TYPE_RAM && entry->size >= swap_size &&
+		    entry_end - swap_size >= mem_end) {
+			/* Reduce RAM entry by needed space (whole pages). */
+			entry->size -= swap_size;
+
+			/* Add new entry at the end of E820 map. */
+			entry = xen_e820_table.entries +
+				xen_e820_table.nr_entries;
+			xen_e820_table.nr_entries++;
+
+			/* Fill new entry (keep size and page offset). */
+			entry->type = swap_entry->type;
+			entry->addr = entry_end - swap_size +
+				      swap_addr - swap_entry->addr;
+			entry->size = swap_entry->size;
+
+			/* Convert old entry to RAM, align to pages. */
+			swap_entry->type = E820_TYPE_RAM;
+			swap_entry->addr = swap_addr;
+			swap_entry->size = swap_size;
+
+			/* Remember PFN<->MFN relation for P2M update. */
+			remap->maddr = swap_addr;
+			remap->size = swap_size;
+			remap->paddr = entry_end - swap_size;
+			nr_nonram_remap++;
+
+			/* Order E820 table and merge entries. */
+			e820__update_table(&xen_e820_table);
+
+			return;
+		}
+
+		entry++;
+	}
+
+	xen_raw_console_write("No suitable area found for required E820 entry remapping action\n");
+	BUG();
+}
+
+/*
+ * Look for non-RAM memory types in a specific guest physical area and move
+ * those away if possible (ACPI NVS only for now).
+ */
+static void __init xen_e820_resolve_conflicts(phys_addr_t start,
+					      phys_addr_t size)
+{
+	struct e820_entry *entry;
+	unsigned int mapcnt;
+	phys_addr_t end;
+
+	if (!size)
+		return;
+
+	end = start + size;
+	entry = xen_e820_table.entries;
+
+	for (mapcnt = 0; mapcnt < xen_e820_table.nr_entries; mapcnt++) {
+		if (entry->addr >= end)
+			return;
+
+		if (entry->addr + entry->size > start &&
+		    entry->type == E820_TYPE_NVS)
+			xen_e820_swap_entry_with_ram(entry);
+
+		entry++;
+	}
+}
+
 /*
  * Check for an area in physical memory to be usable for non-movable purposes.
- * An area is considered to usable if the used E820 map lists it to be RAM.
+ * An area is considered to usable if the used E820 map lists it to be RAM or
+ * some other type which can be moved to higher PFNs while keeping the MFNs.
  * In case the area is not usable, crash the system with an error message.
  */
 void __init xen_chk_is_e820_usable(phys_addr_t start, phys_addr_t size,
 				   const char *component)
 {
+	xen_e820_resolve_conflicts(start, size);
+
 	if (!xen_is_e820_reserved(start, size))
 		return;
 
-- 
2.43.0


