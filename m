Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D045C9580C6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780116.1189726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgK6P-0008Qd-Sp; Tue, 20 Aug 2024 08:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780116.1189726; Tue, 20 Aug 2024 08:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgK6P-0008NI-Pn; Tue, 20 Aug 2024 08:20:29 +0000
Received: by outflank-mailman (input) for mailman id 780116;
 Tue, 20 Aug 2024 08:20:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bKv/=PT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sgK6O-0006Rb-Ug
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:20:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e404c46-5ecd-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 10:20:27 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ECACD2253C;
 Tue, 20 Aug 2024 08:20:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99E2C13A17;
 Tue, 20 Aug 2024 08:20:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id d6EmJMpRxGagKwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 20 Aug 2024 08:20:26 +0000
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
X-Inumbo-ID: 0e404c46-5ecd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1724142027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEPD7L+PrX6jbrsj5UZebNb1W2NcisUaeKba9OJ0nRo=;
	b=LQJoYSvAqjAoGFyinwhTwgq3S8sj/wDiPz2icdvxTSP3CTxROBEiI6FggCY3pSX6k0Amcy
	fLNeZM+pQNNg9dsozbfUobZLLtAupncEE35dHlbDI8doRctPinNTq6gnbM0fNLdGMW0cqU
	ak3Nuaaym6ynLkXfylZJyFVRdZxm4UI=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1724142026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEPD7L+PrX6jbrsj5UZebNb1W2NcisUaeKba9OJ0nRo=;
	b=o+KxEiaHdfqHfLAMS5NzzusWDFsCn0RAyu2igcuNF8OOO0Ld46Tk9Afdesj0mYYgBPO+VN
	7Q7NEcUs452TIFHhObeEqWruqdQWFAALX6zaQnzIpScsbYUZ1r4UusJ4eOGL6WLcng5LtK
	54fHjQk8yYI1l3goYUAG4IIfC/DqFqI=
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
Subject: [PATCH v2 2/7] xen: introduce generic helper checking for memory map conflicts
Date: Tue, 20 Aug 2024 10:20:07 +0200
Message-ID: <20240820082012.31316-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820082012.31316-1-jgross@suse.com>
References: <20240820082012.31316-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.968];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid]
X-Spam-Score: -3.29
X-Spam-Flag: NO

When booting as a Xen PV dom0 the memory layout of the dom0 is
modified to match that of the host, as this requires less changes in
the kernel for supporting Xen.

There are some cases, though, which are problematic, as it is the Xen
hypervisor selecting the kernel's load address plus some other data,
which might conflict with the host's memory map.

These conflicts are detected at boot time and result in a boot error.
In order to support handling at least some of these conflicts in
future, introduce a generic helper function which will later gain the
ability to adapt the memory layout when possible.

Add the missing check for the xen_start_info area.

Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 arch/x86/xen/mmu_pv.c  |  5 +----
 arch/x86/xen/setup.c   | 34 ++++++++++++++++++++++++++++------
 arch/x86/xen/xen-ops.h |  3 ++-
 3 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index f1ce39d6d32c..839e6613753d 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2018,10 +2018,7 @@ void __init xen_reserve_special_pages(void)
 
 void __init xen_pt_check_e820(void)
 {
-	if (xen_is_e820_reserved(xen_pt_base, xen_pt_size)) {
-		xen_raw_console_write("Xen hypervisor allocated page table memory conflicts with E820 map\n");
-		BUG();
-	}
+	xen_chk_is_e820_usable(xen_pt_base, xen_pt_size, "page table");
 }
 
 static unsigned char dummy_mapping[PAGE_SIZE] __page_aligned_bss;
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 4bcc70a71b7d..96765180514b 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -567,7 +567,7 @@ static void __init xen_ignore_unusable(void)
 	}
 }
 
-bool __init xen_is_e820_reserved(phys_addr_t start, phys_addr_t size)
+static bool __init xen_is_e820_reserved(phys_addr_t start, phys_addr_t size)
 {
 	struct e820_entry *entry;
 	unsigned mapcnt;
@@ -624,6 +624,23 @@ phys_addr_t __init xen_find_free_area(phys_addr_t size)
 	return 0;
 }
 
+/*
+ * Check for an area in physical memory to be usable for non-movable purposes.
+ * An area is considered to usable if the used E820 map lists it to be RAM.
+ * In case the area is not usable, crash the system with an error message.
+ */
+void __init xen_chk_is_e820_usable(phys_addr_t start, phys_addr_t size,
+				   const char *component)
+{
+	if (!xen_is_e820_reserved(start, size))
+		return;
+
+	xen_raw_console_write("Xen hypervisor allocated ");
+	xen_raw_console_write(component);
+	xen_raw_console_write(" memory conflicts with E820 map\n");
+	BUG();
+}
+
 /*
  * Like memcpy, but with physical addresses for dest and src.
  */
@@ -824,11 +841,16 @@ char * __init xen_memory_setup(void)
 	 * Failing now is better than running into weird problems later due
 	 * to relocating (and even reusing) pages with kernel text or data.
 	 */
-	if (xen_is_e820_reserved(__pa_symbol(_text),
-				 __pa_symbol(_end) - __pa_symbol(_text))) {
-		xen_raw_console_write("Xen hypervisor allocated kernel memory conflicts with E820 map\n");
-		BUG();
-	}
+	xen_chk_is_e820_usable(__pa_symbol(_text),
+			       __pa_symbol(_end) - __pa_symbol(_text),
+			       "kernel");
+
+	/*
+	 * Check for a conflict of the xen_start_info memory with the target
+	 * E820 map.
+	 */
+	xen_chk_is_e820_usable(__pa(xen_start_info), sizeof(*xen_start_info),
+			       "xen_start_info");
 
 	/*
 	 * Check for a conflict of the hypervisor supplied page tables with
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 0cf16fc79e0b..9a27d1d653d3 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -48,7 +48,8 @@ void xen_mm_unpin_all(void);
 void __init xen_relocate_p2m(void);
 #endif
 
-bool __init xen_is_e820_reserved(phys_addr_t start, phys_addr_t size);
+void __init xen_chk_is_e820_usable(phys_addr_t start, phys_addr_t size,
+				   const char *component);
 unsigned long __ref xen_chk_extra_mem(unsigned long pfn);
 void __init xen_inv_extra_mem(void);
 void __init xen_remap_memory(void);
-- 
2.43.0


