Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC8392DFC
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133082.248143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFA1-00027o-5Y; Thu, 27 May 2021 12:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133082.248143; Thu, 27 May 2021 12:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFA1-00025x-1F; Thu, 27 May 2021 12:30:49 +0000
Received: by outflank-mailman (input) for mailman id 133082;
 Thu, 27 May 2021 12:30:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFA0-00025q-8f
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:30:48 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76fa961c-7bdd-4e98-88bb-af7727108a6c;
 Thu, 27 May 2021 12:30:46 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F071C1FD2E;
 Thu, 27 May 2021 12:30:45 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id D3B6311A98;
 Thu, 27 May 2021 12:30:45 +0000 (UTC)
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
X-Inumbo-ID: 76fa961c-7bdd-4e98-88bb-af7727108a6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtM/uNwkuYbgus7NQ6D0a7urDOwmeq1CTr/If2lDLg8=;
	b=BwJjBdlen2P96tXJpurtSF9hnf4oafFPaJ3hQfyOo4MQsvSQ2jyNgRSoCj6Iah4dBMarmZ
	8Zi9Mc1bu/lWclw9Fs80aUVW/FuxFPqyv8IGGafuzN9526Rcq+FDJGjRGzWKhPFZA/3h7h
	QFj/W0iFWGVH1R3LKwRYgQuCd9DqSPM=
Subject: [PATCH v2 01/12] x86: introduce ioremap_wc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <20abac99-609c-f4f6-1242-c79919f4c317@suse.com>
Date: Thu, 27 May 2021 14:30:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In order for a to-be-introduced ERMS form of memcpy() to not regress
boot performance on certain systems when video output is active, we
first need to arrange for avoiding further dependency on firmware
setting up MTRRs in a way we can actually further modify. On many
systems, due to the continuously growing amounts of installed memory,
MTRRs get configured with at least one huge WB range, and with MMIO
ranges below 4Gb then forced to UC via overlapping MTRRs. mtrr_add(), as
it is today, can't deal with such a setup. Hence on such systems we
presently leave the frame buffer mapped UC, leading to significantly
reduced performance when using REP STOSB / REP MOVSB.

On post-PentiumII hardware (i.e. any that's capable of running 64-bit
code), an effective memory type of WC can be achieved without MTRRs, by
simply referencing the respective PAT entry from the PTEs. While this
will leave the switch to ERMS forms of memset() and memcpy() with
largely unchanged performance, the change here on its own improves
performance on affected systems quite significantly: Measuring just the
individual affected memcpy() invocations yielded a speedup by a factor
of over 250 on my initial (Skylake) test system. memset() isn't getting
improved by as much there, but still by a factor of about 20.

While adding {__,}PAGE_HYPERVISOR_WC, also add {__,}PAGE_HYPERVISOR_WT
to, at the very least, make clear what PTE flags this memory type uses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Mark ioremap_wc() __init.
---
TBD: If the VGA range is WC in the fixed range MTRRs, reusing the low
     1st Mb mapping (like ioremap() does) would be an option.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5881,6 +5881,20 @@ void __iomem *ioremap(paddr_t pa, size_t
     return (void __force __iomem *)va;
 }
 
+void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(pa));
+    unsigned int offs = pa & (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+    void *va;
+
+    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
+
+    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
+
+    return (void __force __iomem *)(va + offs);
+}
+
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg)
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -9,9 +9,9 @@
 #include <xen/param.h>
 #include <xen/xmalloc.h>
 #include <xen/kernel.h>
+#include <xen/mm.h>
 #include <xen/vga.h>
 #include <asm/io.h>
-#include <asm/page.h>
 #include "font.h"
 #include "lfb.h"
 
@@ -103,7 +103,7 @@ void __init vesa_init(void)
     lfbp.text_columns = vlfb_info.width / font->width;
     lfbp.text_rows = vlfb_info.height / font->height;
 
-    lfbp.lfb = lfb = ioremap(lfb_base(), vram_remap);
+    lfbp.lfb = lfb = ioremap_wc(lfb_base(), vram_remap);
     if ( !lfb )
         return;
 
@@ -179,8 +179,7 @@ void __init vesa_mtrr_init(void)
 
 static void lfb_flush(void)
 {
-    if ( vesa_mtrr == 3 )
-        __asm__ __volatile__ ("sfence" : : : "memory");
+    __asm__ __volatile__ ("sfence" : : : "memory");
 }
 
 void __init vesa_endboot(bool_t keep)
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -79,7 +79,7 @@ void __init video_init(void)
     {
     case XEN_VGATYPE_TEXT_MODE_3:
         if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
-             ((video = ioremap(0xB8000, 0x8000)) == NULL) )
+             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
             return;
         outw(0x200a, 0x3d4); /* disable cursor */
         columns = vga_console_info.u.text_mode_3.columns;
@@ -164,7 +164,11 @@ void __init video_endboot(void)
     {
     case XEN_VGATYPE_TEXT_MODE_3:
         if ( !vgacon_keep )
+        {
             memset(video, 0, columns * lines * 2);
+            iounmap(video);
+            video = ZERO_BLOCK_PTR;
+        }
         break;
     case XEN_VGATYPE_VESA_LFB:
     case XEN_VGATYPE_EFI_LFB:
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -615,6 +615,8 @@ void destroy_perdomain_mapping(struct do
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *);
 
+void __iomem *ioremap_wc(paddr_t, size_t);
+
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
 
 void domain_set_alloc_bitsize(struct domain *d);
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -349,8 +349,10 @@ void efi_update_l4_pgtable(unsigned int
 #define __PAGE_HYPERVISOR_RX      (_PAGE_PRESENT | _PAGE_ACCESSED)
 #define __PAGE_HYPERVISOR         (__PAGE_HYPERVISOR_RX | \
                                    _PAGE_DIRTY | _PAGE_RW)
+#define __PAGE_HYPERVISOR_WT      (__PAGE_HYPERVISOR | _PAGE_PWT)
 #define __PAGE_HYPERVISOR_UCMINUS (__PAGE_HYPERVISOR | _PAGE_PCD)
 #define __PAGE_HYPERVISOR_UC      (__PAGE_HYPERVISOR | _PAGE_PCD | _PAGE_PWT)
+#define __PAGE_HYPERVISOR_WC      (__PAGE_HYPERVISOR | _PAGE_PAT)
 #define __PAGE_HYPERVISOR_SHSTK   (__PAGE_HYPERVISOR_RO | _PAGE_DIRTY)
 
 #define MAP_SMALL_PAGES _PAGE_AVAIL0 /* don't use superpages mappings */
--- a/xen/include/asm-x86/x86_64/page.h
+++ b/xen/include/asm-x86/x86_64/page.h
@@ -154,6 +154,10 @@ static inline intpte_t put_pte_flags(uns
                                  _PAGE_GLOBAL | _PAGE_NX)
 #define PAGE_HYPERVISOR_UC      (__PAGE_HYPERVISOR_UC | \
                                  _PAGE_GLOBAL | _PAGE_NX)
+#define PAGE_HYPERVISOR_WC      (__PAGE_HYPERVISOR_WC | \
+                                 _PAGE_GLOBAL | _PAGE_NX)
+#define PAGE_HYPERVISOR_WT      (__PAGE_HYPERVISOR_WT | \
+                                 _PAGE_GLOBAL | _PAGE_NX)
 
 #endif /* __X86_64_PAGE_H__ */
 


