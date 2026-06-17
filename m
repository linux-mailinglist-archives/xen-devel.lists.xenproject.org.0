Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pEqjLgpJMmp7yAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:13:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357569714B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:13:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=JBS1GEuO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339818.1600920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkRk-0002aR-MN; Wed, 17 Jun 2026 07:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339818.1600920; Wed, 17 Jun 2026 07:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkRk-0002Xu-JI; Wed, 17 Jun 2026 07:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1339818;
 Wed, 17 Jun 2026 07:12:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wZkRi-0002FZ-Ku
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 07:12:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZkRi-00CS1m-1d
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:12:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3248ce-5cb7-0a2a0a5109dd-0a2a4507bf88-26
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:12:21 +0200
Received: from [52.101.125.100]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3248cd-229c-0a2a45070019-34657d648175-6
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:12:20 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OSCP286MB5166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:34e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 07:12:16 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 07:12:16 +0000
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
 b=c/h2+bgeqLbEgFpdnSBC/dP41RVd3zHUjGAc54s3npr69oYHhdEmsFc28yTZg48nKe9Y7bAD/AiYPk08GwtLbOxPN8O0rpZ0cwXenDUepRlRu45XQ6NBmxBIE3mG/t9bgTDfXFlWMPddKcMd3fKFgtzf3P/LAtCaB1NyZO+dPQQDoW3ArsmBgXDRtZUj3rjijCgVzRK/vkXNIBqbrO28Q0QK57Mgph18PY1mkSwDWUh4msiM4V1yXyzRCK03ho8qR/tQxh/J7w8UNXvzuMGku2tzJdhBoFrh7DnAxAFDmVY9yBB+gnXw+BeyZ/jQOltqGwjuJHhK3/wxQgGASoss5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2KTn+T1/dWiIJ4PgQ6w6uI7w9H8uIIvL/CHANCwHAM=;
 b=HUpbhzcwAgFizpBVSHxA9f/pdoIvaF4BCdI3xy5pzbsqoKQMPNbGH4sIXRJFcsGci133Zk6OVHtUiqD5MYRNmDPBcgCuBOCD7nPnIK2ERSim0HvYbzLQp4q2bfJAhocJmsVc2LkE6Dg9DZF4HY1MteyhnkzfiUBQS5nqY7xgugoyEtTJOvo4dMi7a57mn1klVfvI+v4roa+WC4f6Y8mOSYCu8MXlCLQw8JQywlnrPoag/2L7wvMkLIENkNMCi0T81w5rEYaOyTWRU5rin3H1NsCRWKnH0Zf1fzGYapbyTNmoyqyuDU9m8ykaPiB4AcMPVYbLT5n0qSKcEw7hiyWcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2KTn+T1/dWiIJ4PgQ6w6uI7w9H8uIIvL/CHANCwHAM=;
 b=JBS1GEuOTsluwOO9fLpvbFO+8rAKJh7HilzGoEEaneoY33u0HYHzxFrkOrGcVfUPR+t6EeWeRqCivEiU49wNhvp64veBaSz6YyL/xDULT8E/P97ztV2lNRukXpm3Tx1VbpGAWMTY691QvJE8kLAOC7GqlyMdedQRTpYA8U3q5/k=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 3/3] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Wed, 17 Jun 2026 16:12:06 +0900
Message-ID: <20260617071206.265599-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617071206.265599-1-taka@valinux.co.jp>
References: <20260617071206.265599-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::15) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OSCP286MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf16b32-487b-4d7d-fdd9-08decc3fc2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GBxlGdtgOAFVEHmhjWaflITYFupOwLbwOnQdJf9uQLFSRuKWUjNHA1BS7RZ5CMPP9Y6PxIggG6yw690vhoTWC6/LQne8IF/sNHUOM7P2sF2RzICChMsBWMBJlEp+xfFS00Kg8iUmZwM2TEmXe5FjOdZKeu52ccPNXdcXE6tGac3Z+WDuLTMxjxatXMkuTjBdOtg0oKmEiCRuE9Pk/UUxznKPmrv5Vb/5woacqVCY2/wz2d/hOzCM/92bkgYNR+57UybBTSJL0GWLCJsUqxkxC3k3EDJRbJSRPmQl/d9jQcjbMryLgpbUTjMdpw5O0DRMmWuSXY1r3ZqF39m9w+gXzFrM3Vhb9g3pHr1yJ6sqIsVc+O6wGjF+myMiCuqjid86591+KEi6Moruj4O2Cj3S1nMjRBlCbBG/PM4xyZ+QQRJMsPZKTR0bemanngqGDlHeMkzXTByJbgWxWNESLckbOTScn9pmw3Bwqr0wlVlnFVGmrYrUpiA5ROJ5GcQFFCz1XCrPQ9/bHeAO/z9p5q7c8d/dnrXwUChoiJ3sOEesat9wTzGPqS0IMJRnwGd7RBEWNs5yQCe4Zt/MBrgMcy6uwGFY0yZDFI8gp+h+1sMBCpjSwDgYqVxj3WDULxPtzNVlb7UP1yyFJn6LyHTeHEjDrIE1ZRG1T7/qXU1dxV6cgoQ1HQ6QrdrRuM3Lj5xAeKyP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mwH1gbLRUjDdj6EkY8DRgd2GI9RJ6onISq20dtGffA3A6u2dbkR7Xr69rxno?=
 =?us-ascii?Q?mMX4T5gekYDEtB1JZI7Atp0q3CYH74pfJvBP+d9V5fOvuEcKwbCqjlTsnimK?=
 =?us-ascii?Q?RvicmFimEoJ5tuXY1kLQowzbl6kMeNw1fkVX0UPqSRpXIy2G/8aj6t37wCId?=
 =?us-ascii?Q?s+QIJxguDSKQg0ZPSzXeQQ1ITnv9hrBtXypHHbEzRDpAnHkcUBc7EQ8eonpU?=
 =?us-ascii?Q?e2udK9qiER3bHqmVgIRkAR5XZ/YbGwbxM3YnRWS32Skne3UkgqtlfkWct2eJ?=
 =?us-ascii?Q?reb8M2BvgcULOJv7/h9vgnNhj28Wlc6RICLyTnmrG339x5LoIt3lHncRGnqo?=
 =?us-ascii?Q?AkQPE3kWJwizUT9z0uyvC9TYtEiZUQDNnpSjhO5kMlmpjXxJKa0pp9j/fFcH?=
 =?us-ascii?Q?J7L/3t5OiNYCqc3n9GYKNRkkcFOtT4ZXXhn27JzpjsS9DHkkB00Diqcf1Uva?=
 =?us-ascii?Q?Xowq/AdWTOFBVoo7WWKdNAaMqaIQ4PEzYzQDtWzHpKIrBDZslYRvmfVdkGKp?=
 =?us-ascii?Q?uCjHM1UxiCIeVPUJHggYuM/uIh+cZQ/q9TB6szg7f0ZIRiN/WanXFkXxrmZc?=
 =?us-ascii?Q?AMWkuY0YCHEjuaiSwO60mh8pZnX+Bk7ufsRJakedjUgYOSQbXzusMUs4s7HF?=
 =?us-ascii?Q?dSO0vBL/3xv8TCUYbJaCMPjE6i3pv2rKQLacd5KQ75vX5MRgYn+87Ln/GHik?=
 =?us-ascii?Q?yiBLOpSUjGUW1Jcwnqiobw+uSvEh41l7//XQiIZ7zdgbutUPntWg7q1SMJK7?=
 =?us-ascii?Q?7ivGS7CSjkFIQzd4/2WAh90ivm8AJShfP32UKbfMEXilj/HMk3S/iP6T3FLt?=
 =?us-ascii?Q?G7u/jhV8Eo2KS9Cz99t21ABE/Gty5gy8mCBQhQOaX+w+M5GaDJtn3gJSIlfT?=
 =?us-ascii?Q?O3q8TG2CxT6RS8IpRL7wMM+loCD53wzI8nSG8h/QEoDYrIiAEFFO8OBtSZec?=
 =?us-ascii?Q?mwl27jUbHZIcGHo3SGw3sz7RUE2jb56vyz5qpiVFimk1ld+VhnTXh7YtrT+B?=
 =?us-ascii?Q?YuwfDEQidyWLVjThX/+A4KwO8m6Bf2bJjJBAFDaff2xJEoS00gJEJV66H9NU?=
 =?us-ascii?Q?4IP0jnBKCHL6UlDbVheOSTXGfIWBsv3aZNgIpXq2ZOxgTYPBIaqoS0HbtNEC?=
 =?us-ascii?Q?cOwDPF0z/3SUyOq5Y4RM6AUKP4vtl1zyqlJpbceLIFURGPrcTenKInEKYrNQ?=
 =?us-ascii?Q?v2Oys1PTkmYD4FJCTi80b2rQ9ohbm6sOXrd2g7VXrozw+LgJbbvzLOyOXrGx?=
 =?us-ascii?Q?zR02ueluItkJ4U6nU5qFFuudDFbpaRFNouvK+bWe7ilfDDY5Q1OEr0kXf04p?=
 =?us-ascii?Q?6MQE0nwEIhSJgUiidiCgJiNNEAiIOVwJ8m7BReT4IjobO1BklIs20CuZYKNc?=
 =?us-ascii?Q?omsrqWYyFXQ36Goc+9XG6/9FAIkHf/2xUwM2fuh+zxG4ZQeS1I9Rx1b/sTNs?=
 =?us-ascii?Q?QT12QPmuzqWNBpkdUWRiNTNIKyecXBkDS/jIO8NHOiKQOLhxKvFBQUDJMDp2?=
 =?us-ascii?Q?QemQ1OSKnlY/64s0Fb48Sy8fIXfvp5EIXqpv1NoiQddZUS6ZnUzGFolJxzWz?=
 =?us-ascii?Q?JU+o60XLf4wkWSocun/JK+TOKSF8r8cxrqdP1X2zsIbr4r1vsSfgWCEtyqvD?=
 =?us-ascii?Q?OUwLnDr6bSklZBBLJYJyB32GCJuiGr9iay9kcR9xcWIr3Svu2qPDWGvdCRTH?=
 =?us-ascii?Q?oYOKcyY++UbxhK0ZM3AYoSNwW6yiUkcb9Boutyt7SDgEqaCbdYnp6wQUf2Cj?=
 =?us-ascii?Q?xlfFoLrO8VX8PUgzl0STNjv15bbLszLTDz6KrIZazIl5U2xncFzMtBeKDyQE?=
X-MS-Exchange-AntiSpam-MessageData-1: hQ3eQB43x2EPIA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf16b32-487b-4d7d-fdd9-08decc3fc2ed
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:12:15.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8HoE2elwqm7fwW+Zl8Lp9UioY6ANjBC0M2LqkicMajv5lkOD434BtBkVaQMQwoDaVeLS2yudG8TjKeH/8PezA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5166
X-purgate-ID: tlsNG-ef75cf/1781680341-0A971C48-C0205E46/0/0
X-purgate-type: clean
X-purgate-size: 3169
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6357569714B

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/common/sched/credit2.c           | 22 +++-------------------
 xen/include/xen/cpu-topology.h       |  2 ++
 3 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8ca6799a81..9758060129 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index cd8b7212bc..7623e57549 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -29,22 +29,6 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
-/*
- * TODO: Abstract this properly, and figure out what Credit2 wants to do with
- *       the fact that x86_num_siblings doesn't even have the same meaning
- *       between x86 vendors.
- */
-static unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-#ifdef CONFIG_X86
-    return cpu_data[cpu].x86_num_siblings;
-#elif defined(CONFIG_CPU_TOPOLOGY)
-    return cpu_topology[cpu].num_siblings;
-#else
-    return 1;
-#endif
-}
-
 /*
  * Credit2 tracing events ("only" 512 available!). Check
  * include/public/trace.h for more details.
@@ -882,9 +866,9 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
 
 /*
  * Additional checks, to avoid separating siblings in different runqueues.
- * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
- * any similar concept will just have cpu_nr_siblings() always return 1, and
- * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
+ * This deals with Intel's HTs, AMD's CUs and ARM's SMT. An arch that
+ * does not have similar concept will just have cpu_nr_siblings() always
+ * return 1, and setup the cpu_sibling_mask-s accordingly, and things
  * will just work as well.
  */
 static bool
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 3fdbc25e8e..3f748f0384 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -24,6 +24,7 @@ void init_cpu_topology(void);
 
 #define cpu_to_core(cpu)   (cpu_topology[cpu].phys_core_id)
 #define cpu_to_socket(cpu)   (cpu_topology[cpu].phys_socket_id)
+#define cpu_nr_siblings(cpu) (cpu_topology[cpu].num_siblings)
 
 #else /* CONFIG_CPU_TOPOLOGY */
 
@@ -31,6 +32,7 @@ static inline void init_cpu_topology(void) {}
 
 #define cpu_to_core(cpu)   (0U)
 #define cpu_to_socket(cpu) (0U)
+#define cpu_nr_siblings(cpu) (1U)
 
 #endif /* CONFIG_CPU_TOPOLOGY */
 
-- 
2.43.0


