Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543273568F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 14:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551052.860353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDqJ-0006sP-2z; Mon, 19 Jun 2023 12:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551052.860353; Mon, 19 Jun 2023 12:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDqI-0006qI-Va; Mon, 19 Jun 2023 12:18:46 +0000
Received: by outflank-mailman (input) for mailman id 551052;
 Mon, 19 Jun 2023 12:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jc0u=CH=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qBDqH-0006qC-0D
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 12:18:45 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e096612-0e9b-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 14:18:42 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5JCIMGp6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 19 Jun 2023 14:18:22 +0200 (CEST)
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
X-Inumbo-ID: 6e096612-0e9b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1687177102; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GEvz2mpLLnHR6omjJAtqvkteo3y2s2MoAxDETwoBDzZXuNyW3+R+YYw0s/hcLOF5Lh
    kqUatZA+7NcRwWvZk5+0xFHH6KgQhNP6F0VTBLkA0NW2bWRxAvdkxqaAlPVUu+CA/QRL
    L6CtCuVyVw6JWbtOXvdFWZWDw/RuKHWE4DEHiIjsi93jrKI5jL16MycZcewIuzvRaZWG
    3izzaPBnuyjRncJKrLDGA6R8RUVD3xweH4c3gZq7uP1Xh5ANR85O3MRuNi0zIQtH1gnj
    ALAavAbpBwJ7hVh33ehBHY7nL7CHWODcLRLZOXrwKo68MwuQtLEAhswbPSLvtommHr/i
    ktKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1687177102;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=x9mJuvJNsXsFr6EcOYezPM8ioU1HxGzJYO7MRAPHFMY=;
    b=qyKFZZZD7x84hNj4IFMrmZcfw+gP8IqmcDa3XSQJ+xFIEAY/uLxsAWED8ZM4Bs+WF+
    qjoLPyj6xBDl6tsGbzkTGBxOW8wREau/1+c+T8B7SGvU4rkCrUYpNBksdvbAj//zopIV
    +zfQYBsvOIj2oqVuRnI1Ivu5UqIzQ21CtdmNix660HOLtpiiJ3Qn7dxD/TkoBiXGLKMd
    bF99bDDOwLhlIC2RZ6v3wxwUTv8N7u5GVIgChZKCBInoQrCXNlw0aGXhDSoPGs3KEVl7
    btpGxqLdca/0ERD7FEAVC5VB8yMBHea+gVyZwCmMl/amOmJ72rwgq/RAs7B7dANbgJ/r
    26pQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1687177102;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=x9mJuvJNsXsFr6EcOYezPM8ioU1HxGzJYO7MRAPHFMY=;
    b=WmHMOQZq4uNy+I6Q6V1Aw8fQOfGWn9IY6T69Km/FLH+C3gkOnQd7CIH3FQWq/EBzJY
    DzdrIhdXbTI2fHMcXOJGKX1MpyYjWRAElJDHP6EScvZPQ7xn8NJC9Sh+7Gyeh4ZmYoWo
    in0RHgcFC9UhJvWcQ9EDP7sdkybJyBOGxxWDKgFq/DN2ScVZN43tMIpg5BI6xNxr2Sqb
    p8dNgoeVNNpkVWuQjwJ2OeH3Uw2Jw/EuvEtvcGsY+FsiM8dcWcTFwmk4iuSubp9FrHbV
    uvPbsw/cJ3rgtsUCuUMNBVWlHdmi2Id8UIl3gPazVkaqSv7KDbT10pu2QdnUZAbMPPbo
    pLEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1687177102;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=x9mJuvJNsXsFr6EcOYezPM8ioU1HxGzJYO7MRAPHFMY=;
    b=7dwYzmguRWrlsxn4r7lMuavAAyX86eVLjl5C0l5iL6mEH9JDnWZOlcHKaOF+X/2nNl
    KYDMn2VGPoQFdhBlL3Aw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wrlX7F5stp0W7RR6sn4IXX0XAi33PEsP+tJs+yA=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v1] xen/trace: remove trace_will_trace_event
Date: Mon, 19 Jun 2023 14:18:17 +0200
Message-Id: <20230619121817.21969-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

There are just two callers of this function. It is identical to the
checks done in __trace_var.
The commit message of 9a86ac1aa3d2ebe1be05dc7fe78dd6759aa3241d
("xentrace 5/7: Additional tracing for the shadow code.") gives no
indication what the benefit of this function is.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 xen/arch/x86/hvm/svm/svm.c |  2 --
 xen/arch/x86/hvm/vmx/vmx.c |  2 --
 xen/common/trace.c         | 26 --------------------------
 xen/include/xen/trace.h    |  2 --
 4 files changed, 32 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 59a6e88dff..c10d0015e8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2812,8 +2812,6 @@ void svm_vmexit_handler(void)
 
         if ( rc )
         {
-            if ( trace_will_trace_event(TRC_SHADOW) )
-                break;
             if ( hvm_long_mode_active(v) )
                 HVMTRACE_LONG_2D(PF_XEN, regs->error_code, TRC_PAR_LONG(va));
             else
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 40767b94c3..08dd297cae 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4352,8 +4352,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
             if ( paging_fault(exit_qualification, regs) )
             {
-                if ( trace_will_trace_event(TRC_SHADOW) )
-                    break;
                 if ( hvm_long_mode_active(v) )
                     HVMTRACE_LONG_2D(PF_XEN, regs->error_code,
                                      TRC_PAR_LONG(exit_qualification) );
diff --git a/xen/common/trace.c b/xen/common/trace.c
index 77f8ce0ce5..60db45104e 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -308,32 +308,6 @@ static int tb_set_size(unsigned int pages)
     return alloc_trace_bufs(pages);
 }
 
-int trace_will_trace_event(u32 event)
-{
-    if ( !tb_init_done )
-        return 0;
-
-    /*
-     * Copied from __trace_var()
-     */
-    if ( (tb_event_mask & event) == 0 )
-        return 0;
-
-    /* match class */
-    if ( ((tb_event_mask >> TRC_CLS_SHIFT) & (event >> TRC_CLS_SHIFT)) == 0 )
-        return 0;
-
-    /* then match subclass */
-    if ( (((tb_event_mask >> TRC_SUBCLS_SHIFT) & 0xf )
-                & ((event >> TRC_SUBCLS_SHIFT) & 0xf )) == 0 )
-        return 0;
-
-    if ( !cpumask_test_cpu(smp_processor_id(), &tb_cpu_mask) )
-        return 0;
-
-    return 1;
-}
-
 /**
  * init_trace_bufs - performs initialization of the per-cpu trace buffers.
  *
diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index 055883287e..6e9f80dd94 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -35,8 +35,6 @@ void init_trace_bufs(void);
 /* used to retrieve the physical address of the trace buffers */
 int tb_control(struct xen_sysctl_tbuf_op *tbc);
 
-int trace_will_trace_event(u32 event);
-
 void __trace_var(uint32_t event, bool cycles, unsigned int extra, const void *);
 
 static inline void trace_var(uint32_t event, bool cycles, unsigned int extra,

