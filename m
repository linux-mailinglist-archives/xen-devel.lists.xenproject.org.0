Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAFD47B0DA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 17:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249852.430252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLC7-0005BH-BP; Mon, 20 Dec 2021 16:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249852.430252; Mon, 20 Dec 2021 16:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLC7-00058Q-7o; Mon, 20 Dec 2021 16:07:23 +0000
Received: by outflank-mailman (input) for mailman id 249852;
 Mon, 20 Dec 2021 16:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzLC6-00055w-8b
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 16:07:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8dda842-61ae-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 17:07:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE279218FC;
 Mon, 20 Dec 2021 16:07:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C321013D6B;
 Mon, 20 Dec 2021 16:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KFlaLjeqwGEUTAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Dec 2021 16:07:19 +0000
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
X-Inumbo-ID: e8dda842-61ae-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640016439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPgUZQEXWMjuiDqJWRTGWtw72dHgK1/ZM2te4tasytk=;
	b=mq8DOsnesC1v2dMnluoobHNTmIK5fdEb4eiejWMKxSn3+Gfha/rG2sCSv3YuIuqxi21u7p
	Tk5gC55nVa8Kx+4o4rHH3dRf9EkZ3v/KmKPhNz/wPgb4HPiPCSmZOClV7oXq1S/78vuwT+
	8cxFGqBOaAsqWn97WKARaNazRkyj+eo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 05/10] mini-os: don't repeat definition available via header file
Date: Mon, 20 Dec 2021 17:07:11 +0100
Message-Id: <20211220160716.4159-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211220160716.4159-1-jgross@suse.com>
References: <20211220160716.4159-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/x86/setup.c is repeating the definition of __pte() instead using
the appropriate header. Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 arch/x86/setup.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 1ec68d3..b27bbed 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -29,6 +29,7 @@
 #include <mini-os/os.h>
 #include <mini-os/lib.h> /* for printk, memcpy */
 #include <mini-os/kernel.h>
+#include <mini-os/hypervisor.h>
 #include <xen/xen.h>
 #include <xen/arch-x86/cpuid.h>
 #include <xen/arch-x86/hvm/start_info.h>
@@ -61,13 +62,6 @@ char stack[2*STACK_SIZE];
 
 extern char shared_info[PAGE_SIZE];
 
-#if defined(__x86_64__)
-#define __pte(x) ((pte_t) { (x) } )
-#else
-#define __pte(x) ({ unsigned long long _x = (x);        \
-    ((pte_t) {(unsigned long)(_x), (unsigned long)(_x>>32)}); })
-#endif
-
 static inline void fpu_init(void) {
 	asm volatile("fninit");
 }
-- 
2.26.2


