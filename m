Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wC8jFdtcKWr5VgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424B6696A6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=hChIU2nE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334276.1597415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKr-0002l5-Gy; Wed, 10 Jun 2026 12:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334276.1597415; Wed, 10 Jun 2026 12:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKq-0002az-Rc; Wed, 10 Jun 2026 12:47:08 +0000
Received: by outflank-mailman (input) for mailman id 1334276;
 Wed, 10 Jun 2026 12:45:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJT-0001G1-8Q
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJS-007roF-LC
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c75-e002-0a2a0a5209dd-0a2a4509edfa-2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:42 +0200
Received: from [52.101.72.83]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c76-2497-0a2a45090019-34654853ba2b-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:42 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:40 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:40 +0000
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
 b=oYqAFxO9WriTpN6UHnaYCQ1s5lWXCvxhCdsuhpPZLJVtzLnLGRzBPISmyfCqPhecmjLlfL4hT6eixy6QttttPpyPHntFfz/FR3FfqpEVUzeY90QATM32j4n568uaHyerUlVlzYyCZLzMoc5W1wGeQkxg00NuwyacZK0VbGuOhie02LoqGg8OhVe2jfJjCXC6K5RY1w2kHkyhnW/+EEBDvw7yuMj+vWw72UUAkcsKVh0Uk/sc2dbHvUNi92IUT2HsALaonJ1sxf6qP6VA263IQvWJ7i97w/HgD3LBH0GS2IQ5vCxw7B4sYUbBm3NX6N9UlPTNnPIhloL2OJBsbMZcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q1Fsw7I5VcRKOn6Vwcp1VtMdJtga40n5Ed4Emmc+5c=;
 b=MttiLgnubCorR63FeNIhlqHe/88i1rOWAc5EuqvtZgOQdKecPlpwRuQti2LmEjX5W4XJN/0YEmsDcy5/MXoDaqXEyGYtGM+6jojQkK9lQfN1QBsN/8+/KrWJE8smvXxjtLiXgfhKtIK2T2BWSUXH7oj895EUxezaz3QEDtYU7gLrnETLtPWtYFDGQKXZ+HbRklsTpujTWKqdCVq50c45Lditd9eozfBEPrTEHUkFQbWvTlwJiyUkot3+YamnGtwUvjQ0RhnkNjrPoUXnsO/qMr71XZB+ULb9VovZPffkE3TmmEmLFCPwItqme6X5GegejDiflQLk0/Cw/NQ0F56bog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q1Fsw7I5VcRKOn6Vwcp1VtMdJtga40n5Ed4Emmc+5c=;
 b=hChIU2nE4+B0KQz+25FU/YnMcmk3Uycb9acMFdERJdsWjWi+0k4QIyNrMZton4LH/4aCplO+QqvOvvFAENgEKP8dkQ6X3382ihAkQXb6FveS3zHsmlr6Ryp9UZVZd9fKXV22NYqSVwiXtc2RQ6SmvgR995fsF9eWypG8OS0pdf3MXztvzdCYUEsV8059tCekybruWf8zB/zSgbSPfgR89xidWBgaOJk10TfVU/m56pJAax9htojlkzD5EeDRncWR9JyQvp18I9KZ1vLhltuc2N+CKsSGpBg/yPGbd1dBWCgVAEZXXc5NXylaY63xC7eGKn/HONaCpUzXmD3ji8Io/Q==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v11 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Wed, 10 Jun 2026 15:44:31 +0300
Message-ID: <bf6645f78b982800527b3d8955745fc80f325a3c.1781084290.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c8e49bb-9f50-4e71-53b5-08dec6ee2dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PyPGwlfat60c4X9V0EPlTKI5aaa3rq3dm1Zh8FUd3LeJhbLbPoxSzq4QwMDqbAYl9Y69k2WLPU98eShJZtYCaGsDZYQSXIRm7jUPP/bhzVRyN3ZrwlmBwtxSOr4S+ydI+SDxHhNA4z4uNApjipJYrkQSfgabbkgYuIG30fXINpyfLQT+CGLXEgBQU0kXgd+/sI8m8hjqF+CRFjzBUg54dsVkQkRdZqzMIBeSWDITVqSxr81BzQumbSlDEFyQPQNoPR+EibjT+VCphAllfj+9dZpal+r9zvHE+uVIB+kdY3QQmDpTdgaiop1/OzFKBwApJ18WeYv9d5+0FHo498+Ekr6wUGYECh86bIuSnS5CBnkCgrDehPla1AjgMb2ThiOq2KZ3H/UXZi9oOI6AI5Ld3SV5G+nSLnW4K3f4RDDpHipsmriD5wHP4RYQTeq4pplCMouiWz3YCLB+RCRBm/b/nw888DT+9VfbD7pyiHnMAIJaUoBG8p5bwztp8mZSGbUCm/3jdagoEnktiyu81BD48CJZAQpK1HtgDOb9LctrTThVaXUfwZFo+CnlvwWxdVptCMrtpUJHYHjxRZZbNBC40SeME4W/zXpeOrs3EKGCeHB4TNXj/j+N1RXxeFMHZ2L2RF1tBDdjTkZk2oFWtlHRw5pk5Xg/XjR1yl+54ikg7pt2RNRu1DZY5aPCbQ6LoiMS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Jk5hx+dR2gBkG7z+XeERo2Vu83vLXXfWCXVQPHpMiTuSyE0FnDexxpN1p6P?=
 =?us-ascii?Q?7JWSSiGUh7U0sTVnIumM10Fi4T9MA6tBJYCDI75DUJCDAOojpe3SeVuf3lOs?=
 =?us-ascii?Q?nFTyNJ5Wr4wzhz4D4dSfU8uUmCvz2ChhgzxBstfxeyOsUiIeMlUkGjcULw7a?=
 =?us-ascii?Q?DqDduat+FD9jWFUoIicicdA+R/835jkjsMlBi2DHec7S+HOA5q4t2FtXFZNi?=
 =?us-ascii?Q?DM3oAKaLfWTLfStF3RYYC8FW1paB1dqDF6u62iNDmtLvN4FOSE/nZDaNQwlo?=
 =?us-ascii?Q?xDd7yEw/OHJEVW3MbgUCYgLfFiGKMpFyL/wNpCvJNI9YKprd+/EqPzYAyVWH?=
 =?us-ascii?Q?6JmEKW6w6+vl+3yykfUSJLUZsWVuA62SSULCpDwwDpT0FtpWXJSmleHgODeu?=
 =?us-ascii?Q?WsrElT21j0AuanYkVsgYz74YGRhZ8kIfbJWn5xQP6H2sdUjqxr3SHft58i+I?=
 =?us-ascii?Q?Py10jSzkO4nYtin9rREouoXD58UsAwLEitI6lJw6txJRyPkESP/YwciuiSAw?=
 =?us-ascii?Q?+6mVlNdipo2Lpz+dnSGVRWT8A1KUK3sS8HgF1qaioe8trNBNVGA9lLpL+oBE?=
 =?us-ascii?Q?L7S0sxQ0EHMM/TnR9eUt/JAmCNs6eQurYy9m79q6pMCkTfq81t8jky2EdoAE?=
 =?us-ascii?Q?oxMlEzIbYSbRpdEKY5ivb6MZ5WGZqMulB7Q9f1cm5+3kgJQQHVYbzKor0Nu/?=
 =?us-ascii?Q?FW2tcPikBTr98APF4y1isk4suy5aXVvYLB5KXH+QUMhpt1Udp0F5lmDY5D7A?=
 =?us-ascii?Q?2SxTY2Vns/rwBQFDQ64FpTb7BYpJNJyDRmCWWv6n+5RTVnX91SPBgGFDnUDe?=
 =?us-ascii?Q?ROsI4i8v05AaQHx2eDrzXinpDP629CSO7TfarZYQZDLmETEhQuj4EoSWOY/6?=
 =?us-ascii?Q?dq2VquW/wWtB6JMk6D4bqGtJ8sOsk+bAdmunF7BZ+SFqmem2c6TGqTlQdVk+?=
 =?us-ascii?Q?BnUifUobQiMCeQ1doRrx3AppEeUcb20Y5WBz8K2Tgj6oJJuMmrZiZ1wcInHN?=
 =?us-ascii?Q?I7OcV8CjEw7T9wg2p/NG76MHV8WdHzyrVQZx85jFTp1Fiu31NGH79jAQM4wS?=
 =?us-ascii?Q?fMf2fEbXy/9Uy+VaJLOLajnk17QBc6XjOpLqH7zKJe1O+nr2cv3BXxkAPFXJ?=
 =?us-ascii?Q?ksZVyR/jaX2YW308sxnLS2Tj/33q4EktSzoyKGVTlmhrVBoOw4aDXbLNNo14?=
 =?us-ascii?Q?aoxT456K+RdqOxe6QZ5un8/Shl7XjUhhAnoQOI8OBpywyjw+Dj9fEeQ/CrKh?=
 =?us-ascii?Q?rg0LIR7zZMss1EPlyIehnGfvrwQWbtuazCTjnDaCGkquyGkvnYDO5O3jAu17?=
 =?us-ascii?Q?daz1+xezOHNjsRwOYKVQUzFM5ECr/1+RDfxZnFvUu4gIUWUV9hqfmQJ7fuuw?=
 =?us-ascii?Q?tDFQQaYdmn7KzKmBRDKIMIcShXW1NXLUvU2t3XjZrka0mKT85KeE05gLwEzj?=
 =?us-ascii?Q?7kK2wek/nWcrHix2LirI68Na0Bu2AROBzzEor8ZUPHTbVDXa4uipDbztXouY?=
 =?us-ascii?Q?SoDBuUI5Ij9T7C+apP2oMX6F6Y5KkuHSPgZmid9dq2OgrAOLzUhi3gjaFsSW?=
 =?us-ascii?Q?8GYhtGt6Z3xIzwmR7KqhxkGJEvfDw05VIFqHV+q3pyTOSJhuqZ1p6f6GGLNL?=
 =?us-ascii?Q?LY/MlJ08F709doO3Qar/MDzfIHYfOqtPVEYJJPysVaEoQb4Aov8HupQTQ8MW?=
 =?us-ascii?Q?R3SP4s+0FUlXxHnZIq7tA5GQQmCHD3i8G5dTzUV/mPOP83xVm/h5o4AfmEVf?=
 =?us-ascii?Q?9r2RiA+3hg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8e49bb-9f50-4e71-53b5-08dec6ee2dbb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:40.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znTOm2RgPgTWjxTSkdsw12O7JlS7TxtwEQte/g8tqdczjs6qZ7PK9Qcu430PrExrbGAszofyWkbotg8B7JWCeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-bad1c0/1781095542-8B193A53-6591A88C/0/0
X-purgate-type: clean
X-purgate-size: 4081
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0424B6696A6

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64
platforms. Pass the Xen resume entry point (hyp_resume) to EL3 together
with a zero context ID, matching Linux.

This patch wires up only the host-side PSCI SYSTEM_SUSPEND invocation.
The resume trampoline and context restore are provided by earlier patches
in the series.

Only enable this path when CONFIG_SYSTEM_SUSPEND is set and PSCI
advertises SYSTEM_SUSPEND via PSCI_FEATURES.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v9:
- cache SYSTEM_SUSPEND support using PSCI_FEATURES and gate the host call
  on the cached capability
- keep the cached SYSTEM_SUSPEND capability read-only after init
- log whether firmware reports SYSTEM_SUSPEND support
- pass an explicit zero context ID in the SYSTEM_SUSPEND call
- drop the stale note claiming hyp_resume is still a stub
---
 xen/arch/arm/include/asm/psci.h |  1 +
 xen/arch/arm/psci.c             | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 48a93e6b79..bb3c73496e 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
 void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
+int call_psci_system_suspend(void);
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..e05dae1133 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,23 +17,27 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/suspend.h>
 
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
  * some calls it is necessary to use SMC64 to pass or return 64-bit values.
- * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
+ * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
  * (native-width) function ID.
  */
 #ifdef CONFIG_ARM_64
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
 #else
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
 #endif
 
 uint32_t psci_ver;
 uint32_t smccc_ver;
 
 static uint32_t psci_cpu_on_nr;
+static bool __ro_after_init has_psci_system_suspend;
 
 #define PSCI_RET(res)   ((int32_t)(res).a0)
 
@@ -60,6 +64,25 @@ void call_psci_cpu_off(void)
     }
 }
 
+int call_psci_system_suspend(void)
+{
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct arm_smccc_res res;
+
+    if ( !has_psci_system_suspend )
+        return PSCI_NOT_SUPPORTED;
+
+    /* Context ID is unused for the Xen resume path. */
+    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume), 0,
+                  &res);
+    return PSCI_RET(res);
+#else
+    dprintk(XENLOG_WARNING,
+            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disabled)\n");
+    return PSCI_NOT_SUPPORTED;
+#endif
+}
+
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
@@ -223,9 +246,15 @@ int __init psci_init(void)
 
     psci_init_smccc();
 
+    has_psci_system_suspend =
+        psci_features(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND)) == 0;
+
     printk(XENLOG_INFO "Using PSCI v%u.%u\n",
            PSCI_VERSION_MAJOR(psci_ver), PSCI_VERSION_MINOR(psci_ver));
 
+    printk(XENLOG_DEBUG "PSCI SYSTEM_SUSPEND is %ssupported by firmware\n",
+           has_psci_system_suspend ? "" : "not ");
+
     return 0;
 }
 
-- 
2.43.0


