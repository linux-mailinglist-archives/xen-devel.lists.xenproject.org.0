Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BaOWGIsbUGrHtQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB044735F0D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Yg6AvFfs;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358607.1612628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwsz-0006vJ-B7; Thu, 09 Jul 2026 22:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358607.1612628; Thu, 09 Jul 2026 22:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwsz-0006sh-7r; Thu, 09 Jul 2026 22:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1358607;
 Thu, 09 Jul 2026 22:06:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1whwsw-0006sa-QI
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 22:06:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whwsv-004Qfb-QL
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 00:06:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b59-2eae-0a2a0a5409dd-0a2a4505bdc4-8
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:20 +0200
Received: from [52.101.125.137]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b59-4f1d-0a2a45050019-34657d89cdb0-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:19 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYCP286MB2431.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 22:06:15 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.016; Thu, 9 Jul 2026
 22:06:15 +0000
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
 b=RraDXPKpUUG9knZTIhJtejGrN5Kmo1FaZW8k44AdelhaGm5e/QIR91IhsHyC9CLUhKQim8wPdMTCyCgR+YVNfiwjebGryWsuIc5iO3lFFjL2UQvQOGEjAfHQ4D0y36/IsH0QfNPPDLTe+OA/5q1RtD3PaxdxCpwwmHd7URJ6JlDWmtNsCPRsR5RUyh03cYMqfrMJf6WXna5UyYmH96DeqrZmCfnYgS3+QCcXJ9YQbpdN9pgcwArCDbCEhAjI7jhyP+JStQl95WxqeEf6RwHXsa/17yNMGiAKFBQYD3066k2MCL11RF+8RaUzzOBoX7TjsCfmoraW61ZlZkGGUVzHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeZR/EnzvsZHkXrSd0nDTan7he02cLlRFGs9H6JXCJU=;
 b=Hnfc1T9DkdR+eei7EJWUP/rbJq/IZebV2v6BiPvPxjc1ZXs96U8VigYqLlqnsJkCtuMKjWdNSlaOj6PURyiuyGCi+sb/5hv2IOzU5GCvxjnariJ2+Aj1edQBQL8yz2ly97lcM5lTiU1mKT2TnbpLrYSwHYPtgJt/z9hG1hiVCgYkLeDiboPkNrHoI1SDytKRnoGgrbxxSDHnXekSJmmo98wY78+xxJDpg95bo+KOzSJzSJdKZJmRL6eqb9ODt6E1VnFfFZj1iEoyBhGXwZ2oqsZuZkfDILjdzJ50aImkjAThi9q1pkcWiCPho+ZFeS9V56j8Tr44HnC4DcUrFHv6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeZR/EnzvsZHkXrSd0nDTan7he02cLlRFGs9H6JXCJU=;
 b=Yg6AvFfsmv9/bv7LVY6ogsnLHCvSCNS4nh1lAjtHmV/kcUdtzNtAs1ShnL7zcoI+SS+Bcz2Z96vv3vaShdFdF3XE+fgNtADKYH82E0Tu8Ck2EIDcCvKcGVuiAWs/IqHqgu1pmqI8uSaWQqoR/shSPe4H7zEIDFME2M+ab/ys+9U=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v5 0/4] xen/arm: Device Tree based CPU topology support
Date: Fri, 10 Jul 2026 07:05:48 +0900
Message-ID: <20260709220552.646462-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYCP286MB2431:EE_
X-MS-Office365-Filtering-Correlation-Id: aedd4e82-10da-46aa-9a64-08dede064b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|10070799003|366016|1800799024|6133799003|25016099003|29003799003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ig76eGxaCo6R3hthll266zpI4PDNkiSHNRXvFAhtw7bNlDShi6GTN7QnBBRITlkvriBbkZpVPYccEriccOw9sXceT+jZS0ISKQSoQvBcQckBYESLR7hg0qb3Iv7qMtvy4baG+RYNYbpwwnZbKh3UteaK66MMGWjl5iIDWk8/eMm+QeuWvAlkJe9fpyLLDxbE/hR9E2R0sJhxkNQAj3qybZz2WizjsYoWnEyWBkkm2HP18VM5JQmQmuZK/yvMZYs9GqoPm9LbrTYxAHNkQkGr8G6g0AFf8x3hukZRbJ4X6b21zcAdxvEtZblkad5xUrzUuHty/yTLIcQbx1GMBa8qb6bPW/5AR3MEa67S/oHnNQjlDeyubj95r4StCkct7L+RnMPhsBPsVCh/IxtaVQP5pLojFTi78Xvt+SZ3gDrFed5NiQBu0E0PVt8CNaTxbp/jbzdEXd3FDDzk/+hnhTgXVMWYaJh7ftbglPmiX32hkuLTHlZOewFbOXb9AG31eblSMAxdRleLTHU59+E5CoOo0ed/QvinLP4Re9wphLnYgXHS6YxIXNEGfEcfqkR/FXuwT27AoP8zelfC6En6rtYmd5Aq63JnKpNqVhl2JWGfJTr7U9aI0UwyvzzRAbwbKRqk432coaSIx+y8IwPeHWfsa8dyOETgIwY4OaucDrCDxX8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(366016)(1800799024)(6133799003)(25016099003)(29003799003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cP+VXH8Dq4Gfdaw6vcAcyR/phzLJuOLukv4COstdFfsn5prf1ndSDGd9woIw?=
 =?us-ascii?Q?mt7R2F/t7X1qBCKcAd5CmkdOUuF1eYrnNaNoI7oFt50UfCIPxxtbKtMN9zK9?=
 =?us-ascii?Q?tTS7NhBVg3z3iD+tNJ53ApGITti3KPjGAu7LDa9pD3E3B+bJcGlY/psuhspq?=
 =?us-ascii?Q?C1p3XnwzSwWuLRiEghypE5TrUCWlpGeFiBGWVIbjGFXalngV113J07G3kJ5G?=
 =?us-ascii?Q?cxBQbGTe9pFJ0hlMbAHoqY217sCL+YAZxzCzvqszFV+fNCbcPl9m0xTjpdCR?=
 =?us-ascii?Q?C3u6r1amU6fEGM7UCYkYNmslZqO6c/AdhuG3avbGXbY3kp6GyyyiToUtdKlx?=
 =?us-ascii?Q?ihURUWh+rA0jLMb5N9lpw1f2HiaPaA3u++uWapHYVh5ulOc5a6vf69Q/adWp?=
 =?us-ascii?Q?sSjsRbID6AbJeDLxw7XZgIe7AfrzWVOjoGzeKhTZb2bZRu3lmbdJwEGkHUoe?=
 =?us-ascii?Q?GL0d7FyNisSttUo6sd9fWu+Kbz9YgscQU/oM8xiFHUEdv1TxeZG2xjc5pji9?=
 =?us-ascii?Q?hnyOeKIeMFqAy2V9sgtxXYnl+sZ+P4U9oL5/XjqspxCUBZg5k6GaAZ2HvO1S?=
 =?us-ascii?Q?igIAEZ0ZibjqLOjWMI6K9BR4VnZNwlsRL9UdtinKJAVtpVICd7i8LKDsVpeV?=
 =?us-ascii?Q?UOtHLIWSvOtFtgD7Rq1U24FNGarWpFr4yOYfmqNhhl4QrWgAfTOYd3taWcmz?=
 =?us-ascii?Q?JFrghlPvwEpAWggHe36ZrUAbumfNSvuX1gnKiRygS7jA4R1Gd7Nh4/SszxPd?=
 =?us-ascii?Q?wpkeDuLzCOPxujj1l434D9aqXEn7rzgOQh8uJcwa5snnF9xsvReL/DRaiRHI?=
 =?us-ascii?Q?AnfHmT43A+mH1yUbDKbMdHJYLPc91wdVMWsbInEXZl45TA9AyEseXVeihFho?=
 =?us-ascii?Q?/Tke4I3dvEM/tbfWqZX1T9nbDBh+FQFOKREoMPL/M7vooNtbavMyrFTXcowJ?=
 =?us-ascii?Q?oIusCHRxZbDDTWqqdkdiMBs8F8IdJfnbIxEqQFt3jY4GNBmprhmXjp0NHgEF?=
 =?us-ascii?Q?nlKEI7VxejdtWfkPpzqTKoO8pP7PcwDAvd6qCih3yYfVcmbev86n1loBsCqq?=
 =?us-ascii?Q?6NmbPjDw6+aQReKH6S5dLBDcE1Dyc/OkLqlt0c8gkxF6DpyUaF/eDYb0BB9z?=
 =?us-ascii?Q?tWHRukD4WDYoG+gTSwwkokbyRxJ2I/UE49jdYXJLL9FqK5ftMIigvg02UbW+?=
 =?us-ascii?Q?yU3FfgtxJuh7xKh0JjfghKnca9YYVdD0B+Zvevlo/6FCIhiOxFdSja/nIe7c?=
 =?us-ascii?Q?mjIujQXN84YVRFi0cBvQzC1PGwXrHSmm0ApMCsHJk3gcNrhn3pR+widJDm0u?=
 =?us-ascii?Q?16+qSRKBB9tY54qmIuUhvrcv8Ls9Doy3myfl1mRSL1qmoZa4JvlOpC8jf5CO?=
 =?us-ascii?Q?ogPggrokzb+f+UJVKhPl2leqhdGHx+jwXkElgQXnjq0iBnBmaBAwRmu0tW4n?=
 =?us-ascii?Q?pejhfLY+I+kNWSda/Vrv0yDY5ZCMPCWv5VKvWTw04RBQov72wdZSBxparIM5?=
 =?us-ascii?Q?yECBLpnufmc3mN1iBYzk5aT1q+0CMyYFzOribBk9Xw1IvI5/+zKg+ufuqvDx?=
 =?us-ascii?Q?Wy3gLZ+N2WiInLnVm/1C2xwerCc4mUZ73VCAT8kyc0QKBlUXPIE1vEEl8PLG?=
 =?us-ascii?Q?lLnWBXtOjh85B9qL+oJDnD6KO36A7vfpNtVHWr+lj0hpPacMyXakWPgZucSq?=
 =?us-ascii?Q?3PYVkVNO7NCJsJSDJvyVR3XCyGLZBxMDG8Owamd7FYaojxO1tZQjI8ExS8LG?=
 =?us-ascii?Q?2xp/KySVVrSMi9LdS/stj21o5/NB/oD/qswojdso19oL2exTnq15IrvbbEC8?=
X-MS-Exchange-AntiSpam-MessageData-1: q+FLcs7FO2rLoQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: aedd4e82-10da-46aa-9a64-08dede064b8b
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:06:15.2451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+uRSI6jHlI/yr/p/cLXq8tfNU0jdCwdqeQjxfS2sEy4lnwI05rzjK6DBxyQEGJxFPqNTwgM01N700uDr5CX2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2431
X-purgate-ID: tlsNG-c201ff/1783634780-1862612E-735368CE/0/0
X-purgate-type: clean
X-purgate-size: 5970
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB044735F0D

Hello,

This patch series introduces CPU topology support based on
Device-Tree and ACPI PPTT for ARM Xen.

In v5, I added code to parse the ACPI PPTT and reflect it in the CPU
topology information.

Future Work:
 - Support for the "credit2_runqueue=cluster" option.
 - CPU topology support for RISC-V and PPC (once SMP support is available).

Changes in v5:
 - Extracted CPU topology information from the ACPI PPTT.
 - Corrected the erroneous use of CONFIG_CPU_TOPOLOGY to
   CONFIG_GENERIC_CPU_TOPOLOGY.

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
 - Explicitly #include <asm/processor.h> in cpu-topology.h to guarantee
   that arch-specific definitions of cpu_to_core() and cpu_to_socket()
   take precedence over the generic fallbacks.
 - Introduce inline initialization functions for cpu_sibling_mask and
   cpu_core_mask in cpu-topology.h, providing separate variants for both
   when CONFIG_GENERIC_CPU_TOPOLOGY is enabled and disabled.

Changes in v3:
 - Use (nr_cpu_ids - 1) as the maximum CPU ID here. The fix for the sparse
   map mismatch issue on ARM Xen has been split out into a separate patch.
 - Switch topology sibling masks to cpumask_var_t for dynamic allocation.
 - Allow the system to keep running with a degraded fallback even if
   the topology table allocation fails.
 - Remove the temporary definitions of cpu_to_core() and cpu_to_socket()
   from RISC-V and PPC processor.h.
 - Minimize the use of #ifdef blocks, leveraging compiler Dead Code
   Elimination (DCE) where possible.
 - Clean up the code to follow the Xen coding style. Please let me know
   if I missed any style nits!
 - Verify successful builds across x86, RISC-V, and PPC environments.

Changes in v2:
 - Generate topology information even when ACPI is enabled. Note that
   this is a temporary implementation and doesn't yet parse the PPTT
   (Processor Properties Topology Table).
 - Added support for cpu-map node in Device Tree that doesn't contain
   explicit cluster node definitions.

Changes in v1 from the previous series "Introduce Device Tree based NUMA
support for ARM Xen":

1. Optimized Memory Allocation:
   The series now allocates only the minimum required memory area to manage
   the essential data for the CPUs.

2. Flexible Device Tree Parsing:
   The parsing logic no longer depends on the definition order of the 'cpu'
   nodes and 'cpu-map' nodes in the Device Tree. They can now be read
   correctly even if their orders do not match.

3. CPU Hotplug Readiness:
   To support future CPU hotplug, the system assumes that inactive CPUs are
   also described in the Device Tree. Xen will pre-load and generate the
   topology information for these inactive CPUs during the boot phase so
   it stays available in memory.

Thank you,
Hirokazu Takahashi

Hirokazu Takahashi (4):
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler
  xen/sched: Make cpu_nr_siblings() architecture-specific
  arm/acpi: Parse PPTT to initialize CPU topology

 xen/arch/arm/Kconfig                   |   1 +
 xen/arch/arm/acpi/boot.c               |   2 +
 xen/arch/arm/include/asm/acpi.h        |   2 +
 xen/arch/arm/include/asm/processor.h   |   4 -
 xen/arch/arm/smpboot.c                 |  15 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |  15 +
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  62 ++++
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 406 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Kconfig               |   3 +
 xen/drivers/acpi/Makefile              |   1 +
 xen/drivers/acpi/topology.c            | 255 ++++++++++++++++
 xen/include/acpi/actbl3.h              |  30 ++
 xen/include/xen/acpi.h                 |  18 ++
 xen/include/xen/cpu-topology.h         |  83 +++++
 xen/include/xen/dt-cpu-topology.h      |  29 ++
 22 files changed, 923 insertions(+), 36 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


