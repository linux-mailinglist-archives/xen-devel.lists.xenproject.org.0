Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60179023F6
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 16:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737302.1143583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftR-0001bs-BW; Mon, 10 Jun 2024 14:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737302.1143583; Mon, 10 Jun 2024 14:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftR-0001Yz-78; Mon, 10 Jun 2024 14:21:05 +0000
Received: by outflank-mailman (input) for mailman id 737302;
 Mon, 10 Jun 2024 14:21:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGftP-0008MI-DJ
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:21:03 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9a999f6-2734-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 16:21:01 +0200 (CEST)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-43ffbc0927fso25295631cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:21:01 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44038a68e55sm36473281cf.24.2024.06.10.07.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 07:20:59 -0700 (PDT)
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
X-Inumbo-ID: a9a999f6-2734-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718029260; x=1718634060; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+NbzKdNCPo1s6Mdl+9AvKyg4EH4oF+mfwLbxFaB8IA=;
        b=PxS/mHzupQbbfPj2V9dYqIojoNX3KQAPgxwMocNksyqibNCKhoc+Ouqo89sbvY8Yf8
         +Fp9L5/aCWEvLkXKet74jKqZOlpdc4NtQeAsY5VSANgsd8SAbZha6ytZEdHXIdAx7EG4
         ZmzOVMrBiY2NvS4EFLQVy3+toFJS44erp+c5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029260; x=1718634060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+NbzKdNCPo1s6Mdl+9AvKyg4EH4oF+mfwLbxFaB8IA=;
        b=F6FjbupZ1v/Ka8nIat/V07JWb5dXYDyo8BpPbzt/xzPc0bGG0oVIRluTHxnfjM7NBc
         Yup0NFAZ7HUDi+RH3aXc1JCvg4up8gexTPw2WrB65xZXrZGljMjaUKIIfVM70lTg/qR+
         BWD2dSr43FD5cX7Tpsc2gtkxg/PBTEtIPjGvaxy4hJ1juR4J6uAobqA0ObGeZQtxFD93
         6bHJPrRISht0qt7OzJnEZDi7If0q/eCvwz6Em9mPSmPc4CTs0o4iFr4RHOjkbCQT/cHQ
         5sjIzvlLVVA+YAnyZueh4fUtl3FcI1j9nWNJivzeL73kGTHqARzbi8ay+PuPAtBBodrM
         nGjA==
X-Gm-Message-State: AOJu0Yyo3XtjejCA+Mef3AqKgFgU1Uud02Mf15nJgSi3SfJrnYAvcUKO
	6THJeONcXkvlC2X0UnlsZVeFdDaR58ZouuIFcZ7qzGhuxuEk4tb9uLKG3iWjKPurQ8wUktwYR4/
	s
X-Google-Smtp-Source: AGHT+IGoVswSKHWjkGlfxiCqCrFXbRF14HzayUnmcbGoCXniQP/N9W0gX6JoNsdwjyxFEKSB1kvHow==
X-Received: by 2002:a05:622a:13c8:b0:43a:e730:3a23 with SMTP id d75a77b69052e-44041c31ad9mr113957351cf.3.1718029259897;
        Mon, 10 Jun 2024 07:20:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 6/7] x86/irq: handle moving interrupts in _assign_irq_vector()
Date: Mon, 10 Jun 2024 16:20:42 +0200
Message-ID: <20240610142043.11924-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610142043.11924-1-roger.pau@citrix.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently there's logic in fixup_irqs() that attempts to prevent
_assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
interrupts from the CPUs not present in the input mask.  The current logic in
fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.

Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
_assign_irq_vector() cannot fail, introduce logic in _assign_irq_vector()
to deal with interrupts that have either move_{in_progress,cleanup_count} set
and no remaining online CPUs in ->arch.cpu_mask.

If _assign_irq_vector() is requested to move an interrupt in the state
described above, first attempt to see if ->arch.old_cpu_mask contains any valid
CPUs that could be used as fallback, and if that's the case do move the
interrupt back to the previous destination.  Note this is easier because the
vector hasn't been released yet, so there's no need to allocate and setup a new
vector on the destination.

Due to the logic in fixup_irqs() that clears offline CPUs from
->arch.old_cpu_mask (and releases the old vector if the mask becomes empty) it
shouldn't be possible to get into _assign_irq_vector() with
->arch.move_{in_progress,cleanup_count} set but no online CPUs in
->arch.old_cpu_mask.

However if ->arch.move_{in_progress,cleanup_count} is set and the interrupt has
also changed affinity, it's possible the members of ->arch.old_cpu_mask are no
longer part of the affinity set, move the interrupt to a different CPU part of
the provided mask and keep the current ->arch.old_{cpu_mask,vector} for the
pending interrupt movement to be completed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Further refine the logic in _assign_irq_vector().
---
 xen/arch/x86/irq.c | 87 ++++++++++++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index f07e09b63b53..54eabd23995c 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -544,7 +544,53 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
     }
 
     if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
-        return -EAGAIN;
+    {
+        /*
+         * If the current destination is online refuse to shuffle.  Retry after
+         * the in-progress movement has finished.
+         */
+        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
+            return -EAGAIN;
+
+        /*
+         * Due to the logic in fixup_irqs() that clears offlined CPUs from
+         * ->arch.old_cpu_mask it shouldn't be possible to get here with
+         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
+         * ->arch.old_cpu_mask.
+         */
+        ASSERT(valid_irq_vector(desc->arch.old_vector));
+        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
+
+        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
+        {
+            /*
+             * Fallback to the old destination if moving is in progress and the
+             * current destination is to be offlined.  This is only possible if
+             * the CPUs in old_cpu_mask intersect with the affinity mask passed
+             * in the 'mask' parameter.
+             */
+            desc->arch.vector = desc->arch.old_vector;
+            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
+
+            /* Undo any possibly done cleanup. */
+            for_each_cpu(cpu, desc->arch.cpu_mask)
+                per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;
+
+            /* Cancel the pending move. */
+            desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
+            cpumask_clear(desc->arch.old_cpu_mask);
+            desc->arch.move_in_progress = 0;
+            desc->arch.move_cleanup_count = 0;
+
+            return 0;
+        }
+
+        /*
+         * There's an interrupt movement in progress but the destination(s) in
+         * ->arch.old_cpu_mask are not suitable given the passed 'mask', go
+         * through the full logic to find a new vector in a suitable CPU.
+         */
+    }
 
     err = -ENOSPC;
 
@@ -600,7 +646,17 @@ next:
         current_vector = vector;
         current_offset = offset;
 
-        if ( valid_irq_vector(old_vector) )
+        if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
+        {
+            ASSERT(!cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map));
+            /*
+             * Special case when evacuating an interrupt from a CPU to be
+             * offlined and the interrupt was already in the process of being
+             * moved.  Leave ->arch.old_{vector,cpu_mask} as-is and just
+             * replace ->arch.{cpu_mask,vector} with the new destination.
+             */
+        }
+        else if ( valid_irq_vector(old_vector) )
         {
             cpumask_and(desc->arch.old_cpu_mask, desc->arch.cpu_mask,
                         &cpu_online_map);
@@ -2622,33 +2678,6 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
             continue;
         }
 
-        /*
-         * In order for the affinity adjustment below to be successful, we
-         * need _assign_irq_vector() to succeed. This in particular means
-         * clearing desc->arch.move_in_progress if this would otherwise
-         * prevent the function from succeeding. Since there's no way for the
-         * flag to get cleared anymore when there's no possible destination
-         * left (the only possibility then would be the IRQs enabled window
-         * after this loop), there's then also no race with us doing it here.
-         *
-         * Therefore the logic here and there need to remain in sync.
-         */
-        if ( desc->arch.move_in_progress &&
-             !cpumask_intersects(mask, desc->arch.cpu_mask) )
-        {
-            unsigned int cpu;
-
-            cpumask_and(affinity, desc->arch.old_cpu_mask, &cpu_online_map);
-
-            spin_lock(&vector_lock);
-            for_each_cpu(cpu, affinity)
-                per_cpu(vector_irq, cpu)[desc->arch.old_vector] = ~irq;
-            spin_unlock(&vector_lock);
-
-            release_old_vec(desc);
-            desc->arch.move_in_progress = 0;
-        }
-
         if ( !cpumask_intersects(mask, desc->affinity) )
         {
             break_affinity = true;
-- 
2.44.0


