Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BC66C257
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478649.741992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQca-0003O7-Ub; Mon, 16 Jan 2023 14:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478649.741992; Mon, 16 Jan 2023 14:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQca-0003EQ-Lh; Mon, 16 Jan 2023 14:38:00 +0000
Received: by outflank-mailman (input) for mailman id 478649;
 Mon, 16 Jan 2023 14:37:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHQcY-0002Pk-T6
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:37:58 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cfbc166-95ab-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:37:55 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHQcU-008oZF-RG; Mon, 16 Jan 2023 14:37:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 56162300C6F;
 Mon, 16 Jan 2023 15:37:39 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id B9FA620EF0A23; Mon, 16 Jan 2023 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 5cfbc166-95ab-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Mc6JE/lSqhoI08ZCOd1MO1vmLEzmsp/ETRSpv4hRS+8=; b=T1nrQTJttu/3Jnm9EJrYVDiMxC
	s34Y8QKh6Os9ywtC1Z1w2DiWPN6Xf9K5GkRtu6DtxWWsA8ej0VDBcu9iVcitzgXSTWCKMPsZsT/yv
	UyAjSANcObXIQvCe1J1cb2ZFm0PgpHHKh22ywjkdRZY49ET7hYiwVX9R/AkWzL156Ux4u1mcKbpW3
	wubPrTdQVa+IM+KQkoM2pcN0SQ8YrHNTvKlSQpXlxOMZ0Z7Y2ts9qxviLI1ZgAHkTz7oQ5Z95SZu9
	jTowvNgMdlt4jqLsw2QD7LpDyIe1S1Qwn8XSQdU41tuNFe9PXsjS6ESqii8W89Nd11lkxG5d+ERsF
	kQkbM/9A==;
Message-ID: <20230116143645.829076358@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 16 Jan 2023 15:25:38 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org,
 Joan Bruguera <joanbrugueram@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 Juergen Gross <jgross@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Kees Cook <keescook@chromium.org>,
 mark.rutland@arm.com,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 5/7] x86/callthunk: No callthunk for restore_processor_state()
References: <20230116142533.905102512@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Joan Bruguera <joanbrugueram@gmail.com>

When resuming from suspend we don't have coherent CPU state, trying to
do callthunks here isn't going to work. Specifically GS isn't set yet.

Fixes: e81dc127ef69 ("x86/callthunks: Add call patching for call depth tracking")
Signed-off-by: Joan Bruguera <joanbrugueram@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20230109040531.7888-1-joanbrugueram@gmail.com
---
 arch/x86/kernel/callthunks.c |    5 +++++
 arch/x86/power/cpu.c         |    3 +++
 2 files changed, 8 insertions(+)

--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -7,6 +7,7 @@
 #include <linux/memory.h>
 #include <linux/moduleloader.h>
 #include <linux/static_call.h>
+#include <linux/suspend.h>
 
 #include <asm/alternative.h>
 #include <asm/asm-offsets.h>
@@ -151,6 +152,10 @@ static bool skip_addr(void *dest)
 	    dest < (void*)hypercall_page + PAGE_SIZE)
 		return true;
 #endif
+#ifdef CONFIG_PM_SLEEP
+	if (dest == restore_processor_state)
+		return true;
+#endif
 	return false;
 }
 



