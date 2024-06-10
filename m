Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B019023F4
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 16:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737303.1143593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftT-0001va-LJ; Mon, 10 Jun 2024 14:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737303.1143593; Mon, 10 Jun 2024 14:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftT-0001tB-GR; Mon, 10 Jun 2024 14:21:07 +0000
Received: by outflank-mailman (input) for mailman id 737303;
 Mon, 10 Jun 2024 14:21:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGftS-0008MI-L0
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:21:06 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaf2755e-2734-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 16:21:03 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-254e42df409so198619fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:21:03 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-795ca413ed3sm109519685a.43.2024.06.10.07.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 07:21:01 -0700 (PDT)
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
X-Inumbo-ID: aaf2755e-2734-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718029262; x=1718634062; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/0Nmqg5/SRyeHMyQYQ756u1OolFE3kJadfERqjt0Rk=;
        b=Gc70o86TfMk3tM1/TdasBJbrSAS2n6QgRTQCEdHAoC4SwabvYQMj2YIRxRSVRwF8lk
         o+LOWyx+390iEwQXUi6rpZvKp6Jk1QMr0I0V+AVh1uwCIliYz3HC7HH56cacAU6HebGN
         ssGWUvD6OX1Qf+G9KDXEXHoJqsBUgBAXxjUWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029262; x=1718634062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/0Nmqg5/SRyeHMyQYQ756u1OolFE3kJadfERqjt0Rk=;
        b=aCTg/1FCquiIsW9t3q8krF0s7WjXERVFSUeMoooFsuF5RwbK26h15EbZ0h2cVAnWt9
         pYllin5nCPIPXQSjUEKezdH/XR0k7tBlKK7rd017YQMOMrs88UBVDMjTuJamjYpJLGYH
         us/+/gNBZHnLPsUi17JjiQssFZrBliP5n1M2oprdSfzFN4VDA7Fw/zxs5wUBTW1q+dMP
         F3BES/yQ0nRrEB9sCSrSCTNHaqEh4qZgirV3YmHZgzZzzBQRRuD2rlTLNsdRmQ25E1LS
         NE/s6buzFMBqynwRo5B2y9CTnM/dS6VcLNOPFVdWcRh90AGeXLulQNQMVsdOkoyX++/q
         stRA==
X-Gm-Message-State: AOJu0Yz62cchlDNVb4OaTFYo3MG3olqgwBdcbNt7ccmyHTJ0HqPP43ym
	gber1Z1gDuyomNDtrYCNcblr9Yfw+j+OIYViaf35kFLLmbx+WnwcDAU9PCrK8F17FHdPfYS1u/e
	X
X-Google-Smtp-Source: AGHT+IHogHOuVFsgIfOA2XNMT/LsSuo3pBEUpsSOSwxa/IxpdguZPEPVX8JY1QIHhekoZfHCLyzG6w==
X-Received: by 2002:a05:6870:70a9:b0:250:7032:5633 with SMTP id 586e51a60fabf-2546441a0a4mr10990106fac.14.1718029262133;
        Mon, 10 Jun 2024 07:21:02 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 7/7] x86/irq: forward pending interrupts to new destination in fixup_irqs()
Date: Mon, 10 Jun 2024 16:20:43 +0200
Message-ID: <20240610142043.11924-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610142043.11924-1-roger.pau@citrix.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
the CPU is to become offline, the normal migration logic used by Xen where the
vector in the previous target(s) is left configured until the interrupt is
received on the new destination is not suitable.

Instead attempt to do as much as possible in order to prevent loosing
interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
currently the case) attempt to forward pending vectors when interrupts that
target the current CPU are migrated to a different destination.

Additionally, for interrupts that have already been moved from the current CPU
prior to the call to fixup_irqs() but that haven't been delivered to the new
destination (iow: interrupts with move_in_progress set and the current CPU set
in ->arch.old_cpu_mask) also check whether the previous vector is pending and
forward it to the new destination.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Rename to apic_irr_read().
---
 xen/arch/x86/include/asm/apic.h |  5 +++++
 xen/arch/x86/irq.c              | 37 ++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index d1cb001fb4ab..7bd66dc6e151 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -132,6 +132,11 @@ static inline bool apic_isr_read(uint8_t vector)
             (vector & 0x1f)) & 1;
 }
 
+static inline bool apic_irr_read(unsigned int vector)
+{
+    return apic_read(APIC_IRR + (vector / 32 * 0x10)) & (1U << (vector % 32));
+}
+
 static inline u32 get_apic_id(void)
 {
     u32 id = apic_read(APIC_ID);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 54eabd23995c..ed262fb55f4a 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2601,7 +2601,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
 
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
-        bool break_affinity = false, set_affinity = true;
+        bool break_affinity = false, set_affinity = true, check_irr = false;
         unsigned int vector, cpu = smp_processor_id();
         cpumask_t *affinity = this_cpu(scratch_cpumask);
 
@@ -2649,6 +2649,25 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
              !cpumask_test_cpu(cpu, &cpu_online_map) &&
              cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
         {
+            /*
+             * This to be offlined CPU was the target of an interrupt that's
+             * been moved, and the new destination target hasn't yet
+             * acknowledged any interrupt from it.
+             *
+             * We know the interrupt is configured to target the new CPU at
+             * this point, so we can check IRR for any pending vectors and
+             * forward them to the new destination.
+             *
+             * Note the difference between move_in_progress or
+             * move_cleanup_count being set.  For the later we know the new
+             * destination has already acked at least one interrupt from this
+             * source, and hence there's no need to forward any stale
+             * interrupts.
+             */
+            if ( apic_irr_read(desc->arch.old_vector) )
+                send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
+                              desc->arch.vector);
+
             /*
              * This CPU is going offline, remove it from ->arch.old_cpu_mask
              * and possibly release the old vector if the old mask becomes
@@ -2689,11 +2708,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
         if ( desc->handler->disable )
             desc->handler->disable(desc);
 
+        /*
+         * If the current CPU is going offline and is (one of) the target(s) of
+         * the interrupt signal to check whether there are any pending vectors
+         * to be handled in the local APIC after the interrupt has been moved.
+         */
+        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
+            check_irr = true;
+
         if ( desc->handler->set_affinity )
             desc->handler->set_affinity(desc, affinity);
         else if ( !(warned++) )
             set_affinity = false;
 
+        if ( check_irr && apic_irr_read(vector) )
+            /*
+             * Forward pending interrupt to the new destination, this CPU is
+             * going offline and otherwise the interrupt would be lost.
+             */
+            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
+                          desc->arch.vector);
+
         if ( desc->handler->enable )
             desc->handler->enable(desc);
 
-- 
2.44.0


