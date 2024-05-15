Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5DA8C69BC
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722504.1126540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GZd-0005bF-EG; Wed, 15 May 2024 15:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722504.1126540; Wed, 15 May 2024 15:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GZd-0005ZJ-B0; Wed, 15 May 2024 15:29:45 +0000
Received: by outflank-mailman (input) for mailman id 722504;
 Wed, 15 May 2024 15:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqhY=MS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7GZc-0005Yo-63
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:29:44 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f39ccf4d-12cf-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 17:29:43 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-792bcfde2baso594194085a.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:29:43 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf30f93fsm688476085a.102.2024.05.15.08.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 08:29:41 -0700 (PDT)
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
X-Inumbo-ID: f39ccf4d-12cf-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715786982; x=1716391782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sxGkmPVD5HLFrwQ1yQahTr4XsqgTq5I3qCRTvh/WaE=;
        b=Uwk+wrDrXKT7wuf5wQ8lhJMT7/SXTLwH+9ko2OA/VX5bG3I8ns7k3ndeggdr6rI1Mi
         wVH6SOXMMk9KuG0jL3u6yjgyIfbJyzy1MF/SO6s8kcrhh6/77XxTRp26EiTMdo7B3060
         8PocyYRPbJlX8vAP4V6JeJoDDj/nNZWLEufEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715786982; x=1716391782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sxGkmPVD5HLFrwQ1yQahTr4XsqgTq5I3qCRTvh/WaE=;
        b=h27vKPreQTxfzGwxZ9vW5QZmvFop1wu3MDYb12mWD+Mry1/MjjieS3BMc8DwohzGuo
         egZIGMnyg62jnFmP/IIipoq4TYmMhx1Ui7qADZEG+jdLgleO6vqs1oEEi6gRDa1pAYBI
         7B0mY0nHI1OYRqVlefhF88sGrQQpDIGHhv1MfL5cuuboyOUF/14Po1hrRW/9gXPn+jAP
         isgVriRDgnFPWQuolFRYHI1UXuobcOnk9Z8vkd0OxOxd8aCI3AR+ZCimKOvxH3BY+xVk
         vkDfV3JE43LheNoqKKq+qxr1PfG7YlJKwgWIUeJQ0eGah7jR+NQK2LwJZsBKCi3a74RE
         Jv2A==
X-Gm-Message-State: AOJu0YyLmm/psvmrrikDP368eHiqF4sKDtEJ5zBK16zBwuxFcJhg0xbM
	FVck2jAWGPcDFf3Cj6oB4k5PHED6+zeJ9a6rRyQfbHxse4abQ2f+tIw/fjhaRvJvZX31A/z4s7W
	0
X-Google-Smtp-Source: AGHT+IHrUfB3FnVXKRvNxQUkNyVWWW7N5YXwvqj3UY+11WN1ZeTw0FIO4srwbU/vABbkqlaVLEcTUw==
X-Received: by 2002:a05:620a:4393:b0:792:e8ab:9826 with SMTP id af79cd13be357-792e8ab983emr773594885a.62.1715786981746;
        Wed, 15 May 2024 08:29:41 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19?] xen/x86: pretty print interrupt CPU affinity masks
Date: Wed, 15 May 2024 17:29:25 +0200
Message-ID: <20240515152925.77197-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Print the CPU affinity masks as numeric ranges instead of plain hexadecimal
bitfields.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 80ba8d9fe912..3b951d81bd6d 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1934,10 +1934,10 @@ void do_IRQ(struct cpu_user_regs *regs)
                 if ( ~irq < nr_irqs && irq_desc_initialized(desc) )
                 {
                     spin_lock(&desc->lock);
-                    printk("IRQ%d a=%04lx[%04lx,%04lx] v=%02x[%02x] t=%s s=%08x\n",
-                           ~irq, *cpumask_bits(desc->affinity),
-                           *cpumask_bits(desc->arch.cpu_mask),
-                           *cpumask_bits(desc->arch.old_cpu_mask),
+                    printk("IRQ%d a={%*pbl}[{%*pbl},{%*pbl}] v=%02x[%02x] t=%s s=%08x\n",
+                           ~irq, CPUMASK_PR(desc->affinity),
+                           CPUMASK_PR(desc->arch.cpu_mask),
+                           CPUMASK_PR(desc->arch.old_cpu_mask),
                            desc->arch.vector, desc->arch.old_vector,
                            desc->handler->typename, desc->status);
                     spin_unlock(&desc->lock);
@@ -2638,7 +2638,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
         if ( !set_affinity )
             printk("Cannot set affinity for IRQ%u\n", irq);
         else if ( break_affinity )
-            printk("Broke affinity for IRQ%u, new: %*pb\n",
+            printk("Broke affinity for IRQ%u, new: {%*pbl}\n",
                    irq, CPUMASK_PR(affinity));
     }
 
-- 
2.44.0


