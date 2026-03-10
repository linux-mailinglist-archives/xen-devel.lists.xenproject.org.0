Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJB7Jk1QsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3493625547D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250387.1547884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a5-0002JJ-TL; Tue, 10 Mar 2026 17:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250387.1547884; Tue, 10 Mar 2026 17:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a5-0002Gb-PT; Tue, 10 Mar 2026 17:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1250387;
 Tue, 10 Mar 2026 17:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a4-0001QA-M9
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:16 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd807af5-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:14 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-485410a0a8aso16042795e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:14 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:13 -0700 (PDT)
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
X-Inumbo-ID: dd807af5-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162554; x=1773767354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2l9GSTVdHf37ct2dJEvx0io7ScAIs5lEweSLfZGouo=;
        b=iIuPKO4b+qUhMQwTITvT3pvAvG6IJR50piZmXbxla5v5v6ZUcQx+0PAERuup0F1qlo
         g+FE2eOCLD8mjE0gXjHmdmxpAgiwWuZdOaWlO3IefvaqRIQtkhnHWmOiYGIkKNtXYLew
         c2TrlXp0JEhUZGoOBTJoT1jiqDQ4t2nLhvhT/16OSaxAflo58U8L5NMDJPbRgwvkkOrw
         fWej3C0xAQ5hvmvPh4hOgQ64RBzdavG4B9uU4sVCEA6lkpInrhHeTedkBC8wQvIQ5Ofa
         iCbzDRUgAoHILRIEB6kt9FMU1QXS3xOrp1Bu1cVxBuM5K6SlH3YZaNZXNmzLEps2tA10
         RDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162554; x=1773767354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y2l9GSTVdHf37ct2dJEvx0io7ScAIs5lEweSLfZGouo=;
        b=MusXI6CI1bXU+TVEazp83y9f5vrpZoeWQygPJLTYc8pkPDwi0kXNrN6j/DJBMvFdkR
         TfyBMUtgZT+42ctFQ7YzI/yO6Pl3O8JM99nXBq+W92s3loFIDBeYZzEfgZqIlz3PPxy+
         w79mR6Oy4biyVBq/xCutI9F4GcMnd0zHru5fKLyuZB7OBM3BUoaK4rZHI5u40VYAzqJw
         SFR585z/HuBYnUiM3sWrnsMIc/dNVh9txRv7v19/A6GuY+ATM1cDC+5CeF4EcihlB7R3
         3SZjUzSZ2LBCKmnKzq5MEJHcWtq852JTkTTQCIEvwhe/KwIu0fN7HMHf3tDIp6ny1DVS
         e8ew==
X-Gm-Message-State: AOJu0YyN9sxMqexhh67wh+yTR/Rvo6e2m3q+QyI5dufTLdKT+48mvyfE
	Y8eXMJN3hqQYwYwpWsaGAmz33zKA7++ouWIAss0mid7kiihgBM0Ny3wQ3xBJcKMt
X-Gm-Gg: ATEYQzzbuSk7Qv9YN0xCaZhJA+xrSIbwJQSnzkdGONzi20jpYAa5jeJ+qlhKXz7dIGX
	Hju9abVBhIt/V0A88CeIKgGv+uuP5OXVAwMO37rxr6JcgLyCuLn9r2UpCTV7Q9Ei5QQ0j/Ve6G/
	rPSNoTWaHaG5/oAp1zjMslUuoM5PsHsybKG0YvtgQWe0PzVTr1BrRfVmsn9YP+fJOZcRnAzEbn6
	BeuwwNAmbOhBJfdptYXPhmSObybJO2HBbOyd6zM2A6H11omDItrO34DIJMkBNi1qdgwy1aSfXaG
	CUmVfRvLB5SuKDHBX6a8W23LoKSu40yI0HgOv0wOJr6h/T9a241pz19HwngaC7I7qkBWkjVZwGC
	xoXqB+OH41NMjRPPx+560g4IrgMlBssqezdvb5JCk38T5oD+qGu6o1rTc/vhtopr4xrrFC0JFRA
	XZ849b55hPNphvrboaCMIU1PzBysaAr0Rf2rL0lLGUyl3kv4sXeGMcn1rrTBAvguicJg==
X-Received: by 2002:a05:600c:a12:b0:483:badb:618f with SMTP id 5b1f17b1804b1-48526966b07mr244053275e9.25.1773162553878;
        Tue, 10 Mar 2026 10:09:13 -0700 (PDT)
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
Subject: [PATCH v1 04/27] xen/riscv: rework G-stage mode handling
Date: Tue, 10 Mar 2026 18:08:37 +0100
Message-ID: <2c8f1ea25b8d3ec78b00510fbe604a87e759e194.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3493625547D
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,max_gstage_mode.name:url];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Rework G-stage mode handling to make the selected mode descriptor reusable
outside of p2m initialization.

As max_gstage_mode is going to be reused by code that creates CPU nodes for
guest domains, not only max_gstage_mode->mode but also max_gstage_mode->name
is required. To support this, make max_gstage_mode a global pointer to one of
the entries in a global modes[] array, and remove get_max_supported_mode().

Update struct p2m_domain to store a pointer to a mode descriptor instead of
embedding the structure directly.

Refactor the modes[] array so that mode->name contains only the MMU scheme
name (without the "x4" suffix), as this value is reused when filling the
maximum MMU type passed to the guest. According to DT bindings [1], the MMU
type must not include the "x4" suffix. Use "none" for the Bare mode to match
the DT binding requirements.

Adjust modes[]->paging_levels to represent the maximum paging level rather
than the total number of levels. This ensures that P2M_ROOT_LEVEL() and its
users behave correctly without relying on hardcoded p2m mode values.

Finally, drop __initconst from the modes[] declaration, as the array is
referenced via p2m->mode and max_gstage_mode beyond the init stage.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v6.19-rc3#n82

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/p2m.h |  7 ++--
 xen/arch/riscv/p2m.c             | 60 +++++++++++++-------------------
 xen/arch/riscv/vmid.c            |  2 +-
 3 files changed, 30 insertions(+), 39 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index c6d846b96fb4..4441c0400b83 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -13,7 +13,7 @@
 
 #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
 #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
-#define P2M_ROOT_LEVEL(p2m) ((p2m)->mode.paging_levels)
+#define P2M_ROOT_LEVEL(p2m) ((p2m)->mode->paging_levels)
 
 /*
  * According to the RISC-V spec:
@@ -58,6 +58,8 @@ struct gstage_mode_desc {
     char name[8];
 };
 
+extern const struct gstage_mode_desc *max_gstage_mode;
+
 /* Per-p2m-table state */
 struct p2m_domain {
     /*
@@ -71,7 +73,7 @@ struct p2m_domain {
     /* The root of the p2m tree. May be concatenated */
     struct page_info *root;
 
-    struct gstage_mode_desc mode;
+    const struct gstage_mode_desc *mode;
 
     /* Back pointer to domain */
     struct domain *domain;
@@ -218,7 +220,6 @@ static inline bool arch_acquire_resource_check(struct domain *d)
 }
 
 void guest_mm_init(void);
-unsigned char get_max_supported_mode(void);
 
 int p2m_init(struct domain *d);
 
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 886e06196ba2..dce1eb205ec9 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -45,18 +45,32 @@ struct p2m_pte_ctx {
     unsigned int level;          /* Paging level at which the PTE resides. */
 };
 
-static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
-    .mode = HGATP_MODE_OFF,
-    .paging_levels = 0,
-    .name = "Bare",
-};
-
 /*
  * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
  * restricted by external entity (e.g. IOMMU).
  */
 unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;
 
+static const struct gstage_mode_desc modes[] = {
+    /*
+     * Based on the RISC-V spec:
+     *   Bare mode is always supported, regardless of SXLEN.
+     *   When SXLEN=32, the only other valid setting for MODE is Sv32.
+     *   When SXLEN=64, three paged virtual-memory schemes are defined:
+     *   Sv39, Sv48, and Sv57.
+     */
+    [0] = { HGATP_MODE_OFF,    0, "none" },
+#ifdef CONFIG_RISCV_32
+    [1] = { HGATP_MODE_SV32X4, 1, "sv32" }
+#else
+    [2] = { HGATP_MODE_SV39X4, 2, "sv39" },
+    [3] = { HGATP_MODE_SV48X4, 3, "sv48" },
+    [4] = { HGATP_MODE_SV57X4, 4, "sv57" },
+#endif
+};
+
+const struct gstage_mode_desc * __ro_after_init max_gstage_mode = &modes[0];
+
 static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
 
 static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
@@ -69,11 +83,6 @@ static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
     }
 }
 
-unsigned char get_max_supported_mode(void)
-{
-    return max_gstage_mode.mode;
-}
-
 /*
  * If anything is changed here, it may also require updates to
  * p2m_{get,set}_type().
@@ -154,23 +163,6 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
 
 static void __init gstage_mode_detect(void)
 {
-    static const struct gstage_mode_desc modes[] __initconst = {
-        /*
-         * Based on the RISC-V spec:
-         *   Bare mode is always supported, regardless of SXLEN.
-         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
-         *   When SXLEN=64, three paged virtual-memory schemes are defined:
-         *   Sv39, Sv48, and Sv57.
-         */
-#ifdef CONFIG_RISCV_32
-        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
-#else
-        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
-        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
-        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
-#endif
-    };
-
     for ( unsigned int mode_idx = ARRAY_SIZE(modes); mode_idx-- > 0; )
     {
         unsigned long mode = modes[mode_idx].mode;
@@ -179,16 +171,16 @@ static void __init gstage_mode_detect(void)
 
         if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
         {
-            max_gstage_mode = modes[mode_idx];
+            max_gstage_mode = &modes[mode_idx];
 
             break;
         }
     }
 
-    if ( max_gstage_mode.mode == HGATP_MODE_OFF )
+    if ( max_gstage_mode->mode == HGATP_MODE_OFF )
         panic("Xen expects that G-stage won't be Bare mode\n");
 
-    printk("Max supported G-stage mode is %s\n", max_gstage_mode.name);
+    printk("Max supported G-stage mode is %sx4\n", max_gstage_mode->name);
 
     csr_write(CSR_HGATP, 0);
 
@@ -289,7 +281,7 @@ static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
 unsigned long construct_hgatp(const struct p2m_domain *p2m, uint16_t vmid)
 {
     return MASK_INSR(mfn_x(page_to_mfn(p2m->root)), HGATP_PPN_MASK) |
-           MASK_INSR(p2m->mode.mode, HGATP_MODE_MASK) |
+           MASK_INSR(p2m->mode->mode, HGATP_MODE_MASK) |
            MASK_INSR(vmid, HGATP_VMID_MASK);
 }
 
@@ -369,9 +361,7 @@ int p2m_init(struct domain *d)
 #endif
 
     /* TODO: don't hardcode used for a domain g-stage mode. */
-    p2m->mode.mode = HGATP_MODE_SV39X4;
-    p2m->mode.paging_levels = 2;
-    safe_strcpy(p2m->mode.name, "Sv39x4");
+    p2m->mode = &modes[2];
 
     return 0;
 }
diff --git a/xen/arch/riscv/vmid.c b/xen/arch/riscv/vmid.c
index 8fbcd500f24d..11c7e9d6d6c8 100644
--- a/xen/arch/riscv/vmid.c
+++ b/xen/arch/riscv/vmid.c
@@ -52,7 +52,7 @@ static DEFINE_PER_CPU(struct vmid_data, vmid_data);
 static unsigned int vmidlen_detect(void)
 {
     unsigned int vmid_bits;
-    unsigned char gstage_mode = get_max_supported_mode();
+    unsigned char gstage_mode = max_gstage_mode->mode;
 
     /*
      * According to the RISC-V Privileged Architecture Spec:
-- 
2.53.0


