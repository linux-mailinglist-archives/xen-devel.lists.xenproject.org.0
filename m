Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6456A38E8D1
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 16:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131792.246157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBer-0006cc-VF; Mon, 24 May 2021 14:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131792.246157; Mon, 24 May 2021 14:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBer-0006aZ-Rd; Mon, 24 May 2021 14:34:17 +0000
Received: by outflank-mailman (input) for mailman id 131792;
 Mon, 24 May 2021 14:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOm5=KT=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1llBeq-0005zC-5d
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 14:34:16 +0000
Received: from mail-ot1-x334.google.com (unknown [2607:f8b0:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74edadd2-c31c-444e-bd36-81b0bd7c7b2f;
 Mon, 24 May 2021 14:34:09 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso25430402ote.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 07:34:09 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id p22sm2840564oop.7.2021.05.24.07.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 07:34:08 -0700 (PDT)
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
X-Inumbo-ID: 74edadd2-c31c-444e-bd36-81b0bd7c7b2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KDIsJWwedO49iEv9YVCuj+jt8d4VmFrWYbJWRHeDs+U=;
        b=Yh7vBBBU5OVB5ZSt8Zkl1ivh9VVDN84H7CvJXSSqYXgBNb9/qi/NFOcimfilfGx5DN
         rj2k1kDAP80gbtLGAQqltBvMeKD2610eSGLAShM4NbC5AgXNRyTbP0w29celQ65HIDkC
         c4UXNnOij/i9ZOl9GrwmP2yoqhYyShlP2+YzMkjpMkjVlC3/oE+VWj+aDIVEP9F+jE0A
         /DtKviQhW+WALICKHanjH6fwb/Ot6YA5980VlQNQmMzrqE0Q3JpovLBzYK0RYR65R5Zh
         uqvImHq0RQjgFG3kjeM1om8zzvdKzUkQXSBFi7EalKUZ/zX5rearK+386mplelwabxLX
         OQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KDIsJWwedO49iEv9YVCuj+jt8d4VmFrWYbJWRHeDs+U=;
        b=YO0oqy2LePJvoJ9jMV0m/4nooW/9hKs+PkJj6grie3JlfHcEUp5r2u5ZY09RYAzPoT
         cu6Li4Oyz6hqSUpM/v2zWq6QitFqqySlPZO6x/Lrc3Wo6TVcxN9vC6FZXBwpF/Y1EMlr
         Jdhvm2my/RIWX1DfZn2x/jr+re064+UpPGH4d7d0s8TLuQvZvbQ37iL1E3T4yzqozFgy
         D0iHVM9ulQZ/S30Lv+slne+DZqC9SN4eb5YlENfSye5o0AbIZURrQKaDuLbi5pPkvp1O
         GioRrKOmfLdMXrzMM06QtiOv/Wn77fH8DW+ZBdbsNREI626ftRxj+AfC7AHCgWD8H88j
         CC0w==
X-Gm-Message-State: AOAM532pbcgB42VVzZFTCSTqbUlJlYc4rAdlLiU+3jTUqV3agTyFpdjK
	F1E0bdqQYe3rsglZz0wfmcsPVE7cfJvjpw==
X-Google-Smtp-Source: ABdhPJx1K+5syu74ayMih8RaFCc1VU+YarG3lhylzhElWyrmdpxlimkDUFSXTgl1VRbzNh28REIuiA==
X-Received: by 2002:a9d:7cd8:: with SMTP id r24mr19213213otn.90.1621866848860;
        Mon, 24 May 2021 07:34:08 -0700 (PDT)
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
Subject: [PATCH v4 2/4] xen/common: Guard iommu symbols with CONFIG_HAS_PASSTHROUGH
Date: Mon, 24 May 2021 08:34:26 -0600
Message-Id: <f76852db6601b1bf243781b0b8b16c7a6fdc8a01.1621712830.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621712830.git.connojdavis@gmail.com>
References: <cover.1621712830.git.connojdavis@gmail.com>
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
index 460755df29..904cdf725d 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -51,9 +51,15 @@ static inline bool_t dfn_eq(dfn_t x, dfn_t y)
     return dfn_x(x) == dfn_x(y);
 }
 
-extern bool_t iommu_enable, iommu_enabled;
+extern bool_t iommu_enable;
 extern bool force_iommu, iommu_quarantine, iommu_verbose;
 
+#ifdef CONFIG_HAS_PASSTHROUGH
+extern bool iommu_enabled;
+#else
+#define iommu_enabled false
+#endif
+
 #ifdef CONFIG_X86
 extern enum __packed iommu_intremap {
    /*
-- 
2.31.1


