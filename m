Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3VDUGgxJMmp8yAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:13:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D611269714E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:13:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=k8+yJjm8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339816.1600899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkRi-00022R-2D; Wed, 17 Jun 2026 07:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339816.1600899; Wed, 17 Jun 2026 07:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkRh-0001x4-SD; Wed, 17 Jun 2026 07:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1339816;
 Wed, 17 Jun 2026 07:12:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wZkRf-0001uW-Gy
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 07:12:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZkRe-00CS1m-U0
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:12:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3248ce-5cb7-0a2a0a5109dd-0a2a4507bf88-16
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:12:18 +0200
Received: from [52.101.125.100]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3248cd-229c-0a2a45070019-34657d648175-4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:12:18 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OSCP286MB5166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:34e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 07:12:12 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 07:12:12 +0000
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
 b=CJlVI9k1zplGAEgqsyenMzkohm/Vsrbp5SxJPfA7pc/OIa/m4hkixaDANB4ccLc8D9SAHR5Q5myE2PZSaA+JqAqi45j1k4Mb4/WePjt5GHWeJCxLUROsDauJmAQ1nICj4r6otjYl+wy+jlfiyEiwkhoRbnGPOYz1cakJy1w0g0BZ20YMME3IaJgCmS2hpBkNzdJwHpP9l1gcfOdwkTi5EAhvd8ZfGp5kNYKW+Ji4IU0d/6jI7KQSIG/P81ZPbOZ88eGifiUBWPlZD7j2L3cb0zcp3Jm6qo3dlCD9sg3LOMPFPk8XqESwxc5kANv6R39NZzGHHHuxuOUHwQyVRaHu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQNIJ3HNju6pfXeVEfP0fYa15huEhISLLoeTKWjcdXA=;
 b=SfP1DPFqUqh4JwGQhiFKS5Ml7W8Lod8wYGI8UFCQM5MgCHXi7NPPc/QnN9OyT6AhwBg3wFSUXAw7h8DtcYvCbl3eXA+dR2uo79ig34bK11ZHbeDcIz4tF9HKb09gHV3I+RSawjie2nz+JvFFzYo5m8Vvwoxhi/pFf+sx3sSEF3DrUciha/RHJ2/RyaU0jMjIKSXeRa/mNDW3Zki/XssWvqSdsmkAfVrNMiOjQJ8wNGNke8w6Ir2mOkid1zuzINknkZ9qIkP/SkZLJU+2lSbzbtOa68M2rQCdfhfCRJtgKqYCEvph2BGY6ebwHFZwOcLLMyodeKW5JyAWCtSWfJpSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQNIJ3HNju6pfXeVEfP0fYa15huEhISLLoeTKWjcdXA=;
 b=k8+yJjm88/o+FB2QEapn8I/KxZxDNjZW75tkHabYzMUv0Vqg8R/CDwFNJHEGMadRPUf6hzxgZa45dEEPQDoStr7Jt/e7+kkjsvTtRUkW5ek20rvSHC+sHdG9eijA47bC7Q9wbiFFUeoethmRcXVs8iT1XfNP1aE0j2C4zqvhhaU=
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
Subject: [PATCH v2 1/3] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Wed, 17 Jun 2026 16:12:04 +0900
Message-ID: <20260617071206.265599-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617071206.265599-1-taka@valinux.co.jp>
References: <20260617071206.265599-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::13) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OSCP286MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: de198d34-e5b5-4f53-1752-08decc3fc0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|22082099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	BL531lkLfJ5E+XTWIdbS0A1yaSdTTpGem4pn1vq31UluWaqT8lyRb7N7AvOSbBy6Sz/GInG631GKsb5jzZZJDo61sNXuX87lS36KK+RWgbYwcKo/iBhByapVBjvjQt2uAEAhcyeazjO8KE3gAX+r0dqFhV/mAM3gx+574xE6tP5KuegtoTvowW5EMgncN3xTvQqvMV1dKKrt1m1iPoh4Uk230IeI415E6Ng/8xf1SvTgXT143/U9ALwxSDAGycczzxs/9bzeU5aNTsNYlqoF5T2SJFf5R0gr5zItZhCnpocDTORG2rsjCUOLsLh+BAb2LRl+Uj+WX0Zj2c/MCWnt3NLi0mchnReWPLoQTtwtoPMCYlZgVjZvg7jDO/ssI0tJwbHhpM5A7tEnqgx34ZJTvIlZXJvq+09xMbikpF0YmTf6HiZpJ0gNcmmJ6qLqwmF51cidt9Jo5+QsFDKD/ToZ4OxM7GRXNuPt/BnGj0zshdQ08bPv8P7ljlwqSjcbcRfGVSHEbLpkFXckilvMZBjBMjh9CzW2IQcrM/+TF8shMGVwwRAgPn0N1Y0uITb3yvIs2RXafgB8MfDF8cwHkHpIDwJRdWGOon3UbA42M6Bf63Ww1eNBGctLnhPF8BqLJp2AZlhS9DRsUgUef/tOWX6+3CcHj6rFCayXTR+mTKP57qJl5ko9qF6UA4/YqSf0/jN2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?APh2K2mVW3ju31ZIpnnXR1sbcqlbJ9ajm4ImAMdVE/orU4pclOK+W6CoCP8n?=
 =?us-ascii?Q?+oWFR45hoBBrFHdLjZiul1jRPudhJ1OHDNysF+MlTjofr1Uq5xawhrC5WLA2?=
 =?us-ascii?Q?XllWKQRPKcHaihweGq8kECA3kdNTUiK5DQ4dUmfmLj7uGtdp6CzIyt+k09hn?=
 =?us-ascii?Q?schpq0T5liy1Xi9ZrGmcdrpYHXATeTFDLqDq5E0lWnWXoLKqDtqcwpUXMDpg?=
 =?us-ascii?Q?/zGyewRnrI5T47EJSN9ouXmzsPKUczAx/bQKRxqVWmtBX5q1Dz0/vjTvhs9h?=
 =?us-ascii?Q?0pv4f/jwVEpdXv1z78IE/JaWZciGlCKqkjOae6ID3Ox56PuC+/w8h2nNAf5E?=
 =?us-ascii?Q?o2Wa3RwmF6bw6ikDlkLQDfA8KpoGifdby/G1DzKs0hdi+bUdM11aGZ9hdNbx?=
 =?us-ascii?Q?+pqI6UkTSiCaG7T926jjjW3bbtB4TjM/MqUgoo5lnrGKv/w2270wNwEudsz9?=
 =?us-ascii?Q?LIj0th5cWxzFysK3CTvUCYBKOu5z2Y6ao8QH5xU33i3mt1Ev6BMrogw13ebq?=
 =?us-ascii?Q?y4UyA9txNrBro10WIYDo/Z9NTDD2INvJ+dFb16t7Ft1H3SjckKWbizdnkxOZ?=
 =?us-ascii?Q?X0hKt8fsRIbNrK1JUBfpoAmNA51vWcXY07WiiELeEbhb2nYKa5pRvKkaxZJR?=
 =?us-ascii?Q?Tqs7N+OUTM4uzXMpw1Xkt+ngD23IpUSLIJgglcnfFB5rI+Simyx95JE/yuXv?=
 =?us-ascii?Q?AHYufkap5b2A16xQqj/3cPWDgGNLMHcLQIxeaak3cdfiWBU33oh9+MHNhiMZ?=
 =?us-ascii?Q?qQwry7mEHa19gW6yCwOAaZdwjo+jF2wbNNcEnw4YBT4zDeAW2fSBv52SCU82?=
 =?us-ascii?Q?+PU5aytgQWm6aRIZKipd847fAZwOCL1dgTWhftBOR1BfuVIoVhc+FTYIk83O?=
 =?us-ascii?Q?gT9I11WPm6/CdeCqcsqRtr11hN3AiWbKZocFdxLhn//Nf3wOyKJjJfCskrW0?=
 =?us-ascii?Q?hTjGPuZYaEGIVro0yt6EJ7rPKX6ISgXD7i4bDNUUMZbwBR0dmcYefytU3hbI?=
 =?us-ascii?Q?YLY/JmU5lyptpXivDL8dAfWTIP9cyBdB6xxICojRuctH5jIMXwurZ4p74nIn?=
 =?us-ascii?Q?TMTxaRJr2wFPUzmHxQITBiy+4gogbocQB26TdrzWZ92r9be4D2VVH/dRFcKl?=
 =?us-ascii?Q?yp132hgrojU/3QjLbswUcX0lyZKi3k8plTcGjhST4TtRAbBg4/rG0HDFB9/l?=
 =?us-ascii?Q?sHJij4fBcPOm6XetNmh72TAmwqYWExZ1bx/hL7h/+Z1/jU9KXJYEom2lCHxp?=
 =?us-ascii?Q?inusErJTEiPAEomUvL6F8OGVaeT7DhxW5bsAFP79gKlI7/tB+XDc+KMvZfy1?=
 =?us-ascii?Q?Z7t7/C2URAlmmcEBPUaBgi0RRpmJ/to+F5KuvNazRr3GXyzK7xuGcYwBqfvB?=
 =?us-ascii?Q?6QBt0wkbkrTxx19Sx3KwK2TKRZTkcpkpga8uwrqvNUi6QsEPIHpzL1TaigNO?=
 =?us-ascii?Q?vLM/wlS2BICDnfSJ1//VXQRRVVRdpJZo8eLkRO2t9oOOP8HXWRje1Mf1Hy6E?=
 =?us-ascii?Q?FgRoRaX8Qmcj4F5N2hddM7rtx91lVuy5gh5M2iNgwIUSb/A4fjxoWTq9lxFt?=
 =?us-ascii?Q?a3kJ4lEfzqaaj/cCIqoaFY86+ceKi6TGzsYgwUMBf6xaWQVSQIHFDS8oGLCN?=
 =?us-ascii?Q?7LQmjH2HvFqee0u8OENbIwJZ6gayz9aZ6RnR84xMdxEnLG0/UxtYPLxQ0Vic?=
 =?us-ascii?Q?khZnlFr3am93+GQZWJWT8FUFJa50dlh+rpoZYogVWp4OP1cpD0ZwkepRITW5?=
 =?us-ascii?Q?RtMj0MAHoYOikuCYXISYmM3RwJDtffy1n51tCAkpEzYa3zKHfdAY79NinAQB?=
X-MS-Exchange-AntiSpam-MessageData-1: u/CBG4NpxQ1E4A==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: de198d34-e5b5-4f53-1752-08decc3fc0f2
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:12:12.6359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mICsTuwZJBb5gpKWBHQjhJMawPDehAmaajAYj1XF6ypePPOvolsyB4hkC3dZs8ggXwbBvrzcyOqsGrO1f4o35A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5166
X-purgate-ID: tlsNG-ef75cf/1781680338-0AF76C48-509ED5E9/0/0
X-purgate-type: clean
X-purgate-size: 19114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D611269714E

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/Kconfig                  |  11 +
 xen/arch/arm/smpboot.c                |   5 +
 xen/common/Kconfig                    |   8 +
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  30 +++
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 343 ++++++++++++++++++++++++++
 xen/drivers/acpi/Kconfig              |   3 +
 xen/drivers/acpi/Makefile             |   2 +
 xen/drivers/acpi/topology.c           |  38 +++
 xen/include/xen/acpi.h                |   4 +
 xen/include/xen/cpu-topology.h        |  36 +++
 xen/include/xen/dt-cpu-topology.h     |  30 +++
 13 files changed, 512 insertions(+)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5fa89fcb24..36574e0ce8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -101,6 +101,17 @@ endchoice
 
 source "arch/Kconfig"
 
+config ARM_CPU_TOPOLOGY
+	bool "CPU topology support (UNSUPPORTED)" if UNSUPPORTED
+	select CPU_TOPOLOGY
+	help
+	  Retrieve CPU topology information from the device tree or
+	  ACPI PPTT (Processor Properties Topology Table) to optimize
+	  virtual CPU scheduling.
+
+	  Note: Implementation for parsing CPU topology from the ACPI PPTT
+	  is currently missing and will be added in the future.
+
 config ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM_64 && ARM_EFI
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..fb2cf26424 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -24,6 +24,7 @@
 #include <xen/warning.h>
 #include <xen/irq.h>
 #include <xen/console.h>
+#include <xen/cpu-topology.h>
 #include <asm/cpuerrata.h>
 #include <asm/gic.h>
 #include <asm/procinfo.h>
@@ -242,6 +243,8 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+        map_cpuid_to_node(i, cpu); /* pass the info to dt_init_cpu_topology() */
     }
 
     if ( !bootcpu_valid )
@@ -279,6 +282,8 @@ void __init smp_init_cpus(void)
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
index 0000000000..edf47445ac
--- /dev/null
+++ b/xen/common/cpu-topology.c
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/cpumask.h>
+#include <xen/cpu-topology.h>
+#include <xen/init.h>
+#include <xen/acpi.h>
+
+void __init init_cpu_topology(void)
+{
+    const unsigned int nr_cpus = cpumask_last(&cpu_possible_map) + 1U;
+
+    cpu_topology = xzalloc_array(struct cpu_topology, nr_cpus);
+    if ( !cpu_topology )
+        panic("Failed to allocate memory for cpu_topology array\n");
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
index 0000000000..af8417b478
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,343 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
+ * Parse cpu topology information.
+ */
+
+#include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/cpu-topology.h>
+#include <xen/numa.h>
+#include <xen/errno.h>
+#include <xen/init.h>
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
+    [0 ... NR_CPUS-1] = {invalid_topo_id, invalid_topo_id, invalid_topo_id, 0U}
+};
+static struct dt_device_node * __initdata dt_cpu_table[NR_CPUS];
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
+        cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+        if ( cpuid_map->cluster_id != map->cluster_id )
+            continue;
+
+        if ( cpuid_map->cluster_id != invalid_topo_id )
+        {
+            cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
+            cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
+        }
+
+        if ( cpuid_map->core_id != map->core_id )
+            continue;
+
+        cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+    }
+}
+
+static struct dt_device_node * __init dt_find_child_node_by_name(struct dt_device_node *from, const char *name)
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
+void __init map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node)
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
+                unsigned int package_id, unsigned int cluster_id,
+                unsigned int core_id)
+{
+    char name[20];
+    bool leaf = true;
+    unsigned int i = 0U;
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
+        cpu_map[cpu].thread_id = 0U;
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
+                unsigned int package_id, unsigned int cluster_id,
+                unsigned int depth)
+{
+    char name[20];
+    bool leaf = true;
+    bool has_cores = false;
+    unsigned int core_id = 0U;
+    unsigned int i;
+    int ret;
+
+    /*
+     * First check for child clusters; we currently ignore any
+     * information about the nesting of clusters and present the
+     * scheduler with a flat list of them.
+     */
+    i = 0U;
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
+        ret = parse_cluster(c, package_id, i, depth + 1U);
+        if ( depth > 0U )
+            printk(XENLOG_WARNING "WARNING: Topology for clusters of clusters not yet supported\n");
+        if ( ret != 0 )
+            return ret;
+        i++;
+    } while ( true );
+
+    /* Now check for cores */
+    i = 0U;
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
+        if ( depth == 0U )
+        {
+            printk(XENLOG_ERR "ERROR: %pOF: cpu-map children should be clusters\n", c);
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
+    unsigned int package_id = 0U;
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
+        ret = parse_cluster(c, package_id, invalid_topo_id, 0U);
+        if ( ret != 0 )
+            return ret;
+
+        package_id++;
+    } while ( true );
+
+    if ( !has_socket )
+        ret = parse_cluster(socket, 0U, invalid_topo_id, 0U);
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
+    unsigned int clid = 0U;
+    unsigned int pkgid = 0U;
+
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_map *map = &cpu_map[cpu];
+
+        map->package_id = cpu_to_node(cpu);
+        if ( map->package_id != pkgid )
+        {
+            pkgid = map->package_id;
+            clid = 0U;
+        }
+        map->cluster_id = clid++;
+        map->core_id = 0U;
+        map->thread_id = 0U;
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
index 0000000000..7a7042c84e
--- /dev/null
+++ b/xen/drivers/acpi/topology.c
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/cpumask.h>
+#include <xen/cpu-topology.h>
+#include <xen/init.h>
+#include <xen/acpi.h>
+
+/*
+ * ToDo: Populate the topology information by scanning the ACPI
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
+        cpumask_set_cpu(cpu, &topo->thread_sibling);
+        cpumask_copy(&topo->core_sibling, &cpu_possible_map);
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
index 2fdf38cf74..3aa4edd20f 100644
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
@@ -133,6 +135,8 @@ static inline int acpi_boot_table_init(void)
 	return 0;
 }
 
+static inline void acpi_init_cpu_topology(void) {}
+
 #endif 	/*!CONFIG_ACPI*/
 
 int get_cpu_id(u32 acpi_id);
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
new file mode 100644
index 0000000000..896eefb04f
--- /dev/null
+++ b/xen/include/xen/cpu-topology.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#include <xen/types.h>
+#include <xen/dt-cpu-topology.h>
+
+struct cpu_topology {
+    cpumask_t thread_sibling;
+    cpumask_t core_sibling;
+    cpumask_t cluster_sibling;
+};
+
+
+#ifdef CONFIG_CPU_TOPOLOGY
+
+extern struct cpu_topology *cpu_topology;
+void init_cpu_topology(void);
+
+#else /* CONFIG_CPU_TOPOLOGY */
+
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
index 0000000000..334a3181f9
--- /dev/null
+++ b/xen/include/xen/dt-cpu-topology.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DT_CPU_TOPOLOGY_H
+#define XEN_DT_CPU_TOPOLOGY_H
+
+#include <xen/types.h>
+#include <xen/device_tree.h>
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+
+void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node);
+void dt_init_cpu_topology(void);
+
+#else /* CONFIG_DT_CPU_TOPOLOGY */
+
+static inline void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node) {}
+static inline void dt_init_cpu_topology(void) {}
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


