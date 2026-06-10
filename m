Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lsGZG9lcKWrmVgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A566967C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=quTNwmsu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334268.1597392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKp-0002GC-JA; Wed, 10 Jun 2026 12:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334268.1597392; Wed, 10 Jun 2026 12:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXIKp-0002AG-7d; Wed, 10 Jun 2026 12:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1334268;
 Wed, 10 Jun 2026 12:45:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wXIJK-0001DU-VN
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:45:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXIJK-00H9hG-BU
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:45:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c67-5cb7-0a2a0a5109dd-0a2a4504ad8a-34
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:34 +0200
Received: from [52.101.69.76]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a295c6e-1dec-0a2a45040019-3465454cb0ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:45:34 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 12:45:32 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 12:45:32 +0000
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
 b=WQZEunZqsEASvaFPCdrXsuSBLqTLylVpmghm//4nXqy74ql/VYssIP+v+iXLteTDZAKyeYQoJLejCUMhLuIRX+UdCpcZ+/KLSzTCAHAYzICJ7uqwXa7m0Sy4Zwu2C5czbJNAFwVjbiCVFX1RV4E3SZGNM6hsJUMFE0oom8ACWNyjqXU5nI/t3H0VqJayNeqY13IAL9rlH41X5rtsKqDMWxbvio5DdDWmqDAeckfjbt/xtPnLFCcORzCuS3Eyd5f7ZBaDvAteOJv1dDZl/sbZK+lk/J/kVV00JYNDOwe9TvLGZzxbzfn9GYwpgwXKkffTZbB4OkJxyvfwT+HjlTjonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQ4kNGerzyiusut8IWEJPjH9AN7FUvIvVDuMBpOnlU4=;
 b=Xa7ux/i8rNQHIsKHgeLQINmZ8SdDJKmGPkQbv1KRUIjgUdcg7cxYgQymfbe2wlje0JWL12aa2ZyoIHuZ9ELck+F/wwrrhoypjhZc3m8Yu6LufT/vw6cauHQFTGYC4YDN/YmXBfQnLDRGB6h4Lk1emhKYfO7hrPNFOt8IghryY7+wPxVErGLRRrrsNzrj0Dc5O6IdlLvNLM8x8ay5qEGWU9pPz/XIjsHGtTlCRCSJjUi410zpaxNDyaPWKu7ijyG6SwWMmNSTR2v0dsP3T3ZH8eTKTQ4AfC2rPTvIy7dDMBaZVxBCkgi7wekY39+WtE2gtDG57pZxiYsUVZMHfWNIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ4kNGerzyiusut8IWEJPjH9AN7FUvIvVDuMBpOnlU4=;
 b=quTNwmsuY1UqqmjG2gbzZXqT1DKrxIDl3jVn752Pmf4ucKBhCB3P+9HHLjld/oqfV1azXAjGrDJQIuDtLpv5ALVRmsc/33tWKb/vvouiHxb7OmOcWEr+ohGVifsu7mXFYJoRfpTHMplBCgb3pi8/Mb1dKa38U/KjQpI8yGQm9tIgyoWXojEAvLLxHosOuTBlC3AKsYnilfFbCOq/3i9G36UWOPZIGjYhH9qjfMWORyY7W/Q/Ly1mb2N2WzsmLXl1EYpHVJj+4muarxIbdjkV9ehQZUP7h0KZr/U0CuBSGEq2o6kymb2s8lqlGeqS6yknZEfG2W2vPiGJPqdlDgHRVQ==
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
Subject: [PATCH v11 08/13] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
Date: Wed, 10 Jun 2026 15:44:28 +0300
Message-ID: <a1c9e3defdd8fc772b78e93b7758294828246eea.1781084290.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: fd442826-6b7c-448a-a4fb-08dec6ee288a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZYwVDvAgZZfnoUM4g76PTIgTaLoOMguf+SJArSTv84JGxYaaaAURxE+PVO/PUYy4KaSp/JtnOJ0msP1Kam+BpvDUrScj4ipj1DcAIh96wzdg9b8Hdd+aXqwX7z+eQ/t1AVvXISBbjo+7eq6n2UzEQZFAg3hhDcFic+p041siUc+cl0yBlWJREPypytOSeWGWWVgWLeiZrJViibz6cIS9KQt61GIPbQK6aQNMyuDoIn3fX00KxOjuvk7OdynJivjibIzy4INIErr85237GyNo/zj+FFwb4tImiOvw+u44FIb6LesNre91EhjksfQUy1CACA9wuc43DL6/ErBy6pkxZyQCchORuRTy8bgw+HLPhVdy7dWUiy+okvQ7cH/suNHPs4D03xi8hcH/nnmqi9C61n55JXDBRvTvq2+5/yD2e3+I8KawsLiFWF42W+5KQz5LMaLfNvD+dqZeYSwpxOJVcvjh9uVQrUz87cfmJHIHPrxp6TOt5BPBJGIEkzO5VTNFGUSGllH4jiGoLtF4U0M0nv87EOnk/qcIe1+7nE6d/DAiUlFFOmQQGl6E5qny+pEkO/Kxq+KjiuMUqcmnx6hibh6GejRqNzFgIwT9/zkilyI1aAYrufrxXLXCCTqlKC2PvL3LbWQ3tLuB17T8z9GSdT0fSahDBy+p0s5MZZrLVFsfEqBwlSeOM4dOg8JLc25x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ij+YgkJf4oOGnpUZjvBNEmUsGZ1xkd6wnfAM89MFadwGi32grOVLPIXuVTz/?=
 =?us-ascii?Q?U8Vqo/rce2G31/u6QXIfOqZ7TKJ6xSERvP9VRiFH+MQlzhuNOnHtOke3XebS?=
 =?us-ascii?Q?xKfBOeRsg5bvbQOPnj0QDrtZaNqX4Go6qoD+gu9Ja0k1F2zc/QshLcgqWzz7?=
 =?us-ascii?Q?K29tfYbs5SxH1vgKFxyPWaBJCXugciOpVKp1/AeRiPkaKKeEo9YDuaY1jEuP?=
 =?us-ascii?Q?qtAWzJtN4ykk7gBSZBDcPcBdtlm1LEQOCX1OU9UhzTHwfBsqn14/ULGFOwEm?=
 =?us-ascii?Q?91V9YKU/FOyRxUEawK4hMMsW/ukuz/BAaNB3mtqpihBFnbyYGojAMvcSFPlp?=
 =?us-ascii?Q?v+Qdvx5YgD9KPfgAAK/Pd3ji/c6TgcyXhaeKnfn6Lrir7yQQNQ+LhnjuX1ZQ?=
 =?us-ascii?Q?7/c2BiEyD8PxzlgyvnKIw5hOQjuVOMflLuU3IIztwWYH2SANZmJ1JtTiCoAM?=
 =?us-ascii?Q?ivwHWrUjvL++MbzggN3FS2UUZHm7H2u8Mo5rV7kNNNyfLPYJfm6gSC/tZMVL?=
 =?us-ascii?Q?aRL+tqZeTzmi+Q2nw/x/70xpWcz+wKORBCzk9rAwtQqCTnOrkfU0Gr+nDGFd?=
 =?us-ascii?Q?8DaUdTw1by+wg5V2vjDQZaeP4xJm+0miuvGz46RxRs8fG8C13fUsRpujfu6C?=
 =?us-ascii?Q?RhBtZZPhlcCk8WXlpxyutw9yqdM4GaTopYrxyvBAv6CUoYL/q58vB2BDg+sQ?=
 =?us-ascii?Q?0nnxrYS37tBKSZloApC3MLeY7hjvAXFONijCrYg/VOlWWjNIduLcOSojSxAu?=
 =?us-ascii?Q?N1+Z3UZpq6QFL2tmmwyz/Ra+yA7Dt13Lg7hNsMyIK/XL94P91J703MjraAy6?=
 =?us-ascii?Q?8oz8Qniyo5s4if+KkNQC9zVxDvAnG5GUOyriYNP8ZOIhrFsylvgH/uX2VoPT?=
 =?us-ascii?Q?V6LcfUgyO9wOISecPO2Ji8T1LIWF0tAiQyASCpPszwewLIeO7k+lbSiAOqmw?=
 =?us-ascii?Q?y0rpffusNmau+8SbfM9aAsvswkT9dnE9TfOlpJwuZDOVigOA/qPDV7h6vS/A?=
 =?us-ascii?Q?bjVctkdvq/T4wUULL5GO5PeecZfRSqB39PUVXjSlt6ZtS+x8UIEmlcuXQ499?=
 =?us-ascii?Q?g7Zw3iKMzpjrpfkuk163z3G6Iwyhk+2xPL3gwCFczI9ffjLFUuj6othoCBz/?=
 =?us-ascii?Q?2w+ALdxcYWSumuW1M1WFpCS8wlVJkVlKfxsIcfPY7RvV/gkifuHzbg42v6+p?=
 =?us-ascii?Q?aWlBBO7AjKt+l4FrCp+k479tZZSwRd4ZoyWRXOauyBEbforLRkfsQRDKU0Og?=
 =?us-ascii?Q?KaorFtSMWwPLZzTFbGLPaWab0T8DYAz//NaTwd9MGIK9qBI95ea32+U+xms/?=
 =?us-ascii?Q?wiH77+tOcbK296F7VKJrUaKCq8/K6V2CRRGLS7AxvYhh6J+kINBBjIkf0zjZ?=
 =?us-ascii?Q?MVPHqJcrnAPPbgq/nRzLP9bt8OshluLGDPAgxOSDNgdDuuuOe3nfMoWTuhS9?=
 =?us-ascii?Q?yHhuMNJRQOmMKvmg05CJY9HeoPpEbHyxBn1J0V9J+6Fi/H3fc7ytadAR/YQ/?=
 =?us-ascii?Q?TBXp+eXlc0pNDYmJw9xYu39ZA01lXC1oTwmQB6C7I/ATaKT2sulBPyXiC9ql?=
 =?us-ascii?Q?xf/+v4f/DXGJlv4yjjywnr/w9ioSZup2v1t31jSuMDPCFnDhkqYdD8QzUO7D?=
 =?us-ascii?Q?pYwqxNwm0KyVRC5v6FDwAG+W8PzoSj7EV7XE3Ofsx1DqJ2kCCl7ODhDJvBql?=
 =?us-ascii?Q?SwOfl2aeW+E3IUwVUgtkuE9THhI/P0w9jnMcT16n0WGnVR7nUFZqAncOOHAh?=
 =?us-ascii?Q?TYEJYoA0vA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd442826-6b7c-448a-a4fb-08dec6ee288a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 12:45:31.9088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HI80ajRachY0b2IJ6shS5rbW45IiSinAaxVg1dXxub8GdHMleoYKkDb28RC2LfN8oZqwHsUDiEs5h/9dnWrDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
X-purgate-ID: tlsNG-ebf023/1781095534-291763FF-8D6A7073/0/0
X-purgate-type: clean
X-purgate-size: 14456
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[epam.com,gmail.com,kernel.org,xen.org,arm.com,amd.com];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: A98A566967C

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Store and restore active context and micro-TLB registers.

On resume, restore Root IPMMU context state before restoring Cache IPMMU
micro-TLB state. Cache IPMMUs select Root contexts through their micro-TLB
configuration, so restoring Cache micro-TLBs before the Root context
registers are restored can expose stale or uninitialized context state.

Tested on R-Car H3 Starter Kit.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V10:
- Iterate over registered IPMMUs in reverse order during resume so Root IPMMU
  context state is restored before Cache IPMMU micro-TLB state.

Changes in V9:
- set dt_device_set_protected() only after ipmmu_alloc_ctx_suspend()
  succeeds, so DT devices do not remain protected on allocation failure.

Changes in V7:
- moved suspend context allocation before pci stuff
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 +++++++++++++++++++++--
 1 file changed, 308 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index fa9ab9cb13..2e54fa63d6 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -71,6 +71,8 @@
 })
 #endif
 
+#define dev_dbg(dev, fmt, ...)    \
+    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
 #define dev_info(dev, fmt, ...)    \
     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
 #define dev_warn(dev, fmt, ...)    \
@@ -130,6 +132,24 @@ struct ipmmu_features {
     unsigned int imuctr_ttsel_mask;
 };
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+struct ipmmu_reg_ctx {
+    unsigned int imttlbr0;
+    unsigned int imttubr0;
+    unsigned int imttbcr;
+    unsigned int imctr;
+};
+
+struct ipmmu_vmsa_backup {
+    struct device *dev;
+    unsigned int *utlbs_val;
+    unsigned int *asids_val;
+    struct list_head list;
+};
+
+#endif
+
 /* Root/Cache IPMMU device's information */
 struct ipmmu_vmsa_device {
     struct device *dev;
@@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
     unsigned int utlb_refcount[IPMMU_UTLB_MAX];
     const struct ipmmu_features *features;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
+#endif
 };
 
 /*
@@ -547,6 +570,249 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
     spin_unlock_irqrestore(&mmu->lock, flags);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
+static LIST_HEAD(ipmmu_devices_backup);
+
+static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
+
+static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
+                                   unsigned int utlb)
+{
+    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
+}
+
+static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+
+    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
+    {
+        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
+        unsigned int i;
+
+        if ( to_ipmmu(backup_data->dev) != mmu )
+            continue;
+
+        for ( i = 0; i < fwspec->num_ids; i++ )
+        {
+            unsigned int utlb = fwspec->ids[i];
+
+            backup_data->asids_val[i] = ipmmu_imuasid_read(mmu, utlb);
+            backup_data->utlbs_val[i] = ipmmu_imuctr_read(mmu, utlb);
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+
+static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+
+    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
+    {
+        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
+        unsigned int i;
+
+        if ( to_ipmmu(backup_data->dev) != mmu )
+            continue;
+
+        for ( i = 0; i < fwspec->num_ids; i++ )
+        {
+            unsigned int utlb = fwspec->ids[i];
+
+            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
+            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+
+static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
+
+    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
+
+    regs->imttlbr0 = ipmmu_ctx_read_root(domain, IMTTLBR0);
+    regs->imttubr0 = ipmmu_ctx_read_root(domain, IMTTUBR0);
+    regs->imttbcr  = ipmmu_ctx_read_root(domain, IMTTBCR);
+    regs->imctr    = ipmmu_ctx_read_root(domain, IMCTR);
+}
+
+static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
+
+    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
+
+    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
+    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
+    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
+    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
+}
+
+/*
+ * Xen: Unlike Linux implementation, Xen uses a single driver instance
+ * for handling all IPMMUs. There is no framework for ipmmu_suspend/resume
+ * callbacks to be invoked for each IPMMU device. So, we need to iterate
+ * through all registered IPMMUs performing required actions.
+ *
+ * Also take care of restoring special settings, such as translation
+ * table format, etc.
+ */
+static int __must_check ipmmu_suspend(void)
+{
+    struct ipmmu_vmsa_device *mmu;
+
+    if ( !iommu_enabled )
+        return 0;
+
+    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
+
+    spin_lock(&ipmmu_devices_lock);
+
+    list_for_each_entry( mmu, &ipmmu_devices, list )
+    {
+        if ( ipmmu_is_root(mmu) )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < mmu->num_ctx; i++ )
+            {
+                if ( !mmu->domains[i] )
+                    continue;
+                ipmmu_domain_backup_context(mmu->domains[i]);
+            }
+        }
+        else
+            ipmmu_utlbs_backup(mmu);
+    }
+
+    spin_unlock(&ipmmu_devices_lock);
+
+    return 0;
+}
+
+static void ipmmu_resume(void)
+{
+    struct ipmmu_vmsa_device *mmu;
+
+    if ( !iommu_enabled )
+        return;
+
+    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
+
+    spin_lock(&ipmmu_devices_lock);
+
+    /*
+     * IPMMUs are registered with list_add(), with Root IPMMU probed first.
+     * Walk backwards to restore Root contexts before Cache micro-TLBs.
+     */
+    list_for_each_entry_reverse( mmu, &ipmmu_devices, list )
+    {
+        uint32_t reg;
+
+        /* Do not use security group function */
+        reg = IMSCTLR + mmu->features->control_offset_base;
+        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
+
+        if ( ipmmu_is_root(mmu) )
+        {
+            unsigned int i;
+
+            /* Use stage 2 translation table format */
+            reg = IMSAUXCTLR + mmu->features->control_offset_base;
+            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
+
+            for ( i = 0; i < mmu->num_ctx; i++ )
+            {
+                if ( !mmu->domains[i] )
+                    continue;
+                ipmmu_domain_restore_context(mmu->domains[i]);
+            }
+        }
+        else
+            ipmmu_utlbs_restore(mmu);
+    }
+
+    spin_unlock(&ipmmu_devices_lock);
+}
+
+static int ipmmu_alloc_ctx_suspend(struct device *dev)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+    unsigned int *utlbs_val, *asids_val;
+    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+    utlbs_val = xzalloc_array(unsigned int, fwspec->num_ids);
+    if ( !utlbs_val )
+        return -ENOMEM;
+
+    asids_val = xzalloc_array(unsigned int, fwspec->num_ids);
+    if ( !asids_val )
+    {
+        xfree(utlbs_val);
+        return -ENOMEM;
+    }
+
+    backup_data = xzalloc(struct ipmmu_vmsa_backup);
+    if ( !backup_data )
+    {
+        xfree(utlbs_val);
+        xfree(asids_val);
+        return -ENOMEM;
+    }
+
+    backup_data->dev = dev;
+    backup_data->utlbs_val = utlbs_val;
+    backup_data->asids_val = asids_val;
+
+    spin_lock(&ipmmu_devices_backup_lock);
+    list_add(&backup_data->list, &ipmmu_devices_backup);
+    spin_unlock(&ipmmu_devices_backup_lock);
+
+    return 0;
+}
+
+#ifdef CONFIG_HAS_PCI
+static void ipmmu_free_ctx_suspend(struct device *dev)
+{
+    struct ipmmu_vmsa_backup *backup_data, *tmp;
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry_safe( backup_data, tmp, &ipmmu_devices_backup, list )
+    {
+        if ( backup_data->dev == dev )
+        {
+            list_del(&backup_data->list);
+            xfree(backup_data->utlbs_val);
+            xfree(backup_data->asids_val);
+            xfree(backup_data);
+            break;
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+#endif /* CONFIG_HAS_PCI */
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 {
     uint64_t ttbr;
@@ -559,6 +825,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
         return ret;
 
     domain->context_id = ret;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[ret] = &root_pgtable[ret];
+#endif
 
     /*
      * TTBR0
@@ -615,6 +884,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
     ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
     ipmmu_tlb_sync(domain);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[domain->context_id] = NULL;
+#endif
     ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
 }
 
@@ -1338,10 +1610,11 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     struct iommu_fwspec *fwspec;
 
 #ifdef CONFIG_HAS_PCI
+    int ret;
+
     if ( dev_is_pci(dev) )
     {
         struct pci_dev *pdev = dev_to_pci(dev);
-        int ret;
 
         if ( devfn != pdev->devfn )
             return 0;
@@ -1358,17 +1631,24 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     if ( !to_ipmmu(dev) )
         return -ENODEV;
 
-    if ( !dev_is_pci(dev) )
+    if ( !dev_is_pci(dev) && dt_device_is_protected(dev_to_dt(dev)) )
     {
-        if ( dt_device_is_protected(dev_to_dt(dev)) )
-        {
-            dev_err(dev, "Already added to IPMMU\n");
-            return -EEXIST;
-        }
+        dev_err(dev, "Already added to IPMMU\n");
+        return -EEXIST;
+    }
 
-        /* Let Xen know that the master device is protected by an IOMMU. */
-        dt_device_set_protected(dev_to_dt(dev));
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( ipmmu_alloc_ctx_suspend(dev) )
+    {
+        dev_err(dev, "Failed to allocate context for suspend\n");
+        return -ENOMEM;
     }
+#endif
+
+    /* Let Xen know that the master device is protected by an IOMMU. */
+    if ( !dev_is_pci(dev) )
+        dt_device_set_protected(dev_to_dt(dev));
+
 #ifdef CONFIG_HAS_PCI
     if ( dev_is_pci(dev) )
     {
@@ -1377,26 +1657,28 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         struct pci_host_bridge *bridge;
         struct iommu_fwspec *fwspec_bridge;
         unsigned int utlb_osid0 = 0;
-        int ret;
 
         bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
         if ( !bridge )
         {
             dev_err(dev, "Failed to find host bridge\n");
-            return -ENODEV;
+            ret = -ENODEV;
+            goto free_suspend_ctx;
         }
 
         fwspec_bridge = dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node));
         if ( fwspec_bridge->num_ids < 1 )
         {
             dev_err(dev, "Failed to find host bridge uTLB\n");
-            return -ENXIO;
+            ret = -ENXIO;
+            goto free_suspend_ctx;
         }
 
         if ( fwspec->num_ids < 1 )
         {
             dev_err(dev, "Failed to find uTLB");
-            return -ENXIO;
+            ret = -ENXIO;
+            goto free_suspend_ctx;
         }
 
         rcar4_pcie_osid_regs_init(bridge);
@@ -1405,7 +1687,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         if ( ret < 0 )
         {
             dev_err(dev, "No unused OSID regs\n");
-            return ret;
+            goto free_suspend_ctx;
         }
         reg_id = ret;
 
@@ -1420,7 +1702,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         {
             rcar4_pcie_osid_bdf_clear(bridge, reg_id);
             rcar4_pcie_osid_reg_free(bridge, reg_id);
-            return ret;
+            goto free_suspend_ctx;
         }
     }
 #endif
@@ -1429,6 +1711,13 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
 
     return 0;
+#ifdef CONFIG_HAS_PCI
+ free_suspend_ctx:
+#ifdef CONFIG_SYSTEM_SUSPEND
+    ipmmu_free_ctx_suspend(dev);
+#endif
+    return ret;
+#endif
 }
 
 static int ipmmu_iommu_domain_init(struct domain *d)
@@ -1490,6 +1779,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
     .unmap_page      = arm_iommu_unmap_page,
     .dt_xlate        = ipmmu_dt_xlate,
     .add_device      = ipmmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend         = ipmmu_suspend,
+    .resume          = ipmmu_resume,
+#endif
 };
 
 static __init int ipmmu_init(struct dt_device_node *node, const void *data)
-- 
2.43.0


