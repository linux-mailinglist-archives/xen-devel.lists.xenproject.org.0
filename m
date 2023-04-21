Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96D6EA1FB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 04:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524422.815339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppgrr-0002cX-Mw; Fri, 21 Apr 2023 02:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524422.815339; Fri, 21 Apr 2023 02:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppgrr-0002aj-JI; Fri, 21 Apr 2023 02:51:23 +0000
Received: by outflank-mailman (input) for mailman id 524422;
 Fri, 21 Apr 2023 02:51:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L0IV=AM=gmail.com=htejun@srs-se1.protection.inumbo.net>)
 id 1ppgrp-0002ad-KG
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 02:51:21 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 646b1c9d-dfef-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 04:51:20 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b60366047so1512959b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 19:51:20 -0700 (PDT)
Received: from localhost
 (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com.
 [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a056a00212b00b0063f167b41bdsm366523pfj.38.2023.04.20.19.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 19:51:18 -0700 (PDT)
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
X-Inumbo-ID: 646b1c9d-dfef-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682045479; x=1684637479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCPjQIn4S0PQfuCNwvELUc3S8eh+s9mUvwJw7/d5uLU=;
        b=XMLFtb9wYP9gqpPSKTS7T/p74xQvZs2nOgKFEigpBUk7eM6Kb8bvSh/sAWoXK1dcSj
         KWvLP7zD7yOkPXgcobpT2jsCaQldUniFt2NYg1yoc43TcDmS4stE8W3P1iJVksjOSFgn
         jFjMkwjkXmYgdw0wK5uHCXH21wcr+eFz6d3UdFMZxRfvvPHtseSbL2d8RWYeNIn0heuJ
         FLmKIh3j/9iUx4YIIjpr7XgLkSBxR4PUF5gMWpa5OT7mIXmR9L4DowA/AYb/EeXijmVO
         hy4tJiy1od2XsdGkrSh8kcquhPEtsLG9Z6cwResFqBkNejkqYJI+lXHC9L6wZvRHe583
         m/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682045479; x=1684637479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HCPjQIn4S0PQfuCNwvELUc3S8eh+s9mUvwJw7/d5uLU=;
        b=DWds2gRN4Ngjjm9FhV702yrneRGXuSwpSWOGUuZYIcrCX0Mxz5xQwQj/xa9J3b2sQ+
         TbFmyt34dSfq9dMEm/f8S/stH39DcbBLao2hTjSGJmQs4YycugUKQ9xvrnI9gFtmcph/
         /q5LbuawrRKPmxXN+ZY1Y92USHoiQEWf9k8NjtsZ1L96+E/Cc0pC7NFAXMOKqvGlQ/f+
         xgK0OR1I3UR2/5Pavz9wZyi5WL45mvwLz4xiOPrN/o/LIILQ8Coh7lue55f9vEcQgHXv
         HU9vjuge8kFKwjtB3oEi7o41a5ZzP8Qlj2Pw4bgR0KC35XpekPvAqY3pjyh3nm4ukLud
         Gtjw==
X-Gm-Message-State: AAQBX9e8Gct//Fxsjtutbe8/K5cay/q6fJYihpMAOx6nx/PjwX3v7I+0
	Cf/ikhWYvbKEn1BQ8YXs8oE=
X-Google-Smtp-Source: AKy350ZqQdhTADBSG8sDswV21AqHVDTdbtktu2O/S0Hkg5un6hH0viAxUI3uMxO9h5GAesNZA/ePlA==
X-Received: by 2002:a05:6a00:15ce:b0:63d:3411:f9e3 with SMTP id o14-20020a056a0015ce00b0063d3411f9e3mr5061818pfu.19.1682045478499;
        Thu, 20 Apr 2023 19:51:18 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
From: Tejun Heo <tj@kernel.org>
To: jiangshanlai@gmail.com
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Tejun Heo <tj@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 15/22] xen/pvcalls: Use alloc_ordered_workqueue() to create ordered workqueues
Date: Thu, 20 Apr 2023 16:50:39 -1000
Message-Id: <20230421025046.4008499-16-tj@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421025046.4008499-1-tj@kernel.org>
References: <20230421025046.4008499-1-tj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BACKGROUND
==========

When multiple work items are queued to a workqueue, their execution order
doesn't match the queueing order. They may get executed in any order and
simultaneously. When fully serialized execution - one by one in the queueing
order - is needed, an ordered workqueue should be used which can be created
with alloc_ordered_workqueue().

However, alloc_ordered_workqueue() was a later addition. Before it, an
ordered workqueue could be obtained by creating an UNBOUND workqueue with
@max_active==1. This originally was an implementation side-effect which was
broken by 4c16bd327c74 ("workqueue: restore WQ_UNBOUND/max_active==1 to be
ordered"). Because there were users that depended on the ordered execution,
5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active==1 to be ordered")
made workqueue allocation path to implicitly promote UNBOUND workqueues w/
@max_active==1 to ordered workqueues.

While this has worked okay, overloading the UNBOUND allocation interface
this way creates other issues. It's difficult to tell whether a given
workqueue actually needs to be ordered and users that legitimately want a
min concurrency level wq unexpectedly gets an ordered one instead. With
planned UNBOUND workqueue updates to improve execution locality and more
prevalence of chiplet designs which can benefit from such improvements, this
isn't a state we wanna be in forever.

This patch series audits all callsites that create an UNBOUND workqueue w/
@max_active==1 and converts them to alloc_ordered_workqueue() as necessary.

WHAT TO LOOK FOR
================

The conversions are from

  alloc_workqueue(WQ_UNBOUND | flags, 1, args..)

to

  alloc_ordered_workqueue(flags, args...)

which don't cause any functional changes. If you know that fully ordered
execution is not ncessary, please let me know. I'll drop the conversion and
instead add a comment noting the fact to reduce confusion while conversion
is in progress.

If you aren't fully sure, it's completely fine to let the conversion
through. The behavior will stay exactly the same and we can always
reconsider later.

As there are follow-up workqueue core changes, I'd really appreciate if the
patch can be routed through the workqueue tree w/ your acks. Thanks.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/pvcalls-back.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index 1f5219e12cc3..b41516f3f84a 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -361,7 +361,7 @@ static struct sock_mapping *pvcalls_new_active_socket(
 	map->data.in = map->bytes;
 	map->data.out = map->bytes + XEN_FLEX_RING_SIZE(map->ring_order);
 
-	map->ioworker.wq = alloc_workqueue("pvcalls_io", WQ_UNBOUND, 1);
+	map->ioworker.wq = alloc_ordered_workqueue("pvcalls_io", 0);
 	if (!map->ioworker.wq)
 		goto out;
 	atomic_set(&map->io, 1);
@@ -637,7 +637,7 @@ static int pvcalls_back_bind(struct xenbus_device *dev,
 
 	INIT_WORK(&map->register_work, __pvcalls_back_accept);
 	spin_lock_init(&map->copy_lock);
-	map->wq = alloc_workqueue("pvcalls_wq", WQ_UNBOUND, 1);
+	map->wq = alloc_ordered_workqueue("pvcalls_wq", 0);
 	if (!map->wq) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.40.0


