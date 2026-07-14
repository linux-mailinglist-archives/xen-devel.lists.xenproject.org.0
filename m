Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IpUdGIITVmpZywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:46:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD375389D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:46:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=B0cp9drr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362154.1614081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjaeU-0007RM-Sd; Tue, 14 Jul 2026 10:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362154.1614081; Tue, 14 Jul 2026 10:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjaeU-0007O0-Nw; Tue, 14 Jul 2026 10:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1362154;
 Tue, 14 Jul 2026 10:46:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wjaeT-000799-76
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:46:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjaeS-009uid-Jq
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:46:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561370-2eae-0a2a0a5409dd-0a2a4501e9c4-14
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:46:12 +0200
Received: from [52.101.125.121]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a561370-5984-0a2a45010019-34657d792ce5-4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:46:12 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY6P286MB7347.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:361::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 10:46:09 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 10:46:09 +0000
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
 b=Lm8jXPF7LAsNnD1MC0CUDvBQygWlqHVVY4+YADMwg0SdJhEuIDzCGol5Yc4zrheJAG1o865hcOLsIkZAtX/DPZNIr664dLvmMGXkIN7MCK4RSvJDzbPo6P5OPAxO6O3zQ/C87p+CpdEHPdwvUXYdFuoKVOWNcGS9DKkIBOy0ldhCvhq4kfre0HShhxSnUbX22Z/za2zeipS6Y0ID2q6scRTCuJNFVHLShQxy6vQmZ1TZIngOzHLCdIOSDTeGIvHfJZXtCuJLGeHM0qBEnjiPDoetvaNZCMHqXBXNmJXVP5pfg/kWkWOIBKJJ66lqwNepPi0cknNRvjWDzcKRrbJvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FGPjsAtuJGsBWUU2sdzagAfn9WNOxXnDMlbchoHAy8=;
 b=yU/DESxeSRzQV8dDsMCRNh2gSDtedGdLD4O0+saHmq3PWLJ9jAL1Hhw//1IJ2U87WLGIY+a3HY5u4hXw7TkW3iKFEMBtL4FH/8qEscxaWrXDAMTBFCsYHvFv7H+angBKuFJO6PyaE1RPh2r0JtyD95ceB71QNfTULCAqvGvmZjKZZAOlD9Xivvn3wdoTLA85ZgND9IzylRmzJsSjiVWs17OZTJhj1S6/y4IYLoyMioaL+wgqb1OX2NvjNPxq/o9EgwiUvH6GqKG4q87DYKJpFTUxxpysxdhQU4HZFma0pf1TsAOzPhfti0xydYN/T9frbr2hgsJY3VAW0to/npqNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FGPjsAtuJGsBWUU2sdzagAfn9WNOxXnDMlbchoHAy8=;
 b=B0cp9drrh5r7EqhfB5baTLD2aI8VpZC24U7OQB5aL+6EEwOi+STrRrVH/G3kOga1rnnqAb25czpZxfxnV5ApqYZhgRJFau9YFfCKhoT0HEIT+SSGNNXA+Ryj25LdvxgkrN6CZujVnxh9PTcykL9sJCjDUdOhRPJYG435VYdUzlE=
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
Subject: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Date: Tue, 14 Jul 2026 19:44:45 +0900
Message-ID: <20260714104445.919830-6-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714104445.919830-1-taka@valinux.co.jp>
References: <20260714104445.919830-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY6P286MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2cba72-2b26-448a-7a9c-08dee1951d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10070799003|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	W+hwTxp/Yp0hthsQoc8C/9Zr2SMMf2m6eync4c78YXCSbcZ3mLDFi02glrIIr+kEv0uezFl4KdCl7ULdWeQ5WzJZPyB+Z65VqnqIx5av8iuFb5p/xR/9Cc8Q8LJ+4Tv7g5ctllD3+70UIcPk4s+u59B4WzRNfvyqJvnFRMtiWquP9mb8NMVY9qQ5TBQXYaQTxbupkviagtKWrV3bVz5qdm/WgRTxxnvVPUcH8CtjSqZWDzPF2M/qZLd/BWD0jTGzY734uPl/UgII+LRbVpFdtYyDfJLLVFoCSpR7Ekutf/dC3A0/Ge9nz11NNZ1J5woxz7zoVcGjyNh47yoAY4BI+r1Ty/5oAg/2zktU7q7fh8iJRw+Roa1KpHaeNuIfbPKpeFtrqVyKlSoVKC9Ho0Z7tXr9pVkujzvvWLoCgKS6dNyJVBHiUnvdozJ0wqTq+Tr6R2ArZxd78+5YqhkLvSA+lP7+WkktiC5TqczscbDegPawZ1yF48/AkLneP1NOi5v1OB99tei1zsRY2uORhHn0enWti/WtRZrzswwEMgLLhS450K4EFkRdAsyYQ9bEWAlwUzhwMpRlcTeAhb9cJLJI8TXq60hdK2Sjy6lSddHyw4W8JFAjlOHeL/m2aXsEIZaz6yddaW8+WZd0Dr06xF1kyaMTQTfI2EcaSuvpeU4roQc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10070799003)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ycSqhgwFfRq316KzM8TGapYAfQRvrLfh4DjO+hwLKHDE0WQePIE79TTKEDIA?=
 =?us-ascii?Q?mhAuL+NS7AFWPSti62Y2lNAbFVpZTtksJfBmHd1hHhE5b1SlDcg0Z4AFQnsk?=
 =?us-ascii?Q?YoOvQ2aY0G4+aqj95q7Gv9kfF1ZaHmkMt8XshkVwzVp0OEZNHwvbqS47GwuZ?=
 =?us-ascii?Q?XYG2wU1R0d4IMS2Ixw1QLTDAmOe/ouEDhIWoqC6B+80DIB+QvIvPMVwxNtPX?=
 =?us-ascii?Q?xHGZ7RdZ+4ZzE+WXLAWtWRC8vbliU6YGMlbkWAyCXc/ggfhKQv1Ui35MZ4t2?=
 =?us-ascii?Q?h2nQzv321a1NbZllq9H8nLmFcl3MFDH9s2s8Vy85GX+YLxDuZKhGTnJ6KfYk?=
 =?us-ascii?Q?MPxhunoaOA+TRe5LZlUcRoXWOykNkbi35gZSNQWvJIbbDZRGdAC6T9UZV9Qu?=
 =?us-ascii?Q?gX9YcPixvDCDHwXwClRvb7FC76bXADeaQJkXrWMLJpk59X6JJE9hPKyVM4Sj?=
 =?us-ascii?Q?RhI8Us84hSvnoTMw49tRNKj5zU3WXCXOplUGlmHNP6e5katRQKMIJlSCpM/t?=
 =?us-ascii?Q?R2Iqgix+HfG9wj5ikG2XRS4VFYQaZZJPe+m2OTztGvBi+2cvwUUtURV2yit4?=
 =?us-ascii?Q?fJVnRjwK+SeKJwgIiI5rKp879UVHz1wzScCDhfBZZx1Ndkh9Hi3djvQrWQpx?=
 =?us-ascii?Q?A6W1lL6IhQ68USpo9Iy1oGcgpENTfA2+SwY4hpDpG5/kKlxCArtOP2uMiqHt?=
 =?us-ascii?Q?RlJOWkV2bTYhKF3o/82XKDFzmzhptbw/cF2rSX8sEAunWgync90rSpooC8lg?=
 =?us-ascii?Q?jW8R0R/wxWMRYYPBQSTaR/tcesmv+Dl6ATFMTYHjgvNJBn6YNO3lHQOQUdtU?=
 =?us-ascii?Q?CCPDKDw9MtpCu11doDM1ecUywjD0tDsBdRXwXWAlWutn3Jc0jAzpVdSPAgUv?=
 =?us-ascii?Q?XbN3KydVFGoOjnfx0ZbuODJGHPncGDwRu6zRs8d7cqLQgxOWKmBcCy6XLZLW?=
 =?us-ascii?Q?aCrZQvlbcBNxscmN1ogiIasVWgVBKyI8zuC3b84TJgGFmZKa1hNcF9FQNYMh?=
 =?us-ascii?Q?kVlhhrE7cnwBAs3J1yELKAFqeGNpVAbmqAWv04RquW2alrlx4c5lK6zaLokO?=
 =?us-ascii?Q?ZlD6NEEfmJg+L8146mI057+02ey/8D3dTjDxZh60T1IbLd0nY7kCcHRfub8+?=
 =?us-ascii?Q?JavqlH7BoXyursnxZ5ctd2TF4fySFGVXT/GjraJTnAmpsESdG0uK3ptB6Ov9?=
 =?us-ascii?Q?HpLGuoGpWRkheq7jwdIgmHbAH7eSyBFITXO9FuEsrh4FwKFlK2ov+SRQaau5?=
 =?us-ascii?Q?NuafO7urBHzWg+M8CW8CfJQrXW0wp0U7c1ZGEsj3QnMHH9CGJYYYCFHHvIpU?=
 =?us-ascii?Q?uvvCqKJoKaajvNTkO0EvxXNCDRUu1koQGGTH0RbiLwtqVDg81dPmP3F8d8uR?=
 =?us-ascii?Q?YZQi1hBq9ytxHPT2l3h9mw5DzwJdnBoFhJlCElwg5N0JhJFP5ZFYZ03DgZMK?=
 =?us-ascii?Q?yEDAffF978HJ6G1qqHbJMLB8nDCEhFjiLn0l9WapsdTnt51LSf9QIV/v0rDK?=
 =?us-ascii?Q?Ebw2DI53iCJMg4JPKyv5lpu6ZGpKfpDwZHCm3JFAcOcuJVu2zfjjUKi0LN59?=
 =?us-ascii?Q?VfGS4K7fgtARcxY/0mm81juC5IQn8ANCmLxzpddT6qxcmc0hD42d4fAgZhZd?=
 =?us-ascii?Q?Gow3W/RvJXInFlrJjgMihCMQIdYy/ulhVBbHFFObotmEcDkxWAA7XsGm7aNM?=
 =?us-ascii?Q?EhP2UCrTFNfLluz6WDcCBSMYuJlg456QNUWqgwOVhA3STMAXqMqvNTnnmYMj?=
 =?us-ascii?Q?KubV6TjbVKjZgis9uccBkjnQWWs4yI1F2BzJ0ZC4uHbhEBcdu+k0N4ynycl1?=
X-MS-Exchange-AntiSpam-MessageData-1: DGYL1lvnjHyx4A==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2cba72-2b26-448a-7a9c-08dee1951d4b
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:46:09.1591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgNiPIx/JQa9+OMAPM+xs+AfgzBASGI2OHixF2cnbSAzxK1dPL/I76y6QyCg7cIRog5sjAV1IkvDgUDxo772jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7347
X-purgate-ID: tlsNG-d62444/1784025972-BD146757-B00D8951/0/0
X-purgate-type: clean
X-purgate-size: 12747
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:from_mime,valinux.co.jp:mid,valinux.co.jp:email,valinux.co.jp:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: DCAD375389D

Parse the ACPI PPTT (Processor Properties Topology Table) to
initialize the CPU topology.

For ACPI 6.3 and later, the ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD flag
is checked to determine the presence of threading. For ACPI 6.2 and
earlier, CPUs are assumed not to support threading.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v6:
   * Handled cases where cluster info is missing upon reaching a physical
     package in the PPTT parser by assuming one cluster per socket.
   * Enforced an upper limit on the PPTT parsing loop iterations to prevent
     infinite loops on corrupted tables.
   * Treat the absence of a physical package node definition in PPTT as a
     parsing error.
   * Added explicit braces `{}` to nested `if` statements to clarify `else`
     scoping and maintain style symmetry.
   * Enforced an upper limit on the PPTT parsing loop iterations to prevent
     infinite loops on corrupted tables.
   * Treat the absence of a physical package node definition in PPTT as a
     parsing error.
   * Dynamically allocate the temporary data storage used during ACPI PPTT
     parsing.
   * Applied the `static` specifier to file-local data structures and functions.
   * Minimized the use of fixed-width `uint32_t` types, restricting its use only
     where strictly required by the 32-bit ACPI ID specification.
   * Declared `map_cpu_acpiid[]` as static and introduced the helper function
     `acpi_map_cpu_acpiid()` for managed access.
   * Renamed local variables to more intuitive names.
   * Simplified the implementation of `get_logical_id()`.
   * Refactored PPTT parsing to reduce type casting by using `container_of()`
     and switching from `char *` to `void *` pointers.
   * Removed redundant error checks.
   * Cleaned up unused variables and eliminated debug print statements.

 xen/arch/arm/acpi/boot.c        |   2 +
 xen/arch/arm/include/asm/acpi.h |   2 +
 xen/drivers/acpi/topology.c     | 251 ++++++++++++++++++++++++++++++--
 xen/include/xen/acpi.h          |   2 +
 4 files changed, 244 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 4ac0fd8f51..fc7ecb5749 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -85,6 +85,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
             return;
         }
         bootcpu_valid = true;
+        acpi_map_cpu_acpiid(0, processor->uid);
         return;
     }
 
@@ -119,6 +120,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 
     /* map the logical cpu id to cpu MPIDR */
     cpu_logical_map(enabled_cpus) = mpidr;
+    acpi_map_cpu_acpiid(enabled_cpus, processor->uid);
 
     enabled_cpus++;
 }
diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
index 13756dd341..b2e156e131 100644
--- a/xen/arch/arm/include/asm/acpi.h
+++ b/xen/arch/arm/include/asm/acpi.h
@@ -61,6 +61,8 @@ paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
     (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
      (entry)->header.length != ACPI_MADT_GICC_LENGTH)
 
+#define INVALID_ACPIID		(-1U)
+
 #ifdef CONFIG_ACPI
 extern bool acpi_disabled;
 /* Basic configuration for ACPI */
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 56fcfa4945..e6dea527a6 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -5,32 +5,257 @@
 #include <xen/cpumask.h>
 #include <xen/init.h>
 
+#define ACPI_PPTT_MAX_LEVELS 16
+
+static uint32_t __initdata map_cpu_acpiid[NR_CPUS] = {
+    [0 ... NR_CPUS - 1] = INVALID_ACPIID
+};
+
+/*
+ * The first argument `cpu` is the logical CPU ID assigned by Xen,
+ * and the second argument `acpi_id` is passed the `uid` field from
+ * the ACPI MADT Generic Interrupt subtable.
+ */
+void __init acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id)
+{
+    map_cpu_acpiid[cpu] = acpi_id;
+}
+
+static unsigned int __init get_logical_id(unsigned int key,
+                                          unsigned int *map,
+                                          unsigned int *count)
+{
+    unsigned int id;
+
+    for ( id = 0; id < *count; id++ )
+        if ( map[id] == key )
+            return id;
+
+    map[*count] = key;
+
+    return (*count)++;
+}
+
+static const struct acpi_pptt_processor *__init find_pptt_node(
+    const struct acpi_table_pptt *pptt, uint32_t acpi_id)
+{
+    const struct acpi_subtable_header *entry;
+    unsigned long table_end;
+    const void *ptr;
+
+    BUG_ON(!pptt);
+
+    table_end = (unsigned long)pptt + pptt->header.length;
+
+    ptr = pptt + 1;
+
+    while ( (unsigned long)ptr + sizeof(struct acpi_subtable_header)
+            <= table_end )
+    {
+        entry = ptr;
+
+        if ( entry->length == 0 )
+        {
+            printk(XENLOG_ERR
+                   "ACPI: PPTT has an invalid zero-length subtable.\n");
+            break;
+        }
+
+        if ( (unsigned long)ptr + entry->length > table_end )
+        {
+            printk(XENLOG_ERR
+                   "ACPI: PPTT subtable extends beyond table end.\n");
+            break;
+        }
+
+        if ( entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
+             entry->length >= sizeof(struct acpi_pptt_processor) )
+        {
+            const struct acpi_pptt_processor *proc =
+                container_of(entry, const struct acpi_pptt_processor, header);
+
+            if ( (proc->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) &&
+                 proc->acpi_processor_id == acpi_id )
+                return proc;
+        }
+
+        ptr += entry->length;
+    }
+
+    return NULL;
+}
+
 /*
- * TODO: Populate the topology information by scanning the ACPI
- *       PPTT (Processor Properties Topology Table).
+ * Populate the topology information by scanning the ACPI PPTT
+ * (Processor Properties Topology Table).
  */
 int __init acpi_init_cpu_topology(void)
 {
+    acpi_status status;
+    struct acpi_table_header *table_header;
+    const struct acpi_table_pptt *pptt;
+    unsigned int num_sockets = 0;
+    unsigned int num_clusters = 0;
+    unsigned int num_cores = 0;
+    unsigned int *socket_map = xmalloc_array(unsigned int, nr_cpu_ids);
+    unsigned int *cluster_map = xmalloc_array(unsigned int, nr_cpu_ids);
+    unsigned int *core_map = xmalloc_array(unsigned int, nr_cpu_ids);
     unsigned int cpu;
+    int ret = 0;
+
+    if ( !socket_map || !cluster_map || !core_map )
+    {
+        printk(XENLOG_ERR
+               "ACPI: Failed to allocate memory for topology parsing.\n");
+        ret = -ENOMEM;
+        goto out;
+    }
+
+    status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_header);
+    if ( ACPI_FAILURE(status) )
+    {
+        printk(XENLOG_WARNING
+               "ACPI: PPTT table not found. Topology fallback will be used.\n");
+        ret = -ENODEV;
+        goto out;
+    }
+
+    pptt = container_of(table_header, const struct acpi_table_pptt, header);
 
-    /*
-     * Generate temporary cpu topology information for now.
-     * It assumes that the cpu doesn't have SMT and all CPUs
-     * belong to the same socket.
-     */
     for_each_possible_cpu(cpu)
     {
+        uint32_t acpi_id = map_cpu_acpiid[cpu];
         struct cpu_topology *topo = &cpu_topology[cpu];
+        const struct acpi_pptt_processor *proc;
+        unsigned int level;
+        unsigned int core_group_key = 0;
+        unsigned int cluster_group_key = 0;
+        unsigned int socket_group_key = 0;
+        bool threading = false;
+
+        proc = find_pptt_node(pptt, acpi_id);
+        if ( !proc )
+        {
+            printk(XENLOG_WARNING
+                   "ACPI: No PPTT leaf node for CPU %u (ACPI ID 0x%u)\n",
+                   cpu, acpi_id);
+            ret = -ENOENT;
+            goto out;
+        }
+
+        /*
+         * Limit the maximum loop depth to prevent an infinite loop in case
+         * the PPTT is corrupted or contains cyclic references.
+         */
+        for ( level = 0; level < ACPI_PPTT_MAX_LEVELS; level++ )
+        {
+            const unsigned int offset = (const void *)proc - (const void *)pptt;
+
+            if ( proc->flags & ACPI_PPTT_PHYSICAL_PACKAGE )
+            {
+                socket_group_key = offset;
+
+                /*
+                 * If cluster/core info is absent upon reaching the physical
+                 * package, assume one cluster per socket and one core per
+                 * cluster.
+                 */
+                if ( cluster_group_key == 0 )
+                    cluster_group_key = socket_group_key;
+
+                if ( core_group_key == 0 )
+                    core_group_key = cluster_group_key;
+
+                break;
+            }
+            else if ( level == 0 )
+            {
+                /*
+                 * ACPI_PPTT_PROCESSOR_IS_THREAD is supported in PPTT
+                 * revision 2 and later. Assume no threading support when
+                 * PPTT revision is 1.
+                 */
+                if ( proc->flags & ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD )
+                    threading = true;
+                else
+                    core_group_key = offset;
+            }
+            else if ( level == 1 )
+            {
+                if ( threading )
+                    core_group_key = offset;
+                else
+                    cluster_group_key = offset;
+            }
+            else if ( level == 2 && threading )
+            {
+                cluster_group_key = offset;
+            }
+
+            if ( !proc->parent )
+                break;
 
-        topo->phys_core_id = cpu;
-        topo->num_siblings = 1;
+            proc = (const struct acpi_pptt_processor *)
+                   ((const void *)pptt + proc->parent);
+        }
 
-        cpumask_set_cpu(cpu, topo->thread_sibling);
-        cpumask_copy(topo->core_sibling, &cpu_possible_map);
-        cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
+        if ( socket_group_key == 0 )
+        {
+            printk(XENLOG_WARNING
+                   "ACPI: Could not reach the physical package node for CPU %u (ACPI ID 0x%u)\n",
+                   cpu, acpi_id);
+            ret = -ENOENT;
+            goto out;
+        }
+
+        topo->phys_socket_id =
+            get_logical_id(socket_group_key, socket_map, &num_sockets);
+        topo->phys_cluster_id =
+            get_logical_id(cluster_group_key, cluster_map, &num_clusters);
+        topo->phys_core_id =
+            get_logical_id(core_group_key, core_map, &num_cores);
     }
 
-    return 0;
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *topo = &cpu_topology[cpu];
+        unsigned int tcpu;
+
+        for_each_possible_cpu(tcpu)
+        {
+            struct cpu_topology *ttopo = &cpu_topology[tcpu];
+
+            if ( cpu > tcpu )
+                continue;
+
+            if ( topo->phys_core_id == ttopo->phys_core_id )
+            {
+                cpumask_set_cpu(tcpu, topo->thread_sibling);
+                cpumask_set_cpu(cpu, ttopo->thread_sibling);
+            }
+
+            if ( topo->phys_cluster_id == ttopo->phys_cluster_id )
+            {
+                cpumask_set_cpu(tcpu, topo->cluster_sibling);
+                cpumask_set_cpu(cpu, ttopo->cluster_sibling);
+            }
+
+            if ( topo->phys_socket_id == ttopo->phys_socket_id )
+            {
+                cpumask_set_cpu(tcpu, topo->core_sibling);
+                cpumask_set_cpu(cpu, ttopo->core_sibling);
+            }
+        }
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
+    }
+
+out:
+    xfree(socket_map);
+    xfree(cluster_map);
+    xfree(core_map);
+
+    return ret;
 }
 
 /*
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index cbb02e0f35..d2a1531893 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -137,10 +137,12 @@ static inline int acpi_boot_table_init(void)
 
 #ifdef CONFIG_ACPI_CPU_TOPOLOGY
 
+void acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id);
 int acpi_init_cpu_topology(void);
 
 #else /* CONFIG_ACPI_CPU_TOPOLOGY */
 
+static inline void acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id) {}
 static inline int acpi_init_cpu_topology(void)
 {
     return -EOPNOTSUPP;
-- 
2.43.0


