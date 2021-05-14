Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF966380CB9
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 17:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127410.239481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZa8-0000wz-DT; Fri, 14 May 2021 15:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127410.239481; Fri, 14 May 2021 15:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZa8-0000uW-A3; Fri, 14 May 2021 15:18:28 +0000
Received: by outflank-mailman (input) for mailman id 127410;
 Fri, 14 May 2021 15:18:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRnq=KJ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lhZa6-0000tx-RS
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 15:18:26 +0000
Received: from mail-qt1-x830.google.com (unknown [2607:f8b0:4864:20::830])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6ddc3a4-12b4-4881-b946-300767f7ec71;
 Fri, 14 May 2021 15:18:25 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id t7so22466997qtn.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 08:18:25 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 d84sm4665216qke.131.2021.05.14.08.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:18:23 -0700 (PDT)
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
X-Inumbo-ID: a6ddc3a4-12b4-4881-b946-300767f7ec71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SNd6wxVxBEfsPWZeVHLMlxGx5QbhPtmaFcdR2jE0DhI=;
        b=isN6jpvZ9+wi8AC1pGAG6y5F4EAetzbasi8ZdtM/pwptczuN3tbLUVmqKI+zR87xqa
         +rdRCbaYy34lYptq4sCCCDY86vYO5AFlDUkhsrf6jXVq1cvP4J8Hj+eU88JfrLAnoUSp
         ntRbc0V7DgM/CDq07IZzBRvXseZkzUuQLzQA9oskxyMi17VKowfdXqAvQBw6dmrFKOoX
         RQXCQ6WBpKZghTZTPkqrV+v1BLp/53a04iaFrDJBDVZWItQfetK1botqRtryWV3aATXq
         MoQqY4TiLNN98UEbH+U/brw0yRN/bSCZq5YJBrqevAchJoGnVFeJmddyIe6cuNsSjSMx
         gfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SNd6wxVxBEfsPWZeVHLMlxGx5QbhPtmaFcdR2jE0DhI=;
        b=kE+Uuwf9NWYdM8avjPQsDVqgG6HQ7eunxKEYwa+HucYoHchrZb+Lc+DVcRoVr4FQqL
         eM0y5lV/70vMY3y4iFQKR3SOkq9uuCZ3CNj2kaiyoHyaV39IyXJRoQpYdLKk3WPRPe/f
         YySMC9hJmCJrw63Cu2L85RNsFkQoQDQCOfXg1kvSx6jhnaYPVu4OxAYdCgutD3HiF3jl
         Qvn3ct4DD4gPlEzU+2OD8QUmdof1NN+KpscLv8LPKe7fYLcwZz7DoQgnUY0nu/g4Dc15
         dv7bClysrHCrOLr+9uWOC7YdT0TV4Gd5kRkCIogk0D4hu7VRtjuUswxXgUT1YWqTh6xe
         4EKQ==
X-Gm-Message-State: AOAM531H5DABgoJ9vB7uTwn8z/6CmqQeL2cLU9Yz48BYwSxxWQMJRMfJ
	KQz6nJRiJvLJp9FEW8aAJG4=
X-Google-Smtp-Source: ABdhPJx0mfe0AbHORJpxukjRQaK2Wz47YBNKWagyiAy/SODP9shExCXw374BbPNWWk/TDo++M0wDrg==
X-Received: by 2002:a05:622a:4e:: with SMTP id y14mr10512177qtw.186.1621005505325;
        Fri, 14 May 2021 08:18:25 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: jandryuk@gmail.com,
	xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	wl@xen.org
Subject: [RFC PATCH 2/3] libelf: Use flags to check pv or pvh in elf_xen_parse
Date: Fri, 14 May 2021 11:17:30 -0400
Message-Id: <20210514151731.19272-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514151731.19272-1-jandryuk@gmail.com>
References: <CAKf6xpsyzazbY_mA0QtAuAqpOPkpuhjrZ1wid0khWy1urh4iBg@mail.gmail.com>
 <20210514151731.19272-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain checks are only applicable to PV vs. PVH, so split them and run
only the appropriate checks for each.

This fixes loading a PVH kernel that has a PHYS32_ENTRY but not an ENTRY
ELF note.  Such a kernel would fail the virt_entry check which is not
applicable for PVH.

This re-instatates loader and xen version checks for the PV case that
were omited for kernels passing the PHYS32_ENTRY check.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/fuzz/libelf/libelf-fuzzer.c   |  2 +-
 tools/libs/guest/xg_dom_elfloader.c | 11 +++-
 tools/libs/guest/xg_dom_hvmloader.c |  2 +-
 xen/arch/x86/hvm/dom0_build.c       |  2 +-
 xen/arch/x86/pv/dom0_build.c        |  2 +-
 xen/common/libelf/libelf-dominfo.c  | 91 +++++++++++++++++++++++------
 xen/include/xen/libelf.h            |  7 ++-
 7 files changed, 93 insertions(+), 24 deletions(-)

diff --git a/tools/fuzz/libelf/libelf-fuzzer.c b/tools/fuzz/libelf/libelf-fuzzer.c
index 1ba8571711..f488510618 100644
--- a/tools/fuzz/libelf/libelf-fuzzer.c
+++ b/tools/fuzz/libelf/libelf-fuzzer.c
@@ -17,7 +17,7 @@ int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
         return -1;
 
     elf_parse_binary(elf);
-    elf_xen_parse(elf, &parms);
+    elf_xen_parse(elf, &parms, ELF_XEN_CHECK_PV | ELF_XEN_CHECK_PVH);
 
     return 0;
 }
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
index 06e713fe11..c3280b1603 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -120,6 +120,7 @@ static elf_negerrnoval check_elf_kernel(struct xc_dom_image *dom, bool verbose)
 static elf_negerrnoval xc_dom_probe_elf_kernel(struct xc_dom_image *dom)
 {
     struct elf_binary elf;
+    unsigned int flags;
     int rc;
 
     rc = check_elf_kernel(dom, 0);
@@ -135,7 +136,9 @@ static elf_negerrnoval xc_dom_probe_elf_kernel(struct xc_dom_image *dom)
      * or else we might be trying to load a plain ELF.
      */
     elf_parse_binary(&elf);
-    rc = elf_xen_parse(&elf, dom->parms);
+    flags = dom->container_type == XC_DOM_PV_CONTAINER ? ELF_XEN_CHECK_PV :
+                                                         ELF_XEN_CHECK_PVH;
+    rc = elf_xen_parse(&elf, dom->parms, flags);
     if ( rc != 0 )
         return rc;
 
@@ -146,6 +149,7 @@ static elf_negerrnoval xc_dom_parse_elf_kernel(struct xc_dom_image *dom)
 {
     struct elf_binary *elf;
     elf_negerrnoval rc;
+    unsigned int flags;
 
     rc = check_elf_kernel(dom, 1);
     if ( rc != 0 )
@@ -166,7 +170,10 @@ static elf_negerrnoval xc_dom_parse_elf_kernel(struct xc_dom_image *dom)
 
     /* parse binary and get xen meta info */
     elf_parse_binary(elf);
-    if ( elf_xen_parse(elf, dom->parms) != 0 )
+    flags = dom->container_type == XC_DOM_PV_CONTAINER ? ELF_XEN_CHECK_PV :
+                                                         ELF_XEN_CHECK_PVH;
+    rc = elf_xen_parse(elf, dom->parms, flags);
+    if ( rc != 0 )
     {
         rc = -EINVAL;
         goto out;
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index ec6ebad7fd..bf28690415 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -73,7 +73,7 @@ static elf_negerrnoval xc_dom_probe_hvm_kernel(struct xc_dom_image *dom)
      * else we might be trying to load a PV kernel.
      */
     elf_parse_binary(&elf);
-    rc = elf_xen_parse(&elf, dom->parms);
+    rc = elf_xen_parse(&elf, dom->parms, ELF_XEN_CHECK_PV | ELF_XEN_CHECK_PVH);
     if ( rc == 0 )
         return -EINVAL;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 5b9192ecc6..552448ce5d 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -561,7 +561,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     elf_set_verbose(&elf);
 #endif
     elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms)) != 0 )
+    if ( (rc = elf_xen_parse(&elf, &parms, ELF_XEN_CHECK_PVH)) != 0 )
     {
         printk("Unable to parse kernel for ELFNOTES\n");
         return rc;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e0801a9e6d..8bc77b0366 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -353,7 +353,7 @@ int __init dom0_construct_pv(struct domain *d,
         elf_set_verbose(&elf);
 
     elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms)) != 0 )
+    if ( (rc = elf_xen_parse(&elf, &parms, ELF_XEN_CHECK_PV)) != 0 )
         goto out;
 
     /* compatibility check */
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index b1f36866eb..13eb39ec52 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -359,7 +359,21 @@ elf_errorstatus elf_xen_parse_guest_info(struct elf_binary *elf,
 /* ------------------------------------------------------------------------ */
 /* sanity checks                                                            */
 
-static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
+static elf_errorstatus elf_xen_note_check_pvh(struct elf_binary *elf,
+                              struct elf_dom_parms *parms)
+{
+    /* PVH only requires one ELF note to be set */
+    if (parms->phys_entry != UNSET_ADDR32 )
+    {
+        elf_msg(elf, "ELF: Found PVH image\n");
+        return 0;
+    } else {
+        elf_err(elf, "ELF: Missing PVH PHYS32_ENTRY\n");
+        return -1;
+    }
+}
+
+static elf_errorstatus elf_xen_note_check_pv(struct elf_binary *elf,
                               struct elf_dom_parms *parms)
 {
     if ( (ELF_PTRVAL_INVALID(parms->elf_note_start)) &&
@@ -381,13 +395,6 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
          return 0;
     }
 
-    /* PVH only requires one ELF note to be set */
-    if ( parms->phys_entry != UNSET_ADDR32 )
-    {
-        elf_msg(elf, "ELF: Found PVH image\n");
-        return 0;
-    }
-
     /* Check the contents of the Xen notes or guest string. */
     if ( ((strlen(parms->loader) == 0) ||
           strncmp(parms->loader, "generic", 7)) &&
@@ -413,7 +420,36 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
     return 0;
 }
 
-static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
+static elf_errorstatus elf_xen_addr_calc_check_pvh(struct elf_binary *elf,
+                                                   struct elf_dom_parms *parms)
+{
+    parms->phys_kstart = elf->pstart;
+    parms->phys_kend   = elf->pend;
+
+    if ( parms->bsd_symtab )
+    {
+        elf_parse_bsdsyms(elf, elf->pend);
+        if ( elf->bsd_symtab_pend )
+            parms->phys_kend = elf->bsd_symtab_pend;
+    }
+
+    elf_msg(elf, "ELF: addresses:\n");
+    elf_msg(elf, "    phys_kstart      = 0x%" PRIx64 "\n", parms->phys_kstart);
+    elf_msg(elf, "    phys_kend        = 0x%" PRIx64 "\n", parms->phys_kend);
+    elf_msg(elf, "    phys_entry       = 0x%" PRIx32 "\n", parms->phys_entry);
+
+    if ( parms->phys_kstart > parms->phys_kend ||
+         parms->phys_entry < parms->phys_kstart ||
+         parms->phys_entry > parms->phys_kend )
+    {
+        elf_err(elf, "ERROR: ELF start or entries are out of bounds\n");
+        return -1;
+    }
+
+    return 0;
+}
+
+static elf_errorstatus elf_xen_addr_calc_check_pv(struct elf_binary *elf,
                                    struct elf_dom_parms *parms)
 {
     uint64_t virt_offset;
@@ -453,8 +489,6 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
     }
 
     virt_offset = parms->virt_base - parms->elf_paddr_offset;
-    parms->phys_kstart = elf->pstart;
-    parms->phys_kend   = elf->pend;
     parms->virt_kstart = elf->pstart + virt_offset;
     parms->virt_kend   = elf->pend   + virt_offset;
 
@@ -466,7 +500,6 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
         elf_parse_bsdsyms(elf, elf->pend);
         if ( elf->bsd_symtab_pend )
             parms->virt_kend = elf->bsd_symtab_pend + virt_offset;
-            parms->phys_kend = elf->bsd_symtab_pend;
     }
 
     elf_msg(elf, "ELF: addresses:\n");
@@ -500,9 +533,8 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
 
 /* ------------------------------------------------------------------------ */
 /* glue it all together ...                                                 */
-
-elf_errorstatus elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms)
+static elf_errorstatus elf_xen_parse_common(struct elf_binary *elf,
+                                            struct elf_dom_parms *parms)
 {
     ELF_HANDLE_DECL(elf_shdr) shdr;
     ELF_HANDLE_DECL(elf_phdr) phdr;
@@ -597,10 +629,35 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
         }
     }
 
-    if ( elf_xen_note_check(elf, parms) != 0 )
+    return 0;
+}
+
+elf_errorstatus elf_xen_parse(struct elf_binary *elf,
+                              struct elf_dom_parms *parms,
+                              unsigned int flags)
+{
+    if ( !flags ) {
+        elf_err(elf, "Must specify ELF_XEN_CHECK_{PV,PVH} flags to check");
         return -1;
-    if ( elf_xen_addr_calc_check(elf, parms) != 0 )
+    }
+
+    if ( elf_xen_parse_common(elf, parms) != 0 )
         return -1;
+
+    if ( flags & ELF_XEN_CHECK_PV ) {
+        if ( elf_xen_note_check_pv(elf, parms) != 0 )
+            return -1;
+        if ( elf_xen_addr_calc_check_pv(elf, parms) != 0 )
+            return -1;
+    }
+
+    if ( flags & ELF_XEN_CHECK_PVH ) {
+        if ( elf_xen_note_check_pvh(elf, parms) != 0 )
+            return -1;
+        if ( elf_xen_addr_calc_check_pvh(elf, parms) != 0 )
+            return -1;
+    }
+
     return 0;
 }
 
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index 8d80d0812a..858f42cf07 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -455,8 +455,13 @@ int elf_xen_parse_note(struct elf_binary *elf,
                        ELF_HANDLE_DECL(elf_note) note);
 int elf_xen_parse_guest_info(struct elf_binary *elf,
                              struct elf_dom_parms *parms);
+
+#define ELF_XEN_CHECK_PV  (1 << 0)
+#define ELF_XEN_CHECK_PVH (1 << 1)
+
 int elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms);
+                  struct elf_dom_parms *parms,
+                  unsigned int flags);
 
 static inline void *elf_memcpy_unchecked(void *dest, const void *src, size_t n)
     { return memcpy(dest, src, n); }
-- 
2.31.1


