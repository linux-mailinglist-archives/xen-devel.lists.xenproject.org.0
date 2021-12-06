Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EACE4690CA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 08:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238638.413597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Lh-0008S0-2g; Mon, 06 Dec 2021 07:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238638.413597; Mon, 06 Dec 2021 07:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Lg-0008P9-Ux; Mon, 06 Dec 2021 07:23:44 +0000
Received: by outflank-mailman (input) for mailman id 238638;
 Mon, 06 Dec 2021 07:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mu8Le-0008Mk-Ov
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 07:23:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fb54773-5665-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 08:23:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BC782192D;
 Mon,  6 Dec 2021 07:23:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7136C1330B;
 Mon,  6 Dec 2021 07:23:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CIJWGny6rWHVdAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 07:23:40 +0000
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
X-Inumbo-ID: 6fb54773-5665-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638775420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8/sEf5zxip/z6wrXT3urxSeGPiRIv+pRBh5TUEPjPg=;
	b=sLHRlJRgHai3r+90pA2coKYs9ibAH4mCtD76N9qGrGMXaMr3rg9LAALP04EJ7vL1KjMQrA
	kFV9HwUesSh0/l0lhyBYOvNpt+LqYKWDwjPly9BqLThPvPNQ+5lVxcKVj1yhHCi+qBaQDM
	CgomOAfJe0Nf/fJuEJ7vKIgHiGcOuY8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 05/10] mini-os: don't repeat definition available via header file
Date: Mon,  6 Dec 2021 08:23:32 +0100
Message-Id: <20211206072337.9517-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211206072337.9517-1-jgross@suse.com>
References: <20211206072337.9517-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/x86/setup.c is repeating the definition of __pte() instead using
the appropriate header. Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


