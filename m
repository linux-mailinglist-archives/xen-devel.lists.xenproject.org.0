Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E8AABD52
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976752.1363946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlP-0005XQ-QN; Tue, 06 May 2025 08:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976752.1363946; Tue, 06 May 2025 08:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlP-0005Tr-KI; Tue, 06 May 2025 08:34:55 +0000
Received: by outflank-mailman (input) for mailman id 976752;
 Tue, 06 May 2025 08:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlO-00041m-5V
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fafbc382-2a54-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 10:34:52 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso33352915e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:52 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099b107c4sm12878526f8f.76.2025.05.06.01.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:51 -0700 (PDT)
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
X-Inumbo-ID: fafbc382-2a54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520492; x=1747125292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUxyovW21TXrkfyeOo/OFKomE9nboVw2dKjf//O9Bi4=;
        b=VKSpbpMHxyF6v5UdV+XV58q70CKt/G/mH0tA2TQMd47OYsX94WpAvNOaOUZHJxiDez
         pcxBOirR7Jygtc5/k1weWmHoHHO0jcXt7wXJXH5nm4aRiZ3WaIFaah2yUSErFGK4Quro
         DaMF5VrmeEbb2Qyka8IudGzSXlbg2FA3tD/6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520492; x=1747125292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUxyovW21TXrkfyeOo/OFKomE9nboVw2dKjf//O9Bi4=;
        b=QnQcZE4SdpwQsaZQRhiISf+1KUXCawS4JXqw06iTEypx1IQUiXfOCFJef8MacBdS4G
         hvxyJon1oANVXX3x5Qj8cFl5rsibvUPqsEYauVHZp8F0brMaIWca1UpQsEk83dc8OHYJ
         Qocw6pea2/B7VE3AT7z2q6CjC1dAkUrv002yap/sTYZHmV6WbDPqCGkWVGVf6wGYSvwT
         Yh+NseotpB3c7xlKSLrlWJkhaWC0eX1tME22MxYWp0mhVb7k52M5eUXOh8Hz5BlbLMFs
         Jsn8dw8Jjloz0qfOFubuhizla/C36HmdPAWddFPpzLQPUJtU1iP2Bwc2kUpL/rtJJM7C
         gvlw==
X-Gm-Message-State: AOJu0Ywoawg7APmpnrbpmdlxc84L8g6eTivOVpWdfZZMr+VUVtiIS4VN
	WpVe9VeLXOSYicnvYyTVUm7jJPiBB2+zHj5dXIp+ym7NMyJlz81M/PTigAJ1Wm39XTtDw+6lwxv
	o
X-Gm-Gg: ASbGnctSYsvhCp3zKXyorh8ny+G6iTINxlcg/jxaztbvU8jANJN8PaVLeGP3ODCmz8L
	Igh2gc5X0I9oonYH/chFGoY3QmE4dS8XjaTF+hFX783r2DRe6USpWA904iozL8UKmIE1mkstwF1
	umzf103IpBLUIxxIYwOhA6+E+tKaWcgXE8A6d8kmvIfMT7iTHm/GCuiNGKZ9z0u/Z5k9sdq03ku
	ZciKXZfPfKuPEYAGIk2G66OnpHC1/nwsj4hoKyVlAPsKCn7Va4DfHKt4Jhac4sHsDxbGZxjX0W9
	Min0RIya9w4ELWZ21HCi1L4GQUmGBV4LQB3d4N2jt6wN6gzFZw4smmWM
X-Google-Smtp-Source: AGHT+IFr9NSIj+NlQPKwWheTGOLpyFdRFPuyLgygAmUJmDy/hDkqsc6dOXunC/GQzkZLsGAngTYnFw==
X-Received: by 2002:a05:600c:4f01:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-441d04f46b2mr18694515e9.3.1746520491734;
        Tue, 06 May 2025 01:34:51 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to has_arch_io_resources()
Date: Tue,  6 May 2025 10:31:46 +0200
Message-ID: <20250506083148.34963-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To better describe the underlying implementation.  Define
cache_flush_permitted() as an alias of has_arch_io_resources(), so that
current users of cache_flush_permitted() are not effectively modified.

With the introduction of the new handler, change some of the call sites of
cache_flush_permitted() to instead use has_arch_io_resources() as such
callers are not after whether cache flush is enabled, but rather whether
the domain has any IO resources assigned.

Take the opportunity to adjust l1_disallow_mask() to use the newly
introduced has_arch_io_resources() macro.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/iocap.h | 4 +++-
 xen/arch/x86/mm.c                | 3 +--
 xen/arch/x86/mm/p2m-pod.c        | 4 ++--
 xen/common/memory.c              | 2 +-
 xen/include/asm-generic/iocap.h  | 4 +++-
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/iocap.h
index 53d87ae8a334..61d026dbf5f6 100644
--- a/xen/arch/x86/include/asm/iocap.h
+++ b/xen/arch/x86/include/asm/iocap.h
@@ -15,10 +15,12 @@
 #define ioports_access_permitted(d, s, e)               \
     rangeset_contains_range((d)->arch.ioport_caps, s, e)
 
-#define cache_flush_permitted(d)                        \
+#define has_arch_io_resources(d)                        \
     (!rangeset_is_empty((d)->iomem_caps) ||             \
      !rangeset_is_empty((d)->arch.ioport_caps))
 
+#define cache_flush_permitted has_arch_io_resources
+
 static inline int ioports_permit_access(struct domain *d, unsigned long s,
                                         unsigned long e)
 {
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 38e214352201..59b60b1e62a7 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
 
 #define l1_disallow_mask(d)                                     \
     (((d) != dom_io) &&                                         \
-     (rangeset_is_empty((d)->iomem_caps) &&                     \
-      rangeset_is_empty((d)->arch.ioport_caps) &&               \
+     (!has_arch_io_resources(d) &&                              \
       !has_arch_pdevs(d) &&                                     \
       is_pv_domain(d)) ?                                        \
      L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index df2a1cc0749b..05633fe2ac88 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -338,7 +338,7 @@ p2m_pod_set_mem_target(struct domain *d, unsigned long target)
 
     ASSERT( pod_target >= p2m->pod.count );
 
-    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
+    if ( has_arch_pdevs(d) || has_arch_io_resources(d) )
         ret = -ENOTEMPTY;
     else
         ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
@@ -1395,7 +1395,7 @@ guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
     if ( !paging_mode_translate(d) )
         return -EINVAL;
 
-    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
+    if ( has_arch_pdevs(d) || has_arch_io_resources(d) )
         return -ENOTEMPTY;
 
     do {
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 8ca4e1a8425b..46620ed8253d 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -86,7 +86,7 @@ static unsigned int max_order(const struct domain *d)
     unsigned int order = domu_max_order;
 
 #ifdef CONFIG_HAS_PASSTHROUGH
-    if ( cache_flush_permitted(d) && order < ptdom_max_order )
+    if ( has_arch_io_resources(d) && order < ptdom_max_order )
         order = ptdom_max_order;
 #endif
 
diff --git a/xen/include/asm-generic/iocap.h b/xen/include/asm-generic/iocap.h
index dd7cb45488f7..664bbc8971fe 100644
--- a/xen/include/asm-generic/iocap.h
+++ b/xen/include/asm-generic/iocap.h
@@ -2,9 +2,11 @@
 #ifndef __ASM_GENERIC_IOCAP_H__
 #define __ASM_GENERIC_IOCAP_H__
 
-#define cache_flush_permitted(d)                        \
+#define has_arch_io_resources(d)                        \
     (!rangeset_is_empty((d)->iomem_caps))
 
+#define cache_flush_permitted has_arch_io_resources
+
 #endif /* __ASM_GENERIC_IOCAP_H__ */
 
 /*
-- 
2.48.1


