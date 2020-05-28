Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C4E1E6DA4
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:30:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ5n-0000T9-D5; Thu, 28 May 2020 21:29:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyZP=7K=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jeQ5m-0000Sw-1L
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:29:34 +0000
X-Inumbo-ID: 5227e598-a12a-11ea-a83e-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5227e598-a12a-11ea-a83e-12813bfff9fa;
 Thu, 28 May 2020 21:29:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r15so712207wmh.5
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 14:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=RguJeW3M7hHVpj8Rg/UhcbGBJXMeePiaJDG/SqFx9qw=;
 b=Cp4uWq9AV541hp6APMQuO6c/0ap0HLV3X0gKNGOxpP6Wkt7IuD3/MWH9geeJYFkmgE
 0sLDXTTtJQLbDC45YbuNDGCwR3GOga0Ah2pD2ej0DW5fEPkTMSU9ukTPMZxBPANkw5CE
 LSsMsavhRku5YFbKs7BilRKnE0TwMqJsfhDeOD7qesemR2t2038O4fq+cCa8mRrvgv93
 wpwBDTArI9umvriIJqKb6W4JAoYgnR6tpjjm3VGhqOZxB0jFJqspjSe5IAegUJkAuXBt
 f7lCV+uAn4E13tcGUMfO+Qd2DumU8mdi9R9xw49+ZUVfwvTAHINs8L8IDIlIfZSHQ7e/
 TYJQ==
X-Gm-Message-State: AOAM531/7kB9YLmCqKFTExCO98DoUMufPnluAgbDhKZhDoMq2WL+A3yP
 XEEdFI86rut5L8r3i5s+3EI=
X-Google-Smtp-Source: ABdhPJw0iKqTYcG09RFoWIAaYF3y8Wo0zb4gte2lvn5QnotHfh+oR6jtQRIiygSVayWiXsFmRbMpNQ==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr5162869wmb.22.1590701372297;
 Thu, 28 May 2020 14:29:32 -0700 (PDT)
Received: from [192.168.0.36] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id u13sm7390046wmm.6.2020.05.28.14.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:29:31 -0700 (PDT)
Subject: [PATCH v2 2/7] xen: credit2: factor runqueue initialization in its
 own function.
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 May 2020 23:29:30 +0200
Message-ID: <159070137084.12060.14661333224235870762.stgit@Palanthas>
In-Reply-To: <159070133878.12060.13318432301910522647.stgit@Palanthas>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As it will be useful in later changes. While there, fix
the doc-comment.

No functional change intended.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
Changes from v1:
* new patch
---
 xen/common/sched/credit2.c |   35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 697c9f917d..8a4f28b9f5 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3766,21 +3766,16 @@ csched2_alloc_pdata(const struct scheduler *ops, int cpu)
     return spc;
 }
 
-/* Returns the ID of the runqueue the cpu is assigned to. */
-static struct csched2_runqueue_data *
-init_pdata(struct csched2_private *prv, struct csched2_pcpu *spc,
-           unsigned int cpu)
+/*
+ * Do what's necessary to add cpu to the rqd (including activating the
+ * runqueue, if this is the first CPU we put in it).
+ */
+static void
+init_cpu_runqueue(struct csched2_private *prv, struct csched2_pcpu *spc,
+                  unsigned int cpu, struct csched2_runqueue_data *rqd)
 {
-    struct csched2_runqueue_data *rqd;
     unsigned int rcpu;
 
-    ASSERT(rw_is_write_locked(&prv->lock));
-    ASSERT(!cpumask_test_cpu(cpu, &prv->initialized));
-    /* CPU data needs to be allocated, but still uninitialized. */
-    ASSERT(spc);
-
-    rqd = spc->rqd;
-
     ASSERT(rqd && !cpumask_test_cpu(cpu, &spc->rqd->active));
 
     printk(XENLOG_INFO "Adding cpu %d to runqueue %d\n", cpu, rqd->id);
@@ -3816,6 +3811,22 @@ init_pdata(struct csched2_private *prv, struct csched2_pcpu *spc,
 
     if ( rqd->nr_cpus == 1 )
         rqd->pick_bias = cpu;
+}
+
+/* Returns a pointer to the runqueue the cpu is assigned to. */
+static struct csched2_runqueue_data *
+init_pdata(struct csched2_private *prv, struct csched2_pcpu *spc,
+           unsigned int cpu)
+{
+    struct csched2_runqueue_data *rqd;
+
+    ASSERT(rw_is_write_locked(&prv->lock));
+    ASSERT(!cpumask_test_cpu(cpu, &prv->initialized));
+    /* CPU data needs to be allocated, but still uninitialized. */
+    ASSERT(spc);
+
+    rqd = spc->rqd;
+    init_cpu_runqueue(prv, spc, cpu, rqd);
 
     return rqd;
 }


