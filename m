Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H8KN27WmGl7NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC216B0B5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237619.1539955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLF-0002UW-IF; Fri, 20 Feb 2026 21:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237619.1539955; Fri, 20 Feb 2026 21:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYLE-0002KG-SQ; Fri, 20 Feb 2026 21:47:16 +0000
Received: by outflank-mailman (input) for mailman id 1237619;
 Fri, 20 Feb 2026 21:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYLB-0008Ew-Cs
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:13 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b61d39a9-0ea5-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 22:47:11 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-436356740e6so2654077f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:11 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:10 -0800 (PST)
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
X-Inumbo-ID: b61d39a9-0ea5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624031; x=1772228831; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL0YluuNljQpopZEfgU7W97F1VvgWXQ8YTIYrdrO7hc=;
        b=Q2M2FZisofsQDWxzuJLABo41tKT3ptdHqJDDaU5HpZVCoGqDc0Bm32JHdghcTbVbzE
         zFUGHHOxTNaAQLXZiB13yVBzhP6KhSRhxJ4B8Vte/RhZrdHRQYZhFM+nuOWj2mpEf+uK
         WPP6A4B43Ed1Wf48s67ZDHMHWEUcU0B3ZQT4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624031; x=1772228831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QL0YluuNljQpopZEfgU7W97F1VvgWXQ8YTIYrdrO7hc=;
        b=WcWZXIK1XI5IpTFiP+/cgyz7VSdaaoiUjTtY9dm0lTb1SN2bDsSWY4oN4H5jwnouYY
         SiGF3K/twIYDAPO/Qu6eMQcxQ66FjpFKmdlVcAHIEb2N5uKPsYg3K7oFGpEYKeXBnYkA
         Jl+JxlxM+zfxcTm7ZnYL6qtLVjcC93TbKCIFkoUY0NK+3JnpR38HRM/ShoxyxxlNbtVZ
         yvsdnXhPCEBqhYxWC56eyinwHBVVvyi7HVpZqAKVzM5z3Vw0Nz3ytqBUFLc25dGwN8yi
         uO7yycp3hgG++CcjmBmegTmzCverV3FGsIs1kY0Fotj6I3/yF+UDk+cvmUG6KIz6JgsA
         DgpA==
X-Gm-Message-State: AOJu0Yx/fs0RPfQrmkzYwEsQV64oth7aGScxVBmup8YQYpAPNuaOFjjb
	qVhylPCbp62mAQkggJC38WLMiS3LGHf0vNc7XzKA37lquEmu6EceXiZRNGo6xIOwrkkZQZWWTrK
	H+I7pDaATNA==
X-Gm-Gg: AZuq6aLlIHR4MJwhmMdYzJMLeUpnvc3AxqR5MfYo6TWLjyzzJrNj6OY2pkIIo4os9rQ
	QrujDU56iGtmWn/CCrJkaWpTHKaJh+/lLFhI6cYQmYmXSeEDFgApJZsGGGGrmM2I3DgKJgmHPE9
	MLC1yFcumgmGKX64KfY3KkPMT/paimpLvcAoRPRPSPCViEMNyhmJFjFBZYgW1hf4tDQIVbSmfE+
	evnPgqo5B2ly2fSe3Nguduyqkf1hP96AkMlycQUk4tTEN2GI3poEQZ9EhHuEItFgPs+5+p+ZAoU
	iyxwFnfUVLQzMEgwl6bwNoPOk4G2bXezPCas5NfU+fivsa0mK15Z4aJzx3TmGanI8NPGCwAJ7SR
	bmffEHuQw/6g57XsmlvQRjYtqS6p544baKwoDV5ntAxoLm9WZto8aBY+8ozAucVTDYSDozaTM6B
	00S+HZ6sZYeF25fghn5qV+ZXodwbr2KI2zWuYE1GR74duDlrWInpK02SpuEBgtC+aybqb1ZEQ=
X-Received: by 2002:a05:600c:3b10:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-483a963d603mr13512275e9.33.1771624030450;
        Fri, 20 Feb 2026 13:47:10 -0800 (PST)
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
Subject: [PATCH 11/12] xen: Bracket uses of macro parameters
Date: Fri, 20 Feb 2026 21:46:52 +0000
Message-Id: <20260220214653.3497384-12-andrew.cooper3@citrix.com>
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 90BC216B0B5
X-Rspamd-Action: no action

Fixing Rule 20.7 violations.

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
 xen/arch/arm/pci/pci-access.c       |  6 +++---
 xen/arch/x86/include/asm/bootinfo.h |  2 +-
 xen/arch/x86/mm/shadow/multi.c      |  2 +-
 xen/common/kimage.c                 | 11 ++++++-----
 xen/common/livepatch.c              | 11 ++++++-----
 xen/crypto/vmac.c                   |  8 ++++----
 xen/include/xen/libfdt/libfdt.h     |  6 +++---
 7 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 2b23d552bbfb..7bd6877596d4 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -16,7 +16,7 @@
 #include <asm/io.h>
 
 #define INVALID_VALUE (~0U)
-#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
+#define PCI_ERR_VALUE(len) GENMASK(0, (len) * 8)
 
 static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
                                      pci_sbdf_t sbdf)
@@ -139,14 +139,14 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
     void pci_conf_write##size(pci_sbdf_t sbdf,              \
                               unsigned int reg, type data)  \
 {                                                           \
-    pci_config_write(sbdf, reg, size / 8, data);            \
+    pci_config_write(sbdf, reg, (size) / 8, data);          \
 }
 
 #define PCI_OP_READ(size, type)                             \
     type pci_conf_read##size(pci_sbdf_t sbdf,               \
                               unsigned int reg)             \
 {                                                           \
-    return pci_config_read(sbdf, reg, size / 8);            \
+    return pci_config_read(sbdf, reg, (size) / 8);          \
 }
 
 PCI_OP_READ(8, uint8_t)
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 4f2cc5906e59..b3a6b2acf3ac 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -75,7 +75,7 @@ static inline unsigned int __init next_boot_module_index(
 #define for_each_boot_module_by_type(i, b, t)           \
     for ( (i) = first_boot_module_index(b, t);          \
           (i) <= (b)->nr_modules;                       \
-          (i) = next_boot_module_index(b, t, i + 1) )
+          (i) = next_boot_module_index(b, t, (i) + 1) )
 
 #endif /* X86_BOOTINFO_H */
 
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 3bbaceec1287..9de60720db20 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -793,7 +793,7 @@ do {                                                                    \
 do {                                                                    \
     int __done = 0;                                                     \
     _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p,                         \
-                         ({ (__done = _done); }), _code);               \
+                         ({ (__done = (_done)); }), _code);             \
     _sl1mfn = sh_next_page(_sl1mfn);                                    \
     if ( !__done )                                                      \
         _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code);      \
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index e1aec5a18a54..972301368443 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -491,11 +491,12 @@ static void kimage_terminate(struct kexec_image *image)
  * Call unmap_domain_page(ptr) after the loop exits.
  */
 #define for_each_kimage_entry(image, ptr, entry)                        \
-    for ( ptr = map_domain_page(_mfn(paddr_to_pfn(image->head)));       \
-          (entry = *ptr) && !(entry & IND_DONE);                        \
-          ptr = (entry & IND_INDIRECTION) ?                             \
-              (unmap_domain_page(ptr), map_domain_page(_mfn(paddr_to_pfn(entry)))) \
-              : ptr + 1 )
+    for ( (ptr) = map_domain_page(_mfn(paddr_to_pfn((image)->head)));   \
+          ((entry) = *(ptr)) && !((entry) & IND_DONE);                  \
+          (ptr) = (((entry) & IND_INDIRECTION)                          \
+                   ? (unmap_domain_page(ptr),                           \
+                      map_domain_page(_mfn(paddr_to_pfn(entry))))       \
+                   : (ptr) + 1) )
 
 static void kimage_free_entry(kimage_entry_t entry)
 {
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7446533c8cfb..63473925cafb 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -664,9 +664,10 @@ static inline int livepatch_check_expectations(const struct payload *payload)
     const struct livepatch_elf_sec *__sec = livepatch_elf_sec_by_name(elf, section_name); \
     if ( !__sec )                                                                         \
         break;                                                                            \
-    if ( !section_ok(elf, __sec, sizeof(*hook)) || __sec->sec->sh_size != sizeof(*hook) ) \
+    if ( !section_ok(elf, __sec, sizeof(*(hook))) ||                                      \
+         __sec->sec->sh_size != sizeof(*(hook)) )                                         \
         return -EINVAL;                                                                   \
-    hook = __sec->addr;                                                                   \
+    (hook) = __sec->addr;                                                                 \
 } while (0)
 
 /*
@@ -678,10 +679,10 @@ static inline int livepatch_check_expectations(const struct payload *payload)
     const struct livepatch_elf_sec *__sec = livepatch_elf_sec_by_name(elf, section_name); \
     if ( !__sec )                                                                         \
         break;                                                                            \
-    if ( !section_ok(elf, __sec, sizeof(*hook)) )                                         \
+    if ( !section_ok(elf, __sec, sizeof(*(hook))) )                                       \
         return -EINVAL;                                                                   \
-    hook = __sec->addr;                                                                   \
-    nhooks = __sec->sec->sh_size / sizeof(*hook);                                         \
+    (hook) = __sec->addr;                                                                 \
+    (nhooks) = __sec->sec->sh_size / sizeof(*(hook));                                     \
 } while (0)
 
 static int prepare_payload(struct payload *payload,
diff --git a/xen/crypto/vmac.c b/xen/crypto/vmac.c
index c9914d2c7c1d..c7aa1e9be3b9 100644
--- a/xen/crypto/vmac.c
+++ b/xen/crypto/vmac.c
@@ -203,7 +203,7 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
 #define nh_16(mp, kp, nw, rh, rl)                                            \
 {   int i; uint64_t th, tl;                                                  \
     rh = rl = 0;                                                             \
-    for (i = 0; i < nw; i+= 2) {                                             \
+    for (i = 0; i < (nw); i+= 2) {                                           \
         MUL64(th,tl,get64PE((mp)+i  )+(kp)[i  ],get64PE((mp)+i+1)+(kp)[i+1]);\
         ADD128(rh,rl,th,tl);                                                 \
     }                                                                        \
@@ -211,7 +211,7 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
 #define nh_16_2(mp, kp, nw, rh, rl, rh1, rl1)                                \
 {   int i; uint64_t th, tl;                                                  \
     rh1 = rl1 = rh = rl = 0;                                                 \
-    for (i = 0; i < nw; i+= 2) {                                             \
+    for (i = 0; i < (nw); i+= 2) {                                           \
         MUL64(th,tl,get64PE((mp)+i  )+(kp)[i  ],get64PE((mp)+i+1)+(kp)[i+1]);\
         ADD128(rh,rl,th,tl);                                                 \
         MUL64(th,tl,get64PE((mp)+i  )+(kp)[i+2],get64PE((mp)+i+1)+(kp)[i+3]);\
@@ -223,7 +223,7 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
 #define nh_vmac_nhbytes(mp, kp, nw, rh, rl)                                  \
 {   int i; uint64_t th, tl;                                                  \
     rh = rl = 0;                                                             \
-    for (i = 0; i < nw; i+= 8) {                                             \
+    for (i = 0; i < (nw); i+= 8) {                                           \
         MUL64(th,tl,get64PE((mp)+i  )+(kp)[i  ],get64PE((mp)+i+1)+(kp)[i+1]);\
         ADD128(rh,rl,th,tl);                                                 \
         MUL64(th,tl,get64PE((mp)+i+2)+(kp)[i+2],get64PE((mp)+i+3)+(kp)[i+3]);\
@@ -237,7 +237,7 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
 #define nh_vmac_nhbytes_2(mp, kp, nw, rh, rl, rh1, rl1)                      \
 {   int i; uint64_t th, tl;                                                  \
     rh1 = rl1 = rh = rl = 0;                                                 \
-    for (i = 0; i < nw; i+= 8) {                                             \
+    for (i = 0; i < (nw); i+= 8) {                                           \
         MUL64(th,tl,get64PE((mp)+i  )+(kp)[i  ],get64PE((mp)+i+1)+(kp)[i+1]);\
         ADD128(rh,rl,th,tl);                                                 \
         MUL64(th,tl,get64PE((mp)+i  )+(kp)[i+2],get64PE((mp)+i+1)+(kp)[i+3]);\
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index fabddbee8cec..1b09bba28eea 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -230,9 +230,9 @@ int fdt_next_subnode(const void *fdt, int offset);
  * literal.
  */
 #define fdt_for_each_subnode(node, fdt, parent)		\
-	for (node = fdt_first_subnode(fdt, parent);	\
-	     node >= 0;					\
-	     node = fdt_next_subnode(fdt, node))
+	for ((node) = fdt_first_subnode(fdt, parent);	\
+	     (node) >= 0;				\
+	     (node) = fdt_next_subnode(fdt, node))
 
 /**********************************************************************/
 /* General functions                                                  */
-- 
2.39.5


