Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xE73ItlcKWrtVgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67BA66967D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=Jr+mejaH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334274.1597406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKq-0002b6-OG; Wed, 10 Jun 2026 12:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334274.1597406; Wed, 10 Jun 2026 12:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKq-0002P3-6V; Wed, 10 Jun 2026 12:47:08 +0000
Received: by outflank-mailman (input) for mailman id 1334274;
 Wed, 10 Jun 2026 12:45:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJQ-0001FS-ND
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJQ-007roF-3w
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c63-e002-0a2a0a5209dd-0a2a4509d228-44
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:40 +0200
Received: from [52.101.65.137]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c73-2497-0a2a45090019-34654189f24b-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:40 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:37 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:37 +0000
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
 b=o9P6F818+1NEmAqx4GX5Y2ORpz8/xaUVvSosTGfEf9gTZfN7CCxyKCLF3sQCBt8e1BsHE4MZYMS/KUdW0BwhqaZivo0kS5rSwFqqUTXTF33baqGx41O6xRupP1613rvVVHZ4atKf8uEaoxc+G9Ht217FMbBI3IW0lOW7mlQFjWrc6yRiPj3NgWof0HMSb1R0jLLOLAq85A+Ax3/Y26GJqC56gNkCNFEE2WEIicytWs5PWmzcOHwjuq1c8op+jDLdD0/K1eMO6Up4UuekT279LyJoWvoeoHlkR1vp5VCHBzs593XGBK6/3YkIYaIqAoAxjakJJDkqYK8A1iK+OE2rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHwpIqiqjUhBvqtSggh5esR4e9b+MV3aX2Xvrv+38P8=;
 b=O+J0cnjVjQznnSIVbSYQLHjJ/ODQFY/iORwKe7suhMd4MHbHsILx4BCKzekj9G/z5K156RMw6Xx9U/SYIF2/DOEniUi+0X6Z2OxjugqPbeTKWxPST5THUSjNFaDuljXC6uhc/CXc5HgzHSHIzkH02w0kV27pvNVXh6uUqsIDSAeNVpQQMmc92jIGrVqGaOyT+oJPpMHFnH9+SD+Uq3ao8SDpyr6DSQP/Fpgz/NIVr7sBsrDw5n6axuNN97m8+dZOIhrAUybaf1fd8MLZ1mf2ArIhX3+Qvfm4+k6qfmwHAQN3VVtF/26iRGlURX0yCca0iaMGQn1p680yh8eTmIwtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHwpIqiqjUhBvqtSggh5esR4e9b+MV3aX2Xvrv+38P8=;
 b=Jr+mejaHQoO7Qv+YpTWqXfr8wKOKEk024/kqamWbWkNQOdBlN2iL06EVRz3S1hYHww9kANBe/iVVREq1ZnbjyX/ezmqAqM4KlChV94ZEuKPtKJQaox9Dn8eMCIBFPSorK0d3JOavahsozHPav1gYIj1QbPlxeew9CfZ9ktk0T84Vz6/IiVKcObJqNEaGiK6JSm6kKpEiXKH4hWZnNa2ZszBdxMp5tgMc9QrZGoi8wWn1MJhhhu7vvImjl8EGBCwmvUZUhXy/8PY8ip2w0CbUIst8ys5gl9xUGrZZ4Fq485sfS0Fg0lad4YBEB1RbnWnJF/9JcIaAldCwNZ7vG4ynFg==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v11 10/13] xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
Date: Wed, 10 Jun 2026 15:44:30 +0300
Message-ID: <0df881b529384afbfd6ac289d3d6a14e188f5c57.1781084290.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781084290.git.mykola_kvach@epam.com>
References: <cover.1781084290.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AM9PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3217c138-79ac-4843-bcb4-08dec6ee2bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N2/RSBYwWc43KrAmv2WLRKd663OQIz1+Abbp2Fws4xhdQnB4qDtpw1Knnu18VRKaA8Mq0nirU2TXr9LRJ54j/krrLiGKxdE3Qy9Vo9S7Nr4kbFalrvl+xqPYVwMXTpf18h4tJpuyoWzgHtxPq4o0SsJrLPP7CEon34haAMX0Os2AjTT3aih8T9m8XAmS70GXXJS4Fph96KXVnsrliaejJurpOvpHiWWViWMlTOQGYFBe2iJTIo3BW4/t9YO2fKxfXcbYeSlF7aNJSIfnYYQHycbA8GPJsohyCDzVyDm0YgL+W8d6+7DgVvgxlHEEFqCF+/L84IWfsLuJCiLuFKjvovGkStSarTfvYfg0bATBtNmfjz4Z/1VR36TPBmu5QNUq4W6MIwDnVrllvH6U626wHujomWHOKREGhw642q4Sbfp92vfZHGeGvzDl3IBRMT6dTnUf4mblUXc7u99VtjJh8vzRy/btij0gwBhX5iOTI9phMV9C9DGv7sKcEphNh6XRqKZFi9kOS6zaChBLkHOokUUf8kTg2LPlxEe8BmWsQkj/exTHsgLUEKxLhc6ghOWTEzm5GyedNqt/PNUGTObxRLfx5erSYsANFjST/IOys3iEq52KJrarBpBvtq5Szs7dAJoTHJJxFb47YfUOauG/SSiqJd2I4VHeakn5ds5iUD6NtiYGKjbLKrzByC4swAKG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JfWsuICEPiMSUj8N18SXYmEixbEmAWnAR8RXpxVfT86mk9Ov3SsRK1gWwftK?=
 =?us-ascii?Q?rEBHSAjAWO7RI9ssRMOb/RzJFw8hDyIxPKavqJzrTpYPNv63SI39fBn9Lrl8?=
 =?us-ascii?Q?dOlo0ELKu8qBuJkMqNquTuQ+VWp73dk8ZFzMSzBVpoScZS7bD743DOuGtte0?=
 =?us-ascii?Q?IIzi7Bic36/Hmbucd6kmAzLifCKjbiDLkdXcgJl/HjeSedEcU2MHwX4THUoH?=
 =?us-ascii?Q?aK0jScl3XKqb9rznUxKU38W+rso2sM0584w6w5WULNxSGKOddkCchzlkqsiy?=
 =?us-ascii?Q?crHKWlOMeXsI5MxLXw/682tKtB54v1S6Q8yhZKixW261WDDMjFVne/fUViBM?=
 =?us-ascii?Q?O3G5Xgmo8809kWW8Piw0RoFZOWhhimGdxL10Y2CFsFCRaf6yDyMcSPsh+/Up?=
 =?us-ascii?Q?++2+n4HiSUU0ClCaIRssWmTwR9rZSg6KBsg10ZdYxfn3j/HTnRrU/kgRnxZM?=
 =?us-ascii?Q?FFLxAZEQW0A9+sEefPfY7DHmUkBfUgboTkmTczj/lcUvnJsA8bJf/EnEMA63?=
 =?us-ascii?Q?EwP1e3GK4YdD7lBrTKINrFf/ZcO2xDJbysNtRfJZtzonGpl08CiPGFXz5IF8?=
 =?us-ascii?Q?AzsYnOz4Ad888+Mp6CximuT5xra/qlPuVChZoT+JDmG0NpIYCNPvArk+1h4V?=
 =?us-ascii?Q?l1vj9g736ETycZXyhf6GlS40txEG2JzLAZbHL8Bg4I9rAZ1O2drZeDXN3EWm?=
 =?us-ascii?Q?X5NlYvPuMgt4Bjjk0UL92nau5LIW07h1Dv7dFhW8QB6U2PPc1JquCGJ8gd2F?=
 =?us-ascii?Q?MKsiP1rQio+a2Cmp4OkdMu2pgDS+HX88MqU8H8Ly08WERw5Aji4WanvqIy/z?=
 =?us-ascii?Q?e2lRNlgj9lkTTeJcw5FQCWEVG7t0DsZw0pXXnZL/RPpWfWRl4SXJEBVYnx48?=
 =?us-ascii?Q?EKjIETUhAojEFNtzZQJGjemwBGzjgb0X13Nk8biBTvNQcvk4FjTm8FB9Yy7i?=
 =?us-ascii?Q?pMMPUDgmFly2UxEQhAAD2rGiJocVyNYvgiS37gSU7YzQjI5B2nREiTEuDXZQ?=
 =?us-ascii?Q?Ej76kKV2mB7HznIaYEWT5Hu8icGl4S3SSJgPMOB6rDPQTdKYr+9BEcjVetAZ?=
 =?us-ascii?Q?XVQ7KSHzW+hgQEM/oO9QcX6UCLijokEPgakVTWj5PHNIDDiag/lwMZOntdar?=
 =?us-ascii?Q?EmjI5iKgd2yq6BoU9SEn/kxfbck3vVXUPpem5FiQGwwjDTr57o9aL+RSm50M?=
 =?us-ascii?Q?SKUpakwXkTNT9jqGo4GTCKolFxHJaA90qnOiZAqNyEl1FMrYxi4rLFdfjvlg?=
 =?us-ascii?Q?mVzmu6M4aEsxTp0KsnvaUUMLa5kr7WGWxfVTjXEN0ub6myiGgquBpumaCcTB?=
 =?us-ascii?Q?6pWpqfI0o+ZMgdJYQ/vrz3oD8fszwMkVY2E+b2qEYv2k4cxs2C8Aeccui3jb?=
 =?us-ascii?Q?vKlG738DPerkushLTkuFiUdfXHCWQ9yRXuITISvWCMUzhz0s6KzmdVCKqglZ?=
 =?us-ascii?Q?dUIQZiv0hyXhso8Gu40w7kmlYJKPTqspQ1PrlOPLtazZWyLb7WM7dG/M69D2?=
 =?us-ascii?Q?jfED61qPL2PjB0bOv0SwbbQSCM5l1aEm22urD8+mJapjrdweyPS6VSk7+st/?=
 =?us-ascii?Q?DFbSGOpwbTVso5XpF2unHY2kG8jRDhxgJIE0Ie3tHkGoJEYScbpNrSvRqSxi?=
 =?us-ascii?Q?K4CoK/241C3uycTQpYrP/d1YEy1tWkXh2J9NAtHVy4OEangqSzw4syJPwhfE?=
 =?us-ascii?Q?pHeBZDidHoQwq8M9DTysStkFH92KGbCVvfKtlRAMY4dIFt9etN46yrrTWMpU?=
 =?us-ascii?Q?eLko7YP/qw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3217c138-79ac-4843-bcb4-08dec6ee2bee
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:37.6398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFoy28qX0pFvFgTUHT+XqTBf9iqSgbxxCBhqYPPgr4kss01gn3EJWXwFX37DQpb7tHBIxLKX1VFt9C3l6/67QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-bad1c0/1781095540-89174A53-26438CAD/0/0
X-purgate-type: clean
X-purgate-size: 11487
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[epam.com,gmail.com,kernel.org,xen.org,arm.com,amd.com];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksandr_tyshchenko@epam.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B67BA66967D

From: Mirela Simonovic <mirela.simonovic@aggios.com>

On wakeup from PSCI SYSTEM_SUSPEND, Xen re-enters EL2 with the MMU and
data cache disabled. The resume path must first switch back to Xen's
runtime page tables before it can access the saved CPU context using
virtual addresses.

Add an arm64 hyp_resume trampoline that reuses enable_secondary_cpu_mm()
to enable the data cache and MMU, switch to init_ttbr, and resume in the
runtime virtual mapping. The trampoline then restores the saved CPU
general-purpose and system-control register context.

prepare_resume_ctx() must be invoked just before the PSCI system suspend
call is issued to the platform firmware. It saves the current CPU context
and returns a non-zero value so that the caller enters the physical
SYSTEM_SUSPEND call.

On resume, hyp_resume restores the saved context, including the saved link
register. Control therefore returns to the place where prepare_resume_ctx()
was called. To avoid re-entering the suspend path, the restored path sees
prepare_resume_ctx() return zero.

The assembly save/restore code uses offsets generated by asm-offsets.c
from struct resume_cpu_context, keeping the assembly memory accesses in
sync with the C structure layout.

Support for ARM32 is not implemented. Instead, compilation fails with a
build-time error if suspend is enabled for ARM32.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v10:
- Save and restore CNTHCTL_EL2 across SYSTEM_SUSPEND

Changes in v9:
- Drop the misleading prepare_resume_ctx() pointer argument and make both
  save/restore paths use the global resume_cpu_context.
- Squash the arm64 resume trampoline into the context save/restore patch.
- Document in code that hyp_resume relies on PSCI initial-state rules.
- Use generic platform firmware wording instead of ATF-specific wording.
- Rename the saved context type/storage to resume_cpu_context and rely on
  implicit zero-initialization for the file-scope object.
- Use asm-offsets.c-generated RESUME_CTX_* offsets to keep the assembly
  save/restore code in sync with struct resume_cpu_context.

Changes in v8:
- Fix alignments in code.

Changes in v7:
- No functional changes, just moved commit.
---
 xen/arch/arm/Makefile              |   1 +
 xen/arch/arm/arm64/asm-offsets.c   |  21 +++++
 xen/arch/arm/arm64/head.S          | 122 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/suspend.h |  27 +++++++
 xen/arch/arm/suspend.c             |  14 ++++
 5 files changed, 185 insertions(+)
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 84c4062b30..e256b0b348 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 38a3894a3b..5d60406e9c 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -13,6 +13,7 @@
 #include <asm/mm.h>
 #include <asm/setup.h>
 #include <asm/smccc.h>
+#include <asm/suspend.h>
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
@@ -57,6 +58,26 @@ void __dummy__(void)
    OFFSET(INITINFO_stack, struct init_info, stack);
    BLANK();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+   OFFSET(RESUME_CTX_X19, struct resume_cpu_context, callee_regs[0]);
+   OFFSET(RESUME_CTX_X21, struct resume_cpu_context, callee_regs[2]);
+   OFFSET(RESUME_CTX_X23, struct resume_cpu_context, callee_regs[4]);
+   OFFSET(RESUME_CTX_X25, struct resume_cpu_context, callee_regs[6]);
+   OFFSET(RESUME_CTX_X27, struct resume_cpu_context, callee_regs[8]);
+   OFFSET(RESUME_CTX_X29, struct resume_cpu_context, callee_regs[10]);
+   OFFSET(RESUME_CTX_SP, struct resume_cpu_context, sp);
+   OFFSET(RESUME_CTX_VBAR_EL2, struct resume_cpu_context, vbar_el2);
+   OFFSET(RESUME_CTX_VTCR_EL2, struct resume_cpu_context, vtcr_el2);
+   OFFSET(RESUME_CTX_VTTBR_EL2, struct resume_cpu_context, vttbr_el2);
+   OFFSET(RESUME_CTX_TPIDR_EL2, struct resume_cpu_context, tpidr_el2);
+   OFFSET(RESUME_CTX_MDCR_EL2, struct resume_cpu_context, mdcr_el2);
+   OFFSET(RESUME_CTX_HSTR_EL2, struct resume_cpu_context, hstr_el2);
+   OFFSET(RESUME_CTX_CPTR_EL2, struct resume_cpu_context, cptr_el2);
+   OFFSET(RESUME_CTX_HCR_EL2, struct resume_cpu_context, hcr_el2);
+   OFFSET(RESUME_CTX_CNTHCTL_EL2, struct resume_cpu_context, cnthctl_el2);
+   BLANK();
+#endif
+
    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
    OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..962be716ae 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -561,6 +561,128 @@ END(efi_xen_start)
 
 #endif /* CONFIG_ARM_EFI */
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * int prepare_resume_ctx(void)
+ *
+ * CPU context saved here will be restored on resume in hyp_resume function.
+ * prepare_resume_ctx shall return a non-zero value. Upon restoring context
+ * hyp_resume shall return value zero instead. From C code that invokes
+ * prepare_resume_ctx, the return value is interpreted to determine whether
+ * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
+ */
+FUNC(prepare_resume_ctx)
+        ldr   x0, =resume_cpu_context
+
+        /* Store callee-saved registers */
+        stp   x19, x20, [x0, #RESUME_CTX_X19]
+        stp   x21, x22, [x0, #RESUME_CTX_X21]
+        stp   x23, x24, [x0, #RESUME_CTX_X23]
+        stp   x25, x26, [x0, #RESUME_CTX_X25]
+        stp   x27, x28, [x0, #RESUME_CTX_X27]
+        stp   x29, lr, [x0, #RESUME_CTX_X29]
+
+        /* Store stack-pointer */
+        mov   x2, sp
+        str   x2, [x0, #RESUME_CTX_SP]
+
+        /* Store system control registers */
+        mrs   x2, VBAR_EL2
+        str   x2, [x0, #RESUME_CTX_VBAR_EL2]
+        mrs   x2, VTCR_EL2
+        str   x2, [x0, #RESUME_CTX_VTCR_EL2]
+        mrs   x2, VTTBR_EL2
+        str   x2, [x0, #RESUME_CTX_VTTBR_EL2]
+        mrs   x2, TPIDR_EL2
+        str   x2, [x0, #RESUME_CTX_TPIDR_EL2]
+        mrs   x2, MDCR_EL2
+        str   x2, [x0, #RESUME_CTX_MDCR_EL2]
+        mrs   x2, HSTR_EL2
+        str   x2, [x0, #RESUME_CTX_HSTR_EL2]
+        mrs   x2, CPTR_EL2
+        str   x2, [x0, #RESUME_CTX_CPTR_EL2]
+        mrs   x2, HCR_EL2
+        str   x2, [x0, #RESUME_CTX_HCR_EL2]
+        mrs   x2, CNTHCTL_EL2
+        str   x2, [x0, #RESUME_CTX_CNTHCTL_EL2]
+
+        /* prepare_resume_ctx must return a non-zero value */
+        mov   x0, #1
+        ret
+END(prepare_resume_ctx)
+
+FUNC(hyp_resume)
+        /*
+         * PSCI states that SYSTEM_SUSPEND follows the CPU_SUSPEND initial
+         * state rules, so PSCI-compliant firmware must enter the return
+         * exception level with DAIF masked.
+         */
+
+        /* Initialize the UART if earlyprintk has been enabled. */
+#ifdef CONFIG_EARLY_PRINTK
+        bl    init_uart
+#endif
+        PRINT_ID("- Xen resuming -\r\n")
+
+        bl    check_cpu_mode
+        bl    cpu_init
+
+        ldr   x0, =start
+        adr   x20, start             /* x20 := paddr (start) */
+        sub   x20, x20, x0           /* x20 := phys-offset */
+        ldr   lr, =mmu_resumed
+        b     enable_secondary_cpu_mm
+
+mmu_resumed:
+        /* Now we can access the saved context, so restore it here. */
+        ldr   x0, =resume_cpu_context
+
+        /* Restore callee-saved registers */
+        ldp   x19, x20, [x0, #RESUME_CTX_X19]
+        ldp   x21, x22, [x0, #RESUME_CTX_X21]
+        ldp   x23, x24, [x0, #RESUME_CTX_X23]
+        ldp   x25, x26, [x0, #RESUME_CTX_X25]
+        ldp   x27, x28, [x0, #RESUME_CTX_X27]
+        ldp   x29, lr, [x0, #RESUME_CTX_X29]
+
+        /* Restore stack pointer */
+        ldr   x2, [x0, #RESUME_CTX_SP]
+        mov   sp, x2
+
+        /* Restore system control registers */
+        ldr   x2, [x0, #RESUME_CTX_VBAR_EL2]
+        msr   VBAR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_VTCR_EL2]
+        msr   VTCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_VTTBR_EL2]
+        msr   VTTBR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_TPIDR_EL2]
+        msr   TPIDR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_MDCR_EL2]
+        msr   MDCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_HSTR_EL2]
+        msr   HSTR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_CPTR_EL2]
+        msr   CPTR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_HCR_EL2]
+        msr   HCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_CNTHCTL_EL2]
+        msr   CNTHCTL_EL2, x2
+        isb
+
+        /*
+         * Since context is restored return from this function will appear
+         * as return from prepare_resume_ctx. To distinguish a return from
+         * prepare_resume_ctx which is called upon finalizing the suspend,
+         * as opposed to return from this function which executes on resume,
+         * we need to return zero value here.
+         */
+        mov   x0, #0
+        ret
+END(hyp_resume)
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 31a98a1f1b..c848fc6340 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -3,6 +3,8 @@
 #ifndef ARM_SUSPEND_H
 #define ARM_SUSPEND_H
 
+#include <xen/types.h>
+
 struct domain;
 struct vcpu;
 struct vcpu_guest_context;
@@ -14,6 +16,31 @@ struct resume_info {
 
 void arch_domain_resume(struct domain *d);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+#ifdef CONFIG_ARM_64
+struct resume_cpu_context {
+    register_t callee_regs[12];
+    register_t sp;
+    register_t vbar_el2;
+    register_t vtcr_el2;
+    register_t vttbr_el2;
+    register_t tpidr_el2;
+    register_t mdcr_el2;
+    register_t hstr_el2;
+    register_t cptr_el2;
+    register_t hcr_el2;
+    register_t cnthctl_el2;
+} __aligned(16);
+#else
+#error "Define resume_cpu_context structure for arm32"
+#endif
+
+extern struct resume_cpu_context resume_cpu_context;
+
+int prepare_resume_ctx(void);
+void hyp_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* ARM_SUSPEND_H */
 
 /*
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..6ea4a0f9cc
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/suspend.h>
+
+struct resume_cpu_context resume_cpu_context;
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


