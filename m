Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3FF9A584F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822970.1236957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2giq-00013k-PG; Mon, 21 Oct 2024 00:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822970.1236957; Mon, 21 Oct 2024 00:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2giq-0000wW-Kx; Mon, 21 Oct 2024 00:56:36 +0000
Received: by outflank-mailman (input) for mailman id 822970;
 Mon, 21 Oct 2024 00:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gbl-0003Iq-2H
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:49:17 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ab63ad6-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:49:15 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471609370815.6656070423512;
 Sun, 20 Oct 2024 17:46:49 -0700 (PDT)
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
X-Inumbo-ID: 4ab63ad6-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VOOV58aeXXstEaea5PEYY5hCNM5Cf2DbWfz2W9JspozDw/+uuMHZvc84UM+6/zOQJngg17ateZEawbZzi8ThwznVn0yhXIpVL3hoif0xQSgA5EZbnRUKg4cdalq2h+4CQMI6Poi9ZUeGjHXMYeRSU3CWB0AR6QGFuY8fYIBTllU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471611; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=StSbCrB+Dkpm/0KxKKmbp9r7lXihj1wwfuzXw0D2zII=; 
	b=DzdLNigp2vxkFU15ypRPfOMbmQkmJKfIrGQQQOqOX7BC6HcCkDG81j3sQVFeSixvbaKEK0yO5T9cwCC0ltJ4q0m+xleIOt0C9nnmkpwSJJgb0X1ary9aZiSQ9up0vNpwcJfzUPpVYulqrA3GhUo3cK4SXmkwWAMowI7i/mCyzCA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471611;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=StSbCrB+Dkpm/0KxKKmbp9r7lXihj1wwfuzXw0D2zII=;
	b=dXJQ+gs63Q0A8BdYYVq/jGFJDNiM0vKokc2EhktgXDOQvCoAaYHdsS5ZZJj++YUF
	6mWDgRdSzh+tsmMKCryvQRCm1qbyuzI0aSgEtAu9msVEq4zRKcCZNztegQAbqz6Iycg
	tVLwP8p+VKalsQDZqo0aScT54knUo9z9eldrG9Mo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 22/38] x86/boot: add cmdline to struct boot_module
Date: Sun, 20 Oct 2024 20:45:57 -0400
Message-Id: <20241021004613.18793-23-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a char pointer field, cmdline, to struct boot_module to hold the address
pointed to by the string field of struct mod. This removes the need to use the
early_mod field to get to the dom0 kernel command line.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- changed boot_module element cmdline to paddr_t
---
 xen/arch/x86/include/asm/bootinfo.h | 2 ++
 xen/arch/x86/setup.c                | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 9bd0e6336b4a..941363601db7 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -52,6 +52,8 @@ struct boot_module {
     bool relocated:1;
     bool consumed:1;
 
+    paddr_t cmdline;
+
     paddr_t start;
     size_t size;
 };
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6f953edd7521..254aeb0c5e1b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -318,6 +318,8 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     {
         bi->mods[i].mod = &mods[i];
 
+        bi->mods[i].cmdline = (paddr_t)mods[i].string;
+
         if ( !efi_enabled(EFI_LOADER) )
         {
             bi->mods[i].start = mods[i].mod_start;
@@ -1016,10 +1018,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->mod->string || bi->kextra )
+    if ( image->cmdline || bi->kextra )
     {
-        if ( image->mod->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->mod->string),
+        if ( image->cmdline )
+            safe_strcpy(cmdline,
+                        cmdline_cook(__va(image->cmdline),
                         bi->loader));
 
         if ( bi->kextra )
-- 
2.30.2


