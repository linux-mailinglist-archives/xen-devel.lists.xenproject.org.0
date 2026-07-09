Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N14YFYsbUGrDtQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B62735F0B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=oTT2dszS;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358609.1612646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwt1-0007K1-T3; Thu, 09 Jul 2026 22:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358609.1612646; Thu, 09 Jul 2026 22:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwt1-0007IO-P2; Thu, 09 Jul 2026 22:06:27 +0000
Received: by outflank-mailman (input) for mailman id 1358609;
 Thu, 09 Jul 2026 22:06:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1whwt0-000756-5z
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 22:06:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whwsz-004Qfb-J8
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 00:06:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b59-2eae-0a2a0a5409dd-0a2a4505bdc4-22
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:25 +0200
Received: from [52.101.125.137]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b59-4f1d-0a2a45050019-34657d89cdb0-5
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:25 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYCP286MB2431.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 22:06:18 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.016; Thu, 9 Jul 2026
 22:06:18 +0000
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
 b=qVmYiHYHZVLlsHsMJx4kxixD9SigNyJG6tnfwwgvNZx5kMaZrLgKh9tLx7YOUhr/aZaV7EHY4pc3BmBGDnReKpWnZqs72NeaTgDRvPTGndpzdOjVDFPPZ7ASUeORBEthW5GKQaq3jv0dfNzJ0FAdrWRDjOAexHWYGRj+undtR2RHMbWDOnsEuxoPheDUv49+6PlceBIJv6KisP6tFdiPpm/XHIiIxMvcH4dz8hEV7k4XjY92L5NfGtIxgutGrcIQ8cOqaI2zt+GpOHTxdi048TeQXdhek45Dr3VZjUTBiH3gcrR/NbFbJySLVoCuk0ELIK90G9tB+2kG6JZhLE1bFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAm3SofYOoDGfAqTUoAO7v7MjFGup7Ebi5VOAsRE4Ak=;
 b=EmSlvO4jS7NtHy3k83dAQGDN0ZhNr24T1Id80NqM+ypLLHkNzQGgCuaeTnKZ9/08ssz02/UcPQSeZJgAkqeaxKW1LSyLMQCH6xbNvHcEycjl3RsgrOJ+bMCTOMvxU9dhGg32RPD14/3VubcvBatdd+wCCrAm4AHmeZnJrmU4T9CdOA2+DhqZY1SfcNisyA40YN5fNidROvhMlNdGQ4lz6yIxraEjy7hCBWst8jSfqZqsV4CsCQ9AKwuXQFsUDE/vVBUlobvMb9rAfzX/wNAk4hBKceng24WHZ3hjGEnZbkl+tCnn7MyZqoZ2qVBfHGl0garbzsCjhdeLNE5gcGA0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAm3SofYOoDGfAqTUoAO7v7MjFGup7Ebi5VOAsRE4Ak=;
 b=oTT2dszSO9yri7vhaCV0DHu0Z88xlAH7AHX2j8HJBlDITQO6qLDLE7U3Sv6Ek4LWwi2AQEZKhmglWDUiVUPeD5g8GygFBzKNWK0NbQZ/+yM6IAbDJM6CtcxHRJ/Ky7oKiX9xDErmQtE+nVVGsC/rtkqBevrmXy7JFJO4oWtFzsc=
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
Subject: [PATCH v5 1/4] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Fri, 10 Jul 2026 07:05:49 +0900
Message-ID: <20260709220552.646462-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709220552.646462-1-taka@valinux.co.jp>
References: <20260709220552.646462-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYCP286MB2431:EE_
X-MS-Office365-Filtering-Correlation-Id: 18652b67-2337-456c-9b89-08dede064d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|366016|1800799024|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FMPVL+ieO6N+UnCS/aXln9NgV5J6sjDaP1lcLai08ObUZL5ppT8uFO8yEar8IRTOQecN/Y7OGQr/u+BFZ9oodx6zEIo9mIQUVr5y2OHZ5OC4qZviH5qkUPbAdLRTZ3X1sAp4Ks7AY5ILNUctLP9p9+mX8kWEqWlfAncq4WkovGrukSpDgOy+9mxwFsaDn6zqPDxBZ3/urJ0J4/uTDU8eEp10M67sm6J4HeEhuPqoRTtt8FCtQN9TOmDMx+x1akvkpcpXRNfaLvGjPIdX+I+/mzn/ViysLcQ21RGHk5wh/QFqZaTT44TI8AJjPcsR/J5A1akb57uTaCLSRxDhdBQ3dSerV2XLT2WsYYOWh9MmQvWzYdC0JowTDo8Mz9LxP2PJTEVt6IO6EPLyifMog5qVW/y+w/cl7+oGu2DrtwTTLgBh4AFNpOZ5WkisKrR71UWskBfbaJSXC416l6Xphdxv4C+3Yo4j/y+bKfKkc1IdLcAl8KqzbcHEAkVBMyaD68d/DsTuy7Ate4OwsMfIrifcS9zGsIcMvCDVPLhaXd/wC94ZQ/M/hIVYxhFGaBDez9kYm67xYk3XFkKr2ikldQCcLWZ5jLuRgaxaTfelIH1Mcjv3Vch8r21skUo9hkf/MXke/BSEg9y1CMGXBOS2PB367vhbXnhMzUigKWgjq1gzKFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(366016)(1800799024)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OA8E8cZca0uU2g3Y9A6WVkwaCGe4km+rukJwPgKlKmb4n1t0AnBgG8+KOMlg?=
 =?us-ascii?Q?3Pxi6okwsUugmUOOeqP6A4Jywzw6D7b8jBRAnP6jDINAiE9g5UTD8BZX+6HI?=
 =?us-ascii?Q?28RpN2XILBx+te8qUHIHatgh07HtWr/lXGJ/AXUD2juB4lTdLRcXHkOongJK?=
 =?us-ascii?Q?T/sGqErv6gdSxF89JLt2V5ur4kd+wrb5q05kiWgssmnPc/Y9XWQsNkfs2IqZ?=
 =?us-ascii?Q?TTTMysmLj/sFLJHKL0ywgtp5A2n7kbhnSUwwnSAXLn7LaFVm+l6fzLlX79mB?=
 =?us-ascii?Q?nIkKwmX2IDT3FrialMgON49XUY/G/warO+lxEEzfmyTAnURwEMLnmluOxR5T?=
 =?us-ascii?Q?NlXxvF8Xrbgb/YuhYn76rCqyCN4lYRCz3whVmlOQcLAUAYicou9bqVg5RMQn?=
 =?us-ascii?Q?Ph3+dpL89kruguqMhtMgeoZAW2PZKfATsthiYlGNo0ghFg2WxpatmAjkm0YY?=
 =?us-ascii?Q?bge5tlFG6iAcqgrNbxXA0TogDHNvu220tYNYCcr6zUlDUEOKQ0YszrF2TYJH?=
 =?us-ascii?Q?uzVxme29Pon8ttBZ/KIrcGI+XcGVkfkC9Nfi4ke60OKqfj3TQ5ONrMX26pgL?=
 =?us-ascii?Q?7J85ZWxlxbkG0xXTYaLxo4vom5U93UcCHbgk8JkV7Rod2KcJIxyDhgt6N7ez?=
 =?us-ascii?Q?ggdY7DRqp/0c/DIqAXx5YktXiMuA1QKzWr8xkgMjWYLsqjuMz2vYXLRIgjd0?=
 =?us-ascii?Q?vXQZ8eHoLF/k66X87d6aTLefh58822RCDYSSpsYHWZqYEk2X2HYNzI4X2tjp?=
 =?us-ascii?Q?OoLx8uRg0W6ARKrnSeAUzCUYaSGZ5QDnSEZuIlazxlrYj/6vh5S8RQhS18hY?=
 =?us-ascii?Q?LgoDtjvW9sNfxkoSAoT2tm1vQLIVt8yNQjpKMmxJ63VwnQfv6mZEAPtu/CNc?=
 =?us-ascii?Q?ml8XUMRic1L2WaS+AybN0j5ITzlbp4JDa7YXQQjFLcItOQj10b3A6Gw+lYL6?=
 =?us-ascii?Q?q4AaMmrWhKfZiQjxYHvJLuHhNu54D6S4FUrrmXLYs5XO8vfdsBd2N2fZ/+dG?=
 =?us-ascii?Q?dtKy2RVMYSTN1eFJi377dl8+0D7E8XYvE2I8a14mnddH74kxuMPXHzoHUBpa?=
 =?us-ascii?Q?DXR+ovw7nrW484XksJwleZLE6CNYIfBCqzMKLPOIhcyV1qU+1OUvYwb8nz20?=
 =?us-ascii?Q?ftsLgQBmNcftcXwZAafDffUZSxGnmkJket9OPJV8SWKfpT5x3i4YHAP0ESIp?=
 =?us-ascii?Q?uhs0ror7hLguVOe4vID1foh2IH5ZyNuHFoQjGYbuD8otw2OntUcmIVRvt0bl?=
 =?us-ascii?Q?PCOpWVz9lRM6qXjcJuUI749c4PWPX/fpiY3tM8oC06cdg0xnCdU4+MXO8Ixj?=
 =?us-ascii?Q?nahLoP3w24U2Pudn2CxKferrg6Aq/76uMP0DXL6RnQv48i5nvhVLR+leBIGe?=
 =?us-ascii?Q?nYsi4WV4iZkXBSAwRnTqlE48Uo16FrsqmP1wPClR6QBm0yggEJxeVGjQRzka?=
 =?us-ascii?Q?kTdadWgm8GbSzBj6DjhP9lO6qlTUMI/RU/cAwxFNQHQt6aREbY3HfIPkfwEf?=
 =?us-ascii?Q?g3gbyvPv5EYMZiyeygE/HzMFG3f22+7oFGRyeeoQiqOyK1lV82Gbu0zug+X+?=
 =?us-ascii?Q?irvgr/dIXS/UXvV1YvY+IJc9kGo7fELOncHROQaUA/TxUNVTeLOJi3NGjNEq?=
 =?us-ascii?Q?+HTrKLSEzBFtShig9iVnSGTTfz/BU4sD+Ag/U8Bue7StsLeh+IdGhG0g2K8m?=
 =?us-ascii?Q?0dGpOrfToSHHjuZG+cfpg+f8Mevjebg2yvsqnVTWrpazIuTyifPaPx1BzE/m?=
 =?us-ascii?Q?u3GaVhLg8WJBsRJ4J7a8/C4FatYA/FvYdi1W62J7Y+X8l9aiRMw8iGuQHCQN?=
X-MS-Exchange-AntiSpam-MessageData-1: GZpJWnRoSDEsIQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 18652b67-2337-456c-9b89-08dede064d41
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:06:18.1975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A94HVEUjKyJZQpCtEcvfEv1IPkfrLzlx8qO5gVhcbGUC0Ehqjg2gXZhcu0Ore9I2NR1J96F3DvwJA16YoQuTYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2431
X-purgate-ID: tlsNG-c201ff/1783634785-DB74D12E-7FFDD121/0/0
X-purgate-type: clean
X-purgate-size: 20379
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
X-Rspamd-Queue-Id: 49B62735F0B

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/smpboot.c                |   7 +
 xen/common/Kconfig                    |  15 ++
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  62 +++++
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 355 ++++++++++++++++++++++++++
 xen/drivers/acpi/Kconfig              |   3 +
 xen/drivers/acpi/Makefile             |   1 +
 xen/drivers/acpi/topology.c           |  38 +++
 xen/include/xen/acpi.h                |  10 +
 xen/include/xen/cpu-topology.h        |  35 +++
 xen/include/xen/dt-cpu-topology.h     |  29 +++
 13 files changed, 558 insertions(+)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 843a43897e..26296c12c8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -23,6 +23,7 @@ config ARM
 	select HAS_STACK_PROTECTOR
 	select HAS_STATIC_MEMORY
 	select HAS_UBSAN
+	select HAS_GENERIC_CPU_TOPOLOGY
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index ba5fd2dd52..d957553a44 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -9,10 +9,12 @@
 
 #include <xen/acpi.h>
 #include <xen/cpu.h>
+#include <xen/cpu-topology.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
+#include <xen/dt-cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/mm.h>
@@ -244,6 +246,9 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+        /* Pass the info to dt_init_cpu_topology() */
+        map_cpu_to_dt_node(i, cpu);
     }
 
     if ( !bootcpu_valid )
@@ -280,6 +285,8 @@ void __init smp_init_cpus(void)
     else
         acpi_smp_init_cpus();
 
+    init_cpu_topology();
+
     if ( opt_hmp_unsafe )
         warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
                     "It has implications on the security and stability of the system,\n"
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba84..c4bddfd098 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -191,6 +191,21 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config HAS_GENERIC_CPU_TOPOLOGY
+	bool
+
+config DT_CPU_TOPOLOGY
+	bool
+
+config GENERIC_CPU_TOPOLOGY
+	bool "CPU topology support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HAS_GENERIC_CPU_TOPOLOGY
+	select DT_CPU_TOPOLOGY if DEVICE_TREE_PARSE
+	select ACPI_CPU_TOPOLOGY if ACPI
+	help
+	  Retrieve CPU topology information from the device tree or the
+	  ACPI PPTT to optimize virtual CPU scheduling.
+
 config NUMA
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e25614..34b333cdb3 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
+obj-$(CONFIG_GENERIC_CPU_TOPOLOGY) += cpu-topology.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
diff --git a/xen/common/cpu-topology.c b/xen/common/cpu-topology.c
new file mode 100644
index 0000000000..94cb9ba312
--- /dev/null
+++ b/xen/common/cpu-topology.c
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/dt-cpu-topology.h>
+#include <xen/init.h>
+
+struct cpu_topology *__ro_after_init cpu_topology;
+
+static void __init free_topology_table(void)
+{
+    unsigned int cpu;
+
+    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
+    {
+        free_cpumask_var(cpu_topology[cpu].thread_sibling);
+        free_cpumask_var(cpu_topology[cpu].core_sibling);
+        free_cpumask_var(cpu_topology[cpu].cluster_sibling);
+    }
+
+    XFREE(cpu_topology);
+}
+
+void __init init_cpu_topology(void)
+{
+    unsigned int cpu;
+
+    cpu_topology = xzalloc_array(struct cpu_topology, nr_cpu_ids);
+    if ( !cpu_topology )
+    {
+        printk(XENLOG_ERR "Failed to allocate memory for cpu_topology table\n");
+        return;
+    }
+
+    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
+    {
+        if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling) ||
+             !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling) ||
+             !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
+        {
+            free_topology_table();
+            printk(XENLOG_ERR "Failed to allocate memory for cpu_topology table\n");
+            return;
+        }
+    }
+
+    if ( acpi_disabled )
+        dt_init_cpu_topology();
+    else
+        acpi_init_cpu_topology();
+}
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
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 9036e455d6..6ee670b5f4 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
+obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
new file mode 100644
index 0000000000..b653227ef4
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,355 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
+ * Parse cpu topology information.
+ */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/numa.h>
+
+struct cpu_map {
+    unsigned int thread_id;
+    unsigned int core_id;
+    unsigned int cluster_id;
+    unsigned int package_id;
+};
+
+static const unsigned int __initdata invalid_topo_id = ~0U;
+static struct cpu_map __initdata cpu_map[NR_CPUS] = {
+    [0 ... NR_CPUS - 1] = {invalid_topo_id, invalid_topo_id, invalid_topo_id, 0}
+};
+static struct dt_device_node *__initdata dt_cpu_table[NR_CPUS];
+
+static void __init setup_siblings_masks(unsigned int target_cpu)
+{
+    const struct cpu_topology *target_topo = &cpu_topology[target_cpu];
+    const struct cpu_map *target_map = &cpu_map[target_cpu];
+    unsigned int cpu;
+
+    /* Update core and thread sibling masks */
+    for_each_possible_cpu(cpu)
+    {
+        const struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+        const struct cpu_map *map = &cpu_map[cpu];
+
+        if ( target_map->package_id != map->package_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, target_topo->core_sibling);
+
+        if ( target_map->cluster_id != map->cluster_id )
+            continue;
+
+        if ( target_map->cluster_id != invalid_topo_id )
+        {
+            cpumask_set_cpu(target_cpu, cpu_topo->cluster_sibling);
+            cpumask_set_cpu(cpu, target_topo->cluster_sibling);
+        }
+
+        if ( target_map->core_id != map->core_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, target_topo->thread_sibling);
+    }
+}
+
+static struct dt_device_node *__init
+       dt_find_child_node_by_name(const struct dt_device_node *dt,
+                                  const char *name)
+{
+    struct dt_device_node *np;
+
+    dt_for_each_child_node(dt, np)
+        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
+            break;
+
+    return np;
+}
+
+void __init map_cpu_to_dt_node(unsigned int cpu,
+                               struct dt_device_node *cpu_node)
+{
+    if ( cpu < ARRAY_SIZE(dt_cpu_table) )
+        dt_cpu_table[cpu] = cpu_node;
+    else
+        printk(XENLOG_WARNING
+               "cpu id %u exceeds the max cores %lu\n",
+               cpu, ARRAY_SIZE(dt_cpu_table));
+}
+
+static unsigned int __init cpu_node_to_id(const struct dt_device_node *cpu_node)
+{
+    unsigned int cpu;
+
+    for_each_possible_cpu(cpu)
+        if ( cpu_node == dt_cpu_table[cpu] )
+            return cpu;
+
+    return invalid_topo_id;
+}
+
+/*
+ * This function returns the logical cpu number of the DT node.
+ */
+static unsigned int __init
+       get_cpu_for_node(const struct dt_device_node *dt_node)
+{
+    const struct dt_device_node *cpu_node = dt_parse_phandle(dt_node, "cpu", 0);
+
+    if ( !cpu_node )
+        return invalid_topo_id;
+
+    return cpu_node_to_id(cpu_node);
+}
+
+static int __init parse_core(const struct dt_device_node *core,
+                             unsigned int package_id,
+                             unsigned int cluster_id,
+                             unsigned int core_id)
+{
+    bool leaf = true;
+    unsigned int i = 0;
+    unsigned int cpu;
+
+    do {
+        const struct dt_device_node *t;
+        char name[20];
+
+        snprintf(name, sizeof(name), "thread%u", i);
+        t = dt_find_child_node_by_name(core, name);
+
+        if ( !t )
+            break;
+
+        leaf = false;
+        cpu = get_cpu_for_node(t);
+        if ( cpu != invalid_topo_id )
+        {
+            cpu_map[cpu].package_id = package_id;
+            cpu_map[cpu].cluster_id = cluster_id;
+            cpu_map[cpu].core_id = core_id;
+            cpu_map[cpu].thread_id = i;
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "ERROR: %s: Can't get CPU for thread\n", dt_node_name(t));
+            return -EINVAL;
+        }
+        i++;
+    } while ( true );
+
+    cpu = get_cpu_for_node(core);
+
+    if ( cpu != invalid_topo_id )
+    {
+        if ( !leaf )
+        {
+            printk(XENLOG_ERR "ERROR: %s: Core has both threads and CPU\n",
+                   dt_node_name(core));
+            return -EINVAL;
+        }
+
+        cpu_map[cpu].package_id = package_id;
+        cpu_map[cpu].cluster_id = cluster_id;
+        cpu_map[cpu].core_id = core_id;
+        cpu_map[cpu].thread_id = 0;
+    }
+    else if ( leaf )
+    {
+        printk(XENLOG_ERR
+               "ERROR: %s: Can't get CPU for leaf core\n", dt_node_name(core));
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init parse_cluster(const struct dt_device_node *cluster,
+                                unsigned int package_id,
+                                unsigned int cluster_id,
+                                unsigned int depth)
+{
+    bool leaf = true;
+    bool has_cores = false;
+    unsigned int core_id = 0;
+    unsigned int i = 0;
+
+    /*
+     * First check for child clusters; we currently ignore any
+     * information about the nesting of clusters and present the
+     * scheduler with a flat list of them.
+     */
+    do {
+        const struct dt_device_node *c;
+        char name[20];
+        int ret;
+
+        snprintf(name, sizeof(name), "cluster%u", i);
+        c = dt_find_child_node_by_name(cluster, name);
+
+        if ( !c )
+            break;
+
+        leaf = false;
+        ret = parse_cluster(c, package_id, i, depth + 1);
+        if ( depth > 0 )
+            printk(XENLOG_WARNING
+                   "WARNING: Topology for clusters of clusters not yet supported\n");
+        if ( ret != 0 )
+            return ret;
+        i++;
+    } while ( true );
+
+    /* Now check for cores */
+    i = 0;
+    do {
+        const struct dt_device_node *c;
+        char name[20];
+        int ret;
+
+        snprintf(name, sizeof(name), "core%u", i);
+        c = dt_find_child_node_by_name(cluster, name);
+
+        if ( !c )
+            break;
+
+        has_cores = true;
+
+        if ( depth == 0 )
+        {
+            printk(XENLOG_ERR
+                   "ERROR: %s: cpu-map children should be clusters\n",
+                   dt_node_name(c));
+            return -EINVAL;
+        }
+
+        if ( leaf )
+        {
+            ret = parse_core(c, package_id, cluster_id, core_id++);
+            if ( ret != 0 )
+                return ret;
+        }
+        else
+        {
+            printk(XENLOG_ERR "ERROR: %s: Non-leaf cluster with core %s\n",
+                   dt_node_name(cluster), name);
+            return -EINVAL;
+        }
+
+        i++;
+    } while ( true );
+
+    if ( leaf && !has_cores )
+        printk(XENLOG_WARNING "WARNING: %s: empty cluster\n",
+               dt_node_name(cluster));
+
+    return 0;
+}
+
+static int __init parse_socket(const struct dt_device_node *socket)
+{
+    bool has_socket = false;
+    unsigned int package_id = 0;
+    int ret;
+
+    do {
+        const struct dt_device_node *c;
+        char name[20];
+
+        snprintf(name, sizeof(name), "socket%u", package_id);
+        c = dt_find_child_node_by_name(socket, name);
+
+        if ( !c )
+            break;
+
+        has_socket = true;
+        ret = parse_cluster(c, package_id, invalid_topo_id, 0);
+        if ( ret != 0 )
+            return ret;
+
+        package_id++;
+    } while ( true );
+
+    if ( !has_socket )
+        ret = parse_cluster(socket, 0, invalid_topo_id, 0);
+
+    return ret;
+}
+
+/*
+ * Generate cpu topology information when cpu-map node doesn't exist.
+ * It assumes that the cpu doesn't have SMT and all CPUs on a NUMA
+ * node belong to the same socket.
+ */
+static void __init fixup_topology(void)
+{
+    unsigned int cpu;
+    unsigned int clid = 0;
+    unsigned int pkgid = 0;
+
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_map *map = &cpu_map[cpu];
+
+        map->package_id = cpu_to_node(cpu);
+        if ( map->package_id != pkgid )
+        {
+            pkgid = map->package_id;
+            clid = 0;
+        }
+        map->cluster_id = clid++;
+        map->core_id = 0;
+        map->thread_id = 0;
+    }
+}
+
+int __init parse_dt_topology(void)
+{
+    const struct dt_device_node *cpus;
+    const struct dt_device_node *map;
+
+    cpus = dt_find_node_by_path("/cpus");
+    if ( !cpus )
+    {
+        printk(XENLOG_ERR "ERROR: No CPU information found in DT\n");
+        return -EINVAL;
+    }
+
+    map = dt_find_child_node_by_name(cpus, "cpu-map");
+    if ( !map )
+        return -ENOENT;
+
+    return parse_socket(map);
+}
+
+void __init dt_init_cpu_topology(void)
+{
+    unsigned int cpu;
+
+    BUG_ON(!acpi_disabled);
+    BUG_ON(!cpu_topology);
+
+    if ( parse_dt_topology() )
+        fixup_topology();
+
+    for_each_possible_cpu(cpu)
+        setup_siblings_masks(cpu);
+}
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
diff --git a/xen/drivers/acpi/Kconfig b/xen/drivers/acpi/Kconfig
index e3f3d8f4b1..5277b7bf83 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -8,3 +8,6 @@ config ACPI_LEGACY_TABLES_LOOKUP
 config ACPI_NUMA
 	bool
 	select NUMA
+
+config ACPI_CPU_TOPOLOGY
+	bool
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 477408afbe..bcdb1b5e1b 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PM_OP) += pm-op.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
+obj-$(CONFIG_ACPI_CPU_TOPOLOGY) += topology.init.o
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
new file mode 100644
index 0000000000..6bd2d96ebb
--- /dev/null
+++ b/xen/drivers/acpi/topology.c
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/init.h>
+
+/*
+ * TODO: Populate the topology information by scanning the ACPI
+ *       PPTT (Processor Properties Topology Table).
+ */
+void __init acpi_init_cpu_topology(void)
+{
+    unsigned int cpu;
+
+    /*
+     * Generate temporary cpu topology information for now.
+     * It assumes that the cpu doesn't have SMT and all CPUs
+     * belong to the same socket.
+     */
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *topo = &cpu_topology[cpu];
+
+        cpumask_set_cpu(cpu, topo->thread_sibling);
+        cpumask_copy(topo->core_sibling, &cpu_possible_map);
+    }
+}
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
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 2fdf38cf74..bd982ee836 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -135,6 +135,16 @@ static inline int acpi_boot_table_init(void)
 
 #endif 	/*!CONFIG_ACPI*/
 
+#ifdef CONFIG_ACPI_CPU_TOPOLOGY
+
+void acpi_init_cpu_topology(void);
+
+#else /* CONFIG_ACPI_CPU_TOPOLOGY */
+
+static inline void acpi_init_cpu_topology(void) {}
+
+#endif /* CONFIG_ACPI_CPU_TOPOLOGY */
+
 int get_cpu_id(u32 acpi_id);
 
 unsigned int acpi_register_gsi (u32 gsi, int edge_level, int active_high_low);
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
new file mode 100644
index 0000000000..f64820febf
--- /dev/null
+++ b/xen/include/xen/cpu-topology.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#include <xen/cpumask.h>
+
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+
+struct cpu_topology {
+    cpumask_var_t thread_sibling;
+    cpumask_var_t core_sibling;
+    cpumask_var_t cluster_sibling;
+};
+
+extern struct cpu_topology *cpu_topology;
+void init_cpu_topology(void);
+
+#else /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
+#define cpu_topology ((struct cpu_topology *)NULL)
+static inline void init_cpu_topology(void) {}
+
+#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
+#endif /* XEN_CPU_TOPOLOGY_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/dt-cpu-topology.h b/xen/include/xen/dt-cpu-topology.h
new file mode 100644
index 0000000000..cb8a266479
--- /dev/null
+++ b/xen/include/xen/dt-cpu-topology.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DT_CPU_TOPOLOGY_H
+#define XEN_DT_CPU_TOPOLOGY_H
+
+struct dt_device_node;
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+
+void map_cpu_to_dt_node(unsigned int cpu, struct dt_device_node *cpu_node);
+void dt_init_cpu_topology(void);
+
+#else /* CONFIG_DT_CPU_TOPOLOGY */
+
+static inline void map_cpu_to_dt_node(unsigned int cpu,
+                                      struct dt_device_node *cpu_node) {}
+
+#endif /* CONFIG_DT_CPU_TOPOLOGY */
+
+#endif /* XEN_DT_CPU_TOPOLOGY_H */
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
2.43.0


