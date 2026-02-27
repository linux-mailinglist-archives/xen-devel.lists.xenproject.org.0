Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kxesJNNIoWnVrwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 08:33:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46821B3F28
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 08:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242482.1542921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvsLc-0003ea-M8; Fri, 27 Feb 2026 07:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242482.1542921; Fri, 27 Feb 2026 07:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvsLc-0003cR-Iv; Fri, 27 Feb 2026 07:33:16 +0000
Received: by outflank-mailman (input) for mailman id 1242482;
 Fri, 27 Feb 2026 07:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vvsLb-0003P8-8P
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 07:33:15 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9352483c-13ae-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 08:33:14 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB5703.namprd03.prod.outlook.com (2603:10b6:510:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 07:33:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 07:33:10 +0000
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
X-Inumbo-ID: 9352483c-13ae-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skAbc5lk+b9UuPGVUcqLQiDjlrdS4wBvh97l4CXrDls2YU2ZVM1SFTyXfPAAdLcQPQyv9/knpIszaQeRbK3otz7xbCf3qVmA2bJJ8vX3CiyBPQw4CTT2pFculaIQTTniek968hR03GZmJWW4XFBedwfzIaOpqk2o6Y/zCehaGjaDpaIwKGGiMVPFWyCceloFdZTxrHCUsQ/IaL0YJslUEfVWgDF1yaILrSHAbbX6VHmU3cRhlkQH2m6ekShnCWtcgOFosuRjOVq83x0vD1YeeThU7NckFtdp4Ewg9IMPcZhtpr9W1LWUGMHwtpfs7s8yeB7PSVGGATbLcbrX0KGpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPPIUPm12nWgbE3ZxGYrVCdi/GpigvkTLG3rTr9R7oI=;
 b=Sf9Wtv5K1wcAiSvp+7jNqY3jGMsz7gxUWYjmmH+4tde550kdrpCPDSfPgE8af0p1nJCUXQEkBFKmnrq5e+x8TMpLVuMAd6VYDNYKBWjLuWKu5BQC5lDOJZO37KLBIaHvIlC9oGqTTB7vk710SQTy6KUZJcVz0XOVMEWFnABsqOAAkal3Eh8L1eN5X2yYdhXNg3CzfxhDUM8Um3F4w8fo/MBhUKCBWiJ+MqmmVmOppCUBJUCKfoo5xqF3JJxps9RTizzblzewIKR4vS8rHXusiFoTMg7tjeM0d49kH+PPB45JWqSOBHfX3lx3KRDPe4dKgjYdq9wJRwPCtMkG/mtS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPPIUPm12nWgbE3ZxGYrVCdi/GpigvkTLG3rTr9R7oI=;
 b=oWgWtoHSfFFOEZLXoi4T2yEx5N72mtdLyPMJvCfiJP0wplQpk/2yC61UZLN0bns83u54Uz2D8x6xGDWc5mA7R2QaTM5748AT5pu66yhOFpB7H4O57YBh69DgsM4UdXZ3/yYhegJvGbUItJcxFUdhGxLyTPv2HoJjSywQedCQgZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 1/2] xen/cpufreq: fix adjusting of sampling window on early exit
Date: Fri, 27 Feb 2026 08:32:58 +0100
Message-ID: <20260227073259.1200-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227073259.1200-1-roger.pau@citrix.com>
References: <20260227073259.1200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0017.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::20)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB5703:EE_
X-MS-Office365-Filtering-Correlation-Id: 63022971-5773-479b-2cb2-08de75d27523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	HXpUl5T1nlNuLUcOMkxs8rNdbaywbnYsFJ7SS7gEDNvkHenlRDo+Z3PXI1cyocU2innaqXxzecsSrOH+lBqkjVNpcw3BOjyvDxR2Rst9z2XyP8qqKwJ3Z8KK82+kj+Wefyp7cILF3f0OfyGrzhOd4y/Iy6fsCYwjD7/2vyqDh2KIHeM8b/SbsBulISsXik2HdSHm8O1NZR1qQhoc38C9zcEG7MKPqrc3xsgFIFV1rHekLN72WlBirvMASf5BYsMrJucYvA+x8qr8nvJSZcYINSMSE9Ulyclt0p++q25CKMz7H7HtS1qqngunGo4N+f9v/eAbfSoCzDZSaay03GZNXqay3vaWoYum8ihruSqUxh2kw8XlW0mgW46CkWBaU72IDE9o1Rs63VDPVE5814u+h80aGh/jd5TCbslvmGB6wfjhoi8xYXl8+LCEkNszPQ8JF6aRU5s1BFGyeePRyWf1NZxJGgN0zw/O5QMlk3GUgkXy6e8Obafrnv/VLQjmNT+311uUGB8qcYRybQFDJu4we0Km8SASojF5KL4pL7nRfIQwAgITFRCzP8YNj0xvCkLqYCtec0sNpyCi/1Iqraw+ZEqUlKYfEk63VcYK0MDvLTvVj/GsBWFIMsGEIDp7Coi8MHyaW9FzMd1m5WGw/1cJk1ka4MVIB+fg6+UUHOoAvg8F4S8cvbSasRjhpsgTA5IWp2jUurYAKmA48bkBLljRMRsR9MEL6HHKibuOqdsobVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEVHanpSNzVsSEovU3pWQkxtWmxkclVZTWJOUWNDWEM3REE0ZkQ4RUdxT0tX?=
 =?utf-8?B?UTltWWxBNWFTeUdXYkdFWlY5ZUM0QjVTNUVxWGdQWGlpcFllc1duSnlpQWVV?=
 =?utf-8?B?a01qYiszRzFES0pIU1NNeE5FcXpSMldmc2VDaVBEL0E4U2ZNMXEreHJ3dWVH?=
 =?utf-8?B?elYwNjcySHFoVjdQZi9tdTlrTC9tbmFNT1NtZXNvcGs1OFMzdUN2ci9hSFJN?=
 =?utf-8?B?SDRrbjI1SEJMNWcrMFFDdWEyZW5CdlA5dWsxb1BwVHlZd25DTUxCdlErVTc4?=
 =?utf-8?B?d2dqQTNMeHRWQnluRkdmZkdCUUV1dnVEcDIrMExvcCtNY2k5emhNN1hkajUx?=
 =?utf-8?B?c3RrM1ZiTXZYeEpTdm55YXVlQUp6YXhMaWVnVHZkRjVxNkJYUEE4UFFrOVBS?=
 =?utf-8?B?SkVlM3NRQ2w2blZJOVFYclRwU3piZHNnbEYyZWJ4K3p1VEdMS2F3eXlnajBO?=
 =?utf-8?B?cThDZDBPWE1DQ3R5blhHTFF2QjM3NWdjMlVWSHhqMWpZdzNnbVd4QlhNcEZ3?=
 =?utf-8?B?VitaMEJkeDByajZhMjZhYXdOK1Vmb2pFd1dSS3c0T2wyZlQrQ2xGNURrSlNL?=
 =?utf-8?B?djFkcXRjU3VZMmtlc0dEYURuSlRETHF5TlFNaWhWbTVmVFYxRG5ydmswWWNw?=
 =?utf-8?B?MktXQTVyanBVMFB2UEI2ajRhV0pqOGJwVVhFcm5WTXdqM0x4Q3RIVUs1dzZ2?=
 =?utf-8?B?Q1FNeDlubGs2d0ZFOWJCdmZJVmZJR3R6aVJUZCs0aHJpQ2gwaXZUQzF2Vm42?=
 =?utf-8?B?MisxTW5ZVG1COHpPT0hlanJjNWpBSjJlaktaMEJLU3pHZDFFUGZkR01rN3JI?=
 =?utf-8?B?ZE1PR2ErbEE2d25MZGk0b1p6R3kvUEk0Y3NVNnZoVHZwZ0hkU0hScFVCSUZx?=
 =?utf-8?B?OHVGc0lHbm1na3pYc2lRZWQ2NFg3THVUcE1zbkpxSkQ4ZG1QcjBZbzRKVy83?=
 =?utf-8?B?c3ZjU0VjK1VkM2JyMXNoME5BMlBGQ2Z1TGtSVlNkZlRpeTk2SFlsSDdKNmpK?=
 =?utf-8?B?VVhjOUxCOVZZaTVCZDVkelZhbGd6WTZUMUd5QTFYUk91NlphMzViNWVVcFFB?=
 =?utf-8?B?MkhqOG4xQnBoQWovdU10bnBxOW9XdVN3WmJQanBPVFlGOXpyUGRUL3dGei9z?=
 =?utf-8?B?YkhXM1UzQldYYXoyU0wxbGprZVR0YllYMUZNY21kZ3o5NFAzdkNuYk9IcmNQ?=
 =?utf-8?B?M0RhbXZTS1NNTk1nTWVBTEFWNTgzd3lhcjNscjFJS0hQVVNuZVJ3TEJBL3lD?=
 =?utf-8?B?aTdJVytjSWxZZUc2eVp2N0F4NXlxSm9DN24rUzlMeHExRkl0ellTeTZWRzc4?=
 =?utf-8?B?S1JQbnZUM1kxSTk5RFh5OWE5NFl2ZXdZRmgvQVhyRG9kOHF2d0FwNEE0Nzdj?=
 =?utf-8?B?Y0kxT1k4ZUNjY3dWQ0VEOThQdExDdVVQM0dDR2VXNFpGOTEyR2NIcHhaNllB?=
 =?utf-8?B?ZmgzU011YVg1UUpMVTJsdm9qb3ZpOHNYWDk2ZEZtUlA3Y0loWStjaGpJcmhZ?=
 =?utf-8?B?WktqMUt2UkMxQjNjeGdzcUhzdlNDVVd1WkJzNmFCZEpXVFJwd0kwQkhSdGQy?=
 =?utf-8?B?MFdxYTk1K0huUjkwVERaV1Nia2lvbVVMS3VzUUw5Z205VGdvWFE0bnAzcGh5?=
 =?utf-8?B?Wi9UcmptUTJGZjREWDBBOXZ3ZjBKVWtPMHYzeFRmaGtRWHRpQXVyb3o0bEE0?=
 =?utf-8?B?UWU4c3RXcXRkSUh6MjRWMStTWmltb2pCMEQ2c0ZVZWJKSlFKRW4zN3ZQQytz?=
 =?utf-8?B?U0xWTGZIbnNhODZnSzVNM1VDMUZKakgvVitGVysyZlNBaDN0cWJZSjZIdG4y?=
 =?utf-8?B?UXk5UlZxZEZkZHdZU091SDJnWW43bGhDNnVWZXR4SVIwWlkvWGw4elBlTTZw?=
 =?utf-8?B?Ync5NGd0MDAxNHFvNm96T2p1NUFEdFNNb2IyL09wMnU2bmZReXJDUU9YVXV3?=
 =?utf-8?B?cmZlV0lPYlVlNVU2UkpSRnBIQnhLZU44S21naUtYRElQYStLaHhCbE1iOEJu?=
 =?utf-8?B?OVlTMk1zaXRBT1NzQmVFbFF5Zmw4TFpjRlhNVzlsUC9ORGprd1hXd3F2TS9R?=
 =?utf-8?B?Tm1iV3JnYTNMbnhqT3VmWGFER1REV1o2Z0RkbTRkZDdaYVkrWkhYc2YzL2Y3?=
 =?utf-8?B?V1lVNFhvM2pqbUlQTDVkcFhPSy84SWU1bCs4WEdHSkM0VGg0YlZyU0trWmVa?=
 =?utf-8?B?ZzNPRnlSNWZRM1BYa012LzU1emVqVVM3Tm9HbGJQeXB6R2JlaTErRGluV2U4?=
 =?utf-8?B?VVN6YUQrS0N3aWtwRlMzdXJ5dm9sK1NselFKUS9kZjU1N3pIMGJ5Qi9EZCs5?=
 =?utf-8?B?UnJCT2p4K1ZPUlBibW1uVmx5UDJoK0t3RmFZUWFLWkR6clFWbW5vZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63022971-5773-479b-2cb2-08de75d27523
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:33:10.3545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/rWDO5hkQEJp6KmKcwwcrcdMPYYpTcgZ1gglQk6Kmg1r1hNl3UAA/ioNwst/rlWxJB1P63bu6QhUmIkhYhnpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5703
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E46821B3F28
X-Rspamd-Action: no action

The logic in dbs_check_cpu() resets the sampling window even when the
sampling period is considered too small.  This leads to further calls
finding an imbalance between the total window time and the idle time, as
the total window time is possibly shorter than the idle time.

Fix by resetting the sampling window start time in the same block where the
current idle time is stored.  While there also prevent a duplicated call to
NOW() and instead re-use the previously fetched value.

Fixes: d6f001cb91ac ("x86: Implement cpufreq ondemand policy")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/cpufreq/cpufreq_ondemand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 0126a3f5d9b4..537695eaab19 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -117,11 +117,12 @@ static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 
     cur_ns = NOW();
     total_ns = cur_ns - this_dbs_info->prev_cpu_wall;
-    this_dbs_info->prev_cpu_wall = NOW();
 
     if (total_ns < MIN_DBS_INTERVAL)
         return;
 
+    this_dbs_info->prev_cpu_wall = cur_ns;
+
     /* Get Idle Time */
     for_each_cpu(j, policy->cpus) {
         uint64_t idle_ns, total_idle_ns;
-- 
2.51.0


