Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EAAB9937
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986706.1372261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrdt-0006fp-PK; Fri, 16 May 2025 09:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986706.1372261; Fri, 16 May 2025 09:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrdt-0006cf-Lu; Fri, 16 May 2025 09:46:13 +0000
Received: by outflank-mailman (input) for mailman id 986706;
 Fri, 16 May 2025 09:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFrdr-0006aW-Mp
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:46:11 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98b81a2d-323a-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:46:11 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7426159273fso2000551b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:46:10 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-742a98a31desm1183320b3a.171.2025.05.16.02.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:46:08 -0700 (PDT)
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
X-Inumbo-ID: 98b81a2d-323a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747388769; x=1747993569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI/Od08PB2sXeLZpJWvF+CUi72sZFREksWnrg/Tt/Yw=;
        b=SUo5erHQObkLTo+hpLRTMX4Hqo6SsoUETx+RPBZOvMtC9mllB/CQFJyhPEUgmjmhRW
         nftSHEX0SebsNWdTP4aEDmWa28OHpFKDI2iRMpcgNxrXYSSr+e6Z+Ls8/xKicQaU6A6q
         HZxLIcMW7r0zclmtBe8Ne5DY1OwMYlrQPoTb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388769; x=1747993569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI/Od08PB2sXeLZpJWvF+CUi72sZFREksWnrg/Tt/Yw=;
        b=wuYj+HRzqgU2TQZ+3sEc1tIEhYNOsbW7oFceyhY7WjWsz30UIu1jxJ3Vv+OPmLRZ3+
         v/C1Q8sQPsJoIkRoWI0MV8SMLVOD4EC13QbmEbZKx4THxXGGrE2IqVGFcRb3EJcVbtee
         D2OQbXF0R2ouSvmAuXXv0+lBbWhImarFF4/iw2ahy6jo18wJDfpLbMh5364w7pUexflZ
         MTiltARnHKw4OYl2fSWxrtwbEF+M852WR3AD0FmQNu9l5T1Iw78R/6JCI9Wx+eneqMO/
         Qqqgdh7nLVIpskflA4gbV+7823p6+rATOLcL9Ptzj0nsDItP1dby+42nuoSowxGmx+eC
         xF7A==
X-Gm-Message-State: AOJu0Yz70lrraUODqzZqvT07zevbx0XxtIWGzzyx411vDGRv+UoPPLHT
	1wijqzKsDfKh450mgbUJQX51q3yszLOkUPUfjdrga18vT7jxJ1aNmEhyY0+ES2lhKcnEPnNkgXh
	4NFQT
X-Gm-Gg: ASbGncusxt4PXsx5ttS62Ly3ivccM0+pbf7FOx2ggH6sC3J3PWkHQ0lGbckqpWS6k+q
	TMYyQpOcNmMEvcXTo0mu+U2uPg2l0f78Ps61jLxcaAQMjFeLzAP7AorlHH3SPUga96MQuqEB8bF
	iC1VfloYvcW5CctCWbBAGU6TL+05mOoVUu5ABHsuNJrq6MmkBNES9I9kgMnge7YmCPAVRIcw/h/
	Po36T9z7u19gkfo7ZK6BBEhu58xqym0BAc8jxhfmngbMpeF0Xy4srI3WcbV7Rbf7jxwzb2NId3e
	gsihlxdkyaDmvxHdeke9/5HhINH6E+zf7sSZtWuT8AqnTolY+jEINoN58JphKzmgPm1iRwzv0KP
	HbcQhZl7YeLVRcLpmv+M=
X-Google-Smtp-Source: AGHT+IE2Dm7Fvn6dqSKkjswk2/qDy0PNEC3SAmtxqH3bJ4rd7I+/nQAqb7QFMMdyi4SORj2LvRBL/A==
X-Received: by 2002:a05:6a00:4c87:b0:730:9502:d564 with SMTP id d2e1a72fcca58-742acce2c1cmr2762355b3a.14.1747388768897;
        Fri, 16 May 2025 02:46:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/6] xen/x86: rename cache_flush_permitted() to has_arch_io_resources()
Date: Fri, 16 May 2025 11:45:32 +0200
Message-ID: <20250516094535.63472-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250516094535.63472-1-roger.pau@citrix.com>
References: <20250516094535.63472-1-roger.pau@citrix.com>
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

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Drop adjustment to l1_disallow_mask().
---
 xen/arch/x86/include/asm/iocap.h | 4 +++-
 xen/arch/x86/mm/p2m-pod.c        | 4 ++--
 xen/common/memory.c              | 2 +-
 xen/include/asm-generic/iocap.h  | 4 +++-
 4 files changed, 9 insertions(+), 5 deletions(-)

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


