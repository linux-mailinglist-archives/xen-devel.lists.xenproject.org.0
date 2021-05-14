Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B5381016
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 20:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127486.239619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcwx-00026M-Rz; Fri, 14 May 2021 18:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127486.239619; Fri, 14 May 2021 18:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcwx-000239-OC; Fri, 14 May 2021 18:54:15 +0000
Received: by outflank-mailman (input) for mailman id 127486;
 Fri, 14 May 2021 18:54:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhcww-0001R5-IA
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 18:54:14 +0000
Received: from mail-io1-xd33.google.com (unknown [2607:f8b0:4864:20::d33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e627cd2f-e916-46be-afea-f98f6f0457e1;
 Fri, 14 May 2021 18:54:06 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d24so19102570ios.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 11:54:06 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id d81sm2815190iof.26.2021.05.14.11.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:54:05 -0700 (PDT)
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
X-Inumbo-ID: e627cd2f-e916-46be-afea-f98f6f0457e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iluLvhPa3OY2DopHKBkR7Xvis99pDwru79D3Q8FxEio=;
        b=ZqAPjMz81sQ6Mja0yWmqh4jyQlLNIZ6DIOXrf1dXTRs2Aesv50iF5gqFQcS4dqxtb9
         9DzeKF17eajqevL3qqo8FyrGEV3cm0PUl+td/fSDUZCWwDIzlTn3q8xAFAY9QlznRr3K
         O15sPo9MmEWSmk6DAaB8u8dNonz/ik14TIaUtRm8OL66VlsjR+UagJZOOUYXxYeeEEGW
         ct4kupLtSalUduJQyWWW8YmMG6vxx5vG6vFXpocP1BWiMt1I5o9MN5X6q7QXmwMHwSxG
         KiTO71g1zqbQXUm0juxkq7JJ6MLivyehc5flXDdLjrsK1fqVRro5pznnOoO+V/bC5dJm
         frIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iluLvhPa3OY2DopHKBkR7Xvis99pDwru79D3Q8FxEio=;
        b=PlXX8wf0llHDacIErUL37NWlkI4UBEZOJdKElVWKPuMyugaV1ngYyngKQQmT7kZoCk
         4Mx7/Uk5uRi0WgDxantP+55Ta7QwNdgYEaPAYoe3WBRqomaZcReTJm59f+8Gy6K6ygPZ
         no+njcBN/ieA0aZpHz0xWSXXDWPOx6yKW1rhktyyX+Cv/wA6UqWqTSvEJW9ijGkiST4R
         9tvAmGN42J6R2MZ1FyuT4npkj4z1x6LJ556Z+EE+feTfu/Wzrndm7Kz4qCvF5zto3+Dm
         n7FvlM84SELv6IQmauPSDS5wBc2w+dCs4gQ6zinD/G0ZTaBPykj/esCAtrF6Zer3UKrp
         LcQQ==
X-Gm-Message-State: AOAM530NiuEEV2YG4VoTQAi3xXCXdUzOOKzx9EQjNOZqhkwgHburyF9f
	HrmcaIbGND7Cs0EkgrbgSmtM3+tE51cWBw==
X-Google-Smtp-Source: ABdhPJzSTRWnJ9GQzEmknI4HLkg5i5QpjvFzfYDGmQBZXIxyQH47g0uQBH3YteEv1TAPUbYAPf0zQw==
X-Received: by 2002:a05:6638:3ab:: with SMTP id z11mr44310166jap.58.1621018446053;
        Fri, 14 May 2021 11:54:06 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 2/5] xen/common: Guard iommu symbols with CONFIG_HAS_PASSTHROUGH
Date: Fri, 14 May 2021 12:53:22 -0600
Message-Id: <1156cb116da19ef64323e472bb6b6e87c6c73d77.1621017334.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621017334.git.connojdavis@gmail.com>
References: <cover.1621017334.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variables iommu_enabled and iommu_dont_flush_iotlb are defined in
drivers/passthrough/iommu.c and are referenced in common code, which
causes the link to fail when !CONFIG_HAS_PASSTHROUGH.

Guard references to these variables in common code so that xen
builds when !CONFIG_HAS_PASSTHROUGH.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/common/memory.c     | 10 ++++++++++
 xen/include/xen/iommu.h |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index b5c70c4b85..72a6b70cb5 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -294,7 +294,9 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
     p2m_type_t p2mt;
 #endif
     mfn_t mfn;
+#ifdef CONFIG_HAS_PASSTHROUGH
     bool *dont_flush_p, dont_flush;
+#endif
     int rc;
 
 #ifdef CONFIG_X86
@@ -385,13 +387,17 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
      * Since we're likely to free the page below, we need to suspend
      * xenmem_add_to_physmap()'s suppressing of IOMMU TLB flushes.
      */
+#ifdef CONFIG_HAS_PASSTHROUGH
     dont_flush_p = &this_cpu(iommu_dont_flush_iotlb);
     dont_flush = *dont_flush_p;
     *dont_flush_p = false;
+#endif
 
     rc = guest_physmap_remove_page(d, _gfn(gmfn), mfn, 0);
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     *dont_flush_p = dont_flush;
+#endif
 
     /*
      * With the lack of an IOMMU on some platforms, domains with DMA-capable
@@ -839,11 +845,13 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
     xatp->gpfn += start;
     xatp->size -= start;
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     if ( is_iommu_enabled(d) )
     {
        this_cpu(iommu_dont_flush_iotlb) = 1;
        extra.ppage = &pages[0];
     }
+#endif
 
     while ( xatp->size > done )
     {
@@ -868,6 +876,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
         }
     }
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     if ( is_iommu_enabled(d) )
     {
         int ret;
@@ -894,6 +903,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
     }
+#endif
 
     return rc;
 }
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 460755df29..d878a93269 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -51,9 +51,15 @@ static inline bool_t dfn_eq(dfn_t x, dfn_t y)
     return dfn_x(x) == dfn_x(y);
 }
 
-extern bool_t iommu_enable, iommu_enabled;
+extern bool_t iommu_enable;
 extern bool force_iommu, iommu_quarantine, iommu_verbose;
 
+#ifdef CONFIG_HAS_PASSTHROUGH
+extern bool_t iommu_enabled;
+#else
+#define iommu_enabled false
+#endif
+
 #ifdef CONFIG_X86
 extern enum __packed iommu_intremap {
    /*
-- 
2.31.1


