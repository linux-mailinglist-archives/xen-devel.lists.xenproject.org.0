Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B1F9921DF
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811390.1224135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFK-0000mj-9o; Sun, 06 Oct 2024 21:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811390.1224135; Sun, 06 Oct 2024 21:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFK-0000hK-3L; Sun, 06 Oct 2024 21:56:58 +0000
Received: by outflank-mailman (input) for mailman id 811390;
 Sun, 06 Oct 2024 21:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZAO-00051E-AM
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:51:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3039b3c7-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:51:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251418372861.7563899223412;
 Sun, 6 Oct 2024 14:50:18 -0700 (PDT)
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
X-Inumbo-ID: 3039b3c7-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251420; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I4jJR9a2EHCuDsSvc8luUnOJetc4IHL1G9aidlEdyl6Wf6TAhPZ/MMEVdENH5fLb88H9KkyeKP1RGsRr5yGHFUSs1Wcq6+zfE1mEpFQC0SPVcJw+ur0HGpd5kndTujZWqpBfVP+hKYJWJ1Md4IibIIkYSxl+kJFHMTBDhRULblo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251420; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RcV1PHBeCLrZ2Ul5KaCez/ZJJqAAL9qH6Sb79p3LNdQ=; 
	b=mAiyY4SN353oPkWOzYkw6jI6Xux4ausBMrn44iPlxeVCdclSCvn00V81mFSHvMRgF5deWWbqWVyq9H5IfyZtPqBHv0D2Hvm16USNXDgnHmatp2HpD/rfhdzz6Xt274VwEjfNxOD/p8uXpyKFFhOY1aj9Kjhnj1kehU/y7uBt0N8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251420;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=RcV1PHBeCLrZ2Ul5KaCez/ZJJqAAL9qH6Sb79p3LNdQ=;
	b=OFRdUUu86PgsTQnySZnQ0V86SOkirQmUTbS0tV1xjDxC+vuwLVIwmu9Pz3P6Pauj
	BVdawHpqPVuo4ohL8IbFGbTLEH2uqTF1CWF34DwugX4mfMwUCwA5pT97W2o15Lg/MoS
	stQTTX1sdOFWEuV2RdzdPAqJwxl8kLkjmR01Tqpk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 12/44] x86/boot: add start and size fields to struct boot_module
Date: Sun,  6 Oct 2024 17:49:23 -0400
Message-Id: <20241006214956.24339-13-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces the start and size fields to struct boot_module and adds
a corresponding bootstrap mapping function, bootstrap_map_bm.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  2 ++
 xen/arch/x86/include/asm/setup.h    |  2 ++
 xen/arch/x86/setup.c                | 13 +++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 021ff0d93643..2ee0d5ad6d72 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -35,6 +35,8 @@ struct boot_module {
     uint32_t flags;
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
 
+    paddr_t start;
+    size_t size;
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 213584b05fb2..bb7e73258a21 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -2,6 +2,7 @@
 #define __X86_SETUP_H_
 
 #include <xen/multiboot.h>
+#include <asm/bootinfo.h>
 #include <asm/numa.h>
 
 extern const char __2M_text_start[], __2M_text_end[];
@@ -38,6 +39,7 @@ unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
 void *bootstrap_map_addr(paddr_t start, paddr_t end);
 void *bootstrap_map(const module_t *mod);
+void *bootstrap_map_bm(const struct boot_module *bm);
 
 int remove_xen_ranges(struct rangeset *r);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1cc7fcba094b..093a4f5380d1 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -309,8 +309,13 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
      * should have been reserved to hold an entry for Xen.
      */
     for ( i = 0; i <= bi->nr_modules; i++ )
+    {
         bi->mods[i].mod = &mods[i];
 
+        bi->mods[i].start = (paddr_t)mods[i].mod_start;
+        bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
+    }
+
     /* map the last mb module for xen entry */
     bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
     bi->mods[bi->nr_modules].mod = &mods[bi->nr_modules];
@@ -477,6 +482,14 @@ void *__init bootstrap_map(const module_t *mod)
                               pfn_to_paddr(mod->mod_start) + mod->mod_end);
 }
 
+void *__init bootstrap_map_bm(const struct boot_module *bm)
+{
+    if ( !bm )
+        return bootstrap_map_addr(0, 0);
+
+    return bootstrap_map_addr(bm->start, bm->start + bm->size);
+}
+
 static void __init move_memory(
     uint64_t dst, uint64_t src, unsigned int size)
 {
-- 
2.30.2


