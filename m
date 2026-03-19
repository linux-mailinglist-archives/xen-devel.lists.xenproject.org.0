Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCc3Onfru2liqQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9EE2CB233
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257010.1551454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRn-0007h0-Ug; Thu, 19 Mar 2026 12:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257010.1551454; Thu, 19 Mar 2026 12:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRn-0007dv-S2; Thu, 19 Mar 2026 12:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1257010;
 Thu, 19 Mar 2026 12:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yv1Q=BT=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w3CRm-0007dl-VN
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 12:25:55 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5e68830-238e-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 13:25:53 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48628ce9ab5so11741955e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 05:25:53 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c350aesm60831395e9.4.2026.03.19.05.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 05:25:52 -0700 (PDT)
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
X-Inumbo-ID: c5e68830-238e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773923153; x=1774527953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qQivWpVp8aJ0G+OuJqncSanArkeWmdPzppoMAV3zIE=;
        b=rrVH0g0l72BfdQK/QoSamnP+Xh5y1d6wSWipfFGq1ULhlKiRRy+r9qK3P4xob/V0ox
         7+J+kcCuEiPRDqKpV320cYrTKBbiNpbDpFxTFyLVd0BxTp2v+uoaeW7JfDvfU5kw6yp/
         UX1rpa31o3F3ePm6ucNUdU0NbTD/v5YkJmovk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923153; x=1774527953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qQivWpVp8aJ0G+OuJqncSanArkeWmdPzppoMAV3zIE=;
        b=KgMJiy4hC1bN/gfTcIIODJUQuHc5FNFdjBLHxjg0aVRXEY1Vaml/QcjdeZEFSsJjmf
         /3AWw0ajvf535eL6u5Skc2wHyCsBgPR8xIfOwIiaXJW5p7CmL0rPiIzSAqbUaenWZeHm
         See+fN6MlayhlF3ztV27RBvMFXMS/KCObjU3t9QF51rp3qDxehfIBaXT9Q6xj9CeHpNn
         tCrKe6EgrnJapCBR/3sfTGr2j4fUK3zU3rBKHc9TUqdqdSLpFAFDaV/YJ8NFSXcd4ZRk
         4qnvvrw5ZIzpdoBt9vL9yHPUjNNPhkpmpc1tTjQEvNMRH6xBWtpUlJL0ND7C0ssaJXdD
         7cxQ==
X-Gm-Message-State: AOJu0YzuDtWoaWHsR7w8GLVLxGM8lV1Gd7ShhwM7GqmPTGPc9PtUwm6G
	EJARQkWDcLCHtONkXZHYlKmiGVRq8M7OIWvEz9Ru5FzKRCSLBISl0xOaVbLZqPnlFgGw59miTIQ
	U2cFB
X-Gm-Gg: ATEYQzwo9aNdnf3LQM7Mgx3+4HYgKAM3e1Z5DxB09U7mKIIBgOTxEJI67xhBZLDy7co
	MXQwOhnablMYfCyBxbHL74tg/6FvUImqGWHH0d9fmnxJQL9VJdrL5ZIKWRhbzj7LTJnpFed/oJN
	EB9i/jf+fLi1NHLpG9FX9epAZMIeYZmeirVni+IEgBjE8n98Ea6FVYzer/dMhi95togTxWpGu+7
	OsVPrCjkHgbxyART4ig7K1vt52eo5pOIj8qapiw8wLkUoje2smJNIe2cZYpMB5x55qzzWRFessb
	ar8yY7fu87mw7Qqjq9W9xEZpXE+lwRfyrVxCQesDZ3NC6kcnWKr34b1DAFBdo8nq57QXU9axJZi
	RPmLuDEG5YWjAqtKmbn166cf4CqkjEmW56r07fZ35H0e0rJh9Vg2SiKjIdxgvbSU1AyLCrE9vS+
	zbvhOF1DVqBMfy9RtKl1PsZJaUMa63wCuZ7ivBwPDzJhSrsOQNPeEe/1lxYKvgXx+NKS69950=
X-Received: by 2002:a05:600c:8b65:b0:483:badb:618e with SMTP id 5b1f17b1804b1-486f44377dcmr117409865e9.8.1773923152313;
        Thu, 19 Mar 2026 05:25:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] x86/kexec: Stop hooking NMIs with trap_nop()
Date: Thu, 19 Mar 2026 12:25:46 +0000
Message-Id: <20260319122549.922724-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260319122549.922724-1-andrew.cooper3@citrix.com>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9F9EE2CB233
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When FRED is active, it is not possible to hook NMIs like this.

NMI hooking in the crash path has undergone several revisions since its
introduction.  Notably since commit e7f147bf4ac7 ("x86/crash: Drop manual
hooking of exception_table[]") we use the regular nmi_callback()
infrastructure.

Instead of asserting that we don't enter do_nmi_crash() on the crashing CPU,
tolerate it and return early.  It's a marginally longer codepath but behaves
the same and is compatible with FRED.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

The other use of hooking the NMI handler like this is in play_dead() and
introduced by commit 73cb1383bf8d ("x86/idle: re-arrange dead-idle
handling").  It's unsafe, and the commit even mentions so for #MC.

On x86, we simply cannot free the per-cpu block for any CPU that hasn't been
put back into the wait-for-SIPI state.
---
 xen/arch/x86/crash.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 1e4b0eeff21b..04fd04393b29 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -37,14 +37,18 @@ static cpumask_t waiting_to_crash;
 static unsigned int crashing_cpu;
 static DEFINE_PER_CPU_READ_MOSTLY(bool, crash_save_done);
 
-/* This becomes the NMI handler for non-crashing CPUs, when Xen is crashing. */
-static int noreturn cf_check do_nmi_crash(
+/* This becomes the NMI handler for all CPUs when Xen is crashing. */
+static int cf_check do_nmi_crash(
     const struct cpu_user_regs *regs, int cpu)
 {
     stac();
 
-    /* nmi_shootdown_cpus() should ensure that this assertion is correct. */
-    ASSERT(cpu != crashing_cpu);
+    /*
+     * If we are the crashing CPU, do nothing.  We need to get back to the
+     * interrupted codepath to contine with the kexec transition.
+     */
+    if ( cpu == crashing_cpu )
+        return 1;
 
     /* Save crash information and shut down CPU.  Attempt only once. */
     if ( !this_cpu(crash_save_done) )
@@ -114,6 +118,8 @@ static int noreturn cf_check do_nmi_crash(
 
     for ( ; ; )
         halt();
+
+    unreachable();
 }
 
 static void nmi_shootdown_cpus(void)
@@ -130,11 +136,7 @@ static void nmi_shootdown_cpus(void)
 
     cpumask_andnot(&waiting_to_crash, &cpu_online_map, cpumask_of(cpu));
 
-    /*
-     * Disable IST for MCEs to avoid stack corruption race conditions, and
-     * change the NMI handler to a nop to avoid deviation from this codepath.
-     */
-    _set_gate_lower(&idt[X86_EXC_NMI], SYS_DESC_irq_gate, 0, &trap_nop);
+    /* Disable IST for MCEs to avoid stack corruption race conditions */
     set_ist(&idt[X86_EXC_MC], IST_NONE);
 
     set_nmi_callback(do_nmi_crash);
-- 
2.39.5


