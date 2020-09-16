Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6B26D241
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 06:20:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIlOz-0006ZS-Rm; Thu, 17 Sep 2020 04:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iutg=CZ=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kIc1k-0006gm-Uk
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:19:33 +0000
X-Inumbo-ID: b5dd174e-1cbf-4faa-969a-435766a2ec0f
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::616])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5dd174e-1cbf-4faa-969a-435766a2ec0f;
 Wed, 16 Sep 2020 18:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=cgQ9+AdNZ3vj59+XCIxE4U/rF4+pNZX8uwkdWcauo3rIrrhyqD+gxLOsey34gczwQ+HBi+R1wUJ8SsEdF2LLVyFDO6j/5ZCtLxudy6HZ8A8XHNZsAb9nBDHBs0Pv1CsKzLnDnZVuNy5JSZTJ1cRhbM7zz8U/xxqpJNzXbv7kvy+esamO7oEZ5PHbtTpYyx2P/0M9IXNwBYx/5krGmxRHJcww6aee4vEsirVi8DHaDc61EVn+TBAdwI+qg2jLqY8CrMiaFMsm49OPyGu1x7EcAGlc1wbdLW02WrbqCzoeXF3lirpo5/cQa1IH2BA3LeSckNBJ0qElWV2SAmDnDZ8ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGTFQEhy0TduTRgJLohDZ3A19+18Xa4WV9SOTYBYWA0=;
 b=DU+xecklVz3q870amQX2r9DcK1lVZ0XiMzAcVCZlWa5qV751qEd91rn6r1XTNwmM9Z200K6A00kNwoyr5FnwswnW0sXhKkiTFFO6yQAxObLY+/bZre5eqsQii4FXIXbVLU5dAyNHVO3B0tJWV1oP9S7j/WT59z0EVF0/5z4e2fllKOyTZtqXncsncKDl8wQojEj32G5C0sKUx/m3X5jHBZ32NIcNeEoh7WLcEjKDfwNgSbJDDAogFfjIX/ly0zBuu8W0LB8A2twcDga7bdLIBSM6zorP4LAkRC1ypaC7xi8bo7KZqaFDAXU2h4a61gDgS2o5qf5FLiPUBrYtLJF/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=dornerworks.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGTFQEhy0TduTRgJLohDZ3A19+18Xa4WV9SOTYBYWA0=;
 b=fHKDZYwENAXPuLuqxSAWE11ttddBTGb4aU27d/Iq+8HSPoJlVVPtMDed7OOYZKvhZmzGEGhjNwrTh/qztLIH7XFH2X1e6186YQO9JyRX7Jjbhz3qno7olGOJPvRzzO3Ru8ZSU81KHSFIAxE1m20WKkpH7Hi+HMhoGjmZJYjupF65w0FlO6EYfUpHG66IrcC3OabrCrWq3M0Bp/t9lryHvtwbYd1FZ3BV00e9thRsIAwfyZZSFDZod0Mv3fD0nB4UK2nhn4AmDNgPGMMpuAN81VSbiTpdzBJiWFreIel/4PKQrUWhmBGEz0xtSxl/FfplCXc4WXJ45p22z7hBdUhhbg==
Received: from CY1P110CA0061.NAMP110.PROD.OUTLOOK.COM (52.145.0.31) by
 SN1P110MB0064.NAMP110.PROD.OUTLOOK.COM (23.103.17.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.17; Wed, 16 Sep 2020 18:19:16 +0000
Received: from BN3USG02FT003.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:4::200) by CY1P110CA0061.office365.us (2001:489a:200:400::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 16 Sep 2020 18:19:16 +0000
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
 Server id 15.20.3348.19 via Frontend Transport; Wed, 16 Sep 2020 18:19:15
 +0000
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>
Subject: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore scheduling
Date: Wed, 16 Sep 2020 14:18:54 -0400
Message-Id: <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: abbded36-9eee-4af0-61b3-08d85a6d0544
X-MS-TrafficTypeDiagnostic: SN1P110MB0064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1P110MB0064D20E2A9F84DD5365D535E9210@SN1P110MB0064.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:localhost.localdomain; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(6069001)(4636009)(346002)(46966005)(6916009)(54906003)(8676002)(44832011)(26005)(186003)(508600001)(83380400001)(107886003)(81166007)(86362001)(5660300002)(4326008)(33310700002)(1076003)(336012)(6666004)(70206006)(70586007)(8936002)(30864003)(2906002)(82310400003)(47076004)(956004)(2616005)(36756003)(34070700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 18:19:15.4598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abbded36-9eee-4af0-61b3-08d85a6d0544
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=097cf9aa-db69-4b12-aeab-ab5f513dbff9; Ip=[207.242.234.14];
 Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: BN3USG02FT003.eop-usg02.itar.protection.office365.us
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1P110MB0064
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

This change is an overhaul of the ARINC653 scheduler to enable CAST-32A
multicore scheduling. CAST-32A specifies that only one partition
(domain) can run during a minor frame, but that domain is now allowed to
have more than one vCPU.

Changes include:
- Each pCPU now has its own private structure. This contains a schedule
  of UNITs to run with an independent lock, to allow the do_schedule
  routine to run in parallel on each pCPU.
- Each domain now has its own private structure. This allows the
  scheduler to track domains in the cpupool and to track what pCPUs are
  active while the domain is active.
- Added the concept of an epoch to the scheduler. This allows each pCPU
  to synchronize their context switches between major/minor frames. It
  also allows the scheduler to recover in the case that a frame change
  was missed, which usually happens when the target is paused with a
  debugger.
- Added support for UNIT migration, which allows for pinning.
- In a653sched_adjust_global, removed a large structure from the stack,
  moved a653sched_private dereference here.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
 xen/common/sched/arinc653.c | 844 +++++++++++++++++++++++++-----------
 1 file changed, 601 insertions(+), 243 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 0cd39d475f..1e96d81c99 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -36,15 +36,53 @@
 
 #include "private.h"
 
+/*
+ * Known design quirks:
+ * - If a pCPU is added to the cpupool, inactive UNITs (those that are not
+ *   assigned to a pCPU in the minor frame) will not be immediately activated
+ *   or migrated. Workaround is to use pinning to force a migration.
+ * - When pinning, it is recommended to specify a single pCPU. When using
+ *   multiple pCPUs IDs or "all", the scheduler will only look at pCPUs that are
+ *   not assigned to a UNIT during the minor frame. It will not try to find a
+ *   "best fit" and shuffle active UNITs around.
+ * - If a domain has more UNITs than available pCPUs, the excess UNITs will be
+ *   put into an inactive state and will not be scheduled. This is important to
+ *   note for domain 0, as Linux may hang if a vCPU is not scheduled.
+ */
+
+/*
+ * Locking:
+ * - Scheduler lock:
+ *  + is per-pCPU
+ *  + serialize accesses to UNIT schedule of the pCPU
+ *  + serializes assignment and deassignment of UNITs to a pCPU
+ * - Private lock (a.k.a. private scheduler lock):
+ *  + is scheduler-wide
+ *  + serializes accesses to the private scheduler, domain, and UNIT structures
+ *
+ * Ordering is: Scheduler lock, private lock. Or, OTOH, private lock nests
+ * inside the scheduler lock. More specifically:
+ *  + if we need both scheduler and private locks, we must acquire the scheduler
+ *    lock first
+ *  + if we already own the private lock, we must never acquire the scheduler
+ *    lock
+ */
+
+/*
+ * A handle with all zeros represents domain 0 if present, otherwise idle UNIT
+ */
+#define DOM0_HANDLE ((const xen_domain_handle_t){0})
+
 /*
  * Default timeslice for domain 0
  */
 #define DEFAULT_TIMESLICE MILLISECS(10)
 
 /*
- * Retrieve the idle UNIT for a given pCPU
+ * Return a pointer to the ARINC 653-specific scheduler data information
+ * associated with the given pCPU
  */
-#define IDLETASK(cpu)  (sched_idle_unit(cpu))
+#define APCPU(cpu) ((struct a653sched_pcpu *)get_sched_res(cpu)->sched_priv)
 
 /*
  * Return a pointer to the ARINC 653-specific scheduler data information
@@ -57,14 +95,56 @@
  */
 #define SCHED_PRIV(s) ((struct a653sched_private *)((s)->sched_data))
 
+/*
+ * UNIT frame entry for a pCPU
+ */
+struct unit_sched_entry
+{
+    struct sched_unit *unit;            /* UNIT to run */
+    s_time_t runtime;                   /* Duration of the frame */
+};
+
+/*
+ * Physical pCPU
+ */
+struct a653sched_pcpu
+{
+    unsigned int cpu;                   /* pCPU id */
+    struct list_head pcpu_list_elem;    /* On the scheduler private data */
+
+    spinlock_t lock;                    /* Scheduler lock */
+
+    /* Schedule of UNITs to run on this pCPU */
+    struct unit_sched_entry sched[ARINC653_MAX_DOMAINS_PER_SCHEDULE];
+
+    unsigned int sched_len;             /* Active entries in sched */
+    unsigned int sched_index;           /* Current frame */
+
+    s_time_t epoch;                     /* Sync to this point in time */
+    s_time_t major_frame;               /* Duration of a major frame */
+    s_time_t next_switch_time;          /* When to switch to the next frame */
+};
+
 /*
  * Schedule unit
  */
 struct a653sched_unit
 {
     struct sched_unit *unit;            /* Up-pointer to UNIT */
-    bool awake;                         /* UNIT awake flag */
-    struct list_head list;              /* On the scheduler private data */
+    struct a653sched_dom *adom;         /* Up-pointer to domain */
+    struct list_head unit_list_elem;    /* On the domain */
+    bool active;                        /* Is this UNIT active on a pCPU? */
+};
+
+/*
+ * Domain
+ */
+struct a653sched_dom
+{
+    struct domain *dom;                 /* Up-pointer to domain */
+    struct list_head dom_list_elem;     /* On the scheduler private data */
+    struct list_head unit_list;         /* UNITs belonging to this domain */
+    cpumask_t active_pcpus;             /* Active pCPUs for this domain */
 };
 
 /*
@@ -73,9 +153,7 @@ struct a653sched_unit
 struct sched_entry
 {
     xen_domain_handle_t dom_handle;     /* UUID of the domain */
-    int unit_id;                        /* UNIT number for reference */
     s_time_t runtime;                   /* Duration of the frame */
-    struct sched_unit *unit;            /* Pointer to UNIT */
 };
 
 /*
@@ -83,65 +161,124 @@ struct sched_entry
  */
 struct a653sched_private
 {
-    spinlock_t lock;                    /* Scheduler private lock */
+    spinlock_t lock;                    /* Private lock */
 
-    /*
-     * This array holds the active ARINC 653 schedule.
-     *
-     * When the system tries to start a new UNIT, this schedule is scanned
-     * to look for a matching (handle, UNIT #) pair. If both the handle (UUID)
-     * and UNIT number match, then the UNIT is allowed to run. Its run time
-     * (per major frame) is given in the third entry of the schedule.
-     */
-    struct sched_entry schedule[ARINC653_MAX_DOMAINS_PER_SCHEDULE];
+    /* Schedule of domains to run */
+    struct sched_entry sched[ARINC653_MAX_DOMAINS_PER_SCHEDULE];
 
-    /*
-     * This variable holds the number of entries that are valid in
-     * the arinc653_schedule table.
-     *
-     * This is not necessarily the same as the number of domains in the
-     * schedule. A domain could be listed multiple times within the schedule,
-     * or a domain with multiple UNITs could have a different
-     * schedule entry for each UNIT.
-     */
-    unsigned int num_schedule_entries;
+    unsigned int sched_len;             /* Active entries in sched */
 
+    s_time_t epoch;                     /* Sync to this point in time */
     s_time_t major_frame;               /* Duration of a major frame */
-    s_time_t next_major_frame;          /* When to switch to the next frame */
 
-    struct list_head unit_list;         /* UNITs belonging to this scheduler */
+    cpumask_t pcpus;                    /* pCPUs in this cpupool */
+
+    struct list_head pcpu_list;         /* pCPUs belonging to this scheduler */
+    struct list_head dom_list;          /* Doms belonging to this scheduler */
 };
 
 /* This function compares two domain handles */
-static int dom_handle_cmp(const xen_domain_handle_t h1,
-                          const xen_domain_handle_t h2)
+static inline bool dom_handle_cmp(const xen_domain_handle_t h1,
+                                  const xen_domain_handle_t h2)
+{
+    return memcmp(h1, h2, sizeof(xen_domain_handle_t)) == 0;
+}
+
+static struct a653sched_dom *find_dom(const struct a653sched_private *prv,
+                                      const xen_domain_handle_t handle)
+{
+    struct a653sched_dom *adom;
+
+    list_for_each_entry ( adom, &prv->dom_list, dom_list_elem )
+        if ( dom_handle_cmp(adom->dom->handle, handle) )
+            return adom;
+
+    return NULL;
+}
+
+static struct a653sched_unit *find_unit(const struct a653sched_dom *adom,
+                                        unsigned int cpu)
 {
-    return memcmp(h1, h2, sizeof(xen_domain_handle_t));
+    struct a653sched_unit *aunit;
+
+    list_for_each_entry ( aunit, &adom->unit_list, unit_list_elem )
+        if ( aunit->active && sched_unit_master(aunit->unit) == cpu )
+            return aunit;
+
+    return NULL;
 }
 
-static struct sched_unit *find_unit(const struct scheduler *ops,
-                                    xen_domain_handle_t handle,
-                                    int unit_id)
+static struct a653sched_unit *find_inactive_unit(const struct a653sched_dom *adom,
+                                                 unsigned int cpu)
 {
     struct a653sched_unit *aunit;
 
-    list_for_each_entry ( aunit, &SCHED_PRIV(ops)->unit_list, list )
-        if ( (dom_handle_cmp(aunit->unit->domain->handle, handle) == 0)
-             && (unit_id == aunit->unit->unit_id) )
-            return aunit->unit;
+    list_for_each_entry ( aunit, &adom->unit_list, unit_list_elem )
+        if ( !aunit->active &&
+             cpumask_test_cpu(cpu, cpupool_domain_master_cpumask(adom->dom)) &&
+             cpumask_test_cpu(cpu, aunit->unit->cpu_hard_affinity) )
+            return aunit;
 
     return NULL;
 }
 
-static void update_schedule_units(const struct scheduler *ops)
+static void sync_to_epoch(struct a653sched_pcpu *apc, s_time_t now)
+{
+    s_time_t next;
+    unsigned int index;
+
+    ASSERT(spin_is_locked(&apc->lock));
+
+    /* Determine the start of the current major frame */
+    next = now - ((now - apc->epoch) % apc->major_frame);
+
+    /* Determine which minor frame should be running */
+    for ( index = 0; index < apc->sched_len; index++ )
+    {
+        next += apc->sched[index].runtime;
+
+        if ( now < next )
+            break;
+    }
+
+    ASSERT(index < apc->sched_len);
+
+    apc->sched_index = index;
+    apc->next_switch_time = next;
+}
+
+static void build_pcpu_sched(const struct a653sched_private *prv,
+                             struct a653sched_pcpu *apc, s_time_t now)
 {
-    unsigned int i, n_entries = SCHED_PRIV(ops)->num_schedule_entries;
+    struct a653sched_dom *adom;
+    struct a653sched_unit *aunit;
+    unsigned int index;
+
+    ASSERT(spin_is_locked(&apc->lock));
+
+    for ( index = 0; index < prv->sched_len; index++ )
+    {
+        aunit = NULL;
+
+        adom = find_dom(prv, prv->sched[index].dom_handle);
+        if ( adom )
+        {
+            aunit = find_unit(adom, apc->cpu);
+        }
+
+        if ( aunit )
+            apc->sched[index].unit = aunit->unit;
+        else
+            apc->sched[index].unit = sched_idle_unit(apc->cpu);
+
+        apc->sched[index].runtime = prv->sched[index].runtime;
+    }
 
-    for ( i = 0; i < n_entries; i++ )
-        SCHED_PRIV(ops)->schedule[i].unit =
-            find_unit(ops,
-                      SCHED_PRIV(ops)->schedule[i].dom_handle,
-                      SCHED_PRIV(ops)->schedule[i].unit_id);
+    apc->sched_len = prv->sched_len;
+    apc->epoch = prv->epoch;
+    apc->major_frame = prv->major_frame;
+
+    sync_to_epoch(apc, now);
 }
 
 static int a653sched_init(struct scheduler *ops)
@@ -152,265 +289,466 @@ static int a653sched_init(struct scheduler *ops)
     if ( prv == NULL )
         return -ENOMEM;
 
-    ops->sched_data = prv;
-
-    prv->next_major_frame = 0;
     spin_lock_init(&prv->lock);
-    INIT_LIST_HEAD(&prv->unit_list);
+    INIT_LIST_HEAD(&prv->pcpu_list);
+    INIT_LIST_HEAD(&prv->dom_list);
+
+    prv->epoch = NOW();
+
+    /* Initialize the schedule to run dom0 if present, otherwise idle UNIT */
+    prv->sched_len = 1;
+    memcpy(prv->sched[0].dom_handle, DOM0_HANDLE,
+           sizeof(prv->sched[0].dom_handle));
+    prv->sched[0].runtime = DEFAULT_TIMESLICE;
+    prv->major_frame = DEFAULT_TIMESLICE;
+
+    ops->sched_data = prv;
 
     return 0;
 }
 
 static void a653sched_deinit(struct scheduler *ops)
 {
-    xfree(SCHED_PRIV(ops));
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+
+    ASSERT(prv);
+    ASSERT(list_empty(&prv->pcpu_list));
+    ASSERT(list_empty(&prv->dom_list));
+
+    xfree(prv);
     ops->sched_data = NULL;
 }
 
+static void *a653sched_alloc_pdata(const struct scheduler *ops, int cpu)
+{
+    struct a653sched_pcpu *apc;
+
+    apc = xzalloc(struct a653sched_pcpu);
+    if ( apc == NULL )
+        return ERR_PTR(-ENOMEM);
+
+    spin_lock_init(&apc->lock);
+    INIT_LIST_HEAD(&apc->pcpu_list_elem);
+    apc->cpu = cpu;
+
+    return apc;
+}
+
+static void init_pdata(struct a653sched_private *prv,
+                       struct a653sched_pcpu *apc)
+{
+    ASSERT(!cpumask_test_cpu(apc->cpu, &prv->pcpus));
+
+    cpumask_set_cpu(apc->cpu, &prv->pcpus);
+    list_add(&apc->pcpu_list_elem, &prv->pcpu_list);
+
+    build_pcpu_sched(prv, apc, NOW());
+}
+
 static spinlock_t *a653sched_switch_sched(struct scheduler *new_ops,
                                           unsigned int cpu, void *pdata,
                                           void *vdata)
 {
-    struct sched_resource *sr = get_sched_res(cpu);
-    const struct a653sched_unit *svc = vdata;
+    struct a653sched_private *prv = SCHED_PRIV(new_ops);
+    struct a653sched_pcpu *apc = pdata;
+    struct a653sched_unit *aunit = vdata;
+    unsigned long flags;
 
-    ASSERT(!pdata && svc && is_idle_unit(svc->unit));
+    ASSERT(apc && aunit && is_idle_unit(aunit->unit));
 
     sched_idle_unit(cpu)->priv = vdata;
 
-    return &sr->_lock;
+    spin_lock_irqsave(&apc->lock, flags);
+    spin_lock(&prv->lock);
+    init_pdata(prv, apc);
+    spin_unlock(&prv->lock);
+    spin_unlock_irqrestore(&apc->lock, flags);
+
+    /* Return the scheduler lock */
+    return &apc->lock;
+}
+
+static void a653sched_deinit_pdata(const struct scheduler *ops, void *pcpu,
+                                   int cpu)
+{
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+    struct a653sched_pcpu *apc = pcpu;
+    unsigned long flags;
+
+    ASSERT(apc);
+    ASSERT(cpumask_test_cpu(cpu, &prv->pcpus));
+
+    spin_lock_irqsave(&prv->lock, flags);
+    cpumask_clear_cpu(cpu, &prv->pcpus);
+    list_del(&apc->pcpu_list_elem);
+    spin_unlock_irqrestore(&prv->lock, flags);
+}
+
+static void a653sched_free_pdata(const struct scheduler *ops, void *pcpu,
+                                 int cpu)
+{
+    struct a653sched_pcpu *apc = pcpu;
+
+    xfree(apc);
+}
+
+static void *a653sched_alloc_domdata(const struct scheduler *ops,
+                                     struct domain *dom)
+{
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+    struct a653sched_dom *adom;
+    unsigned long flags;
+
+    adom = xzalloc(struct a653sched_dom);
+    if ( adom == NULL )
+        return ERR_PTR(-ENOMEM);
+
+    INIT_LIST_HEAD(&adom->dom_list_elem);
+    INIT_LIST_HEAD(&adom->unit_list);
+    adom->dom = dom;
+
+    spin_lock_irqsave(&prv->lock, flags);
+    list_add(&adom->dom_list_elem, &prv->dom_list);
+    spin_unlock_irqrestore(&prv->lock, flags);
+
+    return adom;
+}
+
+static void a653sched_free_domdata(const struct scheduler *ops, void *data)
+{
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+    struct a653sched_dom *adom = data;
+    unsigned long flags;
+
+    ASSERT(adom);
+    ASSERT(list_empty(&adom->unit_list));
+
+    spin_lock_irqsave(&prv->lock, flags);
+    list_del(&adom->dom_list_elem);
+    spin_unlock_irqrestore(&prv->lock, flags);
+
+    xfree(adom);
+}
+
+static struct sched_resource *pick_res(struct a653sched_unit *aunit)
+{
+    struct a653sched_dom *adom = aunit->adom;
+    unsigned int cpu = sched_unit_master(aunit->unit);
+    cpumask_t *cpus = cpumask_scratch_cpu(cpu);
+    unsigned int valid;
+    unsigned int available;
+
+    cpumask_and(cpus, cpupool_domain_master_cpumask(adom->dom),
+                aunit->unit->cpu_hard_affinity);
+
+    /* Stick with the current pCPU if it is still valid */
+    if ( cpumask_test_cpu(cpu, cpus) )
+        return get_sched_res(cpu);
+
+    valid = cpumask_first(cpus);
+
+    /* Find an available pCPU */
+    cpumask_andnot(cpus, cpus, &adom->active_pcpus);
+    available = cpumask_first(cpus);
+    if ( available < nr_cpu_ids )
+        return get_sched_res(available);
+
+    /* All pCPUs are in use - return the first valid ID */
+    return get_sched_res(valid);
+}
+
+static void unit_assign(struct a653sched_private *prv,
+                        struct a653sched_unit *aunit,
+                        unsigned int cpu)
+{
+    struct a653sched_dom *adom = aunit->adom;
+
+    ASSERT(!aunit->active);
+    ASSERT(!cpumask_test_cpu(cpu, &adom->active_pcpus));
+
+    cpumask_set_cpu(cpu, &adom->active_pcpus);
+    aunit->active = true;
+
+    sched_set_res(aunit->unit, get_sched_res(cpu));
+}
+
+static void unit_deassign(struct a653sched_private *prv,
+                          struct a653sched_unit *aunit)
+{
+    unsigned int cpu = sched_unit_master(aunit->unit);
+    struct a653sched_dom *adom = aunit->adom;
+    struct a653sched_unit *next_aunit;
+
+    ASSERT(aunit->active);
+    ASSERT(cpumask_test_cpu(cpu, &adom->active_pcpus));
+
+    cpumask_clear_cpu(cpu, &adom->active_pcpus);
+    aunit->active = false;
+
+    /* Find an inactive UNIT to run next */
+    next_aunit = find_inactive_unit(adom, cpu);
+    if ( next_aunit )
+        unit_assign(prv, next_aunit, cpu);
 }
 
 static void *a653sched_alloc_udata(const struct scheduler *ops,
                                    struct sched_unit *unit,
                                    void *dd)
 {
-    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
-    struct a653sched_unit *svc;
-    unsigned int entry;
-    unsigned long flags;
+    struct a653sched_unit *aunit;
 
-    /*
-     * Allocate memory for the ARINC 653-specific scheduler data information
-     * associated with the given UNIT (unit).
-     */
-    svc = xmalloc(struct a653sched_unit);
-    if ( svc == NULL )
+    aunit = xzalloc(struct a653sched_unit);
+    if ( aunit == NULL )
         return NULL;
 
-    spin_lock_irqsave(&sched_priv->lock, flags);
+    INIT_LIST_HEAD(&aunit->unit_list_elem);
+    aunit->unit = unit;
+    aunit->adom = dd;
+    aunit->active = false;
 
-    /*
-     * Add every one of dom0's units to the schedule, as long as there are
-     * slots available.
-     */
-    if ( unit->domain->domain_id == 0 )
-    {
-        entry = sched_priv->num_schedule_entries;
+    return aunit;
+}
 
-        if ( entry < ARINC653_MAX_DOMAINS_PER_SCHEDULE )
-        {
-            sched_priv->schedule[entry].dom_handle[0] = '\0';
-            sched_priv->schedule[entry].unit_id = unit->unit_id;
-            sched_priv->schedule[entry].runtime = DEFAULT_TIMESLICE;
-            sched_priv->schedule[entry].unit = unit;
+static void a653sched_insert_unit(const struct scheduler *ops,
+                                  struct sched_unit *unit)
+{
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+    struct a653sched_unit *aunit = AUNIT(unit);
+    struct a653sched_dom *adom = aunit->adom;
+    struct a653sched_pcpu *apc;
+    spinlock_t *lock;
+    unsigned int cpu;
+    unsigned long flags;
+    bool assigned = false;
 
-            sched_priv->major_frame += DEFAULT_TIMESLICE;
-            ++sched_priv->num_schedule_entries;
-        }
-    }
+    /* Add the UNIT to the ARINC653 cpupool */
+    spin_lock_irqsave(&prv->lock, flags);
 
-    /*
-     * Initialize our ARINC 653 scheduler-specific information for the UNIT.
-     * The UNIT starts "asleep." When Xen is ready for the UNIT to run, it
-     * will call the vcpu_wake scheduler callback function and our scheduler
-     * will mark the UNIT awake.
-     */
-    svc->unit = unit;
-    svc->awake = false;
-    if ( !is_idle_unit(unit) )
-        list_add(&svc->list, &SCHED_PRIV(ops)->unit_list);
-    update_schedule_units(ops);
+    list_add(&aunit->unit_list_elem, &adom->unit_list);
+
+    sched_set_res(unit, pick_res(aunit));
+    cpu = sched_unit_master(unit);
+    apc = APCPU(cpu);
+
+    if ( cpumask_test_cpu(cpu, cpupool_domain_master_cpumask(adom->dom)) &&
+         cpumask_test_cpu(cpu, unit->cpu_hard_affinity) &&
+         !cpumask_test_cpu(cpu, &adom->active_pcpus) )
+    {
+        unit_assign(prv, aunit, cpu);
+        assigned = true;
+    }
 
-    spin_unlock_irqrestore(&sched_priv->lock, flags);
+    spin_unlock_irqrestore(&prv->lock, flags);
 
-    return svc;
+    /* Rebuild the UNIT schedule for the pCPU, if needed */
+    if ( assigned )
+    {
+        lock = pcpu_schedule_lock_irqsave(cpu, &flags);
+        spin_lock(&prv->lock);
+        build_pcpu_sched(prv, apc, NOW());
+        cpu_raise_softirq(cpu, SCHEDULE_SOFTIRQ);
+        spin_unlock(&prv->lock);
+        pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
+    }
 }
 
-static void a653sched_free_udata(const struct scheduler *ops, void *priv)
+static void a653sched_remove_unit(const struct scheduler *ops,
+                                  struct sched_unit *unit)
 {
-    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
-    struct a653sched_unit *av = priv;
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+    struct a653sched_unit *aunit = AUNIT(unit);
+    spinlock_t *lock;
+    unsigned int cpu = sched_unit_master(unit);
     unsigned long flags;
+    bool removed = false;
+
+    ASSERT(!is_idle_unit(unit));
+
+    /* Remove the UNIT from the ARINC653 cpupool */
+    spin_lock_irqsave(&prv->lock, flags);
 
-    if (av == NULL)
-        return;
+    list_del(&aunit->unit_list_elem);
 
-    spin_lock_irqsave(&sched_priv->lock, flags);
+    if ( aunit->active )
+    {
+        unit_deassign(prv, aunit);
+        removed = true;
+    }
 
-    if ( !is_idle_unit(av->unit) )
-        list_del(&av->list);
+    spin_unlock_irqrestore(&prv->lock, flags);
 
-    xfree(av);
-    update_schedule_units(ops);
+    /* Rebuild the UNIT schedule for the pCPU, if needed */
+    if ( removed )
+    {
+        lock = pcpu_schedule_lock_irqsave(cpu, &flags);
+        spin_lock(&prv->lock);
+        build_pcpu_sched(prv, APCPU(cpu), NOW());
+        cpu_raise_softirq(cpu, SCHEDULE_SOFTIRQ);
+        spin_unlock(&prv->lock);
+        pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
+    }
+}
+
+static void a653sched_free_udata(const struct scheduler *ops, void *priv)
+{
+    struct a653sched_unit *aunit = priv;
 
-    spin_unlock_irqrestore(&sched_priv->lock, flags);
+    xfree(aunit);
 }
 
 static void a653sched_unit_sleep(const struct scheduler *ops,
                                  struct sched_unit *unit)
 {
-    if ( AUNIT(unit) != NULL )
-        AUNIT(unit)->awake = false;
+    const unsigned int cpu = sched_unit_master(unit);
+
+    ASSERT(!is_idle_unit(unit));
 
     /*
      * If the UNIT being put to sleep is the same one that is currently
      * running, raise a softirq to invoke the scheduler to switch domains.
      */
-    if ( get_sched_res(sched_unit_master(unit))->curr == unit )
-        cpu_raise_softirq(sched_unit_master(unit), SCHEDULE_SOFTIRQ);
+    if ( curr_on_cpu(cpu) == unit )
+        cpu_raise_softirq(cpu, SCHEDULE_SOFTIRQ);
 }
 
 static void a653sched_unit_wake(const struct scheduler *ops,
                                 struct sched_unit *unit)
 {
-    if ( AUNIT(unit) != NULL )
-        AUNIT(unit)->awake = true;
+    const unsigned int cpu = sched_unit_master(unit);
 
-    cpu_raise_softirq(sched_unit_master(unit), SCHEDULE_SOFTIRQ);
+    ASSERT(!is_idle_unit(unit));
+
+    cpu_raise_softirq(cpu, SCHEDULE_SOFTIRQ);
 }
 
 static struct sched_resource *a653sched_pick_resource(const struct scheduler *ops,
                                                       const struct sched_unit *unit)
 {
-    const cpumask_t *online;
-    unsigned int cpu;
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+    struct a653sched_unit *aunit = AUNIT(unit);
+    struct sched_resource *sr;
+    unsigned long flags;
 
-    /*
-     * If present, prefer unit's current processor, else
-     * just find the first valid unit.
-     */
-    online = cpupool_domain_master_cpumask(unit->domain);
+    ASSERT(!is_idle_unit(unit));
 
-    cpu = cpumask_first(online);
+    spin_lock_irqsave(&prv->lock, flags);
+    sr = pick_res(aunit);
+    spin_unlock_irqrestore(&prv->lock, flags);
 
-    if ( cpumask_test_cpu(sched_unit_master(unit), online)
-         || (cpu >= nr_cpu_ids) )
-        cpu = sched_unit_master(unit);
+    return sr;
+}
 
-    return get_sched_res(cpu);
+static void a653sched_migrate(const struct scheduler *ops,
+                              struct sched_unit *unit, unsigned int new_cpu)
+{
+    const unsigned int old_cpu = sched_unit_master(unit);
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+    struct a653sched_unit *aunit = AUNIT(unit);
+    struct a653sched_dom *adom = aunit->adom;
+    unsigned long flags;
+
+    ASSERT(!is_idle_unit(unit));
+
+    spin_lock_irqsave(&prv->lock, flags);
+
+    /* Migrate off the old pCPU */
+    if ( aunit->active && old_cpu != new_cpu )
+    {
+        /*
+         * If the UNIT is currently running, we need to mark it as migrating
+         * and wait for the scheduler to switch it out.
+         */
+        if ( curr_on_cpu(old_cpu) == unit )
+        {
+            sched_set_pause_flags(unit, _VPF_migrating);
+            cpu_raise_softirq(old_cpu, SCHEDULE_SOFTIRQ);
+        }
+
+        unit_deassign(prv, aunit);
+        build_pcpu_sched(prv, APCPU(old_cpu), NOW());
+        cpu_raise_softirq(old_cpu, SCHEDULE_SOFTIRQ);
+    }
+
+    /* Migrate on to the new pCPU */
+    if ( !aunit->active && !cpumask_test_cpu(new_cpu, &adom->active_pcpus) )
+    {
+        unit_assign(prv, aunit, new_cpu);
+        build_pcpu_sched(prv, APCPU(new_cpu), NOW());
+    }
+    else
+    {
+        sched_set_res(unit, get_sched_res(new_cpu));
+    }
+
+    spin_unlock_irqrestore(&prv->lock, flags);
 }
 
 static void a653sched_do_schedule(const struct scheduler *ops,
                                   struct sched_unit *prev, s_time_t now,
                                   bool tasklet_work_scheduled)
 {
-    struct sched_unit *new_task = NULL;
-    static unsigned int sched_index = 0;
-    static s_time_t next_switch_time;
-    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     const unsigned int cpu = sched_get_resource_cpu(smp_processor_id());
-    unsigned long flags;
+    struct a653sched_pcpu *apc = APCPU(cpu);
+    struct sched_unit *next_task;
 
-    spin_lock_irqsave(&sched_priv->lock, flags);
+    ASSERT(spin_is_locked(&apc->lock));
 
-    if ( sched_priv->num_schedule_entries < 1 )
-        sched_priv->next_major_frame = now + DEFAULT_TIMESLICE;
-    else if ( now >= sched_priv->next_major_frame )
-    {
-        /* time to enter a new major frame
-         * the first time this function is called, this will be true */
-        /* start with the first domain in the schedule */
-        sched_index = 0;
-        sched_priv->next_major_frame = now + sched_priv->major_frame;
-        next_switch_time = now + sched_priv->schedule[0].runtime;
-    }
-    else
+    /* Advance to the next frame if the current one has expired */
+    if ( now >= apc->next_switch_time )
     {
-        while ( (now >= next_switch_time)
-                && (sched_index < sched_priv->num_schedule_entries) )
-        {
-            /* time to switch to the next domain in this major frame */
-            sched_index++;
-            next_switch_time += sched_priv->schedule[sched_index].runtime;
-        }
+        apc->sched_index++;
+        if ( apc->sched_index >= apc->sched_len )
+            apc->sched_index = 0;
+
+        apc->next_switch_time += apc->sched[apc->sched_index].runtime;
     }
 
-    /*
-     * If we exhausted the domains in the schedule and still have time left
-     * in the major frame then switch next at the next major frame.
-     */
-    if ( sched_index >= sched_priv->num_schedule_entries )
-        next_switch_time = sched_priv->next_major_frame;
+    /* Frames were somehow missed - resynchronize to epoch */
+    if ( unlikely(now >= apc->next_switch_time) )
+        sync_to_epoch(apc, now);
 
-    /*
-     * If there are more domains to run in the current major frame, set
-     * new_task equal to the address of next domain's sched_unit structure.
-     * Otherwise, set new_task equal to the address of the idle task's
-     * sched_unit structure.
-     */
-    new_task = (sched_index < sched_priv->num_schedule_entries)
-        ? sched_priv->schedule[sched_index].unit
-        : IDLETASK(cpu);
-
-    /* Check to see if the new task can be run (awake & runnable). */
-    if ( !((new_task != NULL)
-           && (AUNIT(new_task) != NULL)
-           && AUNIT(new_task)->awake
-           && unit_runnable_state(new_task)) )
-        new_task = IDLETASK(cpu);
-    BUG_ON(new_task == NULL);
+    next_task = apc->sched[apc->sched_index].unit;
 
-    /*
-     * Check to make sure we did not miss a major frame.
-     * This is a good test for robust partitioning.
-     */
-    BUG_ON(now >= sched_priv->next_major_frame);
+    ASSERT(next_task);
 
-    spin_unlock_irqrestore(&sched_priv->lock, flags);
+    /* Check if the new task is runnable */
+    if ( !unit_runnable_state(next_task) )
+        next_task = sched_idle_unit(cpu);
 
     /* Tasklet work (which runs in idle UNIT context) overrides all else. */
     if ( tasklet_work_scheduled )
-        new_task = IDLETASK(cpu);
+        next_task = sched_idle_unit(cpu);
 
-    /* Running this task would result in a migration */
-    if ( !is_idle_unit(new_task)
-         && (sched_unit_master(new_task) != cpu) )
-        new_task = IDLETASK(cpu);
+    prev->next_time = apc->next_switch_time - now;
+    prev->next_task = next_task;
+    next_task->migrated = false;
 
-    /*
-     * Return the amount of time the next domain has to run and the address
-     * of the selected task's UNIT structure.
-     */
-    prev->next_time = next_switch_time - now;
-    prev->next_task = new_task;
-    new_task->migrated = false;
-
-    BUG_ON(prev->next_time <= 0);
+    ASSERT(prev->next_time > 0);
 }
 
-static int a653sched_set(const struct scheduler *ops,
+static int a653sched_set(struct a653sched_private *prv,
                          struct xen_sysctl_arinc653_schedule *schedule)
 {
-    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
+    struct a653sched_pcpu *apc;
     s_time_t total_runtime = 0;
+    s_time_t now;
+    spinlock_t *lock;
     unsigned int i;
     unsigned long flags;
-    int rc = -EINVAL;
 
-    spin_lock_irqsave(&sched_priv->lock, flags);
+    now = NOW();
 
     /* Check for valid major frame and number of schedule entries */
     if ( (schedule->major_frame <= 0)
          || (schedule->num_sched_entries < 1)
          || (schedule->num_sched_entries > ARINC653_MAX_DOMAINS_PER_SCHEDULE) )
-        goto fail;
+        return -EINVAL;
 
     for ( i = 0; i < schedule->num_sched_entries; i++ )
     {
         /* Check for a valid run time. */
         if ( schedule->sched_entries[i].runtime <= 0 )
-            goto fail;
+            return -EINVAL;
 
         /* Add this entry's run time to total run time. */
         total_runtime += schedule->sched_entries[i].runtime;
@@ -421,60 +759,64 @@ static int a653sched_set(const struct scheduler *ops,
      * indicated by comparing the total run time to the major frame length
      */
     if ( total_runtime > schedule->major_frame )
-        goto fail;
+        return -EINVAL;
+
+    spin_lock_irqsave(&prv->lock, flags);
 
     /* Copy the new schedule into place. */
-    sched_priv->num_schedule_entries = schedule->num_sched_entries;
-    sched_priv->major_frame = schedule->major_frame;
+    prv->sched_len = schedule->num_sched_entries;
+    prv->major_frame = schedule->major_frame;
+    prv->epoch = now;
     for ( i = 0; i < schedule->num_sched_entries; i++ )
     {
-        memcpy(sched_priv->schedule[i].dom_handle,
+        memcpy(prv->sched[i].dom_handle,
                schedule->sched_entries[i].dom_handle,
-               sizeof(sched_priv->schedule[i].dom_handle));
-        sched_priv->schedule[i].unit_id =
-            schedule->sched_entries[i].vcpu_id;
-        sched_priv->schedule[i].runtime =
+               sizeof(prv->sched[i].dom_handle));
+        prv->sched[i].runtime =
             schedule->sched_entries[i].runtime;
     }
-    update_schedule_units(ops);
+
+    spin_unlock_irqrestore(&prv->lock, flags);
 
     /*
-     * The newly-installed schedule takes effect immediately. We do not even
-     * wait for the current major frame to expire.
-     *
-     * Signal a new major frame to begin. The next major frame is set up by
-     * the do_schedule callback function when it is next invoked.
+     * The newly-installed schedule takes effect immediately - update the UNIT
+     * schedule for each pCPU
      */
-    sched_priv->next_major_frame = NOW();
+    list_for_each_entry ( apc, &prv->pcpu_list, pcpu_list_elem )
+    {
+        lock = pcpu_schedule_lock_irqsave(apc->cpu, &flags);
+        spin_lock(&prv->lock);
+        build_pcpu_sched(prv, apc, now);
+        spin_unlock(&prv->lock);
+        pcpu_schedule_unlock_irqrestore(lock, flags, apc->cpu);
+    }
 
-    rc = 0;
+    /* Trigger scheduler on all pCPUs */
+    cpumask_raise_softirq(&prv->pcpus, SCHEDULE_SOFTIRQ);
 
- fail:
-    spin_unlock_irqrestore(&sched_priv->lock, flags);
-    return rc;
+    return 0;
 }
 
-static int a653sched_get(const struct scheduler *ops,
+static int a653sched_get(struct a653sched_private *prv,
                          struct xen_sysctl_arinc653_schedule *schedule)
 {
-    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     unsigned int i;
     unsigned long flags;
 
-    spin_lock_irqsave(&sched_priv->lock, flags);
+    spin_lock_irqsave(&prv->lock, flags);
 
-    schedule->num_sched_entries = sched_priv->num_schedule_entries;
-    schedule->major_frame = sched_priv->major_frame;
-    for ( i = 0; i < sched_priv->num_schedule_entries; i++ )
+    schedule->num_sched_entries = prv->sched_len;
+    schedule->major_frame = prv->major_frame;
+    for ( i = 0; i < prv->sched_len; i++ )
     {
         memcpy(schedule->sched_entries[i].dom_handle,
-               sched_priv->schedule[i].dom_handle,
-               sizeof(sched_priv->schedule[i].dom_handle));
-        schedule->sched_entries[i].vcpu_id = sched_priv->schedule[i].unit_id;
-        schedule->sched_entries[i].runtime = sched_priv->schedule[i].runtime;
+               prv->sched[i].dom_handle,
+               sizeof(schedule->sched_entries[i].dom_handle));
+        schedule->sched_entries[i].vcpu_id = 0;
+        schedule->sched_entries[i].runtime = prv->sched[i].runtime;
     }
 
-    spin_unlock_irqrestore(&sched_priv->lock, flags);
+    spin_unlock_irqrestore(&prv->lock, flags);
 
     return 0;
 }
@@ -482,31 +824,47 @@ static int a653sched_get(const struct scheduler *ops,
 static int a653sched_adjust_global(const struct scheduler *ops,
                                    struct xen_sysctl_scheduler_op *sc)
 {
-    struct xen_sysctl_arinc653_schedule local_sched;
+    struct a653sched_private *prv = SCHED_PRIV(ops);
+    struct xen_sysctl_arinc653_schedule *sched = NULL;
     int rc = -EINVAL;
 
     switch ( sc->cmd )
     {
     case XEN_SYSCTL_SCHEDOP_putinfo:
-        if ( copy_from_guest(&local_sched, sc->u.sched_arinc653.schedule, 1) )
+        sched = xzalloc(struct xen_sysctl_arinc653_schedule);
+        if ( sched == NULL )
+        {
+            rc = -ENOMEM;
+            break;
+        }
+
+        if ( copy_from_guest(sched, sc->u.sched_arinc653.schedule, 1) )
         {
             rc = -EFAULT;
             break;
         }
 
-        rc = a653sched_set(ops, &local_sched);
+        rc = a653sched_set(prv, sched);
         break;
     case XEN_SYSCTL_SCHEDOP_getinfo:
-        memset(&local_sched, -1, sizeof(local_sched));
-        rc = a653sched_get(ops, &local_sched);
+        sched = xzalloc(struct xen_sysctl_arinc653_schedule);
+        if ( sched == NULL )
+        {
+            rc = -ENOMEM;
+            break;
+        }
+
+        rc = a653sched_get(prv, sched);
         if ( rc )
             break;
 
-        if ( copy_to_guest(sc->u.sched_arinc653.schedule, &local_sched, 1) )
+        if ( copy_to_guest(sc->u.sched_arinc653.schedule, sched, 1) )
             rc = -EFAULT;
         break;
     }
 
+    xfree(sched);
+
     return rc;
 }
 
@@ -520,17 +878,17 @@ static const struct scheduler sched_arinc653_def = {
     .init           = a653sched_init,
     .deinit         = a653sched_deinit,
 
-    .alloc_pdata    = NULL,
+    .alloc_pdata    = a653sched_alloc_pdata,
     .switch_sched   = a653sched_switch_sched,
-    .deinit_pdata   = NULL,
-    .free_pdata     = NULL,
+    .deinit_pdata   = a653sched_deinit_pdata,
+    .free_pdata     = a653sched_free_pdata,
 
-    .alloc_domdata  = NULL,
-    .free_domdata   = NULL,
+    .alloc_domdata  = a653sched_alloc_domdata,
+    .free_domdata   = a653sched_free_domdata,
 
     .alloc_udata    = a653sched_alloc_udata,
-    .insert_unit    = NULL,
-    .remove_unit    = NULL,
+    .insert_unit    = a653sched_insert_unit,
+    .remove_unit    = a653sched_remove_unit,
     .free_udata     = a653sched_free_udata,
 
     .sleep          = a653sched_unit_sleep,
@@ -539,7 +897,7 @@ static const struct scheduler sched_arinc653_def = {
     .context_saved  = NULL,
 
     .pick_resource  = a653sched_pick_resource,
-    .migrate        = NULL,
+    .migrate        = a653sched_migrate,
 
     .do_schedule    = a653sched_do_schedule,
 
-- 
2.17.1


