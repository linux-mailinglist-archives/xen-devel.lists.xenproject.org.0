Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A270F32525B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89811.169532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWZ-0006LN-K1; Thu, 25 Feb 2021 15:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89811.169532; Thu, 25 Feb 2021 15:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWZ-0006Kt-GX; Thu, 25 Feb 2021 15:25:55 +0000
Received: by outflank-mailman (input) for mailman id 89811;
 Thu, 25 Feb 2021 15:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJgK=H3=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFIWX-0006Ig-Tq
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:25:53 +0000
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b935c0bf-f453-4cd4-9fb3-258ed13570a3;
 Thu, 25 Feb 2021 15:25:49 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id b8so5998862oti.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 07:25:49 -0800 (PST)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id l4sm1047292ooq.33.2021.02.25.07.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:25:48 -0800 (PST)
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
X-Inumbo-ID: b935c0bf-f453-4cd4-9fb3-258ed13570a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/mJiVuOiu+vXGCosCR3Vu2+74XXXoyXUi+nuAJzkY0=;
        b=Pr4hzrTYQEUCle20bYISfAVaTyOqivHe99TIUf6r0gAKtH+arFGI917QdggE/Cl5kU
         NlpgxZzwYQonOqZ5KFq4j3vH0AaxVg/DTlPARD4hHF+LDhRuFqRSHxCveteWb+hiYUtX
         vKGhGMs5ypFhWkxTLmHjVKv+ZWA36KtxIL+SSYjj/+/0QTYPe0Vozrq37ftJuQedqtVG
         Nr+JFfy1DIpdRFMxJ6O+1VCgSEnCNwPLFqVOh2noag4MfbKB0SlQpjRirQKdfVQ05CKZ
         eVziQezSUddqK71HGH69I2BgA/LIbVFlpWp5FEgcedH/jUn9SlFZy5CS7FS3a7rAST+o
         fMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/mJiVuOiu+vXGCosCR3Vu2+74XXXoyXUi+nuAJzkY0=;
        b=VdG3fw74f/wZ0gR69PrplBF0ggZ7smWgsp6AHKKLfDV9fmHOb6IqrDsu0uvzk2Dkjw
         TOtBJHoB47tEjKdPhVennUMEAEOiHpFgrnTfoBIeTcV7tjsbWS7qXxJDlJxfbaFCAkn7
         LC+64D1rUUaHfFx1yUQ0WstL5HsC4SK5UwjiLcUkdVxRFNEHT+pBT2lN8e5Hdsgg9UjH
         kgdEg2I2xKcO9OMZzFHqZggGOaKbSbOouPJDVNWhG0o2LpM2C/6LvRMXN0MNADyAU/0x
         tiwiUq0sQVLaZ0C436Gck025TF9m6DtNHgWV9iYk05GvpINkqtMQvZW62y9xc9VuNs2o
         cXPQ==
X-Gm-Message-State: AOAM531fGQogkfx4IJaEZKVf6V0nKlF1ij63dbuR3CiD49iTfOevAwrz
	nG1tcA3Vpofid2ZgH1LVgjJ343FpqD+Q4+0z
X-Google-Smtp-Source: ABdhPJxdy3b1mobNcnBRdRRS1EIkalqI25kbgmQE+6fh5/WgH2OS79LPJtpSFmgKcsKjlGur7v+ztw==
X-Received: by 2002:a9d:6356:: with SMTP id y22mr2672025otk.86.1614266748601;
        Thu, 25 Feb 2021 07:25:48 -0800 (PST)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-next 2/6] xen/common: Guard iommu symbols with CONFIG_HAS_PASSTHROUGH
Date: Thu, 25 Feb 2021 08:24:01 -0700
Message-Id: <444658f690c81b9e93c2c709fa1032c049646763.1614265718.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614265718.git.connojdavis@gmail.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variables iommu_enabled and iommu_dont_flush_iotlb are defined in
drivers/passthrough/iommu.c and are referenced in common code, which
causes the link to fail when !CONFIG_HAS_PASSTHROUGH.

Guard references to these variables in common code so that xen
builds when !CONFIG_HAS_PASSTHROUGH.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/common/domain.c |  2 ++
 xen/common/memory.c | 10 ++++++++++
 xen/common/sysctl.c |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index d85984638a..ad66bca325 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -501,7 +501,9 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
             return -EINVAL;
         }
 
+#ifdef CONFIG_HAS_PASSTHROUGH
         if ( !iommu_enabled )
+#endif
         {
             dprintk(XENLOG_INFO, "IOMMU requested but not available\n");
             return -EINVAL;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 76b9f58478..7135324857 100644
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
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 3558641cd9..b4dde7bef6 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -271,12 +271,14 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         pi->cpu_khz = cpu_khz;
         pi->max_mfn = get_upper_mfn_bound();
         arch_do_physinfo(pi);
+#ifdef CONFIG_HAS_PASSTHROUGH
         if ( iommu_enabled )
         {
             pi->capabilities |= XEN_SYSCTL_PHYSCAP_directio;
             if ( iommu_hap_pt_share )
                 pi->capabilities |= XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share;
         }
+#endif
         if ( vmtrace_available )
             pi->capabilities |= XEN_SYSCTL_PHYSCAP_vmtrace;
 
-- 
2.27.0


