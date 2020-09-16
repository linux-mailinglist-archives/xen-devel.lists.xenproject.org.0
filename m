Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E161C26D23F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 06:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIlOy-0006Z4-Q5; Thu, 17 Sep 2020 04:20:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iutg=CZ=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kIc1S-0006gm-F3
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:19:14 +0000
X-Inumbo-ID: 9fda60d5-1aa8-4845-af51-b2c9b64b1146
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:d::609])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fda60d5-1aa8-4845-af51-b2c9b64b1146;
 Wed, 16 Sep 2020 18:19:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=eAya8iKVp/nZ4sZer/9596yzcscNS9xi0xQ1aDt+yz2lw+IF1ynyooHVrTWGDoiX4DHt82yx0SNe8uN1HEw71PaCwvLxGmzfk/XM+OfNp+DyOILUl2ncTCG3BU9G7Ek8D9X5uYZ4wMLL1mLl/0Hwcc5HDTQGLnB5Y/JX7ijNQ99lci+/QVxl5TxFzXx77H8+CZvIDOrysEnNYMMx2XB9eYa6ND3vGWdhPz5QR1fA9SbunEeDY5tEa0/t5HgGlwJO+QyITow+OyFERjt9Za3sjZallhCDXifKlAq5wnhg4XdBvF8Fl2OuJDPEt/3i+meoh1CrttUKkqNbPmxTtEvKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVsh0qunIQx+hFWlUcLB9UfcX2Oe5y9sehdkzea86JM=;
 b=lQ3OphZ3jxse9c/0vwX3MKZD1LCsTSmmUJ8A7HTZc/trU9FjSmjfjcbtzch8JPExR6yX2kCFP8dRmvDRkyjIMud4CtlffZWTdzAR+KCncYki6r0he8G+choJowDDlsgze+6E0PcvGp5Hb+qt72h4yaHuGhxXJriv/b6VOeGkLyGnB4Rie3ZAzVZGBypqUWRrRpdHFbJ/GTS81Qs/1Jh/CWhr7pDrBlChMDCn5KGd5HaIhr7Evxbj9YE4lzcA7MlkxVYtID2wxArc3nMQQb0c85vfYAtFK4nkbZGeGAAfUHX2csutQuxA8q49E3xb807nrpccM1xjUT07FeEW3yH0uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=dornerworks.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVsh0qunIQx+hFWlUcLB9UfcX2Oe5y9sehdkzea86JM=;
 b=XNc+mvOddoytBm3/3HkufEgOD2zRXBIrsvHYuq/SeaPosoPtK2Fztq+QHJLrlDwXe8vLgtXLER8T/1e0hej3nDxSllyVNcT0HAdQNHED2M4+LzSpkadVS8zZ9A2g4394lhuPl81fQdGC4mIhAHgeSjJEUqNX0r3TZGdhHuLrdfUIBGObNoycDHdmAtjebQwcSnrLtAmkqS4a6gAnqjU/9fAI4WJ8pPkX96te1vNRE+Q1lM9V6nrGdxkuhmjZiHp0LfXcDhMImIrCZQMCphjvs1yZRxFr52NYhrw3dIlO1IbhZi3/ssSah3bl7OcpYEDs88VBeovAY6P/I4CpiQyc4A==
Received: from CY1P110CA0048.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::18)
 by DM3P110MB0378.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:411::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 18:19:07 +0000
Received: from BN3USG02FT003.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:4::202) by CY1P110CA0048.office365.us (2001:489a:200:400::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 16 Sep 2020 18:19:07 +0000
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
 Server id 15.20.3348.19 via Frontend Transport; Wed, 16 Sep 2020 18:19:06
 +0000
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>
Subject: [PATCH 1/5] sched/arinc653: Clean up comments
Date: Wed, 16 Sep 2020 14:18:50 -0400
Message-Id: <20200916181854.75563-2-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 45f3581d-8cc1-4320-5200-08d85a6cffe7
X-MS-TrafficTypeDiagnostic: DM3P110MB0378:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM3P110MB0378E5B12F173707A2E09A83E9210@DM3P110MB0378.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:localhost.localdomain; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(6069001)(4636009)(346002)(46966005)(6916009)(2616005)(956004)(70586007)(82310400003)(70206006)(186003)(44832011)(107886003)(4326008)(86362001)(5660300002)(36756003)(336012)(26005)(6666004)(1076003)(33310700002)(8936002)(2906002)(8676002)(83380400001)(30864003)(54906003)(81166007)(508600001)(47076004)(34070700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 18:19:06.4479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f3581d-8cc1-4320-5200-08d85a6cffe7
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

The arinc653 module has function header comment blocks and other comment
inconsistencies not in line with the Xen coding style. This change
cleans up the code to better match the Xen coding style, and has no
functional changes.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
 xen/common/sched/arinc653.c | 229 +++++-------------------------------
 1 file changed, 29 insertions(+), 200 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 5421918221..7bb75ffe2b 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -36,79 +36,56 @@
 
 #include "private.h"
 
-/**************************************************************************
- * Private Macros                                                         *
- **************************************************************************/
-
-/**
- * Default timeslice for domain 0.
+/*
+ * Default timeslice for domain 0
  */
 #define DEFAULT_TIMESLICE MILLISECS(10)
 
-/**
- * Retrieve the idle UNIT for a given physical CPU
+/*
+ * Retrieve the idle UNIT for a given pCPU
  */
 #define IDLETASK(cpu)  (sched_idle_unit(cpu))
 
-/**
+/*
  * Return a pointer to the ARINC 653-specific scheduler data information
- * associated with the given UNIT (unit)
+ * associated with the given UNIT
  */
 #define AUNIT(unit) ((arinc653_unit_t *)(unit)->priv)
 
-/**
+/*
  * Return the global scheduler private data given the scheduler ops pointer
  */
 #define SCHED_PRIV(s) ((a653sched_priv_t *)((s)->sched_data))
 
-/**************************************************************************
- * Private Type Definitions                                               *
- **************************************************************************/
-
-/**
- * The arinc653_unit_t structure holds ARINC 653-scheduler-specific
- * information for all non-idle UNITs
+/*
+ * Schedule unit
  */
 typedef struct arinc653_unit_s
 {
-    /* unit points to Xen's struct sched_unit so we can get to it from an
-     * arinc653_unit_t pointer. */
-    struct sched_unit * unit;
-    /* awake holds whether the UNIT has been woken with vcpu_wake() */
-    bool                awake;
-    /* list holds the linked list information for the list this UNIT
-     * is stored in */
-    struct list_head    list;
+    struct sched_unit *unit;            /* Up-pointer to UNIT */
+    bool awake;                         /* UNIT awake flag */
+    struct list_head list;              /* On the scheduler private data */
 } arinc653_unit_t;
 
-/**
- * The sched_entry_t structure holds a single entry of the
- * ARINC 653 schedule.
+/*
+ * Domain frame entry in the ARINC 653 schedule
  */
 typedef struct sched_entry_s
 {
-    /* dom_handle holds the handle ("UUID") for the domain that this
-     * schedule entry refers to. */
-    xen_domain_handle_t dom_handle;
-    /* unit_id holds the UNIT number for the UNIT that this schedule
-     * entry refers to. */
-    int                 unit_id;
-    /* runtime holds the number of nanoseconds that the UNIT for this
-     * schedule entry should be allowed to run per major frame. */
-    s_time_t            runtime;
-    /* unit holds a pointer to the Xen sched_unit structure */
-    struct sched_unit * unit;
+    xen_domain_handle_t dom_handle;     /* UUID of the domain */
+    int unit_id;                        /* UNIT number for reference */
+    s_time_t runtime;                   /* Duration of the frame */
+    struct sched_unit *unit;            /* Pointer to UNIT */
 } sched_entry_t;
 
-/**
- * This structure defines data that is global to an instance of the scheduler
+/*
+ * Scheduler private data
  */
 typedef struct a653sched_priv_s
 {
-    /* lock for the whole pluggable scheduler, nests inside cpupool_lock */
-    spinlock_t lock;
+    spinlock_t lock;                    /* Scheduler private lock */
 
-    /**
+    /*
      * This array holds the active ARINC 653 schedule.
      *
      * When the system tries to start a new UNIT, this schedule is scanned
@@ -118,7 +95,7 @@ typedef struct a653sched_priv_s
      */
     sched_entry_t schedule[ARINC653_MAX_DOMAINS_PER_SCHEDULE];
 
-    /**
+    /*
      * This variable holds the number of entries that are valid in
      * the arinc653_schedule table.
      *
@@ -129,57 +106,19 @@ typedef struct a653sched_priv_s
      */
     unsigned int num_schedule_entries;
 
-    /**
-     * the major frame time for the ARINC 653 schedule.
-     */
-    s_time_t major_frame;
-
-    /**
-     * the time that the next major frame starts
-     */
-    s_time_t next_major_frame;
+    s_time_t major_frame;               /* Duration of a major frame */
+    s_time_t next_major_frame;          /* When to switch to the next frame */
 
-    /**
-     * pointers to all Xen UNIT structures for iterating through
-     */
-    struct list_head unit_list;
+    struct list_head unit_list;         /* UNITs belonging to this scheduler */
 } a653sched_priv_t;
 
-/**************************************************************************
- * Helper functions                                                       *
- **************************************************************************/
-
-/**
- * This function compares two domain handles.
- *
- * @param h1        Pointer to handle 1
- * @param h2        Pointer to handle 2
- *
- * @return          <ul>
- *                  <li> <0:  handle 1 is less than handle 2
- *                  <li>  0:  handle 1 is equal to handle 2
- *                  <li> >0:  handle 1 is greater than handle 2
- *                  </ul>
- */
+/* This function compares two domain handles */
 static int dom_handle_cmp(const xen_domain_handle_t h1,
                           const xen_domain_handle_t h2)
 {
     return memcmp(h1, h2, sizeof(xen_domain_handle_t));
 }
 
-/**
- * This function searches the unit list to find a UNIT that matches
- * the domain handle and UNIT ID specified.
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @param handle    Pointer to handler
- * @param unit_id   UNIT ID
- *
- * @return          <ul>
- *                  <li> Pointer to the matching UNIT if one is found
- *                  <li> NULL otherwise
- *                  </ul>
- */
 static struct sched_unit *find_unit(
     const struct scheduler *ops,
     xen_domain_handle_t handle,
@@ -187,7 +126,6 @@ static struct sched_unit *find_unit(
 {
     arinc653_unit_t *aunit;
 
-    /* loop through the unit_list looking for the specified UNIT */
     list_for_each_entry ( aunit, &SCHED_PRIV(ops)->unit_list, list )
         if ( (dom_handle_cmp(aunit->unit->domain->handle, handle) == 0)
              && (unit_id == aunit->unit->unit_id) )
@@ -196,13 +134,6 @@ static struct sched_unit *find_unit(
     return NULL;
 }
 
-/**
- * This function updates the pointer to the Xen UNIT structure for each entry
- * in the ARINC 653 schedule.
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @return          <None>
- */
 static void update_schedule_units(const struct scheduler *ops)
 {
     unsigned int i, n_entries = SCHED_PRIV(ops)->num_schedule_entries;
@@ -214,17 +145,6 @@ static void update_schedule_units(const struct scheduler *ops)
                       SCHED_PRIV(ops)->schedule[i].unit_id);
 }
 
-/**
- * This function is called by the adjust_global scheduler hook to put
- * in place a new ARINC653 schedule.
- *
- * @param ops       Pointer to this instance of the scheduler structure
- *
- * @return          <ul>
- *                  <li> 0 = success
- *                  <li> !0 = error
- *                  </ul>
- */
 static int
 arinc653_sched_set(
     const struct scheduler *ops,
@@ -238,7 +158,7 @@ arinc653_sched_set(
 
     spin_lock_irqsave(&sched_priv->lock, flags);
 
-    /* Check for valid major frame and number of schedule entries. */
+    /* Check for valid major frame and number of schedule entries */
     if ( (schedule->major_frame <= 0)
          || (schedule->num_sched_entries < 1)
          || (schedule->num_sched_entries > ARINC653_MAX_DOMAINS_PER_SCHEDULE) )
@@ -256,7 +176,7 @@ arinc653_sched_set(
 
     /*
      * Error if the major frame is not large enough to run all entries as
-     * indicated by comparing the total run time to the major frame length.
+     * indicated by comparing the total run time to the major frame length
      */
     if ( total_runtime > schedule->major_frame )
         goto fail;
@@ -292,16 +212,6 @@ arinc653_sched_set(
     return rc;
 }
 
-/**
- * This function is called by the adjust_global scheduler hook to read the
- * current ARINC 653 schedule
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @return          <ul>
- *                  <li> 0 = success
- *                  <li> !0 = error
- *                  </ul>
- */
 static int
 arinc653_sched_get(
     const struct scheduler *ops,
@@ -329,20 +239,6 @@ arinc653_sched_get(
     return 0;
 }
 
-/**************************************************************************
- * Scheduler callback functions                                           *
- **************************************************************************/
-
-/**
- * This function performs initialization for an instance of the scheduler.
- *
- * @param ops       Pointer to this instance of the scheduler structure
- *
- * @return          <ul>
- *                  <li> 0 = success
- *                  <li> !0 = error
- *                  </ul>
- */
 static int
 a653sched_init(struct scheduler *ops)
 {
@@ -361,11 +257,6 @@ a653sched_init(struct scheduler *ops)
     return 0;
 }
 
-/**
- * This function performs deinitialization for an instance of the scheduler
- *
- * @param ops       Pointer to this instance of the scheduler structure
- */
 static void
 a653sched_deinit(struct scheduler *ops)
 {
@@ -373,14 +264,6 @@ a653sched_deinit(struct scheduler *ops)
     ops->sched_data = NULL;
 }
 
-/**
- * This function allocates scheduler-specific data for a UNIT
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @param unit      Pointer to struct sched_unit
- *
- * @return          Pointer to the allocated data
- */
 static void *
 a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
                       void *dd)
@@ -437,11 +320,6 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
     return svc;
 }
 
-/**
- * This function frees scheduler-specific UNIT data
- *
- * @param ops       Pointer to this instance of the scheduler structure
- */
 static void
 a653sched_free_udata(const struct scheduler *ops, void *priv)
 {
@@ -463,12 +341,6 @@ a653sched_free_udata(const struct scheduler *ops, void *priv)
     spin_unlock_irqrestore(&sched_priv->lock, flags);
 }
 
-/**
- * Xen scheduler callback function to sleep a UNIT
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @param unit      Pointer to struct sched_unit
- */
 static void
 a653sched_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
 {
@@ -483,12 +355,6 @@ a653sched_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
         cpu_raise_softirq(sched_unit_master(unit), SCHEDULE_SOFTIRQ);
 }
 
-/**
- * Xen scheduler callback function to wake up a UNIT
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @param unit      Pointer to struct sched_unit
- */
 static void
 a653sched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
 {
@@ -498,13 +364,6 @@ a653sched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
     cpu_raise_softirq(sched_unit_master(unit), SCHEDULE_SOFTIRQ);
 }
 
-/**
- * Xen scheduler callback function to select a UNIT to run.
- * This is the main scheduler routine.
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @param now       Current time
- */
 static void
 a653sched_do_schedule(
     const struct scheduler *ops,
@@ -596,14 +455,6 @@ a653sched_do_schedule(
     BUG_ON(prev->next_time <= 0);
 }
 
-/**
- * Xen scheduler callback function to select a resource for the UNIT to run on
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @param unit      Pointer to struct sched_unit
- *
- * @return          Scheduler resource to run on
- */
 static struct sched_resource *
 a653sched_pick_resource(const struct scheduler *ops,
                         const struct sched_unit *unit)
@@ -626,14 +477,6 @@ a653sched_pick_resource(const struct scheduler *ops,
     return get_sched_res(cpu);
 }
 
-/**
- * Xen scheduler callback to change the scheduler of a cpu
- *
- * @param new_ops   Pointer to this instance of the scheduler structure
- * @param cpu       The cpu that is changing scheduler
- * @param pdata     scheduler specific PCPU data (we don't have any)
- * @param vdata     scheduler specific UNIT data of the idle unit
- */
 static spinlock_t *
 a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
                   void *pdata, void *vdata)
@@ -648,14 +491,6 @@ a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &sr->_lock;
 }
 
-/**
- * Xen scheduler callback function to perform a global (not domain-specific)
- * adjustment. It is used by the ARINC 653 scheduler to put in place a new
- * ARINC 653 schedule or to retrieve the schedule currently in place.
- *
- * @param ops       Pointer to this instance of the scheduler structure
- * @param sc        Pointer to the scheduler operation specified by Domain 0
- */
 static int
 a653sched_adjust_global(const struct scheduler *ops,
                         struct xen_sysctl_scheduler_op *sc)
@@ -688,12 +523,6 @@ a653sched_adjust_global(const struct scheduler *ops,
     return rc;
 }
 
-/**
- * This structure defines our scheduler for Xen.
- * The entries tell Xen where to find our scheduler-specific
- * callback functions.
- * The symbol must be visible to the rest of Xen at link time.
- */
 static const struct scheduler sched_arinc653_def = {
     .name           = "ARINC 653 Scheduler",
     .opt_name       = "arinc653",
-- 
2.17.1


