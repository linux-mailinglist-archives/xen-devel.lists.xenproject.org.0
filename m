Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u5kxGer0NGoDlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064C6A4703
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=D8LhMyw1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341738.1602065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzm-0005mC-Sn; Fri, 19 Jun 2026 07:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341738.1602065; Fri, 19 Jun 2026 07:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzm-0005jp-LA; Fri, 19 Jun 2026 07:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1341738;
 Fri, 19 Jun 2026 07:50:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzk-0005QJ-DP
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzj-00Dxzh-E8
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4c7-e002-0a2a0a5209dd-0a2a450bbb74-0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:31 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-10
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:31 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:27 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:27 +0000
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
 b=l0yb9n/Kp5rGXqbi3H0XmKpfqaNAIpnzfs8rtjgsLYW69P4s6ABq4TuUaFFLWnU+CTZGTEQdx7qY8Ghdq2yVC2Ii33JLK/lShk1LxTOcbYMJiIYJDcoCsuOBDBU2nUxNCnRSeEBo5OD9PGE4CsNjJHURPDi0hdKw0km1cWNkeV0oget0VUc+5GJfP2ARNtyXRx54N1xFevgPoBBZnB8OPX16iErLR06qCbVu5nvF8sRMK1rYmUeLk3WXU/vaSLrBf2t2mF/vefWSeoU8Rfob1wHadx/zwOotKBYZ6cg4U9/2pKOgK/r9cD/3s6uKmniAeUSiK15YnnD6OCi4Hdev7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZ/ulHGw1zKNLUxS/O7t+QzypijmScIl9LlYi5MPJCs=;
 b=DjAhnrkOEJdlo7ImdlvRblDktXA4W5cFbY/M5Uq5blVPTKR9Ig3aONc182EiOts9drDoH/e7S8hRmslHJ6C3UI3FhwHlCUEtOazcmyOTYQ2zPFimq/HPNwllRtztJVvsuZ612ZYBbdhRns2ouqm3b1RTuFhWDlLGQxWshVmhAO1iviGhFCNqwCqm26p8wh5IaUahwMdH2mzGyGl8ZQRprmihg/PprCkA1RIqZ6XsmvOWJWq7bZ42/sSpMD1BWnyxtJ1/v4C/jirqdUMInYW+i08biOIpKybT/eL4ZcAFc+8r5HmUHUUSnr+bbO7N+N2/2vtp2YxhI/YLfg1VpDUTwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ/ulHGw1zKNLUxS/O7t+QzypijmScIl9LlYi5MPJCs=;
 b=D8LhMyw1cKKXCzLhuZDwbz+5CBFyceg4Eu3ImfWWMgFrJwrig5DQZufAMM0yN6TTi+VRoXw8Ba06b8Y80jc4oKWzcThX/Usd8PrjWwMYVk0eOIE7JgkdVcl1S3fsis6oNplDu1R9DPDerzJXm5VJnvq4X8a7eecMDys799S/9cA=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 08/22] xen/common: Allow building ARM32 Xen with CONFIG_NUMA
Date: Fri, 19 Jun 2026 16:49:56 +0900
Message-ID: <20260619075011.377116-9-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: daf3a842-c9e2-42cc-f79d-08decdd76dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+yo7k5n1EIb9ygkAs7dbh8WpeAiGE8scckbbXq0yPSECFSojrL42xx8RJwin+Ovxqu/+33baBRG4EYk4RMzNVXP9fiIoDmxMHSuuoGONpg38T26PYqzWH6CYQgyNS1RvYo9UOJDHPNvcizxzMboyTUpRMjc7fuxAaFh65oBOhvMwOleJO4Nt+ucSwT2H+zESv/EVttSnsdzLficIW4ZTB9LOy+2oeOqyjVO/Z5X+J2/48pb4iC6Xlrp775nVectqLjzmpd0j12Ky0Li9FyBFmMBT4Hi6ECesr1Zli3myZPYgGQhhUorNdi3eFAnxwc5Q7BWB6LcuLyvq/2+yXz1XK9LAd9mQCXlQBJT/2xRCbctBhKUxxPPYS2HYOmG+wvrk5l8fw9i0gN2NZ6tIVHdNcwsEdDhosEdLc6f3TmMHzkQkpMusVUAf5ZSPbGIQ4+EJDemyFc5qF5w9oUcZFrsOP3mjBZxD27OjpmU6gO0278Tlj8FY52nHwF+a5pMcrgk4Wp4xRD0rxrikI889dSzJ/gIBdXIgB1q9GvgTlvl3GnZNdM20E6wvIkraPpy0Qt+CtF5eesQEwoTTTmWrRyvC+zIqZZxFXr6YBnwsPuDdJjHpsfHyGuWxTTlctwnyL/5HAhQq7C9sHg3twnDkR3UXnB1P0gCSgsF8K8rYe6pBuQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P8oTukbM1h2LcEFzN+FlYiritY7p6Lt5dRx5iXq0I1HTHbcu9aYaZkmQ/Jud?=
 =?us-ascii?Q?a3cCeE9lushCM1yHHMuOffPAY0aPajJ7j7NQrQ6c1fvUSGzsIMnwHqgyzmjS?=
 =?us-ascii?Q?h3ZHviqD4EFMFdZATw+kTXUb1tYEPnQZXzfavph0SOqRt/ELZQX3vsXooHRO?=
 =?us-ascii?Q?khaNN6mHEOrG3Y3uxNT7WH2W1OAlY02KP+GOiowBVJbBAVVzUMTroYfnMV1d?=
 =?us-ascii?Q?XWF/gdn1bdz8D2/DHMZoqFLxNidMVFoMvREekhr94YD0mgYcIz9HZM0HpzQ0?=
 =?us-ascii?Q?TM9n5u2YbcNSYV8zUD+vunpSd2ck1CkUUJTDBtbfZykyDxS1yq7yPBtvzVUT?=
 =?us-ascii?Q?89yJlYA8/e8o7V3mA17HHet4oadTXed55N8hr1Bv6xZA/EvCxXhL8UsusYtt?=
 =?us-ascii?Q?ODfDMstjEZH8B4Bhfmng+8ktmhkGJEuXAezBZXHGWO4A14Jl38oZI6zK/+9c?=
 =?us-ascii?Q?svZRXFd/DKHpO02hZf5urQmiw6rLieJwZ6mahK3e5q7XAJls3kg3MNiC1Ytg?=
 =?us-ascii?Q?zvzkLY0U2NuIhD1scJhxAgelcP4dJLldyjWnQ5BV+K4ElxHFJ0SaCirIcBtN?=
 =?us-ascii?Q?qFS+NYU0Z3xn70KeBjV417NG7BjdVo0y9gWkqDQ0xeU6BTlHoemWAqOgctDb?=
 =?us-ascii?Q?ILFPEVslcVIP9DmEPPyRAIVQITSGeevEY1ZPIs/etAh6gN7Bxk8V8ThTHqqf?=
 =?us-ascii?Q?nFcqR6y9MsnjNEFDsVXJ2Z06A5uRRfWPLIBZMatyC+7iR6nGFljkQYLysvsW?=
 =?us-ascii?Q?ZGYLjJ1OSWohl10JPXymk0yi1xrbO57QssdwaI9jt5KqpRRKO4E90AQ6Msyc?=
 =?us-ascii?Q?Saa2XbdC9QzJE8KFw4V0EHT7c8uUy0ob1sKeTtON5NT3t0FeqAa/xR5SlAS1?=
 =?us-ascii?Q?55QHhuz1uYlQJFzCnBmYk+sRW0pDTGj4XcgM5/FOfh9z8j3A0HgLj3OjPKQ0?=
 =?us-ascii?Q?ja0M6xM12suoHfbBePhHz5E6rxh/6ltTjKsqX98lKAU2BtlbanDySPlNBFmF?=
 =?us-ascii?Q?Ht96FkHoFE8t4oNLZquKwZi0q0QmyEZHZHW9vl3prUJo4/8D3vxwP0ewMq0S?=
 =?us-ascii?Q?iKBdRpw1/KGqZAdirM6F+UKyjY423IGd8yqyqKOBfsVutWQ52cUzUxkqxD6O?=
 =?us-ascii?Q?a0+0tN0Jp3Tizn6+ktqglL5/W+Co5k9C+ANam9b+Bog/Go6biZPMJNoAFWg1?=
 =?us-ascii?Q?Z7PPbXgtqQ92lgEO0WPJpJV5IZOgX2VsyAAsOctXA65H98lIIvgwFvZMuOHX?=
 =?us-ascii?Q?r+TDHBi/F+lRlOXJxQY7opU6Pz4AxsQO5goupCm888lvDiMFR1fXBO7xYKl7?=
 =?us-ascii?Q?Bfyw61Jgf3abslU9n6Ldh5kqOhxMaPpQfnvQSvjec+iYNfFPc/2kQQP2OBqb?=
 =?us-ascii?Q?rlGjQNVRPW6OTPbsHW+/3H+dgt1t9vOwE5lrOW4RBrrJ4GM/R22NULRF/Y24?=
 =?us-ascii?Q?KG+GuuRNy+HMkBw2S3fWKSG1lb9sSwlsJCSnr45GewvMX+P9s091XPDxPW8C?=
 =?us-ascii?Q?Un6Pz9z3r9KWyJYc7EtUlAm2P2FVY5wC9vQRaKTEd/aCQylX1nZ7nGKsyCiD?=
 =?us-ascii?Q?JdE75EyYWEHBUlfYxeGz+osfiSKUPHhGw4mI8LsDbVUK+XL+YYQnJJ0NY89R?=
 =?us-ascii?Q?FPND+qqeOVs2MmPk4OQLlogjhGGlZHmWtKhUZkdYWrZVVT8o2OfF3YryxyMf?=
 =?us-ascii?Q?ERcsN9Fnn9xarju516tB6S5CCuK8WXiQCW+U2asGxBKeZ4T64LCKFeMqxmJP?=
 =?us-ascii?Q?sNV/FWLFHYtdNFwfsdPEnq82PWUvz2nx+f4M5RvpS83vnOJnRkUAikrPdOMd?=
X-MS-Exchange-AntiSpam-MessageData-1: DFOGMa3OOo1vsA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: daf3a842-c9e2-42cc-f79d-08decdd76dd4
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:27.8646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SBD0MlSTUMLcj+ZAogRTCbJaYuSHj4skllPK41vVXa06qfjVx3PTqZsXpQhwChNB6hTYDOIIC7rxMxzGjfcpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855431-4C9F600E-F50E4847/0/0
X-purgate-type: clean
X-purgate-size: 823
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8064C6A4703

Allow ARM32 Xen to be built with NUMA configurations.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/common/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/numa.c b/xen/common/numa.c
index 92f8f1cedc..9f53a2602e 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -439,7 +439,7 @@ static int __init allocate_cachealigned_memnodemap(void)
     if ( !memnodemap )
         panic("Unable to map the NUMA node map. Retry with numa=off");
     size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %"PRIpaddr" - %"PRIpaddr"\n",
            mfn_to_maddr(mfn), mfn_to_maddr(mfn) + size);
     memnodemapsize = size / sizeof(*memnodemap);
 
-- 
2.43.0


