Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I4HEXDWmGl+NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC36916B0D2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237613.1539886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL9-0000ma-6L; Fri, 20 Feb 2026 21:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237613.1539886; Fri, 20 Feb 2026 21:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL8-0000kN-QX; Fri, 20 Feb 2026 21:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1237613;
 Fri, 20 Feb 2026 21:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL7-0008IG-8g
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:09 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3d11e93-0ea5-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 22:47:07 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso33419175e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:07 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:05 -0800 (PST)
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
X-Inumbo-ID: b3d11e93-0ea5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624027; x=1772228827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beuTbfe9kV1Ouyfxy/gjE8egNOMK+gVzuCqzx8daylA=;
        b=BMiR/T+WEvvW5iGsKAdgfi+cPActfn8vFvDu97HWE0xiqgu3PSNY7LK2RjwCHIGzDl
         mmO5MGekILMGQOVadEMiwyzuSymZgpES00rTNtDjcGOvq+sP9S4JrVgxkoR8tjIuFFg6
         y2ygy7gCQ/aQb9W0TAqByris1EsG8MDxDK4GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624027; x=1772228827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=beuTbfe9kV1Ouyfxy/gjE8egNOMK+gVzuCqzx8daylA=;
        b=ef7zwv9kOpaDwizhAtPxmwwQIbkuW8TJR4LaD2yGYkhNU5HmQonLPJLKlnoffICbE3
         WPXUYygXOjMcKiMyrRO+OPISyzgIC9Uv992lnsXyUlZmdY8UB1UcxoCQMTK5hO5I6xr2
         DJO5K8asFrk1npquct2kyCNA4pAOSIDzhfgDVvQKE1bVPeEB531XuWRkOWgRwKdo80VG
         UVh77IfE/BCvelJgDa34p41RWpdxCxMvmtvcw2qhR0oeOSUiy1A9YHB88ePs2gLegU2P
         wII8af5oVmnCoaX3zNDFoYg0T9njVfXxol1pvNwfVW6E7xc2f/jpEdjIFxyscglpnSHv
         IDxA==
X-Gm-Message-State: AOJu0Yx+ph2GtDPum6vR6IYgN/LhR9+DCXS1fzWFgoT4BoQkK1Bh1R7M
	BClaXq/nqbPU66r28q36nCPP1ItN0x8Qs/4VTbbawG5TDSQkNi7zIrJGbhpE7ckvp3ChMqkIMoG
	FWcug
X-Gm-Gg: AZuq6aJ4get2Cv4QPIfRMmil837pY/iZiHLZsERPVCmMPIlMCSkOmOpOHLnPvTXidLz
	gKFst0iC8osqgJqOdRZrneymSHG5uL0dQBgPrRUeSzrFpWI4LCkly2HAem50ohcbam8En6lRTBW
	RaZI2a86HR2EICn/1SaKEKfz9r8sL8rYRI2Ybnkp/xOsaeAx5sUU11VL28QsiaLHZbofH7KHzSR
	JE6oRTNDFNql54fy1qrm/J/Q8UyJgX8bD/oHGerFtg86sbRJjmRGDGS0cFcxWpVdlJY4q14gs6e
	V4GJo0s6AmbRgRT1D9zTxdrxts/R87oreLgtcaJGJYx4Vnou1FA2rFZsfrsSlo0Fc5qCXC3WPtb
	SvyamgZ6PjQTJNQ+/zl3Zw5EDBIaLDmTuhCDfQtQjnf+hNLtoFhvTyoy05U7iGxqcp4kxFQ8Joc
	TIKLa+iZxryOjg/12dvP3LKFZGD4SQ153TCuD52K6jYhVk+5vxFZfox9JK20Z3aPP5ILjHH3w=
X-Received: by 2002:a05:600c:1c29:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-483a949e5edmr17807355e9.5.1771624025939;
        Fri, 20 Feb 2026 13:47:05 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 04/12] xen/treewide: Adjust parameter names and types
Date: Fri, 20 Feb 2026 21:46:45 +0000
Message-Id: <20260220214653.3497384-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EC36916B0D2
X-Rspamd-Action: no action

MISRA Rule 8.2 says that parameters must all have names.  Rule 8.3 says that
the names and types must match between declaration and definition.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/include/asm/pci.h    |  2 +-
 xen/arch/arm/pci/pci-access.c     |  4 ++--
 xen/arch/x86/include/asm/compat.h |  2 +-
 xen/arch/x86/include/asm/p2m.h    |  2 +-
 xen/arch/x86/mm/mem_paging.c      |  2 +-
 xen/crypto/vmac.c                 |  2 +-
 xen/include/crypto/rijndael.h     | 16 ++++++++--------
 xen/include/xen/acpi.h            |  2 +-
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 08ffcd443862..73c3be74aef1 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -98,7 +98,7 @@ struct pci_ecam_ops {
     unsigned int            bus_shift;
     struct pci_ops          pci_ops;
     int (*cfg_reg_index)(struct dt_device_node *dev);
-    int (*init)(struct pci_config_window *);
+    int (*init)(struct pci_config_window *cfg);
 };
 
 /* Default ECAM ops */
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 4a9486750199..c0533c00c9a5 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -135,9 +135,9 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
 
 #define PCI_OP_WRITE(size, type)                            \
     void pci_conf_write##size(pci_sbdf_t sbdf,              \
-                              unsigned int reg, type val)   \
+                              unsigned int reg, type data)  \
 {                                                           \
-    pci_config_write(sbdf, reg, size / 8, val);             \
+    pci_config_write(sbdf, reg, size / 8, data);            \
 }
 
 #define PCI_OP_READ(size, type)                             \
diff --git a/xen/arch/x86/include/asm/compat.h b/xen/arch/x86/include/asm/compat.h
index 30ed8f2fd0dc..f12f4f24d802 100644
--- a/xen/arch/x86/include/asm/compat.h
+++ b/xen/arch/x86/include/asm/compat.h
@@ -16,7 +16,7 @@ typedef unsigned long full_ptr_t;
 
 struct domain;
 #ifdef CONFIG_PV32
-int switch_compat(struct domain *);
+int switch_compat(struct domain *d);
 #else
 #include <xen/errno.h>
 static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index ef6b02ff0bb6..92be64e134e8 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -773,7 +773,7 @@ static inline int relinquish_p2m_mapping(struct domain *d)
  */
 
 /* Modify p2m table for shared gfn */
-int set_shared_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
+int set_shared_p2m_entry(struct domain *d, unsigned long gfn_l, mfn_t mfn);
 
 /* Tell xenpaging to drop a paged out frame */
 void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn, p2m_type_t p2mt);
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index ac8d34ffa074..d4b3cb990c54 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -156,7 +156,7 @@ void p2m_mem_paging_populate(struct domain *d, gfn_t gfn)
  *
  * If the gfn was dropped the vcpu needs to be unpaused.
  */
-void p2m_mem_paging_resume(struct domain *d, vm_event_response_t *rsp)
+void p2m_mem_paging_resume(struct domain *d, struct vm_event_st *rsp)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     p2m_type_t p2mt;
diff --git a/xen/crypto/vmac.c b/xen/crypto/vmac.c
index acb4e015f511..f1f6d75f8eeb 100644
--- a/xen/crypto/vmac.c
+++ b/xen/crypto/vmac.c
@@ -702,7 +702,7 @@ static uint64_t l3hash(uint64_t p1, uint64_t p2,
 
 /* ----------------------------------------------------------------------- */
 
-void vhash_update(unsigned char *m,
+void vhash_update(unsigned char  m[],
                   unsigned int   mbytes, /* Pos multiple of VMAC_NHBYTES */
                   vmac_ctx_t    *ctx)
 {
diff --git a/xen/include/crypto/rijndael.h b/xen/include/crypto/rijndael.h
index 4386be587851..80c612749f9e 100644
--- a/xen/include/crypto/rijndael.h
+++ b/xen/include/crypto/rijndael.h
@@ -45,14 +45,14 @@ typedef struct {
 	u32	dk[4*(AES_MAXROUNDS + 1)];	/* decrypt key schedule */
 } rijndael_ctx;
 
-int	 rijndael_set_key(rijndael_ctx *, const unsigned char *, int);
-int	 rijndael_set_key_enc_only(rijndael_ctx *, const unsigned char *, int);
-void	 rijndael_decrypt(rijndael_ctx *, const unsigned char *, unsigned char *);
-void	 rijndael_encrypt(rijndael_ctx *, const unsigned char *, unsigned char *);
+int	 rijndael_set_key(rijndael_ctx *ctx, const unsigned char *key, int bits);
+int	 rijndael_set_key_enc_only(rijndael_ctx *ctx, const unsigned char *key, int bits);
+void	 rijndael_decrypt(rijndael_ctx *ctx, const unsigned char *src, unsigned char *dst);
+void	 rijndael_encrypt(rijndael_ctx *ctx, const unsigned char *src, unsigned char *dst);
 
-int	rijndaelKeySetupEnc(unsigned int [], const unsigned char [], int);
-int	rijndaelKeySetupDec(unsigned int [], const unsigned char [], int);
-void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [16],
-	    unsigned char [16]);
+int	rijndaelKeySetupEnc(unsigned int rk[], const unsigned char cipherKey[], int keyBits);
+int	rijndaelKeySetupDec(unsigned int rk[], const unsigned char cipkerKey[], int keyBits);
+void	rijndaelEncrypt(const unsigned int rk[], int Nr, const unsigned char pt[16],
+			unsigned char ct[16]);
 
 #endif /* __RIJNDAEL_H */
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 90635ba0f322..ca87cd15a824 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -75,7 +75,7 @@ typedef int (*acpi_table_handler) (struct acpi_table_header *table);
 typedef int (*acpi_table_entry_handler) (struct acpi_subtable_header *header, const unsigned long end);
 
 unsigned int acpi_get_processor_id (unsigned int cpu);
-char * __acpi_map_table (paddr_t phys_addr, unsigned long size);
+char * __acpi_map_table (paddr_t phys, unsigned long size);
 bool __acpi_unmap_table(const void *ptr, unsigned long size);
 int acpi_boot_init (void);
 int acpi_boot_table_init (void);
-- 
2.39.5


