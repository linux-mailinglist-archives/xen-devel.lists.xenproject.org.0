Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B25A26D23D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 06:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIlOz-0006ZA-2k; Thu, 17 Sep 2020 04:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iutg=CZ=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kIc1W-0006gm-1P
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:19:18 +0000
X-Inumbo-ID: 13747901-b71e-4d54-8fa5-668888487f7a
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13747901-b71e-4d54-8fa5-668888487f7a;
 Wed, 16 Sep 2020 18:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=pY+8qkZR/rFCXgBl8m7mDiJ79M+1wOVk5igUcb4tcMUPK6SxFGR9xjawS3iQO8ESQiGHSfyzTX1DU8cm8B9ROynsOEgRQ8W5mftoxTQYCdpxDg4jJ3t11IUD6YYS4ed+OE+I1CdijDflCV2Iyx8ER7JH1PUujqef5mrVygBmmvDuDvOk801wwIG1jYq1+SklcooCBGjTg26PhKkXCIpaCdhQoOosNGBz3ByEuiuQC1PVlyQP8b+xi8o7x+KBft2d+WQDnjjeOG1ja2tbd+DQ3ACciH8yTMYARjb7oEhj3NcbEQeIeFn8zLUGCD3enXyzseS4y5hJ8zFeDuOhzAwYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhnhBKvGVPXAawiYRDDYdCNaSE+p+IOwBVAQpAYX7sw=;
 b=N/csXVrQ14g9B8O+xMI3bO7MtiybU2tIp5ZQ+knhgbwnUAGHquvqP1Je91jxLn5Mfl4lC2y+ZwRNgKhkxb2FuS23/DnAi/7aidOPMIky5BhO6Z3S+3hRMOWKSLR+/tSjDkKVOqcFt0iCC7R7oKQcx+dA5wMZKad6nkotu89scTCXihE2NG/YZ+32bqq1otyCoRqtrgCH/0iV8WijydX3hSY77TS9POp5fulERoc0uvZ18j8phxOtC8kBSHwb8qGKcIKUHMVI5qYIqhUEOwHPl2xNSk7ojqE8MRwQzxIZE2M7NMM5SnzZ4n4WLnwiKf1l0lL61YaTPD+9b2ORW+7kTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=dornerworks.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhnhBKvGVPXAawiYRDDYdCNaSE+p+IOwBVAQpAYX7sw=;
 b=ecAgsrrCB2jcKHhqgTZuoq4h1SP7XPa+JG1eiVS7tTuKMQMAvPHK6UJ+uFYyvGWdiaXKmzdKyHb7dHDyaMHqkeZ/uZDXDYiwP5cgcUa5C8HakByUN+2MoCshiLcMTTKplomRHaKUYmDbkNCqOjDED6jGmwrG8UMsWAemHOZ5S6VPCs9t5SJEeqipBWPwEUZfaBROeXFmVn73O+UUu32wOP06vaH9qkocWo8wrJdNMmj7P73uKTXjL8vzlYgKP/tUJOEEGpX2NPIhlUDCBnC0MrxtJFx2UGukIx0Zcjjh1HJWpPMoT3qRttEUYy6RG/aDu1JwywYWWvUAChrwSpp1MA==
Received: from CY1P110CA0046.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::16)
 by DM3P110MB0444.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:412::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 18:19:09 +0000
Received: from BN3USG02FT003.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:4::205) by CY1P110CA0046.office365.us (2001:489a:200:400::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17 via Frontend
 Transport; Wed, 16 Sep 2020 18:19:09 +0000
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
 Server id 15.20.3348.19 via Frontend Transport; Wed, 16 Sep 2020 18:19:08
 +0000
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>
Subject: [PATCH 2/5] sched/arinc653: Rename scheduler private structs
Date: Wed, 16 Sep 2020 14:18:51 -0400
Message-Id: <20200916181854.75563-3-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e037a271-8a8b-4535-2f99-08d85a6d013a
X-MS-TrafficTypeDiagnostic: DM3P110MB0444:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM3P110MB04441FFC9B94E635A625482AE9210@DM3P110MB0444.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:localhost.localdomain; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(6069001)(4636009)(346002)(46966005)(508600001)(33310700002)(82310400003)(2906002)(81166007)(8676002)(36756003)(6916009)(47076004)(5660300002)(186003)(26005)(8936002)(54906003)(1076003)(107886003)(6666004)(44832011)(70586007)(336012)(956004)(2616005)(4326008)(86362001)(83380400001)(70206006)(34070700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 18:19:08.6777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e037a271-8a8b-4535-2f99-08d85a6d013a
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=097cf9aa-db69-4b12-aeab-ab5f513dbff9; Ip=[207.242.234.14];
 Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: BN3USG02FT003.eop-usg02.itar.protection.office365.us
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3P110MB0444
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

The arinc653 module uses typedef struct with post fix tags for internal
structure definitions, which is not consistent with the Xen coding
style. This change cleans up the code to better match the style used
elsewhere in the Xen scheduler code, and has no functional changes.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
 xen/common/sched/arinc653.c | 42 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 7bb75ffe2b..d8a23730c3 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -50,38 +50,38 @@
  * Return a pointer to the ARINC 653-specific scheduler data information
  * associated with the given UNIT
  */
-#define AUNIT(unit) ((arinc653_unit_t *)(unit)->priv)
+#define AUNIT(unit) ((struct a653sched_unit *)(unit)->priv)
 
 /*
  * Return the global scheduler private data given the scheduler ops pointer
  */
-#define SCHED_PRIV(s) ((a653sched_priv_t *)((s)->sched_data))
+#define SCHED_PRIV(s) ((struct a653sched_private *)((s)->sched_data))
 
 /*
  * Schedule unit
  */
-typedef struct arinc653_unit_s
+struct a653sched_unit
 {
     struct sched_unit *unit;            /* Up-pointer to UNIT */
     bool awake;                         /* UNIT awake flag */
     struct list_head list;              /* On the scheduler private data */
-} arinc653_unit_t;
+};
 
 /*
  * Domain frame entry in the ARINC 653 schedule
  */
-typedef struct sched_entry_s
+struct sched_entry
 {
     xen_domain_handle_t dom_handle;     /* UUID of the domain */
     int unit_id;                        /* UNIT number for reference */
     s_time_t runtime;                   /* Duration of the frame */
     struct sched_unit *unit;            /* Pointer to UNIT */
-} sched_entry_t;
+};
 
 /*
  * Scheduler private data
  */
-typedef struct a653sched_priv_s
+struct a653sched_private
 {
     spinlock_t lock;                    /* Scheduler private lock */
 
@@ -93,7 +93,7 @@ typedef struct a653sched_priv_s
      * and UNIT number match, then the UNIT is allowed to run. Its run time
      * (per major frame) is given in the third entry of the schedule.
      */
-    sched_entry_t schedule[ARINC653_MAX_DOMAINS_PER_SCHEDULE];
+    struct sched_entry schedule[ARINC653_MAX_DOMAINS_PER_SCHEDULE];
 
     /*
      * This variable holds the number of entries that are valid in
@@ -110,7 +110,7 @@ typedef struct a653sched_priv_s
     s_time_t next_major_frame;          /* When to switch to the next frame */
 
     struct list_head unit_list;         /* UNITs belonging to this scheduler */
-} a653sched_priv_t;
+};
 
 /* This function compares two domain handles */
 static int dom_handle_cmp(const xen_domain_handle_t h1,
@@ -124,7 +124,7 @@ static struct sched_unit *find_unit(
     xen_domain_handle_t handle,
     int unit_id)
 {
-    arinc653_unit_t *aunit;
+    struct a653sched_unit *aunit;
 
     list_for_each_entry ( aunit, &SCHED_PRIV(ops)->unit_list, list )
         if ( (dom_handle_cmp(aunit->unit->domain->handle, handle) == 0)
@@ -150,7 +150,7 @@ arinc653_sched_set(
     const struct scheduler *ops,
     struct xen_sysctl_arinc653_schedule *schedule)
 {
-    a653sched_priv_t *sched_priv = SCHED_PRIV(ops);
+    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     s_time_t total_runtime = 0;
     unsigned int i;
     unsigned long flags;
@@ -217,7 +217,7 @@ arinc653_sched_get(
     const struct scheduler *ops,
     struct xen_sysctl_arinc653_schedule *schedule)
 {
-    a653sched_priv_t *sched_priv = SCHED_PRIV(ops);
+    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     unsigned int i;
     unsigned long flags;
 
@@ -242,9 +242,9 @@ arinc653_sched_get(
 static int
 a653sched_init(struct scheduler *ops)
 {
-    a653sched_priv_t *prv;
+    struct a653sched_private *prv;
 
-    prv = xzalloc(a653sched_priv_t);
+    prv = xzalloc(struct a653sched_private);
     if ( prv == NULL )
         return -ENOMEM;
 
@@ -268,8 +268,8 @@ static void *
 a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
                       void *dd)
 {
-    a653sched_priv_t *sched_priv = SCHED_PRIV(ops);
-    arinc653_unit_t *svc;
+    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
+    struct a653sched_unit *svc;
     unsigned int entry;
     unsigned long flags;
 
@@ -277,7 +277,7 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
      * Allocate memory for the ARINC 653-specific scheduler data information
      * associated with the given UNIT (unit).
      */
-    svc = xmalloc(arinc653_unit_t);
+    svc = xmalloc(struct a653sched_unit);
     if ( svc == NULL )
         return NULL;
 
@@ -323,8 +323,8 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
 static void
 a653sched_free_udata(const struct scheduler *ops, void *priv)
 {
-    a653sched_priv_t *sched_priv = SCHED_PRIV(ops);
-    arinc653_unit_t *av = priv;
+    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
+    struct a653sched_unit *av = priv;
     unsigned long flags;
 
     if (av == NULL)
@@ -374,7 +374,7 @@ a653sched_do_schedule(
     struct sched_unit *new_task = NULL;
     static unsigned int sched_index = 0;
     static s_time_t next_switch_time;
-    a653sched_priv_t *sched_priv = SCHED_PRIV(ops);
+    struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     const unsigned int cpu = sched_get_resource_cpu(smp_processor_id());
     unsigned long flags;
 
@@ -482,7 +482,7 @@ a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
                   void *pdata, void *vdata)
 {
     struct sched_resource *sr = get_sched_res(cpu);
-    const arinc653_unit_t *svc = vdata;
+    const struct a653sched_unit *svc = vdata;
 
     ASSERT(!pdata && svc && is_idle_unit(svc->unit));
 
-- 
2.17.1


