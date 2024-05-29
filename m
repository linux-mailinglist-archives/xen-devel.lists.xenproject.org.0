Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F88D327C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731693.1137386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCe-0008EA-73; Wed, 29 May 2024 09:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731693.1137386; Wed, 29 May 2024 09:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCe-0008AB-35; Wed, 29 May 2024 09:02:36 +0000
Received: by outflank-mailman (input) for mailman id 731693;
 Wed, 29 May 2024 09:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCc-0006nV-Mr
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:34 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fae73e0-1d9a-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 11:02:34 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-794ba2d4579so116587785a.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:34 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abd39bf3sm451529785a.114.2024.05.29.02.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:31 -0700 (PDT)
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
X-Inumbo-ID: 2fae73e0-1d9a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973352; x=1717578152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALobPQ5l/DjhjFTulvS4fT4tWBapunVg8uReYEyLy/E=;
        b=NN6sNLWAMpjm5z/6U1xsOe2F8lj6MiTnZTkEQaJY3IM33I70k12LMRMFhBKc4hb18R
         BOu8PQtnSNAsVyDWQ9fYk1GbQUDKLvUII2QegZKsefLNZxRdXG/CVBmgSfoaYa/OEOV1
         /ON4cJqxYar8+MWdfGmYGJW9X9lR+bYrEGs+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973352; x=1717578152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALobPQ5l/DjhjFTulvS4fT4tWBapunVg8uReYEyLy/E=;
        b=SdFyns2rw/E64vmszjoQAyUdmlEDDccMfL1NNJ5wcmNyTPYmrvu8bnmcY2J4fTNGGP
         BMQ1Zvr1IODDyR8sPwSmj3CW1R0ZSTOd8qBsG1GTCvDP8kksBV9eVsUp3UBf+TOh8lqr
         6MjHpXkyaDhe0hOmjWpCicMPJxot51FNbtMHsskpaXEC79Sjd+JeuXeqWctrOQyIOtin
         JyNRTIekwA7cgVhXRWjGcBeQQYaaSy2bDOf4R37nzDvAJLaVAysM4FJ43ieA70hMTkH4
         OO99af/klQZCdhBluIevnbMPf80s16LKfWxPnNRfLjLHTynbcl++qxuIxRgzoQxVxEl6
         XiNg==
X-Gm-Message-State: AOJu0Yzap0RTor07fLQxNEHqr1Gc+CZyFn03yp3FCGCVfrNWe9QUz+t7
	ratmDoIj4uc4qha0UvIBx0y1eVbIzBFBGAr1wSDqgBsdbHQBucR6yY7QKAgh7cgLlbKDt0+OhC7
	l
X-Google-Smtp-Source: AGHT+IFeh7suErWELrxwwMWXUq8jDXXBH01dea6zwgIMVCoOkjB04GbH9B18swjZG3RrGBpGvWUrUw==
X-Received: by 2002:a05:620a:4141:b0:790:789d:b3d0 with SMTP id af79cd13be357-794ab099dd1mr1642553285a.38.1716973352006;
        Wed, 29 May 2024 02:02:32 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 6/9] x86/irq: restrict CPU movement in set_desc_affinity()
Date: Wed, 29 May 2024 11:01:28 +0200
Message-ID: <20240529090132.59434-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If external interrupts are using logical mode it's possible to have an overlap
between the current ->arch.cpu_mask and the provided mask (or TARGET_CPUS).  If
that's the case avoid assigning a new vector and just move the interrupt to a
member of ->arch.cpu_mask that overlaps with the provided mask and is online.

While there also add an extra assert to ensure the mask containing the possible
destinations is not empty before calling cpu_mask_to_apicid(), as at that point
having an empty mask is not expected.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 1b7127090377..ae8fa574d4e7 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -846,19 +846,38 @@ void cf_check irq_complete_move(struct irq_desc *desc)
 
 unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
-    int ret;
-    unsigned long flags;
     cpumask_t dest_mask;
 
     if ( mask && !cpumask_intersects(mask, &cpu_online_map) )
         return BAD_APICID;
 
-    spin_lock_irqsave(&vector_lock, flags);
-    ret = _assign_irq_vector(desc, mask ?: TARGET_CPUS);
-    spin_unlock_irqrestore(&vector_lock, flags);
+    /*
+     * mask input set con contain CPUs that are not online.  To decide whether
+     * the interrupt needs to be migrated restrict the input mask to the CPUs
+     * that are online.
+     */
+    if ( mask )
+        cpumask_and(&dest_mask, mask, &cpu_online_map);
+    else
+        cpumask_copy(&dest_mask, TARGET_CPUS);
 
-    if ( ret < 0 )
-        return BAD_APICID;
+    /*
+     * Only move the interrupt if there are no CPUs left in ->arch.cpu_mask
+     * that can handle it, otherwise just shuffle it around ->arch.cpu_mask
+     * to an available destination.
+     */
+    if ( !cpumask_intersects(desc->arch.cpu_mask, &dest_mask) )
+    {
+        int ret;
+        unsigned long flags;
+
+        spin_lock_irqsave(&vector_lock, flags);
+        ret = _assign_irq_vector(desc, mask ?: TARGET_CPUS);
+        spin_unlock_irqrestore(&vector_lock, flags);
+
+        if ( ret < 0 )
+            return BAD_APICID;
+    }
 
     if ( mask )
     {
@@ -871,6 +890,7 @@ unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
         cpumask_copy(&dest_mask, desc->arch.cpu_mask);
     }
     cpumask_and(&dest_mask, &dest_mask, &cpu_online_map);
+    ASSERT(!cpumask_empty(&dest_mask));
 
     return cpu_mask_to_apicid(&dest_mask);
 }
-- 
2.44.0


