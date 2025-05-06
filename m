Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFDDAAC719
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977322.1364365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCInI-0007rc-1z; Tue, 06 May 2025 13:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977322.1364365; Tue, 06 May 2025 13:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCInH-0007pD-UW; Tue, 06 May 2025 13:57:11 +0000
Received: by outflank-mailman (input) for mailman id 977322;
 Tue, 06 May 2025 13:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=15Tu=XW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uCInG-0007Kz-Us
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:57:11 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0147713c-2a82-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 15:57:10 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-39ee623fe64so5895509f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 06:57:10 -0700 (PDT)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b170e7sm13503239f8f.86.2025.05.06.06.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 06:57:09 -0700 (PDT)
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
X-Inumbo-ID: 0147713c-2a82-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746539830; x=1747144630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL/ZVVVxEx78jS9Cw9s8DTLqhKzVHZ6dBkuD0mXe5Pk=;
        b=cDSHgQC2ekmnloLZsoTiQl43+hOrl3hry4IVtEUPYA4hvLUMyvfDUrO6Y+qw6uYfNo
         eAYl+wNCwWDeDZ4Fq5F83oMo/mf2d8J/Nz+7LiJbpHqdMEjVLvMXLvBbdkoFdcfQ/9y5
         WheI8YdRLE10SfIH+NWzOJCHbiIDmVfvzItVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539830; x=1747144630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL/ZVVVxEx78jS9Cw9s8DTLqhKzVHZ6dBkuD0mXe5Pk=;
        b=MRRYtbEUaOFjIFx3zwf8HvgxUKoiuDfv4fytFLk+zFRpYMp9cCGQIFG2ATDy/5lTcw
         DmHjIBCXULG04NN13d/4rTj+NpWS8B+E5u08v/0r/HgKFs/eKCHvNpWI5NaaWxs60lA1
         +M3bCG5Cmj+LiTNcKUT8cVaxqMWeDH5gN4m/iJ9wmpQFf/vx0JAAkr9dYRKlTNtRSzQy
         W03QgeH8UPaQAUzo5l3wO69WJuNhs7nac0aikH9rtaEN8q0vI0Wl9ZVWM7pgwB8yIYWD
         3YlY24SG7xhYjwWZeFNdLqP5hqtWSaITrzYiHlyHn0lNrSesxG7JJppwt580040dDeYb
         raBw==
X-Gm-Message-State: AOJu0Yz4po1GcXoOQ+AqViRONr9D8Y0BV5FIPxczOXE/hyiY2eeHXFVz
	1O2At/MsdfxBigFhE80LpeQVvQN3fQvtweE+frvBd93QdogZ3aA23M6jHb2IaSKmlCefbbDFXAf
	6TCHsmw==
X-Gm-Gg: ASbGnctFXg87A/z6tkbgkU7bB+cIELFN8Sk4puogWRGBNJ8+hqmiCIfZDYVhibGl7qb
	2VO3tNsWdAydyrFVs0SksKFcCu003WvvRljKxgDkqG7esAAVbwxfIue0la4MXE9eyz0SEMscIqK
	+IeuhKyD+Pq7Nv6a6/E3vZq0v9/7tAaPMddy6wQAcqXkavAOW9IbVfX7ovucntctKnM9hFtiESO
	5i1LgXHxKO+Ab1hO3evNqUAp7ITRnQFX+WN9WpSndbku6ApjafGXTpbgTACKgUuO1cq0r/s6/1k
	JgvdoOTBtrvlS4mMX5COVyu42VeMplZAEvh6m9mvOgPsMhoV9VPKR3i+UKDVzzkQuiWFllnBbXo
	aj8M5N+43clfW2oMr
X-Google-Smtp-Source: AGHT+IF8dKoeMhDyVbHao4B+r0W3a0et6EqcQbUYB3zAjK8quxkCAJaK69PIlErB/bXTsZPUqjRRjw==
X-Received: by 2002:a05:6000:1a8c:b0:3a0:9de8:8a45 with SMTP id ffacd0b85a97d-3a0ac0ec4f9mr2719358f8f.32.1746539829661;
        Tue, 06 May 2025 06:57:09 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/4] kexec: Support non-page-aligned kexec segments
Date: Tue,  6 May 2025 14:56:53 +0100
Message-ID: <20250506135655.187014-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506135655.187014-1-frediano.ziglio@cloud.com>
References: <20250506135655.187014-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

With Secure Boot, userspace passes in the entire kernel loaded for verification
purposes. However, the kernel's startup32 function needs to be aligned (e.g. to
16 MiB) and this results in the start of the segment not being page-aligned
(depending on where the startup32 function lands in the kernel binary). Relax
this restriction in Xen to support this use case.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/kexec.c       | 23 +++++++-----
 xen/common/kimage.c      | 81 +++++++++++++++++++++-------------------
 xen/include/xen/kimage.h | 15 +++++++-
 3 files changed, 70 insertions(+), 49 deletions(-)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 158f8da6fd..a7b3958c74 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -910,7 +910,7 @@ static uint16_t kexec_load_v1_arch(void)
 }
 
 static int kexec_segments_add_segment(unsigned int *nr_segments,
-                                      xen_kexec_segment_t *segments,
+                                      struct kimage_segment *segments,
                                       mfn_t mfn)
 {
     paddr_t maddr = mfn_to_maddr(mfn);
@@ -936,7 +936,7 @@ static int kexec_segments_add_segment(unsigned int *nr_segments,
 
 static int kexec_segments_from_ind_page(mfn_t mfn,
                                         unsigned int *nr_segments,
-                                        xen_kexec_segment_t *segments,
+                                        struct kimage_segment *segments,
                                         bool compat)
 {
     void *page;
@@ -991,7 +991,7 @@ done:
 static int kexec_do_load_v1(xen_kexec_load_v1_t *load, int compat)
 {
     struct kexec_image *kimage = NULL;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
     uint16_t arch;
     unsigned int nr_segments = 0;
     mfn_t ind_mfn = maddr_to_mfn(load->image.indirection_page);
@@ -1001,7 +1001,7 @@ static int kexec_do_load_v1(xen_kexec_load_v1_t *load, int compat)
     if ( arch == EM_NONE )
         return -ENOSYS;
 
-    segments = xmalloc_array(xen_kexec_segment_t, KEXEC_SEGMENT_MAX);
+    segments = xmalloc_array(struct kimage_segment, KEXEC_SEGMENT_MAX);
     if ( segments == NULL )
         return -ENOMEM;
 
@@ -1103,9 +1103,10 @@ static int kexec_load_v1_compat(XEN_GUEST_HANDLE_PARAM(void) uarg)
 static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     xen_kexec_load_t load;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
     struct kexec_image *kimage = NULL;
     int ret;
+    unsigned int i;
 
     if ( copy_from_guest(&load, uarg, 1) )
         return -EFAULT;
@@ -1113,14 +1114,18 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( load.nr_segments >= KEXEC_SEGMENT_MAX )
         return -EINVAL;
 
-    segments = xmalloc_array(xen_kexec_segment_t, load.nr_segments);
+    segments = xmalloc_array(struct kimage_segment, load.nr_segments);
     if ( segments == NULL )
         return -ENOMEM;
 
-    if ( copy_from_guest(segments, load.segments.h, load.nr_segments) )
+    for ( i = 0; i < load.nr_segments; i++ )
     {
-        ret = -EFAULT;
-        goto error;
+        if ( copy_from_guest_offset((xen_kexec_segment_t *)&segments[i],
+                                    load.segments.h, i, 1) )
+        {
+            ret = -EFAULT;
+            goto error;
+        }
     }
 
     ret = kimage_alloc(&kimage, load.type, load.arch, load.entry_maddr,
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index 212f5bd068..296febeb09 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -96,7 +96,7 @@ static struct page_info *kimage_alloc_zeroed_page(unsigned memflags)
 
 static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
                            unsigned long nr_segments,
-                           xen_kexec_segment_t *segments, uint8_t type)
+                           struct kimage_segment *segments, uint8_t type)
 {
     struct kexec_image *image;
     unsigned long i;
@@ -119,29 +119,6 @@ static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
     INIT_PAGE_LIST_HEAD(&image->dest_pages);
     INIT_PAGE_LIST_HEAD(&image->unusable_pages);
 
-    /*
-     * Verify we have good destination addresses.  The caller is
-     * responsible for making certain we don't attempt to load the new
-     * image into invalid or reserved areas of RAM.  This just
-     * verifies it is an address we can use.
-     *
-     * Since the kernel does everything in page size chunks ensure the
-     * destination addresses are page aligned.  Too many special cases
-     * crop of when we don't do this.  The most insidious is getting
-     * overlapping destination addresses simply because addresses are
-     * changed to page size granularity.
-     */
-    result = -EADDRNOTAVAIL;
-    for ( i = 0; i < nr_segments; i++ )
-    {
-        paddr_t mstart, mend;
-
-        mstart = image->segments[i].dest_maddr;
-        mend   = mstart + image->segments[i].dest_size;
-        if ( (mstart & ~PAGE_MASK) || (mend & ~PAGE_MASK) )
-            goto out;
-    }
-
     /*
      * Verify our destination addresses do not overlap.  If we allowed
      * overlapping destination addresses through very weird things can
@@ -221,7 +198,7 @@ out:
 
 static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
                                unsigned long nr_segments,
-                               xen_kexec_segment_t *segments)
+                               struct kimage_segment *segments)
 {
     return do_kimage_alloc(rimage, entry, nr_segments, segments,
                            KEXEC_TYPE_DEFAULT);
@@ -229,7 +206,7 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
 
 static int do_kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
                                  unsigned long nr_segments,
-                                 xen_kexec_segment_t *segments)
+                                 struct kimage_segment *segments)
 {
     unsigned long i;
 
@@ -264,7 +241,7 @@ static int do_kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
 
 static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
                               unsigned long nr_segments,
-                              xen_kexec_segment_t *segments)
+                              struct kimage_segment *segments)
 {
     /* Verify we have a valid entry point */
     if ( (entry < kexec_crash_area.start)
@@ -276,7 +253,7 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
 
 static int kimage_crash_alloc_efi(struct kexec_image **rimage, paddr_t entry,
                                   unsigned long nr_segments,
-                                  xen_kexec_segment_t *segments)
+                                  struct kimage_segment *segments)
 {
     return do_kimage_crash_alloc(rimage, entry, nr_segments, segments);
 }
@@ -694,16 +671,18 @@ found:
 }
 
 static int kimage_load_normal_segment(struct kexec_image *image,
-                                      xen_kexec_segment_t *segment)
+                                      struct kimage_segment *segment)
 {
     unsigned long to_copy;
     unsigned long src_offset;
+    unsigned int dest_offset;
     paddr_t dest, end;
     int ret;
 
     to_copy = segment->buf_size;
     src_offset = 0;
     dest = segment->dest_maddr;
+    dest_offset = segment->dest_offset;
 
     ret = kimage_set_destination(image, dest);
     if ( ret < 0 )
@@ -718,7 +697,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
 
         dest_mfn = dest >> PAGE_SHIFT;
 
-        size = min_t(unsigned long, PAGE_SIZE, to_copy);
+        size = min_t(unsigned long, PAGE_SIZE - dest_offset, to_copy);
 
         page = kimage_alloc_page(image, dest);
         if ( !page )
@@ -728,7 +707,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
             return ret;
 
         dest_va = __map_domain_page(page);
-        ret = copy_from_guest_offset(dest_va, segment->buf.h, src_offset, size);
+        ret = copy_from_guest_offset(dest_va + dest_offset, segment->buf.h, src_offset, size);
         unmap_domain_page(dest_va);
         if ( ret )
             return -EFAULT;
@@ -736,6 +715,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
         to_copy -= size;
         src_offset += size;
         dest += PAGE_SIZE;
+        dest_offset = 0;
     }
 
     /* Remainder of the destination should be zeroed. */
@@ -747,7 +727,7 @@ static int kimage_load_normal_segment(struct kexec_image *image,
 }
 
 static int kimage_load_crash_segment(struct kexec_image *image,
-                                     xen_kexec_segment_t *segment)
+                                     struct kimage_segment *segment)
 {
     /*
      * For crash dumps kernels we simply copy the data from user space
@@ -755,12 +735,14 @@ static int kimage_load_crash_segment(struct kexec_image *image,
      */
     paddr_t dest;
     unsigned long sbytes, dbytes;
+    unsigned int dest_offset;
     int ret = 0;
     unsigned long src_offset = 0;
 
     sbytes = segment->buf_size;
     dbytes = segment->dest_size;
     dest = segment->dest_maddr;
+    dest_offset = segment->dest_offset;
 
     while ( dbytes )
     {
@@ -770,14 +752,16 @@ static int kimage_load_crash_segment(struct kexec_image *image,
 
         dest_mfn = dest >> PAGE_SHIFT;
 
-        dchunk = PAGE_SIZE;
+        dchunk = PAGE_SIZE - dest_offset;
         schunk = min(dchunk, sbytes);
 
         dest_va = map_domain_page(_mfn(dest_mfn));
         if ( !dest_va )
             return -EINVAL;
 
-        ret = copy_from_guest_offset(dest_va, segment->buf.h,
+        if ( dest_offset )
+            memset(dest_va, 0, dest_offset);
+        ret = copy_from_guest_offset(dest_va + dest_offset, segment->buf.h,
                                      src_offset, schunk);
         memset(dest_va + schunk, 0, dchunk - schunk);
 
@@ -785,17 +769,18 @@ static int kimage_load_crash_segment(struct kexec_image *image,
         if ( ret )
             return -EFAULT;
 
-        dbytes -= dchunk;
+        dbytes -= dchunk + dest_offset;
         sbytes -= schunk;
-        dest += dchunk;
+        dest += dchunk + dest_offset;
         src_offset += schunk;
+        dest_offset = 0;
     }
 
     return 0;
 }
 
 static int kimage_load_segment(struct kexec_image *image,
-                               xen_kexec_segment_t *segment)
+                               struct kimage_segment *segment)
 {
     int result = -ENOMEM;
     paddr_t addr;
@@ -826,9 +811,29 @@ static int kimage_load_segment(struct kexec_image *image,
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment)
+                 uint32_t nr_segments, struct kimage_segment *segment)
 {
     int result;
+    unsigned int i;
+
+    for ( i = 0; i < nr_segments; i++ )
+    {
+        paddr_t mend;
+
+        /*
+         * Stash the destination offset-in-page for use when copying the
+         * buffer later.
+         */
+        segment[i].dest_offset = PAGE_OFFSET(segment[i].dest_maddr);
+
+        /*
+         * Align down the start address to page size and align up the end
+         * address to page size.
+         */
+        mend = segment[i].dest_maddr + segment[i].dest_size;
+        segment[i].dest_maddr &= PAGE_MASK;
+        segment[i].dest_size = ROUNDUP(mend, PAGE_SIZE) - segment[i].dest_maddr;
+    }
 
     switch( type )
     {
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 6626058f8b..3099b489b5 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -30,6 +30,17 @@ struct purgatory_info {
     Elf_Shdr *sechdrs;
 };
 
+struct kimage_segment {
+    union {
+        XEN_GUEST_HANDLE(const_void) h;
+        uint64_t _pad;
+    } buf;
+    uint64_t buf_size;
+    uint64_t dest_maddr;
+    uint64_t dest_size;
+    unsigned int dest_offset;
+};
+
 typedef struct xen_kexec_regs {
         uint64_t rax;
         uint64_t rbx;
@@ -55,7 +66,7 @@ struct kexec_image {
     uint16_t arch;
     uint64_t entry_maddr;
     uint32_t nr_segments;
-    xen_kexec_segment_t *segments;
+    struct kimage_segment *segments;
 
     kimage_entry_t head;
     struct page_info *entry_page;
@@ -77,7 +88,7 @@ struct kexec_image {
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
                  uint64_t entry_maddr,
-                 uint32_t nr_segments, xen_kexec_segment_t *segment);
+                 uint32_t nr_segments, struct kimage_segment *segment);
 void kimage_free(struct kexec_image *image);
 int kimage_load_segments(struct kexec_image *image);
 struct page_info *kimage_alloc_control_page(struct kexec_image *image,
-- 
2.43.0


