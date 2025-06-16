Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5AEADAB09
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016892.1393902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UM-0000Wx-8X; Mon, 16 Jun 2025 08:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016892.1393902; Mon, 16 Jun 2025 08:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UM-0000TX-5E; Mon, 16 Jun 2025 08:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1016892;
 Mon, 16 Jun 2025 08:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5UK-0007jR-Rb
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:46:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e1ca925-4a8e-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 10:46:44 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F08491F387;
 Mon, 16 Jun 2025 08:46:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BED63139E2;
 Mon, 16 Jun 2025 08:46:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oTULLfPZT2gFQAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:46:43 +0000
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
X-Inumbo-ID: 6e1ca925-4a8e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErW9+9DRpMiP5o75sVek1KZHEMoGAiJ0VRopG8PxS3M=;
	b=SWoQN4zlxWLi8ZKq2jWhfuB4yjsy5mSYgvK3YyZ+h+/nexswTQbjMgSPbXt4/KWLwkDezK
	jvqstgion871pR+Jm9cej3VnHV9VRBGVNo0DSteKAOKFcYurLAVWL8B15KLL5oAq/0IIYD
	LM+qRQ2xjl51xB4xBIoReu/zkvmuNYw=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErW9+9DRpMiP5o75sVek1KZHEMoGAiJ0VRopG8PxS3M=;
	b=L/kjDblt1jRnE052nkLszKRxliRvJ4gQPpfqz0FQLZXZfJhtE40x+6oOtiAm+V6YsybFOp
	A+ls5LBf9wwwhM/33nz6IIfMONohLY5zY4/O6UPK1/+ti9+n+DQWaSPTcXb/Pz+kaYYLUZ
	fbCK8t/iepaP61IcUCpvwV3LV+aTuv8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 04/12] mini-os: analyze new kernel for kexec
Date: Mon, 16 Jun 2025 10:46:11 +0200
Message-ID: <20250616084619.11112-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo,amd.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Analyze the properties of the new kernel to be loaded by kexec. The
data needed is:

- upper boundary in final location
- copy and memory clear operations
- entry point and entry parameter

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- rename check_notes_entry() (Jason Andryuk)
- rename kernel_entry to kernel_phys_entry (Jason Andryuk)
---
 arch/x86/kexec.c |  92 +++++++++++++++++++++++++++++++++++++
 include/kexec.h  |  11 +++++
 kexec.c          | 117 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index a8a2fa97..736ca1bf 100644
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
+static unsigned long kernel_phys_entry = ~0UL;
+
 /*
  * Final stage of kexec. Copies all data to the final destinations, zeroes
  * .bss and activates new kernel.
@@ -104,4 +111,89 @@ void do_kexec(void *kexec_page)
         : :"m" (stack), "m" (actions), "m" (phys), "m" (final));
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
+static void read_note_entry(elf_ehdr *ehdr, void *start, unsigned int len)
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
+                kernel_phys_entry = *(uint8_t *)val;
+                return;
+            case 2:
+                kernel_phys_entry = *(uint16_t *)val;
+                return;
+            case 4:
+                kernel_phys_entry = *(uint32_t *)val;
+                return;
+            case 8:
+                kernel_phys_entry = *(uint64_t *)val;
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
+    if ( phdr_val(ehdr, phdr, p_type) != PT_NOTE || kernel_phys_entry != ~0UL )
+        return 0;
+
+    notes_start = elf_ptr_add(ehdr, phdr_val(ehdr, phdr, p_offset));
+    notes_len = phdr_val(ehdr, phdr, p_filesz);
+    read_note_entry(ehdr, notes_start, notes_len);
+
+    return 0;
+}
+
+int kexec_arch_analyze_shdr(elf_ehdr *ehdr, elf_shdr *shdr)
+{
+    void *notes_start;
+    unsigned int notes_len;
+
+    if ( shdr_val(ehdr, shdr, sh_type) != SHT_NOTE ||
+         kernel_phys_entry != ~0UL )
+        return 0;
+
+    notes_start = elf_ptr_add(ehdr, shdr_val(ehdr, shdr, sh_offset));
+    notes_len = shdr_val(ehdr, shdr, sh_size);
+    read_note_entry(ehdr, notes_start, notes_len);
+
+    return 0;
+}
+
+bool kexec_arch_need_analyze_shdrs(void)
+{
+    return kernel_phys_entry == ~0UL;
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
index b69e145b..7c0e6377 100644
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
@@ -53,8 +56,122 @@
  * - The new kernel is activated.
  */
 
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
+{
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
 int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 {
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


