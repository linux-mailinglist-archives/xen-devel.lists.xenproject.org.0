Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3BB9A2A2A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820846.1234481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TwG-0008VH-LD; Thu, 17 Oct 2024 17:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820846.1234481; Thu, 17 Oct 2024 17:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TwG-0008TU-IT; Thu, 17 Oct 2024 17:05:28 +0000
Received: by outflank-mailman (input) for mailman id 820846;
 Thu, 17 Oct 2024 17:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TwF-0008TH-HT
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:05:27 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffe5de37-8ca9-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:05:25 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184629973825.0331942335803;
 Thu, 17 Oct 2024 10:03:49 -0700 (PDT)
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
X-Inumbo-ID: ffe5de37-8ca9-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184632; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lCkBpR3oksT79NRryhLIHUU6Pgz5aNGTPZNaqKRRRGlpH6oI4Yl5/uEaaTROBETeHCePCJHySyAEoucZCHmNmaX/QpYVp91xrrxEgApuPIuvaSee2kfonPFxto4N66hoj3jG4YFYNFkOyVF9zOWItXs/mz9ZMC8Avlu+vO1mSOI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184632; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zL/cFqK5qkXy9lJ8lYgSqek6O1BwEfk0id77UI0IvV0=; 
	b=W3XtYF+xk2SmhMqBSGTUGpX35JwqsvxKdeUfTLWBd4o55YQNtPrzt16yyNRHIKsbks+OFojA7vVmaVnOwzHXp9un/mj+k66tNkUn7nKKJrKkMK+2ZBOMD8cJiV2rpwer/mSWvR7FX5aEM4kzWJDOTXroyjQH2cDxh4oeKTmaeOY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184632;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=zL/cFqK5qkXy9lJ8lYgSqek6O1BwEfk0id77UI0IvV0=;
	b=qIvG04TZ4Khikl1EDCNAoiu7IwFFeh6YdcxcvUQxFBRgyBezX++uUNEXhkWXKWbr
	JA71ZQDdn1qsozaR2ozKwT5CmIUxg93VSlp2ILghflZtx4WgpWjsl2kHAdPz/JFU5nx
	PWH9JkIVtAeU6mAMwWWZczdeTsam6WmJ0l27vHYQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 12/44] x86/boot: update struct boot_module on module relocation
Date: Thu, 17 Oct 2024 13:02:52 -0400
Message-Id: <20241017170325.3842-13-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When a boot module is relocated, ensure struct boot_module start and size
fields are updated along with early_mod.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- corrected conversion function for a missed switch from mfn to maddr/paddr
---
 xen/arch/x86/setup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6ee352fc0cde..d51b0b03bc97 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1380,8 +1380,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
-        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
+        bi->mods[xen].start = virt_to_maddr(_stext);
+        bi->mods[xen].size = __2M_rwdata_end - _stext;
+
+        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
+        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
     }
 
     bi->mods[0].headroom =
-- 
2.30.2


