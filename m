Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAB9F7A4E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861109.1273105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd3-0008Fj-LJ; Thu, 19 Dec 2024 11:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861109.1273105; Thu, 19 Dec 2024 11:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd3-0008D6-Hi; Thu, 19 Dec 2024 11:23:41 +0000
Received: by outflank-mailman (input) for mailman id 861109;
 Thu, 19 Dec 2024 11:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vR1G=TM=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tOEd2-00089J-4T
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:23:40 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1c334b2-bdfb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:23:39 +0100 (CET)
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:102:268::8)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:23:34 +0000
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce]) by PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 11:23:34 +0000
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
X-Inumbo-ID: b1c334b2-bdfb-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsrQN2OvMcYslLacDdwejwCUYeQWyGjJZ3FA+nYjAK/SeLgNW+j+LL4/nxMMWsmGNl3Bh4eG17asEdGMOtb68bmAgsaE9DbS4YLG5ggdHQ5ofAFpT0r40S2I6T9nFlkUL5Hm71ygOlO0uNXwnZ4+TsAfQVszJkZczdAmtazqaxt1ML6fzDANoIMdAqDq1b66qSd1O+AC+tRyO/xXXumzCkcP86AgMj6BQxGrsCvfBPVtKphoCsDMgASrWjRwV6V/FCc84i42ZWvANIkFql9COVCoA9Mj1xUL4SczAfZ30+c9ktV6lfKf9F0NaG8izOSkDWL4CGxQXWPDvuflVTJgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1CbZ0U6+K5JDrnG9X+0y79bNYIpjNK/9pm/gAmFT+g=;
 b=xLLdVr7+ELiTmmUUY7lCW5yf20PbWVpCTrlcVg/KqFs3L/ri/KewWNpeudJOXNwEVQmFixj1so645QzVFJh/P8Zr8fhFFzqsMUME9wGBHAeLWLe+BY3gyV3VHvd3rWKvUF45Ok5ofuM4u0vNFvuYL4ido0kpCFxsHuBOhv8Dp26erOORWiuB79t7kFK3kkjYBUvKksGvGvmtoQZqgWkUEk6LBLlPo+UuGylwafLiFpST5FNtfdkVIWwJj8K/V7n0tqCc3Ldjdeqq9eJZLixnCc5mJ5ik0FVRjz1RAG7aQwbSDQGydX3dPZBkmxsxlLQL/k5vhm8yrLmhZ4AVNzFIFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1CbZ0U6+K5JDrnG9X+0y79bNYIpjNK/9pm/gAmFT+g=;
 b=Vxxe0GtS7kmxt3OmPJNR5YvGbWM6du51/GXdIdbMVbW0KzyNmb9A2PYUAv96H0ReCNRuTamtzKO/oTP5YigHMq0rQBbKn8p7Tv3cnte/DwtHUg5++/akba4P1COXq+BrufLOx5plFatyC4AYjnSGZPdagTfpozhHv1XEVtVgJrcU7MvsXW+nnQnAMQ3ipcswG9Mbvimb3YwpnZJdyQgoz1RMCiGcOkjzRC3L7kOp3Fg2siawIt1gA/g9B7ONqjYBp+9r0c5n+8rt8ay6QhqOB4eRMzRES94EVv5XLFTQdgrHQZuFdiaZszjJjSSQJ0jLyke2pbhHnNTi6R0axLiSVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/6] xen/arm: firmware: Add SCMI over SMC calls handling layer
Date: Thu, 19 Dec 2024 13:23:10 +0200
Message-ID: <20241219112315.2461048-2-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To PA4SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:102:268::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4SPRMB0023:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd80c8b-fe9e-468d-34bf-08dd201f9310
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?079cA5k2B6NNOKVdYDdf2lu4RveChMdDwMTnR6gFHnoIJOZUOMR+m65/z5Su?=
 =?us-ascii?Q?WrP0JbYuIv1THCBT00IO1L9W5KmASwxutCkwfp6HJqnl96rEXCliYxEDwuAu?=
 =?us-ascii?Q?ZGDL8nvGmLVOePOuBN3BIPDszEka3aCQHeSYlM7MpWAkI5bqWUpDlHPiNxot?=
 =?us-ascii?Q?YK0wSeIgMD7ub1DryrzIL4XTZY7dcuVGGtNFMGeRc6BmVfFT3+m8JBpBUMdE?=
 =?us-ascii?Q?pRvivqAr7mlij/Kmw83jjoRxpvZGWjwYv4S2kAd2Y9gf0f58evi4VlUjIYoh?=
 =?us-ascii?Q?ivV1NhD+5mpjYN4vaMpHqAoWjeM2d+pDB45SrKg238o0Xe6c9Vvke4125KXz?=
 =?us-ascii?Q?QY6JuiyPe5y1cffbLIAJ/tAxWS1ky0TOdEwUVohKES8TwQ74EqPuTzE3n5ab?=
 =?us-ascii?Q?nR3e6enbcAc4HukbtufMzYJxJq2gC/K9GhS2cGJPi0PujkPYShnhrH7EfLVY?=
 =?us-ascii?Q?MHoyVZaf2KQl3Uk1IIYAezr5vSH3OgYNgwQnZK1+ch6hgeqLV9ojaVDXxmFJ?=
 =?us-ascii?Q?JUriXDnXZpfkh+Qel64/BiNr2I0fz/9DvURUyij+gZ/5RrH4VGBiOSpVGc0d?=
 =?us-ascii?Q?yiPFhhAJlnK6346/gfv+F8vxKvnk6PGL0yNLNn6mEOcqHRhi4D7E3pDTZKNI?=
 =?us-ascii?Q?r47RcvPRYR7B2jHicM/djW0kMdYBWzMTJjwQSR9+I3gaAB7aDKanFcwAeyTN?=
 =?us-ascii?Q?HA9XVdQ0NSBRoy0HdaENPdpXvX7ztOFR0kXOcIAuD5038Raloh4G9BpO9qPw?=
 =?us-ascii?Q?jAbFwCjQl0LZDOMJCOO0uBVSFDBCgJYPHujGAs9ZoA91bOaLRf7I8xC0TVr+?=
 =?us-ascii?Q?JtK2rJNMqztoaoq97OYgT8JnlVSiSG5CGFE2FfEimjYUrwApRcSZ0E7Agk2l?=
 =?us-ascii?Q?tJuK4Ao1ABDqRDPLpRnHfs7idYQVSa+GFUcIEWru/w7T8xl/24JQhLbYsoMe?=
 =?us-ascii?Q?scYwhnt1N0Mz8CR07ywV4tlDdORZJSAcvfzQoaD08F6Y78cclkqQB7L9Orva?=
 =?us-ascii?Q?G35oLgDoNiUG+TPx96lMERxJKpcy6Ehqf4MItYFCjzCUj+7NGLAjDax1hkPu?=
 =?us-ascii?Q?IIk7ZQ3qdHh688g26oiNFUOckfMxQtmP+S2mUz9CIsac2E61CKFT2cdfD10a?=
 =?us-ascii?Q?+kkb74kIMulMNB1pghN3sjU0pblriwcUOHyUfGrKzQ3IOYsHmlCaxRsNQ6JO?=
 =?us-ascii?Q?LtpnZpaSXxVeepS14Y1mZ6YDci+WAGNUoeDbuDl+7SsovnzNKhd6Qvt8tR0T?=
 =?us-ascii?Q?y8Bpe4S12h9HIYxKc2th+BRwrnx0U05QD3X5Y7pPmXVMz17+8oD4f6HvlZS3?=
 =?us-ascii?Q?Vfn7YV0m1xQ5Pw20B1nti5MKrXdH2qYVvNOJ+C6hwIyzW/vldu8G0yi7w9+j?=
 =?us-ascii?Q?Z/qn3LhK61N61c9/EunhiI7DtI3E7oFrozoYlmUZj9E4u3Bj3GkkKS2UAHUs?=
 =?us-ascii?Q?oAKcCVViubRQ9YNMX+IAeWm/JrmGNlbN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tY8RuJXEi+eMHOHerqIBZ4Xk1bS+oJcEs52uhXruNJ/EbCaGJ4ZtzaGaAFR8?=
 =?us-ascii?Q?CeFpPcLckMuXA7eU4gCJeOZT2sXSWdT/HJ4YN/PyU8XZRqLArxcueTG9uMzl?=
 =?us-ascii?Q?JtDaOEOO2kWEWBHSMUHKWuFcJnTOZ1AHB17vj4tUkl6+zjsHMH2h/tFCwnXm?=
 =?us-ascii?Q?mqTPL01vifSlL3ChX/KDw1hB0+Te5oOpn33O0Ax0L48PLm32V31nqCG0RunI?=
 =?us-ascii?Q?XWdvmXzK/5jsvyn+1e6phZ3rZib0lt05lppuNuxAOYTuG+M6qOD1oh86eIds?=
 =?us-ascii?Q?AxURv8PfBuPtRuLWfVxiesz3NyzosXfPjTpxgju7YJjzisl3Hmkta8h+8udF?=
 =?us-ascii?Q?UcAk2sYr/ZHtiNImJdbaQk5ISLjXJL+mQyYt92td8oMI+MmWuijklTqTkSdA?=
 =?us-ascii?Q?HJlLifHydI80og+5DXHY63do/BOFlga5cdyHnW7K4dNrG+nfreCN523u5PqA?=
 =?us-ascii?Q?ZQAtl09cndYD9FQeG/eDPafch3flzsNCXAK3qWqILswK4uM2Sa/aLCrKiUd/?=
 =?us-ascii?Q?5D5QF7m7uZmoGmMJNv1XOW4NNpWe8N1/eiL+eI5ed4ZxII5OwpxXQbI08n1v?=
 =?us-ascii?Q?fYuwl/KKHrs1VMM4vnZphYugrYfOpAx7qYmgDaohhDsVB9nY/f/bQxsXm9+N?=
 =?us-ascii?Q?gmWctoMyR9vxEhQMAANklhq0rN2EN/A7UubTWUud1Bj+bLn++KEUR9aZcF7Z?=
 =?us-ascii?Q?KE9QIK3MGbMZetjPQI583+zADwy5Cch9kUO43V8+fF0VmKakGfWC8PKtGWSt?=
 =?us-ascii?Q?JvPXoMa8/KfRWDaBJjz436NAXC8f5aCACvuy+SAlyesQ6H9tfEXi+VvMXfTe?=
 =?us-ascii?Q?/kXAywztV9H/0BzdPzE4U9K4DZrKSTtCobMUPGh4c5cokd6pT9xn2s3Yh/g/?=
 =?us-ascii?Q?RGdp/zvWywq23ZVfLqXryPIGbL9+M30mlg04AqwT+Az2zC0amXmW7prcCV20?=
 =?us-ascii?Q?Vk99pyuVF600McM8PfZ1E17HWBEE1ScV41kzUVHn8wZo8r7RTBZsS2upWXkd?=
 =?us-ascii?Q?wafwJELCVDPAJIMNdEYk2CYENi6Jl8cDl5jbFlW3/7d45WFmjQAaOiwZRk8E?=
 =?us-ascii?Q?mkigCnS2YK0C9h+yL3XcvurqZN19kGkfbJiugmgMvKWm8sxpbJgM4I4+mHEB?=
 =?us-ascii?Q?cZa0Efmvj8A6CCH8/B6y2wiMHDUjv6jeIhlZWymntlIRZNqFlTt7bb7NLc6V?=
 =?us-ascii?Q?HvdPpieXWng7qAE5nkncn2NZO3tpP+sB/9Oc9EieMiwvBg1wMLFG14t8vEPe?=
 =?us-ascii?Q?MiCMv6oUJQHHaXx+EL73cwB6E7Rk52/PjPkiR8+H/71JdYzNu/P45juLCHBf?=
 =?us-ascii?Q?BMN1k3yd5sNhTVn7EB+Tc1WiaY0veZRyJKifm58oxqalth9k96wb7Q5ez9ay?=
 =?us-ascii?Q?Jkx8deF7bK9NZWdgZzN+IhAkNdSAY9KX7aMl6bmYaS0h/oU7aEHuwW4yK7RR?=
 =?us-ascii?Q?rB4IJUGm4ws76RB/DdZTCafMXgfhlXEYTOcmn3KRRO2mhcKurfVMaq6sbhlj?=
 =?us-ascii?Q?1UOdJHiz7UBIJC/v/OiwFRWI/+xBiLY7NI3m5LIxHgPUo8cQF7iWTh4joYpZ?=
 =?us-ascii?Q?+dVGoEDUsNimbu1qxvmCiqAh8ZZtQ2ycEp3kIYfDqFHxPsUrolit12JPZYQQ?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd80c8b-fe9e-468d-34bf-08dd201f9310
X-MS-Exchange-CrossTenant-AuthSource: PA4SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:23:34.1397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYgIk0NJj2thMVHZtQ5vu+i3GMjVQ6iPLr1nBZbGkFxwieZY+QmmnEk7HyAlIZXIvIE2M2qBK1ZZ5s6fsqlMwwnYtjcPMRdTBI8OSdhUK0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Introduce the SCMI-SMC layer to have some basic degree of
awareness about SCMI calls that are based on the ARM System
Control and Management Interface (SCMI) specification (DEN0056E).

The SCMI specification includes various protocols for managing
system-level resources, such as: clocks, pins, reset, system power,
power domains, performance domains, etc. The clients are named
"SCMI agents" and the server is named "SCMI platform".

Only support the shared-memory based transport with SMCs as
the doorbell mechanism for notifying the platform. Also, this
implementation only handles the "arm,scmi-smc" compatible,
requiring the following properties:
	- "arm,smc-id" (unique SMC ID)
	- "shmem" (one or more phandles pointing to shmem zones
	for each channel)

The initialization is done as initcall, since we need
SMCs, and PSCI should already probe EL3 FW for SMCCC support.
If no "arm,scmi-smc" compatible node is found in the host
DT, the initialization fails silently, as it's not mandatory.
Otherwise, we get the 'arm,smc-id' DT property from the node,
to know the SCMI SMC ID we handle. The 'shmem' memory ranges
are not validated, as the SMC calls are only passed through
to EL3 FW if coming from the hardware domain.

Create a new 'firmware' folder to keep the SCMI code separate
from the generic ARM code.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/Kconfig                         |   2 +
 xen/arch/arm/Makefile                        |   1 +
 xen/arch/arm/firmware/Kconfig                |  13 ++
 xen/arch/arm/firmware/Makefile               |   1 +
 xen/arch/arm/firmware/scmi-smc.c             | 162 +++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h |  41 +++++
 6 files changed, 220 insertions(+)
 create mode 100644 xen/arch/arm/firmware/Kconfig
 create mode 100644 xen/arch/arm/firmware/Makefile
 create mode 100644 xen/arch/arm/firmware/scmi-smc.c
 create mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 604aba4996..23dc7162a7 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -271,6 +271,8 @@ config PARTIAL_EMULATION
 	  not been emulated to their complete functionality. Enabling this might
 	  result in unwanted/non-spec compliant behavior.
 
+source "arch/arm/firmware/Kconfig"
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index e4ad1ce851..8c696c2011 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
 obj-y += platforms/
 endif
+obj-y += firmware/
 obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
new file mode 100644
index 0000000000..817da745fd
--- /dev/null
+++ b/xen/arch/arm/firmware/Kconfig
@@ -0,0 +1,13 @@
+menu "Firmware Drivers"
+
+config SCMI_SMC
+	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
+	default y
+	help
+	  This option enables basic awareness for SCMI calls using SMC as
+	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
+	  compatible only). The value of "arm,smc-id" DT property from SCMI
+	  firmware node is used to trap and forward corresponding SCMI SMCs
+	  to firmware running at EL3, for calls coming from the hardware domain.
+
+endmenu
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
new file mode 100644
index 0000000000..a5e4542666
--- /dev/null
+++ b/xen/arch/arm/firmware/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
new file mode 100644
index 0000000000..33473c04b1
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/firmware/scmi-smc.c
+ *
+ * ARM System Control and Management Interface (SCMI) over SMC
+ * Generic handling layer
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2024 NXP
+ */
+
+#include <xen/acpi.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/smccc.h>
+#include <asm/firmware/scmi-smc.h>
+
+#define SCMI_SMC_ID_PROP   "arm,smc-id"
+
+static bool __ro_after_init scmi_enabled;
+static uint32_t __ro_after_init scmi_smc_id;
+
+/*
+ * Check if provided SMC Function Identifier matches the one known by the SCMI
+ * layer, as read from DT prop 'arm,smc-id' during initialiation.
+ */
+static bool scmi_is_valid_smc_id(uint32_t fid)
+{
+    return (fid == scmi_smc_id);
+}
+
+/*
+ * Generic handler for SCMI-SMC requests, currently only forwarding the
+ * request to FW running at EL3 if it came from the hardware domain.
+ * Called from the vSMC layer for SiP SMCs, since SCMI calls are usually
+ * provided this way.
+ *
+ * Returns true if SMC was handled (regardless of response), false otherwise.
+ */
+bool scmi_handle_smc(struct cpu_user_regs *regs)
+{
+    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
+    struct arm_smccc_res res;
+
+    if ( !scmi_enabled )
+        return false;
+
+    if ( !scmi_is_valid_smc_id(fid) )
+        return false;
+
+    /* Only the hardware domain should use SCMI calls */
+    if ( !is_hardware_domain(current->domain) )
+    {
+        gdprintk(XENLOG_WARNING, "SCMI: Unprivileged access attempt\n");
+        return false;
+    }
+
+    /* For the moment, forward the SCMI Request to FW running at EL3 */
+    arm_smccc_1_1_smc(fid,
+                      get_user_reg(regs, 1),
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &res);
+
+    set_user_reg(regs, 0, res.a0);
+    set_user_reg(regs, 1, res.a1);
+    set_user_reg(regs, 2, res.a2);
+    set_user_reg(regs, 3, res.a3);
+
+    return true;
+}
+
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
+    {
+        printk(XENLOG_WARNING
+               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
+        return -ENOSYS;
+    }
+
+    return 0;
+}
+
+static int __init scmi_dt_init_smccc(void)
+{
+    static const struct dt_device_match scmi_ids[] __initconst =
+    {
+        /* We only support "arm,scmi-smc" binding for now */
+        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+        { /* sentinel */ },
+    };
+    const struct dt_device_node *scmi_node;
+    int ret;
+
+    /* If no SCMI firmware node found, fail silently as it's not mandatory */
+    scmi_node = dt_find_matching_node(NULL, scmi_ids);
+    if ( !scmi_node )
+        return -EOPNOTSUPP;
+
+    ret = dt_property_read_u32(scmi_node, SCMI_SMC_ID_PROP, &scmi_smc_id);
+    if ( !ret )
+    {
+        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT node\n",
+               SCMI_SMC_ID_PROP, scmi_node->full_name);
+        return -ENOENT;
+    }
+
+    scmi_enabled = true;
+
+    return 0;
+}
+
+/* Initialize the SCMI layer based on SMCs and Device-tree */
+static int __init scmi_init(void)
+{
+    int ret;
+
+    if ( !acpi_disabled )
+    {
+        printk(XENLOG_WARNING "SCMI is not supported when using ACPI\n");
+        return -EINVAL;
+    }
+
+    ret = scmi_check_smccc_ver();
+    if ( ret )
+        return ret;
+
+    ret = scmi_dt_init_smccc();
+    if ( ret == -EOPNOTSUPP )
+        return ret;
+    if ( ret )
+        goto err;
+
+    printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
+
+    return 0;
+
+ err:
+    printk(XENLOG_ERR "SCMI: Initialization failed (ret = %d)\n", ret);
+    return ret;
+}
+
+__initcall(scmi_init);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/include/asm/firmware/scmi-smc.h
new file mode 100644
index 0000000000..6b1a164a40
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/scmi-smc.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/include/asm/firmware/scmi-smc.h
+ *
+ * ARM System Control and Management Interface (SCMI) over SMC
+ * Generic handling layer
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2024 NXP
+ */
+
+#ifndef __ASM_SCMI_SMC_H__
+#define __ASM_SCMI_SMC_H__
+
+#include <xen/types.h>
+
+struct cpu_user_regs;
+
+#ifdef CONFIG_SCMI_SMC
+
+bool scmi_handle_smc(struct cpu_user_regs *regs);
+
+#else
+
+static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
+{
+    return false;
+}
+
+#endif /* CONFIG_SCMI_SMC */
+
+#endif /* __ASM_SCMI_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.45.2


