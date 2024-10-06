Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F79921E4
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811406.1224189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFd-0004BX-EE; Sun, 06 Oct 2024 21:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811406.1224189; Sun, 06 Oct 2024 21:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFd-000487-8q; Sun, 06 Oct 2024 21:57:17 +0000
Received: by outflank-mailman (input) for mailman id 811406;
 Sun, 06 Oct 2024 21:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZAW-00051E-7s
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:52:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34f9efea-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:51:58 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251419620923.5885886254096;
 Sun, 6 Oct 2024 14:50:19 -0700 (PDT)
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
X-Inumbo-ID: 34f9efea-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251421; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C7bfeo+iZKVTYaWJ5X97pyAu2kDVxcsiEi+xMdkpWZ0++YhzLoZKWU1Ef+5ToV5uGnLUK5ORBfUWDr0PyfBoba7TxiKio+tM96X2Y72MDVqqc7eCj2b04l4my8cNQaYLV2x/j5QSMVd1rdEDeR/IfkvNr6WrIlkjE7GXlxUaKz0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251421; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NxzxsjEAulp7wEAc20NZOtDa3Lo4GRSs8lW4ILTmQAc=; 
	b=CSOpj5Dxfy9GmEWtV8S9F1lXQZu2+TZvRd9ylYeJPMuarO9zARlX3WG0x/V3cxX6RgNRB2hYmhT5IzUlBlaOUQc9iBj31JsR6sgQ6gLwZVEyBfaxHmV2RHRGoWbsJW7R1m8imQV8sYtvzHFw+AHeUE+aas1RreUot1mYiBeepow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251421;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=NxzxsjEAulp7wEAc20NZOtDa3Lo4GRSs8lW4ILTmQAc=;
	b=H4X0VdXYKTpFyTzY6KNrY/d+o15qsn73YN+x6tCM7wDI/BAuaZtuMoZwEajxOEHA
	v8E2yEM7HYHxTu9TWx6kSWghcwUteA4xJS0/xGuTlTMAfZeB3HdY7NjBS62stOv8Ox5
	1dULuYPuT/XnQmLqDb6q3sQCynRU34E1vINJ+LZU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 13/44] x86/boot: update struct boot_module on module relocation
Date: Sun,  6 Oct 2024 17:49:24 -0400
Message-Id: <20241006214956.24339-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When a boot module is relocated, ensure struct boot_module start and size
fields are updated along with early_mod.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 093a4f5380d1..f968758048ed 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1392,8 +1392,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
-        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
+        bi->mods[xen].start = virt_to_mfn(_stext);
+        bi->mods[xen].size = __2M_rwdata_end - _stext;
+
+        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
+        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
     }
 
     bi->mods[0].headroom =
-- 
2.30.2


