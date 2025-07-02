Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF9AF5B5A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031264.1405053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeS-0008KW-U1; Wed, 02 Jul 2025 14:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031264.1405053; Wed, 02 Jul 2025 14:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeS-0008Ie-Pk; Wed, 02 Jul 2025 14:41:32 +0000
Received: by outflank-mailman (input) for mailman id 1031264;
 Wed, 02 Jul 2025 14:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T1d=ZP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWyeQ-0007x9-Sx
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:41:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a400b35b-5752-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 16:41:30 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso2884242f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:41:30 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad20bsm230946905e9.20.2025.07.02.07.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 07:41:28 -0700 (PDT)
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
X-Inumbo-ID: a400b35b-5752-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751467289; x=1752072089; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoxVJO1Cp9G2uE0d1/tqm82YZtH5FBnCWbzeL0LUSJk=;
        b=dpPF76l0lkDo85jKGOFcY0FpdsPtMcCk3scsPRRGjTn0Fm5yz4vwx4IWKTfKAenvgB
         ll3QOPB9WI7wxsa1od8lybsFzFzmW37NCrpvVWm7nwds0VLZCDTMqKU5Sr570qgOjR6F
         QTb5Dg18gl0KlXXRbt5WkWrKOkpq2Io+nwLZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467289; x=1752072089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoxVJO1Cp9G2uE0d1/tqm82YZtH5FBnCWbzeL0LUSJk=;
        b=RtR/zaSAZD6Nswj5WeGAX4zHL1L3HeGr6cwDIJcNG25BOigNjkWNuc83q5RqqjXBhQ
         gh9catBLdVpcQF/H3KIzPTui4yTjGiBXSMZwYlRz4ILeG21cQxzP2tadtu1EwEquoxvo
         5CNIaFXRoDEDnbU+V0fXXanKJRbAICyTkAfvnxgIleS0SPAxEWdo786slxdFzOQHyzxs
         b14EJ6ia2wRb3UWyBl4OIhOvgHRqfoAgwObuCf2TOwrM4nxzcg9ormTlMdc/5vDHsRYs
         7buOOYqT4wKOO1unWqn7u2FxnGT5kOX45E4Ih4rLn3+FB71lUY4dZKydnMcnIwhejTdk
         +3Aw==
X-Gm-Message-State: AOJu0Yxexr9CBHrfza0IOxx5MfZWHlo4KNwOH0Tpz2dQXewhMznk+0iY
	zVCDdeHbCGeGrYORxB5WIYRo5Zja2W5MUapiQSWWUTdA/bPP/1DqwVa3/bKZEx2mc0tF8q7s+Yo
	hC4NFfv6HMw==
X-Gm-Gg: ASbGnct9Z+teJmo+Lom9cAez5CVSW04ivCAEfbpkvrFzr1UmTZtcO70TFo+M6nvqY/p
	QgS3qY0dTbXdrWGqfyRy9eqPM+QaO/3CrHX3btiOyJ060o+esisyODK7+UzOoEK1hcRmbq1wbxc
	19sGCcc9eA1Tf+Q7DzPTU3MDxrR7JPFQ9VBHBO3QbSW8I1sfQ/K2Go8CCZrYmKHvG/rCd0zwyI8
	rhnBWLfpQb6W8I+Nc/MP7WkQMT8Ad5XTFe8HscuPky1Gq4mnDjoQXEjllMHig5NB44u/FY7vHRb
	yz3Lg2U3k3bS50Yds4LO3fg6UpWOucPYbeyPDysZTgTfB9GWbTF6iiYzqJPb0JDxr1FaTjnY9L1
	xpKUI5DcobGK0UwsSzeUzTOqkD0dL7XEQQng=
X-Google-Smtp-Source: AGHT+IGP5IHWhmosOZevMrRQ/aZBPSTmDtIyCZyYXBNJ508Q4vwzK0RXb2l57iQQJGxlV8oZm7VNBg==
X-Received: by 2002:a05:6000:2203:b0:3a5:88e9:a54f with SMTP id ffacd0b85a97d-3b1ff244520mr2789363f8f.1.1751467288963;
        Wed, 02 Jul 2025 07:41:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/6] xen/softirq: Rework arch_skip_send_event_check() into arch_pend_softirq()
Date: Wed,  2 Jul 2025 15:41:18 +0100
Message-Id: <20250702144121.1096448-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

x86 is the only architecture wanting an optimisation here, but the
test_and_set_bit() is a store into the monitored line and is racy with
determining whether an IPI can be skipped.

Instead, implement a new arch helper with different semantics; to make the
softirq pending and decide about IPIs together.  For now, implement the
default helper.  It will be overridden by x86 in a subsequent change.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/acpi/cpu_idle.c       |  5 -----
 xen/arch/x86/include/asm/softirq.h |  2 --
 xen/common/softirq.c               |  8 ++------
 xen/include/xen/softirq.h          | 16 ++++++++++++++++
 4 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index dbcb80d81db9..caa0fef0b3b1 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -436,11 +436,6 @@ static int __init cf_check cpu_idle_key_init(void)
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
index 60f344e8425e..0368011f95d1 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -94,9 +94,7 @@ void cpumask_raise_softirq(const cpumask_t *mask, unsigned int nr)
         raise_mask = &per_cpu(batch_mask, this_cpu);
 
     for_each_cpu(cpu, mask)
-        if ( !test_and_set_bit(nr, &softirq_pending(cpu)) &&
-             cpu != this_cpu &&
-             !arch_skip_send_event_check(cpu) )
+        if ( !arch_pend_softirq(nr, cpu) && cpu != this_cpu )
             __cpumask_set_cpu(cpu, raise_mask);
 
     if ( raise_mask == &send_mask )
@@ -107,9 +105,7 @@ void cpu_raise_softirq(unsigned int cpu, unsigned int nr)
 {
     unsigned int this_cpu = smp_processor_id();
 
-    if ( test_and_set_bit(nr, &softirq_pending(cpu))
-         || (cpu == this_cpu)
-         || arch_skip_send_event_check(cpu) )
+    if ( arch_pend_softirq(nr, cpu) || cpu == this_cpu )
         return;
 
     if ( !per_cpu(batching, this_cpu) || in_irq() )
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index e9f79ec0ce3e..0814c8e5cd41 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -23,6 +23,22 @@ enum {
 
 #define NR_SOFTIRQS (NR_COMMON_SOFTIRQS + NR_ARCH_SOFTIRQS)
 
+/*
+ * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
+ * skipped, false if the IPI cannot be skipped.
+ */
+#ifndef arch_pend_softirq
+static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
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


