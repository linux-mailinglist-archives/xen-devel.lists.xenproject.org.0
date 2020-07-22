Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DE229B1B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 17:16:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyGTd-00041D-Hz; Wed, 22 Jul 2020 15:16:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvI5=BB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyGTb-000418-O5
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 15:16:11 +0000
X-Inumbo-ID: 4518a200-cc2e-11ea-a1d5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4518a200-cc2e-11ea-a1d5-12813bfff9fa;
 Wed, 22 Jul 2020 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595430969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GkCNRzEGrEUCMdendNnNIXFeYmcqt6lWzZ0/vwffEQI=;
 b=G/H+XqCIcDgwA1IbPUmzLaU36qZ4ExU3vq4s06IAzozOEmZz85MZbNdN
 7/68NIASZ9k9mL90gH/4m0ZfguIcOGMomWoh+npf78DITbDkJTelB/Kyz
 w0YqQMJJaxClcuAa0W1YBmFdWCBgRsjMNNJ3yNz5gMx49YpCrdkw6D0sq I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7UBGLkz2kGlHS25y63b3NAM66sHVrXTVEdocPW+w7t0wWjYKD2kTZLzenLtX5sbfor7dp7RwqD
 x0YMzYngUlaLELSN5TkpVRMvxaVqpqyQmpAdj5sClL6sJ0upjjc/S7y7oKh+hLwYWBG/dm55Bv
 o8ShKQhtm8T9UMk1zIbsHUahRTPP9B+gef6kDZNSLdc9HXAXBCUG1Kx6A5vWxiPMvJuas99GZ/
 R7rzmBeyxPuZqyq3tGk2UOcP3fO41Fgxioj5VMwX09dtlKuMmxOSAGKoVssDONoRK9vyrbf3Pk
 SkU=
X-SBRS: 2.7
X-MesageID: 23282256
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="23282256"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hvm: Clean up track_dirty_vram() calltree
Date: Wed, 22 Jul 2020 16:15:48 +0100
Message-ID: <20200722151548.4000-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

 * Rename nr to nr_frames.  A plain 'nr' is confusing to follow in the the
   lower levels.
 * Use DIV_ROUND_UP() rather than opencoding it in several different ways
 * The hypercall input is capped at uint32_t, so there is no need for
   nr_frames to be unsigned long in the lower levels.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Tim Deegan <tim@xen.org>
---
 xen/arch/x86/hvm/dm.c        | 13 +++++++------
 xen/arch/x86/mm/hap/hap.c    | 21 +++++++++++----------
 xen/arch/x86/mm/shadow/hvm.c | 16 ++++++++--------
 xen/include/asm-x86/hap.h    |  2 +-
 xen/include/asm-x86/shadow.h |  2 +-
 5 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index e3f845165d..9930d68860 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -62,9 +62,10 @@ static bool _raw_copy_from_guest_buf_offset(void *dst,
                                     sizeof(dst))
 
 static int track_dirty_vram(struct domain *d, xen_pfn_t first_pfn,
-                            unsigned int nr, const struct xen_dm_op_buf *buf)
+                            unsigned int nr_frames,
+                            const struct xen_dm_op_buf *buf)
 {
-    if ( nr > (GB(1) >> PAGE_SHIFT) )
+    if ( nr_frames > (GB(1) >> PAGE_SHIFT) )
         return -EINVAL;
 
     if ( d->is_dying )
@@ -73,12 +74,12 @@ static int track_dirty_vram(struct domain *d, xen_pfn_t first_pfn,
     if ( !d->max_vcpus || !d->vcpu[0] )
         return -EINVAL;
 
-    if ( ((nr + 7) / 8) > buf->size )
+    if ( DIV_ROUND_UP(nr_frames, BITS_PER_BYTE) > buf->size )
         return -EINVAL;
 
-    return shadow_mode_enabled(d) ?
-        shadow_track_dirty_vram(d, first_pfn, nr, buf->h) :
-        hap_track_dirty_vram(d, first_pfn, nr, buf->h);
+    return shadow_mode_enabled(d)
+        ? shadow_track_dirty_vram(d, first_pfn, nr_frames, buf->h)
+        :    hap_track_dirty_vram(d, first_pfn, nr_frames, buf->h);
 }
 
 static int set_pci_intx_level(struct domain *d, uint16_t domain,
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 7f84d0c6ea..4eedd1a995 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -58,16 +58,16 @@
 
 int hap_track_dirty_vram(struct domain *d,
                          unsigned long begin_pfn,
-                         unsigned long nr,
+                         unsigned int nr_frames,
                          XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
 {
     long rc = 0;
     struct sh_dirty_vram *dirty_vram;
     uint8_t *dirty_bitmap = NULL;
 
-    if ( nr )
+    if ( nr_frames )
     {
-        int size = (nr + BITS_PER_BYTE - 1) / BITS_PER_BYTE;
+        unsigned int size = DIV_ROUND_UP(nr_frames, BITS_PER_BYTE);
 
         if ( !paging_mode_log_dirty(d) )
         {
@@ -97,13 +97,13 @@ int hap_track_dirty_vram(struct domain *d,
         }
 
         if ( begin_pfn != dirty_vram->begin_pfn ||
-             begin_pfn + nr != dirty_vram->end_pfn )
+             begin_pfn + nr_frames != dirty_vram->end_pfn )
         {
             unsigned long ostart = dirty_vram->begin_pfn;
             unsigned long oend = dirty_vram->end_pfn;
 
             dirty_vram->begin_pfn = begin_pfn;
-            dirty_vram->end_pfn = begin_pfn + nr;
+            dirty_vram->end_pfn = begin_pfn + nr_frames;
 
             paging_unlock(d);
 
@@ -115,7 +115,7 @@ int hap_track_dirty_vram(struct domain *d,
              * Switch vram to log dirty mode, either by setting l1e entries of
              * P2M table to be read-only, or via hardware-assisted log-dirty.
              */
-            p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
+            p2m_change_type_range(d, begin_pfn, begin_pfn + nr_frames,
                                   p2m_ram_rw, p2m_ram_logdirty);
 
             guest_flush_tlb_mask(d, d->dirty_cpumask);
@@ -132,7 +132,7 @@ int hap_track_dirty_vram(struct domain *d,
             p2m_flush_hardware_cached_dirty(d);
 
             /* get the bitmap */
-            paging_log_dirty_range(d, begin_pfn, nr, dirty_bitmap);
+            paging_log_dirty_range(d, begin_pfn, nr_frames, dirty_bitmap);
 
             domain_unpause(d);
         }
@@ -153,14 +153,15 @@ int hap_track_dirty_vram(struct domain *d,
              * then stop tracking
              */
             begin_pfn = dirty_vram->begin_pfn;
-            nr = dirty_vram->end_pfn - dirty_vram->begin_pfn;
+            nr_frames = dirty_vram->end_pfn - dirty_vram->begin_pfn;
             xfree(dirty_vram);
             d->arch.hvm.dirty_vram = NULL;
         }
 
         paging_unlock(d);
-        if ( nr )
-            p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
+
+        if ( nr_frames )
+            p2m_change_type_range(d, begin_pfn, begin_pfn + nr_frames,
                                   p2m_ram_logdirty, p2m_ram_rw);
     }
 out:
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index c5da7a071c..b832272c10 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -695,12 +695,12 @@ static void sh_emulate_unmap_dest(struct vcpu *v, void *addr,
 /* VRAM dirty tracking support */
 int shadow_track_dirty_vram(struct domain *d,
                             unsigned long begin_pfn,
-                            unsigned long nr,
+                            unsigned int nr_frames,
                             XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
 {
     int rc = 0;
-    unsigned long end_pfn = begin_pfn + nr;
-    unsigned long dirty_size = (nr + 7) / 8;
+    unsigned long end_pfn = begin_pfn + nr_frames;
+    unsigned int dirty_size = DIV_ROUND_UP(nr_frames, BITS_PER_BYTE);
     int flush_tlb = 0;
     unsigned long i;
     p2m_type_t t;
@@ -717,7 +717,7 @@ int shadow_track_dirty_vram(struct domain *d,
 
     dirty_vram = d->arch.hvm.dirty_vram;
 
-    if ( dirty_vram && (!nr ||
+    if ( dirty_vram && (!nr_frames ||
              ( begin_pfn != dirty_vram->begin_pfn
             || end_pfn   != dirty_vram->end_pfn )) )
     {
@@ -729,7 +729,7 @@ int shadow_track_dirty_vram(struct domain *d,
         dirty_vram = d->arch.hvm.dirty_vram = NULL;
     }
 
-    if ( !nr )
+    if ( !nr_frames )
         goto out;
 
     dirty_bitmap = vzalloc(dirty_size);
@@ -759,9 +759,9 @@ int shadow_track_dirty_vram(struct domain *d,
         dirty_vram->end_pfn = end_pfn;
         d->arch.hvm.dirty_vram = dirty_vram;
 
-        if ( (dirty_vram->sl1ma = xmalloc_array(paddr_t, nr)) == NULL )
+        if ( (dirty_vram->sl1ma = xmalloc_array(paddr_t, nr_frames)) == NULL )
             goto out_dirty_vram;
-        memset(dirty_vram->sl1ma, ~0, sizeof(paddr_t) * nr);
+        memset(dirty_vram->sl1ma, ~0, sizeof(paddr_t) * nr_frames);
 
         if ( (dirty_vram->dirty_bitmap = xzalloc_array(uint8_t, dirty_size)) == NULL )
             goto out_sl1ma;
@@ -780,7 +780,7 @@ int shadow_track_dirty_vram(struct domain *d,
         void *map_sl1p = NULL;
 
         /* Iterate over VRAM to track dirty bits. */
-        for ( i = 0; i < nr; i++ )
+        for ( i = 0; i < nr_frames; i++ )
         {
             mfn_t mfn = get_gfn_query_unlocked(d, begin_pfn + i, &t);
             struct page_info *page;
diff --git a/xen/include/asm-x86/hap.h b/xen/include/asm-x86/hap.h
index faf856913a..d489df3812 100644
--- a/xen/include/asm-x86/hap.h
+++ b/xen/include/asm-x86/hap.h
@@ -40,7 +40,7 @@ void  hap_teardown(struct domain *d, bool *preempted);
 void  hap_vcpu_init(struct vcpu *v);
 int   hap_track_dirty_vram(struct domain *d,
                            unsigned long begin_pfn,
-                           unsigned long nr,
+                           unsigned int nr_frames,
                            XEN_GUEST_HANDLE(void) dirty_bitmap);
 
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
diff --git a/xen/include/asm-x86/shadow.h b/xen/include/asm-x86/shadow.h
index 224d1bc2f9..76e47f257f 100644
--- a/xen/include/asm-x86/shadow.h
+++ b/xen/include/asm-x86/shadow.h
@@ -64,7 +64,7 @@ int shadow_enable(struct domain *d, u32 mode);
 /* Enable VRAM dirty bit tracking. */
 int shadow_track_dirty_vram(struct domain *d,
                             unsigned long first_pfn,
-                            unsigned long nr,
+                            unsigned int nr_frames,
                             XEN_GUEST_HANDLE(void) dirty_bitmap);
 
 /* Handler for shadow control ops: operations from user-space to enable
-- 
2.11.0


