Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2AA9921E7
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811407.1224200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFf-0004cd-Ng; Sun, 06 Oct 2024 21:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811407.1224200; Sun, 06 Oct 2024 21:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFf-0004Yt-JO; Sun, 06 Oct 2024 21:57:19 +0000
Received: by outflank-mailman (input) for mailman id 811407;
 Sun, 06 Oct 2024 21:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZCL-0007Zk-1e
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:53:53 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78bbd94c-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:53:52 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251436997842.3804635331212;
 Sun, 6 Oct 2024 14:50:36 -0700 (PDT)
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
X-Inumbo-ID: 78bbd94c-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251438; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DCFg2UlgJ9kxRpCSZac3bnSsQF7cc+mSGMixX1sZr+ZC/cGGZE3sti2n8RfT/cZabwNepzEcI0lms13FaiugCtR/6dZdw0UZMsJoqktPhuGqEh+eRhVW+l3YAB5kUQNc+Tw5gFRPZ+QDDh442a6S1nmS22AH4nliZl8edtWbKqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251438; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k6RMuxzCGNIwefwYfLaAQQdjZurM3hL6dfBBxSvt0dY=; 
	b=aoH+7sZUt2pnpMOF40B+oNADdALUkO7nH+Nln5XTjDXVYrwGTh6iDso7AiFrSBfOb+RTujKwIUgvFSnz67V+J2bpaSEXy5lvuDYl0lWh7Mlg7kWJasulye/ApEdb+rd21CP6rQp+gX7LiRpzV10l8VWSjpExEppJZBb/jzd1qLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251438;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=k6RMuxzCGNIwefwYfLaAQQdjZurM3hL6dfBBxSvt0dY=;
	b=Aom7nRvQi3CsVAyVj3cLtDsCAbXj8WW9Y5CFYlM9nDNiuSWvv4HrloHl2a/Dh2BK
	OikVEyu1zTCDioZ7EGMmaV/Xrl0knMjqT+wX2SJ4HfDesB7YaN9aaRYNa4kf+H3Y3Wo
	W4dzKo1IymEzocC5TnfxO8x9rlyU0kxTiQcYdsP4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 28/44] x86/boot: add cmdline to struct boot_module
Date: Sun,  6 Oct 2024 17:49:39 -0400
Message-Id: <20241006214956.24339-29-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a char pointer field, cmdline, to struct boot_module to hold the address
pointed to by the string field of struct mod. This removes the need to use the
early_mod field to get to the dom0 kernel command line.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 2 ++
 xen/arch/x86/setup.c                | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 9ed260629012..3b6bfbe88770 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -38,6 +38,8 @@ struct boot_module {
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
 #define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
 
+    const char *cmdline;
+
     paddr_t start;
     size_t size;
 };
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index aed0837902c4..d5916e85f68e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -312,6 +312,8 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
     {
         bi->mods[i].mod = &mods[i];
 
+        bi->mods[i].cmdline = (char *)(paddr_t)mods[i].string;
+
         bi->mods[i].start = (paddr_t)mods[i].mod_start;
         bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
     }
@@ -1000,10 +1002,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->mod->string || bi->kextra )
+    if ( image->cmdline || bi->kextra )
     {
-        if ( image->mod->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->mod->string),
+        if ( image->cmdline )
+            safe_strcpy(cmdline,
+                        cmdline_cook(__va((unsigned long)image->cmdline),
                         bi->loader));
 
         if ( bi->kextra )
-- 
2.30.2


