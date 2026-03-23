Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKmIMvVqwWkVTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6622F8416
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259487.1552819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBp-00006r-Rz; Mon, 23 Mar 2026 16:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259487.1552819; Mon, 23 Mar 2026 16:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBp-0008VC-OR; Mon, 23 Mar 2026 16:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1259487;
 Mon, 23 Mar 2026 16:31:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w4iBo-0008TZ-JI
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:31:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4iBm-005v6Z-De
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:31:39 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16ae6-5cb7-0a2a0a5109dd-0a2a4501b08a-14
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:31:39 +0100
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16aeb-6400-0a2a45010019-d155da2fa404-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:31:39 +0100
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b93698bb57aso836110966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:31:39 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:31:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20230601 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283499; x=1774888299; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zE/rD5OgNgJkWO/wss6LPCSbET9QBlr+zsTkckbS38c=;
        b=VjRa8xur2kIBCZkDMDTb6+7pAb2SX5QydzqluAX+FFbmtyhsK4aEAxdiP1UvbTRx4X
         1eMTMRPIckMdn7SAzUltiG2g+wCQNCFfi+xsslcaWC/Pm9twr1KdiLGho5wkN92K/TSb
         s5Rmv3e8CsYGpydT2TlLLxHAts+b54ovntazA6BOVILMQkURH29tqV5LTXpaKf9YbaAd
         mM3e4X5HkThrdoJK0by6RLO/6tRhmmiv+YVQ1dqi+RcDT90kK173RdVQGkPhT2imk4tN
         gj2nQoTmjgfevy1mzJRFewchpU8zU1e9mTMAECV8daDNuKMpBKBeYpfDAqwBvqPipWbD
         ct4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283499; x=1774888299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zE/rD5OgNgJkWO/wss6LPCSbET9QBlr+zsTkckbS38c=;
        b=LbBg0vT4tk7aCk1Nhh++fkAEZYnLhSTJ+fQ9PPranJrR8qBwVndPd+wD3Hhwkq5Vtd
         XgX/4xuwLbY/qcakKttUZEmU7dncNnQr2v+2mjlHo3MhbQToo3h/Rxy0qQL7aB2Illfy
         7W2YCaGKUBFW30RAeJ/URM1ZWHbLvNBiyKNcbb0u0yRRSl5TgYCWF5K8HP2nmhhv9Aqq
         fGLXFXdxWxANeHAS0OmUpOrqXHT81zsT6/W+0H10FjerQC3D8fPsuvBbTck+T6Be48Nw
         jqGHBBIJ08ngysuovFgNrjW8nnDGR82C7TsU2sy2ySGaUxB0iHZ0OTf48PpnRxpJDtEb
         GlxA==
X-Gm-Message-State: AOJu0YzcTsFg1+o2Xv+oJpVx/NlMTJt02Jc4a9uaw/wBf3nNW+dQMMUK
	dfz9lYNTeXrLrsSNKsMZZ2osAEn1WwsDhQPdD6LSSmxALFTeys9GqdY3RDIDKQ==
X-Gm-Gg: ATEYQzwO6gLDIBiMnSwdRr6lIY2V6cUaGy4rBgxf2ts0LXrfBGG44vRI3FUpUZtYkpI
	jfKs//8UsekrnUi5mA+tQK0JdaNV3dsPV+sOISQOIFvdVMA7yXoXbXZKOiq1SYYVfsML3FPswi2
	M0fgKuk1fE34iMf43J5lHq+TIcT+9qnwWXHQsRPvv+jluxVcvm8vuL/Cqu08TWOSCMbbReXDnum
	7zcV/uZfl8JNT7KEWE+g3RbWBsBKYvBICwv1KL7ovJnbiySSuaIc1wItD9uLZHIjd5MdThbPGML
	ePyj5KUcc7FpWM9Sxg9nATNabqs0YtTZl0VvwaalWP3V5I/Upomxvs3vbJpZn06tZC92/8tHxmu
	rIRIXY1m2bVKo0jui7ri9qufpMA77K+wXINLCcAqtln1aAJ42J4tQzKu+VXNMaj2VEARjst2Xx+
	RMhC2yxhvIY3rb3F9/05An0hS+Zc6udeaUEUKWnbUGlL+oEBE5MYAtbQ9NG4wjsTH1rw==
X-Received: by 2002:a17:906:7947:b0:b98:cfa:f54e with SMTP id a640c23a62f3a-b988632193dmr17738966b.12.1774283498891;
        Mon, 23 Mar 2026 09:31:38 -0700 (PDT)
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
Subject: [PATCH v2 09/11] xen/riscv: introduce p2m_gpa_bits
Date: Mon, 23 Mar 2026 17:29:50 +0100
Message-ID: <775374eab7b9868b7cabe6c76fa1b7ac2f8466d8.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774283499-8FEEADF3-39222399/0/0
X-purgate-type: clean
X-purgate-size: 4473
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
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
X-Rspamd-Queue-Id: 6B6622F8416
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

p2m_gpa_bits is used by common/device-tree/domain-build.c thereby when
CONFIG_DOMAIN_BUILD_HELPERS=y it is necessary to have p2m_gpa_bits properly
defined as it is going to be used to find unused regions.

Introduce default_gstage_mode to have ability to limit p2m_gpa_bits before
p2m_init() is being called as it will be too late.

Limit p2m_gpa_bits in guest_mm_init() as it could be that default G-stage
MMU mode uses less VA wide bits than IOMMU, so p2m_gpa_bits should be
restricted more so that dom0less code uses the correct GPA bits.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/include/asm/p2m.h | 10 ++++++++--
 xen/arch/riscv/p2m.c             | 34 ++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 54ea67990f06..76b30af8dacb 100644
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
index 11beaeead5ac..cd682d6586c7 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -51,6 +51,24 @@ static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
     .name = "Bare",
 };
 
+static struct gstage_mode_desc __ro_after_init default_gstage_mode = {
+    .mode = HGATP_MODE_SV39X4,
+    .paging_levels = 2,
+    .name = "Sv39x4",
+};
+
+/*
+ * Set to the maximum configured support for GPA bits, so the number of GPA
+ * bits can be restricted by an external entity (e.g. IOMMU) and the
+ * restriction must happen before the call of guest_mm_init().
+ *
+ * The widest G-stage mode defined by the RISC-V specification is Sv57x4,
+ * which yields 59-bit GPAs: Sv57 maps 57-bit VAs onto 56-bit PAs (PADDR_BITS),
+ * and the G-stage "x4" extension widens the address space by a further 2 bits,
+ * hence PADDR_BITS + 1 + P2M_ROOT_EXTRA_BITS.
+ */
+unsigned int __ro_after_init p2m_gpa_bits = PADDR_BITS + P2M_ROOT_EXTRA_BITS + 1;
+
 static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
 
 static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
@@ -191,8 +209,13 @@ static void __init gstage_mode_detect(void)
 
 void __init guest_mm_init(void)
 {
+    unsigned int gpa_bits;
+    unsigned int paging_levels = default_gstage_mode.paging_levels;
+
     gstage_mode_detect();
 
+    ASSERT(default_gstage_mode.paging_levels <= max_gstage_mode.paging_levels);
+
     vmid_init();
 
     /*
@@ -226,6 +249,11 @@ void __init guest_mm_init(void)
      * so it could be that we polluted local TLB so flush all guest TLB.
      */
     local_hfence_gvma_all();
+
+    gpa_bits = P2M_GFN_LEVEL_SHIFT(paging_levels + 1) + P2M_ROOT_EXTRA_BITS;
+
+    if ( gpa_bits < p2m_gpa_bits )
+        p2m_gpa_bits = gpa_bits;
 }
 
 /*
@@ -363,9 +391,7 @@ int p2m_init(struct domain *d)
 #endif
 
     /* TODO: don't hardcode used for a domain g-stage mode. */
-    p2m->mode.mode = HGATP_MODE_SV39X4;
-    p2m->mode.paging_levels = 2;
-    safe_strcpy(p2m->mode.name, "Sv39x4");
+    p2m->mode = default_gstage_mode;
 
     return 0;
 }
@@ -1304,7 +1330,7 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
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


