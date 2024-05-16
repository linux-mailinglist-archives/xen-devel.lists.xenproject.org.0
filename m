Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7946E8C7784
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723320.1128069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7b43-0003nI-DF; Thu, 16 May 2024 13:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723320.1128069; Thu, 16 May 2024 13:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7b43-0003lI-9Z; Thu, 16 May 2024 13:22:31 +0000
Received: by outflank-mailman (input) for mailman id 723320;
 Thu, 16 May 2024 13:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+4+=MT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7b41-0003lC-Dq
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:22:29 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 578b406f-1387-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:22:28 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34dc8d3fbf1so6593486f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 06:22:28 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbc887sm18860516f8f.98.2024.05.16.06.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 06:22:26 -0700 (PDT)
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
X-Inumbo-ID: 578b406f-1387-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715865747; x=1716470547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VRvChKd2TDTGb3agmd1ge7fLU7AVjjJM1gAP/8DEzUM=;
        b=HqBkatX3NkFISInxHVILdC4pOBU8JlBiLUbZijiwgpZNEGn1gZld0pul/ZgCxkaIje
         fhm8vYIN7AMkwVwzeVD2AJYzAzpcAobaCdHdZ91L7pYnLuH8FNrRaUrT6a18tNfxbmKV
         Dy4a+BjfPNNTK+0KYFjhU/jfhhTwHSpkuxNbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715865747; x=1716470547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRvChKd2TDTGb3agmd1ge7fLU7AVjjJM1gAP/8DEzUM=;
        b=HGIOKd03JWJfm/vXFMyNkSgBy34x6JESR17CuxfmA6uc+E6Fr0MDNWDI2T04qkFFJi
         Y5OARuWkQAr14I9GMNAUc4t9Aynz0iNk1FS2Z2KJbnsFkI41LtvhiABQhLnDNG9cStK2
         lUHqUuteyCHbcnCQgcfM9PQSbZ745yurVFCJ8xp1b7eGpaFDHQZeMNq+MOe/wxqjTKzk
         k8TrhiYxtFRe+b7TA3ToWDTZevTicrTDhV37GZz0b3LRJvUoRd1NQNOvFxhXIPWaJj4x
         6Cr1BD5Ct/C8fcl+BFFqSuZSo1UWlpRIBv4pHH0dqKAsa03RPiMA7o9E0MQ+Gr1zzEuQ
         t2Ew==
X-Gm-Message-State: AOJu0YxJVvR/HReE8IKmAENCvR3q9iunMr725BAm44u/aVdIFzREvPBJ
	oJC1aaOo8zQF4IMOoSSDLFCUb8r5kAX4uiG6FLTXsAofn5ipAbqGxJU2aoIeM6KruAPjn5Su69b
	5
X-Google-Smtp-Source: AGHT+IHOE0n0q0KE8F+wiBQXdbhx1wmyzDz1YXxcAFqBBVSvhXLTsrQNdFK+hxK+kYgcJ9ZDCYfiWw==
X-Received: by 2002:a05:6000:798:b0:351:b7c8:3f08 with SMTP id ffacd0b85a97d-351b7c83fa5mr13449591f8f.10.1715865747276;
        Thu, 16 May 2024 06:22:27 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] xen/x86: limit interrupt movement done by fixup_irqs()
Date: Thu, 16 May 2024 15:22:24 +0200
Message-ID: <20240516132224.86005-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
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
assigned to a CPU not present in the input mask.

Note that the shuffling done by fixup_irqs() is racy: the old destination
target is not allowed to drain any pending interrupts before the new
destination is set, which can lead to spurious 'No irq handler for vector ...'
messages.  While the proposed change doesn't fix the issue, limiting the
amount of shuffling to only strictly necessary reduces the chances of stray
interrupts.

While there also adjust the comment as to the purpose of fixup_irqs().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/irq.h | 2 +-
 xen/arch/x86/irq.c             | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 413994d2133b..33dd7667137b 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -130,7 +130,7 @@ void free_domain_pirqs(struct domain *d);
 int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq);
 int unmap_domain_pirq_emuirq(struct domain *d, int pirq);
 
-/* Reset irq affinities to match the given CPU mask. */
+/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
 void fixup_irqs(const cpumask_t *mask, bool verbose);
 void fixup_eoi(void);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 3b951d81bd6d..223f813f6ceb 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2527,7 +2527,7 @@ static int __init cf_check setup_dump_irqs(void)
 }
 __initcall(setup_dump_irqs);
 
-/* Reset irq affinities to match the given CPU mask. */
+/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
 void fixup_irqs(const cpumask_t *mask, bool verbose)
 {
     unsigned int irq;
@@ -2576,7 +2576,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
                 release_old_vec(desc);
         }
 
-        if ( !desc->action || cpumask_subset(desc->affinity, mask) )
+        /*
+         * Avoid shuffling the interrupt around if it's assigned to a CPU set
+         * that's all covered by the requested affinity mask.
+         */
+        cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
+        if ( !desc->action || cpumask_subset(affinity, mask) )
         {
             spin_unlock(&desc->lock);
             continue;
-- 
2.44.0


