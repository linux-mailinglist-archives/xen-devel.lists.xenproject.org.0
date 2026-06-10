Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jZwyKd1cKWr7VgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058DE6696B0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=hk6GtzdK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334272.1597403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKq-0002PH-5p; Wed, 10 Jun 2026 12:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334272.1597403; Wed, 10 Jun 2026 12:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKp-0002G6-Kc; Wed, 10 Jun 2026 12:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1334272;
 Wed, 10 Jun 2026 12:45:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJO-0001F1-Qs
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJO-00H9hG-74
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c67-5cb7-0a2a0a5109dd-0a2a4504ad8a-44
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:38 +0200
Received: from [52.101.65.103]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c71-1dec-0a2a45040019-3465416798a7-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:38 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:35 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:35 +0000
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
 b=Ls2akCtxHCrDXkkdEcXzSXzUiy3QotfjYADyI2WbWxiRGwpxrHNirdp65VnAtDgxwNmId3QJHeoldhsGI/tcPqo3Lo5pdEYa29UR5deD/4KLEXV2L0s5wNFf4qfxiDBLmmq3mLxiM7pnsdC5c2tKKZ3IOdoytpEnOq/pj0PIAsM0YQa8gctPlQNoUyEU/9VuSfV38ss5D0Y6MMHUYD8HXScWq2qNwe0CxCdbU6EC1j2gGWvPsDRCVGFOFsackI37Hi22Jld1J38LtplZfcD+6qyuSkyA2pCeuX9Fam4Cy3jB/fquPeJHD6KwwomHmNdfWS0Qz3eVxLBMVQMyndl9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuU9qIia0v/KlFmfmQr2PfYUlwI141FZNiLujMqRB9A=;
 b=j2q2dlLPoVvdjM2FkVP4QzSWmC5xI8M83BFLfrsSoKqmFgg7ycts/YQOS26R3wn96dRSb6KWeGefI9tTI+Na3RyXLTaV3yI0n4qFlzxPeEQS3wI77pGVCQJJbjkXOTiDCatwNByAjIbThnzdOAmgWl6P1w0Ln7SPnX3hazJScM7u63YRLRZCmPRP4MZdlYfvX2pkUvb8amYtvncTd19T6qirpwDtKmy0Leqhdnjad0BX+A8P3fLJ9mb5DbxBnw5SRE0a3fNprR3jF0Bn612fJXvW+KlYtGt+EGM/oMNMgrU/f6uuAK6JrLtC6Fqdc1BYuNMdOS9R6l8U0rIiUo7Lxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuU9qIia0v/KlFmfmQr2PfYUlwI141FZNiLujMqRB9A=;
 b=hk6GtzdKDrgsx55KMiSCjFB2jCF2jG6Qp7ubXzpw1xRyNSXYZuBASGcsVrD5leMnqws4Uxhty0U0rFMFkRfEIClvHExi4NsJO9rUCmREqWja2S6eFeoSDx2D0OycK6OD3X3+j86gs6a5qj0KpC2GPXmIpKLBQoICPj1MqHstOFMvY/7z0To+Mds8yqYPAx1DjIlgsQFxiTYmmHP40XZWF006/fQ4yX2OtuXGibLYKgyVFunrjyvGHPHXYHf/yUVxQxQnIhadlgGVQPNvbQ42d7OOznN/UO9KRBynjtnF3Z3cY2OPTjkcFrAGiIXjXsF63JX+40ZqFyLMQmhA/0TffA==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pranjal Shrivastava <praan@google.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v11 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Date: Wed, 10 Jun 2026 15:44:29 +0300
Message-ID: <f802a42d15c0ae3d78fa159431e0cb2bb0f0bf8a.1781084290.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 19d77b4b-6690-49e2-b0d0-08dec6ee2ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|3023799007|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+4EWl3k3PQKfOBHPNt4O8R6W+YG/djPMZ1AEsd5fRXELZC1s9c7wi7QMl8ML7/KUZrSFE7fN0oOWmq3gI6Tr+BBHCjInuIxkvYmnF6tP0JLuFI2+QmYehaF+6xqWRoDVT6QDSYNX5L+Sw5BslpyHuvrQkWx0rJNTQWy1iipqcYWyEyY2KQzwmJvRugrFdWYDjmOxmAGfgNi+8OzA8LBmkuWmAKk/V1Ih6znUebe5QJ8ntXBZmG8S7U8mxNiQaoVYhxQATrV8Y/2dm7kKdFW+Rtxz1UpmFPLbDcSBHjXCbe/q0m3/0QoGxA1WMrRUv8Wcj75rWW+6Kj0p6JcYQ03WorxeCPJ3VD7gQdhfXKcO0HwoUYN1Tot+m/ivtBnmaB56yQyjJDKSEgbyi5DtlTaJktddeYtU1legYUt96xOv5Our8bVGNA6HqCeG3mLoRHllpGLmSrRXlcpHTgxruIw7VswIhA7A9SlyaWAQOFaJ8eY7kPcm+GTgUSVcpMUMLEajy/ajoNhYl6YPSEmor1i3FYBgmVg5I4DAQ1lB22VuNuqDjcmdmLzukEd5trPMjDRumnn3NMaXvBHjsH34qSYol1TvGwey6QcJLAO1xNnDy6E952Rivl/0dSl1l5sBJmer6bcZQHcJQmzH7N1JJqsoqcectqqwJi/+5WRtGJTfXt/bCwYgSUQ9n+0kJJqAIS1t+dxJHAmkJZHVwe7OpkFyQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(3023799007)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yw4m8nky4dwxiApT6yp3pgf67x+QJVmywGl5B5Y1tKDy/Nymf2iyeCZnep9A?=
 =?us-ascii?Q?2MEoJCtcwelfizu29SzUe5VZu9FpCxhLB/rnPG1OEYpPnRUUqRe22vSp60O3?=
 =?us-ascii?Q?6kqksZi4FbkkZZAs3sdRI+KqHruvcsmLhMmd9ig1///ivnAUEg6XbBM3La/r?=
 =?us-ascii?Q?C4L3FKMr4/ny3chZl6nAnTNQ1lyNs1pwZ+4cntFFcf99nJY+Oqjw/Erw/Rd0?=
 =?us-ascii?Q?pmcVjDB37/GTPJ6wzbpYYQhUP2OpL3cTcaTMqlx9TNqI2obd8CGFyIEMHn9O?=
 =?us-ascii?Q?Z8/0xubGK1v7SddO1Od06yTL4lU8hTNgiJP7pVghP/1GjH15IoSae+4Wb2Xb?=
 =?us-ascii?Q?UPqOBBt4SzblX3PUYo/RI/351fWpxz/AIstjsIl/D1jZMlADLVMhzYplWZnE?=
 =?us-ascii?Q?dWS83Z8byez5N0exRlCkJfM/FihZ7Noqd8mQ0skIbnFIRGj7TlfTREJsmmv7?=
 =?us-ascii?Q?NfjJb/vzcuFBpUL8SPsy0Y4N0pzVPw4Qz6uG2f7R/ainihanRdDoa9DVxXdk?=
 =?us-ascii?Q?ivH9TUwVGBFSFejTsIFXpqAwxkV+1bFtfEcIilfVSS5X+6C3bH+vgPA34Bw5?=
 =?us-ascii?Q?rsrxFu3+/HDmWjmnnKi/U/EzLYI9xDPoTxFsX8OCAJOcpaRrPPHnJs4VK3B9?=
 =?us-ascii?Q?UA0a5jLxKhXLg8O/UN71mxPXRMQFZwrVcFB844QnZhY+SKHbRGLSsF56qKk9?=
 =?us-ascii?Q?oEr+ieQ6LF4BiU5QAcWS7VhehTvYdHKi7LxxBe9GM3J0fuIEBksdCwzfwxr9?=
 =?us-ascii?Q?L7KSPIujuSrUXGc50umUU+dG+LDRHq25cvmd3kJMF1ZxBZdP7q0OOQcAke2A?=
 =?us-ascii?Q?pZsylLDbL/saFBaq7WGiN6hJDfS8GsQoBKgh22+eDp5z1orphVIe1Aksi1lG?=
 =?us-ascii?Q?9JgzHUiLDClvOtlgFTIgOh7QiOdooZye87AuueNgzcjE0NvbUWH8lBX5pXvD?=
 =?us-ascii?Q?cZWKVtZ2HjwDWM8qpa9QGZk59iGUsy3tpzN3/51fABDEFnG9BO3AJRWAnucX?=
 =?us-ascii?Q?mEtC1S4S7YnCZ1qalPNJM2EHoUrXBdYIOQIF3yu6R54BMb5X2300EvtKT8Sj?=
 =?us-ascii?Q?G9QaX4oMu0+HEG5qMUYL00FtS2wI5TYmL+Tghx/JUutFBvMVvPX9m+ipnQJd?=
 =?us-ascii?Q?eaG+rKQs2aS0nr/sLHjCyjyu8p81N8aWGzRSyNNWw0RGSjQd5HYriXf4k41Q?=
 =?us-ascii?Q?4XfbjpCuScdA3dRWcJFxVCtFXreMCBfTYkNzr37u/86JJs+/7MGRvFFPw5Qm?=
 =?us-ascii?Q?v6Lgt5N527bE7baGT9kB3S3Gh7E1hFIS9PKVV5DdGFQ6Feh6KaGjZixv1Xsr?=
 =?us-ascii?Q?UD9pDyc0XGy1UT3GBbaahgpsjWLK6nXAxi37EiQDmPsnVMBw91LwE8hOfCmc?=
 =?us-ascii?Q?ODlbcm3oDkVicQ6mwaaNZvQ4TS0WI0pFv40ytCkLTl632AMcJdMp9QQNKpyG?=
 =?us-ascii?Q?atI3SO31rc4Iy/0mXg980VatxXgZ+zWfKpc5aLmt8EkeQdnOzb+80C7ufSua?=
 =?us-ascii?Q?+8lCpoK91DPEb7PNypb7i7vH4Gm9ZViphf3tXyPKpreY7u2WUeAOYaj7Tb1O?=
 =?us-ascii?Q?otHRhPSK0O9BddGbc95l7j8i39+F2g3WuRWrTfnoZ47x6ZikvWCx7ssorX7l?=
 =?us-ascii?Q?7uMTUB4jPQEEABlRhypANWkzGA8u1valLSPbf+mw992GWlclmmXEb1nCHR9n?=
 =?us-ascii?Q?L6baLSKSqSeXkHXOZsJxXfX5IylCxjXaIUKIt9am6Hpvyk3MkHhRdavNNysH?=
 =?us-ascii?Q?+7+bOw7ekA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d77b4b-6690-49e2-b0d0-08dec6ee2ab8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:35.5440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PL+WuQP7PI6lnc+yZF731wuC9SBAOOXGidsdiNrZexWIESRPApwxfqdzOUzOGM5Ero7sWCj/Og3RLQJwqgzugg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-ebf023/1781095538-2A5603FF-12F23C5C/0/0
X-purgate-type: clean
X-purgate-size: 11069
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
	FREEMAIL_CC(0.00)[epam.com,gmail.com,arm.com,kernel.org,xen.org,amd.com,google.com];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 058DE6696B0

Add system suspend/resume callbacks for the Arm SMMUv3 driver.

During suspend, configure GBPA to abort incoming transactions, disable the
translation interface while keeping CMDQ enabled, issue CMD_SYNC to ensure
all previously issued commands have completed, then disable the SMMU IRQs
and SMMU.

Resume uses arm_smmu_device_reset() to reprogram the SMMU and re-enable
translation and interrupt generation.

The IRQ setup split follows the approach from Pranjal Shrivastava's Linux
arm-smmu-v3 runtime/system sleep series: IRQ handlers are requested once
during probe, while reset/resume only restores SMMU hardware state and
re-enables IRQ_CTRL.

Only the pieces relevant to Xen's currently supported SMMUv3 path are
ported here. Xen documents SMMUv3 MSI and PCI ATS as unsupported and not
compiled/tested, so this patch does not restore SMMU MSI IRQ_CFGn registers
nor reinitialize ATS/PRI endpoints. If those paths become usable,
suspend/resume will need corresponding MSI restore and ATS/PRI
quiesce/reinit steps.

Link: https://lore.kernel.org/r/20260414194702.1229094-1-praan@google.com/
Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V11:
- Keep arm_smmu_update_gbpa() and arm_smmu_device_reset() in init text when
  CONFIG_SYSTEM_SUSPEND is disabled.

Changes in V10:
- Disable SMMU interrupt generation during suspend before disabling the
  SMMU interface, matching the resume/reset path which re-enables IRQ_CTRL.

Changes in V9:
- Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
  path waits for command completion rather than only command consumption.
- Document that arm_smmu_setup_irqs() is probe-only and that future Xen
  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
  resume.
- Restore the reference to Pranjal's Linux runtime/system sleep series and
  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
  path.
- Prefix the subject with xen/arm for consistency with the rest of the
  Arm suspend/resume series.

Changes in V8:
- Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matching
  the existing runtime CMD_SYNC path.
- Fold the suspend rollback reset path into a helper and rename the error
  reporting to describe suspend rollback rather than resume.
- Treat SMMU reset failure during resume as fatal instead of logging and
  continuing with a potentially unusable IOMMU.
- cosmetic changes
---
 xen/drivers/passthrough/arm/smmu-v3.c | 194 +++++++++++++++++++++-----
 1 file changed, 158 insertions(+), 36 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227db..7f1d00fb81 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -94,6 +94,12 @@
 
 #include "smmu-v3.h"
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+#define __init_or_smmu_suspend
+#else
+#define __init_or_smmu_suspend __init
+#endif
+
 #define ARM_SMMU_VTCR_SH_IS		3
 #define ARM_SMMU_VTCR_RGN_WBWA		1
 #define ARM_SMMU_VTCR_TG0_4K		0
@@ -1814,8 +1820,8 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
 }
 
 /* GBPA is "special" */
-static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
-                                       u32 set, u32 clr)
+static int __init_or_smmu_suspend
+arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
 {
 	int ret;
 	u32 reg, __iomem *gbpa = smmu->base + ARM_SMMU_GBPA;
@@ -1995,10 +2001,35 @@ err_free_evtq_irq:
 	return ret;
 }
 
+static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+
+	if ( smmu->features & ARM_SMMU_FEAT_PRI )
+		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+
+	/* Enable interrupt generation on the SMMU */
+	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
+				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
+	if ( ret )
+	{
+		dev_warn(smmu->dev, "failed to enable irqs\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Probe-time only: request host IRQs and, when available, program the SMMU's
+ * MSI doorbells. Resume does not restore the SMMU *_IRQ_CFGn MSI registers,
+ * so any host suspend support must treat the active MSI IRQ path as
+ * unsupported until that restore path exists.
+ */
 static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
 
 	/* Disable IRQs first */
 	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
@@ -2028,22 +2059,7 @@ static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 		}
 	}
 
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
-
-	/* Enable interrupt generation on the SMMU */
-	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
-				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
-	if (ret) {
-		dev_warn(smmu->dev, "failed to enable irqs\n");
-		goto err_free_irqs;
-	}
-
 	return 0;
-
-err_free_irqs:
-	arm_smmu_free_irqs(smmu);
-	return ret;
 }
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
@@ -2057,7 +2073,8 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static int __init_or_smmu_suspend
+arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
 	u32 reg, enables;
@@ -2163,17 +2180,9 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	ret = arm_smmu_setup_irqs(smmu);
-	if (ret) {
-		dev_err(smmu->dev, "failed to setup irqs\n");
+	ret = arm_smmu_enable_irqs(smmu);
+	if ( ret )
 		return ret;
-	}
-
-	/* Initialize tasklets for threaded IRQs*/
-	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
-	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
-	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
-				 smmu);
 
 	/* Enable the SMMU interface, or ensure bypass */
 	if (disable_bypass) {
@@ -2181,20 +2190,16 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	} else {
 		ret = arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
 		if (ret)
-			goto err_free_irqs;
+			return ret;
 	}
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 				      ARM_SMMU_CR0ACK);
 	if (ret) {
 		dev_err(smmu->dev, "failed to enable SMMU interface\n");
-		goto err_free_irqs;
+		return ret;
 	}
 
 	return 0;
-
-err_free_irqs:
-	arm_smmu_free_irqs(smmu);
-	return ret;
 }
 
 static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
@@ -2558,10 +2563,23 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_free;
 
+	ret = arm_smmu_setup_irqs(smmu);
+	if ( ret )
+	{
+		dev_err(smmu->dev, "failed to setup irqs\n");
+		goto out_free;
+	}
+
+	/* Initialize tasklets for threaded IRQs*/
+	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
+	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
+	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
+				smmu);
+
 	/* Reset the device */
 	ret = arm_smmu_device_reset(smmu);
 	if (ret)
-		goto out_free;
+		goto out_free_irqs;
 
 	/*
 	 * Keep a list of all probed devices. This will be used to query
@@ -2575,6 +2593,8 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 
 	return 0;
 
+out_free_irqs:
+	arm_smmu_free_irqs(smmu);
 
 out_free:
 	arm_smmu_free_structures(smmu);
@@ -2855,6 +2875,104 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device *smmu)
+{
+	int ret = arm_smmu_device_reset(smmu);
+
+	if ( ret )
+		dev_err(smmu->dev, "Failed to reset during suspend rollback: %d\n",
+				ret);
+}
+
+static int arm_smmu_suspend(void)
+{
+	struct arm_smmu_device *smmu;
+	int ret = 0;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		/* Abort all transactions before disable to avoid spurious bypass */
+		ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+		if ( ret )
+			goto fail;
+
+		ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
+					ARM_SMMU_IRQ_CTRLACK);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out while disabling SMMU irqs\n");
+			goto fail;
+		}
+
+		/* Disable the SMMU via CR0.EN and all queues except CMDQ */
+		ret = arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
+					ARM_SMMU_CR0ACK);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out while disabling smmu\n");
+			goto fail;
+		}
+
+		/*
+		 * At this point the translation interface is disabled and the
+		 * SMMU won't access translation/config structures, even
+		 * speculatively, as per the IHI0070 spec (section 6.3.9.6).
+		 * CMDQ is still enabled so that a CMD_SYNC can complete any
+		 * previously issued commands.
+		 */
+
+		/* Ensure all previously issued commands have completed. */
+		ret = arm_smmu_cmdq_issue_sync(smmu);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out waiting for pending commands\n");
+			goto fail;
+		}
+
+		/* Disable everything */
+		ret = arm_smmu_device_disable(smmu);
+		if ( ret )
+			goto fail;
+
+		dev_dbg(smmu->dev, "Suspended smmu\n");
+	}
+
+	return 0;
+
+ fail:
+	/* Reset the device that failed as well as any already-suspended ones. */
+	arm_smmu_reset_for_suspend_rollback(smmu);
+
+	list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
+		arm_smmu_reset_for_suspend_rollback(smmu);
+
+	return ret;
+}
+
+static void arm_smmu_resume(void)
+{
+	int ret;
+	struct arm_smmu_device *smmu;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		dev_dbg(smmu->dev, "Resuming device\n");
+
+		/*
+		 * The reset will re-initialize all the base addresses, queues,
+		 * prod and cons maintained within struct arm_smmu_device as well as
+		 * re-enable the interrupts.
+		 */
+		ret = arm_smmu_device_reset(smmu);
+		if ( ret )
+			panic("SMMUv3: %s: Failed to reset during resume: %d\n",
+			      dev_name(smmu->dev), ret);
+	}
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
 	.page_sizes		= PAGE_SIZE_4K,
 	.init			= arm_smmu_iommu_xen_domain_init,
@@ -2867,6 +2985,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
 	.unmap_page		= arm_iommu_unmap_page,
 	.dt_xlate		= arm_smmu_dt_xlate,
 	.add_device		= arm_smmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+	.suspend		= arm_smmu_suspend,
+	.resume			= arm_smmu_resume,
+#endif
 };
 
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
-- 
2.43.0


