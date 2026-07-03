Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B4qGBPJ9R2rMZQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 11:16:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BEE700855
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 11:16:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=iNylflYE;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1353028.1609218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfa06-0004Jj-4S; Fri, 03 Jul 2026 09:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353028.1609218; Fri, 03 Jul 2026 09:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfa06-0004EK-0C; Fri, 03 Jul 2026 09:15:58 +0000
Received: by outflank-mailman (input) for mailman id 1353028;
 Fri, 03 Jul 2026 09:15:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wfa04-0004CB-EH
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 09:15:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfa03-00GN2P-GX
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 11:15:55 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a477dc6-2eae-0a2a0a5409dd-0a2a450ace40-8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:15:55 +0200
Received: from [52.101.125.115]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a477dc6-e40e-0a2a450a0019-34657d733221-4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:15:55 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY3P286MB3731.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 09:15:49 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 09:15:49 +0000
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
 b=nHYMtEk5qw5V/ZvYP2pL4lQE2SCWEx8+w7C1BO7kR8feLzMu1KpLVZBfNywUCTrRU7K23pccdInHQA/q09+ikOGdlf6z0EW6jnCMzs0OvoGPzImUoQR6DjVcv9aBzcpixLemGPrtkUd8OOmSusHayE2EI2uTzCQxMFspWfCln7UVj3LCLVFcEMWGQijqjUKHwWKXeMu+29TqScj5U/okS080A3EQkgUY2HUCm0RkAhCzLJu85A4Q6EIyMSim25DQhTljQLW5odK/AsiKNN3MXKmNOm4F7vGO+Wy+5tzvv0tBFOASVLRTsrROivnMrPliBwt7qYyCJ/3fG0UJFc/c3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NThAHoBNg8DkdpKZCAuwHukZHxyXIkvelDPgBuO8Jxc=;
 b=WFGTDRfzqPB4V6Fufp325EvdULp4YuuHuV6DoKNuqB41f4JOb2IExNDXI08YK0ElAX/EuD/HaQ6NlOVNOoL9ARePPI6To4Imsw5h4C+8QTqLHVNI3clGIDd96hv4rfE6nvDlQ77QaieDYYqblfThOjNUizvKK0nHrZuXDwrGWhmnm54/K5x4+ASWoCtPurI3syzdahTUniVbYaXGQ3rEKbxWUFQqaR+42/ap98xC0695n2Eecx5alyDA0yu+5UE9IS0f55oOqmc7/dD75s2R4m2NqOieKX47qxdWUQYZqkC6I2Q3bry5x2QJV1pWfL3ub6BSKc74FFqKQb+WAwT0hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NThAHoBNg8DkdpKZCAuwHukZHxyXIkvelDPgBuO8Jxc=;
 b=iNylflYEbu3pAMMmLruqtBRGJGU5UDRPWATkgN/7/MsTP2QuuPsTkCzbJrSEpO5aWAaTDjTT/e8121bSTqInKkvUWbwXho8PZAW97KzQwyuJZA2YwaxFj/dRpi858PYbArl2/McUOIC6LqhnJt3Z7mFHQ5uEIC+s6OWj5Itg/pI=
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
Subject: [PATCH v4 1/3] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Fri,  3 Jul 2026 18:15:42 +0900
Message-ID: <20260703091544.183548-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703091544.183548-1-taka@valinux.co.jp>
References: <20260703091544.183548-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0068.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY3P286MB3731:EE_
X-MS-Office365-Filtering-Correlation-Id: dc408169-b0e3-4f62-e9a3-08ded8e3ac48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10070799003|3023799007|29003799003|25016099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7sDJ0od3F7aChrt6sTpQC536rY0xOISWjcEeS7jjTRkxXBmnqN2Ay277rHnabzXvEIYVdbsyYEZGqs+Iaht7o5cKReRgPXA8MNzck+kwG/Ef4vO63cJs+gpHubD7pyy8yfp0QuJf1PdGjnd3wO3kGV/WtyZE8id5Y+q7aG8L1L14B8TPUqQT44rUBBmUd21Fkhk6CLftu2m47u2yhYzAcdP6PEM3ExJyAE8syTMxZfm98X4QSc48bMRlwa+LXPRT7dAEDTPydpHCuc0aiTaaIZ5F67wEjlJOaw+cYDZWdpwM0tfid/Ynh2nKkD8i4S68gfpclDMa3gmfJ6DMA8O2rFacISrZZreiU5DCJQotYIPsnIdNz2oqxCA/d7yyKpW7Gk1LgmJvVo7nuV92YkhbzYnZp7RjmUk9MjDEU/qiKtpu15C9ffqmrrZ7JTSAk4tjTHTiC7M4cc1mhwWIPmSn8qVwcF1lsFzHSDbty0PIgukOvXka3WLE1++ZCsaLiDhKBJxNX/EzhYnh/N7IUbd/mUwmMTZBlACl1z0d9vOaOrSuuq+i6Q0gfT+hzKeAUQDxOxxDy2egd6fvqIw5xL8DdJlhUJWQBZ4bYC53oQdxwakzCZebH8MJkmOzKhUCWj0CCcOG8oUjaKmpeIIh/moVXNZ1LQOFiaPX66CjfqjqF2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10070799003)(3023799007)(29003799003)(25016099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uh6JORA60YRI0i+YuLX5dgLNcFkEgAXZP7p1Yn03h+vHi05RgaZtILKgpREx?=
 =?us-ascii?Q?AWw+6t8J2jKnKCSfMI2dDx4MjKViiufute/tT2ECtSfF5va1NTkscLd9bg2n?=
 =?us-ascii?Q?T41dJmKRGV2D42s/0mvUGqd+uw2HSxniyxL/s4ll1zat4Q73uisHhUN1ZdMv?=
 =?us-ascii?Q?32Cx/pMYKo/xX2nUNMmCZEpFwsoKbqHafjFh5dmcgDrMHcrSfkI3iIyTUFPD?=
 =?us-ascii?Q?hO7tMBhxc5cagdfrkg8K3vx3piVrq8PHTYpRReg8TssOMkgNHBeO7J5aDyVY?=
 =?us-ascii?Q?GGnHSQSedjkrWQKB7NhAz2yAoFTzAXUgfhQmb7GLFmfmUu1EGRbfsX+Sh0wm?=
 =?us-ascii?Q?JZijqC6NsZcaScSSeWMUjQE/g4hioJqaR/jBrOhkwGt08X1ydJktC1kV+YJH?=
 =?us-ascii?Q?ZX0gcDI8TExpbE29uUPCUYuwRrrFxHHNJLCd5eGm0yuqaJjP2xPy0vm50HZu?=
 =?us-ascii?Q?LHBI891XHB38X+FxWkLGswgxbZRdwJZg2GIXfw7iGEza6SlDTCbmPFUewZWx?=
 =?us-ascii?Q?Nf+pnCik2rc5+VbIS47MJkyiYxLpheJXa7KFo8mX31gqqCt025SC2lT37Qpy?=
 =?us-ascii?Q?vbnI+feihlxrjL60OZKLafeWK0Fly1SH5sOK/hDZDx1CHONSQ0szzmEuiqN6?=
 =?us-ascii?Q?+1p2Egf23dmhuqdyOOUCMBmBFkjCxrrDwLaKO2Ri6NtnVtBuSQF/nt5xYd0+?=
 =?us-ascii?Q?vVyFwnE3Or7TpHdtWh/mpcEYG0+1klBAfVV2LYDBUrcakqtgZX7d9PCFD/40?=
 =?us-ascii?Q?5HsKY/w8m7rircmyQ3YdO3W458gd6lIC3vDOojnPLzQEuJbl+gYc+E5HR3GP?=
 =?us-ascii?Q?rO9At3K6oc0Q9n9dOLYXobID1XfnIlOysrqt09fQwrYo2DVeJ5qvZeWgk/vb?=
 =?us-ascii?Q?9ZYtkQAI02nHzroZyCPo3ScBawVDO2fa2jiddbFMWAOy8oBlqUL59SKCA29c?=
 =?us-ascii?Q?H0UDUSRxjt2b8NfzuRx0kb8auNs8RzP3S1veYEPpy96e/IKyJqnTknIcIBvE?=
 =?us-ascii?Q?G5ffqtneWSAMNAVqFSSBTHFOvh1CWT2FdnuMphcDJdclEIgTl3u8E+5D+XEE?=
 =?us-ascii?Q?P1U9n75hKY9igd+Vz9r0u+Wg4xzNVv9ctJ3Hvw4RN2A/WtHv5YDkS0F+zGrm?=
 =?us-ascii?Q?QiaL8DBAR3F9ZMtK3GrKNNPB6/Fx+aEB5M1/yQopuuKsrKOBTCp6uQynnNbj?=
 =?us-ascii?Q?RSHc2g6DY7i/1KaQtl68fLJ9KNiWtEQOo073FKV4KT3HbRmD9q6zAM7th54w?=
 =?us-ascii?Q?TMcmRjiQqqELaK10LWI6LFlahpdU5AhDHUb6p1P94UUl7dvoH2c7iocFYHce?=
 =?us-ascii?Q?xOy4R2EtMIj4BkCK4PlHvFXlJfmR39pf0BtaySmySVIvsq9VBt8Ws6UO5ZEb?=
 =?us-ascii?Q?z26ss7hqPmZQc70j2NvqeNE3wzsftOOfQilNl4zhVrYqs9lCODx1pP3520SE?=
 =?us-ascii?Q?MU+PWmY2wZiU6MH+jwivCGV80XKdKPh27458lmTfyvtw8O5KMwvP9GcvCfJz?=
 =?us-ascii?Q?0RATmXWdkx+YVHy1qNh9kwPNq9kAqF0brJbWy7G8155kyR7HgHe2QGIOtKPg?=
 =?us-ascii?Q?P/uCXVB9vGPk+peHBfidiNo3QOV7rTdvTweUIBI/WTsHm+d3Z1ot73GaIJvn?=
 =?us-ascii?Q?jFIlMWeSpqCQpnvViC5K9JgsH5XzeOGCNyiN4EOpuM3aeSYxxYV8pQD+hDjP?=
 =?us-ascii?Q?TV7jDQtcIptd33Wgrqz59V9trFZTGDTqN0GanCw/QekOrBQyn03USlYs2112?=
 =?us-ascii?Q?B8TFW5N3CM/RshzDqF3ugIURbC1D3uOTmrK5MtsjpAFizLHW+QEccu/c4Cu8?=
X-MS-Exchange-AntiSpam-MessageData-1: nbcw1yE3qkfuUg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: dc408169-b0e3-4f62-e9a3-08ded8e3ac48
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 09:15:49.4886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5cChvhGNC5LgbV4nTCd46wtawED68Pfxr9ot0W4s/MpAM7Eh1j/qONZiypyvvQR+wNyNQl6a6QF+VjSg0pLuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3731
X-purgate-ID: tlsNG-4011c0/1783070155-D653FDDE-276232E8/0/0
X-purgate-type: clean
X-purgate-size: 22852
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
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2BEE700855

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v4:
 - Only display the CPU topology configuration prompt in common/Kconfig
   if the architecture defines HAS_GENERIC_CPU_TOPOLOGY.
 - Move the definition of the global 'cpu_topology' pointer to
   common/cpu-topology.c.
 - Update the Makefile to explicitly build objects as .init.o when all
   functions and data within a file are annotated with __init/__initdata,
   ensuring their memory is reclaimed after system initialization.
 - Add an error log in the CPU-to-node mapping function for out-of-bounds
   cases.
 - Use ARRAY_SIZE() instead of raw macros when guarding array accesses.
 - Rename variables and functions to avoid ambiguous or misleading terms:
   - Avoid 'cpuid' to prevent confusion with x86 CPUID features/instructions.
   - Avoid 'node' where it could be confused with a NUMA node, explicitly
     renaming them to clarify they refer to a Device Tree node.
 - Move local variable declarations into the narrowest possible scope.
 - Replace the unsupported "%pOF" printk format specifier with "%s" and
   explicit node name retrieval.
 - Remove #include <dt-cpu-topology.h> from cpu-topology.h, and ensure
   the header directly includes only what its definitions require.
 - Remove #include <xen/device_tree.h> from dt-cpu-topology.h, replacing
   it with a forward declaration of 'struct dt_device_node'.
 - Use 'const' qualifiers for pointer declarations where the pointed-to
   structure is not modified.

Changes in v3:
 - Use (nr_cpu_ids - 1) as the maximum CPU ID here. The fix for the sparse
   map mismatch issue on ARM Xen has been split out into a separate patch.
 - Switch topology sibling masks to cpumask_var_t for dynamic allocation.
 - Allow the system to keep running with a degraded fallback even if
   the topology table allocation fails.
 - Clean up the code to follow the Xen coding style. Please let me know
   if I missed any style nits!
 - Verify successful builds across x86, RISC-V, and PPC environments.

Changes in v2:
 - Generate topology information even when ACPI is enabled. Note that
   this is a temporary implementation and doesn't yet parse the PPTT
   (Processor Properties Topology Table).
 - Added support for cpu-map node in Device Tree that doesn't contain
   explicit cluster node definitions.

 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/smpboot.c                |   7 +
 xen/common/Kconfig                    |  18 ++
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  62 +++++
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 355 ++++++++++++++++++++++++++
 xen/drivers/acpi/Kconfig              |   3 +
 xen/drivers/acpi/Makefile             |   1 +
 xen/drivers/acpi/topology.c           |  38 +++
 xen/include/xen/acpi.h                |   2 +
 xen/include/xen/cpu-topology.h        |  35 +++
 xen/include/xen/dt-cpu-topology.h     |  29 +++
 13 files changed, 553 insertions(+)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5fa89fcb24..a390844432 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -22,6 +22,7 @@ config ARM
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
+	select HAS_GENERIC_CPU_TOPOLOGY
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..5ce2bcf6ec 100644
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
@@ -242,6 +244,9 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+        /* Pass the info to dt_init_cpu_topology() */
+        map_cpu_to_dt_node(i, cpu);
     }
 
     if ( !bootcpu_valid )
@@ -279,6 +284,8 @@ void __init smp_init_cpus(void)
     else
         acpi_smp_init_cpus();
 
+    init_cpu_topology();
+
     if ( opt_hmp_unsafe )
         warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
                     "It has implications on the security and stability of the system,\n"
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..6ee689cbdd 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -188,6 +188,24 @@ config VM_EVENT
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
+	  Retrieve CPU topology information from the device tree to optimize
+	  virtual CPU scheduling.
+
+	  Note: Implementation for parsing CPU topology from the ACPI PPTT
+	  is currently missing.
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
index 2fdf38cf74..d531c76370 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -101,6 +101,8 @@ void acpi_table_print (struct acpi_table_header *header, unsigned long phys_addr
 void acpi_table_print_madt_entry (struct acpi_subtable_header *madt);
 void acpi_table_print_srat_entry (struct acpi_subtable_header *srat);
 
+void acpi_init_cpu_topology(void);
+
 /* the following four functions are architecture-dependent */
 void acpi_numa_slit_init (struct acpi_table_slit *slit);
 void acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *);
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


