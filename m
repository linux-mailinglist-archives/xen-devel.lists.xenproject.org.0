Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vXwZLKrqQmqZIAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 23:59:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4EF6DEF77
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 23:59:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b="s8n/sSm3";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348269.1606094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weJzm-00036N-RW; Mon, 29 Jun 2026 21:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348269.1606094; Mon, 29 Jun 2026 21:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weJzm-0002wv-MW; Mon, 29 Jun 2026 21:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1348269;
 Mon, 29 Jun 2026 21:58:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1weJzl-0002ij-9l
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:58:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weJzk-001eUD-N1
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 23:58:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a42ea72-e002-0a2a0a5209dd-0a2a4509a9aa-12
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:58:24 +0200
Received: from [52.101.229.81]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a42ea74-97e6-0a2a45090019-3465e55169fb-6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:58:24 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:58:16 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 21:58:16 +0000
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
 b=gSaBAmSh874mgtvwR/JW9x1j1nCwkiFdOUpeyaRqfnclXz43B00aeLbO2ONuEA/f5OG9jPKbkt02sqDXRH7VML7nMHlV8K+Vy9IoBdRmEsH7mYxh4SoBnArZbKSIBgf6rxyLDUTlgVCDZVMZ55L2YVJJY05C/O8Bw8u/tPmY/8ckb9yss5InwQcdIaqf3UqC0RaZlcfn8N+SKerInBvITAFhb44/xWXecq9tSz8k4rYMBnkkzCh3p8dM26FJ/bMSo9TOnMBUKaRccNnY+METFabH4yn9DEoBSNFd9sadGv+i6bbA9aH8dNg8NQyakTLFa8QdhHfM2wnR68L2hwEQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nptodQ77kyH1WZZzeYwi50d4VdzZhamsksC8O+kiNAM=;
 b=h13JHywBHbWqir4eYiuYA2nvB5n5xg9w6Nqlcgz5G+lAdB4h6g3T7QP/Q3DcLW1otdcOmN2BVmd2BLWNx1vxU5ji+04fuwRUiFjm9lTQKsNOIeDo7YhRQ+RWeJ2HUEeg5aAd2I6/v6CCtc/x3blFMRJDpXKHBfY/Q6lJSGlEa2dJ8Mym1EAwiLyXH2jVEZ4fA+gkPA+APTZzfwDTHC4qZZfXwCwkbzgvOBp6Q/uZmmHrojocKJrGaWdjeqsGkZVb2E6vXY8Zr9gezg1uKk0ovu9v3wjmATtJ3+uigfNSsUVucFnyms6DY9HAxZF0FCO9uwIyWgX9fZWe9OYdyhAdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nptodQ77kyH1WZZzeYwi50d4VdzZhamsksC8O+kiNAM=;
 b=s8n/sSm3L53ipBRJsPL6BPgvus5vaMB7Yff2lNNWZ3BfJjCCppFMzccvdTwlO92sW81oxl+W1DuXvxNWuy8hbLave72qyxdEWeKRq9dvSVb7LOudFc3kP8nBZGtYpelUYZ1CsOIcTRgv9A7kQNX1CYsDyZ7lUIyKfoi+GSNOIKo=
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
Subject: [PATCH v3 3/3] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Tue, 30 Jun 2026 06:58:06 +0900
Message-ID: <20260629215806.11610-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629215806.11610-1-taka@valinux.co.jp>
References: <20260629215806.11610-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::15) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: b663e60c-2ae1-4ebb-0af3-08ded62985bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|10070799003|376014|366016|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Byap+l3n+H718heMS/5f6xQc/NTZ+Z+T0pwmTd150uGsCHRPuoV45KibVqQ3fHx+nOCYycXCf7IYQVg/LND7FAE7smS0uTkVN4OtfspZw0IFTRI5pcww8jejbd5l5slpKzrM8taCIi/FTjeEenPwYwoEaN0gToqm64oHo8MLeqaAqqAGPdDg1bhCM7voWYMbE9/8Zj38ZA8gxTXdpcEQ9IN7qR9mS0G3lk5B+iWJS8K0YtbQ1k/opjbJnMluZrXCmQLPk75ZhHxhFFhTor9iZj/iAJCPYgZABgyyfsCMTidRD7lrJpJgZd/qLo6MKILbsUPdMFF/cPyQIfurCoPaBRgPL5qWQ4vJ2n+76A8fbZpCycvhI2LqfJAcZBOyqtG+UWcFU05m44kvw5HC0sBbIUcZvSo+UNv3XyzxMVxTI8lOzoNINm0Yz9sCwjRk/YcnELhgsCVGifT88qfDy72OiD5qgWqfBs2geLoE70cBxiBmc0XL+6kinbJXLKcaOvSXH5cMmb1ahbB5hVMD23vbZ+EKd5rVbFMk+oiAbnEWJxWQkIiPSpQBGEe1vgFC0veMXp5ov2IA085PmGwoqtgmCVmvwzfg4h1YuCOYSbcLv3dkR4XuwaJOAgG6Xtq/0Wgh6FPGPbZO/Sy9iE5Hy+ErF9klOAzu1v2iq2p3g+hnkzc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(10070799003)(376014)(366016)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NgVL1ygmjVIrzYHGaaFFSn9EqcIPlvvgIoKU0q3nw/CYo7ifVre5PSsi0cmm?=
 =?us-ascii?Q?RS5ttY8B+Gxagj51vYkyTWM51NlnZ4wcufL1wuFHN/hnsAf0ZkcLNS6c6Ye8?=
 =?us-ascii?Q?5S6lHUyaKjvsAwzNxJfiM8EyPwj04ahcJCUUhM4xKuv+1te+bj6169w031WE?=
 =?us-ascii?Q?0kA5XHPPpcgZAc2k7S8D5r8jMHnJPn9aO6OTv2au8TuYow8Z1o8GG+AjutS+?=
 =?us-ascii?Q?+bOSbIyzEgQnEkHpO0DWcQCIU/JHYz7VUjQvl2SXX45mhz7V5EAmJUMJp0oD?=
 =?us-ascii?Q?D4TGouV07svqyF7ppgvcRXs7dRTCUjbOWc4hHmYt9fnNQ7sxFZaY3Yho8RnY?=
 =?us-ascii?Q?Ot6Xphp6F+Jxh5bUaBCJPSeo5spQ1UfMfO5OdmgPbEkV65OdxCSP8YfLLcJy?=
 =?us-ascii?Q?U4w3mhbPSKm5n6ZxtCLnXESLPXZFjf3w75kgDCjIR9ZjnqYTKpI9v+zyeRqV?=
 =?us-ascii?Q?ng8N2E0W49dV5Buctc0jMoZbx2KP4rdBKiMq3UviyzuglTetyU93NEfw36To?=
 =?us-ascii?Q?kBhFZn8naiyfl74Yp8b8y+633nKMkbKt8wRwJSR7tmV4fXeTquB9r/xBo5p9?=
 =?us-ascii?Q?BbqAcl+rJpOiefpki6NO6fx3YDDDpPZmKVtj+UikCgPIM6cJ9+u2LsZBVz+Y?=
 =?us-ascii?Q?3JlwYggBdO4fqWVZQtQ/MfNCUvjHl4SO4/9CUZhuiL3N4ZMYDQliBzd6S00f?=
 =?us-ascii?Q?pw+uaPc/tVZvYxQHgGfxZutGgqoZGtVRiFWAhWwBQtQyRcrGmKQqbM+I677r?=
 =?us-ascii?Q?AZQ1tdAM3ZZC4GELGaz9vQnVw3g82R7N3Z5jXnx1wONlElWmehKazUo5eYXF?=
 =?us-ascii?Q?MQOY+XIg9biGtkB4UqkQOIOkeQ2FUSOJ586MD5ePigFXJh4fi4xyjj3YxeVs?=
 =?us-ascii?Q?y30m0NDaEID2LruYBzhlpJnzZSIK9iftQ9nmNaMHmURI9YXarCoLBbRoC3HV?=
 =?us-ascii?Q?WlYRB4v/A0iI6G4YKps7ghIX+H8HwBAP5GCYEywGb4VZpxQRVoDdw+2aYwvY?=
 =?us-ascii?Q?qP50El+m4444jCXY4FjfEZMTp8j/ZDOb5Dz6z/3LaKO9yXsKWWJ/C2e0pnwU?=
 =?us-ascii?Q?4q2OqjHeZftYE+aqo39wKCmJM7uYHhWYScc4FvokpzkjTduyBxdKVuNzDiEY?=
 =?us-ascii?Q?Kja/hVS+8NaG3ozDbbf4K65Ruk00ActY7QfbQ0WmXu4vJxsj17TBY1x5MBye?=
 =?us-ascii?Q?nbafkrih8F+LW19M2c0csZnxcmU/YeYMForNjj+bQekncS3svp2q8F0ymRev?=
 =?us-ascii?Q?5sgJJxnIGMm9tRp+zlr6sFU+Pu637Vgr8lvpVWX/YwCikNV6p8mHPTFOKeuW?=
 =?us-ascii?Q?auZzXInuAFjKzebG5UnYSucMgr56n7L+N8HRID2MHGq82uJjFxx56sFKQBg3?=
 =?us-ascii?Q?NNF8jCFGxIaegoPMHz51F/jzMh/JFUqPJuEl0cz83bCr1SYoGlDkX6Qx1O/8?=
 =?us-ascii?Q?L/MDws4L6PjW9uBmEukCHJsItKzdSZHcflb88MEDMsp+ujNAvtfnV9AwQBJj?=
 =?us-ascii?Q?1bE237vo5ZcvhYvHvFZ0jCIhylZyfx1M6ttWr6xz44dU97494VmOrcBOoV+q?=
 =?us-ascii?Q?aJHzMXXkCgKnxEFSEyxdL0m+kkoyIShMQfW5rEkBXJScZwFNan4fsXUBZye8?=
 =?us-ascii?Q?Kueaz5qMK4oi6y+iB6ejcNMooxS/7Ykj7hU499ehWzFxlIVGooW40HBPaMil?=
 =?us-ascii?Q?V3MpwdfiJ5i6CB9tGZP02j6DJjf50Y4+HNx0OYqmU+h7skJsYCMbhVx91t64?=
 =?us-ascii?Q?jvLDHygpdjd0hA8Whc8Urap3O0KHZf7LvJmskj9mFwcIwNEhrLJZ1vAxz5W/?=
X-MS-Exchange-AntiSpam-MessageData-1: Sbl0kUDiBz4nww==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b663e60c-2ae1-4ebb-0af3-08ded62985bf
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:58:15.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+wtmqwIBj0L50Nzm/c0FgcvAKaZ9hMttmpfRTk6FEvTFSNW1MqptY7VO5H49wUV64wZ1+/pvvKGrUGWPOA9sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-bad1c0/1782770304-5F932986-BF038056/0/0
X-purgate-type: clean
X-purgate-size: 3287
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 7E4EF6DEF77

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
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
index 6ecc19cc4d..c835c3e1b4 100644
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
-#elif defined(CONFIG_CPU_TOPOLOGY)
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
index 1cd73b7ee9..ccd72f95de 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -22,6 +22,7 @@ void init_cpu_topology(void);
 
 #define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
 #define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+#define cpu_nr_siblings(cpu) (cpu_topology ? cpu_topology[cpu].num_siblings : 1)
 
 #else /* CONFIG_CPU_TOPOLOGY */
 
@@ -36,6 +37,10 @@ static inline void init_cpu_topology(void) {}
 #define cpu_to_socket(cpu) (0)
 #endif
 
+#ifndef cpu_nr_siblings
+#define cpu_nr_siblings(cpu) (1)
+#endif
+
 #endif /* CONFIG_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


