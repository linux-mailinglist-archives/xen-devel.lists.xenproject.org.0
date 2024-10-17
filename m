Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2AC9A2A8C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820939.1234685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U7V-0004Bl-Jt; Thu, 17 Oct 2024 17:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820939.1234685; Thu, 17 Oct 2024 17:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U7V-00049Z-GJ; Thu, 17 Oct 2024 17:17:05 +0000
Received: by outflank-mailman (input) for mailman id 820939;
 Thu, 17 Oct 2024 17:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TxO-0008TH-ST
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:06:38 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b0226f4-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:06:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184642001935.7928067426468;
 Thu, 17 Oct 2024 10:04:02 -0700 (PDT)
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
X-Inumbo-ID: 2b0226f4-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VThMhDqlfyEbcCaSZ4XQ//QSDbd2FvoW9cNkyRyOmoBaUzboZAO8jIZQ684Sea4w4Jet6lIYaVAMgXg+iMB2ti8L/iYyXv+VsFB2P1E9HK4xwlnukuQjgUL2Nx1i+WXxDhFDbXLMBlZqCuvu92q538ubRWRT7gc77rCnhBuQl+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184644; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a9E8yTqYav2aI/xh1POt8XbQvYtTU40bLqsYbWj2y9s=; 
	b=aIkOl1TcwtmHYXqTQ8rMRfsLaKTijG8zrJvjstr2pTH8AKcEH8seC4pOwmBO+hB7FxMV1Z10c8qWWx8KbEscCD2eyetxKyewZTuCvj1Cf90Hzc0tZRxBXIjff7ykRGOT9B6omFkllzJfiwq6wI706TeSM9dZ3gYgaawPk+03wa0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184644;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=a9E8yTqYav2aI/xh1POt8XbQvYtTU40bLqsYbWj2y9s=;
	b=NCkCTvtSUm3XGj5CqdsH7YFc300BedFexRbHOP785xaw2+Ixc7K2d9ljI/IjUh5L
	ny7r0a6y9ONM8g7ygDWHHIQnP0M1FX1HUP2uMY/8KL/dXoqY8F/P86c2RrRo/IPgUh1
	AweAdVo2Fvm4nar/s4oJFrUCIx7nmnfINi7tRNpw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 21/44] x86/boot: convert ramdisk locating to struct boot_module
Date: Thu, 17 Oct 2024 13:03:01 -0400
Message-Id: <20241017170325.3842-22-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Locate the first unclaimed struct boot_module and mark it as ramdisk. If there
are any remaining unclaimed struct boot_module instances, report to the
console. In the change, the new boot module iterator is used to find the
initrd index, which returns a signed int. Switch initrdidx from unsigned to
signed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

---
Changes since v5:
- adjusted initrdidx check for prior changes to boot module search function
---
 xen/arch/x86/setup.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a4ddcb908626..6ba8a893daf0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2083,16 +2083,23 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = find_first_bit(module_map, bi->nr_modules);
-    if ( initrdidx < bi->nr_modules )
+    /*
+     * At this point all capabilities that consume boot modules should have
+     * claimed their boot modules. Find the first unclaimed boot module and
+     * claim it as the initrd ramdisk. Do a second search to see if there are
+     * any remaining unclaimed boot modules, and report them as unusued initrd
+     * candidates.
+     */
+    initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+    if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
         bi->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+        if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
+            printk(XENLOG_WARNING
+                   "Multiple initrd candidates, picking module #%u\n",
+                   initrdidx);
     }
-    if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
-        printk(XENLOG_WARNING
-               "Multiple initrd candidates, picking module #%u\n",
-               initrdidx);
 
     /*
      * We're going to setup domain0 using the module(s) that we stashed safely
-- 
2.30.2


