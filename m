Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hSP/LqrqQmqcIAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 23:59:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A16DEF79
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 23:59:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=eBq4+24k;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348267.1606079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weJzm-0002pX-3U; Mon, 29 Jun 2026 21:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348267.1606079; Mon, 29 Jun 2026 21:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weJzl-0002l8-VK; Mon, 29 Jun 2026 21:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1348267;
 Mon, 29 Jun 2026 21:58:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1weJzj-0002iS-0x
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weJzi-001eUD-EH
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 23:58:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a42ea72-e002-0a2a0a5209dd-0a2a4509a9aa-8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:58:22 +0200
Received: from [52.101.229.81]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a42ea74-97e6-0a2a45090019-3465e55169fb-4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:58:22 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:58:11 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 21:58:11 +0000
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
 b=rweQNQjwyxmdZ9G7lVKBm+kL8PjH2hHFGz0Q/5bwA/dJ9q+ZIITaZwP6MV33H3wdpjh7wXNZMIxa1/M8YAE4YXGs1IJZxhNTuMKIxtqX8RZAZKrZ3+6W8RxHC/qltv6aVhOVfkaPfcU84Svx2YEkDoiU0yO5LgVS9kRNZ2Mh2g0q1l/U4snzLsqTvlSMDAYpivcuY8IjbM4dZFQG8E8RNVC4EZfoqe9GUjzNL2oLSKyfe2qyfckIsCulZ+Myz1iwbNjYObFraf/XZagFOlXaEBNe6WNzI/LOXLxItN2ICvGZ5EJWoGEZ/YC8jr+FRru5LLFrxNDRkEHy1rPkY13NXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz7mXaqvppe25YdlBwMaiVca8WtzFTqdxc+orSiuU44=;
 b=XeVm3YnHIJo3v8SnULcX0NL9xbOAW5GBJv8q1SP7fn2RoHmHqEclVy4W1ntq87GfiTJgFoP58Aa/PNy5zfy+ZXY0CB1H1sPXU0RSiD1R9W1P1uBs1sbu22BG28LwyvrbSUukxsxVmyVg6qaRwIH0CHYggliNOidHE90chLVZXbBAP5j37JvzxulO9G9u74qpgyl0FrPrxwCu/8DxSj5AkodSSZ2ktKeYf0MMdlEUoxlRIo1+szpRUIPAGjQZmOSgXpX7BdFWI8mZ4vzihdvo6VONTjdEAA6u65MQC2nMG9D4STd+QLQNV7WXbu/36CT46dJlWoHLEHMFFPRFlZLkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz7mXaqvppe25YdlBwMaiVca8WtzFTqdxc+orSiuU44=;
 b=eBq4+24kWzKiG2E6I83L6aoWmHKSDnlV3GG9o4recL+k7SGiyYO3yiaCPqYL882ADCdjHSVi2NJH0JAjHRpolrAM8f4jSnkyKKFtnw3XPibA59wjsFThUbAp9l9Nwtr+UOaUK/LEElPrI1D+ST+jleBpeO7JLuZCm+pdRIy83Yo=
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
Subject: [PATCH v3 1/3] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Tue, 30 Jun 2026 06:58:04 +0900
Message-ID: <20260629215806.11610-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629215806.11610-1-taka@valinux.co.jp>
References: <20260629215806.11610-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ee68eb-9d35-472d-823c-08ded6298339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|10070799003|376014|366016|22082099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	6kA2Qo0PhqxG/XtcR9pHwl+1KpZTay4w0+sAFXZVuzjpgy001iyxKWj0flkF/Zt0m/iA4r1mifMz3BCVIZSZ2j3yroOCeuOGpKvHr06ULP+aemPYEmEAbP3RLV15eDZ70ra13tRxOQAFNTUwo70mDrtQKCbiHJ569Kc9D857eMtV08a9OAZ80lvBnAN9rWQ0LPg8s7TwpwiWZsFhsOTl41H4SnRydBNoM3MyMjxPhLITUPsAY2E3mnyK3B9u7++wWH+KRj6PoMTJpNjgK8md/F+a08JUTtsJmir0aVIygRrn+wH6rMwdKKaCbm69RU3vLnzYdItaPiJkPM97AplUOQtRJZJkFz45wkLghktqMr9suHMLCWYCLRHQmpaKkjHG2Ac78cK2MFLnCdadRjZJC7FB5zu5MPk9PKFs0aUYW74azDyQykZup45TULcVmWIXfjYgvAY1iwpAHPs82geBig1xzeRZBThu35Dm0BONqAmaKjTEdrYViATy39QiGF1d1VIUeX08X6Y+I8JpOaAkSUHA3D9JOZ3UQ8y/vHIh9eV1hOowTgU9Je4+syv1XpbOKOULNJaRpIdpQFrzVPzwSTnbmW0pC3gK97wdsMCWcytBbf/AmScn2bGLzvLian5c7HGNvLvUw07fqrwldqWZx/LwUQbgTZ835p/Brhfr2vs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(10070799003)(376014)(366016)(22082099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q1n6ZFgZxrTYlz9yDXhGby/rDap+/t8D6canhRC0226x8MeQnznfclsU+Ryc?=
 =?us-ascii?Q?aQUs7jLs5ekxqNL1hxZXeXc23IEIqphVg/kknEOb5OheUDLURgOboqcnbUjQ?=
 =?us-ascii?Q?/qxx6TasTL1tN4yRaURtFHnn9EFB7iRWU5OhEoBTNnDyYLECK2tvAFRID2AT?=
 =?us-ascii?Q?OU0fF9vCFWU3W/BX4MqmWqDDRLCWpOtmf6gptzKXKhVH+V5LbNOzDyy0cSgl?=
 =?us-ascii?Q?7ZOV0COmQRGjHm3mK/wxAS1VMcd64xiX/s+U/5htYzFqQP8IEBuai4e64isQ?=
 =?us-ascii?Q?HfEGhbXBfuX57chauSFnIVMOe1hVGw3PuO5Jy6bTgDWTHOW98d45Fz0m5FHw?=
 =?us-ascii?Q?S5sxwZ/873OUae/d2L3onls9nmu8xEtn3slQWNDXlGacDIcPWXiKUOzaUDUt?=
 =?us-ascii?Q?BPJUHFBs8OGPlJUDd3gpEQHcSWR3PCscafBxsZt4m6LikzamRAjEL4Bt/HzY?=
 =?us-ascii?Q?gAh7Q0O4sYTuzHpbQq2aIp+SviKlg6PsE9fUVcVwXKiFjGRAyzW+fpoJRzz4?=
 =?us-ascii?Q?2Kel5Ra7nIKvLEMlu/P0cQkKkfI6Sni0Rv7zDVPxcbUtsJRwMY178C5Y8LZI?=
 =?us-ascii?Q?uND+SNR0WAzzhXqFAzhMF3DjO0HxLB5OZZP6MrAF+Y7Gt8opsXibSw/E8dD/?=
 =?us-ascii?Q?LExuts6LtaGGBjDTa+yLMXcZRFp1inqmshOHBHUHY6pjbZj8BwgJ0Czg1f1x?=
 =?us-ascii?Q?jmv20joniKI2cG5o2mn/EKrVEIxlZ3iJXH+DGhpePL89f3qOOpvYO2xfXXRN?=
 =?us-ascii?Q?96NVPGxbfSOn6RW2Y7gdfel04wqmnqfCUS8awG6Y0c26aQz7pLeXX3dumxGi?=
 =?us-ascii?Q?eJRRPlZb3HeIfJeE2gjhFGvOmvGMVoEPfBM9lPl2JcA5DeyV4gyaGmuLcbza?=
 =?us-ascii?Q?q+WioP36cvMR2vBnPxBKLfAtsE/Suo4BH5PlK+lQgcETECjTIz8MwRip+xC6?=
 =?us-ascii?Q?lTvk32hG3wNPb3rfi9sQY6S8TFvzuDIeDOTsAuXk6phqJYvMpBdpFdycPEfh?=
 =?us-ascii?Q?//ILuaCpTb/HMvg45ZsYfk9l4f24rSFcTpw0y7S86GKs0ifD1jwi1X2Hw9dF?=
 =?us-ascii?Q?n3C2VxSnvLXlugUG3UN1C7UNekqvTjZluUMfOrBpHKDxK/JnXOe6i3fLYqRY?=
 =?us-ascii?Q?xF0L+noXcZy0NX7dYRitzPdm3D6ZFvtAiRbBCupAL7qAMzAWqGh8DWMugsWZ?=
 =?us-ascii?Q?HlFwS11EgcqUaVj0EQqnNQ8VP/frj/u/Quawr0qrRCfgOYOqmLqYXiUobNCH?=
 =?us-ascii?Q?NhnVaJrTJvSZZDFmkIeeGRjvnvHVhBMRQuwCRFrtFV4Oy7voypsir6ZA8qXJ?=
 =?us-ascii?Q?PgizTYDHR+yE2Il3pt75DbkDePj5UIkhFX5tOiPX/hz9/8aNXGiMXL77/MjU?=
 =?us-ascii?Q?6p/ICYCuhyWa3hIcw0/8w393maMiaqkKkwZwOO9T1B5h2INTTTT69wQEiZXb?=
 =?us-ascii?Q?HpFAZOqRDa3RqzjuSmQW9Hs3Dnbd60oBWG2vCqJjYKoIjVpagcpfSIW8FUsE?=
 =?us-ascii?Q?Q28GuC012RykhYZJH3ZnB+sfGVjUIv5aIK33Vl+VZPmeGsZ3GG6VcsZihJ6n?=
 =?us-ascii?Q?LYpcR+pW+KGvBszwR445byev97ky8vhmKE4K0urt5sO7/AWEUPSqObtZ+oBx?=
 =?us-ascii?Q?9FRk9EOYX8tSSLAiVV7EyV3qaPZmXShuPTu1DiGV2+mvxw3Tgl12i4o8/T1Y?=
 =?us-ascii?Q?umKjmBYsHMq6YeIiZ/DBahsPL0CUglo/XQhNLh/YPfBwn/vIwn4W8c8SVoJD?=
 =?us-ascii?Q?HwdfKREsSl+j5CqZe2dHRTlMnhISMxUs14U2r884znnBMix9hpgwevboDA0M?=
X-MS-Exchange-AntiSpam-MessageData-1: yGXX+zdlMGwS+Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ee68eb-9d35-472d-823c-08ded6298339
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:58:11.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygOELqZ59UZ1AWZs2He1q5CbgkL9kxwzrK6M4uJwAZiMGttoWiyVMQJAoF+EuL9vZKgW8el7XSo6emKqF3LRqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-bad1c0/1782770302-5FD34986-903CB427/0/0
X-purgate-type: clean
X-purgate-size: 19884
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 8F1A16DEF79

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/Kconfig                  |  10 +
 xen/arch/arm/smpboot.c                |   6 +
 xen/common/Kconfig                    |   8 +
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  59 +++++
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 352 ++++++++++++++++++++++++++
 xen/drivers/acpi/Kconfig              |   3 +
 xen/drivers/acpi/Makefile             |   2 +
 xen/drivers/acpi/topology.c           |  38 +++
 xen/include/xen/acpi.h                |   2 +
 xen/include/xen/cpu-topology.h        |  35 +++
 xen/include/xen/dt-cpu-topology.h     |  29 +++
 13 files changed, 546 insertions(+)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5fa89fcb24..696f8ef06d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -101,6 +101,16 @@ endchoice
 
 source "arch/Kconfig"
 
+config ARM_CPU_TOPOLOGY
+	bool "CPU topology support (UNSUPPORTED)" if UNSUPPORTED
+	select CPU_TOPOLOGY
+	help
+	  Retrieve CPU topology information from the device tree to optimize
+	  virtual CPU scheduling.
+
+	  Note: Implementation for parsing CPU topology from the ACPI PPTT
+	  is currently missing.
+
 config ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM_64 && ARM_EFI
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..3a77f1d33e 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -9,6 +9,7 @@
 
 #include <xen/acpi.h>
 #include <xen/cpu.h>
+#include <xen/cpu-topology.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
 #include <xen/device_tree.h>
@@ -242,6 +243,9 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+        /* Pass the info to dt_init_cpu_topology() */
+        map_cpuid_to_node(i, cpu);
     }
 
     if ( !bootcpu_valid )
@@ -279,6 +283,8 @@ void __init smp_init_cpus(void)
     else
         acpi_smp_init_cpus();
 
+    init_cpu_topology();
+
     if ( opt_hmp_unsafe )
         warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
                     "It has implications on the security and stability of the system,\n"
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..6875dd07b3 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -188,6 +188,14 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config DT_CPU_TOPOLOGY
+	bool
+
+config CPU_TOPOLOGY
+	bool
+	select DT_CPU_TOPOLOGY if DEVICE_TREE_PARSE
+	select ACPI_CPU_TOPOLOGY if ACPI
+
 config NUMA
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e25614..adb406ab5e 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
+obj-$(CONFIG_CPU_TOPOLOGY) += cpu-topology.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
diff --git a/xen/common/cpu-topology.c b/xen/common/cpu-topology.c
new file mode 100644
index 0000000000..9e5167879f
--- /dev/null
+++ b/xen/common/cpu-topology.c
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/init.h>
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
index 9036e455d6..38bc5d5306 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
+obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
new file mode 100644
index 0000000000..0409e7b87d
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,352 @@
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
+#include <xen/xvmalloc.h>
+
+struct cpu_map {
+    unsigned int thread_id;
+    unsigned int core_id;
+    unsigned int cluster_id;
+    unsigned int package_id;
+};
+
+struct cpu_topology *cpu_topology;
+static const unsigned int __initdata invalid_topo_id = (~0U);
+static struct cpu_map __initdata cpu_map[NR_CPUS] = {
+    [0 ... NR_CPUS - 1] = {invalid_topo_id, invalid_topo_id, invalid_topo_id, 0}
+};
+static struct dt_device_node *__initdata dt_cpu_table[NR_CPUS];
+
+static void __init setup_siblings_masks(unsigned int cpuid)
+{
+    struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
+    struct cpu_map *cpuid_map = &cpu_map[cpuid];
+    unsigned int cpu;
+
+    /* Update core and thread sibling masks */
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+        struct cpu_map *map = &cpu_map[cpu];
+
+        if ( cpuid_map->package_id != map->package_id )
+            continue;
+
+        cpumask_set_cpu(cpuid, cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, cpuid_topo->core_sibling);
+
+        if ( cpuid_map->cluster_id != map->cluster_id )
+            continue;
+
+        if ( cpuid_map->cluster_id != invalid_topo_id )
+        {
+            cpumask_set_cpu(cpu, cpuid_topo->cluster_sibling);
+            cpumask_set_cpu(cpuid, cpu_topo->cluster_sibling);
+        }
+
+        if ( cpuid_map->core_id != map->core_id )
+            continue;
+
+        cpumask_set_cpu(cpuid, cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, cpuid_topo->thread_sibling);
+    }
+}
+
+static struct dt_device_node *__init
+    dt_find_child_node_by_name(struct dt_device_node *from, const char *name)
+{
+    struct dt_device_node *np;
+    const struct dt_device_node *dt = from;
+
+    dt_for_each_child_node(dt, np)
+        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
+            break;
+
+    return np;
+}
+
+void __init map_cpuid_to_node(unsigned int cpuid,
+                              struct dt_device_node *cpu_node)
+{
+    if ( cpuid < NR_CPUS )
+        dt_cpu_table[cpuid] = cpu_node;
+}
+
+static unsigned int __init cpu_node_to_id(struct dt_device_node *cpu_node)
+{
+    unsigned int cpu;
+    bool found = false;
+
+    for_each_possible_cpu(cpu)
+    {
+        found = (cpu_node == dt_cpu_table[cpu]);
+        if ( found )
+            return cpu;
+    }
+
+    return invalid_topo_id;
+}
+
+/*
+ * This function returns the logic cpu number of the node.
+ */
+static unsigned int __init get_cpu_for_node(struct dt_device_node *node)
+{
+    struct dt_device_node *cpu_node = dt_parse_phandle(node, "cpu", 0);
+
+    if ( !cpu_node )
+        return invalid_topo_id;
+
+    return cpu_node_to_id(cpu_node);
+}
+
+static int __init parse_core(struct dt_device_node *core,
+                             unsigned int package_id,
+                             unsigned int cluster_id,
+                             unsigned int core_id)
+{
+    char name[20];
+    bool leaf = true;
+    unsigned int i = 0;
+    unsigned int cpu;
+
+    do {
+        struct dt_device_node *t;
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
+            printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for thread\n", t);
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
+            printk(XENLOG_ERR "ERROR: %pOF: Core has both threads and CPU\n",
+                   core);
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
+        printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for leaf core\n", core);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init parse_cluster(struct dt_device_node *cluster,
+                                unsigned int package_id,
+                                unsigned int cluster_id,
+                                unsigned int depth)
+{
+    char name[20];
+    bool leaf = true;
+    bool has_cores = false;
+    unsigned int core_id = 0;
+    unsigned int i;
+    int ret;
+
+    /*
+     * First check for child clusters; we currently ignore any
+     * information about the nesting of clusters and present the
+     * scheduler with a flat list of them.
+     */
+    i = 0;
+    do {
+        struct dt_device_node *c;
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
+        struct dt_device_node *c;
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
+                   "ERROR: %pOF: cpu-map children should be clusters\n", c);
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
+            printk(XENLOG_ERR "ERROR: %pOF: Non-leaf cluster with core %s\n",
+                   cluster, name);
+            return -EINVAL;
+        }
+
+        i++;
+    } while ( true );
+
+    if ( leaf && !has_cores )
+        printk(XENLOG_WARNING "WARNING: %pOF: empty cluster\n", cluster);
+
+    return 0;
+}
+
+static int __init parse_socket(struct dt_device_node *socket)
+{
+    char name[20];
+    bool has_socket = false;
+    unsigned int package_id = 0;
+    int ret;
+
+    do {
+        struct dt_device_node *c;
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
+    struct dt_device_node *cpus;
+    struct dt_device_node *map;
+
+    cpus = dt_find_node_by_path("/cpus");
+
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
index 477408afbe..2c8d64c314 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -10,3 +10,5 @@ obj-$(CONFIG_PM_OP) += pm-op.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
+
+obj-$(CONFIG_ACPI_CPU_TOPOLOGY) += topology.o
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
index 0000000000..698d148def
--- /dev/null
+++ b/xen/include/xen/cpu-topology.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#include <xen/dt-cpu-topology.h>
+
+struct cpu_topology {
+    cpumask_var_t thread_sibling;
+    cpumask_var_t core_sibling;
+    cpumask_var_t cluster_sibling;
+};
+
+#ifdef CONFIG_CPU_TOPOLOGY
+
+extern struct cpu_topology *cpu_topology;
+void init_cpu_topology(void);
+
+#else /* CONFIG_CPU_TOPOLOGY */
+
+#define cpu_topology ((struct cpu_topology *)NULL)
+static inline void init_cpu_topology(void) {}
+
+#endif /* CONFIG_CPU_TOPOLOGY */
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
index 0000000000..962242d5ca
--- /dev/null
+++ b/xen/include/xen/dt-cpu-topology.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DT_CPU_TOPOLOGY_H
+#define XEN_DT_CPU_TOPOLOGY_H
+
+#include <xen/device_tree.h>
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+
+void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node);
+void dt_init_cpu_topology(void);
+
+#else /* CONFIG_DT_CPU_TOPOLOGY */
+
+static inline void map_cpuid_to_node(unsigned int cpuid,
+                                     struct dt_device_node *cpu_node) {}
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


