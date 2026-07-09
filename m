Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oDLMFosbUGrEtQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143D735F0C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 00:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=vBFsrqhv;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358611.1612664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwt5-0007nB-F6; Thu, 09 Jul 2026 22:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358611.1612664; Thu, 09 Jul 2026 22:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whwt5-0007kF-Bf; Thu, 09 Jul 2026 22:06:31 +0000
Received: by outflank-mailman (input) for mailman id 1358611;
 Thu, 09 Jul 2026 22:06:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1whwt4-0007Z7-8x
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 22:06:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whwt3-004Qfb-M3
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 00:06:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b2a-2eae-0a2a0a5409dd-0a2a4501accc-40
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:29 +0200
Received: from [52.101.125.136]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <taka@valinux.co.jp>)
 id 6a501b62-3ea4-0a2a45010019-34657d888760-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:06:29 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYCP286MB2431.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 22:06:22 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.016; Thu, 9 Jul 2026
 22:06:22 +0000
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
 b=lmwVFexMkF1ciFuAwuPkHXgHTVYkRDromlaxuHd0Go9kb12UQfedZ7opJBeWouWSwxKDsJ69ZA8uBIcWeXBnojD2xj92NhdiNO0LCmJT+2fjrvB+qHr9U7g10f5K4vQ3AM8dLdkUGceyDsQJjkF+obD6Mh2Q+VCQASwAsB9GrHN+4WMSpaVg8iKMX6cVSieYUTbBxbg+x1YcE+ljF8xWnxAHu8Vyet5zhVqDVpk07gJ/C0VmKu9OfUKdU0L4VjjsYzIcBmjOn2WdEOFXq+c7IBnw5uJdbapRd7OO+64DmjHo8xgsIQ39vNYT6T0ORjxd3TPlaUM5PTkO5Lx+Ag/0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9DehGZNw3SYAPXXjiD6TUCW6zXpPgUeGTv4Iws9mis=;
 b=dZwjJXgIeUbastWsy+h0x3rzpC2wKoS/AfMIu7KN/5HNU/p/fgyHJ35es615ADL2cYXIjtEHlGitmJX/pvbXKD4GgaCCQspWEuvmeDjUPJ+RF38kg6V45YomrslyQOw976W6p9r661kwU7w/sdglWNYyenn8fhADwXHsx/Cdnhcbe6ODXTOWTqZNhJ/UvfzLgfVEvRgzUhId5JltfgRIM7WL/bDL2yGOQa8S88MOh8qriEYvTJr6n8Ut57RWBeaTOZyeRhzxcHQywCaRLiIjZLnSpohRi1wnY5Of/E4VlbNEcv2amcTQtMPymOdOnO1s4Tx0U5OztjmeHx878Rw0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9DehGZNw3SYAPXXjiD6TUCW6zXpPgUeGTv4Iws9mis=;
 b=vBFsrqhvesyQCATRFK2n1gETQZzVJ+5O71lY3DSFwbOR8j4DADLk030GEnOUc4KH3V8CRX7T/TGLqr2753KQe3I6JHe3ePDNazzejVoUt+aloiUUelhHXlyBtgrWuNDd4UaAj/mTPA2FHPexHYmaGwc48dX03KtVtVbDGZuNncA=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v5 3/4] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Fri, 10 Jul 2026 07:05:51 +0900
Message-ID: <20260709220552.646462-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709220552.646462-1-taka@valinux.co.jp>
References: <20260709220552.646462-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYCP286MB2431:EE_
X-MS-Office365-Filtering-Correlation-Id: 3649df4f-6322-4fc6-b87d-08dede064f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|366016|1800799024|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hOBtqNtNix+QxqdOedHr29AxepdLORC21VoUFPCeqkoOxKlhV6i5IvXzJNGAPoMB7Jc+UUa0ZCCwjspFU8K4QBRXxV5hjoCgCMP8O8ZzL6E0I4xA2e4G4xmdDKcsVAvUcwfPCuxjyTj+yZfFF+eUd8HD+GV8pTIt3HqbMBtqP8EaG7jKzk29EYJh/EmLal3uZHo/RGrRNFv9nE5bRwXoMct4aFhjHTHvTU+Etbc1lRejTKCY618fmfwNojeTfXpJVOjugFI/eI4oVx4oUA0gIhlbaNDnBRJs6/9DZUGbz/sfU11btT61qpn5pm/nbcFrOLPonHCFu3RVrA3lhjQCe/EF3qJEIepiBQqUtswPkN0x//0Q2N7xqc81FMAuKKCFsk73P2YAW+W8NkjEPTxlyz0/ihFEwXBAVM8Mtpc58NXGi5xY/OTn4OrnJqHG7Dm+4SX3fzJv8h3mHZre4WTN+IR06uvxrJQFL161mlr6axWm78vX9yuv3YA5/hyHBtli1SM2RCJPMai7VrGTszHcXfmZxvl1xdGlC7RcCV6seCZuOVHvjwGOFZH5oIeFMTaEFhWdO/9t51AMoSFAJFjMPMeeZ8zsOt4ZBAOeFOjWmreWb0iP9RYPlyND9SynTGZ2pYFDDairFEuCz+iMIa8DOPv6TRWficHuqLWO9XdJ7uY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(366016)(1800799024)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xE9m0GpYNHIosSW3IBDoHFeWq/Pt9+CAQ6qqXc4ELJD2oRPygK8vUuK7hEoR?=
 =?us-ascii?Q?CN7qDV4kc5G+gOfBPBXAV7kI6IhO5KtyEfo8AwRLWuxKpDrGqqFsqbTnPtTD?=
 =?us-ascii?Q?vK5CkzO/rI0DaOnto3HGvrXpEXAZub5iUytyuC1D8sZKmUkHM+sT0m4c86KQ?=
 =?us-ascii?Q?oNE+8zhOFrfgxcHAbrKZ1HtzZ9SXcoOigioIjZVkXMPa8kzp3XVLQWURhr8g?=
 =?us-ascii?Q?kzojX2d8VoKqqLalOX8uZI1NQeUj+1bPxj4LoTESZO0hY3MacTeE/WGA7O2E?=
 =?us-ascii?Q?ZTr20xcW5A79WuSNN7+WDCUJth3pP7VIzhgwgXr6psrYf3rHablKxyN+6NTY?=
 =?us-ascii?Q?pNuXmBCn/z7ovwwEwu3o4U9JHy6cGAi60TnNMIQwIVKcnAydu225N09u7hBg?=
 =?us-ascii?Q?+4ztPdFyKpy0g+Aph65qjH8uMFV0pssqGF8s9qYD8tCTi99BHUa6z5n4x4HV?=
 =?us-ascii?Q?8l6lgS+uXAetTLSLHIqz3Ypm1o/g7dY5v2Mt/uVxHTAVdeNvtelOa00P7qnL?=
 =?us-ascii?Q?2eOvpR0mF087dP5lrlMyxIR0zTWS4z5tr2TBQsn80crHFTxBCzBgP1Ds+L8h?=
 =?us-ascii?Q?rOH4ptutpBUFje/n3ULQ4cg/RRpYQZLO9sKLYvipwU6itP3DNNFZssRwvZom?=
 =?us-ascii?Q?gS+uwkDJ4OgM6XhpXNSguzbP18SGABDB02oXwl9N5iw3HqI1KSt1vJw10noQ?=
 =?us-ascii?Q?i2UBnhYhF1cMLUy4gr+NkRem2maTDPwla3SwRPtifCGET08RGok3XHwizN91?=
 =?us-ascii?Q?+hr0sREPoilKG+Zd62rdBOMYuDKIyxNi54mz/asIiLz4RiV16laaMIIv8MBb?=
 =?us-ascii?Q?PCzMPduN+TvnEjaGhp0FK7aJKC5Yar5Lm30O3GtPV/CkBoaznDlZKTP+H9cJ?=
 =?us-ascii?Q?HwhKm979R7gvX74eLf5862UUlwsYAOmhSYGJ9PehsWdg1TAV4I88m6vPDTVQ?=
 =?us-ascii?Q?2RWZmzgGKoiES47GGuXR2V7YUtcqeud3hMarlG19kmm1ZBaeKL1+na1APdZE?=
 =?us-ascii?Q?xPw6bsb556LPsck4kU+5vMp488BmeeB/mmcjYC+CEAUTPlLdHkG5iozVGZ6X?=
 =?us-ascii?Q?iQ5Gpgs44hT3kubdDUAxMLKNZSH9QSfoo7oK5wJr20YKc7Bsi/6SD6g369Lq?=
 =?us-ascii?Q?LOScL1YNTuT41/jXGJT0tFKuBxFvaGs4H83f+yy3hKsOG9ZWh0e+kgWF20q/?=
 =?us-ascii?Q?QgfZoNFlkClhEOtqlidmsK5yIOb1mSj1LABEdV66Jl9O3pwK5ImQR8cee/vB?=
 =?us-ascii?Q?0NzzL1zTzhKs/SJmpfP1Nw8RqACTFbHRS80yEDFEsGsH3AWTNtoClRZ/l+/A?=
 =?us-ascii?Q?FEd3xLrQkvitUrS0HzP5dF1GWm97Erp72LWJiulNukUkzxeY28T3YtqGFyQc?=
 =?us-ascii?Q?xquWVh1cOAbVZA2UyNvvJAAf7sLAFP1hfkJQz2dAsvU3wKEhEV/qjdHWc9YY?=
 =?us-ascii?Q?f5m2YZQmPPEuz3PerCiU+9091asbnd6x0PE2qbAo8PwO1xBHA0/qzeegcB2f?=
 =?us-ascii?Q?QP0M33ozurkh5No5fieR1oMU6l0fi7baRc8zeRhk5sq1PGl25vVccAzeth1O?=
 =?us-ascii?Q?/impa8+ZkVo4+OG3/tCyKuuNfSaFl0WsTZ6LzAnbetantFExnP5Bf3+h1Nh6?=
 =?us-ascii?Q?CEOJCyVVli4Pq8uS+pXIF/liA440JiXbS9fNZeYE+d7ciqE8ES1yINB+rOK8?=
 =?us-ascii?Q?nZbX8EGj8yEsz0MUP3j0FXaWze6iG0x0rczmw1CgLT9FQ2qR5FsqKyt6R4rN?=
 =?us-ascii?Q?nVg9SLhFeE7nsl4LEOn7X28yZk86DjE4FJvf9Vj2Q76yT9VFneIXZ1lZRU4r?=
X-MS-Exchange-AntiSpam-MessageData-1: AHNkbTAiXp3d/w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3649df4f-6322-4fc6-b87d-08dede064f8d
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:06:21.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEizRsjyc4zFh/g/F6mvfJHiGugXpQiJ8HZ5sThWJRXhtG5BEvKEYETqygb1qCH80DI1jNUBmVf17y8E8NHixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2431
X-purgate-ID: tlsNG-d62444/1783634789-3EAF00A8-FEFEF841/0/0
X-purgate-type: clean
X-purgate-size: 3394
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 8143D735F0C

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/common/sched/credit2.c           | 22 +++-------------------
 xen/include/xen/cpu-topology.h       |  5 +++++
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8ca6799a81..9758060129 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 3d4cecd5ba..6c645f0e21 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -29,22 +29,6 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
-/*
- * TODO: Abstract this properly, and figure out what Credit2 wants to do with
- *       the fact that x86_num_siblings doesn't even have the same meaning
- *       between x86 vendors.
- */
-static unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-#ifdef CONFIG_X86
-    return cpu_data[cpu].x86_num_siblings;
-#elif defined(CONFIG_GENERIC_CPU_TOPOLOGY)
-    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;
-#else
-    return 1;
-#endif
-}
-
 /*
  * Credit2 tracing events ("only" 512 available!). Check
  * include/public/trace.h for more details.
@@ -882,9 +866,9 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
 
 /*
  * Additional checks, to avoid separating siblings in different runqueues.
- * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
- * any similar concept will just have cpu_nr_siblings() always return 1, and
- * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
+ * This deals with Intel's HTs, AMD's CUs and ARM's SMT. An arch that
+ * does not have similar concept will just have cpu_nr_siblings() always
+ * return 1, and setup the cpu_sibling_mask-s accordingly, and things
  * will just work as well.
  */
 static bool
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index ee34425680..646cd0ff04 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -41,6 +41,7 @@ static inline void init_cpu_sibling_map(unsigned int cpu)
 
 #define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
 #define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+#define cpu_nr_siblings(cpu) (cpu_topology ? cpu_topology[cpu].num_siblings : 1)
 
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
@@ -64,6 +65,10 @@ static inline void init_cpu_sibling_map(unsigned int cpu)
 #define cpu_to_socket(cpu) (0)
 #endif
 
+#ifndef cpu_nr_siblings
+#define cpu_nr_siblings(cpu) (1)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


