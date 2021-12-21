Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8F47BC12
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 09:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250191.430934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzanX-0004in-QG; Tue, 21 Dec 2021 08:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250191.430934; Tue, 21 Dec 2021 08:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzanX-0004VJ-4s; Tue, 21 Dec 2021 08:47:03 +0000
Received: by outflank-mailman (input) for mailman id 250191;
 Tue, 21 Dec 2021 08:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzanU-0002yE-9F
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 08:47:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b9b42a0-623a-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 09:46:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D6AD1F3B8;
 Tue, 21 Dec 2021 08:46:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D923913E02;
 Tue, 21 Dec 2021 08:46:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cDrRM3yUwWFHMAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Dec 2021 08:46:52 +0000
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
X-Inumbo-ID: 8b9b42a0-623a-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640076413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPgUZQEXWMjuiDqJWRTGWtw72dHgK1/ZM2te4tasytk=;
	b=aSoZNdrwNngkftb9vRyT0Tgl6iYG9pMY7oN8BFJ/KQJicMhyy+wxXQePW1Ttf30oHdA1fR
	s1QDTXkGOVmk4FqGz/qMr1yU3LO3deBY2VRHKCLGhYE329bKD/TPFzOYDTOsom1gN9SQGK
	loar0Q4wvHrEuTPnbZk0gIvhBIAoNZA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 05/10] mini-os: don't repeat definition available via header file
Date: Tue, 21 Dec 2021 09:46:31 +0100
Message-Id: <20211221084636.6987-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211221084636.6987-1-jgross@suse.com>
References: <20211221084636.6987-1-jgross@suse.com>
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


