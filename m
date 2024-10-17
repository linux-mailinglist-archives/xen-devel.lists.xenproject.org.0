Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047049A2AC9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821079.1234914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UCs-0002Hn-QM; Thu, 17 Oct 2024 17:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821079.1234914; Thu, 17 Oct 2024 17:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UCs-0002FS-MI; Thu, 17 Oct 2024 17:22:38 +0000
Received: by outflank-mailman (input) for mailman id 821079;
 Thu, 17 Oct 2024 17:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TzI-00014B-Ru
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:08:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70cf6943-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:08:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184659192935.1571835611051;
 Thu, 17 Oct 2024 10:04:19 -0700 (PDT)
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
X-Inumbo-ID: 70cf6943-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184661; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cLxxMYz4+nyr7jfi+Ep3ytFff8XZcen7miLa1T8mjFeYdfPvpAohjPHA18fZGV7CwfGx2kYxTRpjiygaILG0fMG+7NsOxVGofa8eurTy/btluC2cESCL1BWJsLsS+2nbA9tHAni7FW3jnK9vbKBqZ3N2ZLqpNWcNY0CpbdbgdSg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184661; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0gjJz5LNIJtqKeHWTU5DRHYNSoNLJ9iVjYbe2ie5Je8=; 
	b=LXu/AVLme8Hl12MVfGEEhOFM4w+wD3MIYbn9A2rKMcaO22wZzkDN7AOMmtxTg4htOmiiU9TLrNPUSdfP5Fwh0r5GXhZfTttuU7T163/6NactU37BfI7HgxRRsc7a4KTyb/z12Qsb7jd397ejSO9r2Vz64rUlf/Unz7MO2MBEyDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184661;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=0gjJz5LNIJtqKeHWTU5DRHYNSoNLJ9iVjYbe2ie5Je8=;
	b=RTC1S6GK7APnbt9YKRdB5S/2iypzfyIc9IJMFjUFLIIMpN9R4tfbcogvXrRTsZye
	LkRtSdNC5/MznK8MNY5fOVEo5ifLJh0OUK+9SeV8rJ3OlbEhUV+xoMnCW+Ca7OrQSZL
	d1auH6xRqFx8kJEkgyOfDTD1QnTMEVt4I7lkOwZA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 35/44] x86/boot: remove usage of mod_end by discard_initial_images
Date: Thu, 17 Oct 2024 13:03:15 -0400
Message-Id: <20241017170325.3842-36-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This eliminates usage of early_mod by discard_initial_images

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/setup.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f8b9c164c1cb..4d53292aa444 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -350,10 +350,9 @@ void __init discard_initial_images(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t start =
-            (uint64_t)bi->mods[i].mod->mod_start << PAGE_SHIFT;
+        uint64_t start = bi->mods[i].start;
 
-        init_domheap_pages(start, start + PAGE_ALIGN(bi->mods[i].mod->mod_end));
+        init_domheap_pages(start, start + PAGE_ALIGN(bi->mods[i].size));
     }
 
     bi->nr_modules = 0;
-- 
2.30.2


