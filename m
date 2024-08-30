Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C7966BB2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786823.1196636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bs-0000uC-Sf; Fri, 30 Aug 2024 21:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786823.1196636; Fri, 30 Aug 2024 21:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bs-0000nT-Kc; Fri, 30 Aug 2024 21:56:48 +0000
Received: by outflank-mailman (input) for mailman id 786823;
 Fri, 30 Aug 2024 21:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Uh-00065G-SA
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:49:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6d802c6-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:49:22 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054474029613.6614984690195;
 Fri, 30 Aug 2024 14:47:54 -0700 (PDT)
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
X-Inumbo-ID: b6d802c6-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054476; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OqXVWMl7VaK78DNscKnrvJshV2lLeRxJIRCTAN5X0CgXklka61qAYSml/8DkGzuOxyD9BvlGER25Ai10Uol2gbB1DsirSLX9l7oCeq9X1wcuYsPJG0mRR106kwAMqpyD6k7vfcFjg0r/mqBJHYOfMEiXIR4ISuVIj/JG6Jb1qYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054476; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vMlkGiuGcxaWfLc66KQ7uFjoPq32SrNVLlk/N0KOM60=; 
	b=NGq0XhVOBECsmQ6LU85OvMFXVEPB9xNZ1U9G0ZnqmUu7ncfoN53tMnfbcwekmMhp5i08d9AoQkcl3J4IVdlQnkLF5nLqEuy+VrMg8XgEyD1eSfUtfC48BUcGRqDB7Q64hZBOIoZ/wPEPrC4DYrjwso+lM0Ya7t0fOCATB3MwTBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054476;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=vMlkGiuGcxaWfLc66KQ7uFjoPq32SrNVLlk/N0KOM60=;
	b=Q7/nsgQyLuK3bygbmw0vF7wqJhUdup2FoXX66y36jqPe03uVNLFpT1+U6DdIADwy
	AlXAp227+zkOpIJHGZc5iqJNQlWpzYH378zrS8RA3hOFL00XsUf1443Pgwh6nyiDl47
	mobJUlJlHT9l1yKrNKpCHE7dC6msK/PvbqzkUEcM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 13/44] x86/boot: update struct boot_module on module relocation
Date: Fri, 30 Aug 2024 17:46:58 -0400
Message-Id: <20240830214730.1621-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When a boot module is relocated, ensure struct boot_module start and size
fields are updated along with early_mod.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 021c5699f86c..27517d24b2ea 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1408,8 +1408,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        boot_info->mods[idx].early_mod->mod_start = virt_to_mfn(_stext);
-        boot_info->mods[idx].early_mod->mod_end = __2M_rwdata_end - _stext;
+        boot_info->mods[idx].start = boot_info->mods[idx].early_mod->mod_start
+                                   = virt_to_mfn(_stext);
+        boot_info->mods[idx].size = boot_info->mods[idx].early_mod->mod_end
+                                  = __2M_rwdata_end - _stext;
     }
 
     boot_info->mods[0].headroom = bzimage_headroom(
-- 
2.30.2


