Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B558A6B75F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923507.1327025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi4-0001mR-IN; Fri, 21 Mar 2025 09:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923507.1327025; Fri, 21 Mar 2025 09:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi4-0001k3-E6; Fri, 21 Mar 2025 09:30:36 +0000
Received: by outflank-mailman (input) for mailman id 923507;
 Fri, 21 Mar 2025 09:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYcw-0005O8-7z
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:25:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6661f0e4-0636-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:25:16 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3720221CE7;
 Fri, 21 Mar 2025 09:25:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D1C2139AA;
 Fri, 21 Mar 2025 09:25:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pmjNAXww3WcdGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:25:16 +0000
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
X-Inumbo-ID: 6661f0e4-0636-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vBbPFLMY7oD9agHffp6bnrvaZ2naPaltAc0NWccekA=;
	b=etwLehUUcpE9K+mimpI9086gTMKc1HMThW/afVC+M7vBlWtnSj/LpAcHQ/qmFAdcTjx/qE
	efyp09ZynVcQts6F11j2JP0CFUzhqy9vGqtT/bI+YA2lKHPfYPPgbWHod6IdFItZQ0HG0z
	Y3ebBwohzBore2u/Wedy95qu3lSQwNE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vBbPFLMY7oD9agHffp6bnrvaZ2naPaltAc0NWccekA=;
	b=etwLehUUcpE9K+mimpI9086gTMKc1HMThW/afVC+M7vBlWtnSj/LpAcHQ/qmFAdcTjx/qE
	efyp09ZynVcQts6F11j2JP0CFUzhqy9vGqtT/bI+YA2lKHPfYPPgbWHod6IdFItZQ0HG0z
	Y3ebBwohzBore2u/Wedy95qu3lSQwNE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 04/12] kexec: analyze new kernel for kexec
Date: Fri, 21 Mar 2025 10:24:43 +0100
Message-ID: <20250321092451.17309-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Analyze the properties of the new kernel to be loaded by kexec. The
data needed is:

- upper boundary in final location
- copy and memory clear operations
- entry point and entry parameter

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kexec.c |  91 +++++++++++++++++++++++++++++++++++
 include/kexec.h  |  11 +++++
 kexec.c          | 120 ++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 220 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index bf247797..2069f3c6 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -28,8 +28,15 @@
 
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
+#include <mini-os/e820.h>
+#include <mini-os/err.h>
 #include <mini-os/kexec.h>
 
+#include <xen/elfnote.h>
+#include <xen/arch-x86/hvm/start_info.h>
+
+static unsigned long kernel_entry = ~0UL;
+
 /*
  * Final stage of kexec. Copies all data to the final destinations, zeroes
  * .bss and activates new kernel.
@@ -106,4 +113,88 @@ void do_kexec(void *kexec_page)
         :"m" (final));
 }
 
+bool kexec_chk_arch(elf_ehdr *ehdr)
+{
+    return ehdr->e32.e_machine == EM_386 || ehdr->e32.e_machine == EM_X86_64;
+}
+
+static unsigned int note_data_sz(unsigned int sz)
+{
+    return (sz + 3) & ~3;
+}
+
+static void check_notes_entry(elf_ehdr *ehdr, void *start, unsigned int len)
+{
+    elf_note *note = start;
+    unsigned int off, note_len, namesz, descsz;
+    char *val;
+
+    for ( off = 0; off < len; off += note_len )
+    {
+        namesz = note_data_sz(note_val(ehdr, note, namesz));
+        descsz = note_data_sz(note_val(ehdr, note, descsz));
+        val = note_val(ehdr, note, data);
+        note_len = val - (char *)note + namesz + descsz;
+
+        if ( !strncmp(val, "Xen", namesz) &&
+             note_val(ehdr, note, type) == XEN_ELFNOTE_PHYS32_ENTRY )
+        {
+            val += namesz;
+            switch ( note_val(ehdr, note, descsz) )
+            {
+            case 1:
+                kernel_entry = *(uint8_t *)val;
+                return;
+            case 2:
+                kernel_entry = *(uint16_t *)val;
+                return;
+            case 4:
+                kernel_entry = *(uint32_t *)val;
+                return;
+            case 8:
+                kernel_entry = *(uint64_t *)val;
+                return;
+            default:
+                break;
+            }
+        }
+
+        note = elf_ptr_add(note, note_len);
+    }
+}
+
+int kexec_arch_analyze_phdr(elf_ehdr *ehdr, elf_phdr *phdr)
+{
+    void *notes_start;
+    unsigned int notes_len;
+
+    if ( phdr_val(ehdr, phdr, p_type) != PT_NOTE || kernel_entry != ~0UL )
+        return 0;
+
+    notes_start = elf_ptr_add(ehdr, phdr_val(ehdr, phdr, p_offset));
+    notes_len = phdr_val(ehdr, phdr, p_filesz);
+    check_notes_entry(ehdr, notes_start, notes_len);
+
+    return 0;
+}
+
+int kexec_arch_analyze_shdr(elf_ehdr *ehdr, elf_shdr *shdr)
+{
+    void *notes_start;
+    unsigned int notes_len;
+
+    if ( shdr_val(ehdr, shdr, sh_type) != SHT_NOTE || kernel_entry != ~0UL )
+        return 0;
+
+    notes_start = elf_ptr_add(ehdr, shdr_val(ehdr, shdr, sh_offset));
+    notes_len = shdr_val(ehdr, shdr, sh_size);
+    check_notes_entry(ehdr, notes_start, notes_len);
+
+    return 0;
+}
+
+bool kexec_arch_need_analyze_shdrs(void)
+{
+    return kernel_entry == ~0UL;
+}
 #endif /* CONFIG_KEXEC */
diff --git a/include/kexec.h b/include/kexec.h
index 722be456..f54cbb90 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -1,5 +1,6 @@
 #ifndef _KEXEC_H
 #define _KEXEC_H
+#include <mini-os/elf.h>
 
 /* One element of kexec actions (last element must have action KEXEC_CALL): */
 struct kexec_action {
@@ -18,6 +19,8 @@ struct kexec_action {
 extern char _kexec_start[], _kexec_end[];
 extern struct kexec_action kexec_actions[KEXEC_MAX_ACTIONS];
 
+extern unsigned long kexec_last_addr;
+
 int kexec_add_action(int action, void *dest, void *src, unsigned int len);
 
 #define KEXEC_SECSIZE ((unsigned long)_kexec_end - (unsigned long)_kexec_start)
@@ -31,4 +34,12 @@ void do_kexec(void *kexec_page);
 /* Assembler code for switching off paging and passing execution to new OS. */
 void kexec_phys(void);
 
+/* Check kernel to match current architecture. */
+bool kexec_chk_arch(elf_ehdr *ehdr);
+
+/* Architecture specific ELF handling functions. */
+int kexec_arch_analyze_phdr(elf_ehdr *ehdr, elf_phdr *phdr);
+int kexec_arch_analyze_shdr(elf_ehdr *ehdr, elf_shdr *shdr);
+bool kexec_arch_need_analyze_shdrs(void);
+
 #endif /* _KEXEC_H */
diff --git a/kexec.c b/kexec.c
index 849a98e4..3ff4ea07 100644
--- a/kexec.c
+++ b/kexec.c
@@ -31,6 +31,9 @@
 #include <errno.h>
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
+#include <mini-os/console.h>
+#include <mini-os/elf.h>
+#include <mini-os/err.h>
 #include <mini-os/kexec.h>
 
 /*
@@ -54,9 +57,122 @@
  * - The new kernel is activated.
  */
 
-int kexec(void *kernel, unsigned long kernel_size,
-          const char *cmdline)
+unsigned long kexec_last_addr;
+
+static int analyze_phdrs(elf_ehdr *ehdr)
+{
+    elf_phdr *phdr;
+    unsigned int n_hdr, i;
+    unsigned long paddr, offset, filesz, memsz;
+    int ret;
+
+    phdr = elf_ptr_add(ehdr, ehdr_val(ehdr, e_phoff));
+    n_hdr = ehdr_val(ehdr, e_phnum);
+    for ( i = 0; i < n_hdr; i++ )
+    {
+        ret = kexec_arch_analyze_phdr(ehdr, phdr);
+        if ( ret )
+            return ret;
+
+        if ( phdr_val(ehdr, phdr, p_type) == PT_LOAD &&
+             (phdr_val(ehdr, phdr, p_flags) & (PF_X | PF_W | PF_R)) )
+        {
+            paddr = phdr_val(ehdr, phdr, p_paddr);
+            offset = phdr_val(ehdr, phdr, p_offset);
+            filesz = phdr_val(ehdr, phdr, p_filesz);
+            memsz = phdr_val(ehdr, phdr, p_memsz);
+            if ( filesz > 0 )
+            {
+                ret = kexec_add_action(KEXEC_COPY, to_virt(paddr),
+                                       (char *)ehdr + offset, filesz);
+                if ( ret )
+                    return ret;
+            }
+            if ( memsz > filesz )
+            {
+                ret = kexec_add_action(KEXEC_ZERO, to_virt(paddr + filesz),
+                                       NULL, memsz - filesz);
+                if ( ret )
+                    return ret;
+            }
+            if ( paddr + memsz > kexec_last_addr )
+                kexec_last_addr = paddr + memsz;
+        }
+
+        phdr = elf_ptr_add(phdr, ehdr_val(ehdr, e_phentsize));
+    }
+
+    return 0;
+}
+
+static int analyze_shdrs(elf_ehdr *ehdr)
 {
+    elf_shdr *shdr;
+    unsigned int n_hdr, i;
+    int ret;
+
+    if ( !kexec_arch_need_analyze_shdrs() )
+        return 0;
+
+    shdr = elf_ptr_add(ehdr, ehdr_val(ehdr, e_shoff));
+    n_hdr = ehdr_val(ehdr, e_shnum);
+    for ( i = 0; i < n_hdr; i++ )
+    {
+        ret = kexec_arch_analyze_shdr(ehdr, shdr);
+        if ( ret )
+            return ret;
+
+        shdr = elf_ptr_add(shdr, ehdr_val(ehdr, e_shentsize));
+    }
+
+    return 0;
+}
+
+static int analyze_kernel(void *kernel, unsigned long size)
+{
+    elf_ehdr *ehdr = kernel;
+    int ret;
+
+    if ( !IS_ELF(ehdr->e32) )
+    {
+        printk("kexec: new kernel not an ELF file\n");
+        return ENOEXEC;
+    }
+    if ( ehdr->e32.e_ident[EI_DATA] != ELFDATA2LSB )
+    {
+        printk("kexec: ELF file of new kernel is big endian\n");
+        return ENOEXEC;
+    }
+    if ( !elf_is_32bit(ehdr) && !elf_is_64bit(ehdr) )
+    {
+        printk("kexec: ELF file of new kernel is neither 32 nor 64 bit\n");
+        return ENOEXEC;
+    }
+    if ( !kexec_chk_arch(ehdr) )
+    {
+        printk("kexec: ELF file of new kernel is not compatible with arch\n");
+        return ENOEXEC;
+    }
+
+    ret = analyze_phdrs(ehdr);
+    if ( ret )
+        return ret;
+
+    ret = analyze_shdrs(ehdr);
+    if ( ret )
+        return ret;
+
+    return 0;
+}
+
+int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
+{
+    int ret;
+
+    ret = analyze_kernel(kernel, kernel_size);
+    if ( ret )
+        return ret;
+
     return ENOSYS;
 }
 EXPORT_SYMBOL(kexec);
-- 
2.43.0


