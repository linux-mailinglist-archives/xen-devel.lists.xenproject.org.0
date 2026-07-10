Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 54UsMHjHUGr94wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:20:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B45A7399E0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:20:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=POqaboA8;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359057.1612843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8LK-0004wn-LZ; Fri, 10 Jul 2026 10:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359057.1612843; Fri, 10 Jul 2026 10:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8LK-0004uC-Ii; Fri, 10 Jul 2026 10:20:26 +0000
Received: by outflank-mailman (input) for mailman id 1359057;
 Fri, 10 Jul 2026 10:20:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wi8LJ-0004u6-0T
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:20:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi8LI-006d3h-4E
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 12:20:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50c75b-5cb7-0a2a0a5109dd-0a2a4508ad6a-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:20:24 +0200
Received: from [40.107.130.129]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50c762-ee29-0a2a45080019-286b82814896-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:20:19 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DU0PR03MB9633.eurprd03.prod.outlook.com (2603:10a6:10:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 10:20:10 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 10:20:10 +0000
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
 b=GT/rGwVXF2z7ZmZnofrqW1bMcJN5cgqNgeSJRdmKRj5pfDQ8rOjJ1rAOu9Lirx6bwJWiaS25/TGBJheXZv2gJ0QuLmDzgOhb0fmjgq7q1gKqFdvlGiphHhIzwIHEah6Bp0NgqWNlVaEfnWLQg1km2IW3jD90VEcvLLnXbhaPk8ouiwSzAf4nVlfQL/rnge/dxsbfmTnc/TN1BRt5iWxLH9lo0oCAEUiK4e59bySgsTT2pfQuuNKPhCnidg4yDZamq1g87rG3DP4SlxK2xlkv6ZQ6Hhl2IexMVw3yMBQTIoPMHOU/Z6+TKQDa6bq4/Xqg3aNSDljJcSRQGQprqvdQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks7QeJvMS/dwIBC7ym0JwWW1uyL/KECsuBfXfBQ1NfM=;
 b=Rye6eeD6ZFqGdH8uvwQu8LRsMnE437z/XBMWHzG3ueeKeWdy2dU+DH4ZoBNA1iGNfIk8+KwfAkV/pkSCDfUKNjDLQCJFyuXvkMdo3Onp6Y04R9zhm716VaG90dWDv0m4NAGi5kWfUXrG50HMSl6nXK0bYJoJOduAZxQ9UA9TQeqfzWvYYAotNXd8qA+Kx8t+WNqBo0YUF8n7UBgJROJxScJ34+jl9BNeVE9B3ynDC52ikQfoLnWj++NtfSKMRn4Zy3ViwRpQRjhefIiXd9Ef+bopfIzSHwnVBXw2R3tNN32Uqnoy0XFZ6qkYB4ZtNfPoef3P6G+lvItyKpmtp0i9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks7QeJvMS/dwIBC7ym0JwWW1uyL/KECsuBfXfBQ1NfM=;
 b=POqaboA8YDBdi0uug/F4dOIjmYkB+gfobjR/41Qo4+PscIUk8mwpzGsc01uoaiGsqYxkuCa2dTsgwM7qWMg72Di0ldE1SOMX/ec6NxJYYs+Xyutpdd5DXQPffCK1TCK88jnO3rqibUG0Bd0GatZvjyM+xymKK+CHYtCa9lIegAfAJnA/+FPk9PpROsXdHwSGBLUfhafKOzKftGUdl3ggMm4gAAfeePTzhVCraZkoCnkHVRjrC8dV+ezUIZxDK7K+5vGcwzmJWcAO5p/YnPNxThh8VVyJGpjJPXV6xFxjJZwrSv1is1I7APVUODKDxBI9VWqVgaz19D2HjMTUEMT9mA==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.22] xen/arm: propagate secondary GIC initialization failures
Date: Fri, 10 Jul 2026 13:20:01 +0300
Message-ID: <9fd0d0eacf061cc2a32f440e3438c084fa9ca79c.1783678619.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DU0PR03MB9633:EE_
X-MS-Office365-Filtering-Correlation-Id: 28046916-6b2e-4589-a53e-08dede6cd255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/KIwVnzHM4uHTVH3ISUeeCT6NXIo+zcj63osZjyPOlK8fS6UfjndsUNcFbowW4nC8IzJ1OuIf3EOUsG+Qza1cOCnHfjBPvNGFypm3krSl2hGUyKU4TKakRrCM9mCyW/S+YLY6COf8BlYJ5KeA99MiRWpvGXuQC+mPf4e21t6WReWemwnKyWRFkseP0RVQVtnePfWuR9K5FgLfFHkLy6NX6CRmW8Ri08NBmheYAOAWLd4nkNLgZG7kNHF9VdVAitqtw+v7Dr78GKqzwvEbdt4pusXR0GLaUV80wAdz2l5usRXk+WAdSclSqaKU8gmi7G5mnWrXBr03P4A0Yot+OdCd27EQA3S5MmLYbr5jxkMvN48MubBUt+ryGz8NEGw+Pjpq/hrVgevC2AQn++gc0yw+t6jrNJV0Pe7WoTinAIwscEckRzrRhYsi2scWjRF709zRGulYBwID5X52qkdlrcmgWhPLCbVPW7AG8LIcU3QXldW83JYKkkO7VXN+ze6IjJKbuNFTnqWi/kYa81nhCeYH86ZAEh+QBqCxlqK8JTA3Ru000KMXJHM2G97iUjp+kHOLXKvMURGaiDCqdSI4IUUSroZwVQXnJjobGJiLVHpPY5BjAfjR4E1bmw8MRqO0ZySn//YhhE/AEh0TYwCidePBY5hp+Eb2JPUsNp4yY/F2xY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0PUcMUKPk89nBaPK663VXvo7On0tLyJjf4wQ3lcYT0h10QV/ZPdxy1qFZXsp?=
 =?us-ascii?Q?CYvHOAA4HfLDucUdUC/3jnbOcsHTxD4TnNJhfRv/8PT9xPiqzmEBzzDmlqCj?=
 =?us-ascii?Q?gwtDeb77XQlntFeyQzCk9oFortP7qzGUEWlB1FEr2nYNz65B9NpFpF1fOdyd?=
 =?us-ascii?Q?MotnyjktxAmnGjigEFLPCsDplO40pkNMgxtbCaHqHdk7EPSTMwiEGnVcLh6o?=
 =?us-ascii?Q?rloC2vjiJ927LyolnDT9Ojdgwnk0xjBdIn/8B1K2qlc4N1Wo6qP+Nsoz0lU7?=
 =?us-ascii?Q?Q6LgZq0mUQEHY3VY8Elszs+8n7HNXGQ5o5jgk+n/xhcxMBjR05su6AfS7Uyj?=
 =?us-ascii?Q?mReU+Y6y+DPnqzTyHxz/1ILITf1va6mrm2y/3+OfbZE9d0BwnlFl28eeszyy?=
 =?us-ascii?Q?x36OfxsLJYMq42A0BEE7UV9vxJUk5w3GJYU57Oy/f0sOAL59JD4aDPKePpWw?=
 =?us-ascii?Q?FFwugWZQuHJcp6zf1+wNM/mfGQ3vAPO5zjjCuzntJuj3mVi0uhpwwK/JQbwP?=
 =?us-ascii?Q?r/XrT/24M02Vx8PwGhEpC9YyJqqjRQNPbyp69n3fZWy41hCdOeFXXfyeWJ0s?=
 =?us-ascii?Q?PAUAh8y9q99elfaR/C9GPaX5FTpERIqWlQxnPyf4ROdyhyF/kiotoetKTX9h?=
 =?us-ascii?Q?+7zsWr9VtJcyTx6gUkh8wx0jDE7LSuzF5GoXiu1OF7WekkIdvcw7EEh8I/aP?=
 =?us-ascii?Q?OapuN0Ow4yelc1G/8LeVy+ctvHeDbPxWJ62S2NuEiVhiI5EsfTGsglAB+Eof?=
 =?us-ascii?Q?gTh5IsVqHb+M7JL3+vt/4TXYImBojOyWFSIwmMFo1RucoZFnUeGHe53Wc5C/?=
 =?us-ascii?Q?o8MIok+xCvLzu8/cmby3PY3AR2rXtjSdcRm/J63Z3mVsuiSdaXMlPFlFs4PQ?=
 =?us-ascii?Q?0NQDtpld5eMeMEOJCOhZdHk3LGyWJAY6ytpLORMqV5Wq6KlrLgbHxGv1LrB4?=
 =?us-ascii?Q?+WKL0aREusCXAw6orDospTJMLMs9KcPRd+GVGOY0Ug3yicNOnOWGP4U7aN0M?=
 =?us-ascii?Q?WXcb52Wd7cJIBMv0X3WLRsI5AKDVcdGX0TESkW8o5S+Zhq+LbwXKvdoF4LD3?=
 =?us-ascii?Q?JUZKK01sHTMqlEOOrFo5cfBAO+sh3XZpMyltpFjPQX0DlSytoyQLl3Zi6gR5?=
 =?us-ascii?Q?h435h/VmizxygZHalGdsvQP8yWoqZhjUjd3K2+ksieTwAO1Rp7G3pvhoXi98?=
 =?us-ascii?Q?XTfe52jATMShpjWOvacT6FJuWrm/LiT5w6u51WRaVeJPwkJ+e/jztozggaoj?=
 =?us-ascii?Q?Xo/jmWcGsu6Kt6vBgc8yW1ckr0SXTWYP/vj+PIpgS1rXXZJk5mukDbaJTVQv?=
 =?us-ascii?Q?z68vwjKegc6Vd9BEJbxH4PPtEqlLJyLwULU+B5KvN8+nUbhBqvvms4GK0C9D?=
 =?us-ascii?Q?MrPOu3b3ZBhAjLaG2w4ez95kqHgCJIZJC1PkTHTx34CzIIw4KQGnyCQjabNe?=
 =?us-ascii?Q?FIKS/dNEnzwK31XZXma+S1dtQqhuBWl2mqA766rj4/Ay3wsNf5HgJlSE0Gug?=
 =?us-ascii?Q?nOa7RIs8qPcl7JSLzovQ85q+QgbDHTP3UEgCrRRbeajVoAceo63V2go59fun?=
 =?us-ascii?Q?OVgLjjWQW7s0yxTRmsXYRTZd96fJ+AGdE1wyBDy9utUpFwB78UpOzQszjUjf?=
 =?us-ascii?Q?K+HOIMnObFPpyRjzbS1e7O0WFm+Xf9CssYfpg3BN6PV5/kfSiKVkV8WRRI05?=
 =?us-ascii?Q?LbuiNGsn6ptkWaur97Ci/Gcos9SlwiBv4BBU/u+ai+qo7u24Ehq/3xKjP8Zs?=
 =?us-ascii?Q?hWDhuflNrA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28046916-6b2e-4589-a53e-08dede6cd255
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 10:20:10.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gq2Yv86KsKQqwjB5Al+ad0UUSos6iG+9PHAI9VXB3Owzwul0zNhlET3odcVlA8BvIYqH7ZhzHn8DYX3balDunA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9633
X-purgate-ID: tlsNG-c1860d/1783678824-7A62B01C-FA032E7F/0/0
X-purgate-type: clean
X-purgate-size: 2814
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B45A7399E0

The GICv3 secondary_init() callback can fail while discovering or
waking a Redistributor, enabling LPIs, or setting up an ITS collection.
gic_init_secondary_cpu() currently discards that status. start_secondary()
then marks the CPU online even though its per-CPU GIC interface may be
unusable.

Return the callback status through the common GIC layer. Have
start_secondary() report the failure and stop the affected CPU before it
is added to cpu_online_map.

Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic.c             | 10 ++++++++--
 xen/arch/arm/include/asm/gic.h |  2 +-
 xen/arch/arm/smpboot.c         |  9 ++++++++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3..078049e741 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -282,11 +282,17 @@ void smp_send_state_dump(unsigned int cpu)
 }
 
 /* Set up the per-CPU parts of the GIC for a secondary CPU */
-void gic_init_secondary_cpu(void)
+int gic_init_secondary_cpu(void)
 {
-    gic_hw_ops->secondary_init();
+    int rc = gic_hw_ops->secondary_init();
+
+    if ( rc )
+        return rc;
+
     /* Clear LR mask for secondary cpus */
     clear_cpu_lr_mask();
+
+    return 0;
 }
 
 /* Shut down the per-CPU GIC interface */
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index ff22dea40d..ee2c26adb4 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -291,7 +291,7 @@ extern void gic_preinit(void);
 /* Bring up the interrupt controller, and report # cpus attached */
 extern void gic_init(void);
 /* Bring up a secondary CPU's per-CPU GIC interface */
-extern void gic_init_secondary_cpu(void);
+extern int gic_init_secondary_cpu(void);
 /* Take down a CPU's per-CPU GIC interface */
 extern void gic_disable_cpu(void);
 /* setup the gic virtual interface for a guest */
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index ba5fd2dd52..5e23b0b6a9 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -319,6 +319,7 @@ smp_prepare_cpus(void)
 void asmlinkage noreturn start_secondary(void)
 {
     unsigned int cpuid = init_data.cpuid;
+    int rc;
 
     memset(get_cpu_info(), 0, sizeof (struct cpu_info));
 
@@ -373,7 +374,13 @@ void asmlinkage noreturn start_secondary(void)
      */
     update_system_features(&current_cpu_data);
 
-    gic_init_secondary_cpu();
+    rc = gic_init_secondary_cpu();
+    if ( rc )
+    {
+        printk(XENLOG_ERR "CPU%u: Failed to initialize the GIC: %d\n",
+               cpuid, rc);
+        stop_cpu();
+    }
 
     set_current(idle_vcpu[cpuid]);
 
-- 
2.43.0


