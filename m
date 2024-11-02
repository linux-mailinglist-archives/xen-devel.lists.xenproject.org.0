Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859BE9BA1BF
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:37:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829614.1244628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I4A-0002bz-2a; Sat, 02 Nov 2024 17:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829614.1244628; Sat, 02 Nov 2024 17:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I49-0002a0-U0; Sat, 02 Nov 2024 17:37:37 +0000
Received: by outflank-mailman (input) for mailman id 829614;
 Sat, 02 Nov 2024 17:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Hu3-0005zO-Ly
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:27:11 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aef35b32-993f-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:27:08 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568368262930.5138048817796;
 Sat, 2 Nov 2024 10:26:08 -0700 (PDT)
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
X-Inumbo-ID: aef35b32-993f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFlZjM1YjMyLTk5M2YtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY4NDI4Ljk0MTQxMSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568380; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eseagGIWxSDS05FvDZ1vaX8iLM4KFZPv5hQwSOpgiaW1krIObSkWnLUcPHkjQjtNkpPznvEmBW8576Sips77kyH7RVKF65oOJFw7GAZlappArKt8pdu4LMM5f4CvwsBg8RQS9uVlFSdH3fHI/udJKiH9lcYhewpCvhyoBykff28=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568380; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9OF7jr3+XP9qd3JfzPB9uF0lHAJIr0GJpZTZwT478GE=; 
	b=l2nApuwB+FebU4gSAE8VsY+yHxacx1YWedZy26toqYRn2/JHxE1A32b5SaMYwjpXlE9n+8d5eFAz9+FA+w2iXhRFILFzuqQvsLk9wsTAcoqQ1xlT1YcSL5Vep/z92+9NWAWvuzDrPQHl6Bx0izxgzMT2KxHtdcUiZvgJAVevE6k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568380;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=9OF7jr3+XP9qd3JfzPB9uF0lHAJIr0GJpZTZwT478GE=;
	b=RhvDDm3GI4rx4r3df+BhgoYdgln8UhlBBLXT0tZUOPxOw1cq/6osnOdYt1NjTB4U
	XNJZtLi9KnCkU2AWv3TR6pscoLvbpkPDofcfFEMC4bphO4j27vQUH4eqwMbL2kaD8Vi
	n7IENw/XiWaBp7HQdvlI9czN/h1r640bDLZcYhVA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 06/12] x86/boot: relocate kextra into boot info
Date: Sat,  2 Nov 2024 13:25:45 -0400
Message-Id: <20241102172551.17233-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move kextra into struct boot_info, thus no longer needed to be passed as a
parameter to create_dom0.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 1 +
 xen/arch/x86/setup.c                | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e337baa905f0..6638da597073 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -68,6 +68,7 @@ struct boot_module {
 struct boot_info {
     const char *loader;
     const char *cmdline;
+    const char *kextra;
 
     paddr_t memmap_addr;
     size_t memmap_length;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 633319d39d80..425467a0d977 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1136,6 +1136,7 @@ void asmlinkage __init noreturn __start_xen(void)
         *kextra = '\0';
         kextra += 3;
         while ( kextra[1] == ' ' ) kextra++;
+        bi->kextra = kextra;
     }
     cmdline_parse(bi->cmdline);
 
@@ -2141,7 +2142,7 @@ void asmlinkage __init noreturn __start_xen(void)
     dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
                        initrdidx < bi->nr_modules ? bi->mods[initrdidx].mod
                                                   : NULL,
-                       kextra, bi->loader);
+                       bi->kextra, bi->loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


