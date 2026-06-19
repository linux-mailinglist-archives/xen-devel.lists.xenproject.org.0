Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uHzWNer0NGoKlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF66A4715
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=JwKnloTY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341734.1602029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzh-0004na-JZ; Fri, 19 Jun 2026 07:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341734.1602029; Fri, 19 Jun 2026 07:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzh-0004m9-FD; Fri, 19 Jun 2026 07:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1341734;
 Fri, 19 Jun 2026 07:50:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzf-0004Lh-LC
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzf-001qMv-25
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b5-2eae-0a2a0a5409dd-0a2a450bb90e-40
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:26 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:26 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:21 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:21 +0000
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
 b=MMl72c6ps+r/cVCHAoXLcuPm+HSclKf31FELp8VfbkOSVn2WZaunYDHeEf/ugXrYf8GWv5HyAiehkshaix1JsUmzzZ2Gd2Lyc/R+kICav7/l+rCRVXYgbNLFGePlFX8yB7hVT5WyLG3J7VlU9KdLaTQQK0+533AfiLrdUCewYd6I/tYf13Fb3aVhdPbJY5IYNDn9Q3hiphlvf25JR/tX8K5y3M2VAbWflZji5R2SKQFMaq8574kU+Nqu31Cw3IGIbQeIr6nqG7E6NOrDivoQjtG4cSQoGjuZ9kkqGCcw1N/paqnZ8pKUhm1FSuYPXhZPhjmapFVds+DauoJlkLPbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5eM+J/7ubhVIxsE8BzSDXPV5iMSGeqFPP4HDzWpfNc=;
 b=dLxwv708/wci1AG2ZfnMcFk7QWwhzIe3VeC4wxme3/Tsw9L292eBcXx0g3PSugR7Amu/kO6QJ8zlYZuOVu51SnbIUOpN89V6q7FgcScRGWAMVxHNm0foizAQAk7Z8eqnqy7ExpGnhwF4Z6YXqeWGFcwug7cSNUc+m3P+iAOYcpKG9LkFaDUypSNVZVcqIrQaqgGW663H/5R3LfJiP24XiqxZDSqmnhWY6jNDyo9HfSzfNkfrHp0qBxyvLlwrlw3NhEduoWOBOQghbB+IRFgz9j3ayx9n+8o43MEgx005mCSTmXZqKzmkMVUpODIgnI/aovV6+ESYRqdnSuH+snBuAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5eM+J/7ubhVIxsE8BzSDXPV5iMSGeqFPP4HDzWpfNc=;
 b=JwKnloTY5PgglkuLM3MfLoCMbAjgJuANs4F6jUkZJe790giFsdZPkOhQbPpqTmvEam0UXxbzVq1JDoYQSOhnZCe0E2Wq23Fk2wd4Mk+9P2c3yPjLzS8omJZ/kRKuNjvo9ae7mu8GhlyVzaDvYJUHrmC+K5FdYfwOTy9EB2w9hKw=
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
Subject: [PATCH v3 04/22] xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA config option
Date: Fri, 19 Jun 2026 16:49:52 +0900
Message-ID: <20260619075011.377116-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 738610e7-29ec-4546-59b4-08decdd769b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|10070799003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nGEy/KVecagurHdckKhrKmyUOcBwP8af48/iYIM/ACd8bdul+7133RrQj03aN7IMOFhxgw1tGO0UfSjWo0ZFU1SUPcJ6IYAtqmo/YOta9qnGlUSQ/m5gCGrJQXmVvmnd2RlPro+GTzWNtxubNUE2+3RG5rgn/RyS4TIuTTNWHiOnfbLs065qLm5idcRyoLL2NFdMkWEGeF5mQGTBI/1ufrLvD/HqgQJ9QkhakNlT8xHBtO7dEriWHyPDuaG2UCBtIwJ0WIK3356SXr1E4LWy8MsMG70RQzEHzMN6hiBhgEMA2PEKve3guNDntMXuxqoM95n9NWZ3RwaLgl/3uhmjcklKE6n0eLNsFd1lYc2qu6buopSUO1ifb42XvLhGEo6c4bBSqWpwF+09DSgxLZJDWFTG2X2FCFD+DoyUALUXgshqUjeqRrFtBMWBOxRU37bMWeqvq4mGWV1ReMt3//5QIf68DwE7lfHRsZ01e5p21VgGkmOs0jpuv7BGQH2zkrwlxXLJsAWzqUEs4KKL8vKVJFxB5qfMGidAwtPM4CPgyawDXgdRG6hwMGzLZaf72wIPArBxrNADCcwO8cLJdAOOYBmkFl0HErT6QR/rSsyVYUhuvxPEIobx8IiUS2avy88xpXGspdTZSjQWsf9Or4S/YO4bndcKF1SLDX9XVdbExOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mGR3LdkEftpm3Gg6UZfsGOMQlilKp/eWwS9WPx4Lj0VBxI3wREeCxS1c412Z?=
 =?us-ascii?Q?xmlk8hTtD3zQTH+R+mkeRceqslg0go+yHQ3lhRE/k0Rc/0JsKOdSPnO6pYxg?=
 =?us-ascii?Q?RYDlLKjyM8BiYmowDT83eVAW3gIWWEj5tglfQmX5Q0dWttQFhsm0L1G6fcKn?=
 =?us-ascii?Q?SnRRnrvY12z/PXptCckzJWR+AEFCQvGUL1kG6De7XlyqfU8pxX6ZjgSkOBF3?=
 =?us-ascii?Q?AN+OTDKRudiHIIlfAdseea/UEXtFAG9OzcrXuDgSSARCpJXgmcA7Db+IB17K?=
 =?us-ascii?Q?bCn8S+7CFO9gGChFhHZSWVYO4ABH5Y+qaHvkAuIb1tyYKoMYEHHFZazF7b3h?=
 =?us-ascii?Q?bhgNGc9HjATjm/nDtcQNJmTOCRcYBqK975j863tVum6jv3nx31TDfx+vk/BQ?=
 =?us-ascii?Q?JdqhtFeBMJ5MzeBND7CrffAfQufv7KdAgnZLtBXvqx/3FbABbCd/IgiYSL38?=
 =?us-ascii?Q?/JEFoMmFWjO54uPhhiOOlnzBhrBEtncHA5KA09kQUa29fttE1YPiuHqWAEwW?=
 =?us-ascii?Q?yAMgZOFoMgJZXiaUWJMz6Wp2o5EmsErWVkYhwKokJf4DspSyfHNxuGeL4q7/?=
 =?us-ascii?Q?HLZ98IgVYUYvRaScMaZ3DFG8bbCTgLJI7e3OSsXEYbjS0uh8vutG21eQGkEd?=
 =?us-ascii?Q?gB1J5sAH01N6bZv9lT6Mnhr/l4JitateAUNnV4sxnKs0lX124QtF9H1KsOV/?=
 =?us-ascii?Q?ONPQOV6B0WQrYBdcJ/Ilk1Tl2yJ8lMJJwYKVRFI2/Fo/NvTT9++9dTSBlsau?=
 =?us-ascii?Q?tuzLKeQuofBCEpPU0Bw55tyyi8KPowGyeFaAecoDcAVDnH4tJqdnnRizRoXx?=
 =?us-ascii?Q?QRH5QcbBPirGL4/t/KJ1pAAzQvwCtEXmznIjPY/LD/NkuzfziWeJAyapiYSm?=
 =?us-ascii?Q?exHEpA8ALITqNPpmdRoUdHWPSbjVl6AgkiwzjxHEj2/Fx5VMrH58DQvVzITw?=
 =?us-ascii?Q?DjsJ6QvTaSkIrW7WniIYyYXiqBTd0tgp3ZFD7irxlv2OLmOXWFF71RWFqxT7?=
 =?us-ascii?Q?jsQcvjmANQYhQSWtCvLDRWF6dzzfa1bHx7NknjwvBptC/V03GUFEbDlk6tBU?=
 =?us-ascii?Q?4mWiOi2+qtjicbZf8B0S+PwL8PIVt3LyhnwvEpmeUFtxwmlQe8hJi75dzdGV?=
 =?us-ascii?Q?KJa9My+pxQwSPPJZvCPNYacrfjpCU22tVuuqVNm2zFJkLNXWxKZvRDD9piFc?=
 =?us-ascii?Q?Ht4GqxtN+wV7NwQNQStztJelZ6CuWjyFc5uEo11jhsS1KEbMABaNxA9Qdvua?=
 =?us-ascii?Q?K8fmZ5lkzgVWecGtl3JaY7CkAThrHkImF/iNZaT+o/MITb18jrYXigDv21Bg?=
 =?us-ascii?Q?mQqNi7OUI5tiU4G+rkSwbTll8E1aHmien9w7SQAHOFNiBJrDrSBUSOw3BSMj?=
 =?us-ascii?Q?CFw9tANkY2495qRkL6cjc7qchuxQY6kotNqB3wwePM0TVZ/3M+TwedwncQaq?=
 =?us-ascii?Q?FHPFigPxDa8b8D6go+t1NEDMBdgrSlTGTNtJczFSvjdLqoeyRX3KZk5V9akQ?=
 =?us-ascii?Q?zE5BsfTB9nIGY/etblGtFqJ+zNLh24atZA8QRqNEGgZaeUzmRhBrEhrwym2q?=
 =?us-ascii?Q?gpvcmC6CmHYm/ur3Tk+2PPOIC8A/L8QukBOWdxPozSeg4o2ayS+4Vg29+0Or?=
 =?us-ascii?Q?8PCl8qbBAm/q8Q+ujwXDomOY6i9/x969N19bVEx45sW4rooTq/bGo9cGlphw?=
 =?us-ascii?Q?dRosWbkImLPl832cnNB0UySvEh64+oKvASdfNQ88SScIwGmF9DlVjTJ+BrZV?=
 =?us-ascii?Q?Y0WlBH7dv6DMzJePRP6OOpY9S4CpX555S8IxO8FlmVVKerp3jTwCEn1GUZ33?=
X-MS-Exchange-AntiSpam-MessageData-1: d3tPqaxDIDQ53A==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 738610e7-29ec-4546-59b4-08decdd769b8
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:20.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEjo9cL38WPuog/p6MeoZpOctEdDTikALiscNUNAAj8g3YSjh2RZz/DM2g0GrDAnim8FquC19BgjKGoHWNYJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855426-473E300E-C92B494F/0/0
X-purgate-type: clean
X-purgate-size: 2840
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
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
X-Rspamd-Queue-Id: 89FF66A4715

Introduce the CONFIG_DEVICE_TREE_NUMA configuration option for
Device Tree-based NUMA support. Selecting CONFIG_ARM_NUMA enables
CONFIG_DEVICE_TREE_NUMA, which in turn automatically selects CONFIG_NUMA.
While this option is currently restricted to the ARM architecture, it
is designed to be selectable for RISC-V and PPC in the future.

This patch also includes the necessary compilation fixes required when
building with CONFIG_NUMA, and creates a single fake NUMA node to ensure
Xen can boot successfully at this stage.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/Kconfig   | 8 ++++++++
 xen/arch/arm/setup.c   | 4 ++++
 xen/arch/arm/smpboot.c | 2 ++
 xen/common/Kconfig     | 8 ++++++++
 4 files changed, 22 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5fa89fcb24..c0c03cbd47 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -99,6 +99,14 @@ config MPU
 	  systems supporting EL2. (UNSUPPORTED)
 endchoice
 
+config ARM_NUMA
+	bool "Device tree based NUMA support (UNSUPPORTED)" if UNSUPPORTED
+	select DEVICE_TREE_NUMA
+	help
+	  Device tree based NUMA support. The "numa-node-id" property in
+	  the CPU and memory nodes of a Device Tree defines the NUMA node
+	  to which they belong.
+
 source "arch/Kconfig"
 
 config ACPI
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6310a47d68..c0202d9ff6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -351,6 +351,10 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
+#ifdef CONFIG_NUMA
+    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+#endif /* CONFIG_NUMA */
+
     end_boot_allocator();
 
     /*
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..d1651fe7dd 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -47,8 +47,10 @@ integer_param("maxcpus", max_cpus);
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
+#ifndef CONFIG_NUMA
 /* Fake one node for now. See also xen/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+#endif /* CONFIG_NUMA */
 
 /* Xen stack for bringing up the first CPU. */
 static unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480ee..bfb3a3c007 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -188,6 +188,14 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config NUMA_DISTANCE_MAP
+	bool
+
+config DEVICE_TREE_NUMA
+	bool
+	select NUMA
+	select NUMA_DISTANCE_MAP
+
 config NUMA
 	bool
 
-- 
2.43.0


