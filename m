Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DHQ9DO70NGoYlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD8E6A4743
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=nYO4baVk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341739.1602069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzn-0005t1-8c; Fri, 19 Jun 2026 07:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341739.1602069; Fri, 19 Jun 2026 07:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzn-0005lv-32; Fri, 19 Jun 2026 07:50:35 +0000
Received: by outflank-mailman (input) for mailman id 1341739;
 Fri, 19 Jun 2026 07:50:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzl-0005br-3r
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzk-00Dxzh-Gb
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4c7-e002-0a2a0a5209dd-0a2a450bbb74-2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:32 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-11
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:32 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:29 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:29 +0000
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
 b=jnG2P7oMscvaAbHNYvGlih1B7ab+ckqcR2UmhTxPD/OZXQgvf59ubhaZL2trWu1zR0F9hCvH2iWhCQoCRJ/VjXqAEQwiBa8s9Z2PlsKefs7LicHaVUd1AZf2UHWbx824/DrED4b9umkz/1WCaLNP02+Zuq7u7eZ7+d9xnHGnbytaQB+p6zQj4LgjyjnBwZfDLctV3/C9ZwyW743w9gagXN2No8LqBeRzVQ2hnuH8vTNz4b/xKk68DK5m50eXxyKlqSW9oMBtxEmIXBPoJHNGxcRLOSssxcO4eYTR7qmtaMmiqgf6KONh3RoLNd0kjnZw3KcXuVXe2WNJT6VAjOkxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8QNG7rkL1EU6z/StVk8jS/8w6/V0pTdRzTVBAel1S0=;
 b=rfQMneIIRSN3aI91SvGF0CeSg0ABILGhNXuCtT+AQX6RB2cu2vvfgEF5RQo+ZCiYYyVIBd4/ETkvGxqudHJ8tOrD41r+fWMOzl/Pk/JOAa+tqG6ow+e8bXQhbUACe2OeMq3NV40uav5XF8qtvGvWJkygkJViz+4F/Nx7qDU/VPMoDPGhK+ecE/fnutu2iOfH6g7oNlhwa+lIDWAQsr3Xrn2TmAO4XG/63uE0KFWFqPVpAYUijneXNpYHeFD0z0C62pUgiwv0Lpf3+bq5q6k8G89r1MtVuHG/m/asoSFCd8N6XXwU99E5ae3/NiY3kkU8TvwtVhGb1dC32uggqEWpkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8QNG7rkL1EU6z/StVk8jS/8w6/V0pTdRzTVBAel1S0=;
 b=nYO4baVkvqBl6oG+b8JxClV+C+BngiDpmSfTDsYQfv6ZoO3YKAokdudL1sbNEbKpR3hpSA87esdt0uHdaFjgGIGyIawgcsVmoQC7nsaGz6Sbvr0j11aijtUWF3gjyqHgCgnxY7D7YOTLxy9wZhXqglkwFSZSDYn/OJ6DtBm1i+8=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 09/22] xen/arm: Introduce dom0_nodes boot command option
Date: Fri, 19 Jun 2026 16:49:57 +0900
Message-ID: <20260619075011.377116-10-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 883c4c4c-4c78-45e6-dd1c-08decdd76ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|56012099006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gf38UOvwYUZKWRRak2NFWpoIp5By++qGFhzfjRSzQwUPWdiQx3LmDFJMxlJ590G2fSDuPfz3qLpGWD9H4bBK4OuhZowi5l91prj9IulQjMxYlTdIufS1CxRB6QDHFW2+TA/FBVNfaJMbezw5/Gsj5519IiFhuqnTpGCQILE8g2v4eD07l5pwA9MB8VVjWMnZ8OrABnTO3jHu+5Azjk3ZxM4dGucc/NsldIHdRnC2EEVM6+ByX/ja7ZEsYso51Mtlew4GGT/EsWybPdOEoaLeWE57G04KBSwDCkhACF6RbWmB9kIkatxfUkJbE8ddzw/K+V29xMBoZYJeFnv4W2Q3h9ZQXWakLFaIjqcvUl6IcCUXGlDXfIN/c1iVPsSDBhFIzH5z7OmJtlaiVJdCHXDC9uvDak5ZIUKXv/H2Bm04pn0WkARmWS5p6+3Z4XiR6su895vWd+yKMiBwdTEsLkBP9IOJCv52iMkIp6jdjJf2QAvN8ubhuTo3IWDBZHYXhWWuTKklthvUIXnXRmkWVk6O5jwPJE4zVYL0hV/QAoTZ1Pm5aCQt8spYCy4UgZr5vvUheFOS2qUXGBcWtebsXYlUuM+RKlKT+nQliF88kC4Zz0dFSJVbpIC5k5hCawdW42QDxnhn19au/HVd/5MWjUQvVsZhwGZoYZti7VM2L6UDVos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wZLfeMpDFynzkrmDsutbAGTsEuHs30bEOA4rj0wMjd15qspvjO7zQ5ugjeJd?=
 =?us-ascii?Q?BXIi+cmsSJjwUnel8MCgX01DUMkkH99Wc9RsOU8Z4NUlXfV18Q9FJfVBnzBO?=
 =?us-ascii?Q?xXiDa8rCZKBKYC5sd0mNHu28mwplL/Mycc4eSOYZObHJfl6dhWFpR3gi4ueg?=
 =?us-ascii?Q?xGXi8Tgp38DWLLMpofAEF1mjYkUOeuo/uiB3+RoHQWmJ7pnxfy6c1aR6RtgC?=
 =?us-ascii?Q?TNgCUxTsE929EmwUXoXQWbBGPmVs+OiMHDPvJrKbkv64PHrrkisxEe0ID4q7?=
 =?us-ascii?Q?TTznz36wrAPJaO24C8ETHzEqdxa4Yym4bUovtv/4Brpz/RZ8dxWSBqh9SRWb?=
 =?us-ascii?Q?yU+hh1ndTlZDYaGIf9/OyBlh+6V1U0+D2kph0y7JmGRr7bA7R0Bh8YXEtc1c?=
 =?us-ascii?Q?hbuE/4sRYldA5Xtfon0XIeI/RHZiEI4jcjA6MjqgjVS+b2RkU7jT34MqFrCo?=
 =?us-ascii?Q?/tcaTvpsMvfAFsrg5fer/v4rlTzRJ0yFuTFMcGUraVRL+kQrAc2RlRidejwG?=
 =?us-ascii?Q?1WT9WYM9ig56odAOkb5LPmymskqEiroDMvCN8EtkX+rplN6HHhzjEjTN6sa8?=
 =?us-ascii?Q?t/YreiF8Ol5Q9oNNwT+pP3HWqZ0Yj3vv6oMMkS0ua39HC0BELb/La5JwKAHH?=
 =?us-ascii?Q?xN+0PmLB23XZHEHCKvv+OLrN8doixZtACMtsqNSF/3+v8adlAeqdTGRA5FRM?=
 =?us-ascii?Q?yKXYi/QkpfiGhv5VdDqaqMLI6Vt7PkNSEUmM8h5csILxCYxI+jIz0asEiIE7?=
 =?us-ascii?Q?LIktPLMC/s0b96SqMOcN9nWSZEd2lljAuEPwBjqUTRnHtKcJ1md2Wc8ps72f?=
 =?us-ascii?Q?ef0EtWL0L/FZCHXTuO+A8eAnQR+7EMCDmQxjMbfnj/jpFLZPByaGaUGOKDHs?=
 =?us-ascii?Q?I4HwCmOk11Vm9nFpJ1oJnV50cIhYvktNFzlHKK8doVUYCjVoDZUPzqUp6H+8?=
 =?us-ascii?Q?rdmTHZUBW1PpDuXW2Sf3ZxcKFt1GqSvRBSO8wlTF7MN9BqA8kyBMOoWtc/QG?=
 =?us-ascii?Q?icVWmAMeppfznEI9XiUuJIYHAEJF7jlSZ6d5+2uu3JY0WPhEJcwqzPZe8vdh?=
 =?us-ascii?Q?sSze3v7NAhC3fxo77Y03c3J087x0uJu/FAJAtEUFAZVp2xxViPbjOUX0ZYZB?=
 =?us-ascii?Q?wUELCRPvDKQpF/p70X7ZDqmEsJv04z7fbGIb4p8WBNKuyKQSOiUl3MLFYGnP?=
 =?us-ascii?Q?zOr8czk80GL0HyPP9jqNM+3TRchV8hDdbrPvYMDlhBtDDdQOJLScc8y4taL9?=
 =?us-ascii?Q?cD4Nc99xHeMWli74zSU702dvIrRF8W2CUXO+8srEZ2jHrdG1wu0ShmsiLwbx?=
 =?us-ascii?Q?j1fgspyxLlPgsfL+JC5j9YLxRXB0C+pTlVr5C2nonWQ0kDdvsEUu1ETos90J?=
 =?us-ascii?Q?K0oWlqGZj50sy1wfZShSkRXckiwMB2dQhOiXB5wTSXzd4qATLTrkA7uJa5Lz?=
 =?us-ascii?Q?lZlOypg8x07sEKqabwGxhotRX9lho7QHUoYnV8g29LyzexZdIcULI0w8p7l/?=
 =?us-ascii?Q?Te3aLKwU9UgoP7GBsOLpN5Jlr5dPSb82IGMamysYUJqCgGPNKCWmnhOr2pQ6?=
 =?us-ascii?Q?wi9zD95o77Q7m/9GHijS7FDj75htyqFhxZ/w8P0nBuTk6ZsUgp1FbqMMnLIi?=
 =?us-ascii?Q?87XtMLWPRekQyiinpCsqYWrapBccUV8ykqXdZEPDlWlqxcqiYp51d4SvhMTA?=
 =?us-ascii?Q?7DbSsHeujXL+cl2IjZ1zXWXH2XrwXXHT6PpdaH7ItCDAerKvC7z9TgKKWFGk?=
 =?us-ascii?Q?6uzhYplgPfKwyg78sLXXp66v/5C83SCzPm+cimLSHlR0KFtUSFkkTf7JntVI?=
X-MS-Exchange-AntiSpam-MessageData-1: zWEAvCqconN1Lw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 883c4c4c-4c78-45e6-dd1c-08decdd76ef1
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:29.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5O3Zdq/TjqkGx48VaSBDQ4Jaj8wDYK0BJe+enxue4dgt6m6n4HNujLT0kCP+E40UyrT93dyjS0qi/PWrLic8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855432-4E5E400E-B067A749/0/0
X-purgate-type: clean
X-purgate-size: 2067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFD8E6A4743

Allow ARM Xen to accept the 'dom0_nodes' command line option.
The syntax and format of the parameters are identical to the x86
implementation. The logic that actually functions based on this
argument will be provided in a follow-up patch.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 550617f152..512ae8e630 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -37,6 +37,7 @@
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
 #include <xen/event.h>
+#include <xen/ctype.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -66,6 +67,48 @@ static int __init parse_dom0_mem(const char *s)
 }
 custom_param("dom0_mem", parse_dom0_mem);
 
+static nodemask_t __initdata dom0_nodes;
+bool __initdata dom0_affinity_relaxed;
+
+#ifdef CONFIG_NUMA
+
+static int __init cf_check parse_dom0_nodes(const char *s)
+{
+    const char *ss;
+    int rc = 0;
+    unsigned int nid;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        if ( isdigit(*s) )
+        {
+            const char *endp;
+
+            if ( (nid = simple_strtoul(s, &endp, 0), endp != ss) )
+                rc = -EINVAL;
+            else if ( nid >= MAX_NUMNODES )
+                rc = -E2BIG;
+            else
+                node_set(nid, dom0_nodes);
+        }
+        else if ( !cmdline_strcmp(s, "relaxed") )
+            dom0_affinity_relaxed = true;
+        else if ( !cmdline_strcmp(s, "strict") )
+            dom0_affinity_relaxed = false;
+        else
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("dom0_nodes", parse_dom0_nodes);
+#endif /* CONFIG_NUMA */
+
 int __init parse_arch_dom0_param(const char *s, const char *e)
 {
     long long val;
-- 
2.43.0


