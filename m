Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3D5983BF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389534.626526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfH5-0001A1-5d; Thu, 18 Aug 2022 13:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389534.626526; Thu, 18 Aug 2022 13:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfH5-000175-2W; Thu, 18 Aug 2022 13:09:27 +0000
Received: by outflank-mailman (input) for mailman id 389534;
 Thu, 18 Aug 2022 13:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOfDA-0007Vi-U7
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:05:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140057.outbound.protection.outlook.com [40.107.14.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bdd91de-1ef6-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 15:05:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4989.eurprd04.prod.outlook.com (2603:10a6:803:60::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 13:05:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 13:05:21 +0000
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
X-Inumbo-ID: 6bdd91de-1ef6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9H9F4F9zoKkTENlCjJ964chkTTVRTkUR1S2pOPBcSuY1fPvKaXteK5eT1D8FWTJe8r8v4DZqQJERokiR5zghNZHHJaFbrpBoWe7c83ln4naFlHTSYrgGphh7AF0GD/gOjWUkb8vXWZCrszWNJJjbpE8NbrqXvKSpdysNBADxQsocJf/AhDfiT6zSGCRrB74DT8cIVwI2AEwXcK2/kQqUhCEd3TZh4FzqUFbOHe9dzm1biaVj5lIAX1+R6WT/BlsFNOr4JRu1meq67ejT1fGVjCX82H7ralZ3VhJTdOu1qm8l6P9LvSyE5iSRAs5vj/fSo2OF9Ps+mqYER8mXCOXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVrB88mfrrp+goXNrmifXuSnpLqlyJcpZNv/ZM+AtB8=;
 b=ewzK4xKMaH+p906fWLPVCqwRkZ2fpiRDpEMdBpy3ZUh6Haem7ckNVWHQE3eKSXjpryOp0oBrdoKMulb48aVflDSDNvc9gWRvuyaQRu5dLiTMPOamTxRFtSY0Nldpab+x91JTIUJ30C/vMm22ShK9y0LwHY/XdVmncmqmShRdT+W2wWV6Fyaawv4DCmm3hMeC564eZxcQb0FY388DEY+swJpbGxJa+fUHfmiJKzDFGPaRxnFEiVpVLOYKTQmAQpzyUG4PI6dXPCmmajPi90NGSE8FTPFJzvV6kbhXH7ta8sdlbmcISPocEr0tWZ9EC2X1bZodazTjh+Hn7DfA8PdWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVrB88mfrrp+goXNrmifXuSnpLqlyJcpZNv/ZM+AtB8=;
 b=m7rCSSsuQEolH4IeXrbSyhsUjsl9XjeSMpfFNZ4L+gDk9gUMCGiKFYfUZqpaJL8uHBJI5KTuTyDmAAnqeQKzfYARKPA2xG0XgYJDcPjFwIhW9JvdP0lch4tofI0ZfZ/U93Mu18m5vxilEbmWwjTeHPWIKAZXeFtxUkbyogJhwHw09d7G0NOXbS2YfveUoRfxhKsf2eNh5DesDERl99Lg4n1qaH2Bo/TT6Y87Ath0RFKIjJX5cU4stAu8PzAA4fS2lUO1pHupSQ0z3Ch6k/RQhNhSwOYOhfxgkpbteERDMDRisn6tFnm+nyF64Izabfv+HuS2ku1L7YAJSz2OhxJfkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bdae38c-1dd4-558e-64a7-886b9bcf771f@suse.com>
Date: Thu, 18 Aug 2022 15:05:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 5/5] x86/mwait-idle: make SPR C1 and C1E be independent
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
In-Reply-To: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1feb2a44-05bd-4345-1a32-08da811a4e7c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4989:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G+u4ZFAQ3Rw18kb7IaeCisn6SMD+7Cq/eOEYWgP/RK1TkVl2Dwspjtgjm6ZO3vYC6n4I1FEi4ZCD8oa7mSAetjI2f5Z/GKKQboBKITpJFEOOzYAcYLiTy4gs/OB57ARxZKJ+j40woYH2KKjzFscAh+Z9mmePJ45/SAEqvOsHLiA+bFw319Z5eST4nK4294yreKLpUbKSE1FY8mFXU5Q1s7j5dqef2UyXRFq0sQiUIKTKcgna/034jqVgghcId0QYaQEX4CU6XX9x2wLh0VFxPGASlqaUYho+dy6+XWZSKxP6X6nEpVscRJ8fELMMsNOn9fI8yviergMi4PDfoW2rQDFdXzvPuB7mjIP8W9ucQW/wmiFN/zS1hXh2zcAt3zuuvOE+6xksZ6FDqE/TFMbrZ4dRfF7Sj98kSyIeu+ouAy+19cliu9hMfw7gUqMIyR4jqcFN3i1XEqdwcKhfpbXVcx6YFYypAl7kpOTfktbNY99dw3tw1HHSoJ/A11BNCKs0kE0wiAuFH9Txxiy6cW4IqM/NVLdWBcit3neJqlcN3n0ZM0ibeUPvCLoWYik3TGUXVJk2Wom84f29xO8odZtTHICiEDT/lfom/ClBCyYFdsee20NUNA05r+eChldiPMd+8mXHd/w9XDI/nps/Z7TP+vhu9ndb7ddweXL0ZHKfE4xW2f7tnVwXp4cn4V/cHPON6TH3oQwRCXOrIj7kOfItmq3nMg6UAlP2pAXVTDoAdj2gmJCs5NvDXArVq5q3xXFk1swabJ6k2y6AIb26z6WDJf2LiZ3g+O5e4SwmFviued4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(136003)(396003)(346002)(2906002)(66946007)(478600001)(66476007)(8676002)(66556008)(6506007)(41300700001)(31686004)(186003)(26005)(2616005)(6512007)(4326008)(6486002)(83380400001)(36756003)(86362001)(31696002)(5660300002)(38100700002)(316002)(54906003)(6916009)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OS8vbzFmb2txWmlZWnRDcGFLMVY1WTdyOE9PVnlOUTZjYm44S3pVV2tBcU0r?=
 =?utf-8?B?YTNxZ0YreGpKRFBPaFhqeHFNcWhQRDk4MlUvRmNTd1dRNEExLzZONXE3cm5a?=
 =?utf-8?B?cDR2Z2RIMkphV1RHNTdhOE9VazJMNWdSUEpsT0hNUmVvOGlDMXBZN1UzTTgx?=
 =?utf-8?B?ekNvUGUvR2IzTG1Pbk1jbmt2WktmV0hRZm1nSjRydXE0QkNob1hOSElHd08y?=
 =?utf-8?B?T1o5b2RWZ1FsUDJIRDFiYmEzdFhHdkdzYWtvRHA0d05JVFJDc1JYWkZnSjBH?=
 =?utf-8?B?RG13WEl6R3V0MC94MzNhMmVYa21mRnp6OG16Smd3a3BseFlqY2prVDM4MGpM?=
 =?utf-8?B?MkNtVmpZZC9UMXVUL2w5NUF0UXE3WUpVQUJjRDMvOU82azlWMXA4SERXb1lP?=
 =?utf-8?B?aC9wbmFhRm1DRmFYTHBFNkZ0cC80Q3hxZnhQOXhVa3NnMlQ2aDNWaVpwakJu?=
 =?utf-8?B?Kzg4bzFSQlgyZkJyTTVRcHVqQmV4Ti9uZjhBMGxNRXJhVzlKcG8xUU5XTDU0?=
 =?utf-8?B?UWluSTdEb0ViSmhxYkN3dzRoRjU1N3FGdEtRWDhEVVBWSEZwWlRCWnlYcXBw?=
 =?utf-8?B?eWh0ZitlS1JrQ1UxY0hVNjNPVEIrSEE2bUkycU84UnFsVGVrdEM3MEY0K2VV?=
 =?utf-8?B?Tng2RlpFRVAzTnRGR0dyMEZzRXZHQjRyVTBMaWpNSjV0dU9HZUQ0a21RcEl2?=
 =?utf-8?B?Z0hmbHFjVzV1NERabUpkN0wxSzFhczViNy9EdEtvNm1kOTN6Wlg1aU9vM05R?=
 =?utf-8?B?Q0xTMWFMK2dwQmswYzhpclpRK0ZERWhTTDhrYTBBejlLTTlaS1o2Ti9XOFhp?=
 =?utf-8?B?ZW9GME1WYWxMSzhrak1EaGR3dEtqMzZCa0FCbVVqNXpvbjJDUU9iWEJVRU9U?=
 =?utf-8?B?aDM1cWthWnpob3NuR0pBaTlweGdCaE5VbkcrSkZUM3NXa25veExkYTBVOHgw?=
 =?utf-8?B?eVFXL043d05FZ1ZlSkszSlIxVGlueW1QTVRwZlpWUXV2dEVycXhjeEljU0Zq?=
 =?utf-8?B?RlpsdWRzOXI3NGtubVJxNHZRQ2lqNktTcituZXJzSm9sd3FaNjVwNTBRRXRD?=
 =?utf-8?B?LzFsWGl1SXJ6dGdNeWVuOTl5Zi9lTXF4QXlQZXVqdEFyaG9hSVhwT2J3WDFj?=
 =?utf-8?B?dVlkczVJRzFlTXY4RHhEOTVsUlV4dmFmWUJzYjdnMzA2R1VJU0RtU2ZrMitj?=
 =?utf-8?B?NkdWTkVkdVdEVXcyMmIvS0VvRUFyN256T1FXV2xjbWpuYUdyMEVBMU8rejlw?=
 =?utf-8?B?MEdHSTV5Qk9RejJhMUFQem03bTIvVFdDOHUzbU5BMDJjTi9Cb0tNSDdoaFdM?=
 =?utf-8?B?ZjVOVUZFVHV1UE1yWDhGZ0V6WjZBTjFUWk9QTFVPU0JZTkh2dlFsYXpmRTAw?=
 =?utf-8?B?clhtVmlJZ0U4MmNBdU9LaS9ENHRNRlN1VlFoVCtSTkZEUHUwbVdZUUN1SURV?=
 =?utf-8?B?OWpKZFNmZVIyY042UDYrVWNrWE5QUlh2V1V0WVBQYWpPaThWM0tUVWdNNHhx?=
 =?utf-8?B?RnNVeHdFUVozL0huUGVjdmhVR2x4ZXpKRUFidFJ2ZndwYm1teWtUSzAwY0VR?=
 =?utf-8?B?bHJQRW9oWDQrcm5CS0lFN01XTUFZWUNBQWphTjhnUzBqSXVlME5hbTJyUWdE?=
 =?utf-8?B?eTVCQTRuaURKS09vU28zaG9lUHhLT3BvTGdQZUVrTGYyNkxpNWVsMGNnRTRJ?=
 =?utf-8?B?N0lLS2x2WmRBNC91Z25uelR3VTdieEcvSGE2cFh1dFl5VUpyVW5yTVIzUjZq?=
 =?utf-8?B?ZWtrQnNhUG1zeDFWQk5EUEFkRXN6c041RnB4dXVlcExkNEx4dHpKRWJOb1ZI?=
 =?utf-8?B?TE9DekxwV0hRSXFNZWlQbzdWVERROXo1UTRDQm9vQ2FSWUZZSW9XZ2VraUM0?=
 =?utf-8?B?cVNUVzhoM0o5c0xxNlZOZ1FqMnJxOE0xK210aDFseGJnMFI0UzJZekp5R1Ba?=
 =?utf-8?B?M1JKYXBnZE9OVXl0NzFBNDZGb2thUHRwRWx2bFVwY0dXM3JCb1BiQktWdzYx?=
 =?utf-8?B?Y213djE0dkxTVUJVL1NuVG1JWko2WkQxZmx3MHVHdE9GRUJ6eGp1bHR2K2Vn?=
 =?utf-8?B?dXZxSjZjTnpnT1VNUXA2aldqRCs1ZkdPLzBHQ3ZlR0g1L05ndUpPUVBCQktn?=
 =?utf-8?Q?wo10v9cSmUnWQTopEfc2tpEhq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1feb2a44-05bd-4345-1a32-08da811a4e7c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:05:21.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zFiSjyZya3WCA2d4GeQA5S17T6aU2n9bUhLlhO/mLAOxfb3NavKSLXsZikgxSPOK++3m2GmNhNj5dDnw9roUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4989

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch partially reverts the changes made by the following commit:

da0e58c038e6 intel_idle: add 'preferred_cstates' module argument

As that commit describes, on early Sapphire Rapids Xeon platforms the C1 and
C1E states were mutually exclusive, so that users could only have either C1 and
C6, or C1E and C6.

However, Intel firmware engineers managed to remove this limitation and make C1
and C1E to be completely independent, just like on previous Xeon platforms.

Therefore, this patch:
 * Removes commentary describing the old, and now non-existing SPR C1E
   limitation.
 * Marks SPR C1E as available by default.
 * Removes the 'preferred_cstates' parameter handling for SPR. Both C1 and
   C1E will be available regardless of 'preferred_cstates' value.

We expect that all SPR systems are shipping with new firmware, which includes
the C1/C1E improvement.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1548fac47a11
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -689,16 +689,6 @@ static struct cpuidle_state __read_mostl
 	{}
 };
 
-/*
- * On Sapphire Rapids Xeon C1 has to be disabled if C1E is enabled, and vice
- * versa. On SPR C1E is enabled only if "C1E promotion" bit is set in
- * MSR_IA32_POWER_CTL. But in this case there effectively no C1, because C1
- * requests are promoted to C1E. If the "C1E promotion" bit is cleared, then
- * both C1 and C1E requests end up with C1, so there is effectively no C1E.
- *
- * By default we enable C1 and disable C1E by marking it with
- * 'CPUIDLE_FLAG_DISABLED'.
- */
 static struct cpuidle_state __read_mostly spr_cstates[] = {
 	{
 		.name = "C1",
@@ -708,7 +698,7 @@ static struct cpuidle_state __read_mostl
 	},
 	{
 		.name = "C1E",
-		.flags = MWAIT2flg(0x01) | CPUIDLE_FLAG_DISABLED,
+		.flags = MWAIT2flg(0x01),
 		.exit_latency = 2,
 		.target_residency = 4,
 	},
@@ -1401,17 +1391,6 @@ static void __init spr_idle_state_table_
 {
 	uint64_t msr;
 
-	/* Check if user prefers C1E over C1. */
-	if ((preferred_states_mask & BIT(2, U)) &&
-	    !(preferred_states_mask & BIT(1, U))) {
-		/* Disable C1 and enable C1E. */
-		spr_cstates[0].flags |= CPUIDLE_FLAG_DISABLED;
-		spr_cstates[1].flags &= ~CPUIDLE_FLAG_DISABLED;
-
-		/* Request enabling C1E using the "C1E promotion" bit. */
-		idle_cpu_spr.c1e_promotion = C1E_PROMOTION_ENABLE;
-	}
-
 	/*
 	 * By default, the C6 state assumes the worst-case scenario of package
 	 * C6. However, if PC6 is disabled, we update the numbers to match


