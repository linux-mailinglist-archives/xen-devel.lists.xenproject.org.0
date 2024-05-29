Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F398D327A
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731692.1137376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCb-0007t9-TY; Wed, 29 May 2024 09:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731692.1137376; Wed, 29 May 2024 09:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCb-0007qt-Pb; Wed, 29 May 2024 09:02:33 +0000
Received: by outflank-mailman (input) for mailman id 731692;
 Wed, 29 May 2024 09:02:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCa-0006nV-A0
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:32 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e5a6174-1d9a-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 11:02:31 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-794ab0eb68cso51887985a.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:31 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abca595fsm451836885a.20.2024.05.29.02.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:29 -0700 (PDT)
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
X-Inumbo-ID: 2e5a6174-1d9a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973350; x=1717578150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAuY/xXpNim8cPIlMAplQjmAZ+i26Dd77jwyP57jPsU=;
        b=psIvWBPFrvk87102dToGJzui93PeHM2ALt6pJimyhtj9Jqx/gws6tfycUk+Tp6lH9Q
         WRUBd4dj/h+LgIylwqd0IkKyBXutnkxWBbwfBq1+Rdg5wrdtIE+IT2eN9t004Jocwyi3
         37f0IrudiZIkb0kBrrWeMaURMSzYBCBQaqJH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973350; x=1717578150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAuY/xXpNim8cPIlMAplQjmAZ+i26Dd77jwyP57jPsU=;
        b=Q1n1OfEuGEK1QDlBixzyAzl7YSQSAHmmkNcLmurWwboz4jsrfttg8pTVQtN2oXP+hd
         iyCTm110LRmg5fGe3yk1l9MjYP3NMeNVmUkDf4jRBDp/pTAfOpYsBSYnAWhayI7VxzDR
         ul9fZ/ZxIyR58/sO+RE/PZNIrX222P3jkK+TNV7xZXlGNqBLGv3jjZrwMd1pmVCeL5Lv
         EB+OFK1Ii6FKwpujsQe0f6nIhjRfSfkxyBau0JiBh58Jg7aQpkHIIE8S6BMmVPR5x4Z4
         ZqA3j8UXE1sWuIx175k49NOFHCMDWfQm0yxUVKE6Gze1dEc4XQJywYXu0IjJYs/8qFHS
         t5kw==
X-Gm-Message-State: AOJu0YzvvnKl+p77R9jVDhVfWR8+/AM78VCXnnfOBD5NywQFP4EjjTHR
	uEaW2VWi/z3v1nlXjldIapJ0SKZBV/sqx8cb99CKs6iHHD/QKBrVTbgOCTqQCnCQi4/VQLS+Foc
	Q
X-Google-Smtp-Source: AGHT+IEX7YTYod6TYWAapgRjN+lQ5kEIMzH3l8YDx0WLvT/Q0qT/SVJs+By7i8tud7uDQbMZHbLf+A==
X-Received: by 2002:a05:620a:6112:b0:794:ca6a:2101 with SMTP id af79cd13be357-794dfb9935bmr229992585a.14.1716973349638;
        Wed, 29 May 2024 02:02:29 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 5/9] x86/irq: limit interrupt movement done by fixup_irqs()
Date: Wed, 29 May 2024 11:01:27 +0200
Message-ID: <20240529090132.59434-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
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

While there also adjust the comment as to the purpose of fixup_irqs().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Do not AND ->arch.cpu_mask with cpu_online_map.
 - Keep using cpumask_subset().
 - Integrate into bigger series.
---
 xen/arch/x86/include/asm/irq.h | 2 +-
 xen/arch/x86/irq.c             | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 80a3aa7a88b9..b7dc75d0acbd 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -156,7 +156,7 @@ void free_domain_pirqs(struct domain *d);
 int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq);
 int unmap_domain_pirq_emuirq(struct domain *d, int pirq);
 
-/* Reset irq affinities to match the given CPU mask. */
+/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
 void fixup_irqs(const cpumask_t *mask, bool verbose);
 void fixup_eoi(void);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 9716e00e873b..1b7127090377 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2525,7 +2525,7 @@ static int __init cf_check setup_dump_irqs(void)
 }
 __initcall(setup_dump_irqs);
 
-/* Reset irq affinities to match the given CPU mask. */
+/* Evacuate interrupts assigned to CPUs not present in the input CPU mask. */
 void fixup_irqs(const cpumask_t *mask, bool verbose)
 {
     unsigned int irq;
@@ -2582,7 +2582,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
                             &cpu_online_map);
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


