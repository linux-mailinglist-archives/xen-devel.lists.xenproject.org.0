Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53432667723
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476201.738259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjp-0002dM-HP; Thu, 12 Jan 2023 14:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476201.738259; Thu, 12 Jan 2023 14:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjp-0002bG-EU; Thu, 12 Jan 2023 14:39:29 +0000
Received: by outflank-mailman (input) for mailman id 476201;
 Thu, 12 Jan 2023 14:39:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdGT=5J=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pFyjm-0002au-Sz
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 14:39:27 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8a2ca71-9286-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 15:39:25 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFyjS-0040tD-11; Thu, 12 Jan 2023 14:39:06 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EC89A300C6F;
 Thu, 12 Jan 2023 15:39:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id BAAF42CC8C6A1; Thu, 12 Jan 2023 15:39:12 +0100 (CET)
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
X-Inumbo-ID: e8a2ca71-9286-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=T4GElGxaw5tEx2Lk6kKh2cwaswlijZP7pkxV7zD03yo=; b=dWjbmZzwf1WthR8TZ23ii1la+e
	yq8CeiWkZUYxPcP3zDoAdsjLQyUEFEwNBnojffsrWtXWwvZrVG3BvxUWfoXFoIemIzZBR3dchks7+
	30N+pLzv0Pq6fFF2X2CREioQEU6u9ZSI0QUhXVxyjoBTLRnevuU+BOKb90OE9rtHZxNFKkdIcFvCY
	0iBTtIbHpzJidWwd/VU+wg+DB3e1nBkUqzz+681wC9mH4sjUCyB8tmW0qAnc1AaOtsfRWMMqx6gco
	h5cNcMDHwQrxlAKs+W9Qc14+/gh6t51ElNBLBGLZWjnaQvksAwmhxVjKsZ7qqyNZZupTDL6qmnpHt
	IQaqbR8A==;
Message-ID: <20230112143825.704223863@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 15:31:44 +0100
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
 mark.rutland@arm.com
Subject: [RFC][PATCH 3/6] x86/callthunk: No callthunk for restore_processor_state()
References: <20230112143141.645645775@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Joan Bruguera <joanbrugueram@gmail.com>

When resuming from suspend we don't have coherent CPU state, trying to
do callthunks here isn't going to work. Specifically GS isn't set yet.

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
 



