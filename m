Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51783802BB
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 06:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127184.238984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPGw-00023R-Mc; Fri, 14 May 2021 04:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127184.238984; Fri, 14 May 2021 04:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPGw-00020I-IK; Fri, 14 May 2021 04:17:58 +0000
Received: by outflank-mailman (input) for mailman id 127184;
 Fri, 14 May 2021 04:17:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhPGu-0001OI-P8
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 04:17:56 +0000
Received: from mail-io1-xd31.google.com (unknown [2607:f8b0:4864:20::d31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b879d6e7-86b3-41ff-be44-6f7f575995ce;
 Fri, 14 May 2021 04:17:53 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id d11so6462089iod.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 21:17:53 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g11sm2401505ilq.38.2021.05.13.21.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 21:17:52 -0700 (PDT)
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
X-Inumbo-ID: b879d6e7-86b3-41ff-be44-6f7f575995ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iluLvhPa3OY2DopHKBkR7Xvis99pDwru79D3Q8FxEio=;
        b=jPMW/VtCtDMS19GIRdyXHZIBKMlFqX8JI92XiGO40z/NHetUBJ2TuIskv1/WSxBmQf
         Sf1w2t33r4nytOTg7XOwrEh7hr42zRECc1sDJ8SanNw0XG6lDdMGsCHLje25stJzgurx
         wnct/xjh5vXsZ0DxEYo1l9Rip4WNzApI6xkt4NouPHETOPIU7bSvLqHtSXrpMSct24Wl
         y4ur7tkFPwDrxL87N23g0dc8gqVi4FxgnXyrEl2+FLQSUJm9jaje9KjsAB97Rl8njoDz
         7k5Pz6v+at0KyCMvT/J3zWY6CHQGcCXZpp8TfgQVWhfHUocepLh/0zKDsPAqCn1+VYi/
         g8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iluLvhPa3OY2DopHKBkR7Xvis99pDwru79D3Q8FxEio=;
        b=qUumlQToiluZvylP6URBVdRJuVqtPTCCY3q29NKsn0ie22h4RGiyJSh263Zk+jx1Yu
         RPUKKQaZ8sv4luzsYiI9GhPixuJ6Ly0lR9tw2Bkayk+WSWlsRV0hnMyFlhRs3WQrj6KE
         lD2h3a08Djh7q8NdnQIBNPjfvGE7Zf7GwEa3MDHHWXAUP0W4Jxi7MXC4fWfGuxX3orLq
         nLM5l2SZJVPGk90hvRNxy6FGmsg2UXx1VUn1IJE/u1uRVhIAMaer8KnQPPFZ3NwttWxW
         QtBoBLM7EDt6ukKl6HFnkKY64mBcUUPn2MH41q8BNyTkii9mQ9Jh8TU6FlJKvYLNJCxJ
         N1nw==
X-Gm-Message-State: AOAM531h+2pkXpfsvDtAorQEs4Y0lZNMbYDjgH9KueVOY9WiZHSAmiFv
	zayrOuIM9pHz63bFZHvJx0VEDD+vueNrBQ==
X-Google-Smtp-Source: ABdhPJyFVJSatGbAphL2zDuKfeIWjon6OLAGPGNjVPrqio5x0pw2AJ8syH7B+6o2fgXcBhlJAEr46w==
X-Received: by 2002:a5d:9ada:: with SMTP id x26mr32706913ion.209.1620965872745;
        Thu, 13 May 2021 21:17:52 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 2/5] xen/common: Guard iommu symbols with CONFIG_HAS_PASSTHROUGH
Date: Thu, 13 May 2021 22:17:09 -0600
Message-Id: <1156cb116da19ef64323e472bb6b6e87c6c73d77.1620965208.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620965208.git.connojdavis@gmail.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
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


