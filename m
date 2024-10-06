Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B069921D7
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811372.1224070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZF2-0005lU-Is; Sun, 06 Oct 2024 21:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811372.1224070; Sun, 06 Oct 2024 21:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZF2-0005hs-D1; Sun, 06 Oct 2024 21:56:40 +0000
Received: by outflank-mailman (input) for mailman id 811372;
 Sun, 06 Oct 2024 21:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZDC-0007Zk-4F
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:54:46 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9866d10b-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:54:45 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251445000314.8393630433128;
 Sun, 6 Oct 2024 14:50:45 -0700 (PDT)
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
X-Inumbo-ID: 9866d10b-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251446; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dOhYo29x6tMVT8LnKdGrCGuKX9X0hPFgXgg7nC98keqFG91efzoRmoIIC8MaaBqQIY+yRX2FCN78P5iVZwKq5VaZjZvtrkfoU6SSgIdnyL7fqCf4XCxB8RrLkzMGRP6Ajb2+WZdmTTUJHX7zhj+rRhdQglQDa/Bnsg2cxbpAZs4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251446; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=My1BwYQikiMj2XVbz63ltqTkowzAIebw6oWPH/8M3ao=; 
	b=Umb/9jG0SJ+w4FKBK4BmVF0D0iTgCz+JYO0GbZ0FH8AE9B75HMWqlrPIGY9bTAmUxLWQYoIPjrHMhnXBvmucFYCE2NSJOmXUuyY9TgtuK4vpDlFGDudE3hhYwlPtZ7pkmF++CKD3jqXSId6RdGCtyXacJTbmbbudlTZEm8+6RyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251446;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=My1BwYQikiMj2XVbz63ltqTkowzAIebw6oWPH/8M3ao=;
	b=PRFaYn/TOdu/iACALsvxTGZRO/zqOHcAOffHIkxdNWAsaoDAnXjeKM+h6yNEid/Y
	xU1PUPiZyeOwkf2wwK2e9BPlMKrK6gBSvlfJzSwO+IqWBWa6g/cQy1RuLS/alLK1zR1
	Gpmg9Ax1/yFjXb0LthR6e2InoYkL9+fDUOhTmf00=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 35/44] x86/boot: remove usage of mod_end by discard_initial_images
Date: Sun,  6 Oct 2024 17:49:46 -0400
Message-Id: <20241006214956.24339-36-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This eliminates usage of early_mod by discard_initial_images

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b3b6e6f38622..e9e3da3204f1 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -352,12 +352,10 @@ void __init discard_initial_images(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t start =
-            (uint64_t)bi->mods[i].mod->mod_start << PAGE_SHIFT;
+        uint64_t start = bi->mods[i].start;
 
         init_domheap_pages(start,
-                           start +
-                           PAGE_ALIGN(bi->mods[i].mod->mod_end));
+                           start + PAGE_ALIGN(bi->mods[i].size));
     }
 
     bi->nr_modules = 0;
-- 
2.30.2


