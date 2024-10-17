Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029CB9A2A2F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820852.1234511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Twe-0001Bi-Gy; Thu, 17 Oct 2024 17:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820852.1234511; Thu, 17 Oct 2024 17:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Twe-00019s-Db; Thu, 17 Oct 2024 17:05:52 +0000
Received: by outflank-mailman (input) for mailman id 820852;
 Thu, 17 Oct 2024 17:05:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Twc-0008TH-BQ
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:05:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dfb6901-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:05:49 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184633549591.1849705803486;
 Thu, 17 Oct 2024 10:03:53 -0700 (PDT)
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
X-Inumbo-ID: 0dfb6901-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184635; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bRqieGlVFZ/N04xtoYCV2/nB4oT+9dzFbm7jPyI55EBmij42qn6zfrhUYqdYSKj5G+Kph8LV2DNPhq974/BktseYSjAMIjna9UAq+639P74dxcBYtBpvZpiA6Np7iAUnscBnHkKBg/P8pVBeOqH+VMXRE8pqA/6EgPARw4H1e4E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184635; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UOSq2CQ+avjz4TDy8H9wvkgSNIMCssGHhL5g606izH0=; 
	b=hNwIchschivOXSjMOrWOSXEpKNE9jrHA0ljfizKfslueb5CoLKnhYQ1xRuMFKosmI1SrGnI59m8QmvPnNBKKoCG5C6tcp7MAfT4peG7Dra2kLX6ptRSmqZfq54xZZ4JwuV87g1/jfuhobFivE+yn8w/UrSMaT+e3JcX3HH+04bs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184635;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=UOSq2CQ+avjz4TDy8H9wvkgSNIMCssGHhL5g606izH0=;
	b=tbfOUxOwC2qw65HyPaOR/AOqCwFrs30Hb+N6c49ws9ZGmdtizFGP1T/ykjx8UE0F
	MeVyqtcSe8rWG7wsdF31zxBnjVGhhIqwTJ/MRARWIO5raN5kouLAdhDtLVlxXqdfe7C
	hcxcnmRKE5xYkivyMh14JsrS56RUMMvODZoLfmFk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 15/44] x86/boot: introduce consumed flag for struct boot_module
Date: Thu, 17 Oct 2024 13:02:55 -0400
Message-Id: <20241017170325.3842-16-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Allow the tracking of when a boot module has been consumed by a handler in the
hypervisor independent of when it is claimed. The instances where the
hypervisor does nothing beyond claiming, the dom0 kernel, dom0 ramdisk, and a
placeholder for itself, are updated as being consumed at the time of being
claimed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- first flag assignment can be = instead of |=
---
 xen/arch/x86/include/asm/bootinfo.h | 1 +
 xen/arch/x86/setup.c                | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 3010e6f4af9c..6903ab00ec90 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -42,6 +42,7 @@ struct boot_module {
 
     uint32_t flags;
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
+#define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
 
     paddr_t start;
     size_t size;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 44cec48fc877..8261a87d9fb4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -318,6 +318,7 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
 
     /* map the last mb module for xen entry */
     bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
+    bi->mods[bi->nr_modules].flags = BOOTMOD_FLAG_X86_CONSUMED;
 
     return bi;
 }
@@ -1180,6 +1181,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     bitmap_fill(module_map, bi->nr_modules);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->mods[0].flags = BOOTMOD_FLAG_X86_CONSUMED;
 
     if ( pvh_boot )
     {
@@ -2068,7 +2070,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     initrdidx = find_first_bit(module_map, bi->nr_modules);
     if ( initrdidx < bi->nr_modules )
+    {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        bi->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+    }
     if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


