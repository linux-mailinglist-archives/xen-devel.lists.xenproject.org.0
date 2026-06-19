Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wOc7D+z0NGoSlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B16A472E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=S6S0pEFZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341750.1602106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzu-0007BN-MV; Fri, 19 Jun 2026 07:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341750.1602106; Fri, 19 Jun 2026 07:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzu-00072v-BK; Fri, 19 Jun 2026 07:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1341750;
 Fri, 19 Jun 2026 07:50:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzs-0006gv-4v
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzr-00Dy3W-Fz
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4c7-e002-0a2a0a5209dd-0a2a450bbb74-30
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:39 +0200
Received: from [40.107.74.126]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4ca-5e53-0a2a450b0019-286b4a7e0f22-5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:39 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:37 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:36 +0000
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
 b=BVTw9w7YZiRVGVo/YGG4Nu8g3+GbVL5uMvrbNF7cMbJE4CkLEW1tuBe7vsim0s1+98MouaHfTlXMiSrRngYFW9aV2Re8RY1jGwKFmwsLDQdXNZrKrrWNKOatgbTLCdxh51+HkEhQQr0X1mCqNCuHoYB2apd1uuJY5D20k/iS0wRzJX4GKnUt1YUkmHmcaazQwZ7s8GRM1qGiJelPq4ggJuTE3msI66goC5O/BZWm0ye0mOlfjD9WVDn5+Hg+d5moH3z/L9OkHhiWkjvONGz4jUpWyQvO43BHw9bKV32Hzcok2gY1ZN+7HEwPHyrSQRDhWF6yN3Iy16tpzcWGSV1dFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wxJbHcM0BcD9NfoU7heSrzEQA+9Zt5KHHIexZfNnfE=;
 b=f/7SrqLV03fT/DDJyPVHsaLtsIvvS5r/lgUd/0uo0bBniKqcGjRWleb9I8o/khw8E7nU6cQ4PRqGdJ4CS+TwERvhT+i72W9fAOPmLhRwpOCMRw+i5GbdRovrKPjdaE2cX5O409MHRTCPPL3QXCFKILTt1fbZRMhg9j6DhCHjJs0xbOO9KbD55FEOI1bKa520aFh0xwAxCkNEFEEBAV7+tu6KXmGTUU/Gsf464a+PNqKUf1ySUMu/WWv+c+y2qYzSYhdibSe+dq0USie2TsuFG4IRjTEwLJ1KThkfhqQfF46jZepaaomDrdrCJXXYISK81YJT8wT+o3XUwCDD5FCPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wxJbHcM0BcD9NfoU7heSrzEQA+9Zt5KHHIexZfNnfE=;
 b=S6S0pEFZRdavq2lvb0SlX3IPY1iNGK4y36KJYxg/RNpJR/YMHXrDlhRlegggLckGKb8J2wD+RlrhOMLZD3lTaMg5HaO6GhxZR8rFXNTfnn3rJ5yMqqHhtbuSGCivOtQYzIm4uQY/VlWP8tb/na/n2hQgEDNulYU846EMCeWQOpg=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 13/22] xen/arm: Export Dom0 vCPU-to-NUMA node mapping to Device Tree
Date: Fri, 19 Jun 2026 16:50:01 +0900
Message-ID: <20260619075011.377116-14-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: 54822c0a-c555-43ba-441c-08decdd77343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NWocCvDB5IUPcIsUjdS7nYG/BQUUp1D/c5ORyyBwKlic0xqiS76Yc+mleiaF+05cWL7lTRj5A8QB7lhb+8FWgwnsfNazY6F5lD7E8JD/Vdhq/8nFavMGGEIibGQUpQAo44BD5wB3HjUCd8auDiGBfawWS5DV9oKPZyOX+ZkSSwm/Jg6Wj4CmACOtXj64tjrWr2RGLC4yptiACMFv4fZfhfpFNn1N+9Tg+H4+vquM27hTE0eWRHxB+M8lnAMt6tL9XaiBRV2SHbbXFG0z82dTCDNs6JEes6ejzDFqNTsvT/om7Q4SgeB0EP5M+B9UlfR7qF91iqZF0TPvpTBkygFHwE1G75RGAvnM5AFLkCZPuaIz+EQpjtFWXo/7BakQmVKTU7J0KELMRlU+ZF8yln35oro9xsYQHEZfJ5R/yeF35KmKhC1Q4LVSRPVqZaCAeYoRr30QJ4Q6S6ieNdmyadN/rUupj8eH8r3KnXM8RrF1VQe4+iMBTDtt13Hu0Biw7GSihPh8N1E0t1LAl7rGWtN1SKdYc5jNabxhqbfKkRz/w4Xol/wOjolGoLAzEKYuWZvKvIGjKlnEk8UejZ0jwuhEhezPDvnuUvlizye1NRzDuRhfrpaEyWaEUNMQHKkZCfV4ASO2ldxsH9KnE7GGny9qdO0EeP/zIV/cjUL0oqyz4gY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qKGD74jWTMwtFlDBlhw6734tfFWOLFv2YOvpOO/YKEyJsH60nHZaedU55TFh?=
 =?us-ascii?Q?LJC4k6OJb2NDLbo6L9/nuSisL1ayvlmCP0YU2I5mz7cmhwuIfVla688ufR9m?=
 =?us-ascii?Q?Hkwmuq74iAkoquhkvZQFjLPKPm1wBrOn2x+krClhXX8SZ+J4Q9CKhN1NsMG2?=
 =?us-ascii?Q?AgfR3bT3+zpLtk/+Bqx7vvHYThCboiwPgwe5Y/MIysKH0MOtsLyhwmgYQkS9?=
 =?us-ascii?Q?e5DotAheRUvL/w5fieYb7KupRtNQfGnJnc+j8M66JcaeeROpP+Sb/yCQCiZ5?=
 =?us-ascii?Q?zc8RXpHq5c1dZzV/ukzth1NIieudmGCdSfpnMHQyPK/htibl+iOH7r7kVdOA?=
 =?us-ascii?Q?kfOY/8zNTSrpXf/wltI0uY4VDBFLcx68JACVtuCjvOZCyqELu9Pz5kQra4zi?=
 =?us-ascii?Q?GJhZC/NI2MLLE+PCMJYBvmq1qRnS6m8NS4Vp/gI2CkarLs53670lHVlwlPd6?=
 =?us-ascii?Q?/m5Z1n7vgv2nA/CisZM9menXZnTTqFJDOqjn1g7DHyHQoiOpVa9GwmpV1yeu?=
 =?us-ascii?Q?DaYKgud7R7KqoBC2BXqIHFetCwFtS4V7xS2B8W8BKI9AzZfFh8YZc8kBiYMp?=
 =?us-ascii?Q?rYZhcrGi0LhRtI9MxQIcW3JV5hFTxDandGVKWHvOmz2sX6KZ85EKaztHSl3X?=
 =?us-ascii?Q?ftmtp3qG5Wvh/CHrU5XjxLgxck/YKoiuomef1RUU/Tzyc65H0Y/afQfKHCxf?=
 =?us-ascii?Q?u2UFnRMA52zzkeftQWwNgU0E0pr0HQqxZ07xm06HSY1bW/AnCuhJUe9RGtNi?=
 =?us-ascii?Q?OtNZQXTTq5iyv2fZAJybThtIogSg4D0GoOkouZSO7rVwk5LVYgPHtqjU2n5I?=
 =?us-ascii?Q?XqFr/96wZTfb97f8+O3BpX1xD7cLrfe/MXg71KPYtT+iuel1Bbpbqt3Hl0zs?=
 =?us-ascii?Q?pCLioAwH+xElu7t7CGcG2xheKsnHqbIrUQlkS/NwkZSxA9ZqPRi4eseZdvgb?=
 =?us-ascii?Q?2JyvINSnv2+X3lttIu8QBJUuuOcnwuX5CmWLBIKWgR6Ny9uxxuEcPd1R2Ewt?=
 =?us-ascii?Q?loOo914gmQ54f4tyYAHFGNPyz+1RYJwtW7TCIMq2nFnU2kFoxSphG5cpN/NO?=
 =?us-ascii?Q?p+Ah4RJpJLnA5JQ/mrV3oAClUrOfknanib5+f4O2TLNI+kICk7SD0npKLoAx?=
 =?us-ascii?Q?JQlRKaSyoVYqHgriltZIDO4qlFZOvJCTqZqhKyWN2+xVLjDqpAblTYHl0041?=
 =?us-ascii?Q?AaLTYhEdeAktphHvpoQcL462S8e4ixaEg24urqQHMIXgDVw8pcFTpYL41pZ9?=
 =?us-ascii?Q?+XdVqPCqJzG3bW246PI8jaRmiobNaTxrTfhKON55JMx/ys8qe1QEu2lnj7/B?=
 =?us-ascii?Q?yxKs03qMi2YmykkGNimUXqHB9EiVkX80g1kqMlznszJ7CFTnSPHgE52aIG0O?=
 =?us-ascii?Q?XYbyV+v7vsKO3hHBavQ0REezfeL67LydIiufU/3UO6x9XoBv2bTqWTT9M5vb?=
 =?us-ascii?Q?nwmaBgtFkHCHNHWCPAgJGcOjC+Vn2Hu2BAFNKflXmH0dCXGunDA8L8Mj5kaA?=
 =?us-ascii?Q?3f28Qq9qLhHAQbEDemRiQczgS0pQRLycRR5ufdKIh+9B2KuwAoOxa2ImffK2?=
 =?us-ascii?Q?2YHEiqfExGj6IQK3HAPdwpCFKPyoiPQI5tDVovDQxTVIYxyIa0/d0mpA1had?=
 =?us-ascii?Q?/C+XaiyAeh6ZSycXupAYKLhBttLD/CuyFzax7jfbrbC4o8NN6M0bX3T7wF1M?=
 =?us-ascii?Q?YTpfJjvB+wJAPvzNrwTQQpCX4vLqFRIMj2l/ZgIX+v2SGzznuc9349RkDqn+?=
 =?us-ascii?Q?4EtO0cWL7v/QKT8CWFH6FMA6bn83q1hJVLm/APwrqLAPXlzMSj+CT7QMDLsP?=
X-MS-Exchange-AntiSpam-MessageData-1: MctpQsvSsbD3Jg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 54822c0a-c555-43ba-441c-08decdd77343
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:36.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5UvyjYVlCTV/uvvHpOd/7l+0dKAFT1Z0wOCd+s88NQQpzBaNu9aMeK7RBf1YPgpFCbWMltWD/JHsQU4nP6TWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-42698a/1781855439-5C68400E-68852E94/0/0
X-purgate-type: clean
X-purgate-size: 942
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB0B16A472E

Export the mapping between Domain-0 vCPUs and their assigned NUMA nodes
into the Device Tree generated for Domain-0.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f5fd065435..b4783fcfc9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1381,6 +1381,14 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
                 return res;
         }
 
+        if ( IS_ENABLED(CONFIG_NUMA) )
+        {
+            nodeid_t target_node = dom0_vcpu_to_node(d, cpu);
+            res = fdt_property_u32(fdt, "numa-node-id", target_node);
+            if ( res )
+                return res;
+        }
+
         res = fdt_end_node(fdt);
         if ( res )
             return res;
-- 
2.43.0


