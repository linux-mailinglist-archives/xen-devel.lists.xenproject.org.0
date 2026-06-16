Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +bqbFMReMWrSiAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:33:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02236908B2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:33:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=TwcKqwP5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339317.1600504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUr1-0002CD-NI; Tue, 16 Jun 2026 14:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339317.1600504; Tue, 16 Jun 2026 14:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUr1-0002AD-Jz; Tue, 16 Jun 2026 14:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1339317;
 Tue, 16 Jun 2026 14:33:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZUqz-0002A4-OL
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:33:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUqx-00BlLt-Rf
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:33:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a315ea6-5cb7-0a2a0a5109dd-0a2a450aa7d4-26
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:33:23 +0200
Received: from [40.93.201.8]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a315eb1-56b3-0a2a450a0019-285dc908f789-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:33:22 +0200
Received: from CH0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:610:77::13)
 by MN0PR12MB5812.namprd12.prod.outlook.com (2603:10b6:208:378::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 14:33:18 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com (2603:10b6:610:77::4)
 by CH0PR04CA0038.outlook.office365.com (2603:10b6:610:77::13) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18
 via Frontend Transport; Tue, 16 Jun 2026 14:33:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 14:33:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 09:33:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 09:33:13 -0500
Received: from [172.21.53.33] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 16 Jun 2026 09:33:12 -0500
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
 b=I4XpuVQvgMEHFuw7CR1YWWyszNXYEKyyst9D93HEXbhgod7OEDIsqkDOsXqpiRQ6cujC1/2B9ySf5VmD3mg9VrGnwld06QdrRW5jVp1PoWx84lwP0dXEVPQ7NZbTgFhpiJOGkz2UJIctND4tOM2qAHAeTlux14BxA2OCk/1vWcDbolzwY0e4Se+Pb7TTiPdVwQHGeYSVf0OapKKyG6XEkwScAuQmdOVkE7ipXh+8Y7UCOnGTen/z3jiTj1vUU50WeR/pFlDVf8ptswYRdMCtajJuWpWx94YP6ayejB+JB9iXEz8QX1jB6rPRghSyTUhAwtoyb3jjWeAxpjisGJMRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q11PU8q1qzWMsLlxK/9Gad50f9CBRAa4NsAtVvxEGUM=;
 b=tzrkgUsi8bEFWuVgv5R6uJmLVlpq6ROAioPMLxcKwqaI1h0y13CRx5d+46i0Hem2j2ArcY+HR570cE7ISBTYnppzglL9Q1iQRBYHag6BN+NFJcqBW49VFERzpZ0yxDSLVmM6jxwc0ag7HGAqx0GtEO1N7Dc11+e+50M++xsHr5GNRhg+bmc4JfSgqoz2o+ewB3VlFVCL6uMI74JBEoPiDwB3Ph9Wga4A8WJqyciP4Cf0s+KBGSMifE5PDcat9+SzXlby1icYMOG8J22+4PRO3lmoldn9GZ8cRsu+dsbTQydy23kuK/Us7RZCkQX9MO1CAOPG4M6pDJjxG3/KQENAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q11PU8q1qzWMsLlxK/9Gad50f9CBRAa4NsAtVvxEGUM=;
 b=TwcKqwP5qVsepFny9jb4vd3qNdNHEhkQPg1UqKb0DVFOReYvp20j+bUcU/xNpnBTf5nhtlIuP4aSZAdDvJ8EGJ2eOZlkVx7lb7p//D5i1vuo8OXwkvchwb/61iE7qp+KrsjZBL4/zyE//H6P6ys4Phpzdw1cW4m3UJF9k+HcQCI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d0d2eeb1-e94f-4210-a9d3-e7c9b4c3ade2@amd.com>
Date: Tue, 16 Jun 2026 10:33:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] Revert "xen/cpufreq: fix usages of align_timer()
 in the on-demand governor"
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <20260615193944.19392-1-jason.andryuk@amd.com>
 <1fbb67ab-09f3-4924-b6aa-139fc5d1acc7@suse.com>
 <ajDxhjCed3cQ81od@macbook.local>
 <a20eb654-8d77-4778-ad1b-09424065a69b@gmail.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a20eb654-8d77-4778-ad1b-09424065a69b@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|MN0PR12MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c6a4e8-7bfa-4d8c-540a-08decbb4354b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v7EpW0Ue1OHEi5RwJ+XzWElHiZJKqBT4k6ca8KdR/f99YLD4eP0dlA4Cw2oDcQV0gdMHmY1cHXuBzkvhzzcDyRa8LykNI0hJPDdnD5n1cODfASorK0l1o/GMTRkxQzHXx6EghLKKkvrkCR4r9OLL8qLJZJY7w7FpC+MCeCoSZi9ZQhXpfHWFokmPxTbbWq2ZvuUdnTiOEdL4Mgz6MLhO+AODyHKRRFr+9wbl0/YMZgNRwgbHYvMUDdRI7C4uaG3n/Z+GmDn9PXqgatlNZcyRhFdxaczwB1GXf8O2GVumsQnsE3kblRS4PfOkR1E9zyPEn0oSaW5KmIFCVyjanTsqh+bkn6q643H7E9vJZ+S4YH1ihRlO63UgLOEj656i8RFhuZ5cGCoX2nC4V8cfJfa9+e7FJWHrLhCvguGwRm1ijOvE4mM6315MBpGSDghFexuF5oUYZZzygK3VspIHqEkaH0J7DJ4QASxU5W07Iq/Z22t1Gf+1ipjDPvtAzUSMsNB1NbJifliu1Ang/6HphVIk0FJ9BEg0NScouz4zhTU/0C84NtcieI0QdlgAYYVWSnocdZrecP4RA6pxhmQp6RPM3ewgm8KzQbhSYl/E8UUn94B4kNZ2CGp32pe12ji1cJ5c3Uff8DynTxohkwIoMSXKPw0MWs5Tve0IqEZFC+F4W7FPWwaX4Km+jq6NSpkLey72Sl/oYWAdD3QNNyPHWHleIsHwhpiN6wgxZmyXovMpw0M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g6GOUuOtXN8EvDCSOKB/Jt5LThIrCbOixeSqxUncLRs6pibAtQZuORL+65fKlRxtwEavCucHYey9QH+FozFhWOP03LoWfd/9kA72uokCQkDEcknCMNFI8plLEwCigUB4Dow34/OXT+K1/kSodEQ//K8QbAQPB9P8uXHSNMQ+macgTrBAzNElVj4ZKNkpVFSOGPX5x4+ehwaN9k62PgutNFo2rLXqLQ9PhTDTrMvZu9qJNzdjk3egGRPBPfIO+DgBFj2IRUGuK/QdgDikJZVgG33l/zGN9WMKnUxEyqfs27TyYCY80jbDD65nRoj4O8C2NFxs7GvA0uxg7o/aKTDH/3rE5yeDI5DOJix+QdpoVIlV+eNgeeaiIw8hu5XUN+wlD1bOteWMGDoR0oKVuAIPzkfM/NZugwqN1OkX1qBMPHmHQyP+qyNFDW6Huby+vM2c
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 14:33:18.1599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c6a4e8-7bfa-4d8c-540a-08decbb4354b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5812
X-purgate-ID: tlsNG-4011c0/1781620402-7D1848B7-98DA841A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1458
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,citrix.com,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A02236908B2

On 2026-06-16 03:31, Oleksii Kurochko wrote:
> 
> 
> On 6/16/26 8:47 AM, Roger Pau Monné wrote:
>> On Tue, Jun 16, 2026 at 08:30:25AM +0200, Jan Beulich wrote:
>>> On 15.06.2026 21:39, Jason Andryuk wrote:
>>>> The original commit showed a ~6% regression in a benchmark.  The 
>>>> call to
>>>> align_timer(firsttick, period) rounds firsttick up to the next mutiple
>>>> of the period, if firsttick % period != 0:
>>>>
>>>> align_timer(0, period)          -> 0
>>>> align_timer(1, period)          -> period
>>>> align_timer(period, period)     -> period
>>>> align_timer(period + 1, period) -> 2 * period
>>>>
>>>> So adding the period (sampling_rate) before calling align_timer() will
>>>> in most cases incease the expiration to 2 * period (sampling_rate) (the
>>>> exception being firsttick % period == 0).  This longer timer slows the
>>>> reaction time of the algorithm.
>>>>
>>>> This reverts commit a0ed5bcfbeee81c91c574ad484faa057054eaf09.
>>>>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Adding Oleksii for a release-ack.
>>
> 
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks everyone.

Sorry for forgetting to CC you, Oleskii, and mark as for-4.22. 
add_maintainers.pl does the right thing... except during the code freeze.

Jan, thanks for fixing up the indent.

Regards,
Jason

