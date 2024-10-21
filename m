Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF599A5858
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822998.1237034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gj9-0004fN-B4; Mon, 21 Oct 2024 00:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822998.1237034; Mon, 21 Oct 2024 00:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gj9-0004d1-5L; Mon, 21 Oct 2024 00:56:55 +0000
Received: by outflank-mailman (input) for mailman id 822998;
 Mon, 21 Oct 2024 00:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gcY-0001i1-Qq
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:50:06 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6938c053-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:50:06 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471617465839.8166672698667;
 Sun, 20 Oct 2024 17:46:57 -0700 (PDT)
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
X-Inumbo-ID: 6938c053-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471619; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J31Wi4UxyzqAXeN9DVb/u9MYZSPtC/vYa3QRHJPuV9+Wmrt7PPaBNqCOJB3/kPg/jWgzB6Zxq/lc2f7Ed+tqAC8xYBhuRg5zk2ESkoxWitAfXOAQgHsqhdGw9jaw+wDpOHNRxx8jhZFgtn3KAWZg+oOI0D6hCWUg9Mhq66frSIk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471619; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2hHosgMYwG/qh3KyF6wBYzUNZ0LC3cPr+j0rK/PGAiY=; 
	b=HxqUZ+g+sSGAeGTjPNSmFdMQCEKEc1MGQ1QNOxpZ1+pSHgyzwAiwkPPMXLFiFJC5uadz5aV0w+YcK4oJ4l4iCWwolMCdFSH+wv8mFTbVKJSywSYW5E8q0jASJTxOnCawvvM0lg9W4fV/OBKPghhyhakKCWhF9Cq/BkSLQ9ayYI0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471619;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2hHosgMYwG/qh3KyF6wBYzUNZ0LC3cPr+j0rK/PGAiY=;
	b=SUw+1gLzRkcVfTFOdXvLHoCerTY2wmLKmFd46xXdn9wH1xr1np/F+iRoKvwiBA5P
	Eo4z01n/Cbv1vDdUq4Rpcj/37kpNwBp+8Q1SvjKekzVKnw0QUtPDA6ZkP7F7ruGSEpd
	MDJj/9WBTSkeKzAqaj+JY2hOgwCvqEDGcLDfwTbQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 29/38] x86/boot: remove usage of mod_end by discard_initial_images
Date: Sun, 20 Oct 2024 20:46:04 -0400
Message-Id: <20241021004613.18793-30-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
index 87b118cdcf1e..67e72459170a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -367,10 +367,9 @@ void __init discard_initial_images(void)
 
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


