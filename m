Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7769023EF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 16:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737301.1143574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftO-0001Hy-4E; Mon, 10 Jun 2024 14:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737301.1143574; Mon, 10 Jun 2024 14:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftO-0001EL-0a; Mon, 10 Jun 2024 14:21:02 +0000
Received: by outflank-mailman (input) for mailman id 737301;
 Mon, 10 Jun 2024 14:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGftL-00007Q-Vr
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:20:59 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a841e0bc-2734-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 16:20:59 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7955f3d4516so106311385a.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:20:59 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-440387964afsm36806921cf.0.2024.06.10.07.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 07:20:57 -0700 (PDT)
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
X-Inumbo-ID: a841e0bc-2734-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718029258; x=1718634058; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CHpMOxsvIdkAbF+8l0n1eVm0ADzVdTBMt6vKxN7VAA=;
        b=hqCGMqSu/r5P9AKQyqMjcgxzD1ZcE+SqoGU2JRvcDeHtdieRa34+QZGZEzUaXHJdmb
         RPUxW9gVZW0NxdXFMkios4liiz+m2VeteqKrKmmi3QlhlLG/tGpV2l5H0YI1ZiwqFRWw
         JEghK7IpJLndxVp2OaIAaN8HZrGXfN4tBw9aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029258; x=1718634058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CHpMOxsvIdkAbF+8l0n1eVm0ADzVdTBMt6vKxN7VAA=;
        b=cNQiqj6rqdC0Nqyr9NSJIK/8FXOE0bU3yNbHFPt5zY0JQcWSG4R+XszN3zaOj1Z/qf
         21g3dyFEJuCZuSEYYRlgdZqUwiO5YWxm+QopwNByKGIRIlcLQpzitiE9aq6D3XozjiZ2
         6dSHQkZk5PPZ3mPHtj+VhVvNNBqjivKuSACbgOtycixIQGMuJtmIC5iifE7Vbezf8GjQ
         gn87TQvIzzLhLWcLZqgnsLs7unaqEydOgzqhM+AyoycQeQ7Ap3eeSXRvo34ewlLx55ml
         0S1Zhq6GMGZEXd23eq3HYPCoLC/BMM7xqzBsyiBwS4hNKOHthVZNdBP9CQ0XD4b2KQfX
         ugJw==
X-Gm-Message-State: AOJu0YxQbLQ6ZyqF1X+0mnGWUVt1PLcq7XanajlANbyDV1db4OeT5YBN
	vc7R+EiaJee11t6C6J3UE5sb5cRAyyOtgd1QprEZHaQlQDaD3wtaejXoy9isPIbKoqQ6XfDELHd
	q
X-Google-Smtp-Source: AGHT+IEoORcnXRvpb01P4p2Pp35n1REoevTWgtTP+Wf8+LLKFZGHm5W9a3McbUnGGXRgS9uXGpQhRQ==
X-Received: by 2002:a05:620a:4149:b0:795:5c48:4271 with SMTP id af79cd13be357-7955c4843c3mr781619185a.25.1718029257749;
        Mon, 10 Jun 2024 07:20:57 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 5/7] x86/irq: deal with old_cpu_mask for interrupts in movement in fixup_irqs()
Date: Mon, 10 Jun 2024 16:20:41 +0200
Message-ID: <20240610142043.11924-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610142043.11924-1-roger.pau@citrix.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
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

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 306e7756112f..f07e09b63b53 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2546,7 +2546,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
     for ( irq = 0; irq < nr_irqs; irq++ )
     {
         bool break_affinity = false, set_affinity = true;
-        unsigned int vector;
+        unsigned int vector, cpu = smp_processor_id();
         cpumask_t *affinity = this_cpu(scratch_cpumask);
 
         if ( irq == 2 )
@@ -2589,6 +2589,28 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
                                affinity);
         }
 
+        if ( desc->arch.move_in_progress &&
+             !cpumask_test_cpu(cpu, &cpu_online_map) &&
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
2.44.0


