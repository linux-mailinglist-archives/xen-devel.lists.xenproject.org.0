Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AsvEEGYTVmpQywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:45:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A875387D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=G2pToSkm;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362129.1614044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjae1-0005ou-JL; Tue, 14 Jul 2026 10:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362129.1614044; Tue, 14 Jul 2026 10:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjae1-0005mp-GL; Tue, 14 Jul 2026 10:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1362129;
 Tue, 14 Jul 2026 10:45:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wjadz-0005mR-Hm
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:45:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjady-00HHZm-Up
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:45:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561351-2eae-0a2a0a5409dd-0a2a4509a954-6
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:45:39 +0200
Received: from [52.101.125.100]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561350-be1a-0a2a45090019-34657d6404e0-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:45:38 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY6P286MB7347.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:361::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 10:45:34 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 10:45:34 +0000
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
 b=xJTr6O8u3zxBDmTr3h6rx2n/qXpqyoBQOYvPdSmWMZ3OJjT7Lvc1e6aKrX0M1J6Bpb2ZgIDLrFWsETR0uvcir5IChFk1ePcgM2rOvmAiySnrIO9tmCI+ic32B0JRvPClZ4KWAPoaQkf6nO3SA4IXny8hWj6h9dGIZWAVcPHc3K/wGPncA6ZCvKlthLDnAUglM8YpnqYZ2FaoyyrZ5oApyyqoxnyMowlAaKrf6bLKt8RNKx0Q5TRAAIwyaNxlv02K2vNjX3LT8qvu8VHhT9qpOHwlyFjLhKxdTmnatAax7lURDRiGUqqhDTfylzHAKdrDhW7gKjF8k5pA2W9fGtvjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvwQZehxXB09vIZoJkUcftBlcMfxyVb3a3R+w/6waGc=;
 b=pL9v6RT8hXfsZBXCwnFQ/vAA6z/wL3q+4Oi7vKJhZd+c+mhuAqoMaB9lXSof2zrtSF/EUhGYv/dPW8i5aHf67Ot3MSaN8S363WkRa6XzqqGWJ1b/seRpiSKBFTArH/lRaTqGh0flsiqgJhkQRnUA1fFyEp/WePvU1SYvgY79v/2326wnXSkZSJJsAJmIeQ4yK9YCc+LRewCqOSIu4SB5IBVgV5c3W57geekEs8/GRhTSs3VPD0wm6u4baz07DElYbdMLhfH4mBmOGgdSYWBnGcQfiuQRmv9s+i/mCG2CVRTt0MAlYMREXpKhwS81epD8JF7lwapboUI++S+rhoKxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvwQZehxXB09vIZoJkUcftBlcMfxyVb3a3R+w/6waGc=;
 b=G2pToSkmTgLr3HbeoLD1sDIZyBdyimawIHMpthn75mZfZpWrAbWfCyYvPak0DIO37VQhd7tMWZLjppcVE0yQViTnJx7ofEjAN19AFYPMejA+OSr50J50Fc9vc+o+BH5XuiPnCrMR8ZNYcGto1Tgphbnf0fIGJ80TfL4ykOIA+MI=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 1/5] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Tue, 14 Jul 2026 19:44:41 +0900
Message-ID: <20260714104445.919830-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714104445.919830-1-taka@valinux.co.jp>
References: <20260714104445.919830-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY6P286MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: df01bb8f-2de9-46cf-e343-08dee195085c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10070799003|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	QrgFVUVgxwSTLvb7y6tFWyNSVev1DKg9VP3adNJbmg8VL0CdZ00nnvRln+Vv8WGVE3IZ3wqQMViaBdr/yyLh+uzKIqBttJEw0woFt0qOgFq0HKOPBL0nLXfeFqVR7/Gnlrgpu1Y3WDB32TBZdzHN2dZkU0IMtPFly4vSMlTpXWNPOjzHEeE1ZUVm9CaFi7/CMmZz0sKR0fQYCobqWJy/0xWz3EvXjgdMP6Qd6SAPimDazf+m4xG22GRtQ5V9bUOrz4nriAXtOgby0qAcoDz8iahfetWCH2ZiJ2nZWmbOwOoP1Xk3rClsjmUeZG4a/sWYXqc5QzWnhfGRsMvXEqWqPmZ4VzESWEONcoU8V14g6nrgNjeKFHVzgAn0laQe43ewxN1DyWmJB+RoZTEkjnuCR73Zx65egdJQb+Tbi7JpXVoZrUkkbL3R10dWAoh8oYudgvw4sgWlmDuNdsFroy18O6QxsyszRGFMhLILMjpx47Zp1BuvWjGjL3Ka54E+57fYSaFxgrMa+xtdq5DTr8waLjV0e9/ah3xc4as4tXGQEd7bHfeR17q13kY2DEP+gWUXBf68Mh7MXR8oSOGlTMFxrB8mCui1V3tL4iJCGEwlH1SqcJBPdn3+s5tA0rDr3It5dzVYGeu8ZSQhjSfQRMrPx8fFWI83wxxf3LUf4CvW9tk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10070799003)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HGBYhjz1qFA4B+Fi4ockFMrHmN8pmtdWOKjRqnExMYrGjrpJJ9dLRlHvyQ04?=
 =?us-ascii?Q?J31PNEXFCT/hj9X+MeqW7Fzqy+MbNvTMu/3q9v25oe0eU3oO5WECRx+Az9Q7?=
 =?us-ascii?Q?NAsvjdZZm+ajaNQM7qAxnz3aXl3bXARtRDFTWxzEzu8N37EpyCHlxFA3ujE0?=
 =?us-ascii?Q?vhlw2VmX5OsbvrNs5uinRYj8M9IyKtWj9VvQoX+GCKqib4WioAUAMBCar4TR?=
 =?us-ascii?Q?lolukV4yP+7JHIXkj9c53De/AsljwLdwh3MDDJjE3aqTaBxk6GQm2u01o0xM?=
 =?us-ascii?Q?IPgeORqFt5eTX/0rLs4f2J9Ns8aN2rIUBoEKlSgBMM3Iv+EaHhck7JDPp9eW?=
 =?us-ascii?Q?1x3ujksdzU/vvsYcFSREO3MXi5r59RNwIp+luGYs+xQ0GOmqQ1u4NWstQSs/?=
 =?us-ascii?Q?jdDtX7V4RINeZ+VMmblFlunjYxS5GxyXw7Udu3JjzFNqI+Crs6dnp6XfKbw/?=
 =?us-ascii?Q?hUVb4WNFwm/PGvZ2vBRnh90W/aN3c5uQ6wCT0Y4Su11cVAGTPAIcUSmlapDY?=
 =?us-ascii?Q?crfOYdzCT1zdlmTzuj9uFuIOha5XYiDFmbT557fjF4vzPvbsc9/MjsFi7ATl?=
 =?us-ascii?Q?sE6HEucqhasWOPb8V57LBPIkeDrqOfLBJhq4qUHBaTfit/+NF1f9xINzyQgz?=
 =?us-ascii?Q?k0r2FDk4+dWRg/dAZsTNs8TZL5SCmYkk6zH1P/vblFYbOgeqiJDaCZKg5hH7?=
 =?us-ascii?Q?Sqc59gEF5PBijFX25/X7wOrJOMn68UTv3jty8oEpgEojxdW+idzwqkO1KuCd?=
 =?us-ascii?Q?but4tQYhmmc6D2V1hxQ5NgNIoMtJ5QqliytLVWrFm2rQlxrHub3IU+nhMj1A?=
 =?us-ascii?Q?mfPpGEy54CA6el5l6lKyC/CzfHCeXhYQnpMtvv0P1NeZt4hM9mQ1UIvQ87gO?=
 =?us-ascii?Q?2SwmKZ0Z4jfuXZ02njg5jvTB24NUh26x9GIBtVFPRrpR0tEwUG5qHDGiUm9h?=
 =?us-ascii?Q?iFnAtU2nmG9OCq9p31VHJG/paOFtG0WKpnWk+odcEaorjc1o5HiPJTub+y1w?=
 =?us-ascii?Q?pSUAsvaY9MsIqtZQSCazFcwthkDwZWXrSEStFPzAxxN3Bs988ixS7tWfj7iz?=
 =?us-ascii?Q?lTcpNueHpXmxvQcMpTrU8+EAh4SLRWn5GwWK/R4gIfkE+lfngLdpXDfvH2Ih?=
 =?us-ascii?Q?1h6ILzYoWuIFrdg9rByjkYkh7+PUeBieJHlFcC/rikD0Xs4qRY2/pzoEiC3f?=
 =?us-ascii?Q?h3JpkLbIcvnHlvfQjNfh3BTUB7xRVom0Nt2SHFgnNwwEwcxTANu6VoU+oPJn?=
 =?us-ascii?Q?L9hsd2vqYMUi4GKUy490mhmnon0iluH55hL/qLBI19ra3xNoVTS+4vcUjL3+?=
 =?us-ascii?Q?3nqzuGlUtJFCmLR+lebjLtPUHwHazVuxD52oHIwqDnhhl8WtiPuEE7EhWdKm?=
 =?us-ascii?Q?hoBTwOFjj3O54xFfeTFjQqpCeuezNwxaW4ptaqtKI/QqgIZkI5JK9O/8G6Md?=
 =?us-ascii?Q?mOxYMwYt0scd8Pss0uUszW+G5tFCZReFf0evW90bmKuzFRU6yI6bzdgptI9f?=
 =?us-ascii?Q?ZicrzY/dR/hXCbsC/YbRpJxGAQnXlqHtF+gLS0bbEtlEardBDDeEpgeyZzhZ?=
 =?us-ascii?Q?sUU4KDcrCbmP6prQyJBXSQJQw3sAu5zis1HQc1UDZHujSEgm+l5zk3pHeIK6?=
 =?us-ascii?Q?eu0kOneNvjPnkd9+PZJs+a5H6DkGD7tP4/+Ozr1cY3trphUGBmycfZlB7Zrh?=
 =?us-ascii?Q?hBFti14nvdu6eGcvPlUxVDlJVkiCjx10BldP5ZlzWOwKlgesuzbPfHbqdfi1?=
 =?us-ascii?Q?8sjGJNw7Q3MGQm/BM+9S3ePoZYdS8vfARCF53VDmQzbI2Zqi4eE3iSSykE2Y?=
X-MS-Exchange-AntiSpam-MessageData-1: XfooPvzFYSocoQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: df01bb8f-2de9-46cf-e343-08dee195085c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:45:34.0612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FlmHVx3mFyDb9AsfW9AKTWc/dYb9ZURQG9wGMAD7P+t1H4a9Ok5TpaL0toEKoDdWj/dG18z8j6azXKs/jV8Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7347
X-purgate-ID: tlsNG-bad1c0/1784025939-BC2F4034-866769C7/0/0
X-purgate-type: clean
X-purgate-size: 22679
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:from_mime,valinux.co.jp:mid,valinux.co.jp:email,valinux.co.jp:dkim];
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
X-Rspamd-Queue-Id: A77A875387D

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v6:
   * Updated Kconfig to make both DT_CPU_TOPOLOGY and ACPI_CPU_TOPOLOGY
     select GENERIC_CPU_TOPOLOGY.
   * Ensured that if topology parsing from either DT or ACPI PPTT fails, the
     CPU topology table is freed to fall back to the non-topology behavior.
   * Moved the `cpu_topology` definition to `cpu.c` so that variables and
     functions in `cpu-topology.c` can be completely freed after Xen init.
   * Avoided assuming `np` becomes NULL after exiting
     `dt_for_each_child_node()`; explicitly return NULL instead.
   * Optimized `setup_siblings_masks()` to eliminate redundant loop iterations.
   * Replaced the `invalid_topo_id` constant with the `INVALID_TOPO_ID` macro.
   * Initialized all members of the `cpu_map` array with `INVALID_TOPO_ID`.
   * Applied the `static` specifier to file-local data structures and functions.
   * Renamed local variables to more intuitive names.

 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/smpboot.c                |   7 +
 xen/common/Kconfig                    |  22 ++
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  65 +++++
 xen/common/cpu.c                      |   5 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 343 ++++++++++++++++++++++++++
 xen/drivers/acpi/Kconfig              |   3 +
 xen/drivers/acpi/Makefile             |   1 +
 xen/drivers/acpi/topology.c           |  41 +++
 xen/include/xen/acpi.h                |  13 +
 xen/include/xen/cpu-topology.h        |  34 +++
 xen/include/xen/dt-cpu-topology.h     |  35 +++
 14 files changed, 572 insertions(+)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 843a43897e..1e0fd4957e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
+	select HAS_GENERIC_CPU_TOPOLOGY
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
 	select HAS_STATIC_MEMORY
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index ba5fd2dd52..d957553a44 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -9,10 +9,12 @@
 
 #include <xen/acpi.h>
 #include <xen/cpu.h>
+#include <xen/cpu-topology.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
+#include <xen/dt-cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/mm.h>
@@ -244,6 +246,9 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+        /* Pass the info to dt_init_cpu_topology() */
+        map_cpu_to_dt_node(i, cpu);
     }
 
     if ( !bootcpu_valid )
@@ -280,6 +285,8 @@ void __init smp_init_cpus(void)
     else
         acpi_smp_init_cpus();
 
+    init_cpu_topology();
+
     if ( opt_hmp_unsafe )
         warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
                     "It has implications on the security and stability of the system,\n"
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba84..8e64b58739 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -140,6 +140,9 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_GENERIC_CPU_TOPOLOGY
+	bool
+
 config HAS_IOPORTS
 	bool
 
@@ -191,6 +194,25 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config GENERIC_CPU_TOPOLOGY
+	bool
+
+config DT_CPU_TOPOLOGY
+    bool "Device tree based CPU topology support (UNSUPPORTED)" if UNSUPPORTED
+    depends on HAS_GENERIC_CPU_TOPOLOGY && DEVICE_TREE_PARSE
+    select GENERIC_CPU_TOPOLOGY
+    help
+      Retrieve CPU topology information from the device tree to optimize
+      virtual CPU scheduling.
+
+config ACPI_CPU_TOPOLOGY
+    bool "ACPI based CPU topology support (UNSUPPORTED)" if UNSUPPORTED
+    depends on HAS_GENERIC_CPU_TOPOLOGY && ACPI
+    select GENERIC_CPU_TOPOLOGY
+    help
+      Retrieve CPU topology information from the ACPI PPTT to optimize
+      virtual CPU scheduling.
+
 config NUMA
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e25614..901bb37925 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
+obj-$(CONFIG_GENERIC_CPU_TOPOLOGY) += cpu-topology.init.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
diff --git a/xen/common/cpu-topology.c b/xen/common/cpu-topology.c
new file mode 100644
index 0000000000..374b3fce1b
--- /dev/null
+++ b/xen/common/cpu-topology.c
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/dt-cpu-topology.h>
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
+    int ret;
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
+        ret = dt_init_cpu_topology();
+    else
+        ret = acpi_init_cpu_topology();
+
+    /* Free the CPU topology table if initialization fails. */
+    if ( ret != 0 )
+        free_topology_table();
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
diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index f09af0444b..3242adb6f0 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -46,6 +46,11 @@ const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
 #undef MASK_DECLARE_2
 #undef MASK_DECLARE_1
 
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+struct cpu_topology;
+struct cpu_topology *__ro_after_init cpu_topology;
+#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
 static DEFINE_RWLOCK(cpu_add_remove_lock);
 
 bool get_cpu_maps(void)
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 9036e455d6..6ee670b5f4 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
+obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
new file mode 100644
index 0000000000..be82272c14
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,343 @@
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
+
+#define INVALID_TOPO_ID (~0U)
+
+struct cpu_map {
+    unsigned int thread_id;
+    unsigned int core_id;
+    unsigned int cluster_id;
+    unsigned int package_id;
+};
+
+static struct cpu_map __initdata cpu_map[NR_CPUS] = {
+    [0 ... NR_CPUS - 1] = {INVALID_TOPO_ID, INVALID_TOPO_ID,
+                           INVALID_TOPO_ID, INVALID_TOPO_ID}
+};
+static struct dt_device_node *__initdata dt_cpu_table[NR_CPUS];
+
+static void __init setup_siblings_masks(unsigned int target_cpu)
+{
+    const struct cpu_topology *target_topo = &cpu_topology[target_cpu];
+    const struct cpu_map *target_map = &cpu_map[target_cpu];
+    unsigned int cpu;
+
+    /* Update cluster, core and thread sibling masks */
+    for_each_possible_cpu(cpu)
+    {
+        const struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+        const struct cpu_map *map = &cpu_map[cpu];
+
+        if ( target_cpu > cpu )
+            continue;
+
+        if ( target_map->package_id != map->package_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, target_topo->core_sibling);
+
+        if ( target_map->cluster_id != map->cluster_id )
+            continue;
+
+        if ( target_map->cluster_id != INVALID_TOPO_ID )
+        {
+            cpumask_set_cpu(target_cpu, cpu_topo->cluster_sibling);
+            cpumask_set_cpu(cpu, target_topo->cluster_sibling);
+        }
+
+        if ( target_map->core_id != map->core_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, target_topo->thread_sibling);
+    }
+}
+
+static struct dt_device_node *__init dt_find_child_node_by_name(
+    const struct dt_device_node *dt,
+    const char *name)
+{
+    struct dt_device_node *np;
+
+    dt_for_each_child_node(dt, np)
+        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
+            return np;
+
+    return NULL;
+}
+
+void __init map_cpu_to_dt_node(unsigned int cpu,
+                               struct dt_device_node *cpu_node)
+{
+    if ( cpu < ARRAY_SIZE(dt_cpu_table) )
+        dt_cpu_table[cpu] = cpu_node;
+    else
+        printk(XENLOG_WARNING
+               "cpu %u exceeds the max cpus %zu\n",
+               cpu, ARRAY_SIZE(dt_cpu_table));
+}
+
+static unsigned int __init cpu_node_to_id(
+    const struct dt_device_node *cpu_node)
+{
+    unsigned int cpu;
+
+    for_each_possible_cpu(cpu)
+        if ( cpu_node == dt_cpu_table[cpu] )
+            return cpu;
+
+    return INVALID_TOPO_ID;
+}
+
+/*
+ * This function returns the Xen cpu number of the DT node.
+ */
+static unsigned int __init get_cpu_for_node(
+    const struct dt_device_node *dt_node)
+{
+    const struct dt_device_node *cpu_node =
+        dt_parse_phandle(dt_node, "cpu", 0);
+
+    if ( !cpu_node )
+        return INVALID_TOPO_ID;
+
+    return cpu_node_to_id(cpu_node);
+}
+
+static int __init parse_core(const struct dt_device_node *core,
+                             unsigned int package_id,
+                             unsigned int cluster_id,
+                             unsigned int core_id)
+{
+    bool leaf = true;
+    unsigned int thread_id;
+    unsigned int cpu;
+
+    for ( thread_id = 0; ; thread_id++ )
+    {
+        const struct dt_device_node *thread;
+        char name[20];
+
+        snprintf(name, sizeof(name), "thread%u", thread_id);
+        thread = dt_find_child_node_by_name(core, name);
+
+        if ( !thread )
+            break;
+
+        leaf = false;
+        cpu = get_cpu_for_node(thread);
+
+        if ( cpu == INVALID_TOPO_ID )
+        {
+            printk(XENLOG_ERR
+                   "ERROR: %s: Can't get CPU for thread\n", dt_node_name(thread));
+            return -EINVAL;
+        }
+
+        ASSERT(cpu_map[cpu].package_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].cluster_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].core_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].thread_id == INVALID_TOPO_ID);
+
+        cpu_map[cpu].package_id = package_id;
+        cpu_map[cpu].cluster_id = cluster_id;
+        cpu_map[cpu].core_id = core_id;
+        cpu_map[cpu].thread_id = thread_id;
+    }
+
+    cpu = get_cpu_for_node(core);
+
+    if ( cpu != INVALID_TOPO_ID )
+    {
+        if ( !leaf )
+        {
+            printk(XENLOG_ERR "ERROR: %s: Core has both threads and CPU\n",
+                   dt_node_name(core));
+            return -EINVAL;
+        }
+
+        ASSERT(cpu_map[cpu].package_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].cluster_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].core_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].thread_id == INVALID_TOPO_ID);
+
+        cpu_map[cpu].package_id = package_id;
+        cpu_map[cpu].cluster_id = cluster_id;
+        cpu_map[cpu].core_id = core_id;
+        cpu_map[cpu].thread_id = 0;
+    }
+    else if ( leaf )
+    {
+        printk(XENLOG_ERR
+               "ERROR: %s: Can't get CPU for leaf core\n", dt_node_name(core));
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init parse_cluster(const struct dt_device_node *cluster,
+                                unsigned int package_id,
+                                unsigned int cluster_id,
+                                unsigned int depth)
+{
+    bool leaf = true;
+    bool has_cores = false;
+    unsigned int core_id;
+    unsigned int child_cluster_id;
+
+    /*
+     * First check for child clusters; we currently ignore any
+     * information about the nesting of clusters and present the
+     * scheduler with a flat list of them.
+     */
+    for ( child_cluster_id = 0; ; child_cluster_id++ )
+    {
+        const struct dt_device_node *child_cluster;
+        char name[20];
+        int ret;
+
+        snprintf(name, sizeof(name), "cluster%u", child_cluster_id);
+        child_cluster = dt_find_child_node_by_name(cluster, name);
+
+        if ( !child_cluster )
+            break;
+
+        leaf = false;
+        ret = parse_cluster(child_cluster, package_id, child_cluster_id,
+                            depth + 1);
+        if ( depth > 0 )
+            printk(XENLOG_WARNING
+                   "WARNING: Topology for clusters of clusters not yet supported\n");
+        if ( ret != 0 )
+            return ret;
+    }
+
+    /* Now check for cores */
+    for ( core_id = 0; ; core_id++ )
+    {
+        const struct dt_device_node *core;
+        char name[20];
+        int ret;
+
+        snprintf(name, sizeof(name), "core%u", core_id);
+        core = dt_find_child_node_by_name(cluster, name);
+
+        if ( !core )
+            break;
+
+        has_cores = true;
+
+        if ( depth == 0 )
+        {
+            printk(XENLOG_ERR
+                   "ERROR: %s: cpu-map children should be clusters\n",
+                   dt_node_name(core));
+            return -EINVAL;
+        }
+
+        if ( leaf )
+        {
+            ret = parse_core(core, package_id, cluster_id, core_id);
+            if ( ret != 0 )
+                return ret;
+        }
+        else
+        {
+            printk(XENLOG_ERR "ERROR: %s: Non-leaf cluster with core %s\n",
+                   dt_node_name(cluster), name);
+            return -EINVAL;
+        }
+    }
+
+    if ( leaf && !has_cores )
+        printk(XENLOG_WARNING "WARNING: %s: empty cluster\n",
+               dt_node_name(cluster));
+
+    return 0;
+}
+
+static int __init parse_socket(const struct dt_device_node *socket)
+{
+    bool has_socket = false;
+    unsigned int package_id;
+    int ret;
+
+    for ( package_id = 0; ; package_id++ )
+    {
+        const struct dt_device_node *cluster;
+        char name[20];
+
+        snprintf(name, sizeof(name), "socket%u", package_id);
+        cluster = dt_find_child_node_by_name(socket, name);
+
+        if ( !cluster )
+            break;
+
+        has_socket = true;
+        ret = parse_cluster(cluster, package_id, INVALID_TOPO_ID, 0);
+        if ( ret != 0 )
+            return ret;
+    }
+
+    if ( !has_socket )
+        ret = parse_cluster(socket, 0, INVALID_TOPO_ID, 0);
+
+    return ret;
+}
+
+static int __init parse_dt_topology(void)
+{
+    const struct dt_device_node *cpus;
+    const struct dt_device_node *map;
+
+    cpus = dt_find_node_by_path("/cpus");
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
+int __init dt_init_cpu_topology(void)
+{
+    unsigned int cpu;
+    int ret;
+
+    BUG_ON(!acpi_disabled);
+    BUG_ON(!cpu_topology);
+
+    ret = parse_dt_topology();
+    if ( ret == 0 )
+        for_each_possible_cpu(cpu)
+            setup_siblings_masks(cpu);
+
+    return ret;
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
index e3f3d8f4b1..ef0b9a4502 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -2,6 +2,9 @@
 config ACPI
 	bool
 
+config ACPI_CPU_TOPOLOGY
+	bool
+
 config ACPI_LEGACY_TABLES_LOOKUP
 	bool
 
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 477408afbe..bcdb1b5e1b 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PM_OP) += pm-op.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
+obj-$(CONFIG_ACPI_CPU_TOPOLOGY) += topology.init.o
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
new file mode 100644
index 0000000000..45d1f2c5be
--- /dev/null
+++ b/xen/drivers/acpi/topology.c
@@ -0,0 +1,41 @@
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
+int __init acpi_init_cpu_topology(void)
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
+        cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
+    }
+
+    return 0;
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
index 2fdf38cf74..cbb02e0f35 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -135,6 +135,19 @@ static inline int acpi_boot_table_init(void)
 
 #endif 	/*!CONFIG_ACPI*/
 
+#ifdef CONFIG_ACPI_CPU_TOPOLOGY
+
+int acpi_init_cpu_topology(void);
+
+#else /* CONFIG_ACPI_CPU_TOPOLOGY */
+
+static inline int acpi_init_cpu_topology(void)
+{
+    return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_ACPI_CPU_TOPOLOGY */
+
 int get_cpu_id(u32 acpi_id);
 
 unsigned int acpi_register_gsi (u32 gsi, int edge_level, int active_high_low);
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
new file mode 100644
index 0000000000..7cfe3752cd
--- /dev/null
+++ b/xen/include/xen/cpu-topology.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#include <xen/cpumask.h>
+
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+
+struct cpu_topology {
+    cpumask_var_t thread_sibling;
+    cpumask_var_t core_sibling;
+    cpumask_var_t cluster_sibling;
+};
+
+extern struct cpu_topology *cpu_topology;
+void init_cpu_topology(void);
+
+#else /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
+static inline void init_cpu_topology(void) {}
+
+#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
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
index 0000000000..72b35b3cf2
--- /dev/null
+++ b/xen/include/xen/dt-cpu-topology.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DT_CPU_TOPOLOGY_H
+#define XEN_DT_CPU_TOPOLOGY_H
+
+#include <xen/errno.h>
+
+struct dt_device_node;
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+
+void map_cpu_to_dt_node(unsigned int cpu, struct dt_device_node *cpu_node);
+int dt_init_cpu_topology(void);
+
+#else /* CONFIG_DT_CPU_TOPOLOGY */
+
+static inline void map_cpu_to_dt_node(unsigned int cpu,
+                                      struct dt_device_node *cpu_node) {}
+static inline int dt_init_cpu_topology(void)
+{
+    return -EOPNOTSUPP;
+}
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


