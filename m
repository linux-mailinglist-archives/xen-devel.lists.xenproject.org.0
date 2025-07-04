Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A4AF986B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033542.1406900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMj-0005u4-CJ; Fri, 04 Jul 2025 16:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033542.1406900; Fri, 04 Jul 2025 16:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMj-0005pZ-69; Fri, 04 Jul 2025 16:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1033542;
 Fri, 04 Jul 2025 16:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXjMh-0005FA-MM
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:34:19 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba48e741-58f4-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 18:34:17 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso8188915e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:34:17 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9989fcesm59199345e9.16.2025.07.04.09.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:34:15 -0700 (PDT)
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
X-Inumbo-ID: ba48e741-58f4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751646856; x=1752251656; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnOR3BkSmDKvwBYwNYDK05tkMwtt9au0xqjngZKJSYs=;
        b=lyT0IZaIlx4pouh7/bIhNnRNJARcyXl1zx2l0DOcEfyfKpNh5AvcgfjSbQw3Bkrhoz
         RavVVfpKPl7CeGGSohH8IyuVCjaXknWmVqTE5H1s81PTMYCbWH5C3Vxhtge4EdKuBZ+z
         g+/AyY0J/WNEDuaXFofwEnd3920Z1o9O9WYgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646856; x=1752251656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnOR3BkSmDKvwBYwNYDK05tkMwtt9au0xqjngZKJSYs=;
        b=YkYXOdEMd68yTRUun+Jf67mZp0y2hM+ULQBUun+IDV8Ng2dwDRjkJDeUTsku/e++1m
         JebS/dGCxdRG+PKkIdMItCm0U6kUhSwEqHeIAFkWS/HvHH0vHgt4n/WdWlgEmV/Gpzft
         rD+cKPxDaEJHN1v4gzRno7yd9k603xY4SYDgCiZXf3YMdHhfCq5iXPgeCcOdeSXXGJQI
         cbIDSeBDD3fKMY64AFtKmIr6w27XDB9ltRX7rq9/XFRAt8zVoevEtnXJ2O/yWM+ep4K1
         f2AbZtOWZylm52UmW6A25VEXFQU4k/8iVgxcWYBwh2kTxmpzrUfleVMH7+b2fNi8Ljwx
         IyMQ==
X-Gm-Message-State: AOJu0YyEZClr7aMujRof9RmchVAk6arY+oCpYhdFViHHKewLqv3+/mrS
	lbPZ94kxpmhf6HXnPvjwj5o5t/aX+3sLKcRXualeqZKs/qbpo3ipJxB/bFebmbgP9vHc1fdvN8C
	WW2jdaGC+uA==
X-Gm-Gg: ASbGncuONGT6Wmb3HVxf76U1K+KI2ROOZiKj6jOHC9ONsSLdH2deAzDSYhypJmlMDbO
	4GAlSnBl5xR6+BC55iKHxKYgSiHOpF7zJI8dEgucZx9M1uqk8QvVHiPY1IS+uzI5XQkxS08nXgl
	+d4FqCZ8/WZZ5OqZF6uK4Fn6y2L84AbFuziTpDo3C8rcojELGnm46+yryAb79IoXH/4hZMzEFH+
	st6TJDWQj1r8FSlMnADeYb47De99+lz52cY7LdE76bAeW9s6Mf8/bry3Hr9wAr6NhTXJY+rIrqV
	jTkiWp1RDta+26A9DiiNcDDR7dfvDyFM/1eJI7WEZqK1EtBJV0q7S9oLgQlc8U9fk0HFUrshMSm
	9VlEvhYpJYOca6oTMt+ajR0KeUEiifE5CtKA=
X-Google-Smtp-Source: AGHT+IF4CipTklA7sl4Su6Os0xn3SQPS4yR3idnXvFQxMFXlwr+scLWQEmQvF5xXUPhmVHp51GvqVg==
X-Received: by 2002:a05:600c:a087:b0:454:ab1a:8c39 with SMTP id 5b1f17b1804b1-454b310d890mr31356655e9.26.1751646856044;
        Fri, 04 Jul 2025 09:34:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/6] xen/softirq: Rework arch_skip_send_event_check() into arch_set_softirq()
Date: Fri,  4 Jul 2025 17:34:08 +0100
Message-Id: <20250704163410.1412367-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

x86 is the only architecture wanting an optimisation here, but the
test_and_set_bit() is a store into the monitored line (i.e. will wake up the
target) and, prior to the removal of the broken IPI-elision algorithm, was
racy, causing unnecessary IPIs to be sent.

To do this in a race-free way, the store to the monited line needs to also
sample the status of the target in one atomic action.  Implement a new arch
helper with different semantics; to make the softirq pending and decide about
IPIs together.  For now, implement the default helper.  It will be overridden
by x86 in a subsequent change.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>

v2:
 * Rename new helper to arch_set_softirq()
 * Expand commit message
---
 xen/arch/x86/acpi/cpu_idle.c       |  5 -----
 xen/arch/x86/include/asm/softirq.h |  2 --
 xen/common/softirq.c               |  8 ++------
 xen/include/xen/softirq.h          | 16 ++++++++++++++++
 4 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 07056a91a29e..4f69df5a7438 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -440,11 +440,6 @@ static int __init cf_check cpu_idle_key_init(void)
 }
 __initcall(cpu_idle_key_init);
 
-bool arch_skip_send_event_check(unsigned int cpu)
-{
-    return false;
-}
-
 void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
 {
     unsigned int cpu = smp_processor_id();
diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
index 415ee866c79d..e4b194f069fb 100644
--- a/xen/arch/x86/include/asm/softirq.h
+++ b/xen/arch/x86/include/asm/softirq.h
@@ -9,6 +9,4 @@
 #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
 #define NR_ARCH_SOFTIRQS       5
 
-bool arch_skip_send_event_check(unsigned int cpu);
-
 #endif /* __ASM_SOFTIRQ_H__ */
diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index 60f344e8425e..dc3aabce3330 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -94,9 +94,7 @@ void cpumask_raise_softirq(const cpumask_t *mask, unsigned int nr)
         raise_mask = &per_cpu(batch_mask, this_cpu);
 
     for_each_cpu(cpu, mask)
-        if ( !test_and_set_bit(nr, &softirq_pending(cpu)) &&
-             cpu != this_cpu &&
-             !arch_skip_send_event_check(cpu) )
+        if ( !arch_set_softirq(nr, cpu) && cpu != this_cpu )
             __cpumask_set_cpu(cpu, raise_mask);
 
     if ( raise_mask == &send_mask )
@@ -107,9 +105,7 @@ void cpu_raise_softirq(unsigned int cpu, unsigned int nr)
 {
     unsigned int this_cpu = smp_processor_id();
 
-    if ( test_and_set_bit(nr, &softirq_pending(cpu))
-         || (cpu == this_cpu)
-         || arch_skip_send_event_check(cpu) )
+    if ( arch_set_softirq(nr, cpu) || cpu == this_cpu )
         return;
 
     if ( !per_cpu(batching, this_cpu) || in_irq() )
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index e9f79ec0ce3e..48f17e49efa1 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -23,6 +23,22 @@ enum {
 
 #define NR_SOFTIRQS (NR_COMMON_SOFTIRQS + NR_ARCH_SOFTIRQS)
 
+/*
+ * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
+ * skipped, false if the IPI cannot be skipped.
+ */
+#ifndef arch_set_softirq
+static always_inline bool arch_set_softirq(unsigned int nr, unsigned int cpu)
+{
+    /*
+     * Try to set the softirq pending.  If we set the bit (i.e. the old bit
+     * was 0), we're responsible to send the IPI.  If the softirq was already
+     * pending (i.e. the old bit was 1), no IPI is needed.
+     */
+    return test_and_set_bit(nr, &softirq_pending(cpu));
+}
+#endif
+
 typedef void (*softirq_handler)(void);
 
 void do_softirq(void);
-- 
2.39.5


