Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GJkgGxi8UGoN4QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 11:32:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD9739129
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 11:32:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=UXpTV+2M;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358984.1612798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi7aF-0004nw-9R; Fri, 10 Jul 2026 09:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358984.1612798; Fri, 10 Jul 2026 09:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi7aF-0004m2-5K; Fri, 10 Jul 2026 09:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1358984;
 Fri, 10 Jul 2026 09:31:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wi7aD-0004lw-Oo
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:31:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi7aC-0004Pf-20
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 11:31:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50bbe6-bab6-0a2a0a5309dd-0a2a4502c9be-48
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 11:31:44 +0200
Received: from [52.101.83.123]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50bbff-64c6-0a2a45020019-3465537b4eef-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 11:31:43 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7623.eurprd03.prod.outlook.com (2603:10a6:20b:347::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 09:31:41 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 09:31:40 +0000
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
 b=L4CA/7MNBkaWsS5HjziKYW91XIsjFpLVfFL/a1gC+7q1jjI20a0Jb3fKisvy2IUIB9hYG1DaGtc6ysm3jszdHHdNX8RE5Ok+qnXmqpCDrqp5ssz5CgQo2zYkuXVz1OytMmFL0fda2Zv6/odnLiLNVjMp6Xsfqeip/VBH5W9kslvlkfZGRDvP7fO0QCnfPfLe1XSlTR1WZiUQzaMIqQq5E3aGBnH4otv+/L3HaHe13ewbu2n87mgwwW6IytIRjthyAHgS3RFKbsQeUPe8G5eNe/IlTYZgXFXShSmXflEsvRXRxQ2vbVceXQKEyAnxhZdd4QFMY0Zxvjp/vvu8MCyEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGXDRuW/f7CWYCtAYcf9TvTLmljnHD5xqyHUbgUagZI=;
 b=C0MpLc+TsLcNAj7g83aeE1A9IlliRTl7TAnYPiRd+28xnfO7tinftrm1hW0FHcLTjOSHMx6DH7RQwal0hHJrkzB/XUOGj04i57UQUPi3sgGc+Z+xlxbLrDDNznpzbe975e+6nfA9ZkKJp4eym7qOKNoLRMkTOWKR0RQQhhRKVdPLUiuwBJBiBDJC4v9KsQROAmrfVU8VkASF95VR+foYl2vWjkPttQSYnHmsFUqS4WIeVJDdooM8jbArbeni0sRcbQQLhQBLaCt+8BexxsOW24UXXyBgTFMUcrge+WqX+uMsdNYrdGv5ssOB/Ol1O5hxc/tEmoonCIJp9j4KX43FrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGXDRuW/f7CWYCtAYcf9TvTLmljnHD5xqyHUbgUagZI=;
 b=UXpTV+2MfCVS+vY7xnhtp2XI8S+psYfbKa8hUDWxuToiK0VAJHhB7NxtOYfZMCIJEEft4WFpXZz4mC4YgehvbgELciBXjHlSrqEAyFjrPQIOEm7CUW43KCtnLDdLgoJsYvGD7bz/PvMQudFvhCU9bFP2j+kzcjRlcQB7Z34+uQF4WjwnbcvdI9kQ3+nU63Q9S7gZnYnmPpyE0gcTy55C5EWF+XQobn0/NZYJPLyvZDY3eQdIDKUA2NOO7o5CcfFH2LoZP9e5YBosFObTcn4aCtHjqB1pMUOlE+NEVs0W6JSwMh4x/PhC5UkPkDOi86QnscqRf6CfLoYhOvzateG5xg==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.22] xen/arm: derive GIC CPU interface ID fields from the vGIC
Date: Fri, 10 Jul 2026 12:31:31 +0300
Message-ID: <ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: 65618ea2-ead9-4244-1dd0-08dede660b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	GRIsvaPzdegHlIBdzJJZh0ec7jQE20yzMNpFWiAiHszPaw2eezOZ9YcnWC7wkhttbri/YiACBIYQL2eAEQ5/QiQIudXboAPp7vassR0rMJqWWbCvopz9ns+kQuGN5KZOPcpGM2Meuy+66KLqtmR7iuOugb9ri4jjjlXZ7yXJNMPkH0wdVjcXBct4X+/N0pfzz9BkrGmeNxNe2DkXJluoXAdbIA68yYZHkpDEFnLUGI8onwmPgoT4dfa8nomqJT2qqXoDXIu5A6aBCXrOUeHhapm6EugyQTxWu28uM30tG2xbjL98IqNknYR0Jy9zj8te6fKzDApdi5j2UKr/P3oiHyM7krJ89fWWGPZt83DeYHI8yt8bcg8OwmkDbITaghY5qv3f7QGQc5owwHCmNCLxmK3zvFVuqquK+wNxwicp/sj8jq2xLSTaU7M5vDwA2/KTnUlHxxl8nubujcps5UoI+pOSvQNNH5o4czLhmZCpTevGiakuj1vM+Fnipsfzlo2Fn9kkK9vtyw9AhDvYmWFCK/6TykryKXvFE5960HaixizgeVMAA19WaCroO6CjZRhvG++2Z4FQMDjbEUW4FQYhju0ry0a0MTbX3s/PYlo2VyHOEVGqJJiKgSZgbWvVaxibZYZhaCj7TJrXB3N/ZSZxGVOhD3DY03vwOcQ4Ui+UZVM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V5SOQUeQvocsQxdRxx68shrY2nrkAk0a+CYoF5VY739Iehbc2Pqs79lf7RDg?=
 =?us-ascii?Q?kI1GB/DlvF56L0LbrRP+oeB0l6BrGF98Akd6eW75XsD9SJzzmUN5QAHB1fP7?=
 =?us-ascii?Q?7KmNkx/hZH1Ea/d67F1g9wWAsWzEuamgIK4zgV2t5nr6WlZlWqPssV0dgSga?=
 =?us-ascii?Q?7qc5mY/Wg389dlBEWBR5EnSfu/gGzhvXD+c5wbWESlgJHAWDm5iYrNcmKzWL?=
 =?us-ascii?Q?cJaIQEICYk1PolGyYkSjF3KT7xQgunABzaUx9FAYz0CIWTta2g6mfWJUq440?=
 =?us-ascii?Q?Z5DiOyiCULyPOQJE5Vsr06nOSPXbdGF6oyWwrmhzcgK8scVO+85cuHcm1eDT?=
 =?us-ascii?Q?IeI2W4CjuhEW0GmrUfLWJLfEVvih9YecSHmB9HieryEp6s10skOb8jFEEy4E?=
 =?us-ascii?Q?rCxKNgUlKYcnQZfw3FMe1462gMEQCgnq9XmpIXXFqsgjxDdguRLYcXPZdGOm?=
 =?us-ascii?Q?kRBeCPn7CjgWtxpt8fxCLERNZgm81N26tGXbXeAex+XXkWJqkgivsc0yH8F+?=
 =?us-ascii?Q?AOOc0vzIwjuQdzkSHviwctV3ZBgH/4FyNxDWa/qx67jlH9pWddhnfwEj/Nys?=
 =?us-ascii?Q?LnTFosWJ/YVwusRimEOkeFFoBwBlOVmQSCyIrBERhubuMigfhyMLuk1hxKiv?=
 =?us-ascii?Q?wULxCA8X0ol7RReNQ/+HfGYl70fuEQdIbwKCsZID4jkeFUD6mhUlBz+xcf+p?=
 =?us-ascii?Q?gxer6GE9CiPo+y6PqfT9eavmYuFCFNzj5AHcuQrk36HyrN41adisH/ruSg2D?=
 =?us-ascii?Q?MDk4HbbbarUCfQtWfLFDZTy/3bGFuIhZzET/v4s/C88uHyw23HgvjC7Atupc?=
 =?us-ascii?Q?mwxuUVPjeBoYcEtjrtLPMDVsSuIE13DorsWM2yqjLCovoOimrx2pOjnaBL+H?=
 =?us-ascii?Q?2vZaMB5JqpgeMxO1myZBhQ6rJDbQS3Ol2r/izuIvx2pga9vYZ0ul0Gm+DKsm?=
 =?us-ascii?Q?SGqRgTSSPafE+hqByHYCdRPTwqW3BfFzXSfmXmCVKanvyC4rxgyajClDlD1l?=
 =?us-ascii?Q?9tE1q2PD3Lcj45NAKCOuaqMfd34vP6lStnyBB6Kh0PDxgEh/JwicYGwOORlm?=
 =?us-ascii?Q?h3gkx9czQyIVzd4xnDXA/ngACGS3hbDotUP/lLbSIu5pXHUPozWJAv62wp33?=
 =?us-ascii?Q?C6SVf2BX0CVfvCtcCrXpt0yFB0ceNAd3SeuxvWChqozHFYo2KyaU4eLbhL6J?=
 =?us-ascii?Q?4iUvb0J/V39CShSnip1GcJRvFXWH/nxf2MaM29wI8PNcdxWs8TgZQ26hWGfW?=
 =?us-ascii?Q?oMYPDe59zu1nl/pWN5dNvpBecXLNWt54KT1Bt6QTcSGg3BfR6PPe5kUNEobN?=
 =?us-ascii?Q?eXjgyYHCTdE8Hb+V/r9JrFHpU/iI6ISY8znYUJs4UGOZxh+Gxq0RHVIaVlSg?=
 =?us-ascii?Q?FnvaXM1po2Vi/q0IWFGFC433WlBqFNC0oriGXOfggnSxYhCtxr87l+fEbAlz?=
 =?us-ascii?Q?LiwEdbWObAjOvgYKSRaGogqCJ4rDphWN392/0ydngKnhhzHQ2HUjLZgJmYo3?=
 =?us-ascii?Q?p0W9EEmJ9v7W93IJxspldtDSoKtkHkvMEPhZZik5tEPGIZYHhdYQ2elYirV4?=
 =?us-ascii?Q?cE+oXhClQMQWXo6c5+y2ojDRn3IirNXOQtftyQ/PySoub3EPmAnNWPJ3aFhB?=
 =?us-ascii?Q?SFK5wvi716Jigx0K8tJJcFUgjPnKKlB/XaOqMfuyK8Jg2eGj+onzYVMiiBMN?=
 =?us-ascii?Q?iOliPMCZ0CriIjwlzqWsO1zD6qw64PsB4Rf3w+bArbMwZ74UxyH5yyLuuaUv?=
 =?us-ascii?Q?kDaFnku4XQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65618ea2-ead9-4244-1dd0-08dede660b9c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 09:31:39.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adQAA22gqlSwW46RxnzUHBYvfRkmVNj+yYYHLmIIYcmgmmkwisx1hIzcYGf89bGP7DyNEQDAa86UJliOoB+1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7623
X-purgate-ID: tlsNG-720697/1783675904-7CD2CA87-66781B53/0/0
X-purgate-type: clean
X-purgate-size: 5634
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79BD9739129

Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from
domain_cpuinfo, which is initialized from the sanitized host CPU feature
state. This does not necessarily match the virtual interrupt controller
configured for a domain.

On a GICv3 or newer host, a vGICv2 domain can observe a nonzero GIC
field even though Xen disables EL1 access to the GIC CPU system register
interface for that domain. On a GICv4.1 host, a vGICv3 domain can
observe encoding 0b0011, which advertises GICv4.1 CPU interface support
that Xen's vGICv3 model does not expose.

Derive both fields from d->arch.vgic.version in every trap path. Expose
0b0000 for vGICv2 and 0b0001 for vGICv3. This covers
ID_AA64PFR0_EL1 and the ID_PFR1_EL1 alias in AArch64 state, as well as
ID_PFR1 accessed through CP15 in AArch32 state.

This is consistent with KVM, which derives both ID fields from the
configured virtual GIC model.

Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/arm64/vsysreg.c | 35 ++++++++++++++++++++++++++++++++++-
 xen/arch/arm/vcpreg.c        | 25 ++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index d14258290f..6b898f13f3 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -21,6 +21,7 @@
 #include <asm/arm64/cpufeature.h>
 #include <asm/arm64/sve.h>
 #include <asm/current.h>
+#include <asm/gic.h>
 #include <asm/regs.h>
 #include <asm/traps.h>
 #include <asm/vreg.h>
@@ -79,6 +80,24 @@ TVM_REG(CONTEXTIDR_EL1)
                                   1, domain_cpuinfo.field.bits[offset]); \
     }
 
+#define ID_REG_GIC_WIDTH 4
+
+static unsigned int vgic_id_gic_field(const struct domain *d)
+{
+    ASSERT(d->arch.vgic.version == GIC_V2 ||
+           d->arch.vgic.version == GIC_V3);
+
+    return d->arch.vgic.version == GIC_V3;
+}
+
+static register_t id_reg_set_gic_field(register_t val, unsigned int shift,
+                                       const struct domain *d)
+{
+    register_t mask = GENMASK(shift + ID_REG_GIC_WIDTH - 1, shift);
+
+    return (val & ~mask) | ((register_t)vgic_id_gic_field(d) << shift);
+}
+
 void do_sysreg(struct cpu_user_regs *regs,
                const union hsr hsr)
 {
@@ -304,7 +323,17 @@ void do_sysreg(struct cpu_user_regs *regs,
      * to identify the processor features
      */
     GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
-    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
+    case HSR_SYSREG_ID_PFR1_EL1:
+    {
+        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
+
+        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
+                                               ID_PFR1_GIC_SHIFT,
+                                               v->domain);
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
     GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
     GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
@@ -343,6 +372,10 @@ void do_sysreg(struct cpu_user_regs *regs,
             guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
         }
 
+        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
+                                               ID_AA64PFR0_GIC_SHIFT,
+                                               v->domain);
+
         return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
                                   guest_reg_value);
     }
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index e7c484f2c1..88351b91d3 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -12,6 +12,7 @@
 #include <asm/cpufeature.h>
 #include <asm/cpregs.h>
 #include <asm/current.h>
+#include <asm/gic.h>
 #include <asm/regs.h>
 #include <asm/traps.h>
 #include <asm/vreg.h>
@@ -173,6 +174,17 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
                                   domain_cpuinfo.field.bits[offset]);\
     }
 
+#define ID_PFR1_GIC_SHIFT 28
+#define ID_REG_GIC_WIDTH 4
+
+static unsigned int vgic_id_gic_field(const struct domain *d)
+{
+    ASSERT(d->arch.vgic.version == GIC_V2 ||
+           d->arch.vgic.version == GIC_V3);
+
+    return d->arch.vgic.version == GIC_V3;
+}
+
 /* helper to define cases for all registers for one CRm value */
 #define HSR_CPREG32_TID3_CASES(REG)     case HSR_CPREG32(p15,0,c0,REG,0): \
                                         case HSR_CPREG32(p15,0,c0,REG,1): \
@@ -321,7 +333,18 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
      * to identify the processor features
      */
     GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
-    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
+    case HSR_CPREG32(ID_PFR1):
+    {
+        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
+
+        guest_reg_value &= ~GENMASK(ID_PFR1_GIC_SHIFT + ID_REG_GIC_WIDTH - 1,
+                                    ID_PFR1_GIC_SHIFT);
+        guest_reg_value |= (register_t)vgic_id_gic_field(v->domain) <<
+                           ID_PFR1_GIC_SHIFT;
+
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
     GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
     GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
-- 
2.43.0


