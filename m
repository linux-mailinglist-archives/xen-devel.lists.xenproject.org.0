Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E1A9BA1C4
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829623.1244656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4R-0003zD-Vw; Sat, 02 Nov 2024 17:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829623.1244656; Sat, 02 Nov 2024 17:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4R-0003w6-PU; Sat, 02 Nov 2024 17:37:55 +0000
Received: by outflank-mailman (input) for mailman id 829623;
 Sat, 02 Nov 2024 17:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HuB-0005zO-5n
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:27:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b41bade3-993f-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:27:17 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568370382770.7062276164702;
 Sat, 2 Nov 2024 10:26:10 -0700 (PDT)
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
X-Inumbo-ID: b41bade3-993f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI0MWJhZGUzLTk5M2YtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY4NDM3LjQxNjQzMiwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568381; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pv3kCvtoVTibz+u51wsTPJ5JitINxwAOpevWtkWjGtA+JWT3fCFys7qKisjDpRspKF8cE6Na4u4P4sAYgIvXnib8ogDHD7qa917MB6/CKAkrP9LxqenNtAEhstgVWQeMv9GFHykAYSXCk45kqYNj+YV3iKZ79QN/5kMnAkvkMVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568381; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EoeU2cNTcSm145aYChZTxXF4zyu19NL3WvcyiomLUIo=; 
	b=VmD2X8mPFmLcbOXuactLxKobkuST/Ivf/owiVPogZTbNDA3U5hp6bXL1jUgkZu6svuNJ7CgpT12T7bvzAHC7dOzDsvQgoyVZr5UkGhPnu5jfqd9ZaXpnoMeb7xvcETzJ4QJxzBCwaUVA+W98zWzUN+JqxTTBeZNNCJcISAWeGxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568381;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=EoeU2cNTcSm145aYChZTxXF4zyu19NL3WvcyiomLUIo=;
	b=ZZPR73ighyafEVqyrtsLosPv4w8AMkNG1vIMUwR2wEX8gS0HeRb6MWv+rm27fc02
	IJSeCj0PKuKslzoyprxSm0jNIFoT0D+RsLnQUKgXmx649F5vHK55RlKrj6XbThwT6kO
	iMW89A6SL33oOQ6BczXIstFLxYVy1kgZZBPlfw6c=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/12] x86/boot: add cmdline_pa to struct boot_module
Date: Sat,  2 Nov 2024 13:25:46 -0400
Message-Id: <20241102172551.17233-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add an address field, cmdline_pa, to struct boot_module to hold the address of
the string field from struct mod.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v7:
- renamed cmdline to cmdline_pa
- reword commit message for field rename

Changes since v5:
- changed boot_module element cmdline to paddr_t
---
 xen/arch/x86/include/asm/bootinfo.h | 2 ++
 xen/arch/x86/setup.c                | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 6638da597073..819c8224d715 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -59,6 +59,8 @@ struct boot_module {
      */
     bool relocated:1;
     bool released:1;
+
+    paddr_t cmdline_pa;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 425467a0d977..aba9df8620ef 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -312,8 +312,12 @@ static struct boot_info *__init multiboot_fill_boot_info(
      * reserved for Xen.
      */
     for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
+    {
         bi->mods[i].mod = &mods[i];
 
+        bi->mods[i].cmdline_pa = mods[i].string;
+    }
+
     /* Variable 'i' should be one entry past the last module. */
     bi->mods[i].mod = &mods[bi->nr_modules];
     bi->mods[i].type = BOOTMOD_XEN;
-- 
2.30.2


