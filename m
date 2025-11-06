Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EEC3C35B
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 16:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157081.1486000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2Oe-0007sb-Ss; Thu, 06 Nov 2025 15:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157081.1486000; Thu, 06 Nov 2025 15:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2Oe-0007py-PV; Thu, 06 Nov 2025 15:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1157081;
 Thu, 06 Nov 2025 15:58:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFS0=5O=suse.com=marco.crivellari@srs-se1.protection.inumbo.net>)
 id 1vH2Nm-0007GJ-TT
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 15:58:42 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7759479a-bb29-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 16:58:42 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-429cf861327so879710f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 07:58:42 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb403793sm5758966f8f.2.2025.11.06.07.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 07:58:40 -0800 (PST)
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
X-Inumbo-ID: 7759479a-bb29-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762444721; x=1763049521; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTKQ/9KgyAcLZI3pm3L05sC2QlXoOYBGo9f5Rvs6qdU=;
        b=PmSEE/UUBdOf1xk5gVicej8iFrs6zBaneA4ANWL2DHmD5MnVuhzemMSzkL+qlvLSLM
         YB0XX6t8D13jW+t9TXw/r7+/tZsebH1+108DwzDWJm2zbWyxmcAfTapy+8sYbHcFvBxE
         6bLTZUFuvjiV6G33w5fS90H3APnaoM/UWQnOobsabFHlE/ZxprGXwGs/JDhO0MtqXx+l
         4d4K6zvkJKqGFQFYmxEI4Wb+r2nvHhug36Gyx6ytVKSZzeU+QsXf5EGiBkZmLwCFVH5E
         xqVQ5vwsAhOPHMzuA0TMW7n/ZnZ0324opvmgmKP1mC5h5cdhRMvhQh0ssqkqYp/rZV1o
         WTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444721; x=1763049521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTKQ/9KgyAcLZI3pm3L05sC2QlXoOYBGo9f5Rvs6qdU=;
        b=fpOWOVuQ+gvKGQWVpyvONkRJq3xn7ZJOjpqnb49MEAFG9FEnfXo2jDu2D/N0KYt4Ey
         5j2NLof0obbZpOz0v/UEOT2IJS5Xk001XpeitmmVb59A0RbbWAc2ECiaIxWbcipKzssc
         jot5GUXmWe4kw1Syc0wAa70K/1mHmdJ/pCsMBIJ4twe95hCvZGpuCkeRrI8IQ++fLICx
         lP3HrhWiglzYxqr27NUjb+xjNEn+WWvCysPJdJduWtvd4CG7xmKiNcW75qq6QPvGkK0S
         Iy2NJNPSTvWRvs1bMsOIS2ukqshNnuDfrGg5bPihUIUsFWd9O2qs3cW/8wrvcDLWUVI0
         fr1A==
X-Forwarded-Encrypted: i=1; AJvYcCWBKMbkoMSwkguzoHKx9usrUyhLMbusWpq67pG3oISKBQvZH+FBbrPnZkfPsDhILIPeThXskbHAnXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK6eidv8J24aIRprHtXfQMWjoFumQ3kYLfF6fOFrufLQgIBn9y
	BOgzdWWp0YyzL0fFscUY+jW37kuSYpb/dRebfyLESoqZeNykr6+hkM0bhU67a8PYaNM=
X-Gm-Gg: ASbGncsEyL7G5SLPXXmslH4Q5Um4oz8Gch4m3oS+H3CVy2vSn3px6IhkwZ6xdITZkIT
	l69IIaC9jVz/0FnuuHJ3PMrPolawEW+m09VKNycFaMfkSfYLomFO4qluBWaPtE8AL/GayeJYjyG
	Qjk2Y2GcO/7GLAKBWgq3UI7FZi866PibZRCk506Sp9fz5fBruvI0i6cgdcpEwdveWPDpSm+kiac
	Z8tyG5VZLxCm4wtSaB/2UfrMZJBxb7p25GBfS7UyTUYY0aKGKPTcka5XejgtN8vxi84GKpp8fiw
	hwfVnW9c+DBv6+rK22AaJcSUDX+Bk5L4+kT8KgzGHXwdZAO0ype+2xz0gUyVP0aunuV+qTeoVpb
	Rj6o4AcExoVQQx/mCqIFRJjtK7PZx/i9yEQDA0EStXqB2yqF7lqJrL1+t8OW7lZEc518MiKZ4Z+
	K/cfwOeAA9x6gzcAUsupMWWP8=
X-Google-Smtp-Source: AGHT+IFMnkLTlhStdnpadBpL2HuGw+mkAPiYvwVjt6jcTNz2UFYHeUrdQTK+BluDsXkk7abaXQWnhg==
X-Received: by 2002:a05:6000:420c:b0:429:cc5f:68a7 with SMTP id ffacd0b85a97d-429e330b919mr7123146f8f.44.1762444721404;
        Thu, 06 Nov 2025 07:58:41 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH 1/2] xen/events: replace use of system_wq with system_percpu_wq
Date: Thu,  6 Nov 2025 16:58:30 +0100
Message-ID: <20251106155831.306248-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106155831.306248-1-marco.crivellari@suse.com>
References: <20251106155831.306248-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Switch to using system_percpu_wq because system_wq is going away as part of
a workqueue restructuring.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/xen/events/events_base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 9478fae014e5..663df17776fd 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -581,7 +581,7 @@ static void lateeoi_list_add(struct irq_info *info)
 					eoi_list);
 	if (!elem || info->eoi_time < elem->eoi_time) {
 		list_add(&info->eoi_list, &eoi->eoi_list);
-		mod_delayed_work_on(info->eoi_cpu, system_wq,
+		mod_delayed_work_on(info->eoi_cpu, system_percpu_wq,
 				    &eoi->delayed, delay);
 	} else {
 		list_for_each_entry_reverse(elem, &eoi->eoi_list, eoi_list) {
@@ -666,7 +666,7 @@ static void xen_irq_lateeoi_worker(struct work_struct *work)
 			break;
 
 		if (now < info->eoi_time) {
-			mod_delayed_work_on(info->eoi_cpu, system_wq,
+			mod_delayed_work_on(info->eoi_cpu, system_percpu_wq,
 					    &eoi->delayed,
 					    info->eoi_time - now);
 			break;
@@ -782,7 +782,7 @@ static void xen_free_irq(struct irq_info *info)
 
 	WARN_ON(info->refcnt > 0);
 
-	queue_rcu_work(system_wq, &info->rwork);
+	queue_rcu_work(system_percpu_wq, &info->rwork);
 }
 
 /* Not called for lateeoi events. */
-- 
2.51.1


