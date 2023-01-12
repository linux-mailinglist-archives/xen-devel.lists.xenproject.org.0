Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC910667724
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476206.738314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjt-0003t8-0k; Thu, 12 Jan 2023 14:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476206.738314; Thu, 12 Jan 2023 14:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjs-0003p8-Ti; Thu, 12 Jan 2023 14:39:32 +0000
Received: by outflank-mailman (input) for mailman id 476206;
 Thu, 12 Jan 2023 14:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdGT=5J=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pFyjq-0002av-J2
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 14:39:30 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e82b8c26-9286-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 15:39:25 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFyjT-0040tJ-0q; Thu, 12 Jan 2023 14:39:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6DA1B30067B;
 Thu, 12 Jan 2023 15:39:13 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id C69932CC949B5; Thu, 12 Jan 2023 15:39:12 +0100 (CET)
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
X-Inumbo-ID: e82b8c26-9286-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=w9+PAdJk73UH2Fl3uPAAs4wgk5kyO76VlH+ufUk/PX4=; b=dGCr6CbAN+FGZxrxNRDZdAytzQ
	ohdZmJ2pWqhrruEFxAeISbBJzfYzIpqoJ3L/tRSUW3gBGjkO2s4tKa2W7ElzbOgRY0hRHRAMqDn7v
	I08YMwa446QJGSFX9BK9EJUds/SAXIdeHq/1QrE0yC9DLJmA54/yUU0pMsKnK/GKurujDhdUdMZgy
	2+E0yvI3gp0qTRUUgSCZVL/zjtjL6j9B4gmAO+rUVP/3waaiBSWmCmPLQGQ2RCXfbx35gYfLuHUHj
	rMAwsTWq/CMa37B4ktxnJOl8GYiROHox2K2kVc6oMMpelLmGsftbM+7NBgYgsXqBejFVKGscqqsL5
	Y+V/ZZZg==;
Message-ID: <20230112143825.822328168@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 15:31:46 +0100
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
Subject: [RFC][PATCH 5/6] PM / hibernate: Add minimal noinstr annotations
References: <20230112143141.645645775@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

When resuming there must not be any code between swsusp_arch_suspend()
and restore_processor_state() since the CPU state is ill defined at
this point in time.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/power/hibernate.c |   30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -280,6 +280,32 @@ __weak int arch_resume_nosmt(void)
 	return 0;
 }
 
+static noinstr int suspend_and_restore(void)
+{
+	int error;
+
+	/*
+	 * Strictly speaking swsusp_arch_suspend() should be noinstr too but it
+	 * is typically written in asm, as such, assume it is good and shut up
+	 * the validator.
+	 */
+	instrumentation_begin();
+	error = swsusp_arch_suspend();
+	instrumentation_end();
+
+	/*
+	 * Architecture resume code 'returns' from the swsusp_arch_suspend()
+	 * call and resumes execution here with some very dodgy machine state.
+	 *
+	 * Compiler instrumentation between these two calls (or in
+	 * restore_processor_state() for that matter) will make life *very*
+	 * interesting indeed.
+	 */
+	restore_processor_state();
+
+	return error;
+}
+
 /**
  * create_image - Create a hibernation image.
  * @platform_mode: Whether or not to use the platform driver.
@@ -323,9 +349,7 @@ static int create_image(int platform_mod
 	in_suspend = 1;
 	save_processor_state();
 	trace_suspend_resume(TPS("machine_suspend"), PM_EVENT_HIBERNATE, true);
-	error = swsusp_arch_suspend();
-	/* Restore control flow magically appears here */
-	restore_processor_state();
+	error = suspend_and_restore();
 	trace_suspend_resume(TPS("machine_suspend"), PM_EVENT_HIBERNATE, false);
 	if (error)
 		pr_err("Error %d creating image\n", error);



