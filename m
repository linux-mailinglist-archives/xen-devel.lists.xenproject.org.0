Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A79A5845
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822913.1236864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gbG-0003Pv-GW; Mon, 21 Oct 2024 00:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822913.1236864; Mon, 21 Oct 2024 00:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gbG-0003Mv-DD; Mon, 21 Oct 2024 00:48:46 +0000
Received: by outflank-mailman (input) for mailman id 822913;
 Mon, 21 Oct 2024 00:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gbE-0003Iq-Ri
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:48:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37813caf-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:48:42 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471604782239.07506705249955;
 Sun, 20 Oct 2024 17:46:44 -0700 (PDT)
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
X-Inumbo-ID: 37813caf-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qw2RrvII95qAkQzNoyV01MYL7i48DXV/rPwAYiEaCXvz3hozLRlt6jH2BhSsNJHUVEeNpxT3z8JoMrxsOnb/ozL3oBsXG1VaRN49roTx8x3k8u6cb7d+T8jKSt5ucp0dCb3MIQ96clok3ocHjMis0dnb/4ZmGFJ0hOS6CIfZWfI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471606; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yVwODdnV8WxSfmxxfPtGY+cCMyrPgV0sY5P16JCBxdM=; 
	b=ejLfnlxz6GXAuT7pi1SNDZKKuHFJ/odObHb97X52dcdzbpVhWSscl2GsFR1k8LDn/SjzEwSNIBMyq3uXqOfnwoxaYmCHVQqqQdrT+5tEyVQlkzENsuaPny8JAACSrjciz08n4MVxgaOcLvEk08qRqPi6AcfKtI+4jXprWK5TGKs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471606;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=yVwODdnV8WxSfmxxfPtGY+cCMyrPgV0sY5P16JCBxdM=;
	b=FhnZS4DxhLJshSVTG+L9H3TzX0lo4g/BAM/BfsZWtXN/NfeS2kFZIFDhYHVx0esa
	cx1fzYs5CRwOm2z0EQhN+6S98lIiIDDG5fMK8VnCplJlkYeeso2i2wj+eE5DqJeGlgG
	3XxiBliI9JbU/bwid4dsQVCc4hM/rJnvTvQjLAs4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 18/38] x86/boot: remove module_map usage by ramdisk loading
Date: Sun, 20 Oct 2024 20:45:53 -0400
Message-Id: <20241021004613.18793-19-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The ramdisk loading is the last user of module_map, remove
its usage and any remaining remnants of module_map.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- set excessive module check down to MAX_NR_BOOTMODS
---
 xen/arch/x86/setup.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 84d6981f4e77..4a482c8aefa4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1053,7 +1053,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     struct boot_info *bi;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, module_map[1];
+    unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1217,8 +1217,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                bi->nr_modules);
     }
 
-    bitmap_fill(module_map, bi->nr_modules);
-    __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
     bi->mods[0].consumed = true;
 
-- 
2.30.2


