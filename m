Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FAAE2974
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 16:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021587.1397512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSzEU-000515-QH; Sat, 21 Jun 2025 14:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021587.1397512; Sat, 21 Jun 2025 14:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSzEU-0004zS-N2; Sat, 21 Jun 2025 14:30:14 +0000
Received: by outflank-mailman (input) for mailman id 1021587;
 Sat, 21 Jun 2025 14:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3VJ=ZE=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uSyzJ-0002tA-1Q
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 14:14:34 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 089199ea-4eaa-11f0-b894-0df219b8e170;
 Sat, 21 Jun 2025 16:14:26 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by OS9P286MB4122.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.14; Sat, 21 Jun
 2025 14:14:17 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 14:14:16 +0000
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
X-Inumbo-ID: 089199ea-4eaa-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COW1xDwgiRrATilH8LwSqebecGB3N6IJk8Z/9KTBDV3l1tI+l7nq2s7WEkD2ESzqyQf5DlzmOgf8HO+6+ARGQyla+bAZFdzRi9Md3bT/CSJPc3GuioX4eLOGrdC4bU5XKkFyJfK1iHfaKaCAWhRIvZUgSo/B4obkqx3rj4ADcO3R9jcyj3l2t7x/fxI4TxN5sEtC9KJhUjbIgMVPzclphoWyPRxsZ+qCF3ssm7TVXw2g0YWLXDQDDNa1DBySCwBbZcD49zgyz8plSnjOcc57weU+IHk4b8TlFgSm4lTEeN1mxZc5tqAlcj5xiOwJE8FKBGmxtECw0nYn3k3OHoJmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9+f5/bj/zZHwsLt9rViwjBEk07emcS5iCST2DIr8n0=;
 b=yDJinfrrSkY0YHPlY3cQznJW4uhTNJZ8h4q/MQ7zuQ3BnqaqP9YanpyjGqljDleCB7I0jYs68vQQyMJC8mkpdE1ZxQio5+9COUyY4P+R79wFF+Wx7PbpuMVzOKdiZlc8PxVVAUEs/TvBpmSOuiYyy0K5ADY3I5bk8Zo4iQtlx3yPiBwKWPFp3nAz1ko+gKhR9yjOUDj8M4rQnadUnbkWxTLNDhHtKdcsjSMEcYUY2Y0ybdUNprRKY9Y+W+tBbUSeYBdwhLFaY6Yw2lpiJkFxR+4htd3Xgs+6cQsD+c0YvikS40Xs545WUeHb3l16eMEEQPWXpIjy2qWOaNk25RsPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9+f5/bj/zZHwsLt9rViwjBEk07emcS5iCST2DIr8n0=;
 b=aS7D7BK4q6vYNvrYOqhWGH/7odobQFG8KjL0n43eVnJM/cAfxWELLnAENpG+SlLvdHhXwobKly6VGuk137W/En1dOSrsdaU7iZsTAovC3fvhEq1mMZLv8QRkYv8krP+uuwzk3wR7N9LM3IIy6LLA9VDmOXDeTcWTKFyOAOfE4/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: dfaggioli@suse.com,
	jgross@suse.com,
	gwd@xenproject.org
Subject: [PATCH] xen/credit2: factor in previous active unit's credit in csched2_runtime()
Date: Sat, 21 Jun 2025 23:14:11 +0900
Message-ID: <20250621141411.890250-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::10) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|OS9P286MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: e83cec10-a134-4e24-43ef-08ddb0cde81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q/ZsOZq0PKQ1PIMMhivzoJRKS/Al5D1fuv7S+sz+BxbFdYFCkrz4Y6RVA6XS?=
 =?us-ascii?Q?PZcL5zV1INogytnWi+zakUng0nP81yp8zeZLu69VWaPRKPus/DZHTcS6Ga5h?=
 =?us-ascii?Q?xQn/kgCV/ZJNV2Mk6MQLOevdJzryzk6Vkm1UjxAifmUgOItXgmbNJveqqO9s?=
 =?us-ascii?Q?JUr78yzeE6oxljpcrTgZbv2oo35EICapsabVaT9K3EGPgn5nKJaR2U7Ffw4K?=
 =?us-ascii?Q?6hvD2wC+LMN5GyqI56WPtqqkC7HV+iPZ7cdqCpivnB/qQ+nish+jx0NbCVRC?=
 =?us-ascii?Q?tYXQtMZ8yl9V42/uHXOjLjE8Ov4dU6o+WJKyJL37nQNrOD+r0wicOgXYTMwW?=
 =?us-ascii?Q?QPDqX7iLBtsHUztbOoa9HvM47N/rcaLCWshgsAda/pAtYCpeme9mkQXPS8sn?=
 =?us-ascii?Q?tBHNcK8xxVmWRaJlwpd+Qp8Uf6gm1ZxUZW/DsTvtNBsev3cxxp2iENKjlkKj?=
 =?us-ascii?Q?osZVDzZ33BY5yjMIPLdthUs5+rbrT97naC4igIC4LZVtsZg2/zQKEb+pfeBI?=
 =?us-ascii?Q?YkF1KH8a0jX0Lr6jtbIEnvVDqOCYcQuOcjdvNJaYYyC/zl495faKwprr0OZb?=
 =?us-ascii?Q?7OK7/iMXoXxh48hZrXNgN8I0j+KmIlfQ8o5D6cdPLq84Sg1ouyOUNStAtrIB?=
 =?us-ascii?Q?CIeuezEMBmpJia6Kmv0WkkJBE7UBqieLgxf8a5Uq0R2k23U/IPGzATXAQwc6?=
 =?us-ascii?Q?ONtF4kwsbXOQqifmvU+Ail1oB6lgsKC3PrXhOfggLTWdbpj+FE7y/9xhsVOu?=
 =?us-ascii?Q?EE0YO1pOFJpFC22LY0Om/T3w8q86z3VqdGS3kkE9S1Lpnzl8N3kfVYKCCsgR?=
 =?us-ascii?Q?7Z3SsArgDY6hlkoJH8+373pjxdtMIAoSXqGZmTUjkmiSTHwUMQCRv7diZgsb?=
 =?us-ascii?Q?/G3klkJLCIDilC/z1ZZs+PosolKQZOUik5jpeALHa9gz3Ucoo/THfRffX2Bu?=
 =?us-ascii?Q?PGhtKeQ3H3oCk8cDVDcnqo6B94RG59rrUlJMXUFnROYj5YDttfbf2JMQn47j?=
 =?us-ascii?Q?LTDrgxM/co0KA0BzsmhZXLkfdut9MEP4/GCS1dCdd0y6gJtgcugaHhYcMgZ1?=
 =?us-ascii?Q?He3dutSjQ7UWNdJz/tEPa5BDzL1ZU8cKdis1vcUFvWz9H6AgwT846W1P8LZp?=
 =?us-ascii?Q?HYde0WP5QQma8JK1EbJXVsHr/IGVmue/oLfsUexLuttzdFBk4i4psE0brfH0?=
 =?us-ascii?Q?2KySck8i9VjQImFHMQtufsCxtpq/6EqSjwxHxEQkhTMxR+6cLPB6gL+wjlGW?=
 =?us-ascii?Q?GujGviKrOap4KpiiRmDGp+KWZV3a/O+QAkERu1Y2CsXVBCN2qPQgI33RXaL+?=
 =?us-ascii?Q?ovFNeAlgT9wKKozu4ExA8olfFQSm6a0HIYex+e/TbeCjuUO2YDdSa8dAzpFj?=
 =?us-ascii?Q?tTOqcyaADm4+1Gn01DpkJX2z2TddxsdPU8gIOF/jw71wROQ0y6UaDN5doMl9?=
 =?us-ascii?Q?WsN3oi10s4A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gpVOV1ibsZ1j9RG+L5T/+02lGukg6BbrlY3RKCtjK+nn0273xy87CfKrEiJd?=
 =?us-ascii?Q?S76XspqLoOtDx5BuCioqeTeiufj16Kvd6TJO4bOOrDJr0eiy3u0ys5Yqrc93?=
 =?us-ascii?Q?SQpqp4EzoeKpNAM8VTMlWHSKjVZ/6g0F+wEdAYK+vq83a2w9ZbuMV8o827R6?=
 =?us-ascii?Q?bruPB8mBSTsHw5zgFVWiqnasxhS4itxY5QVrXlXRgkH1kxQM2OXAXCVI3gaX?=
 =?us-ascii?Q?9hjdKQCChMP1Y3vNh9rGf46WaHmZzgZmAfRhjnjpQ7pbJLbbZJJlnlJH6i2n?=
 =?us-ascii?Q?f/punuQ1+J11FCqwgdopMMq55EGhE0bp5yDwGgJacA+O+paz7VZikTmJyvqJ?=
 =?us-ascii?Q?wxhgcnP0GNOesjja2MlCs6DSdra7m5ndABWx0RvlLldfFq/Rx1clBZCbdOwd?=
 =?us-ascii?Q?us/6wlA0CR/IlVYYr9A51MdAUGJlCAq1Q6UILtsYKot9nqKEhSLbDdQg9Hm8?=
 =?us-ascii?Q?x1fdNROJCAdaMgfCgFWOWs6mdwMSBNIEnFmFTG3RXbRZR5gNeqP7OFOFgeLL?=
 =?us-ascii?Q?G5/v9j0qjnR7XRtwq2eyX6hDTQbWfvzIgdeUJWfvgKWrDQ8o9uXGUTJ0j7ov?=
 =?us-ascii?Q?SYCWLMlhEJfYAAuyl/y1lJFZBBTZquJw/uWEM+eJTJw46J+uBpUWSqOLSdea?=
 =?us-ascii?Q?dcqbZcZywFWa3ajLHpf7ufCY+IHBdYIyvuN/y6kgVYtLxUTVCfeh8W3oSWBr?=
 =?us-ascii?Q?Hg3x89AmGbKgBaI3SfzdnVnxkFQ+cF6WAE/etnmjk8Sae4mYV2o4m1RAPvm5?=
 =?us-ascii?Q?AF2JF6nc97nMDp14JvKy7GknzDWN/MKyoaIdyt5pkU6mqcid2m3HsH7ue8+n?=
 =?us-ascii?Q?Dd02h8Mfyn/TX5Hpu6feFZDh5sH++euXQCpp3EEmPNGsuYX+iueV8OFTwrgN?=
 =?us-ascii?Q?1gz9YwaHNFWAUIMwQfyH7SGxuMZMcqBlsj4kwAjrouCQbNL4bc0EygPLEUy6?=
 =?us-ascii?Q?uD9zgmSr5ulqC/O0kMthu5uJb1DWbv2TRNookKaPu7D8dTtUv4znpD3QkdYW?=
 =?us-ascii?Q?GP2DeaVlGaKeV+SPeQ4KKpS4ZmbCKpL7CIZi5z3hIXT93j9/RC2qiRolTRIp?=
 =?us-ascii?Q?VjLUCCVj0TkZgngz5Z/pmSeQI0C9ZH/baQ8/jdSvjAiauCiS0wpDmS+eJ5dL?=
 =?us-ascii?Q?VIwlF7tCGkkE6OLheatL63fYduVFyunJqTmhKU7ezuqu+gXYtYWnMAw5Fkmz?=
 =?us-ascii?Q?DLKlmy5QoGFtEQVuT8AM+n6ugXvf8V4ro6L9l/bcrgbbTIl8gsZl3lTFIGwZ?=
 =?us-ascii?Q?uLUMse9p29hIAp0gLjpiFPY7otd6Dq5dW6Svm5gTe7f2LFOAmPvo2TjmaZMM?=
 =?us-ascii?Q?q+oXZ7FjrGQkEdu04KdETrcX2Ey5RO/sNjyHSgxU0MSunJjTrF0TPG+kpTJg?=
 =?us-ascii?Q?x60FuSp1RVH3BmmUiw8m94LuUMg/oOB/LK+6va9EeBbE9t+ONJ2QXC5CZJ/n?=
 =?us-ascii?Q?bdP3n7KI0TFL17WQ6ofLCzmaJ+d4qk6dOpAtRLDNLI5Wwq+YFixAXWlO4gPX?=
 =?us-ascii?Q?RqW6wrkTJz9p0h9fgw8e27T6vzKCm1fVLjGEpQGxO/yFY+meEcWTMX3lYCbA?=
 =?us-ascii?Q?ooRzwK5Ff2l2eD1MsJeUdWuFZKp6/lgrSHb4kkoBZcBljTqvFwiehEeVVVWi?=
 =?us-ascii?Q?nS8wqBNHOuHHMqaFBbWgvGc=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e83cec10-a134-4e24-43ef-08ddb0cde81f
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 14:14:16.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5Iwl3eM3CdzU4/5ENCjP6imnkX6cEo5IBDaV9NwgBzYb6jWZs2NbfQc21fSC4D3XZkmYRR7jBvoYORKKVQXvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4122

When a running unit is about to be scheduled out due to a competing unit
with the highest remaining credit, the residual credit of the previous
unit is currently ignored in csched2_runtime() because it hasn't yet
been reinserted into the runqueue.

As a result, two equally weighted, busy units can often each be granted
almost the maximum possible runtime (i.e. consuming CSCHED2_CREDIT_INIT
in one shot) when only those two are active. In broad strokes two units
switch back and forth every 10ms (CSCHED2_MAX_TIMER). In contrast, when
more than two busy units are competing, such coarse runtime allocations
are rarely seen, since at least one active unit remains in the runqueue.

To ensure consistent behavior, have csched2_runtime() take into account
the previous unit's latest credit when it still can/wants to run.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/common/sched/credit2.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 0a83f237259f..0b74fa3c5d0b 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3278,13 +3278,14 @@ csched2_unit_remove(const struct scheduler *ops, struct sched_unit *unit)
 /* How long should we let this unit run for? */
 static s_time_t
 csched2_runtime(const struct scheduler *ops, int cpu,
-                struct csched2_unit *snext, s_time_t now)
+                struct csched2_unit *snext, s_time_t now, int inflight_credit)
 {
     s_time_t time, min_time;
     int rt_credit; /* Proposed runtime measured in credits */
     struct csched2_runqueue_data *rqd = c2rqd(cpu);
     struct list_head *runq = &rqd->runq;
     const struct csched2_private *prv = csched2_priv(ops);
+    int swait_credit = 0;
 
     /*
      * If we're idle, just stay so. Others (or external events)
@@ -3320,17 +3321,21 @@ csched2_runtime(const struct scheduler *ops, int cpu,
     /*
      * 2) If there's someone waiting whose credit is positive,
      *    run until your credit ~= his.
+     *    Note that this someone might be the one who was just
+     *    running and is about to be placed back on the runqueue.
      */
     if ( ! list_empty(runq) )
     {
         struct csched2_unit *swait = runq_elem(runq->next);
 
-        if ( ! is_idle_unit(swait->unit)
-             && swait->credit > 0 )
-        {
-            rt_credit = snext->credit - swait->credit;
-        }
+        if ( !is_idle_unit(swait->unit) && swait->credit > 0 )
+            swait_credit = swait->credit;
     }
+    if ( swait_credit < inflight_credit )
+        swait_credit = inflight_credit;
+
+    if ( swait_credit > 0 )
+        rt_credit = snext->credit - swait_credit;
 
     /*
      * The next guy on the runqueue may actually have a higher credit,
@@ -3582,6 +3587,7 @@ static void cf_check csched2_schedule(
     struct csched2_runqueue_data *rqd;
     struct csched2_unit * const scurr = csched2_unit(currunit);
     struct csched2_unit *snext = NULL;
+    int inflight_credit = 0;
     bool tickled;
     bool migrated = false;
 
@@ -3716,6 +3722,13 @@ static void cf_check csched2_schedule(
             balance_load(ops, sched_cpu, now);
         }
 
+        /*
+         * This must occur after the potential credit reset above,
+         * otherwise it would capture a negative credit.
+         */
+        if ( test_bit(__CSFLAG_delayed_runq_add, &scurr->flags) )
+            inflight_credit = scurr->credit;
+
         snext->start_time = now;
         snext->tickled_cpu = -1;
 
@@ -3756,7 +3769,8 @@ static void cf_check csched2_schedule(
     /*
      * Return task to run next...
      */
-    currunit->next_time = csched2_runtime(ops, sched_cpu, snext, now);
+    currunit->next_time = csched2_runtime(ops, sched_cpu, snext, now,
+                                          inflight_credit);
     currunit->next_task = snext->unit;
     snext->unit->migrated = migrated;
 
-- 
2.48.1


