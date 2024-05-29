Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B198D3281
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731696.1137405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCk-0000Ye-Rc; Wed, 29 May 2024 09:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731696.1137405; Wed, 29 May 2024 09:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCk-0000VH-OG; Wed, 29 May 2024 09:02:42 +0000
Received: by outflank-mailman (input) for mailman id 731696;
 Wed, 29 May 2024 09:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCj-0006YK-8g
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:41 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 329e9554-1d9a-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 11:02:39 +0200 (CEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6f12ed79fdfso977450a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:39 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb1800900sm51957851cf.49.2024.05.29.02.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:36 -0700 (PDT)
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
X-Inumbo-ID: 329e9554-1d9a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973357; x=1717578157; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw6o6qcvvPGFZkVuxNsOOgXzV4/8wiApb/K/FBe9Ung=;
        b=Lj4UUHhIye+Rmj3k6w5hYyy1hvn97MWilKKJ5dQZAWYOV0DlfU5iJVRhVeQPs4TELf
         TiWFfFXDc4DlpY7ZbiQdkhE/2DEkC9a7pIB3+bOzAEHeUMv7Sj9/sYHklNJZVuHuGG+o
         NwXP40hVBeXXIXXsfk6sBQRD/teKnpQhREgjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973357; x=1717578157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vw6o6qcvvPGFZkVuxNsOOgXzV4/8wiApb/K/FBe9Ung=;
        b=MB9f6Y/4MjDopF4x2/1i4eK8ZsxCRjk76D1vwktTcxHi4pBQa9hPFk3lp9Af436CYK
         xw6Y+Lk6/MiFwRHrav312MQueX4furrlGNKyHyDHLIfUIEK0QVD+6HndG/yh390lU0Y3
         ih419QHOz9VlRoboeiYIJDqamJG6OmY6haKoEU6bd9NJmwYmE9Nums57mrpDWRx6WZ95
         /1r8YGOU0XGFD4ewvGe87q46BPull9wOCwyXSQlDt3wwLXcmf0bauL8ylTn5GNk1ZfTv
         E/qzrtEDN7i5laCLlecfRcbaftVKBRJuHG+p4C+TDyZMHE0m9vSfw7gaDjwVZpnChRT0
         m5/g==
X-Gm-Message-State: AOJu0YxYpKvD1yRHpUAfY6kJVTCg4GT2uo2GMo97bK8gSk3W2LplMP6e
	ojiLqJOZGLufuLG94F/w57ENbD0kOR7uBayDDp5s0lVBKI1E/6/4uiK1fAitUO7mnG7ML1gp7Py
	b
X-Google-Smtp-Source: AGHT+IFLHUdyzkgrzHVkeQlrYo1dYeqmlu2o9LZO6GV5j4xp6V8azEcXB3lbTGzHXJWxe/5WS1YSzA==
X-Received: by 2002:a9d:6246:0:b0:6f1:2485:6d7e with SMTP id 46e09a7af769-6f8d0b9258cmr13539533a34.36.1716973356660;
        Wed, 29 May 2024 02:02:36 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 8/9] x86/irq: handle moving interrupts in _assign_irq_vector()
Date: Wed, 29 May 2024 11:01:30 +0200
Message-ID: <20240529090132.59434-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently there's logic in fixup_irqs() that attempts to prevent
_assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
interrupts form the CPUs not present in the input mask.  The current logic in
fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.

Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
_assign_irq_vector() cannot fail, introduce some logic in _assign_irq_vector()
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

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 66 ++++++++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 8822f382bfe4..33979729257e 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -553,7 +553,44 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
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
+         * Fallback to the old destination if moving is in progress and the
+         * current destination is to be offlined.  This is required by
+         * fixup_irqs() to evacuate interrupts from a CPU to be offlined.
+         *
+         * Due to the logic in fixup_irqs() that clears offlined CPUs from
+         * ->arch.old_cpu_mask it shouldn't be possible to get here with
+         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
+         * ->arch.old_cpu_mask.
+         */
+        ASSERT(valid_irq_vector(desc->arch.old_vector));
+        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, mask));
+        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
+
+        /* Set the old destination as the current one. */
+        desc->arch.vector = desc->arch.old_vector;
+        cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
+
+        /* Undo any possibly done cleanup. */
+        for_each_cpu(cpu, desc->arch.cpu_mask)
+            per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;
+
+        /* Cancel the pending move. */
+        desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
+        cpumask_clear(desc->arch.old_cpu_mask);
+        desc->arch.move_in_progress = 0;
+        desc->arch.move_cleanup_count = 0;
+
+        return 0;
+    }
 
     err = -ENOSPC;
 
@@ -2635,33 +2672,6 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
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


