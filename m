Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 24thBE/lPGoFuAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 10:22:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C7E6C3B96
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 10:22:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=wLIynZ4K;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345338.1604224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcfL3-0001o7-Rw; Thu, 25 Jun 2026 08:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345338.1604224; Thu, 25 Jun 2026 08:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcfL3-0001m3-On; Thu, 25 Jun 2026 08:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1345338;
 Thu, 25 Jun 2026 08:21:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wcfL0-0001lx-S8
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 08:21:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcfL0-002rhf-3l
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 10:21:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3ce501-2eae-0a2a0a5409dd-0a2a4507da80-42
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 10:21:29 +0200
Received: from [52.101.228.136]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3ce506-9c8e-0a2a45070019-3465e48843e2-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 10:21:28 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS3P286MB1964.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 08:21:24 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 08:21:24 +0000
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
 b=lWN7EK/IeY0UCPI565jl57+0qk8+rEP3odd26C9rItPABioAtdM3ZZEbOlRCz8XFkDL/nBwNMCoWZk9y9f/oenuHTPrd3IRxSUCdQ5mJ1u8ggc2eJD2JSFPXDikrLwq9pWmRYMoT66YoiDKDlkyKOGY+n+XMO98YxY6evID9yKkz+O6YBTLD0ArxQkqfpb92Q1FMgUKLYoveqLFSjPeMmqlH90lpPI1ShZidacbpTAa+GhzF91IjJ3TYKmUjcrS6QQP8oXqVoesGJW6kmigI5/Hyr/FTCQrcRuk8d3WpUZqw7xifQvreX0c0KGV+7sPc5eYLwcqZBP9DxzCtevpI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnst5qMEJYXshN47KHhoF22K42utP7xw3us1g8T906U=;
 b=KGqPkn1JCEZJmqY54K9wDdOzKuHBYX2LftW7P2Wr9vpS1Nl6J7DUA7eU4xi1YFTMKcDa4wzyoyDD+J3xbpn4Ncxhe2o1WWLnEBh6BXXNiM4M5ifSkkL3UUcXLjuLwEECnwbBU7s8ouFZwcJf5UdAs9Mp8Or6OFyC7hNuqfxEW73+kgs5tYXZz2zDin4Bpmp9yOeNkt/riPFtsnHfblktlD/KgxURn8p/hQ8pegv0zAkoNh6pQ3AmhgNaB/RUlgIYTV4reG9daDWXbrIqSw3cKfaPmN751LGfWvWfZkvAO9KZoTleLJQt4Ufugdd5/mqulsYTYKaGm58ASf6Q4VuzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnst5qMEJYXshN47KHhoF22K42utP7xw3us1g8T906U=;
 b=wLIynZ4KGLRDNGWkAFalhiS4yG9XLPaGpuCtmnfCCaUQUfUzJRQxP5Neje9FH9dJUuvOyS2lMj8O1LjMwJNQ3ggt7Bp/5Ejovsx76vH7Anuyyrq1LB/L092TFpT3AgTetoqj+aTdabVoxLP3KLxX9okO8fl8MTb0m/Zvvl4pfqw=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH] xen/arm: fix sparse cpu_possible_map calculation on SMP boot
Date: Thu, 25 Jun 2026 17:21:08 +0900
Message-ID: <20260625082108.588079-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::14) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS3P286MB1964:EE_
X-MS-Office365-Filtering-Correlation-Id: a425636c-8fd4-46bc-15dd-08ded292beda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|10070799003|366016|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	4d6iTu/bMSPP5SuGGFnPDxBary45079Zo3cBDBSbTf9yUz4eagSAhAg46Ovosn2p3bUJ5chseqKU4ISnW6yEh7CvXj89igcLueoPv4tL96SOHhOkmhM6weKPOkTYW0sQ75benQdBRgiCGxeSglDYJD5BN0v0aSqhqQ46f0nrsdWoSAVf4POvtt4qUWQpTFMS/XPNPYApCIqX5WUuxQlEbu77xur17QgNJ94m3JK16alR72P6Jo/kuErJaUktHFgsojUQ3LLKaQEeW0qkMnzV1zMK1N+MWm75332VnS80bd7wycTou1weA6t1ZPvwSVh4hra2U7uLX601MlJiNiC+vpsLoR7RLLYVyW5S0+DtuhI2jSQErgmV4FH1EPQ6a4jK4TnXyf6hcuQcu+wtcvf0ovKFhSaP0OaSYutcEMsw1fs/xU3rmjmcqIz/7YkNeKitSMGlCvimlHjNAQnrOEmonePn7TiwJJLOOGAFfmXvhnwWwFwcYa0Y3Wr6ZDXaxLP/mvgRUFIcE3CK6lF4bPBDgaCSn/ob1t+8r6d8hv8MSJyIwizTS+WJ19Bjy7ID7eY8HFBksHxD1/luy6Qo4m4AZunhA7ceXypSIxusk3No9dKTDP0WnwMNoa8OuZcGcVpVQWAfylZjI9yczzTT7qgyaHRqhtfEbStcpSrxYVhtJkk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ApyMsQms++gQpyJ2o+DU51QAQ6XrcGSngD4QSyAIZfVuiPo4regI2q9cc679?=
 =?us-ascii?Q?zLY73ENneKXhWPjzYlpfWd1T8DIcQEhresQTCOeauP2f+425iwLaQpQAreqW?=
 =?us-ascii?Q?5gW8onnzGRKBMkUgP6JonuHL4cqV1qw1OhKK5dnzuia7AdyaNf0YvetDahEq?=
 =?us-ascii?Q?qtrt1B8Tv+HTcbJYxXr1VixDyBEHjombMTHsgVUNOoDmaxkyQU7OlaxNMPGI?=
 =?us-ascii?Q?0Ad37zonEAwOilIC892zFD4mJ861xcyHlA6ebpUqPB5jszYLDnlVs5DrT6Ca?=
 =?us-ascii?Q?+/36r6+6hzI2Os1ob9bowJqWQHoina8Y6tfdcrlEyv8sOO6Hv0gR21E6N4BC?=
 =?us-ascii?Q?5gzdFSVtB0XF8KTngLXsPdDMg3L1mf/oFIDF05IrZmxogQQRy3amZKrsFh/5?=
 =?us-ascii?Q?adUJH/k0tA0RrIF0KpuM2LJvtMaaJEnS3h8S+35OPw4212Ks2H6YNYKV2roq?=
 =?us-ascii?Q?yz0SNwYCXLG2D4E4NtLddE6CafXm6p3pqAMDktWHmzpKaCU9q4CTaFpOoZHO?=
 =?us-ascii?Q?18bCdXwglXzvmNFED9hwqTseE0H20Y9MspVYKvlcjRysTeelucpr1zJom83D?=
 =?us-ascii?Q?gkunAf7mw0C0kshMbTuVUkvb5zB0u2SPWP0+2Y/mksu18uK2lh78iAoQJNYL?=
 =?us-ascii?Q?If2tsSLLXSeZCQhahmaWVO/hbP6GLpU/LXK9Nj5M4t8fI2QRcByxO10kp7eW?=
 =?us-ascii?Q?Ul6CsXjPlnZk7/nY/Dvu4qEyhUGES6iUalimHxGs/UXlFxywpfUqH2ma5PiA?=
 =?us-ascii?Q?1zBcnUWYWDaL5mZTJwM/VVmuWHm6MkVFvy2kgRx7D8uEY6RqJ1oRWuPC5yf2?=
 =?us-ascii?Q?2qPgxn7keHNMlZPGwo4CVfwv+mqPD+A/B77PVB2SugqCD9LBkJYGfG4BEYk3?=
 =?us-ascii?Q?BA8fYF3J9Fl3yqw2i8gq6ksALzOohUIzyf6dobnpI+0c5MuFz3AxcgwAqJLw?=
 =?us-ascii?Q?fH2EkuZWHR1vAzwJdXt/NGvDTeR1rc/c7X8Q/tTZfNMLDtRh4PiQ9wizHHfF?=
 =?us-ascii?Q?wIyg2PwrQwPDj4d05ckn2UJurA1ExHeAynrRHiWWe7Y261rD5E7nl5qO10p3?=
 =?us-ascii?Q?Po0XRY4DFYzHI2D3JiG75yVVKJoo/lst7KGHTTMsGReHI52ljIcacuRGjvyQ?=
 =?us-ascii?Q?N/0OZofsAC+/9th44Iv0Q/24+PAhqgnIX45jN3AaXJoONv2v9BVaQ3SiH1fn?=
 =?us-ascii?Q?mfUUVM6W+xGX7J3nYlFMyKKxDqmN4e/RAi+WXtSG5wp3SdQ6rRP/Dcw8DA2j?=
 =?us-ascii?Q?4F9P+Ok0s6F/hb5bIikYMsCg6AAynwRyF9+hTaGxT+bKRhmSN6Rxz266+laC?=
 =?us-ascii?Q?dv8bKFt8hvn4eDJ2+LhH2YMlnzAtC78/hco3iPJEPJFWgD84aNgcvLu0YR7d?=
 =?us-ascii?Q?QDqOWSWr0ZA0ssPg+q1k1mkw0zKhLQlrXHBMS2Fna4t4CXSdzfmmG0SmNqSp?=
 =?us-ascii?Q?6ioVAyVCEXF3AStJTS00W/kSy2G8r564TORWw3E2oR5tMyyaZXksImpUTGxo?=
 =?us-ascii?Q?bbRbtzScg0vWbs/q2t1a6cWPbzUBLIcG2jsZ5N7C4NngpSqLizNwkF+exNqp?=
 =?us-ascii?Q?aeERO2PTUmzRVawqbG4pOD6Yj39WxWpk16ShdvbmSrsmdSemeBRVvf/GaBh/?=
 =?us-ascii?Q?6UTSOeZcBK7wv3FJNO2S/WUd/8wtOMzfnMMP71+0vfPdV9oxPLTB8EH9EQYb?=
 =?us-ascii?Q?GjyiwMGJcGOJoeWCIw1mlhvSAIRHlxhXQH0NGhAZRtjaNfxJl+KAARsDUzio?=
 =?us-ascii?Q?UgPLLdOLMxiEtNfgnNvDyNq8vipD5eb74mZiSvqnGmDt7M0h5sd/dQhKmkjb?=
X-MS-Exchange-AntiSpam-MessageData-1: AmF9alujomhmPA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a425636c-8fd4-46bc-15dd-08ded292beda
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 08:21:24.2960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtOH4OtmhnYzfW5KUTA8U+KMfgE7rJThWRAQcXKbFOyXXVOPA1/j0eftOG/tLkKag64AaMnMp2M2SaQgiOtZiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1964
X-purgate-ID: tlsNG-ef75cf/1782375689-7C92A25E-6578B470/0/0
X-purgate-type: clean
X-purgate-size: 2642
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:taka@valinux.co.jp,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11C7E6C3B96

Currently, during ARM Xen's SMP initialization, if there is
a Device Tree error (such as an invalid 'enable-method'),
cpu_possible_map can end up being sparse.

The issue here is that nr_cpu_ids is calculated in a way that
doesn't properly account for the maximum CPU ID when the map is
sparse, causing a mismatch. For example, if cpu_possible_map is
0xff0f, nr_cpu_ids becomes 12, but the actual maximum CPU ID
is 15. Xen's common code is built on the assumption that
'CPU ID < nr_cpu_ids', so this mismatch can break things.

To fix this, modify dt_smp_init_cpus() so that if the
arch_cpu_init() call fails, we don't consume the CPU ID slot.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/smpboot.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..aba3c24373 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -191,6 +191,14 @@ static void __init dt_smp_init_cpus(void)
             continue;
         }
 
+        if ( hwid != mpidr && cpuidx >= NR_CPUS )
+        {
+            printk(XENLOG_WARNING
+                   "DT /cpu %u node exceeds the max cores %u, capping them\n",
+                   cpuidx, NR_CPUS);
+            break;
+        }
+
         /*
          * Duplicate MPIDRs are a recipe for disaster. Scan all initialized
          * entries and check for duplicates. If any found just skip the node.
@@ -224,24 +232,19 @@ static void __init dt_smp_init_cpus(void)
             bootcpu_valid = true;
         }
         else
-            i = cpuidx++;
-
-        if ( cpuidx > NR_CPUS )
-        {
-            printk(XENLOG_WARNING
-                   "DT /cpu %u node greater than max cores %u, capping them\n",
-                   cpuidx, NR_CPUS);
-            cpuidx = NR_CPUS;
-            break;
-        }
+            i = cpuidx;
 
         if ( (rc = arch_cpu_init(i, cpu)) < 0 )
         {
             printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
-            tmp_map[i] = MPIDR_INVALID;
         }
         else
+        {
             tmp_map[i] = hwid;
+
+            if ( i != 0 )
+                cpuidx++;
+        }
     }
 
     if ( !bootcpu_valid )
@@ -253,8 +256,6 @@ static void __init dt_smp_init_cpus(void)
 
     for ( i = 0; i < cpuidx; i++ )
     {
-        if ( tmp_map[i] == MPIDR_INVALID )
-            continue;
         cpumask_set_cpu(i, &cpu_possible_map);
         cpu_logical_map(i) = tmp_map[i];
     }
-- 
2.43.0


