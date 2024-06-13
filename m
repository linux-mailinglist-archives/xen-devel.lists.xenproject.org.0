Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4311C9078F5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 18:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740136.1147162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnm5-00016z-TT; Thu, 13 Jun 2024 16:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740136.1147162; Thu, 13 Jun 2024 16:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnm5-000149-PI; Thu, 13 Jun 2024 16:58:09 +0000
Received: by outflank-mailman (input) for mailman id 740136;
 Thu, 13 Jun 2024 16:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9y96=NP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHnm4-00013v-Ei
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 16:58:08 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a4f6571-29a6-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 18:58:07 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6b072522bd5so6230486d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 09:58:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5efb07csm8501036d6.134.2024.06.13.09.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:58:04 -0700 (PDT)
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
X-Inumbo-ID: 1a4f6571-29a6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718297884; x=1718902684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PC76GIkUGU8UlLIXtJNN8BuZtt7P1TDX2gYZkFadrsY=;
        b=Q3HxLKZGA8/LB9HR7L5aozT4/ibGj8IBRCVM4dXwQS3Xx6wocgDkCDXCcvknPtJGnk
         TA4Y1kCc/Oq+YwgA0NaMHqK5PAgTQBlvQyIXm+HDEHOA5F/PxJivpu83CN7tJOuSVQpp
         yhyufF23TYpXHE5TuQgflSa4X01/v6VlQyv3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297884; x=1718902684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PC76GIkUGU8UlLIXtJNN8BuZtt7P1TDX2gYZkFadrsY=;
        b=URHiF41Hvs6fpDzEMuxk+qKi2eAurp+KzSsgfpYbRCzfhdi3F6DM9Ay//p7byVxn4P
         Ol0ep40URTC/iMTGTHKNt7qwLgIS+3hdMdvjNNj9JpzW2iG9USkMCgqvPDUHP6P1K8Qm
         Mv6JGfHAvRe8liVCejzeigvUeJk5sHiYc9uZafSvkUM/0B+rb4f4FEnjN8vCeDvZh9Y8
         ntmLMGFXmfymt4iA/qsq3UjJZQ/zHfIDRjRxzeawCcSifeacdH4y3G6NrsMM247LNBtQ
         DJ8T6WT6481KulXAe2ivhId1kwV2mhh5oHT9YMp6hP3LqvNmfRQ0TRiOo53EfSod+plI
         G79A==
X-Gm-Message-State: AOJu0Yw6kg5BShd5ECmrgmEJFoSFm+ihdVsCq3axhv2dFcWI/2sNGrsA
	tWk90kb8ovdcNuO7A6teJP7xoPm5XiC7eGaH1H/gcnhsWmX1qkxVeAQPHzJ6jFw+uEz1ZHqXlkd
	d
X-Google-Smtp-Source: AGHT+IGul1+xQlyP5wng89N5Wm066PxOGU65bM5Nel+PzvhHTqNKFIMShWyiLZjCbJahOiflP3+Pzg==
X-Received: by 2002:a05:6214:943:b0:6b0:91d4:5825 with SMTP id 6a1803df08f44-6b2afd958d0mr1142786d6.56.1718297884533;
        Thu, 13 Jun 2024 09:58:04 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 1/3] x86/irq: deal with old_cpu_mask for interrupts in movement in fixup_irqs()
Date: Thu, 13 Jun 2024 18:56:15 +0200
Message-ID: <20240613165617.42538-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613165617.42538-1-roger.pau@citrix.com>
References: <20240613165617.42538-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Given the current logic it's possible for ->arch.old_cpu_mask to get out of
sync: if a CPU set in old_cpu_mask is offlined and then onlined
again without old_cpu_mask having been updated the data in the mask will no
longer be accurate, as when brought back online the CPU will no longer have
old_vector configured to handle the old interrupt source.

If there's an interrupt movement in progress, and the to be offlined CPU (which
is the call context) is in the old_cpu_mask clear it and update the mask, so it
doesn't contain stale data.

Note that when the system is going down fixup_irqs() will be called by
smp_send_stop() from CPU 0 with a mask with only CPU 0 on it, effectively
asking to move all interrupts to the current caller (CPU 0) which is the only
CPU to remain online.  In that case we don't care to migrate interrupts that
are in the process of being moved, as it's likely we won't be able to move all
interrupts to CPU 0 due to vector shortage anyway.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Adjust commit message.
 - Add comment about excluding smp_send_stop() case.
 - Use cpu_online().
---
 xen/arch/x86/irq.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 263e502bc0f6..d305aed317f2 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2526,7 +2526,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
         bool break_affinity = false, set_affinity = true;
-        unsigned int vector;
+        unsigned int vector, cpu = smp_processor_id();
         cpumask_t *affinity = this_cpu(scratch_cpumask);
 
         if ( irq == 2 )
@@ -2569,6 +2569,33 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
                                affinity);
         }
 
+        if ( desc->arch.move_in_progress &&
+             /*
+              * Only attempt to adjust the mask if the current CPU is going
+              * offline, otherwise the whole system is going down and leaving
+              * stale data in the masks is fine.
+              */
+             !cpu_online(cpu) &&
+             cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
+        {
+            /*
+             * This CPU is going offline, remove it from ->arch.old_cpu_mask
+             * and possibly release the old vector if the old mask becomes
+             * empty.
+             *
+             * Note cleaning ->arch.old_cpu_mask is required if the CPU is
+             * brought offline and then online again, as when re-onlined the
+             * per-cpu vector table will no longer have ->arch.old_vector
+             * setup, and hence ->arch.old_cpu_mask would be stale.
+             */
+            cpumask_clear_cpu(cpu, desc->arch.old_cpu_mask);
+            if ( cpumask_empty(desc->arch.old_cpu_mask) )
+            {
+                desc->arch.move_in_progress = 0;
+                release_old_vec(desc);
+            }
+        }
+
         /*
          * Avoid shuffling the interrupt around as long as current target CPUs
          * are a subset of the input mask.  What fixup_irqs() cares about is
-- 
2.45.2


