Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EXVzNCFVMGrURgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:40:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8686897FE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 21:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=W1bcPhhD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338565.1599629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZDAB-0004yy-Ek; Mon, 15 Jun 2026 19:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338565.1599629; Mon, 15 Jun 2026 19:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZDAB-0004vJ-BP; Mon, 15 Jun 2026 19:40:03 +0000
Received: by outflank-mailman (input) for mailman id 1338565;
 Mon, 15 Jun 2026 19:40:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wZDAA-0004gn-Nr
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 19:40:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZDA9-007B9d-AZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 21:40:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a305506-2eae-0a2a0a5409dd-0a2a450ae082-8
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:40:00 +0200
Received: from [52.101.48.1]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a30550f-56b3-0a2a450a0019-346530015220-4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 21:40:00 +0200
Received: from SJ0PR03CA0373.namprd03.prod.outlook.com (2603:10b6:a03:3a1::18)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 19:39:56 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::84) by SJ0PR03CA0373.outlook.office365.com
 (2603:10b6:a03:3a1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 19:39:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 19:39:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 14:39:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 14:39:54 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 14:39:53 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+kUcirfx8I9hQY2Ruz7Pn1Pv7j+U8g+oNIR1aw0wC94zjy2O1DWHDIVa6gTmTlqOjab0FmiIYp+EzkFmI1fjzuHG4M0HErQB8yo6HSsfdG2YQfzpn3MsJBzm7KCOizAna2ekUDVKpaeC4Zkzf+fdhLgYVoZblalKw3LgkSaIeXeMF7pU4opbzqEma3FLrqJI6niy/cjMGlt5VoIKCkSLB7pDgcaMbl96slNiV+A8WThfHzZvy2n8cdXBi/h3/9Ub3DdGQ2cL6y2mbxMPItODXQBlvJnrxrE6GzlFY4+5Dlpy5z2AwWq6Y7YVtSIWWOtAYbjZheyaEaqpZvrizpaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teoBfYHHS7C45KLJXxm9+ZQbI7VZO+28Yj4mxqqWvqk=;
 b=NQ8St5cDKZRfIql89yXB0M/xI6jZD4TbWEf7Fbrmmq4O7xKiTwLCk8GUf7ujn/g5Z/tUUPWfB5G23BOdVX17rCK11JwI94YnXHT0FPhX6bs7xmgJe8kUK1XdSQYoCQimOsS/HLJrOJbk+Dkr6sNCTNpmJlfQuGhoFD+kDs/324CJWamTUdQw/npAmNyTgCJx0WefgnLvaw0EOw2YZKL7S4DS3mGKRoNCe1fIUHITAZyRGGjp/SwEsZ1paDjeCvzMr7dwXPqnUsYS3S6ShbU4p8JbDQl1MebEIeZj8QdQpjYv3ab0BYFHYjCIh6iZ9v/h7C1SHZNifBrgJByqxADjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teoBfYHHS7C45KLJXxm9+ZQbI7VZO+28Yj4mxqqWvqk=;
 b=W1bcPhhDHkh7tRLJPhfdJvJYTQ3TJsW0wDjWvSavT2kQxrBiUzasGzdnXOf4RWoY6kA2wG4EDEDOmdmHWkAXRvYLez9UlQya3IKg4/15wH4AaXdtAQTAeGg1p1fIu0Q3TkXzs+Id1lzGhRhLnXYzNrmFpCVQ4NKYmjD0NV+R2kc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Revert "xen/cpufreq: fix usages of align_timer() in the on-demand governor"
Date: Mon, 15 Jun 2026 15:39:44 -0400
Message-ID: <20260615193944.19392-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 22014e04-de28-4c55-a177-08decb15e0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	oTc4UOWvEhRXPuL31yVReQFLO8Sez6PnBgrd9/WriO7BFFbCKoJiWA/eBgyOgiEM+sgDgowAQLVlVN6soEmGbXwueVuCquuxiV9GWli/HPnjXMSln/u3x5ov9JmmLghHudspsdzFBBZXKEYPTU4q77+D9N4PSbrXFaevSubFburrYcdJmsi5GQYfPfYOII4Mmn5dLOjfIZSOJa91qhYuOPhfSv+ltVOvzLwioze/q3puS2EBsfuqUZYhXTPsaEG/lHmmIeev8QZWjltHx4Ny6jGf153fzBxZ25hSO/wPuDITdQkfaqTf10flfrdHa++fAMOrmN+9i1jk7m+WnCBWpTwrZSx5XVTjM4wap9HbaSI4XVJ788vp9Tl27FQl9zU2iH/SiNRP6jHOynKCT41cjOCvPI4RXHDZ6MPN/GA+Cm0ziStzl7cIMpSHXBY5lMOtL5KV9dekYWmqOPwlCOQPgEdtgYRVtbwQs8pZIj08XtNJZqH1U2cfrY+vx68WHeYbSL9Qkp5OXKnq7Ve5jc2C5FitsDR1jjHmua1G/JjlHQ3XoZ2PvjHoe5vy1G8lh8+kj72GOdeCOcT8tVn9jwraqiegMEw3Jgyv2Ec3FmO+gWZvS0as8PysRxkSJSDIs6YuE1amrL3M/VfxRsE69Mjq163+MzS8ZHTOaTtW5iFcIVBNirN+CTxcOLaeRs5ny0M0bvRZFiS9UKPNQaRVHAR3qoNEkA0WCiNAuQdewQ8CGIc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aFDpovvNz8bQMr8qAglL3EbLUqLAKvIxwe3wR6OWlas25pamR44Hu6z47KCyTSJYzt9EbW3+cqh8tOWD2Uysr//3oEw8/SHOHs1FtSQCJZtIO8MUXiTS0hv348GnvPnEGl2nTNPeInzXo0OStiR4+fq9HK+NEu8DXNLnyyhuUhuj5epmcuj9pVpo7OPsSJPt1VoAbqZPNhN27FAn0XE9GSxiZYr1i3SGG9S+ofmb7JKLuCeG/qmN1Ijs5aGrnmU3qI8MMkG+DulCiUMxFuuA9y+4+JUfxoenyojB9dOj5r1ZznCtfRJlbrm9y7yP2daOtTDPY+tKfJGofzSPO27m2r0iJUjLg20hSOGMVssvNSnXlYYBt9OLewvgpQkK/td/5E9tG/9Tl25475bUycAKVXyVm1ag3/pXvR8qXnUZt15/Wokqth5eUP5pRQeB16Jc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:39:55.7687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22014e04-de28-4c55-a177-08decb15e0c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377
X-purgate-ID: tlsNG-4011c0/1781552400-7FB918B7-6C370827/0/0
X-purgate-type: clean
X-purgate-size: 2069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D8686897FE

The original commit showed a ~6% regression in a benchmark.  The call to
align_timer(firsttick, period) rounds firsttick up to the next mutiple
of the period, if firsttick % period != 0:

align_timer(0, period)          -> 0
align_timer(1, period)          -> period
align_timer(period, period)     -> period
align_timer(period + 1, period) -> 2 * period

So adding the period (sampling_rate) before calling align_timer() will
in most cases incease the expiration to 2 * period (sampling_rate) (the
exception being firsttick % period == 0).  This longer timer slows the
reaction time of the algorithm.

This reverts commit a0ed5bcfbeee81c91c574ad484faa057054eaf09.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
This is backported in stable trees and should be reverted there as well
(found in 4.20.3).

A Fixes seems superfluous and not normally used with a revert, but if
needed:
Fixes: a0ed5bcfbeee ("xen/cpufreq: fix usages of align_timer() in the on-demand governor")
---
 xen/drivers/cpufreq/cpufreq_ondemand.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 0d94c0e464..537695eaab 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -185,8 +185,7 @@ static void cf_check do_dbs_timer(void *dbs)
     dbs_check_cpu(dbs_info);
 
     set_timer(&per_cpu(dbs_timer, dbs_info->cpu),
-              align_timer(NOW() + dbs_tuners_ins.sampling_rate,
-                          dbs_tuners_ins.sampling_rate));
+            align_timer(NOW() , dbs_tuners_ins.sampling_rate));
 }
 
 static void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
@@ -401,6 +400,6 @@ void cpufreq_dbs_timer_resume(void)
             (void)cmpxchg(stoppable, -1, 1);
         }
         else
-            set_timer(t, align_timer(t->expires, dbs_tuners_ins.sampling_rate));
+            set_timer(t, align_timer(now, dbs_tuners_ins.sampling_rate));
     }
 }
-- 
2.54.0


