Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bHjQJNlcKWrwVgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B3C66967F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=IjzzpeQM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334257.1597352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKn-0001Vh-37; Wed, 10 Jun 2026 12:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334257.1597352; Wed, 10 Jun 2026 12:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKm-0001Ou-Ug; Wed, 10 Jun 2026 12:47:04 +0000
Received: by outflank-mailman (input) for mailman id 1334257;
 Wed, 10 Jun 2026 12:45:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJ6-00018v-KG
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJ6-007rhd-0F
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c52-2eae-0a2a0a5409dd-0a2a4506e28e-44
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:19 +0200
Received: from [52.101.69.129]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c5f-7371-0a2a45060019-346545819085-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:19 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:16 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:16 +0000
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
 b=K/hhWj5WJd5hc85c6PXMB+N0EUi607sahOxlc4iK2BtVQ8SquVflO2n1+KUB+omBU3S2vXBG/2SG9aAs95k0ZEV4OsaCk/kYuXbeieXfQKeQlHJQvBxyYFxA7yTCsBp95mXimpcOJhOtpjf2MTfZpoy6vrod+8i5leVUrr2RuG1qef5Bbg1YR/OL0hXe9NkOCvj195/lMTLO4eBNXhBYBWzwOr5KIEA6MuN09Y5xl3HHb8Oz3j7tjazMiU4op7ce6Bc8DwgJyUB6LWlOh2MBhbhG7VwiV82PXhcF47VeVQYVAaoD1A/ecemCoqwLoJNfexPof7AdnqT2yaszxuijSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFH8jnaLS3sxcH//YEoJ5xUIiJKXTPNp5wgdig2F9i0=;
 b=N9yKyIfg0/lExcnDXkTNtiD+1wVj7PkgjgUido9mqxddNwr6A3rmWxnsF/LH7K1N77+C9AP8BSiqommwUy64LaCoEFEFCkEiB8vq/AKxsJuDP3YEMKbXJzrpBXc0zJfsRmlVShn9gGXxK6sIKG803uewinV56ETNOfVJEeZmV//ZdXAULHD9lv2+k4iYNWdz3sXr7s6hjIzuoP3FaQQHqoxlO/rIvaMKKFdW/fzhrAkrKYkTGWcrQoornfX+r/i4qNZlr3bAw5oVndal2gZUNttJOJRNEkt3nbxoRJzONz2nyHvzZv0/zwgI2FTJvaR9I8z76lElBQCrbJDmf1Ogsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFH8jnaLS3sxcH//YEoJ5xUIiJKXTPNp5wgdig2F9i0=;
 b=IjzzpeQMfILK2LYUv6/MIpxDVDMKnJT/QWDXFwaUOe7GS1v/EvOudHf6RRkKnKYkeOoiyrkwgJXN0IhjHYvpqzognusaSRMkwLfThfPSZs+xbdM7eC4THlaz7KyDmifLwJMDs48scnNFPRrZCZedOtOmRacEfmp00ZNkGPMxBlGucjldy+KcFAc79VeSPWQVGRLTCMLhhozcO8M9JJus7thw2LYIY4EWv52Dftq239JnHwwgnPJRgPYzUcO60F43Ixc6HWdayZa4N/jrAzPLEd3ZoWL5bSZSbc6EOdn30VtOitS02Gn887NUlSBQywUPAXQQz+QN9Gcn4NtzpC14WQ==
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
Subject: [PATCH v11 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
Date: Wed, 10 Jun 2026 15:44:22 +0300
Message-ID: <e8a716c7660bd90fef49f2611542152cf2a4fa80.1781084290.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: dc26a7e2-55f7-46b3-0479-08dec6ee1f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|20046099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sMAHFHteUnyIFhFo+S39iU3/oNWgXAnXo5eBcsceyXVNPycAmnaxqU/P26ZsIixyBEiot12FgvJK7qIXBhUQPA6B8SBnoIVGjrMxt5qlAALat67S3uZLna79gfjua5jPhIpujqqv7sxhAwdkd94B1ay+H9y0pJTlGm56ZnjvdUe/ZphAHmynJEMs6+hxd21PCCd7zZy5zl160XjfZAhE5CsG0b3Owv/SuWO1R1M++sK2huw2llqGZySffSdq5r1VpXgjjhJ7NTuh2INHPyks7hDqzvdCgdTN9IDqwGpug5b8OySAOaod85VP3dsg+y7NU3/+63xz11RGwu83HH7SG0kqT33C2Y4fHSMl+6YONu2jn1iBW/hVleoOYQa89ood4ZDRzOmp63BPG+yciPzUIguLjQ/1TXskslSf95nccQZV/sr5XigAF6Q/9isgQrWPer4y9C6lXVcdM99DpeR1E+YEzt+AvcjmSQoeNf8vJ792hHtPrIKtxj1fmuaoOB68gPB42Tz+BAalVz/pISJGkrsPopwENQVuzsyGE2VXSbZu/hthPb8RhifaI8KhKkkbN/hKaXds2n5oKwrOcP88l+7v8syXx2G+0Lgh0nQjbwKfhIx3wPpuwLooLWnro0pt66WObXB4qzyPWuftfqcMKEddQzFn/YceAQgcsV/sSwCi53NlrKkECXZwo2ejEbEE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(20046099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wpe5BZiXIAy0KoSasViuJqF8COV9zuF/y9j9m/UoN2USJqa9Jy/M3fTF7jcs?=
 =?us-ascii?Q?m8K3Qav9sOgF7DvVqvluPrNhNzA71ubqOW0owvRuoB+C0ybXJ5lo3NphdvQn?=
 =?us-ascii?Q?mrLz2X+6K2HCTGhGYPHV7yI4BbRoFSaJl381f/7BCAvGQb0aQvsFfpIIJCKR?=
 =?us-ascii?Q?W1dWAxg+zBsP1Oz8a9T3VmX9XiVrbajJSf+2awlJT1LyD+zKacjcBiUWrM85?=
 =?us-ascii?Q?9ESmzQqyp5dG5tloEBLEtQUtH6XA5wAXfdS4h533H+qdRproPAWoOTaEQrIi?=
 =?us-ascii?Q?xngK8sGFAevS+YF8fuB3UJxThb4zVUkyNptoz8nvLAd+BMrqe7RCdZFRUDdR?=
 =?us-ascii?Q?X7CcIv8si/+VpgRzFJvXZ4T91cdCFWz/wOjBt4mqJbrpy67EjWPTIbWpBrm8?=
 =?us-ascii?Q?3mY/53xklnr/3RPNzLfdxGR5GsWH+E33CxNCmPnd4rK1pEcsDTG9OpqYpfPn?=
 =?us-ascii?Q?7c+4O9lQmjsFBFiq8eGNmGJUfspe+5bQrapbT4fqFHNsM4RIMmV/LpgwrUh2?=
 =?us-ascii?Q?XysMEOrHDlgU1B73qYkvD3A1hPfvX2dFjR4df5fhem7o39rdCLGTE+SDKQ+G?=
 =?us-ascii?Q?hhRVHYESJ1whTjU66YlGY1I1dHfPzNN2PPI3L05Ilh0Nrb3TcRvnu+KwEJZq?=
 =?us-ascii?Q?mB0/UXHBZkFsTE1GkKWP+yMsEMrw1dSmPI0jzZLjS+cwM+PtOCFxtYgvprHL?=
 =?us-ascii?Q?EbW27CXbNxad4LiwaJmu0YHVk5ehXZb1kbUw6N9hAayeFAo8nGTgebrhQlBC?=
 =?us-ascii?Q?9FRXQ7O37hVS56xNid2ibESxyniizbv5D+kdQCTBHQ5nbEkSgfo8g3hIYeXQ?=
 =?us-ascii?Q?CIrA4e/r6AX4LxTMbOdHnfI99HL7eTdfTd1g81b92hL9BtOxn5boV11iCA0g?=
 =?us-ascii?Q?1TLrhxwBePuqdGW/MlrtpIu+hVcgdRou3R6LAt/CgFbkxzzHczqxaDzyDYKp?=
 =?us-ascii?Q?xYaZDiHsratdu+rL4Xo5dab4WSpfjB4K4mEbjvR0QSn7mRYZOVJPm1pAcgvj?=
 =?us-ascii?Q?t8OE0VC6GljrG+QwUyLMNT1H9I7BaGEPUJ5HP2RImZRpDAm+W7EsIYb/Iopt?=
 =?us-ascii?Q?N5zHEnGPAJ3fvhoC/N0vOfQVX88R8GkIQFuJDu6eThBRtXFi2tob3DDdSH7J?=
 =?us-ascii?Q?NisjWQ7RAfW33DLoD0l0JXe3mecim0tGDsz51tDAw3Zzd6cuEFRX18V/JOdK?=
 =?us-ascii?Q?h50g0+1zq7xWvFvFS1j4LFCWjbK+u7zmkyVeXWpq1GjmOcvEMHXSCTKTbSj6?=
 =?us-ascii?Q?0DdYOkdo+gvNGET45NXv6gDDkxhV3+fD7MjcUeX/wQY9amR1tKGs2QVJ+qSS?=
 =?us-ascii?Q?GMn+Y57mKfXQf4NPNcsbqyorcesVkxwb9fDkr3GLQ8QkSbYSwyOdVqA9qdXq?=
 =?us-ascii?Q?Qe7Mw/HPjwWwrcGpLquWDJWCfbLAOHqIa+ySUb4rbvfOq0eFX3AD7knPbp32?=
 =?us-ascii?Q?hf8KgN5YWxjVl2ZOePLwS3pjnJokFMiy+z61vlwIOAyA7VhBuWsVkL65a3WF?=
 =?us-ascii?Q?5sDkG4FW+7eSNbPF/sH+JSIIPPNUAoqMkO77GiEFNT6W6jYEq14GYTQGBBpP?=
 =?us-ascii?Q?ZbI8pJCnFniusxxp0eRoexGezqYiH1+J1eAEBuwPrmBpG4ZWnjLy9/t5ry6L?=
 =?us-ascii?Q?STEZAROD4ClNdl2ONbHfqoGngizHg7pH5v/RrluvrQjkYY7afXQ8Dft8voZw?=
 =?us-ascii?Q?kIoONay4cx5yewLl1WeB0YMkd0xxchPTd30/jzjDdFPO5ZL3bKzkjEQ6AT+c?=
 =?us-ascii?Q?Og8IkJWW2g=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc26a7e2-55f7-46b3-0479-08dec6ee1f52
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:16.4596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1q+d8Vl18SXyCwU3glgXzM3qxWh73sErasTFoumNW1WZuhgpzvNQuzpFNFnJIQtf/cykAIdOdnV5/8Gajzctg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-16d1c6/1781095519-86974D75-4C6A66A1/0/0
X-purgate-type: clean
X-purgate-size: 13573
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
X-Rspamd-Queue-Id: C1B3C66967F

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Transient physical SGI pending state (GICD_CPENDSGIRn/GICD_SPENDSGIRn)
is intentionally excluded. CPU-interface active-priority state is also
not restored across suspend/resume. Xen reaches the final suspend path
at a quiescent point, so there is no active-priority execution context
to replay after resume. Enforce this with a runtime check after
disabling the CPU interface: if any implemented GICC_APRn word is still
non-zero, restore GICC_CTLR and abort suspend with -EBUSY.

This does not apply to distributor active state. With GICv2 EOImode==1,
EOIR only drops the interrupt priority; final deactivation is a separate
step. For guest-routed interrupts, Xen can have already EOIed the physical
IRQ while deactivation is still pending on the vGIC/GICV path. Therefore
GICD_ISACTIVER is preserved as architectural in-flight interrupt state.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V10:
- Limit GICC_APR<n> active-priority checks to APR bits visible from
  the Xen CPU-interface view.
- Avoid touching reserved GICD_IPRIORITYR/GICD_ITARGETSR words when the
  last implemented interrupt block is partial.
- Restore distributor configuration before restoring interrupt enable
  state, so GICD_ICFGR is written while the corresponding interrupts are
  disabled.

Changes in V9:
- Skip saving/restoring GICD_ITARGETSR0..7 because SGI/PPI target
  registers hold no state (read-only on MP, RAZ/WI on UP).
- Add a runtime GICC_APRn quiescence check after disabling the CPU
  interface, and restore GICC_CTLR before returning -EBUSY.

Changes in V8:
- disable cpu interface + distributor before suspend
- change 0xffffffff to GENMASK;
- cosmetic changes;

Changes in V7:
- Allocate one contiguous memory block for the GICv2 dist suspend context.
- gicv2_resume() no longer unconditionally re-enables the distributor/CPU
  interface; it now writes back the saved CTLR values as-is.
- gicv2_alloc_context() now returns 0 on success and panics on failure,
  since suspend context allocation is not recoverable.
---
 xen/arch/arm/gic-v2.c          | 226 +++++++++++++++++++++++++++++++++
 xen/arch/arm/gic.c             |  29 +++++
 xen/arch/arm/include/asm/gic.h |  12 ++
 3 files changed, 267 insertions(+)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 43a379fdda..a0ef6ffc7f 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1108,6 +1108,223 @@ static int gicv2_iomem_deny_access(struct domain *d)
     return iomem_deny_access(d, mfn, mfn + nr - 1);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents block of 32 IRQs */
+struct irq_block {
+    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
+    uint32_t ipriorityr[8];
+    uint32_t isenabler;
+    uint32_t isactiver;
+    uint32_t itargetsr[8];
+};
+
+/* GICv2 registers to be saved/restored on system suspend/resume */
+struct gicv2_context {
+    /* GICC context */
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+    } cpu;
+
+    /* GICD context */
+    struct dist_ctx {
+        uint32_t ctlr;
+        /* Includes banked SGI/PPI state for the boot CPU. */
+        struct irq_block *irqs;
+    } dist;
+};
+
+static struct gicv2_context gic_ctx;
+
+#define GICV2_NR_APRS          4
+#define GICV2_APR_BITS_PER_REG 32U
+
+static int gicv2_check_active_priorities(uint32_t bpr)
+{
+    unsigned int i, apr_bits, nr_aprs;
+
+    /*
+     * Xen writes GICC_BPR to 0 during CPU init and does not change it. Per
+     * IHI0048B.b, a write below the implementation minimum reads back as the
+     * minimum supported BPR value. Table 4-47 maps that Xen-visible BPR value
+     * to the visible GICC_APR<n> bits. Avoid reading APR registers outside
+     * that visible range.
+     *
+     * This covers both GICv2 with and without Security Extensions.
+     */
+    apr_bits = 1U << (7 - (bpr & 0x7));
+    nr_aprs = DIV_ROUND_UP(apr_bits, GICV2_APR_BITS_PER_REG);
+
+    ASSERT(nr_aprs <= GICV2_NR_APRS);
+
+    for ( i = 0; i < nr_aprs; i++ )
+    {
+        unsigned int bits = min(GICV2_APR_BITS_PER_REG,
+                                apr_bits - i * GICV2_APR_BITS_PER_REG);
+        uint32_t mask = GENMASK(bits - 1, 0);
+        uint32_t apr = readl_gicc(GICC_APR + i * 4) & mask;
+
+        if ( !apr )
+            continue;
+
+        printk(XENLOG_ERR "GICv2: suspend aborted: GICC_APR%u=%#08x\n",
+               i, apr);
+        return -EBUSY;
+    }
+
+    return 0;
+}
+
+static int gicv2_suspend(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+    int ret;
+
+    /* Save GICC_CTLR configuration. */
+    gic_ctx.cpu.ctlr = readl_gicc(GICC_CTLR);
+
+    /* Quiesce the GIC CPU interface before suspend. */
+    gicv2_cpu_disable();
+
+    gic_ctx.cpu.bpr = readl_gicc(GICC_BPR);
+
+    /*
+     * Check the active-priority state for the group Xen drives through the
+     * CPU interface. GICC_CTL_ENABLE enables Group 0 without SecurityExtn and
+     * Group 1 in Xen's Non-secure view with SecurityExtn, and in both cases
+     * the relevant state is visible through GICC_APRn. The APR layout is
+     * implementation-defined, so only test the bits visible from Xen's CPU
+     * interface view instead of reading every possible APR register.
+     */
+    ret = gicv2_check_active_priorities(gic_ctx.cpu.bpr);
+    if ( ret )
+    {
+        writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+        return ret;
+    }
+
+    gic_ctx.cpu.pmr = readl_gicc(GICC_PMR);
+
+    /* Save GICD configuration */
+    gic_ctx.dist.ctlr = readl_gicd(GICD_CTLR);
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+        size_t nr_regs = ARRAY_SIZE(irqs->ipriorityr);
+
+        if ( i == blocks - 1 )
+            nr_regs = DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
+
+        irqs->isenabler = readl_gicd(GICD_ISENABLER + off);
+
+        /*
+         * Save distributor active state as part of the hypervisor-owned
+         * physical interrupt state. In GICv2 EOImode==1, EOIR only drops the
+         * priority; final deactivation is separate. For guest-routed
+         * interrupts, Xen may have EOIed the physical IRQ while the guest/vGIC
+         * side still owns the deactivate step. Therefore GICD_ISACTIVER can
+         * legitimately remain set even though transient SGI pending state and
+         * CPU-interface active-priority state are expected to be quiesced here.
+         */
+        irqs->isactiver = readl_gicd(GICD_ISACTIVER + off);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < nr_regs; j++ )
+            irqs->ipriorityr[j] = readl_gicd(GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < nr_regs; j++ )
+                irqs->itargetsr[j] = readl_gicd(GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            irqs->icfgr[j] = readl_gicd(GICD_ICFGR + off + j * 4);
+    }
+
+    return 0;
+}
+
+static void gicv2_resume(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gicv2_cpu_disable();
+    /* Disable distributor */
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+        size_t nr_regs = ARRAY_SIZE(irqs->ipriorityr);
+
+        if ( i == blocks - 1 )
+            nr_regs = DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICENABLER + off);
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < nr_regs; j++ )
+            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < nr_regs; j++ )
+                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->isenabler);
+        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICACTIVER + off);
+        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
+    }
+
+    /* Restore distributor control state. */
+    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
+
+    /* Restore GIC CPU interface configuration */
+    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
+    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
+
+    /* Enable GIC CPU interface */
+    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+}
+
+static void __init gicv2_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gic_ctx.dist.irqs = xzalloc_array(struct irq_block, blocks);
+    if ( !gic_ctx.dist.irqs )
+        panic("Failed to allocate memory for GICv2 suspend context\n");
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #ifdef CONFIG_ACPI
 static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
 {
@@ -1312,6 +1529,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context();
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1355,6 +1577,10 @@ static const struct gic_hw_operations gicv2_ops = {
     .map_hwdom_extra_mappings = gicv2_map_hwdom_extra_mappings,
     .iomem_deny_access   = gicv2_iomem_deny_access,
     .do_LPI              = gicv2_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv2_suspend,
+    .resume              = gicv2_resume,
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 /* Set up the GIC */
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3..7727ffed5a 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -432,6 +432,35 @@ int gic_iomem_deny_access(struct domain *d)
     return gic_hw_ops->iomem_deny_access(d);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+int gic_suspend(void)
+{
+    /* Must be called by boot CPU#0 with interrupts disabled */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+
+    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
+        return -ENOSYS;
+
+    return gic_hw_ops->suspend();
+}
+
+void gic_resume(void)
+{
+    /*
+     * Must be called by boot CPU#0 with interrupts disabled after gic_suspend
+     * has returned successfully.
+     */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+    ASSERT(gic_hw_ops->resume);
+
+    gic_hw_ops->resume();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_gic_callback(struct notifier_block *nfb,
                             unsigned long action,
                             void *hcpu)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index ff22dea40d..fbf0d69edd 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -301,6 +301,12 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/* Suspend/resume */
+extern int gic_suspend(void);
+extern void gic_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* SGI (AKA IPIs) */
 enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
@@ -444,6 +450,12 @@ struct gic_hw_operations {
     int (*iomem_deny_access)(struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Save GIC configuration due to the system suspend */
+    int (*suspend)(void);
+    /* Restore GIC configuration due to the system resume */
+    void (*resume)(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 extern const struct gic_hw_operations *gic_hw_ops;
-- 
2.43.0


