Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKtxEHcd2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D2D3D9E43
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279431.1563926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECb-00010P-S1; Fri, 10 Apr 2026 15:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279431.1563926; Fri, 10 Apr 2026 15:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECb-0000vF-KZ; Fri, 10 Apr 2026 15:55:25 +0000
Received: by outflank-mailman (input) for mailman id 1279431;
 Fri, 10 Apr 2026 15:55:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECY-0000Lo-N5
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECY-00Cgsb-32
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d5d-e002-0a2a0a5209dd-0a2a4508b042-30
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:22 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d69-fab6-0a2a45080019-d155802bccf4-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:22 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso21894035e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:22 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775836521; x=1776441321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlCZP54FVwoINVQH9AKDNs9Wb2jDgoF1x8rYbTHfdf8=;
        b=nkmlAG4FxYmyic2uTgNbvgnloBcv4lHIG4JfWv2Y8MiIxeuRlxdEx/v5LxGRmYZyN3
         4kXsv81wvYapMexxFttt4QQzEdscvc9DfIr9myPUrxX1VLZIVnx7+nRdCQmh7h6F5aUy
         MGq+gJ/dHkmBT1app+vY0AdgmUEA2K8HE/fDBVqU5u7uJcLq/NuVZ/5qltndFkhg7VLe
         6HVJpgmr6ukpVTxPOyzqPCglYigDVaeROjQElu8A81wjULMH851yQifbKul7ydNEE0fm
         eG+O1ncy/2iElyWJXG53mQojAXknOtSkrtXWy1R0M5RCTahfmNi4XlZ8wlZXyrSNq+jy
         hChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836521; x=1776441321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlCZP54FVwoINVQH9AKDNs9Wb2jDgoF1x8rYbTHfdf8=;
        b=PiLIfSeRF50dSpoek8oA7qYk54D+yhqYGHiizR9PrhcL6MtS7BOF/fOqX0BCJsEKXb
         CGisXVB4snyRJhCI6841jnyCkPG1LniMvRb57X0tovHpfSeGWWrnBzkXV1xn8bliDIMS
         dtDuCltudwKl4BB7A2Mg+zKHKCrezqEdFb2dmLi43GuzWb4DplzpGwyeR0s+qm1E4GGd
         wt61C8f4dzkmaT3RMzVP/Ky4GFUppSk7ZIfds5AonImq5PC6qBpvpmd+lWj/YOsC1JaT
         HuEVuFWbE5XQlFT3HGN0yvroCrXP0rbP8HLyJQ1LK6hxfPEI525p3brdgVu+yZMVxUfT
         PH7g==
X-Gm-Message-State: AOJu0YxifPvBrtjIcVuuCKxG3mXejSX8y0cx96lldbegVoOn12YOhLWb
	bmMP5z8nzGcFbiOmt0OF2BTouByfSQtVI7HsH/T8z/gTCjV4rwpuKcZCA6LI/g==
X-Gm-Gg: AeBDieu7EgebCA8yc21PL0XA11x77aI35taf1CA0HWW1iJ7/2KK37qmC7h2evqNA9v+
	gnqu9iQUrfMax/wD8zbEhOA/4fUoMFOdPPDxZ/S7Ubgp/8OAfH6KcrzawLoQYlFhwKuQMdh+rsk
	TZMIq3MVLsh0YW5JKUG1mToxBA267HG9MEXtTIKEWg+b76R4o0PreuMSvBMT8G4z2JBCNz9FqIb
	4QzeX6a1JLp/zQXyhGPpn3JFL1yoqnUQu540KpPpv6hUakVEiq3tL2nbODGalYuGpESy0pnlQ1R
	UcMLJgFBtrMM+daRRjZMHV545X1n1wK3Vsds6zMcyvdvnXHzAKApO1a93FSM5rshVykzV/f+9nm
	LOasCZ9VYxXDPemIat4Lp3bs18OVMeiNaOtnF7/uqHrMNrL0lFW99TDmc2fqJX5MimBQPT3urt1
	U6FR0PIPM3m+l8XX1O13DnPo2nczuiWh+uwLJ57/nHkeplWwlWK58t1rDCG/eaLsOKDg==
X-Received: by 2002:a05:600d:d:b0:488:ba5f:984f with SMTP id 5b1f17b1804b1-488d67b8dadmr39997735e9.6.1775836521179;
        Fri, 10 Apr 2026 08:55:21 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 10/12] xen/riscv: introduce p2m_gpa_bits
Date: Fri, 10 Apr 2026 17:54:56 +0200
Message-ID: <87d8050f252fb76e241a40809763e60d9874e902.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775836522-75159497-8D1036E3/10/73395122804
X-purgate-type: spam
X-purgate-size: 4033
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E9D2D3D9E43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

common/device-tree/domain-build.c uses p2m_gpa_bits to determine the
upper bound of the GPA space when searching for unused regions, so it
must be defined when CONFIG_DOMAIN_BUILD_HELPERS=y.

The variable is initialised to PADDR_BITS and narrowed in p2m_init() to
the GPA width of the selected G-stage mode, allowing an external entity
(e.g. an IOMMU) to restrict it further if needed.

p2m_gpa_bits is a global rather than a per-domain value, which is
acceptable for now because all domains are required to use the same
G-stage MMU mode, as dom0less common code allocates it per all
domains.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update initialization of p2m_gpa_bits and the comment above.
 - Rework how p2m_gpa_bits is limited.
 - Update the commit message.
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/include/asm/p2m.h | 10 ++++++++--
 xen/arch/riscv/p2m.c             | 17 ++++++++++++++++-
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index b5b6a996baeb..0d1dace1a0d8 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -32,10 +32,13 @@
  */
 #define P2M_LEVEL_ORDER(lvl) XEN_PT_LEVEL_ORDER(lvl)
 
-#define P2M_ROOT_EXTRA_BITS(p2m, lvl) (2 * ((lvl) == P2M_ROOT_LEVEL(p2m)))
+#define P2M_ROOT_EXTRA_BITS 2
+
+#define P2M_LEVEL_EXTRA_BITS(p2m, lvl) \
+    (P2M_ROOT_EXTRA_BITS * ((lvl) == P2M_ROOT_LEVEL(p2m)))
 
 #define P2M_PAGETABLE_ENTRIES(p2m, lvl) \
-    (BIT(PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(p2m, lvl), UL))
+    (BIT(PAGETABLE_ORDER + P2M_LEVEL_EXTRA_BITS(p2m, lvl), UL))
 
 #define P2M_TABLE_OFFSET(p2m, lvl) (P2M_PAGETABLE_ENTRIES(p2m, lvl) - 1UL)
 
@@ -44,6 +47,9 @@
 #define P2M_LEVEL_MASK(p2m, lvl) \
     (P2M_TABLE_OFFSET(p2m, lvl) << P2M_GFN_LEVEL_SHIFT(lvl))
 
+/* Holds the bit size of GPAs in p2m tables */
+extern unsigned int p2m_gpa_bits;
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index b0773083ff53..1f229e96d740 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -11,6 +11,8 @@
 #include <xen/sections.h>
 #include <xen/xvmalloc.h>
 
+#include <public/domctl.h>
+
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
@@ -66,6 +68,12 @@ static const struct gstage_mode_desc modes[] = {
 
 const struct gstage_mode_desc * __ro_after_init max_gstage_mode = &modes[0];
 
+/*
+ * Set to the maximum configured support for GPA bits, so the number of GPA
+ * bits can be restricted by an external entity (e.g. IOMMU).
+ */
+unsigned int __ro_after_init p2m_gpa_bits = PADDR_BITS;
+
 static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
 
 static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
@@ -359,6 +367,7 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
      */
     static const struct gstage_mode_desc *m = &modes[0];
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned int gpa_bits;
 
     /*
      * "Trivial" initialisation is now complete.  Set the backpointer so the
@@ -408,6 +417,12 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
 #   error "Add init of p2m->clean_dcache"
 #endif
 
+    gpa_bits = P2M_GFN_LEVEL_SHIFT(p2m->mode->paging_levels + 1) +
+               P2M_ROOT_EXTRA_BITS;
+
+    if ( gpa_bits < p2m_gpa_bits )
+        p2m_gpa_bits = gpa_bits;
+
     return 0;
 }
 
@@ -1345,7 +1360,7 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
 {
     unsigned int level = P2M_ROOT_LEVEL(p2m);
     unsigned int gfn_limit_bits =
-        P2M_LEVEL_ORDER(level + 1) + P2M_ROOT_EXTRA_BITS(p2m, level);
+        P2M_LEVEL_ORDER(level + 1) + P2M_LEVEL_EXTRA_BITS(p2m, level);
     pte_t entry, *table;
     int rc;
     mfn_t mfn = INVALID_MFN;
-- 
2.53.0


