Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9SrBMNpcKWr3VgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476A669698
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b="Uj/nOgwv";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334260.1597358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKn-0001bE-ES; Wed, 10 Jun 2026 12:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334260.1597358; Wed, 10 Jun 2026 12:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKn-0001Vw-6g; Wed, 10 Jun 2026 12:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1334260;
 Wed, 10 Jun 2026 12:45:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJ8-000198-Ce
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJ7-007rhd-PW
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c52-2eae-0a2a0a5409dd-0a2a4506e28e-48
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:21 +0200
Received: from [40.107.162.86]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c61-7371-0a2a45060019-286ba256b90f-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:21 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:19 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:19 +0000
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
 b=oNPULTbuKpQUrV4rM2awB6yB43Uf2rsJ6TO9gLqRhBiXbJftBMvjVEKeR+daIZ/pceRHgQKOgyGJd+PbVoeAVFtdPTGACbQcIzh13uPpwn0prPfyckhlo6Kdo2jXbFQq8fb1mQB7zT/91iC1fBxpiSeJZlVyGYJr0vQPxcFtm2CrewdyksF5F52G2WdlGr13NFFksGPP9+miBfCxC54RCVZavy9siKhj/EZNw0894NtqHbeyv168s5pRC5qwSBP/vQXPy7DHOAql6/e7yRIwN59XZEiR+skI1hlbeE+ezteOSQHoZ9GkOVQ4ulSnWoaA+tWvX4xn9RFkF8zittfa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bykUR/xLFuasoQUfLUvHqdOV3+AtF8rtSjNfXAIXxmQ=;
 b=PQCitOZ0R0lcRnqBVTOpZS2KOggTGfExJQ+zSBhVCvSqhgBxAyLv8IRWak844tXHvJrGiLP6lVU7tKClYv6l3h6myUa/R5z5E9EIdZthoRw0Vyr8otXsbJ3U+6srAVtK+U1Ez5BLwi1M0OOm95HePFvG4imSY1pJRzLqfcgChgk6NOrlR35osTmBz7ifPbvngKtqBAuF3IOGluruK9nWUn12ZJObV/mrGCcOzvxYZquD+K4pUn19Ch9QFFT6ENZw26W4b65/fCwds8tt7CcQD4w8pDuDL9/Kn0vckym/jNCp58Ti21kd0hsPJLIoiArASfWsD9mVssTxu+0U/ebIGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bykUR/xLFuasoQUfLUvHqdOV3+AtF8rtSjNfXAIXxmQ=;
 b=Uj/nOgwvoWOIkLH0/YDRwOFA23RDi50CYyL5VYCdA2WthlMCjjBRBthfpCHxsEesnfI9BxPX1izVcvEA1Na9wMymVD13WAkI25GTQHOYyemCDNuixegsleTnxu99oYjFaEaJ36gX/iX1+c7YoINBDSsQ9DfWaEgQGI5SG9xNMOek5HRCgTHhgGVaefgFCo1ycLVjwlQX106+hgF6zmfUsCaXxf0jaxd3gYQjbgiooMFw3HUiaNxLQWxeeCnJ8yXpwA1IcCLGWMzoff6OmCEsjWMYCK3UAEZAVnQN9QDdU4arLpgVWPCIFF95+Vr63ztcYWhUx5bEBKAvcBfPhecSDQ==
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
Subject: [PATCH v11 03/13] xen/arm: gic-v3: tolerate retained redistributor LPI state across CPU_OFF
Date: Wed, 10 Jun 2026 15:44:23 +0300
Message-ID: <74b4ab2e7957e16a0b922dc5431a9ef6406acffa.1781084290.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 531d3c5f-fd17-4b77-ac2a-08dec6ee211b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IxwgL4M3TROMdrecNUHjKb7eB+gIKPCOCKacM36Ulw5DwNGBc+M6PCMLonm3tf83ZAZn46QrmngB6OkQ7D3P32MMd6wUvj3k82RE4Q1dKg1tBlVUdJqEd61w4/Y5wBqbzEdLFeY9M81SmxBzjjiE+JjPZBDDjmRp/eZDQqQWyCpunckPAN41+qLTfGaoRO26SkKa/nH1QR3vDx//+vYZrzVjmGvs5bLFiFCJjxH65C1PDkPQQmEdvhSkW2giD6z9gxRic4HBdZjJ7ahBU9426pBUtxhmiJSMV+Li1VAwdV4k3ZtZDGiwIqPkDU5EGQzxMlxjfenQEtIt7VUYNJHiDlzeHX0nj5x7RDL38RmqEgZDeWlIPXjlXnS7IiS9FLvrURmLIbK3L6RMErmsE1dRQLklgY72lH7LiDdNS8xZbcF/uyROE7KRHF+RmiyWcewh7xNmUhOtwE2becshbVAedpW45CgvzNg8tEHRob04zXnV6h4LrEsEdYVlSTdJ+Abg918f1f4zq58ZzE+aHzWQ1NnwqCU3QUvCnYfCq4y+aEGsZRs+PBKHTZCTjHHYwvWQRfaj08jCqYhJIhox0gX1ISc7V3Gez0WsHnW2ZJUvK+eaT8ZW9dkfO9Jlq7gyXttIlWsIbWD6gboCvfT6At1xGeq3NCXg2l021CIkc6njw4SDHfKjHI5ZPrwv5+0Gab4S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N6n/+sjLH8vU5wdBGCZBexT/ucXyQn1b0AGNUzEbiG2tTkbKeCdpYuPHQnFI?=
 =?us-ascii?Q?lVlMH36qViTf2V0B6KuZSiBCM+mHzHM5KUlq5wFyJqQ95IlGh49PREQY49dR?=
 =?us-ascii?Q?t/oHXH4X+w0JrwwDFKrZIk9mwn3mKHdtMr9Cy0P61xJIgEJemue0/AR+E5Ez?=
 =?us-ascii?Q?L2NBcxDjJb0E/jMdByr8a5tvFdajrIDlDzw4qajCjr2U51vWVjgJKUd1va8n?=
 =?us-ascii?Q?OGaHCTQ1sVjKSVr+VUzO7Ys7ReahNLRFXDh5nmPoFRMhj38F6fFVh06XJqW1?=
 =?us-ascii?Q?iUuLBLYeorGN5XCYAS+5ai1y/e7hCiqYcVInpB26oiKxYdzVQp/mwb3mtqCi?=
 =?us-ascii?Q?LcdsTx+Ml8Oe56Q9Xdkt43YhcPhJtyZKqK7dU1xpXRVeid7wpjgHz0n4Xekm?=
 =?us-ascii?Q?SdBEZD8dhre08VxYyoOPX4a/o6PsCz0BNIWt3LgbOewMXL0WbncAskEI4rJt?=
 =?us-ascii?Q?EbmifODj4RMP2CfUVg0Gq3NADEibc/nSTIxNSgiWSW0FuWvH3PrNODM39ngZ?=
 =?us-ascii?Q?0sG5yPsQz44SM0mbaJT0snGQtYV+0UdmVyKeUJc3sI80iU910HmuNv0WzQTR?=
 =?us-ascii?Q?Hg+cg4e18dzOCTQlM0v2aPI8yR6nR696VxKf4DQJNevReJARcrxluhcbY6Lo?=
 =?us-ascii?Q?UJrSl9SNnkjkJCHQZsyHbaSP8gLezHx/zFHFi3LqOEmAzc2cJ/VfN1DkLdr+?=
 =?us-ascii?Q?8dMLMA7DtTCl0DdhcOcCdBxrmDB+6Y7s7a7Jz8VAXvFbtXOUixqXfg8oyI5I?=
 =?us-ascii?Q?uTVxphmz6oYsNobEDZduUv1YqZkWd7LucrFuQNcwbVFbVSe54C0dGF2Yyaxe?=
 =?us-ascii?Q?I0DQNnOW8K3hgf5UTcHykPUbObggz8cdyfmb7Hp/l1T1muctgqrr95iS4Pv3?=
 =?us-ascii?Q?T9N50jIKa/8ZUs6fQcJEBQ1svgUp0v95efRdyuRxmCT/nRTXV7lPqkihjQOA?=
 =?us-ascii?Q?Cvq4dSqAiX9JiSpHzKLYP/VmhJWqef5WcK/wsTwoLNFSr/ixLT3JS2kM25K8?=
 =?us-ascii?Q?rSmJEc6TTH2IIdr/wjLsMRot9JlTjTLwJtPSqyVuhuJwQLsV1gB+SIPCWpCj?=
 =?us-ascii?Q?NWHQn2xIsX9SCLPEAFt4nlSXgc/UdKR44yEzNha4rGLHe3mg+f3ZhFaH9yxl?=
 =?us-ascii?Q?vn2L7JRKOztyeFnSl6+9G4NZfpbeCi/jyEcqYpWFKVhahMlIt+ou+Net/mKO?=
 =?us-ascii?Q?pv+F6URXSfFDD9GaJRPTqVxLoPKGmm87Ybc0A4qlgqJBWKXf+MQfzYT//quw?=
 =?us-ascii?Q?t2CDpB4ZHeDIpW+Brxoo1qfuPnnR7e6CiGoXh4HDCuoWEUwGwY7b9HwDOOvo?=
 =?us-ascii?Q?OrDzP4juGkdTDFhiWeujQXdKHyRCwaP/TL4lfnD3hfg3HghVDR/qawF5/Tad?=
 =?us-ascii?Q?Wu19f3yDHvbMP9qxO72Q0sMVyxVYU5kLUFBzON5XxkbPkwQ3e2xslGbtaf4B?=
 =?us-ascii?Q?HOVq3gkpANS+diWLcFFg+cSqcl8sfM9fu38q4bAPLdlW8EDhjlMcbhEqqqcn?=
 =?us-ascii?Q?8EQ2xNdLbqWCtOG/CSDZIf7TljkHeLRUq/uW5fVEoKrcetRF9tb6RSLnEkbv?=
 =?us-ascii?Q?bawbg5bLPIoZ6vaGDCijIL6BTj+XjSTJuehIehci0owxvW3IH/eZjfWflTLB?=
 =?us-ascii?Q?M3qM1t4AU0zDI49pTNHUUX5SPKHemga3Qhc5ODyokIdVT0Ii+fdTWWXKhhGP?=
 =?us-ascii?Q?ctZrxf8ul4AANbS/01xbZ6yOkpWwSVTVeEHF8EMNT6J9f5awrJcdYLlCGhr+?=
 =?us-ascii?Q?7Fzp7QDutw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531d3c5f-fd17-4b77-ac2a-08dec6ee211b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:19.4427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fKHJ0L1tV7aXttg9KOqJXAjlTuJN5Vf1l2nikbUoGBH7SvWfk5JEput8+rMNnDLYQAovoJffEgGXazh6ndUHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-16d1c6/1781095521-7F77FD75-6431D11C/0/0
X-purgate-type: clean
X-purgate-size: 9556
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
X-Rspamd-Queue-Id: 5476A669698

PSCI does not guarantee that a GICv3 redistributor is powered down across
CPU_OFF -> CPU_ON.

DEN0022F.b says CPU_OFF powers down the calling core (5.5) and CPU_ON
brings the core back with a defined initial CPU state (5.6, 6.4).
However, PSCI leaves interrupt migration and GIC re-initialization to the
supervisory software/firmware stack: the caller must migrate interrupts
away before CPU_OFF (5.5.2), and the execution context that is lost in a
powerdown state must be saved and restored by software (6.8). PSCI also
calls out GIC management explicitly in 6.8, including retargeting SPIs,
preventing PPIs/SGIs from targeting a powered down CPU, and reinitializing
the CPU interface after CPU_ON.

This matches the GIC architecture. IHI0069H.b Chapter 11.1 requires the PE
and CPU interface to share a power domain, but explicitly allows the
associated redistributor, distributor, and ITS to remain powered while the
PE and CPU interface are off. All other GIC power-management behavior is
IMPLEMENTATION DEFINED. DEN0050D Chapter 4.2, "Generic Interrupt
Controller (GIC)", says the GICv3 redistributor may live either in the AP
core power domain or in a relatively always-on parent domain. So after
CPU_OFF -> CPU_ON a secondary CPU can legitimately come back to a live
redistributor with GICR_CTLR.EnableLPIs still set.

Handle that case in the LPI setup path instead of assuming a fully reset
redistributor.

The LPI path needs special care because the GIC spec makes redistributor
LPI state sticky and partially implementation defined. IHI0069H.b 5.1.1
and 5.1.2 say that changing GICR_PROPBASER or GICR_PENDBASER while
GICR_CTLR.EnableLPIs == 1 is UNPREDICTABLE. After clearing EnableLPIs,
software must wait for GICR_CTLR.RWP == 0 before touching the pending
table. The architecture also permits implementations where, once
EnableLPIs has been set, clearing it again is not guaranteed to work.
Where an ITS is present, the spec strongly recommends moving LPIs to
another redistributor before clearing EnableLPIs.

Because of that, treat a retained EnableLPIs state as valid when the
redistributor still points at Xen's expected PROPBASER/PENDBASER tables.
Only try to clear EnableLPIs when the retained configuration does not
match Xen's state, and wait for RWP before reprogramming the tables.

This is also consistent with platform firmware reality: PSCI and the GIC
architecture allow platform-specific redistributor power handling, and not
all platform firmware implementations force a full redistributor power-off
through implementation-defined controls during CPU_OFF. Xen therefore needs
to tolerate retained redistributor state on secondary CPU bring-up.

Keep gicv3_populate_rdist() resident as well, because gicv3_cpu_init()
reuses it on secondary CPU bring-up after init.

Tested using Xen's non-boot CPU disable/enable path on Arm
FVP_Base_RevC-2xAEMvA, both with and without:
-C gic_distributor.allow-LPIEN-clear=1
-C gic_distributor.GICR-clear-enable-supported=1
and on Orange Pi 5.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v10:
- Drop unrelated gicv3_populate_rdist() printk() format cleanups to keep
  the patch focused on retained redistributor LPI state.

Changes in v9:
- move gicv3_do_wait_for_rwp prototype from its related header to gic.h
- drop __init from gicv3_populate_rdist(), which is reused on secondary
  CPU bring-up after boot
- changed print format for smp_processor_id in gicv3_populate_rdist func
- cosmetic changes
---
 xen/arch/arm/gic-v3-lpi.c      | 77 +++++++++++++++++++++++++++++++++-
 xen/arch/arm/gic-v3.c          | 15 ++++---
 xen/arch/arm/include/asm/gic.h |  4 ++
 3 files changed, 90 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 9ee338edc2..847da26ff7 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -81,6 +81,13 @@ static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redist);
 #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
 #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
 
+#define GICR_PROPBASER_XEN_MASK  GENMASK_ULL(51, 12)
+/*
+ * For retained redistributor state, match the pending table by address only.
+ * Attribute bits such as PTZ may not read back with the programmed value.
+ */
+#define GICR_PENDBASER_XEN_MASK  GENMASK_ULL(51, 16)
+
 static union host_lpi *gic_get_host_lpi(uint32_t plpi)
 {
     union host_lpi *block;
@@ -296,6 +303,60 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
     return 0;
 }
 
+static uint64_t gicv3_lpi_expected_proptable(void)
+{
+    return virt_to_maddr(lpi_data.lpi_property);
+}
+
+static uint64_t gicv3_lpi_expected_pendtable(void)
+{
+    return virt_to_maddr(this_cpu(lpi_redist).pending_table);
+}
+
+static bool gicv3_lpi_tables_match(void __iomem *rdist_base)
+{
+    uint64_t propbase, pendbase;
+
+    if ( !lpi_data.lpi_property || !this_cpu(lpi_redist).pending_table )
+        return false;
+
+    propbase = readq_relaxed(rdist_base + GICR_PROPBASER);
+    pendbase = readq_relaxed(rdist_base + GICR_PENDBASER);
+
+    return ((propbase & GICR_PROPBASER_XEN_MASK) ==
+            (gicv3_lpi_expected_proptable() & GICR_PROPBASER_XEN_MASK)) &&
+           ((pendbase & GICR_PENDBASER_XEN_MASK) ==
+            (gicv3_lpi_expected_pendtable() & GICR_PENDBASER_XEN_MASK));
+}
+
+static int gicv3_lpi_disable_lpis(void __iomem *rdist_base)
+{
+    uint32_t reg = readl_relaxed(rdist_base + GICR_CTLR);
+    int ret;
+
+    if ( !(reg & GICR_CTLR_ENABLE_LPIS) )
+        return 0;
+
+    writel_relaxed(reg & ~GICR_CTLR_ENABLE_LPIS, rdist_base + GICR_CTLR);
+
+    /*
+     * The spec only guarantees programmability when we have observed the bit
+     * cleared. Where clearing is supported, RWP must reach 0 before touching
+     * PROPBASER/PENDBASER again.
+     */
+    wmb();
+
+    ret = gicv3_do_wait_for_rwp(rdist_base, GICR_CTLR_RWP);
+    if ( ret )
+        return ret;
+
+    reg = readl_relaxed(rdist_base + GICR_CTLR);
+    if ( reg & GICR_CTLR_ENABLE_LPIS )
+        return -EBUSY;
+
+    return 0;
+}
+
 /*
  * Tell a redistributor about the (shared) property table, allocating one
  * if not already done.
@@ -374,7 +435,21 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)
     /* Make sure LPIs are disabled before setting up the tables. */
     reg = readl_relaxed(rdist_base + GICR_CTLR);
     if ( reg & GICR_CTLR_ENABLE_LPIS )
-        return -EBUSY;
+    {
+        if ( gicv3_lpi_tables_match(rdist_base) )
+            return -EBUSY;
+
+        ret = gicv3_lpi_disable_lpis(rdist_base);
+        if ( ret == -EBUSY )
+        {
+            printk(XENLOG_ERR
+                   "GICv3: CPU%u: LPIs still enabled with unexpected redistributor tables\n",
+                   smp_processor_id());
+            return -EINVAL;
+        }
+        if ( ret )
+            return ret;
+    }
 
     ret = gicv3_lpi_set_pendtable(rdist_base);
     if ( ret )
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 17ff85ef5d..cae4ec28a1 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -275,7 +275,7 @@ static void gicv3_enable_sre(void)
 }
 
 /* Wait for completion of a distributor/redistributor change */
-static void gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
+int gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
 {
     uint32_t val;
     bool timeout = false;
@@ -299,17 +299,22 @@ static void gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
     } while ( 1 );
 
     if ( timeout )
+    {
         dprintk(XENLOG_ERR, "RWP timeout\n");
+        return -ETIMEDOUT;
+    }
+
+    return 0;
 }
 
 static void gicv3_dist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
+    (void)gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
 }
 
 static void gicv3_redist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
+    (void)gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
 }
 
 static void gicv3_wait_for_rwp(int irq)
@@ -866,7 +871,7 @@ static bool gicv3_enable_lpis(void)
     return true;
 }
 
-static int __init gicv3_populate_rdist(void)
+static int gicv3_populate_rdist(void)
 {
     int i;
     uint32_t aff;
@@ -934,7 +939,7 @@ static int __init gicv3_populate_rdist(void)
                     gicv3_set_redist_address(rdist_addr, procnum);
 
                     ret = gicv3_lpi_init_rdist(ptr);
-                    if ( ret && ret != -ENODEV )
+                    if ( ret && ret != -ENODEV && ret != -EBUSY )
                     {
                         printk("GICv3: CPU%d: Cannot initialize LPIs: %u\n",
                                smp_processor_id(), ret);
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index fbf0d69edd..84e146b832 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -301,6 +301,10 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_GICV3
+int gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit);
+#endif
+
 #ifdef CONFIG_SYSTEM_SUSPEND
 /* Suspend/resume */
 extern int gic_suspend(void);
-- 
2.43.0


