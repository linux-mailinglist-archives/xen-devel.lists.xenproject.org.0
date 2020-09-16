Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B026D23C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 06:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIlOz-0006ZG-BD; Thu, 17 Sep 2020 04:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iutg=CZ=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kIc1a-0006gm-UN
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:19:22 +0000
X-Inumbo-ID: fb281fe4-cfee-4c03-abe5-b8530406ac17
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [23.103.209.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb281fe4-cfee-4c03-abe5-b8530406ac17;
 Wed, 16 Sep 2020 18:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=mBujoAY17cjln6XydBAqx5usXgTCIgshWp7XjHxIl1nzrHDZ91VcZ4Lqf7kOmRnKtX/JRWAjipnxDYVqhd6j2xluAgVnvQUzYHWP0gfJe4RoJ7sTKj4IN60y7D+E2JKSBCFlXgNMi5DBqpIdryClhLnE3shwuoGiZ3jiMpLtqoMWEoSCepF0KYgaWx6KLced07sTuCWMco1Sv48hISZzIqkrCwimWmMBw0arV1O0t5X+u85cj6AsIF8ALqLWj2s3hicesdNHfN/PdeWHN8cgYooKhfsIHsthjKjM+d3UoLka5ydmZtJND6EQG6AdZC5hD1p3Nt04CPfH5OkZbpzWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVtCxqmwKSSopDpAd7qfS+p4qq378S6uXEiOlz3Twig=;
 b=xrHPGmtEU7eSHBKjf/oBmyc3iEtcl4XnXQxoPfF4fZM2vNHPReb6TR3mlyDMHcciqBg3Lm/gytQQr0H9SAN6Vjh1oLOb/Vh/dwR3pZ8RI0wqjyqjHn6jSZ5gRnXsls4z9LDv9Poa18qaX7DuIPz2vpgKct/lrF53rrfDUYaCiDu4OFDHmJFTtxpUpjW+LmsEkJxQrZlNOxOA2KuAMl3gynhLkm2vFjdiac/MzYC4LwM/0X1g7EfEkY9lnv2qq/HoJL69svzitkdrtGnEDrRF9k4uvI4DE+Z5qEbw61ndKHYrDOjtSiSIu0M6VSlYYiBqGi6Ocwcai8ZP/JijwDfk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=dornerworks.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVtCxqmwKSSopDpAd7qfS+p4qq378S6uXEiOlz3Twig=;
 b=mKoggHYDuDss6yVsjHjRxi3+uOLGZpyr/2vrehuVCXwoxCzKKjSbAjwqJ7cVOy8sxTNDleKaDZQ+KSa0PgSLV98qK7Nx0OqWZ0r4yL5Y1nUdUMIGA/m/zICBWlDsM7mKH/UhYWu1hcHouDqejZUkH6rUZ4SwvdAezr4Kt83sm8o10LNCFsjMF6F+Ub2WreEUNZ1e2/8q1aHQeB4qh3PRM/Xq8zKpT2lR+lNgr/P+wwjAG1pqxV66N7MW4YZGmnkq2a6xruZbcO+4Dag1TfoQZ+VSfZpkF8zC/Mz85YxvmaTSdfBVOdUnfx9xX/MD87k22y7zkTDJDk/6im+d4au+9g==
Received: from CY1P110CA0048.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::18)
 by DM3P110MB0378.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:411::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 18:19:14 +0000
Received: from BN3USG02FT003.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:4::206) by CY1P110CA0048.office365.us (2001:489a:200:400::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 16 Sep 2020 18:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 207.242.234.14)
 smtp.mailfrom=dornerworks.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=dornerworks.com;
Received-SPF: Pass (protection.outlook.com: domain of dornerworks.com
 designates 207.242.234.14 as permitted sender)
 receiver=protection.outlook.com; client-ip=207.242.234.14;
 helo=localhost.localdomain;
Received: from localhost.localdomain (207.242.234.14) by
 BN3USG02FT003.mail.protection.office365.us (10.97.24.77) with Microsoft SMTP
 Server id 15.20.3348.19 via Frontend Transport; Wed, 16 Sep 2020 18:19:13
 +0000
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>
Subject: [PATCH 4/5] sched/arinc653: Reorganize function definition order
Date: Wed, 16 Sep 2020 14:18:53 -0400
Message-Id: <20200916181854.75563-5-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3d4ede72-2386-441a-fa07-08d85a6d03f6
X-MS-TrafficTypeDiagnostic: DM3P110MB0378:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM3P110MB0378141C8E9B029911813551E9210@DM3P110MB0378.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:localhost.localdomain; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(6069001)(4636009)(346002)(46966005)(6916009)(2616005)(956004)(70586007)(82310400003)(70206006)(186003)(44832011)(107886003)(4326008)(86362001)(5660300002)(36756003)(336012)(26005)(6666004)(1076003)(33310700002)(8936002)(2906002)(8676002)(83380400001)(54906003)(81166007)(508600001)(47076004)(34070700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 18:19:13.2603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4ede72-2386-441a-fa07-08d85a6d03f6
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=097cf9aa-db69-4b12-aeab-ab5f513dbff9; Ip=[207.242.234.14];
 Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: BN3USG02FT003.eop-usg02.itar.protection.office365.us
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3P110MB0378
X-Mailman-Approved-At: Thu, 17 Sep 2020 04:20:06 +0000
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This change is in preperation for an overhaul of the arinc653 module. It
groups functions in a logical order and fills out the sched_arinc653_def
structure. There are no functional changes.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
 xen/common/sched/arinc653.c | 239 +++++++++++++++++++-----------------
 1 file changed, 123 insertions(+), 116 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 5f3a1be990..0cd39d475f 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -144,96 +144,6 @@ static void update_schedule_units(const struct scheduler *ops)
                       SCHED_PRIV(ops)->schedule[i].unit_id);
 }
 
-static int a653sched_set(const struct scheduler *ops,
-                         struct xen_sysctl_arinc653_schedule *schedule)
-{
-    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
-    s_time_t total_runtime = 0;
-    unsigned int i;
-    unsigned long flags;
-    int rc = -EINVAL;
-
-    spin_lock_irqsave(&sched_priv->lock, flags);
-
-    /* Check for valid major frame and number of schedule entries */
-    if ( (schedule->major_frame <= 0)
-         || (schedule->num_sched_entries < 1)
-         || (schedule->num_sched_entries > ARINC653_MAX_DOMAINS_PER_SCHEDULE) )
-        goto fail;
-
-    for ( i = 0; i < schedule->num_sched_entries; i++ )
-    {
-        /* Check for a valid run time. */
-        if ( schedule->sched_entries[i].runtime <= 0 )
-            goto fail;
-
-        /* Add this entry's run time to total run time. */
-        total_runtime += schedule->sched_entries[i].runtime;
-    }
-
-    /*
-     * Error if the major frame is not large enough to run all entries as
-     * indicated by comparing the total run time to the major frame length
-     */
-    if ( total_runtime > schedule->major_frame )
-        goto fail;
-
-    /* Copy the new schedule into place. */
-    sched_priv->num_schedule_entries = schedule->num_sched_entries;
-    sched_priv->major_frame = schedule->major_frame;
-    for ( i = 0; i < schedule->num_sched_entries; i++ )
-    {
-        memcpy(sched_priv->schedule[i].dom_handle,
-               schedule->sched_entries[i].dom_handle,
-               sizeof(sched_priv->schedule[i].dom_handle));
-        sched_priv->schedule[i].unit_id =
-            schedule->sched_entries[i].vcpu_id;
-        sched_priv->schedule[i].runtime =
-            schedule->sched_entries[i].runtime;
-    }
-    update_schedule_units(ops);
-
-    /*
-     * The newly-installed schedule takes effect immediately. We do not even
-     * wait for the current major frame to expire.
-     *
-     * Signal a new major frame to begin. The next major frame is set up by
-     * the do_schedule callback function when it is next invoked.
-     */
-    sched_priv->next_major_frame = NOW();
-
-    rc = 0;
-
- fail:
-    spin_unlock_irqrestore(&sched_priv->lock, flags);
-    return rc;
-}
-
-static int a653sched_get(const struct scheduler *ops,
-                         struct xen_sysctl_arinc653_schedule *schedule)
-{
-    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
-    unsigned int i;
-    unsigned long flags;
-
-    spin_lock_irqsave(&sched_priv->lock, flags);
-
-    schedule->num_sched_entries = sched_priv->num_schedule_entries;
-    schedule->major_frame = sched_priv->major_frame;
-    for ( i = 0; i < sched_priv->num_schedule_entries; i++ )
-    {
-        memcpy(schedule->sched_entries[i].dom_handle,
-               sched_priv->schedule[i].dom_handle,
-               sizeof(sched_priv->schedule[i].dom_handle));
-        schedule->sched_entries[i].vcpu_id = sched_priv->schedule[i].unit_id;
-        schedule->sched_entries[i].runtime = sched_priv->schedule[i].runtime;
-    }
-
-    spin_unlock_irqrestore(&sched_priv->lock, flags);
-
-    return 0;
-}
-
 static int a653sched_init(struct scheduler *ops)
 {
     struct a653sched_private *prv;
@@ -257,6 +167,20 @@ static void a653sched_deinit(struct scheduler *ops)
     ops->sched_data = NULL;
 }
 
+static spinlock_t *a653sched_switch_sched(struct scheduler *new_ops,
+                                          unsigned int cpu, void *pdata,
+                                          void *vdata)
+{
+    struct sched_resource *sr = get_sched_res(cpu);
+    const struct a653sched_unit *svc = vdata;
+
+    ASSERT(!pdata && svc && is_idle_unit(svc->unit));
+
+    sched_idle_unit(cpu)->priv = vdata;
+
+    return &sr->_lock;
+}
+
 static void *a653sched_alloc_udata(const struct scheduler *ops,
                                    struct sched_unit *unit,
                                    void *dd)
@@ -356,6 +280,27 @@ static void a653sched_unit_wake(const struct scheduler *ops,
     cpu_raise_softirq(sched_unit_master(unit), SCHEDULE_SOFTIRQ);
 }
 
+static struct sched_resource *a653sched_pick_resource(const struct scheduler *ops,
+                                                      const struct sched_unit *unit)
+{
+    const cpumask_t *online;
+    unsigned int cpu;
+
+    /*
+     * If present, prefer unit's current processor, else
+     * just find the first valid unit.
+     */
+    online = cpupool_domain_master_cpumask(unit->domain);
+
+    cpu = cpumask_first(online);
+
+    if ( cpumask_test_cpu(sched_unit_master(unit), online)
+         || (cpu >= nr_cpu_ids) )
+        cpu = sched_unit_master(unit);
+
+    return get_sched_res(cpu);
+}
+
 static void a653sched_do_schedule(const struct scheduler *ops,
                                   struct sched_unit *prev, s_time_t now,
                                   bool tasklet_work_scheduled)
@@ -444,40 +389,94 @@ static void a653sched_do_schedule(const struct scheduler *ops,
     BUG_ON(prev->next_time <= 0);
 }
 
-static struct sched_resource *
-a653sched_pick_resource(const struct scheduler *ops,
-                        const struct sched_unit *unit)
+static int a653sched_set(const struct scheduler *ops,
+                         struct xen_sysctl_arinc653_schedule *schedule)
 {
-    const cpumask_t *online;
-    unsigned int cpu;
+    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
+    s_time_t total_runtime = 0;
+    unsigned int i;
+    unsigned long flags;
+    int rc = -EINVAL;
+
+    spin_lock_irqsave(&sched_priv->lock, flags);
+
+    /* Check for valid major frame and number of schedule entries */
+    if ( (schedule->major_frame <= 0)
+         || (schedule->num_sched_entries < 1)
+         || (schedule->num_sched_entries > ARINC653_MAX_DOMAINS_PER_SCHEDULE) )
+        goto fail;
+
+    for ( i = 0; i < schedule->num_sched_entries; i++ )
+    {
+        /* Check for a valid run time. */
+        if ( schedule->sched_entries[i].runtime <= 0 )
+            goto fail;
+
+        /* Add this entry's run time to total run time. */
+        total_runtime += schedule->sched_entries[i].runtime;
+    }
 
     /*
-     * If present, prefer unit's current processor, else
-     * just find the first valid unit.
+     * Error if the major frame is not large enough to run all entries as
+     * indicated by comparing the total run time to the major frame length
      */
-    online = cpupool_domain_master_cpumask(unit->domain);
+    if ( total_runtime > schedule->major_frame )
+        goto fail;
 
-    cpu = cpumask_first(online);
+    /* Copy the new schedule into place. */
+    sched_priv->num_schedule_entries = schedule->num_sched_entries;
+    sched_priv->major_frame = schedule->major_frame;
+    for ( i = 0; i < schedule->num_sched_entries; i++ )
+    {
+        memcpy(sched_priv->schedule[i].dom_handle,
+               schedule->sched_entries[i].dom_handle,
+               sizeof(sched_priv->schedule[i].dom_handle));
+        sched_priv->schedule[i].unit_id =
+            schedule->sched_entries[i].vcpu_id;
+        sched_priv->schedule[i].runtime =
+            schedule->sched_entries[i].runtime;
+    }
+    update_schedule_units(ops);
 
-    if ( cpumask_test_cpu(sched_unit_master(unit), online)
-         || (cpu >= nr_cpu_ids) )
-        cpu = sched_unit_master(unit);
+    /*
+     * The newly-installed schedule takes effect immediately. We do not even
+     * wait for the current major frame to expire.
+     *
+     * Signal a new major frame to begin. The next major frame is set up by
+     * the do_schedule callback function when it is next invoked.
+     */
+    sched_priv->next_major_frame = NOW();
 
-    return get_sched_res(cpu);
+    rc = 0;
+
+ fail:
+    spin_unlock_irqrestore(&sched_priv->lock, flags);
+    return rc;
 }
 
-static spinlock_t *a653sched_switch_sched(struct scheduler *new_ops,
-                                          unsigned int cpu, void *pdata,
-                                          void *vdata)
+static int a653sched_get(const struct scheduler *ops,
+                         struct xen_sysctl_arinc653_schedule *schedule)
 {
-    struct sched_resource *sr = get_sched_res(cpu);
-    const struct a653sched_unit *svc = vdata;
+    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
+    unsigned int i;
+    unsigned long flags;
 
-    ASSERT(!pdata && svc && is_idle_unit(svc->unit));
+    spin_lock_irqsave(&sched_priv->lock, flags);
 
-    sched_idle_unit(cpu)->priv = vdata;
+    schedule->num_sched_entries = sched_priv->num_schedule_entries;
+    schedule->major_frame = sched_priv->major_frame;
+    for ( i = 0; i < sched_priv->num_schedule_entries; i++ )
+    {
+        memcpy(schedule->sched_entries[i].dom_handle,
+               sched_priv->schedule[i].dom_handle,
+               sizeof(sched_priv->schedule[i].dom_handle));
+        schedule->sched_entries[i].vcpu_id = sched_priv->schedule[i].unit_id;
+        schedule->sched_entries[i].runtime = sched_priv->schedule[i].runtime;
+    }
 
-    return &sr->_lock;
+    spin_unlock_irqrestore(&sched_priv->lock, flags);
+
+    return 0;
 }
 
 static int a653sched_adjust_global(const struct scheduler *ops,
@@ -517,27 +516,35 @@ static const struct scheduler sched_arinc653_def = {
     .sched_id       = XEN_SCHEDULER_ARINC653,
     .sched_data     = NULL,
 
+    .global_init    = NULL,
     .init           = a653sched_init,
     .deinit         = a653sched_deinit,
 
-    .free_udata     = a653sched_free_udata,
-    .alloc_udata    = a653sched_alloc_udata,
+    .alloc_pdata    = NULL,
+    .switch_sched   = a653sched_switch_sched,
+    .deinit_pdata   = NULL,
+    .free_pdata     = NULL,
 
+    .alloc_domdata  = NULL,
+    .free_domdata   = NULL,
+
+    .alloc_udata    = a653sched_alloc_udata,
     .insert_unit    = NULL,
     .remove_unit    = NULL,
+    .free_udata     = a653sched_free_udata,
 
     .sleep          = a653sched_unit_sleep,
     .wake           = a653sched_unit_wake,
     .yield          = NULL,
     .context_saved  = NULL,
 
-    .do_schedule    = a653sched_do_schedule,
-
     .pick_resource  = a653sched_pick_resource,
+    .migrate        = NULL,
 
-    .switch_sched   = a653sched_switch_sched,
+    .do_schedule    = a653sched_do_schedule,
 
     .adjust         = NULL,
+    .adjust_affinity= NULL,
     .adjust_global  = a653sched_adjust_global,
 
     .dump_settings  = NULL,
-- 
2.17.1


