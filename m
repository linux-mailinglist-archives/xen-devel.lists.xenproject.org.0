Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641149023F2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 16:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737299.1143553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftJ-0000ho-Gz; Mon, 10 Jun 2024 14:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737299.1143553; Mon, 10 Jun 2024 14:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftJ-0000fB-Cn; Mon, 10 Jun 2024 14:20:57 +0000
Received: by outflank-mailman (input) for mailman id 737299;
 Mon, 10 Jun 2024 14:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGftI-0008MI-BQ
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:20:56 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a585f964-2734-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 16:20:54 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-43fdb114e07so19620621cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:20:54 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-440c9fed96asm10638341cf.17.2024.06.10.07.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 07:20:52 -0700 (PDT)
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
X-Inumbo-ID: a585f964-2734-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718029253; x=1718634053; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj/7AKm3tnuoONAQVj+xWnm7kpsb26VRcfyAbHMA6OE=;
        b=Cs7+gK0Blpb8nX19OWjwm8ImsRVYDnuiGp2kKz7Qiexg0LoHwLKk8Fb4nOougrMOSw
         VWVk80ITKKhF7m5xCTqdTk+6RYr4+e+GG7hGRy1dJhhmtUoSHkMzLCSAUQS1RFJvRbx3
         nnw3BHpES43AeJFt5hr4/2K3jgn+AwV6ko3mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029253; x=1718634053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xj/7AKm3tnuoONAQVj+xWnm7kpsb26VRcfyAbHMA6OE=;
        b=H58slk8sEYcoxJYNpS8KGFsNgVn9eyjCXyboyALtoN/USdVR+Aeqo5roXNlNubkvKw
         0PlzhtdXOpcpKv52pAcPYDnmVuuFvd0bR9/L2C93kY7jADjqolhIZlUZNtwDSEyNzEii
         65wB6cDtAtE+OsNc2PW8hELTOgOUBGzf6XrHozSud4fwgmiaJz6qPhfXGjhSGSkBB418
         oufiG5KaXepdMyGhBfOdRlJPWuVr1ZgTWAY9rlvSBksKz9JSnv14lnxmQEReIYF+20NX
         EebvEFHIXZjQyWfvWQ+VcusKMkgcLsttLLrnOpqZLcUXRPMZbYbXjooMd8i4LTwM6HIU
         dteA==
X-Gm-Message-State: AOJu0YyAok5BY+t47TCMHTL6lEiUgyVzYGZIBDPK1sVzmrDEuHDXYQqK
	4FzDnCKoAzQlk/4Wh87eRl29trDeJNlI2JIRljqQab70NigHcmhoOO1DgFdWSeEOo21oyvKtUXG
	b
X-Google-Smtp-Source: AGHT+IE7KOuxwbv+yqrmisaABSEWMWauOW82L28C76Zoz4VFVCV+s9AHsB515/AQkXeHu+w19TE3Rw==
X-Received: by 2002:ac8:5703:0:b0:440:a22f:ac61 with SMTP id d75a77b69052e-440a22fadf0mr44014571cf.32.1718029253243;
        Mon, 10 Jun 2024 07:20:53 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 3/7] x86/irq: limit interrupt movement done by fixup_irqs()
Date: Mon, 10 Jun 2024 16:20:39 +0200
Message-ID: <20240610142043.11924-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610142043.11924-1-roger.pau@citrix.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current check used in fixup_irqs() to decide whether to move around
interrupts is based on the affinity mask, but such mask can have all bits set,
and hence is unlikely to be a subset of the input mask.  For example if an
interrupt has an affinity mask of all 1s, any input to fixup_irqs() that's not
an all set CPU mask would cause that interrupt to be shuffled around
unconditionally.

What fixup_irqs() care about is evacuating interrupts from CPUs not set on the
input CPU mask, and for that purpose it should check whether the interrupt is
assigned to a CPU not present in the input mask.  Assume that ->arch.cpu_mask
is a subset of the ->affinity mask, and keep the current logic that resets the
->affinity mask if the interrupt has to be shuffled around.

Doing the affinity movement based on ->arch.cpu_mask requires removing the
special handling to ->arch.cpu_mask done for high priority vectors, otherwise
the adjustment done to cpu_mask makes them always skip the CPU interrupt
movement.

While there also adjust the comment as to the purpose of fixup_irqs().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Adjust handling of high priority vectors.

Changes since v0 (outside the series):
 - Do not AND ->arch.cpu_mask with cpu_online_map.
 - Keep using cpumask_subset().
 - Integrate into bigger series.
---
 xen/arch/x86/include/asm/irq.h |  2 +-
 xen/arch/x86/irq.c             | 21 +++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 94f634ce10a1..5f445299be61 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -168,7 +168,7 @@ void free_domain_pirqs(struct domain *d);
 int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq);
 int unmap_domain_pirq_emuirq(struct domain *d, int pirq);
 
-/* Reset irq affinities to match the given CPU mask. */
+/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
 void fixup_irqs(const cpumask_t *mask, bool verbose);
 void fixup_eoi(void);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index d101ffeaf9f3..263e502bc0f6 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2516,7 +2516,7 @@ static int __init cf_check setup_dump_irqs(void)
 }
 __initcall(setup_dump_irqs);
 
-/* Reset irq affinities to match the given CPU mask. */
+/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
 void fixup_irqs(const cpumask_t *mask, bool verbose)
 {
     unsigned int irq;
@@ -2540,19 +2540,15 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
 
         vector = irq_to_vector(irq);
         if ( vector >= FIRST_HIPRIORITY_VECTOR &&
-             vector <= LAST_HIPRIORITY_VECTOR )
+             vector <= LAST_HIPRIORITY_VECTOR &&
+             desc->handler == &no_irq_type )
         {
-            cpumask_and(desc->arch.cpu_mask, desc->arch.cpu_mask, mask);
-
             /*
              * This can in particular happen when parking secondary threads
              * during boot and when the serial console wants to use a PCI IRQ.
              */
-            if ( desc->handler == &no_irq_type )
-            {
-                spin_unlock(&desc->lock);
-                continue;
-            }
+            spin_unlock(&desc->lock);
+            continue;
         }
 
         if ( desc->arch.move_cleanup_count )
@@ -2573,7 +2569,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
                                affinity);
         }
 
-        if ( !desc->action || cpumask_subset(desc->affinity, mask) )
+        /*
+         * Avoid shuffling the interrupt around as long as current target CPUs
+         * are a subset of the input mask.  What fixup_irqs() cares about is
+         * evacuating interrupts from CPUs not in the input mask.
+         */
+        if ( !desc->action || cpumask_subset(desc->arch.cpu_mask, mask) )
         {
             spin_unlock(&desc->lock);
             continue;
-- 
2.44.0


