Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD566C253
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478646.741968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQcY-0002vw-TT; Mon, 16 Jan 2023 14:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478646.741968; Mon, 16 Jan 2023 14:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQcY-0002uA-QB; Mon, 16 Jan 2023 14:37:58 +0000
Received: by outflank-mailman (input) for mailman id 478646;
 Mon, 16 Jan 2023 14:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHQcW-0002Pl-HV
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:37:57 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ccb2147-95ab-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:37:55 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHQc8-005csz-1j; Mon, 16 Jan 2023 14:37:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 56FD1300C9D;
 Mon, 16 Jan 2023 15:37:39 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id C252D20EF0A28; Mon, 16 Jan 2023 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 5ccb2147-95ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=w9+PAdJk73UH2Fl3uPAAs4wgk5kyO76VlH+ufUk/PX4=; b=OB3RdkQh/z8SFHj5199h+5XxCG
	thtkjKdk+ckbxf7Iellx2ZelkT1vO3AvWAgAjOiq8fzpCJwR6AC2SkmBx8R0Lr5PfqM/r3BVOSesf
	iNTTF8J0Dh6dYSuq81Aos7ogKJWM8VOUSyQK3UNQsqCLKlLOI0+qQzX7Hru0M/PxVUOf8M3fiPwcL
	XUNEPBzCO1X90Eazd5t/tUXX6nnvwXa2NznHU7elGvs2Vf9jjgratRjuPAlLu2YOjbhnfusCUjccb
	9glOoHYAYwuO41FGkPxDyw2EqP509qne4J5wYOpjcjdfHCeOJ6BFrHWxncvKtAlQKHBLhyYXy8uSD
	vFlY2FHg==;
Message-ID: <20230116143645.948125465@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 16 Jan 2023 15:25:40 +0100
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
Subject: [PATCH v2 7/7] PM / hibernate: Add minimal noinstr annotations
References: <20230116142533.905102512@infradead.org>
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



