Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 15NVFO30NGoXlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99436A473B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=b0jsvPF2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341735.1602033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzh-0004tR-Rv; Fri, 19 Jun 2026 07:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341735.1602033; Fri, 19 Jun 2026 07:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzh-0004p2-OF; Fri, 19 Jun 2026 07:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1341735;
 Fri, 19 Jun 2026 07:50:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzg-0004dJ-O8
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzg-001qMv-4g
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b5-2eae-0a2a0a5409dd-0a2a450bb90e-42
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:28 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-7
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:27 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:24 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:22 +0000
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
 b=JAJ5ezR6R993BtavfqpOJsaYtBwrpfDjw3Jmu2ziOARBS6SQV6+r+3iKJvr9jsciCn5JGKywC7u28/+TTFlg0FCbvJNqYlxXshoTmyJjwETRrqe1ae5JsTrZfQjg3zrql3lUrcpb7rYN5RduK3UjEeIafdj3+vCOLDMT8b0ZiOFqU/pm944eZ3cLNLA9H4mcsocD48mimeuhDpasrV44OgbiO5Vt/hSA3fLjFG3Z3AoJ2fNACWIrDa0ZF5mO2HQlKntfFEg58J0EA1kl5LrtN6ZoiAtd9HgrKkbdOdBebaSinUbloPva4g40zb85VYgVrEwVIJwvxVme+oNZziJYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKjclw5V9jrzqLrNd1iwHbNMgBC1nxy9z/dSq/sUNcg=;
 b=NJbqVSYYjnaaHwZUa3qf+AYwYy0lfOFDs4KHK/a2rE/IKLgKo997Zh09eoAf0SNsYSQpv6uepfwT1YNpwxVxaNaFS6hspM1NiqS4o7X+q5Z4+p0hU4a2WjHfT7wHll8Emv4xbm84D9km/3NxiEftHBrZrot5auNGLPJ8lwF+BtUNAciHmRW75aR9KXLtkGhJ4FZMKyOX9VJ20W7e+LYcJAzqDDH8792b3Msum4KHUJhqX6kBLS0Y4paxelz2/oDIXjDtGnH1zz5wneb3FbUzC/KDttttololJR3pZkfMT91jq05oT/bY64tv0uYcE3V0alFkxCXwSJhOfnf2AzawyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKjclw5V9jrzqLrNd1iwHbNMgBC1nxy9z/dSq/sUNcg=;
 b=b0jsvPF2eDwjAGIt8s/tFTLzZ2qlEgfG1BSvSqA3jI3S0spYTF5NOsxFNCZccDCJmss0dscZo2J5Dlc0UVe16xF+r+XnZOhOGIUKHWuHfn8KDc1fSjIAiHiUf1LuOc6xRxCrY0ivFnhoHvwsb3NfCOHKwAJo7LFcEN7p30koC+w=
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
Subject: [PATCH v3 05/22] xen/arm: Configure NUMA affinity for populated memory banks
Date: Fri, 19 Jun 2026 16:49:53 +0900
Message-ID: <20260619075011.377116-6-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::6) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 27afa028-b642-4190-748d-08decdd76ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|10070799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mPAA7+8bOgRvwk8H8LS+FAghOBE5VOjdZer2ezchiz8AsTYjMVyXv9GTSpVfLSy9t3aZOrom1ZghvnDin/mVqO6ZYR00aIvMc2Cp+w1cwYsylHrMDBt5hDSO3VgE1dYDlUSZ8POq17M+OR5xGfiZKe1Zx6EIsrz5qp4yw7RiCh7ZEXyZDNHKd7otIb/iWlkmMd4Nxe0vcxMyd+Dy21y4HYXfhlVtz7wxF0C/8Hv4oJ7R0CH4Il8LHwOggfQ6DvWyunuhWjnrImvUE21kskGud5hoMvQLY69l6FaWYKDWKj/oHNlBgB+BqlP3ptw8mBotNzpTNJGsyrx+nAau+/ejK2P5nVMfZ8jiukuMb/mYkQQp2nV7s1zQdfsP5oi14Sx3DIwz2RWeWqL1Lgd+F78TE2ewtHX89Pdkyv13J0Jkw4wLPP+0cL9SjQbDpGieZHLmNRKDLeU2BBKpcRd4y6cNKP5JjvekWDJ/lq04tqaaVaDVQILx83/ccRbvjUfM3f77w6H7jWBmevTZkskdKMU5zgNkPdfoOIcehsKRQeza9bjBhVWp40aiCaH+7dJZSzK1jIxDoM6jBbb/ONqvNVDtl+0pvzAGzyS/aKQSsBAcncQomlJ5va4YbxO5IHGNVHjijqmEQYNEHwTHNlwZyzoJ6aOoGZ4NvY0XfhzgDpOzW9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?38BQWlay/at7UvB4B9U8XaIHuofqvry7V3TVhOcGMlULoTEBhA5hgocGZPEA?=
 =?us-ascii?Q?MN29dVP2A/WLyg1cdWgxNI0uclHx7rpvAq8RSBSu1RCIkqF9MACRs/y9ALZE?=
 =?us-ascii?Q?vaJoozfTrLJnWDgxI9GEUc/jB55z1RH0mKF4Z5q8bisaASI2nfom+4U6U3Xx?=
 =?us-ascii?Q?FGsb0Ia/JWn6sSgBzrngq6R9z+J5uMGxrmdXE3V8gjFMqrQFUngzfOSv10Ny?=
 =?us-ascii?Q?kOyDsbK5mlv7PHPbuR7PfCi1n1OhP4mSv2g/zkQIUr+/wwAvpU1o8VrWIyRb?=
 =?us-ascii?Q?lZ+O7NE1WO/zunFnrBI9Gj94FOivZbFpC+Zx9gaPyK2ZI4iB++MCkjRZtoup?=
 =?us-ascii?Q?cF/1yiIzrQvruurnTOS1yfElApOrbdRzD20j9q0vgVjvdSbertkqej7fQs/N?=
 =?us-ascii?Q?mxL6s6r3IXJJFTdhtV3TtG3YTep5njqIDx79y/7AYleZQEVPub1rhsH7s4Mw?=
 =?us-ascii?Q?38bX0LZ8H0d0FOXrXkyYO092FUEtisjhk5mdIEfdDD9cEJhyLEj5mIaOuB5q?=
 =?us-ascii?Q?aOE3kzVPs8dNiUYHANncxgLspE8yxkWxYSryjREVwjAFeBN5eFIqAsYdEFGX?=
 =?us-ascii?Q?BJVx5XHpCXsivpMa7MA5FBCHT4aJ1+604SPBqFcpmbut1B5g+M4RR8EKfN36?=
 =?us-ascii?Q?iweGk3zKNLya9PBw+WC3ktDQa35iytTH2fai3+m8gazP90q5vYNY2kOb3m3P?=
 =?us-ascii?Q?3v75NsIl7jID5+SZWCeHSg2QaosVlVCJ5+iQPPNtRL2qR78FQ3JzON/BFo9i?=
 =?us-ascii?Q?a3Rcu8bFEOFMzinFqbpGn7nynQoK53C9UBqxWKiwbrZSYEDmSPB/G4geq9OV?=
 =?us-ascii?Q?hfKTU6K2yQxepFFr9mnFUxzqfmFurmHwlqGd7QYhPkwQVbYZDxpPgG3hfN/P?=
 =?us-ascii?Q?37sA+4xCrs9iSg0bGPDPFzxpw8J94b55AJzb7exMs6BwM+H33C8YfCxhdAYB?=
 =?us-ascii?Q?23PBWA0e5XA/9oawY79UaRCysaN2KRolW4IsIf6mcNCgyAacM7GPM/BNuM5q?=
 =?us-ascii?Q?pTRpFbL6Nn1HgXEYYj8MQHRSbWO0IvM7uvPmiTIshKf36szaUT/Ndg5+X3Rc?=
 =?us-ascii?Q?74KBPIh2I2Ggnt0pEN7tXbgwCFrTWc5wqf9ckWsYwPC+2EFts0RHyVnFe9zb?=
 =?us-ascii?Q?GtWP1EPvg0xkH6Z6jpNpFwLQ9SbLV0lcXV4xRAzxhegUbYfKNoww7XaV3GuP?=
 =?us-ascii?Q?4W57OWivA+mHszn0R12DC0S6bAEue1VrQe/WzLdKFiPGnloJ8J/yF/eUH36b?=
 =?us-ascii?Q?SKFMmFxbuCZjtHFmg4kUFmmg9Ea4KyhguhCoGy43jh6H9HCt6FNb3v3AsPoc?=
 =?us-ascii?Q?DCi+XR/+gNbsec8ZCewdZ4npAgzlZtKaw+FZHFLUin/WwChEE+e07f1ot1LU?=
 =?us-ascii?Q?JOwCLhyvbyLARg/zCMO0NJwvdRyjNVz32QH1P7W4SwhxXdSABYxe5/vmC1Tn?=
 =?us-ascii?Q?E9ra66eKT1rNIOEHIFg0151sjv40lZv5UmiV6mFmjEDyaERHstsIG4YYP6eg?=
 =?us-ascii?Q?G4v4h7SJvu1mPz0jjWxHPvyMBXbL1KzwllYmYfgDSsRop4Llm0p0t6P/owCj?=
 =?us-ascii?Q?Ys5/SJUekrek5Wt61DQTNxZOWlUVhkyZK3fTXSYcHXV1PTDH1Dovka+SDuvf?=
 =?us-ascii?Q?gFd94BuE6kgcHZlteOGLVuPZ5EG9YC9tKp0sI8sX3yEM6pP95peaUFMEXAWU?=
 =?us-ascii?Q?pBEEzI1m39awzXX/KBXelEMSuB9iwBNYZlU7Ma6RMDrhGvPsn1A5hSAJf9P/?=
 =?us-ascii?Q?cQ0vLhy+otibH5eY+h1qKj6STgr7ggcTgbnankqt4pUJUDZRJu7kI7UcanqF?=
X-MS-Exchange-AntiSpam-MessageData-1: h9bd7CtT7U6H0Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 27afa028-b642-4190-748d-08decdd76ad0
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:22.7830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91PqexfN6Uh/YfupaNUABCr+C2i/dJXgJkAhq+C+4z/KjeSPagOBo6BCQcvHvNzORLcrEooZ5jh1bVaA+pldyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855428-4C5F400E-E5F98E8C/0/0
X-purgate-type: clean
X-purgate-size: 6920
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
X-Rspamd-Queue-Id: D99436A473B

Configure NUMA affinity for the populated memory banks. The NUMA
node ID for each memory bank is retrieved from the Device Tree.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/include/asm/numa.h       |  1 +
 xen/arch/arm/numa.c                   |  7 +++++++
 xen/arch/arm/setup.c                  |  2 +-
 xen/common/device-tree/Makefile       |  1 +
 xen/common/device-tree/bootinfo-fdt.c |  8 ++++++++
 xen/common/device-tree/numa.c         | 29 +++++++++++++++++++++++++++
 xen/include/xen/bootinfo.h            | 25 +++++++++++++++++++++++
 xen/include/xen/dt-numa.h             |  6 ++++++
 8 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/device-tree/numa.c

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 8c46048ac8..d9fc1ce553 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -13,6 +13,7 @@ typedef uint8_t nodeid_t;
 extern bool numa_disabled(void);
 extern unsigned int numa_node_to_arch_nid(nodeid_t n);
 extern uint8_t __node_distance(nodeid_t a, nodeid_t b);
+extern void numa_memory_affinity_init(void);
 
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 1fddf7d15b..b441af1111 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -33,6 +33,13 @@ int __init arch_numa_setup(const char *opt)
     return 0;
 }
 
+void __init numa_memory_affinity_init(void)
+{
+    dt_numa_memory_affinity_init();
+
+    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+}
+
 int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
 {
     return bootinfo_get_ram_range(idx, start, end);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c0202d9ff6..cdabf536b0 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -352,7 +352,7 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     acpi_boot_table_init();
 
 #ifdef CONFIG_NUMA
-    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+    numa_memory_affinity_init();
 #endif /* CONFIG_NUMA */
 
     end_boot_allocator();
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 9036e455d6..658aa293c4 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
+obj-$(CONFIG_DEVICE_TREE_NUMA) += numa.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index 272b5a6c0a..2d0e809231 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -121,6 +121,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     const __be32 *cell;
     u32 reg_cells = address_cells + size_cells;
     paddr_t start, size;
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    uint32_t nid;
+#endif /* CONFIG_DEVICE_TREE_NUMA */
 
     if ( !device_tree_node_is_available(fdt, node) )
         return 0;
@@ -136,6 +139,10 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     if ( !prop )
         return -ENOENT;
 
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", 0U);
+#endif /* CONFIG_DEVICE_TREE_NUMA */
+
     cell = (const __be32 *)prop->data;
     banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
 
@@ -158,6 +165,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
         mem->bank[mem->nr_banks].type = type;
+        set_numa_nodeid(&mem->bank[mem->nr_banks], nid);
         mem->nr_banks++;
     }
 
diff --git a/xen/common/device-tree/numa.c b/xen/common/device-tree/numa.c
new file mode 100644
index 0000000000..ff5a7dee9a
--- /dev/null
+++ b/xen/common/device-tree/numa.c
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * Initialize memory affinity by registering bootinfo memory banks into Xen's
+ * NUMA subsystem.
+ */
+void __init dt_numa_memory_affinity_init(void)
+{
+    const struct membanks *mem = bootinfo_get_mem();
+    unsigned int bank;
+    nodeid_t nid;
+
+    numa_fw_nid_name = "DT";
+
+    for ( bank = 0U ; bank < mem->nr_banks; bank++ )
+    {
+        nid = get_numa_nodeid(&mem->bank[bank]);
+
+        if ( numa_memblks_available() )
+            numa_update_node_memblks(nid, nid, mem->bank[bank].start, mem->bank[bank].size, false);
+        else
+        {
+            dprintk(XENLOG_WARNING,
+                "Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
+            numa_fw_bad();
+            break;
+        }
+    }
+}
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index ca675db5ce..ab40b5cd5b 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -7,6 +7,7 @@
 #include <xen/macros.h>
 #include <xen/xmalloc.h>
 #include <xen/errno.h>
+#include <xen/numa.h>
 
 #define NR_MEM_BANKS 256
 #define NR_SHMEM_BANKS 32
@@ -56,6 +57,9 @@ struct shmem_membank_extra {
 struct membank {
     paddr_t start;
     paddr_t size;
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    uint32_t numa_id;
+#endif /* CONFIG_DEVICE_TREE_NUMA */
     union {
         enum membank_type type;
 #ifdef CONFIG_STATIC_SHM
@@ -228,4 +232,25 @@ static inline int bootinfo_get_ram_range(unsigned int idx, paddr_t *start, paddr
     return 0;
 }
 
+#ifdef CONFIG_DEVICE_TREE_NUMA
+static inline uint32_t get_numa_nodeid(const struct membank *bank)
+{
+    if ( numa_disabled() )
+        return 0U;
+
+    return bank->numa_id;
+}
+
+static inline void set_numa_nodeid(struct membank *bank, uint32_t nid)
+{
+    if ( numa_disabled() )
+        nid = 0U;
+
+    bank->numa_id = nid;
+}
+#else /* CONFIG_DEVICE_TREE_NUMA */
+#define get_numa_nodeid(bank) (0)
+#define set_numa_nodeid(bank, nid) {}
+#endif /* CONFIG_DEVICE_TREE_NUMA */
+
 #endif /* XEN_BOOTINFO_H */
diff --git a/xen/include/xen/dt-numa.h b/xen/include/xen/dt-numa.h
index c4a229bf9b..943bc0e453 100644
--- a/xen/include/xen/dt-numa.h
+++ b/xen/include/xen/dt-numa.h
@@ -11,6 +11,12 @@ static inline unsigned int numa_node_to_dt_nid(unsigned int n)
     return n;
 }
 
+#ifdef CONFIG_DEVICE_TREE_NUMA
+
+void dt_numa_memory_affinity_init(void);
+
+#endif /* CONFIG_DEVICE_TREE_NUMA */
+
 #endif /* XEN_DT_NUMA_H */
 
 /*
-- 
2.43.0


