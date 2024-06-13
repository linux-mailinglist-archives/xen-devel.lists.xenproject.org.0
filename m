Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53BC9078F7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 18:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740138.1147175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnm9-0001Ql-D0; Thu, 13 Jun 2024 16:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740138.1147175; Thu, 13 Jun 2024 16:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnm9-0001Lv-9Q; Thu, 13 Jun 2024 16:58:13 +0000
Received: by outflank-mailman (input) for mailman id 740138;
 Thu, 13 Jun 2024 16:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9y96=NP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHnm7-0000pc-Jx
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 16:58:11 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c37be52-29a6-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 18:58:10 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-795482e114cso71841885a.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 09:58:09 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f2ff7fe5sm7757661cf.79.2024.06.13.09.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:58:06 -0700 (PDT)
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
X-Inumbo-ID: 1c37be52-29a6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718297887; x=1718902687; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY8rwLUUYs4x7J36qwiR2SVYEkIjFJPbuqF3KJ+AInE=;
        b=RDU9WeiA5fuNlpa4SqrO8yc3nDLNMKUodv0znPy0ThqyG1booQET3h4YqCSuz3q5u0
         TO/1VRCS8cxC9C/hilVoG2IJpZfZf8UZcMBIZwPgc4eQ1npCUFuJ1+f6rxG1BE3TyWsD
         idksdIKneg2znpGWgu44GzqODO2w5ndoOe3CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297887; x=1718902687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY8rwLUUYs4x7J36qwiR2SVYEkIjFJPbuqF3KJ+AInE=;
        b=EZxb5G/3u6iLuLizPWeLelRn3llcvYMJHQOZtMJtx4zXREv10NW7q39g5BgzM+G0/D
         s+VOWtoUOwS/KVkh7KoyY3lllom8YW8qC4/9gDUaWB2KA9IddAbFKzmN1lX9ne3OLr+N
         x/4OAPVXgQWzLKD6iNmo7gMHY1s2sqZ9//VymKESUzeEHkIylY4pqmE+JfiVpqyIb855
         Y8IFMmaJxuheQ+0F9qPTVju9QdAWRHQo0nd11+cO4bWgYPkLUY4qaqWV6th+dE01vAAm
         l5nP3s/XN0zY9gZC9ZxgqeNOtzJsFkXYaeYNLzAr9av/kZh3d5oQsixKkTwjcjwveYjZ
         00rQ==
X-Gm-Message-State: AOJu0Yxec2bo/d3ErVBPCIjfJcs/8zsEfqqY9GLml7pGCx7WbVIKpevg
	ykzmQNeZtxspPKX6NdxOQ/qwVqRxq2pK148gwRSTRM+KNNts9InPIvkEK9lab9yu+Wd3E8yft52
	e
X-Google-Smtp-Source: AGHT+IGZ1Mvm9118ZVFAEgnpnOMJEyewmbOC5FpeLdNjo2w51nZeduRXnb3h8W3COXmtzSe3y0e2eQ==
X-Received: by 2002:ad4:4b6d:0:b0:6b0:7b39:3c6d with SMTP id 6a1803df08f44-6b2afd8150bmr1035656d6.52.1718297886771;
        Thu, 13 Jun 2024 09:58:06 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 2/3] x86/irq: handle moving interrupts in _assign_irq_vector()
Date: Thu, 13 Jun 2024 18:56:16 +0200
Message-ID: <20240613165617.42538-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613165617.42538-1-roger.pau@citrix.com>
References: <20240613165617.42538-1-roger.pau@citrix.com>
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
Changes since v2:
 - Adjust comments.
 - Clean old vector from used_vectors mask.

Changes since v1:
 - Further refine the logic in _assign_irq_vector().
---
 xen/arch/x86/irq.c | 99 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index d305aed317f2..f36962fc1dc3 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -544,7 +544,58 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
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
+            /* Cancel the pending move and release the current vector. */
+            desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
+            cpumask_clear(desc->arch.old_cpu_mask);
+            desc->arch.move_in_progress = 0;
+            desc->arch.move_cleanup_count = 0;
+            if ( desc->arch.used_vectors )
+            {
+                ASSERT(test_bit(old_vector, desc->arch.used_vectors));
+                clear_bit(old_vector, desc->arch.used_vectors);
+            }
+
+            return 0;
+        }
+
+        /*
+         * There's an interrupt movement in progress but the destination(s) in
+         * ->arch.old_cpu_mask are not suitable given the 'mask' parameter, go
+         * through the full logic to find a new vector in a suitable CPU.
+         */
+    }
 
     err = -ENOSPC;
 
@@ -600,7 +651,24 @@ next:
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
+             * Cleanup will be done normally for the old fields, just release
+             * the current vector here.
+             */
+            if ( desc->arch.used_vectors )
+            {
+                ASSERT(test_bit(old_vector, desc->arch.used_vectors));
+                clear_bit(old_vector, desc->arch.used_vectors);
+            }
+        }
+        else if ( valid_irq_vector(old_vector) )
         {
             cpumask_and(desc->arch.old_cpu_mask, desc->arch.cpu_mask,
                         &cpu_online_map);
@@ -2607,33 +2675,6 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
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
2.45.2


