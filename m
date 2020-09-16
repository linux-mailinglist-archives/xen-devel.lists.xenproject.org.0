Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D026D23E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 06:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIlOz-0006ZM-JJ; Thu, 17 Sep 2020 04:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iutg=CZ=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kIc1f-0006gm-UY
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:19:27 +0000
X-Inumbo-ID: e0a5968f-becd-45e8-8769-f7d6a7cf728d
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0a5968f-becd-45e8-8769-f7d6a7cf728d;
 Wed, 16 Sep 2020 18:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Gdu9FfYbtWqLKPRLLE5Cc2+VtaM4oKlFmEExV9fQXutntrRFZzc0ep9oXAEaDoBQjzd2LMKqoptzFBBu9mqFInRA1kOO5KVLYNt2tzCBDuktvQOQLWP8qo7iBwnjqkl0AzBWQBV0QtipezM6lonBMhiJU32O3nY2WVUgR/M6aaVs2lZezG3ULtS4Sjhd/f5q0AtQhLXbsTX571yaJg+/+uAFS4wkbkKdwA4TutXoZn22JUI/KOthStciuwxneL8loSO1TBSYDytPeMfBnlZQArvJ3bxnkO8B80A5WUHDDbxVTXx+EXPA2vrssjli9Xmezd8JgNkwfA9EvJmqCu3sJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DtZJOgJxsh5rGKDZSnSSn+oB6NH8FW8oz2GkVF7C3s=;
 b=Bebr5WLBsL2dpdVcf4HSK7ZRIELVZTc2zZ3BnYzo12EgnmqKDXaGFN9WNlqzCBJrwrrteVpsMukNjMmUDOZf19LYFuH/yVhsWKj1AF2xAbxtuAmurtUlcqmNWfiocxYnSTkeYU0SVmOLVCKUhFNEEmgdpuj5bMfx0XafHJ1YKBLvFKmxSC6T0ZZ4TiU3kQKovU5TORdxCKO9OUNqBX3/mpdkpdmhk1QuDwLtY4BmDpSx9dSqD10aQTzxTz0Ar/MMCRwppI/QyZtHDbrCFw6SETHtyLLSKt2tBjbvcG2YCOs5hSIWWEiU7e2P2GNz2/ntFDiZeEPvUJ34XOgV6DrcUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 207.242.234.14) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=dornerworks.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=dornerworks.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DtZJOgJxsh5rGKDZSnSSn+oB6NH8FW8oz2GkVF7C3s=;
 b=qQfSrCzCkK/rO0vpMUlxz/foP7DK3kT7VKF6oy5IHJsYLhFR3aAiAW714kbxIO597KXjT3tdOUBc4zQGjeOlyPxNJ/Io0SM+D2OKUmtRJhJUE2tvKbPy+QWPgUhWZcae1qUNwUoX7XYNm+ss8yLlLLALu0x/2f5vfPcx72be57jOfhXf+Xng9+jaKVSzZB3P/a8ENJMUOyd5fx+84zc00hkUFccBiW44aq6834fHOSRvnzQAKgJo27/ViP9pSI3uZlIYTi2/ayn1dv09nfy6Wmh7LWl0AN1FllAwugpx7Epjz61ed4GW0Uz1nhI3r6mj8+ftLtUSaCyHcvM899eZ3g==
Received: from CY1P110CA0046.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::16)
 by DM3P110MB0444.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:412::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 18:19:11 +0000
Received: from BN3USG02FT003.eop-usg02.itar.protection.office365.us
 (2001:489a:2202:4::200) by CY1P110CA0046.office365.us (2001:489a:200:400::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17 via Frontend
 Transport; Wed, 16 Sep 2020 18:19:11 +0000
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
 Server id 15.20.3348.19 via Frontend Transport; Wed, 16 Sep 2020 18:19:10
 +0000
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>
Subject: [PATCH 3/5] sched/arinc653: Clean up function definitions
Date: Wed, 16 Sep 2020 14:18:52 -0400
Message-Id: <20200916181854.75563-4-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3b2fd0df-63cc-4cd9-1da3-08d85a6d0299
X-MS-TrafficTypeDiagnostic: DM3P110MB0444:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM3P110MB04444C91923CED1D40AC3A25E9210@DM3P110MB0444.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:207.242.234.14; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:localhost.localdomain; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(6069001)(4636009)(346002)(46966005)(508600001)(33310700002)(82310400003)(2906002)(81166007)(8676002)(36756003)(6916009)(47076004)(5660300002)(186003)(26005)(8936002)(54906003)(1076003)(107886003)(6666004)(44832011)(70586007)(336012)(956004)(2616005)(4326008)(86362001)(83380400001)(70206006)(34070700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 18:19:10.9825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2fd0df-63cc-4cd9-1da3-08d85a6d0299
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

Function definitions in the arinc653 module did not follow the Xen
coding style. Furthermore, a few function names used a different prefix.
This change cleans up the definitions to be consistent with the Xen
coding style, and has no functional changes.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
 xen/common/sched/arinc653.c | 68 +++++++++++++++----------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index d8a23730c3..5f3a1be990 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -119,10 +119,9 @@ static int dom_handle_cmp(const xen_domain_handle_t h1,
     return memcmp(h1, h2, sizeof(xen_domain_handle_t));
 }
 
-static struct sched_unit *find_unit(
-    const struct scheduler *ops,
-    xen_domain_handle_t handle,
-    int unit_id)
+static struct sched_unit *find_unit(const struct scheduler *ops,
+                                    xen_domain_handle_t handle,
+                                    int unit_id)
 {
     struct a653sched_unit *aunit;
 
@@ -145,10 +144,8 @@ static void update_schedule_units(const struct scheduler *ops)
                       SCHED_PRIV(ops)->schedule[i].unit_id);
 }
 
-static int
-arinc653_sched_set(
-    const struct scheduler *ops,
-    struct xen_sysctl_arinc653_schedule *schedule)
+static int a653sched_set(const struct scheduler *ops,
+                         struct xen_sysctl_arinc653_schedule *schedule)
 {
     struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     s_time_t total_runtime = 0;
@@ -212,10 +209,8 @@ arinc653_sched_set(
     return rc;
 }
 
-static int
-arinc653_sched_get(
-    const struct scheduler *ops,
-    struct xen_sysctl_arinc653_schedule *schedule)
+static int a653sched_get(const struct scheduler *ops,
+                         struct xen_sysctl_arinc653_schedule *schedule)
 {
     struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     unsigned int i;
@@ -239,8 +234,7 @@ arinc653_sched_get(
     return 0;
 }
 
-static int
-a653sched_init(struct scheduler *ops)
+static int a653sched_init(struct scheduler *ops)
 {
     struct a653sched_private *prv;
 
@@ -257,16 +251,15 @@ a653sched_init(struct scheduler *ops)
     return 0;
 }
 
-static void
-a653sched_deinit(struct scheduler *ops)
+static void a653sched_deinit(struct scheduler *ops)
 {
     xfree(SCHED_PRIV(ops));
     ops->sched_data = NULL;
 }
 
-static void *
-a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
-                      void *dd)
+static void *a653sched_alloc_udata(const struct scheduler *ops,
+                                   struct sched_unit *unit,
+                                   void *dd)
 {
     struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     struct a653sched_unit *svc;
@@ -320,8 +313,7 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
     return svc;
 }
 
-static void
-a653sched_free_udata(const struct scheduler *ops, void *priv)
+static void a653sched_free_udata(const struct scheduler *ops, void *priv)
 {
     struct a653sched_private *sched_priv = SCHED_PRIV(ops);
     struct a653sched_unit *av = priv;
@@ -341,8 +333,8 @@ a653sched_free_udata(const struct scheduler *ops, void *priv)
     spin_unlock_irqrestore(&sched_priv->lock, flags);
 }
 
-static void
-a653sched_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
+static void a653sched_unit_sleep(const struct scheduler *ops,
+                                 struct sched_unit *unit)
 {
     if ( AUNIT(unit) != NULL )
         AUNIT(unit)->awake = false;
@@ -355,8 +347,8 @@ a653sched_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
         cpu_raise_softirq(sched_unit_master(unit), SCHEDULE_SOFTIRQ);
 }
 
-static void
-a653sched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
+static void a653sched_unit_wake(const struct scheduler *ops,
+                                struct sched_unit *unit)
 {
     if ( AUNIT(unit) != NULL )
         AUNIT(unit)->awake = true;
@@ -364,12 +356,9 @@ a653sched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
     cpu_raise_softirq(sched_unit_master(unit), SCHEDULE_SOFTIRQ);
 }
 
-static void
-a653sched_do_schedule(
-    const struct scheduler *ops,
-    struct sched_unit *prev,
-    s_time_t now,
-    bool tasklet_work_scheduled)
+static void a653sched_do_schedule(const struct scheduler *ops,
+                                  struct sched_unit *prev, s_time_t now,
+                                  bool tasklet_work_scheduled)
 {
     struct sched_unit *new_task = NULL;
     static unsigned int sched_index = 0;
@@ -477,9 +466,9 @@ a653sched_pick_resource(const struct scheduler *ops,
     return get_sched_res(cpu);
 }
 
-static spinlock_t *
-a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
-                  void *pdata, void *vdata)
+static spinlock_t *a653sched_switch_sched(struct scheduler *new_ops,
+                                          unsigned int cpu, void *pdata,
+                                          void *vdata)
 {
     struct sched_resource *sr = get_sched_res(cpu);
     const struct a653sched_unit *svc = vdata;
@@ -491,9 +480,8 @@ a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &sr->_lock;
 }
 
-static int
-a653sched_adjust_global(const struct scheduler *ops,
-                        struct xen_sysctl_scheduler_op *sc)
+static int a653sched_adjust_global(const struct scheduler *ops,
+                                   struct xen_sysctl_scheduler_op *sc)
 {
     struct xen_sysctl_arinc653_schedule local_sched;
     int rc = -EINVAL;
@@ -507,11 +495,11 @@ a653sched_adjust_global(const struct scheduler *ops,
             break;
         }
 
-        rc = arinc653_sched_set(ops, &local_sched);
+        rc = a653sched_set(ops, &local_sched);
         break;
     case XEN_SYSCTL_SCHEDOP_getinfo:
         memset(&local_sched, -1, sizeof(local_sched));
-        rc = arinc653_sched_get(ops, &local_sched);
+        rc = a653sched_get(ops, &local_sched);
         if ( rc )
             break;
 
@@ -547,7 +535,7 @@ static const struct scheduler sched_arinc653_def = {
 
     .pick_resource  = a653sched_pick_resource,
 
-    .switch_sched   = a653_switch_sched,
+    .switch_sched   = a653sched_switch_sched,
 
     .adjust         = NULL,
     .adjust_global  = a653sched_adjust_global,
-- 
2.17.1


