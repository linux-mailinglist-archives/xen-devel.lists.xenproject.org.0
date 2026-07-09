Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B4gGGYsbUGrItQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F3735F0E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=hGotgJEe;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358610.1612655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwt4-0007YD-3A; Thu, 09 Jul 2026 22:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358610.1612655; Thu, 09 Jul 2026 22:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwt3-0007WA-W9; Thu, 09 Jul 2026 22:06:29 +0000
Received: by outflank-mailman (input) for mailman id 1358610;
 Thu, 09 Jul 2026 22:06:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1whwt3-0007Vh-9E
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 22:06:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whwt2-004Qfb-ML
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 00:06:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b2a-2eae-0a2a0a5409dd-0a2a4501accc-38
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:28 +0200
Received: from [52.101.125.136]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b62-3ea4-0a2a45010019-34657d888760-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:28 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYCP286MB2431.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 22:06:24 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.016; Thu, 9 Jul 2026
 22:06:24 +0000
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
 b=hxdBvyqKdu3QD+lJKCFPtK7hPdssa6jgwtf/7Obes6NK5T+C8h7jBmE1H1nz+imGppnCRPhTyDsu1dyVfFxkmFQjbtqYm+DeGVzwdE2EZtjXvbfhe7D9Z+/jBYHAph6i354xOlQbMTyxbfPwFYCCwIrg1j/ap14xV9kkvDBPW4tZUtdW8c6b1ItiR6je1W/P/HFeYv/9p9MdmwtaQQK/qp6Mar49cQVslUz85NSIqF+Xzc9dcADctTQhqOQE+XQ00ncccfmiy4JmUn0tsQ0zLvr7LVW+RPqA1vio43FpKbdAkTJtYrYs4QwL3j2mTViyVw7Jp6MvkQQTDHitglds+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHLTHYhQn87WMtZCHSNKRQZGN/vrbyKKjK5gg/fIUwM=;
 b=LZzMdticrHg73welDCuh5e6QS9uQ/zk3m4ztyWudKSAI8nhQbt7da3V3LC5L6fZf9eFRMUSuWlUjoLeryFj1kkxyTOglIg27h4sVRNIqw7tKGxngGLV0DzZ1vG62XaJO4z80/gVgmtXjlHBKOFsIUBrOl81wbNnkDvpTg8rmX5mgo5Vfx4/NhahuTgrdg+MPV+sdElys8O15ypftQ8R8YMYZa1T+Zl5PkWQkh3U8UwfHLBKgj0jy3xxtpycsbEFPkjxq31tB2Gx4zJirPsTZtqH6UktYV9xdksn5Q1QrZDo1p8gKLvlQpkBnjYZs8uXD94h9BnEsRGBd3ucS7boLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHLTHYhQn87WMtZCHSNKRQZGN/vrbyKKjK5gg/fIUwM=;
 b=hGotgJEeCCOqoKCal/4lbJuwG4czNQ0u5X+8D+6UiJ823rc05R78o5Nf1TovpCy8E0ZbEk/bSTdShzmDwJsON+SquxEo2KxgbM90SxM5+5Waebz5M1O2qUAu+BOCEWeH0HgShLdsaG1K3O57hXXIqPDfLdMfuRCrb6NwG8wtSW8=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 4/4] arm/acpi: Parse PPTT to initialize CPU topology
Date: Fri, 10 Jul 2026 07:05:52 +0900
Message-ID: <20260709220552.646462-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709220552.646462-1-taka@valinux.co.jp>
References: <20260709220552.646462-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::11) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYCP286MB2431:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d8eef6-2abb-4dfc-7b55-08dede0650ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|366016|1800799024|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1ERX4ZWaaa+KEAZ4TH15H8FITJC/4T7WT94nFPIh+LvLSeInC8jnwmULM28m/CP4q2X08K+oWP42CgDyqrpRZPTHh1ot1AXWkzTd5q6N4bbr597layC1+U1EEMXkiopDdnw9V8hGJ3Rvg/00aWLrn5qckJ2WC9tTztWBwMNgt7m+K+rqkCyQiji2sPTkdgM+FBX8oXnsWqmptQsghFMe7rLewthnbL/sCwd8UKoCv56+WAQCv5zWsqpyO5wbz81kgVXIjIQ8O3q34TwHKX2MQ5WgwgxdxV9MEWlv2KtLao2CZ9Bf+zIeBUb70Xh8TWs2hDo5HcqWQ6sV5y7WwAFgb/PA4xB6svDiyoNvYpcDR5NwFl0Q1akFeiaVLrKJ2DslqrEd0l0JFXJWdvKRNfGGSRsTGMOVlsjQ9krZ5xwBMN64Y74k2i/5WT70q3hKfvIxyXrAwlwROoJDpCjdqzuh6kdwd2Y/dJmNJ/KOEBejjaznSguKiF3lSnq+6CfPSfnGvQrc3WWdtv7esA9QZozkr5z2OxtBJt8BqqRmB1hGa2DppkkqkZ/qcHCRYBJvGgZBEp/Cz10I2wLUEHOrilYj0ltQShl0Qo3/5RbvQgCmNDCamruRi42ct4No6GRcVADaQc31g8hiQM0cG1keK4j0RfGTMqshXDT0ez0z0Wiwetk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(366016)(1800799024)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5q5cEmRGKd8P/u0/liwr7faMN4ZLhqaCyCeU1eWuRscxphKo6f3Sx39uelBD?=
 =?us-ascii?Q?MjdV2VISvOlKGRwqJAGuQdlWH1+kM+lLH/zIBUzNmnV48GAHKr3DNn+18GmD?=
 =?us-ascii?Q?3z2ToDtdokTn3eJ5q5W7gz8ecUkEAo4y84gvIWDaOt9Jj1b02NWUu5x+Xeau?=
 =?us-ascii?Q?MOJIfD5+KV0wmk95qSY41Fm0LudolnhuiTmdtQlS64IjJ+CIUNxZ9BXmI1zK?=
 =?us-ascii?Q?/G5xSzOTk89RXERggZIld+6lzVNOtY5zPwapSK0AsVC3DvogfIfX8eWSGDBQ?=
 =?us-ascii?Q?Gt+nufKmfKSaXGHOrrzNE6b3cmgn4Yah39eRRUlGGERhTfICiB192MFELvuJ?=
 =?us-ascii?Q?dDSIOcPzCIHHG/+oMG2ILIbXfvxEFIX7UxxgL+WWEpfU2aPjdyn1DchZtV8G?=
 =?us-ascii?Q?gzDcA2OZwJJmK8dFAKndO6dEEVI3y0eQCo6Ivh9Lmaaq8EASM7DSR28Q9XBq?=
 =?us-ascii?Q?D6XuI5JTrM5YACtwcSiAym37hj4k9XdXISSbh5gE1uzAyKVKTketYgVlbQPy?=
 =?us-ascii?Q?ZUmJNSeWh2h64bcIVsLVE/z+4HtFq31DOEUw2q4V7EsAZbvO3NsSq2ewrOwd?=
 =?us-ascii?Q?DJio0L5c+tsJTeY1EfhVOhhkDal/bIsaUIeML3FjY5Pisp/PFcqsxVWDWgaZ?=
 =?us-ascii?Q?ae9oSUZX962mcHM10PCKD0Mz6Wc5PJjbNZ91lRKSxVTwTJdZ39bg2MXloz3R?=
 =?us-ascii?Q?kb0fulhoTqpvlibU91onb39QACgqxUXvhy6FZtHFZKi7MCFglgVDl9150Rdk?=
 =?us-ascii?Q?k3Z8DA+gg8/YLePE0XBWB8C5IP1miRJVeQ+cI5GyxxN4+ylPgJpzTW22gp/2?=
 =?us-ascii?Q?0R4wy0z+InDmIN1emA9VDQ82BQbfSr9+yLlbMcxIWz9bKJNDYKmN760Mr1cJ?=
 =?us-ascii?Q?IEadbMCrxkOY84DM8RBX8EVMIWQpW3LWwgFdvQEDNAX9K5bexRS5GYIR3kBX?=
 =?us-ascii?Q?+8KJVMTDDh5HFSWDiILfdd1QgVX5L0ripl45FBPmDaevAcLJJAu1Y7D0yIkX?=
 =?us-ascii?Q?Nu6LMCRCOVEKflmJwDdKZZc00MR9Dn2J93MYZgSxyGP9uxT5ESer1ttrQnJu?=
 =?us-ascii?Q?Msmhlyh55NW1Qi1KtZ0v6AJYSeWTQdTjNevPE1KEa269rbFRZDBDvB08UapY?=
 =?us-ascii?Q?waTVkM15uraO9F2Sj6pTRcSzG61tIXBSPEqJ85wLdLZWVqia/ReE4TzUlxfs?=
 =?us-ascii?Q?XYZvYO7FZneRFYA68x1sHCCJ0FgbwjFVSMU4DxY6Y4EaL1bwm5eLbrHmrbdP?=
 =?us-ascii?Q?9O8lvy/xsdDBUO0HEvx7D3KOjiQiOjtCElkwaVVSOvPnuqpYd2p/yNbxdOjU?=
 =?us-ascii?Q?X0hGIbBzfGKGISSwbcE7j0S+uCZFdlYS6J/2j5JJQBmgpLiMLjiPyW4uOIhQ?=
 =?us-ascii?Q?9eOvfLiZfbYUZty4bq0VNSaQpGehuT6Z1BrLKHt6LKmtQNDjG907iOPVwFKO?=
 =?us-ascii?Q?XFf81cMNq290jyP3yPu6zQIPpguXOR54rzyePj5otEy5za2RJPfUVk9LPj+t?=
 =?us-ascii?Q?gWOYt9vqEE9Kodnwu8Frh+Pk1zBv/+N7Te6gC5pbVxXvTGDKgEuhSe46odIB?=
 =?us-ascii?Q?nZNvMfWfQ6jfaCtKEKtrke+ncZ1rhwKfj0wfwaiMBsdKUDnWy7RudqGcCXx7?=
 =?us-ascii?Q?KKOzSYa3tSPq/e9rd/OrgkyJYFck0X5xJd12WSC0QVHno88tY2CM8RiPUukJ?=
 =?us-ascii?Q?IFRabq/vl/xwMk27Pxd2VLh8xkRJRmLnXtlkhFWQ6skQNndCxIys41UyDcp7?=
 =?us-ascii?Q?uy4aa56deauw4IbDWhkcGa9DCigHy4Ryxoga836MaWJDB2/lZlBLsxULzScu?=
X-MS-Exchange-AntiSpam-MessageData-1: m/B7eRm3RT56Xg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d8eef6-2abb-4dfc-7b55-08dede0650ba
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:06:23.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COi8tdjQjOhynp7FhVeW4nqW3xto2OR/a0AVZS0W3wcLq5xXp9ttPBWQc4ae2khl55IlZYgZ3/GTpnTXxEfDXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2431
X-purgate-ID: tlsNG-d62444/1783634788-BA4F30A8-33A417A1/0/0
X-purgate-type: clean
X-purgate-size: 12306
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B53F3735F0E

Parse the ACPI PPTT (Processor Properties Topology Table) to
initialize the CPU topology.

For ACPI 6.3 and later, the ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD flag
is checked to determine the presence of SMT. For ACPI 6.2 and
earlier, CPUs are assumed not to support SMT.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v5:
  Extracted CPU topology information from the ACPI PPTT.

 xen/arch/arm/acpi/boot.c        |   2 +
 xen/arch/arm/include/asm/acpi.h |   2 +
 xen/drivers/acpi/topology.c     | 230 ++++++++++++++++++++++++++++++--
 xen/include/acpi/actbl3.h       |  30 +++++
 xen/include/xen/acpi.h          |   8 ++
 5 files changed, 264 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 4ac0fd8f51..fc7ecb5749 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -85,6 +85,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
             return;
         }
         bootcpu_valid = true;
+        acpi_map_cpu_acpiid(0, processor->uid);
         return;
     }
 
@@ -119,6 +120,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 
     /* map the logical cpu id to cpu MPIDR */
     cpu_logical_map(enabled_cpus) = mpidr;
+    acpi_map_cpu_acpiid(enabled_cpus, processor->uid);
 
     enabled_cpus++;
 }
diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
index 13756dd341..b2e156e131 100644
--- a/xen/arch/arm/include/asm/acpi.h
+++ b/xen/arch/arm/include/asm/acpi.h
@@ -61,6 +61,8 @@ paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
     (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
      (entry)->header.length != ACPI_MADT_GICC_LENGTH)
 
+#define INVALID_ACPIID		(-1U)
+
 #ifdef CONFIG_ACPI
 extern bool acpi_disabled;
 /* Basic configuration for ACPI */
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 9155edc0be..37e7c70625 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -5,18 +5,90 @@
 #include <xen/cpumask.h>
 #include <xen/init.h>
 
-/*
- * TODO: Populate the topology information by scanning the ACPI
- *       PPTT (Processor Properties Topology Table).
- */
-void __init acpi_init_cpu_topology(void)
+uint32_t map_cpu_acpiid[NR_CPUS] __initdata =
+         { [0 ... NR_CPUS - 1] = INVALID_ACPIID };
+uint32_t socket_map[NR_CPUS] __initdata;
+uint32_t cluster_map[NR_CPUS] __initdata;
+uint32_t core_map[NR_CPUS] __initdata;
+uint32_t thread_map[NR_CPUS] __initdata;
+unsigned int __initdata num_sockets;
+unsigned int __initdata num_clusters;
+unsigned int __initdata num_cores;
+
+static unsigned int __init get_logical_id(uint32_t phys_offset,
+                                          uint32_t *map,
+                                          unsigned int *count)
+{
+    unsigned int id;
+
+    for ( id = 0; id < *count; id++ )
+        if ( map[id] == phys_offset )
+            return id;
+
+    map[*count] = phys_offset;
+    id = *count;
+    (*count)++;
+
+    return id;
+}
+
+static struct acpi_pptt_processor *__init find_pptt_node(
+       const struct acpi_table_header *table_hdr, unsigned int acpi_id)
+{
+    const struct acpi_subtable_header *entry;
+    unsigned long table_end;
+    const char *ptr;
+
+    if ( !table_hdr )
+        return NULL;
+
+    table_end = (unsigned long)table_hdr + table_hdr->length;
+
+    ptr = (const char *)table_hdr + sizeof(struct acpi_table_pptt);
+
+    while ( (unsigned long)ptr + sizeof(struct acpi_subtable_header)
+            <= table_end )
+    {
+        entry = (const struct acpi_subtable_header *)ptr;
+
+        if ( entry->length == 0 )
+        {
+            printk(XENLOG_ERR
+                   "ACPI: PPTT has an invalid zero-length subtable.\n");
+            break;
+        }
+
+        if ( (unsigned long)ptr + entry->length > table_end )
+        {
+            printk(XENLOG_ERR
+                   "ACPI: PPTT subtable extends beyond table end.\n");
+            break;
+        }
+
+        if ( entry->type == ACPI_PPTT_TYPE_PROCESSOR )
+            if ( entry->length >= sizeof(struct acpi_pptt_processor) )
+            {
+                struct acpi_pptt_processor *proc =
+                       (struct acpi_pptt_processor *)entry;
+
+                if ( (proc->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) &&
+                     proc->acpi_processor_id == acpi_id )
+                    return proc;
+            }
+
+        ptr += entry->length;
+    }
+
+    return NULL;
+}
+
+static void __init setup_fake_topology(void)
 {
     unsigned int cpu;
 
     /*
-     * Generate temporary cpu topology information for now.
-     * It assumes that the cpu doesn't have SMT and all CPUs
-     * belong to the same socket.
+     * Generate temporary cpu topology information. It assumes that
+     * the cpu doesn't have SMT and all CPUs belong to the same socket.
      */
     for_each_possible_cpu(cpu)
     {
@@ -30,6 +102,148 @@ void __init acpi_init_cpu_topology(void)
     }
 }
 
+/*
+ * Populate the topology information by scanning the ACPI PPTT
+ * (Processor Properties Topology Table).
+ */
+void __init acpi_init_cpu_topology(void)
+{
+    acpi_status status;
+    struct acpi_table_header *header;
+    const struct acpi_table_pptt *pptt;
+    unsigned int cpu;
+
+    status = acpi_get_table(ACPI_SIG_PPTT, 0, &header);
+    if ( ACPI_FAILURE(status) )
+    {
+        printk(XENLOG_WARNING
+               "ACPI: PPTT table not found. Topology fallback will be used.\n");
+        setup_fake_topology();
+        return;
+    }
+
+    pptt = (struct acpi_table_pptt *)header;
+
+    for_each_possible_cpu(cpu)
+    {
+        unsigned int acpi_id = map_cpu_acpiid[cpu];
+        struct cpu_topology *topo = &cpu_topology[cpu];
+        const struct acpi_pptt_processor *proc;
+        unsigned int level = 0;
+        uint32_t thread_offset = 0;
+        uint32_t core_offset = 0;
+        uint32_t cluster_offset = 0;
+        uint32_t socket_offset = 0;
+        bool threading = true;
+
+        proc = find_pptt_node(&pptt->header, acpi_id);
+        if ( !proc )
+        {
+            printk(XENLOG_WARNING
+                   "ACPI: No PPTT leaf node for CPU %u (ACPI ID 0x%u)\n",
+                   cpu, acpi_id);
+            continue;
+        }
+
+        while ( proc )
+        {
+            if ( proc->flags & ACPI_PPTT_PHYSICAL_PACKAGE )
+            {
+                socket_offset = (char *)proc - (char *)pptt;
+                break;
+            }
+            else if ( level == 0 )
+                /*
+                 * ACPI_PPTT_PROCESSOR_IS_THREAD is supported in PPTT
+                 * revision 2 and later.
+                 */
+                if ( proc->flags & ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD )
+                    thread_offset = (char *)proc - (char *)pptt;
+                else
+                {
+                    /* Assume no threading support when PPTT revision is 1. */
+                    threading = false;
+                    core_offset = (char *)proc - (char *)pptt;
+                }
+            else if ( level == 1 )
+                if ( threading )
+                    core_offset = (char *)proc - (char *)pptt;
+                else
+                    cluster_offset = (char *)proc - (char *)pptt;
+            else if ( level == 2 )
+                if ( threading )
+                    cluster_offset = (char *)proc - (char *)pptt;
+
+            if ( proc->parent )
+            {
+                proc = (const struct acpi_pptt_processor *)
+                       ((char *)pptt + proc->parent);
+                level++;
+            }
+            else
+                break;
+        }
+
+        topo->phys_socket_id =
+            get_logical_id(socket_offset, socket_map, &num_sockets);
+        topo->phys_cluster_id =
+            get_logical_id(cluster_offset, cluster_map, &num_clusters);
+        topo->phys_core_id =
+            get_logical_id(core_offset, core_map, &num_cores);
+
+        /* Fall back to socket ID if PPTT lacks cluster information. */
+        if ( topo->phys_cluster_id == 0 )
+            topo->phys_cluster_id = topo->phys_socket_id;
+    }
+
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *topo = &cpu_topology[cpu];
+        unsigned int tcpu;
+
+        for_each_possible_cpu(tcpu)
+        {
+            struct cpu_topology *ttopo = &cpu_topology[tcpu];
+
+            if ( cpu > tcpu )
+                continue;
+
+            if ( topo->phys_core_id == ttopo->phys_core_id )
+            {
+                cpumask_set_cpu(tcpu, topo->thread_sibling);
+                cpumask_set_cpu(cpu, ttopo->thread_sibling);
+            }
+
+            if ( topo->phys_cluster_id == ttopo->phys_cluster_id )
+            {
+                cpumask_set_cpu(tcpu, topo->cluster_sibling);
+                cpumask_set_cpu(cpu, ttopo->cluster_sibling);
+            }
+
+            if ( topo->phys_socket_id == ttopo->phys_socket_id )
+            {
+                cpumask_set_cpu(tcpu, topo->core_sibling);
+                cpumask_set_cpu(cpu, ttopo->core_sibling);
+            }
+        }
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
+    }
+
+    for_each_possible_cpu(cpu)
+    {
+        const struct cpu_topology *topo = &cpu_topology[cpu];
+
+        printk(XENLOG_DEBUG
+               "ACPI: acpi_id[%u] CPU-%u Socket-%u Cluster-%u Core-%u\n",
+               map_cpu_acpiid[cpu],
+               cpu,
+               topo->phys_socket_id,
+               topo->phys_cluster_id,
+               topo->phys_core_id);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
index 636d3f5f5b..48907d0532 100644
--- a/xen/include/acpi/actbl3.h
+++ b/xen/include/acpi/actbl3.h
@@ -72,6 +72,7 @@
 
 #define ACPI_SIG_S3PT           "S3PT"	/* S3 Performance (sub)Table */
 #define ACPI_SIG_PCCS           "PCC"	/* PCC Shared Memory Region */
+#define ACPI_SIG_PPTT           "PPTT"	/* Processor Properties Topology Table */
 
 /* Reserved table signatures */
 
@@ -637,6 +638,35 @@ struct acpi_table_stao {
 	u8 ignore_uart;
 };
 
+/*******************************************************************************
+ *
+ * PPTT - Processor Properties Topology Table - ACPI 6.3
+ *        Version 1
+ *
+ ******************************************************************************/
+struct acpi_table_pptt {
+    struct acpi_table_header header;
+};
+
+#define ACPI_PPTT_TYPE_PROCESSOR            0
+#define ACPI_PPTT_TYPE_CACHE                1
+#define ACPI_PPTT_TYPE_ID                   2
+
+struct acpi_pptt_processor {
+    struct acpi_subtable_header header;
+    u16 reserved;
+    u32 flags;
+    u32 parent;
+    u32 acpi_processor_id;
+    u32 number_of_priv_resources;
+};
+
+#define ACPI_PPTT_PHYSICAL_PACKAGE          (1)
+#define ACPI_PPTT_ACPI_PROCESSOR_ID_VALID   (1 << 1)
+#define ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD  (1 << 2)  /* ACPI 6.3 */
+#define ACPI_PPTT_ACPI_LEAF_NODE            (1 << 3)  /* ACPI 6.3 */
+#define ACPI_PPTT_ACPI_IDENTICAL            (1 << 4)  /* ACPI 6.3 */
+
 /* Reset to default packing */
 
 #pragma pack()
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index bd982ee836..e717f36151 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -139,8 +139,16 @@ static inline int acpi_boot_table_init(void)
 
 void acpi_init_cpu_topology(void);
 
+extern uint32_t map_cpu_acpiid[NR_CPUS];
+
+static inline void acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id)
+{
+    map_cpu_acpiid[cpu] = acpi_id;
+}
+
 #else /* CONFIG_ACPI_CPU_TOPOLOGY */
 
+static inline void acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id) {}
 static inline void acpi_init_cpu_topology(void) {}
 
 #endif /* CONFIG_ACPI_CPU_TOPOLOGY */
-- 
2.43.0


