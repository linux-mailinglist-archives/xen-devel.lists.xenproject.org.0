Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKKUL23F8GkzYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759314870EE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296343.1572821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVj-0007JX-G0; Tue, 28 Apr 2026 14:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296343.1572821; Tue, 28 Apr 2026 14:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVj-0007DO-Au; Tue, 28 Apr 2026 14:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1296343;
 Tue, 28 Apr 2026 14:34:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVi-00072P-1g
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:34:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVh-002KhF-E5
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:34:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c542-bab6-0a2a0a5309dd-0a2a450bd8ea-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:34:01 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c559-212f-0a2a450b0019-d155802ae803-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:34:01 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so98959005e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:34:01 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:34:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386841; x=1777991641; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mD4jaSubu8Cvwa+Y6GVJ5L94GrQA3oWYu3F81YJEug=;
        b=bFwhUnXX54hSZEmkNB9oWPxgLN60qyozC+A0p/p0hVU3a8xNZTPwzpXyGVmNyEIn5c
         5srCegq0EDZcVIvJZRaFcf06oOHfqykGUr+OMob0c1KZgYvmCnptadoLZhlhQ6OT+T2E
         v+mLpvue12sAbWn4C3JG3TkKqbYd4dhWv0hhvfeNtUbRBzm1S3FddXpM9c8/zFGlToIa
         8FLQFlFCFmscUrK7POql8yIPI1bkeZN/8foRvo+xH4nRWzwE052uSqgOkFT2E2ATRNFU
         I5ElotivXjLhbAcMuglSRW21I6wPHCei0vUiuHKStPibupVKLQdG45eBb+F/kxjVHJCO
         nC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386841; x=1777991641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2mD4jaSubu8Cvwa+Y6GVJ5L94GrQA3oWYu3F81YJEug=;
        b=ke0hZX/xm7ytodQ7z/fhekJRok4iqf7l1c9SNaRpUUjlIWl3JjagqqHeoV5MZV/tY3
         2mUhntLXhEfZNKs8U2RMh3WS3n0/A6xtqYgcLoHnohKCEAEwuvO8bg7DGrvAlAIulbiI
         CgBko/0ndEwu9pH1DFcXaYPezcVLP2KnUb2nf/7ScaIkUcCQV+qo+aLnpbb6limwZlHb
         2yndErbfWqDK489x1zK/vw/KrPHHfZLKXOPPp2GgYccxGz3gt+XmiczDX3gvmM1lYCvX
         7SPZvR6d+AW/+JV55+W7dQT3VfFNHfd5HQpmRAaR5Yh8TXcIyhWhC41s3kqiqzKom6Y1
         rOTQ==
X-Gm-Message-State: AOJu0Yy7SRhoK+C7cH5DUvK/7VIy+DTwzIv3SVOP7VFaKzayNyZjO6dj
	LUTwTkEMQojhuTUuAbud9GjTB8DXzw8QI2oUWYqRL5gD/0Iuyh3kav3dGXjRQA==
X-Gm-Gg: AeBDies8DaU1H2b9ivr6/pE/zZD+eVZ80nW59nGbcR7kXp2E8u5LtomRXin+9W4uiEs
	F+V2ls7AAVhB5RSdfb0tJUruWHZCkvyfq3S5SX7OCY2uWT5BrLEjrYA/1veFXu2BX3QzuO+et47
	eIN+B5FIbxLjiXMJw5fpcSguVNJapGUqWNVB9+ZiyVVw9e685KrR3etXkg864UFX2Drcy0kQvFl
	wAkxrxzKoCCnu2+YWn1f/6zNpGjVDzF8PxiSwNq+ZR9LFzbJTGw9bWpFDjeHtNOzRtywE/77LyQ
	2hL4L6PoGbwqmQVxMPFNRmY+beHGzy1YNWJ40z143Y+MRBRt8UjoYliBE0xFj0oWcOVFh4x8akE
	+cNB7kepPTvhrQefgQ2R3qG+YOf8SOzxhAjQYYKufShDIRn4c7csokyf/8q9Cbd6Gd0uoi+RfqB
	hc+bcoaEn7mHvpkN6Pv4y0AOonPd6546dRAZh+1eDwqSLuJgjp7xSYtRpOTVRDkcRynac9WJumW
	f6T
X-Received: by 2002:a05:600c:1393:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48a77b270efmr54164075e9.29.1777386840489;
        Tue, 28 Apr 2026 07:34:00 -0700 (PDT)
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
Subject: [PATCH v4 09/11] xen/riscv: introduce p2m_gpa_bits
Date: Tue, 28 Apr 2026 16:33:38 +0200
Message-ID: <d073762576102c768a04e704d0d665d0f37fc312.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1777386841-7F175F3B-89F095DD/10/73395122804
X-purgate-type: spam
X-purgate-size: 3213
X-Rspamd-Queue-Id: 759314870EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.209];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Update initialization of p2m_gpa_bits and the comment above.
 - Rework how p2m_gpa_bits is limited.
 - Update the commit message.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/include/asm/p2m.h |  3 +++
 xen/arch/riscv/p2m.c             | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 638c60ddc2f7..0d1dace1a0d8 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -47,6 +47,9 @@
 #define P2M_LEVEL_MASK(p2m, lvl) \
     (P2M_TABLE_OFFSET(p2m, lvl) << P2M_GFN_LEVEL_SHIFT(lvl))
 
+/* Holds the bit size of GPAs in p2m tables */
+extern unsigned int p2m_gpa_bits;
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 13846bee6a4f..b7c36a75f175 100644
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
@@ -66,6 +68,12 @@ static const struct gstage_mode_desc gstage_modes[] = {
 
 const struct gstage_mode_desc * __ro_after_init max_gstage_mode = &gstage_modes[0];
 
+/*
+ * Set to the maximum configured support for GPA bits, so the number of GPA
+ * bits can be restricted by an external entity (e.g. IOMMU).
+ */
+unsigned int __ro_after_init p2m_gpa_bits = PADDR_BITS;
+
 static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
 
 static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
@@ -354,6 +362,7 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
      */
     static const struct gstage_mode_desc __ro_after_init *m = &gstage_modes[0];
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned int gpa_bits;
 
     /*
      * "Trivial" initialisation is now complete.  Set the backpointer so the
@@ -409,6 +418,12 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
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
 
-- 
2.53.0


