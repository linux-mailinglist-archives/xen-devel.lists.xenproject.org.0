Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4FAB9A2F
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:31:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986848.1372371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLZ-00049B-Li; Fri, 16 May 2025 10:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986848.1372371; Fri, 16 May 2025 10:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLZ-00047c-Hh; Fri, 16 May 2025 10:31:21 +0000
Received: by outflank-mailman (input) for mailman id 986848;
 Fri, 16 May 2025 10:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kgnf=YA=bounce.vates.tech=bounce-md_30504962.68271268.v1-55be2ee1b05f4c71bac5a8b138fad311@srs-se1.protection.inumbo.net>)
 id 1uFsF8-0000kS-Qw
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:24:42 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9c17d21-323f-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:24:41 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzNVc0flkzMQxhSc
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:24:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 55be2ee1b05f4c71bac5a8b138fad311; Fri, 16 May 2025 10:24:40 +0000
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
X-Inumbo-ID: f9c17d21-323f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747391080; x=1747661080;
	bh=rmMyFtnQQP/M6lJv+2OTm80wHgu+FGdxuTTYePbwvvo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QDuEbMATQOKPddW1ufK70fdBeatEr0CakgVN7waNQI9kJ5j9ABbZza4T5O79Iidkw
	 5smVTwk0yrES1Pp7VugS3hE3t4Q2T0mE/BEQEzl1YYP0yBOEM1Popc5ATH0JEwsJIt
	 nN0KMpD+Hgwa+LRSoPi5l/yYzr1wCsQpyrWO/RXFmdfDxu6oCa1I3TZnpvQYQ35GvM
	 n8zIzXB7FQR+Tg9CBQirMsi3HU5bryIxr9wuW4gYI0ve2p+QvdHD1IKdjT90huxwzX
	 VOI2DRvu7VPo4buRFZyEIzCQJwYf8BgKMrgjP8ycops/wi4NaQ77QmmRHofZCCek77
	 dUhjU7tS5t8kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747391080; x=1747651580; i=teddy.astie@vates.tech;
	bh=rmMyFtnQQP/M6lJv+2OTm80wHgu+FGdxuTTYePbwvvo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qKljt4eXIzjKpiRbjn9rvxgK70F9BWLWXx/pVT86itAsZglLmpx42itb1q2iv2PE5
	 ID0i3ku/Txr/p0FvkN6v2y0SxzTIM5k3ZBq/+/TLDsnHsWlFvkEkmjZNUT3QQ986q/
	 v+GGRkIQkP1c87qnssQdjLd9DM9mCnUK4sWWrBKPJ2MTuMYCOt/bCuJhEerG6w8Voc
	 X9t7nNcN0aig8I6jM4u6H4uT2RMaTuj5KuYmF0SIYzYcGPRY5NFuSulJgIa81h4Poy
	 eVzquOE6MsIlx4R7HyELmIQxpeG3wwzywRqftt+mUyAG6TphpxJiUTRZzPJ9T31qJg
	 GpFBwkLhJRLjg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2014/16]=20sev/emulate:=20Handle=20some=20non-emulable=20HVM=20paths?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747391079133
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Andrei Semenov" <andrei.semenov@vates.tech>
Message-Id: <b185e194c53258ea659c13f3b9c062daaa6942a5.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.55be2ee1b05f4c71bac5a8b138fad311?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:24:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Andrei Semenov <andrei.semenov@vates.tech>

Some code paths are not emulable under SEV or needs special handling.

Signed-off-by: Andrei Semenov <andrei.semenov@vates.tech>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/emulate.c | 137 ++++++++++++++++++++++++++++++++-----
 xen/arch/x86/hvm/hvm.c     |  13 ++++
 2 files changed, 133 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 6ed8e03475..7ac3be2d59 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/support.h>
+#include <asm/hvm/svm/sev.h>
 #include <asm/iocap.h>
 #include <asm/vm_event.h>
 
@@ -689,6 +690,9 @@ static void *hvmemul_map_linear_addr(
         goto unhandleable;
     }
 
+    if ( is_sev_domain(curr->domain) && (nr_frames > 1) )
+        goto unhandleable;
+
     for ( i = 0; i < nr_frames; i++ )
     {
         enum hvm_translation_result res;
@@ -703,8 +707,16 @@ static void *hvmemul_map_linear_addr(
         /* Error checking.  Confirm that the current slot is clean. */
         ASSERT(mfn_x(*mfn) == 0);
 
-        res = hvm_translate_get_page(curr, addr, true, pfec,
+        if ( is_sev_domain(curr->domain) )
+        {
+            struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
+            unsigned long gpa = pfn_to_paddr(hvio->mmio_gpfn) | (addr & ~PAGE_MASK);
+            res = hvm_translate_get_page(curr, gpa, false, pfec,
                                      &pfinfo, &page, &gfn, &p2mt);
+        }
+        else
+            res = hvm_translate_get_page(curr, addr, true, pfec,
+                                         &pfinfo, &page, &gfn, &p2mt);
 
         switch ( res )
         {
@@ -1173,6 +1185,7 @@ static int hvmemul_linear_mmio_access(
                                                            dir, buffer_offset);
     paddr_t gpa;
     unsigned long one_rep = 1;
+    unsigned int chunk;
     int rc;
 
     if ( cache == NULL )
@@ -1183,21 +1196,50 @@ static int hvmemul_linear_mmio_access(
         ASSERT_UNREACHABLE();
         return X86EMUL_UNHANDLEABLE;
     }
+    
+    chunk = min_t(unsigned int, size, PAGE_SIZE - offset);
 
     if ( known_gpfn )
         gpa = pfn_to_paddr(hvio->mmio_gpfn) | offset;
     else
     {
-        rc = hvmemul_linear_to_phys(gla, &gpa, size, &one_rep, pfec,
+        if ( is_sev_domain(current->domain) )
+            gpa = pfn_to_paddr(hvio->mmio_gpfn) | offset;
+        else
+        {
+            rc = hvmemul_linear_to_phys(gla, &gpa, chunk, &one_rep, pfec,
+                                        hvmemul_ctxt);
+            if ( rc != X86EMUL_OKAY )
+                return rc;
+        }
+
+        latch_linear_to_phys(hvio, gla, gpa, dir == IOREQ_WRITE);
+    }
+
+    for ( ;; )
+    {
+        rc = hvmemul_phys_mmio_access(cache, gpa, chunk, dir, buffer, buffer_offset);
+        if ( rc != X86EMUL_OKAY )
+            break;
+
+        gla += chunk;
+        buffer_offset += chunk;
+        size -= chunk;
+
+        if ( size == 0 )
+            break;
+
+        if ( is_sev_domain(current->domain) )
+            return X86EMUL_UNHANDLEABLE;
+
+        chunk = min_t(unsigned int, size, PAGE_SIZE);
+        rc = hvmemul_linear_to_phys(gla, &gpa, chunk, &one_rep, pfec,
                                     hvmemul_ctxt);
         if ( rc != X86EMUL_OKAY )
             return rc;
-
-        latch_linear_to_phys(hvio, gla, gpa, dir == IOREQ_WRITE);
     }
 
-    return hvmemul_phys_mmio_access(cache, gpa, size, dir, buffer,
-                                    buffer_offset);
+    return rc;
 }
 
 static inline int hvmemul_linear_mmio_read(
@@ -1254,6 +1296,9 @@ static int linear_read(unsigned long addr, unsigned int bytes, void *p_data,
     {
         unsigned int part1 = PAGE_SIZE - offset;
 
+        if ( is_sev_domain(current->domain) )
+            return X86EMUL_UNHANDLEABLE;
+
         /* Split the access at the page boundary. */
         rc = linear_read(addr, part1, p_data, pfec, hvmemul_ctxt);
         if ( rc != X86EMUL_OKAY )
@@ -1278,11 +1323,25 @@ static int linear_read(unsigned long addr, unsigned int bytes, void *p_data,
      * upon replay) the RAM access for anything that's ahead of or past MMIO,
      * i.e. in RAM.
      */
-    cache = hvmemul_find_mmio_cache(hvio, start, IOREQ_READ, ~0);
-    if ( !cache ||
-         addr + bytes <= start + cache->skip ||
-         addr >= start + cache->size )
-        rc = hvm_copy_from_guest_linear(p_data, addr, bytes, pfec, &pfinfo);
+     cache = hvmemul_find_mmio_cache(hvio, start, IOREQ_READ, ~0);
+     if ( !cache ||
+          addr + bytes <= start + cache->skip ||
+          addr >= start + cache->size )
+     {
+        if ( is_sev_domain(current->domain) )
+        {
+            if ( hvio->mmio_gpfn )
+            {
+                paddr_t gpa;
+                gpa = pfn_to_paddr(hvio->mmio_gpfn) | (addr & ~PAGE_MASK);
+                rc = hvm_copy_from_guest_phys(p_data, gpa, bytes);
+            }
+            else
+                return X86EMUL_UNHANDLEABLE;
+        }
+        else
+            rc = hvm_copy_from_guest_linear(p_data, addr, bytes, pfec, &pfinfo);
+    }
 
     switch ( rc )
     {
@@ -1325,6 +1384,9 @@ static int linear_write(unsigned long addr, unsigned int bytes, void *p_data,
     {
         unsigned int part1 = PAGE_SIZE - offset;
 
+        if ( is_sev_domain(current->domain) )
+            return X86EMUL_UNHANDLEABLE;
+
         /* Split the access at the page boundary. */
         rc = linear_write(addr, part1, p_data, pfec, hvmemul_ctxt);
         if ( rc != X86EMUL_OKAY )
@@ -1340,9 +1402,23 @@ static int linear_write(unsigned long addr, unsigned int bytes, void *p_data,
     /* See commentary in linear_read(). */
     cache = hvmemul_find_mmio_cache(hvio, start, IOREQ_WRITE, ~0);
     if ( !cache ||
-         addr + bytes <= start + cache->skip ||
-         addr >= start + cache->size )
-        rc = hvm_copy_to_guest_linear(addr, p_data, bytes, pfec, &pfinfo);
+        addr + bytes <= start + cache->skip ||
+        addr >= start + cache->size )
+    {
+        if ( is_sev_domain(current->domain) )
+        {
+            if ( hvio->mmio_gpfn )
+            {
+                paddr_t gpa;
+                gpa = pfn_to_paddr(hvio->mmio_gpfn) | (addr & ~PAGE_MASK);
+                rc = hvm_copy_to_guest_phys(gpa, p_data, bytes, current);
+            }
+            else
+                return X86EMUL_UNHANDLEABLE;
+        }
+        else
+            rc = hvm_copy_to_guest_linear(addr, p_data, bytes, pfec, &pfinfo);
+    }
 
     switch ( rc )
     {
@@ -1430,7 +1506,12 @@ int cf_check hvmemul_insn_fetch(
     if ( !bytes ||
          unlikely((insn_off + bytes) > hvmemul_ctxt->insn_buf_bytes) )
     {
-        int rc = __hvmemul_read(x86_seg_cs, offset, p_data, bytes,
+        int rc;
+
+        if ( is_sev_domain(current->domain) )
+            return X86EMUL_UNHANDLEABLE;
+
+        rc = __hvmemul_read(x86_seg_cs, offset, p_data, bytes,
                                 hvm_access_insn_fetch, hvmemul_ctxt);
 
         if ( rc == X86EMUL_OKAY && bytes )
@@ -1485,6 +1566,7 @@ static int cf_check hvmemul_write(
     if ( !known_gla(addr, bytes, pfec) )
     {
         mapping = hvmemul_map_linear_addr(addr, bytes, pfec, hvmemul_ctxt);
+
         if ( IS_ERR(mapping) )
              return ~PTR_ERR(mapping);
     }
@@ -1719,6 +1801,9 @@ static int cf_check hvmemul_cmpxchg(
     int rc;
     void *mapping = NULL;
 
+    if ( is_sev_domain(current->domain) )
+        return X86EMUL_UNHANDLEABLE;
+
     rc = hvmemul_virtual_to_linear(
         seg, offset, bytes, NULL, hvm_access_write, hvmemul_ctxt, &addr);
     if ( rc != X86EMUL_OKAY )
@@ -1821,6 +1906,9 @@ static int cf_check hvmemul_rep_ins(
     p2m_type_t p2mt;
     int rc;
 
+    if ( is_sev_domain(current->domain) )
+        return X86EMUL_UNHANDLEABLE;
+
     rc = hvmemul_virtual_to_linear(
         dst_seg, dst_offset, bytes_per_rep, reps, hvm_access_write,
         hvmemul_ctxt, &addr);
@@ -1899,6 +1987,9 @@ static int cf_check hvmemul_rep_outs(
     p2m_type_t p2mt;
     int rc;
 
+    if ( is_sev_domain(current->domain) )
+        return X86EMUL_UNHANDLEABLE;
+
     if ( unlikely(hvmemul_ctxt->set_context) )
         return hvmemul_rep_outs_set_context(dst_port, bytes_per_rep, reps);
 
@@ -1944,6 +2035,9 @@ static int cf_check hvmemul_rep_movs(
     int rc, df = !!(ctxt->regs->eflags & X86_EFLAGS_DF);
     char *buf;
 
+    if ( is_sev_domain(current->domain) )
+        return X86EMUL_UNHANDLEABLE;
+
     rc = hvmemul_virtual_to_linear(
         src_seg, src_offset, bytes_per_rep, reps, hvm_access_read,
         hvmemul_ctxt, &saddr);
@@ -2109,9 +2203,13 @@ static int cf_check hvmemul_rep_stos(
     paddr_t gpa;
     p2m_type_t p2mt;
     bool df = ctxt->regs->eflags & X86_EFLAGS_DF;
-    int rc = hvmemul_virtual_to_linear(seg, offset, bytes_per_rep, reps,
-                                       hvm_access_write, hvmemul_ctxt, &addr);
+    int rc;
+
+    if ( is_sev_domain(current->domain) )
+        return X86EMUL_UNHANDLEABLE;
 
+    rc = hvmemul_virtual_to_linear(seg, offset, bytes_per_rep, reps,
+                                   hvm_access_write, hvmemul_ctxt, &addr);
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -2770,6 +2868,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     struct vcpu *curr = current;
     uint32_t new_intr_shadow;
     struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
+
     int rc;
 
     /*
@@ -2983,6 +3082,9 @@ void hvm_emulate_init_per_insn(
         unsigned int pfec = PFEC_page_present | PFEC_insn_fetch;
         unsigned long addr;
 
+        if ( is_sev_domain(current->domain) )
+            goto out;
+
         if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl == 3 )
             pfec |= PFEC_user_mode;
 
@@ -3000,6 +3102,7 @@ void hvm_emulate_init_per_insn(
             sizeof(hvmemul_ctxt->insn_buf) : 0;
     }
 
+out:
     hvmemul_ctxt->is_mem_access = false;
 }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e1bcf8e086..d3060329fb 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -56,6 +56,7 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/viridian.h>
 #include <asm/hvm/vm_event.h>
+#include <asm/hvm/svm/sev.h>
 #include <asm/altp2m.h>
 #include <asm/mtrr.h>
 #include <asm/apic.h>
@@ -3477,6 +3478,9 @@ enum hvm_translation_result hvm_copy_to_guest_linear(
     unsigned long addr, const void *buf, unsigned int size, uint32_t pfec,
     pagefault_info_t *pfinfo)
 {
+    if ( is_sev_domain(current->domain) )
+        return HVMTRANS_unhandleable;
+
     return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
                       addr, size, current, HVMCOPY_to_guest | HVMCOPY_linear,
                       PFEC_page_present | PFEC_write_access | pfec, pfinfo);
@@ -3486,6 +3490,9 @@ enum hvm_translation_result hvm_copy_from_guest_linear(
     void *buf, unsigned long addr, unsigned int size, uint32_t pfec,
     pagefault_info_t *pfinfo)
 {
+    if ( is_sev_domain(current->domain) )
+        return HVMTRANS_unhandleable;
+
     return __hvm_copy(buf, addr, size, current,
                       HVMCOPY_from_guest | HVMCOPY_linear,
                       PFEC_page_present | pfec, pfinfo);
@@ -3495,6 +3502,9 @@ enum hvm_translation_result hvm_copy_from_vcpu_linear(
     void *buf, unsigned long addr, unsigned int size, struct vcpu *v,
     unsigned int pfec)
 {
+    if ( is_sev_domain(v->domain) )
+        return HVMTRANS_unhandleable;
+
     return __hvm_copy(buf, addr, size, v,
                       HVMCOPY_from_guest | HVMCOPY_linear,
                       PFEC_page_present | pfec, NULL);
@@ -3522,6 +3532,9 @@ unsigned int clear_user_hvm(void *to, unsigned int len)
 {
     int rc;
 
+    if ( is_sev_domain(current->domain) )
+        return HVMTRANS_unhandleable;
+
     if ( current->hcall_compat && is_compat_arg_xlat_range(to, len) )
     {
         memset(to, 0x00, len);
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


