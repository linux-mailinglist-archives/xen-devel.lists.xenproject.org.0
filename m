Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGADA29U/GmKOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3274E55F5
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302342.1576352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZj-0004G1-Nv; Thu, 07 May 2026 08:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302342.1576352; Thu, 07 May 2026 08:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZj-00048C-Fq; Thu, 07 May 2026 08:59:19 +0000
Received: by outflank-mailman (input) for mailman id 1302342;
 Thu, 07 May 2026 08:59:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZh-0003zG-Ue
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZh-002yCX-BG
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5464-bab6-0a2a0a5309dd-0a2a4503ea28-6
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:17 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5465-672d-0a2a45030019-d155da2dc483-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:17 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so89229266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:17 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778144356; x=1778749156; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBwbjhvethRi23b0lhhRx6kHsUNIa/c7SiSbkmEzovg=;
        b=pZuoUrET3WFF/aLSI4tBB4MvpisDkk3HZnrWucWF5IiHP3vOB9ysm6a90p/bduvToO
         KZ3vkQtTj5O+CC3Y1Hn1w2FPkdGDbL5x0PAT+9cm2BtErUwGOH5wR8tA+b8XXaHqTzLk
         YgMBwo9gYpHSkTNMyOjKC1qGXpSyQUGpY2dVVuqHjLDwv1Xn34Z7EFYEgPUE4puCSnKt
         SDKzZgaBM7LNVRzF/JUC6wqLpg4XFQ35t96HA7pOYG6cZc0R2tsPJb+IZKEZnAGuaZVC
         VRnh/pOQuHZ657pJiDoEqJhlVnwX+cHb2g3jUO5LOu9Xh3eeBJ5U5wT3CNlyR+ykHfzH
         alMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144356; x=1778749156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBwbjhvethRi23b0lhhRx6kHsUNIa/c7SiSbkmEzovg=;
        b=VJyMIsU0VTsvMob3kZlGnvdzQfx/PrHwtb55aL58x8jn9QJHbt8AYF3RVMHWDRiKAL
         +dCXcTsLEgkkEZ7OH5IG5H01jlvzSFE6uf334ioZKoRg9bWXWYEDViw+M9CGvO+KyYkS
         vSPklRfwjmC7piV1a1jyWO1X3rKbtHmXLJcEuZ8ALf0ZGCcCvpyNZLXYQ8080H2VvDqP
         YcMp25ODBuxQjKjyjE8AAjydERKBllgQYrCSxacdqEKTF138+KgPwJKm4/O72m7/cbxf
         hfBfAW/n1ToJPFq2k0qALxINakJA7L24kRiksxL5GuRpGwAZV/w71m1AOxfi+uZwt0RZ
         XS5A==
X-Gm-Message-State: AOJu0Ywj10ksI9zn58xULwUEOjrQ2TFX5NG6V7TKl4tsHuvfRsMQeq+u
	fuA1fIz+nDGOtq+lyYy7L80TJzVdaO9jHdNZf5nV7gl/s6Abb0MPR+Em12x5Vg==
X-Gm-Gg: AeBDiesipUzNcP6rGpdqX4EnJK3yN9K9JEjY/N2pucSoXm8xgI5QR5UEKyKg3S9VE0M
	7rOITf8RhP65KePcjbnKWOYrl+4h1enEOIH7HK60WgDF0GIx+yQHFqkz3QHILNpUXq9Nt0pvSQc
	yf7tjFLAe5u4iLRAMgnIBvIinqTHDYMw2gJfwzyTIkD4w7z1dL76tvF2n0uklUpjGJIMLbmrkUV
	6dpzpoCPiStQgGkS3id6mcWZPjunXWUDgEp/vlaaSexf71r+5fQWAZA8RV+weMsvTUHRLRUocN2
	hB90FoonmiJy29o4NRs2moEZmwscr2bWmQvgoHsvK+JbdPLIc4J6s8S6yywSdKHMFJJH76u/FJr
	KqLJAEXSYPBVyq6s7BzLeO4cbPBT0c9PXhuf0ADjukK6ZP+C54+TBycFds4pcU9dICfROK27AVS
	N1X7z4ojRoAi688qVaLhkc0YXWb6842kcDizGgkNOfkKvJMnS3vkkU+jOoqU0u+GG/7TK1gdyMo
	yJL
X-Received: by 2002:a17:907:1c01:b0:bc3:a4cf:aecd with SMTP id a640c23a62f3a-bc56c520611mr406236566b.14.1778144356168;
        Thu, 07 May 2026 01:59:16 -0700 (PDT)
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
Subject: [PATCH v5 09/11] xen/riscv: introduce p2m_gpa_bits
Date: Thu,  7 May 2026 10:58:48 +0200
Message-ID: <7c04588686638f3c0c53df4b8fd8645991009bff.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778144357-41595938-FB7A37CB/10/73395122804
X-purgate-type: spam
X-purgate-size: 3270
X-Rspamd-Queue-Id: 9F3274E55F5
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
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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
Changes in v5:
 - Nothing changed. Only rebase.
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
index f889978cf754..703b9f4d2540 100644
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
@@ -67,6 +69,12 @@ static const struct gstage_mode_desc gstage_modes[] = {
 const struct gstage_mode_desc *__ro_after_init max_gstage_mode =
     &gstage_modes[0];
 
+/*
+ * Set to the maximum configured support for GPA bits, so the number of GPA
+ * bits can be restricted by an external entity (e.g. IOMMU).
+ */
+unsigned int __ro_after_init p2m_gpa_bits = PADDR_BITS;
+
 static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
 
 static inline void p2m_free_metadata_page(struct p2m_domain *p2m,
@@ -355,6 +363,7 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
      */
     static const struct gstage_mode_desc __ro_after_init *m = &gstage_modes[0];
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned int gpa_bits;
 
     /*
      * "Trivial" initialisation is now complete.  Set the backpointer so the
@@ -410,6 +419,12 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
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
2.54.0


