Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF2FC3C361
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 16:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157085.1486013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2Of-00081g-G1; Thu, 06 Nov 2025 15:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157085.1486013; Thu, 06 Nov 2025 15:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2Of-0007vh-7c; Thu, 06 Nov 2025 15:59:37 +0000
Received: by outflank-mailman (input) for mailman id 1157085;
 Thu, 06 Nov 2025 15:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFS0=5O=suse.com=marco.crivellari@srs-se1.protection.inumbo.net>)
 id 1vH2Np-0007c8-Ri
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 15:58:45 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76bfe22c-bb29-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 16:58:41 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso1298241f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 07:58:41 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb403793sm5758966f8f.2.2025.11.06.07.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 07:58:39 -0800 (PST)
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
X-Inumbo-ID: 76bfe22c-bb29-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762444720; x=1763049520; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FL6nYeU7/sYbYGrjWjcW/vfma09XwfZvs7Q6SdJJn4=;
        b=BCLWII1OZU1Jk6DDtyMm1tkwMgQg3mheNzlUKH2G/alQCMAXyfDaRpcUkGrzB5YKwE
         s1xfmCY0fkve5bljN53WPqUg8OlhgVbdAmepgf2vh9fBrCKFaPzUYRmTfGciBdwC1dOL
         JGgDRy0C+aLHgLQ56APi1TZ1/muEy8yn4IrlezPIXvVSGotMZIrap6/hNOwZv8Y1RBLn
         8YGoIR0QyL4jLQ+fLfdIhGngY2q1vr7cH2YBohkryEHjkUrQ2RfrN1iLx3SwpbdDnPPJ
         rGz7orhM7M+Fr2Y2gF4slcySEyXC6nz/OWheSqSxWnj3lUG8AmNcCZdWpyo/2nGFiJ0o
         W8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444720; x=1763049520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FL6nYeU7/sYbYGrjWjcW/vfma09XwfZvs7Q6SdJJn4=;
        b=mIuN7uMSFLCX/RpYfLV9UTK+kVatiG0fyIZ7iQJvfwJhdmg+++IP1wyXH9f9H8sxIK
         ARNNO+Gzt6g2HRVMJl3ielpAqgKhyuw3ISG3i53GuCm/vppsc9EFMDRnEVc9FnTU2FMy
         WZzPvQa7ppYeLhHYHCCDz8hG2XQDSQF1xKrE0EentiFdLf/uNgPrO/9SVNyEtKW9beUH
         keuGSqGRwPtwSLaxBleXDjk3ngk7Y/RCcxT4G7Km/o8FStPQFtcs14PIL8sOgCh76gI0
         3C7fQPPndfYzysUPoCaikURhyCoZqgwUEDyioMzGri6iJYeYTKGq4xWBxdDTPcd4CazU
         yE7g==
X-Forwarded-Encrypted: i=1; AJvYcCVVUahZizo46A81C7GwGbNBCrZ/7hhP/SCy9nEZtdnAx6saAWIAhObv4utqbQtMe0VVgoyDQdAZiTw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX7gG0caLGajVyKRQj9BsY4U4PL5imGR3Cl3XqIZWTx1qEcZe0
	LceaCPJWw+y8Ep5NxwEULhQpHFJ7Sg7Xk4nP1FSn6BzbLqwDfr6CScA824WlLTIwA+0=
X-Gm-Gg: ASbGncuspk7qpHKEyvB3kZyurIkaAoBpPZa0vMeLQynTGilJKISWRAbOTJCRGKB0gyP
	JXUQcHrrPrcHoj2OwcaIlyNV8UAqoeRsB3k1DGjYMBQvPv8FTR+8thjyptr/0kF5erA0WSYRN63
	dzPlA/fyDiFdCD9tQ7rmLXuCE8PikOa+qFmc62WYGiFn622unk5h0wkOAfoOaQ2pkZdvT9lw1//
	yS3cVooMr/c46jwfVt6RJKskrrZFjSJvIM4/GrAw/4StFLPF/Id4PCmFkaVlfLNccjkTL97uOc7
	qGl84kFSjv2K/abBYmjypK9uqWeIZDt4dtoMzIBHTJTMCWdtrGzUkziC1F40rxYQOJBkXz1WlGt
	RZYeP6NvHlBdI+AAiR3wfVbxvVQxsUibRr5UMkRpdQWgAsJZcP7OTB+S3zgnH5gFSquF13Sntv5
	WWAySdgECIc5xQH68bjUz7WJA=
X-Google-Smtp-Source: AGHT+IH8Fw/SiYYMB3pMDxqZxhmpJLxioCFXohxA9aJIH8CCNIcwKocF7Uc9vAgCmTSIo71Hr8Z5Aw==
X-Received: by 2002:a05:6000:2910:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-42a9579c728mr61206f8f.21.1762444720333;
        Thu, 06 Nov 2025 07:58:40 -0800 (PST)
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
Subject: [PATCH 0/2] replace system_wq with system_percpu_wq, add WQ_PERCPU to alloc_workqueue
Date: Thu,  6 Nov 2025 16:58:29 +0100
Message-ID: <20251106155831.306248-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1] Replace uses of system_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    Because of that, system_wq has been replaced with system_percpu_wq.

2) [P 2] WQ_PERCPU added to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.


Thanks!


Marco Crivellari (2):
  xen/events: replace use of system_wq with system_percpu_wq
  xen: privcmd: WQ_PERCPU added to alloc_workqueue users

 drivers/xen/events/events_base.c | 6 +++---
 drivers/xen/privcmd.c            | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.51.1


