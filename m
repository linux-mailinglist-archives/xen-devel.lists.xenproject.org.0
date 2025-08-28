Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345AB390E9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 03:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097335.1451730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urRFv-00033t-70; Thu, 28 Aug 2025 01:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097335.1451730; Thu, 28 Aug 2025 01:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urRFv-00032Q-4F; Thu, 28 Aug 2025 01:16:47 +0000
Received: by outflank-mailman (input) for mailman id 1097335;
 Thu, 28 Aug 2025 01:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urRFt-00032K-NA
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 01:16:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2009::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7d4d4b3-83ac-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 03:16:43 +0200 (CEST)
Received: from SN7PR04CA0061.namprd04.prod.outlook.com (2603:10b6:806:121::6)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 01:16:39 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::8a) by SN7PR04CA0061.outlook.office365.com
 (2603:10b6:806:121::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Thu,
 28 Aug 2025 01:16:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 01:16:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:16:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:16:38 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 20:16:38 -0500
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
X-Inumbo-ID: a7d4d4b3-83ac-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYfohkLBilHt15ywWWkstnXjriH1PomF3sCF6hIYOEhTFsn6sfQTLMyQFMNWLqC663V0k9vmhQIl+e5rrQcMI6w5il0wffjrzK4pHDBwLMF7HrTLklYIMy8b/JtdAq6h4KN72qht6RRD1HY97xTIwU7ZZm0ydMAahdLICUj5MSS6P5zd9320pk2QVyDgIjgOnkOjytDLJdFjVC+3UEuDo61Qa/KYJlQYzn17xlQPjgDz+ES8zXiQD7RfRCowLVp4htZEOUnIRroRo4A/JacY9KSpozP1Xp8sI8LTHOA0jj1QC7oX4Eg2gdqgaYASETOptFfzYsZEuNolD3JfQOegTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQuakn5Cx43K0xwmprAVCgxQPF9KfmMWgWrhRwDQfMc=;
 b=xB0sJgw1aTP3bkOLL60MsVckCWyvHSKmzLIyJXEX+DFCQRybHL37nBBqMq2tR6HudKKsYoS1fK7/ur+J0Q2x4T+dkjgmAqf+q/RlsqKpoLntxx589UHEEKtHK69ZndmKYMXkwHzxcib2aF98bTfdp2vySlFPfXfB0jhIu2AOt4jbBGTqg36tapDWCGKu4ti77FGfOvsSUUbdMG0hdREOv+KB97pgocxmP1q/GIUMI1ymkUW50jOAmxgNiGL51+wJIxrjuaHQTahyneXcasc01Fmj+gTOZGu8N8+bsELEub7vhqXsz+x3g1RXV4YnheMMxVYt7jNlF5P+qOxfRMjRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQuakn5Cx43K0xwmprAVCgxQPF9KfmMWgWrhRwDQfMc=;
 b=BifLOWcen5d8wZxtLO5YKfWblL9PrgXXOOHUBKGvQtcNtLlRMCMqzgCy3MbtpXLxUaOSkFel4F4VXLtLRSTevit7JUYFtkGDfE2LrpygX/qAdXVmFZbN8N4J6o+a021ubtrhTqgGvufqv1a2+oCiKvLKce4vx6VwkEUqGwFG6+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c4ce1651-3881-4af0-bfe4-294917c31c9d@amd.com>
Date: Wed, 27 Aug 2025 21:16:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: preserve errno in libxl__xcinfo2xlinfo()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <e567c234-473d-40c3-86dc-53317812baf7@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <e567c234-473d-40c3-86dc-53317812baf7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dbd86b-7b74-4f46-4dcb-08dde5d08a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnQ3Y0VTRWtmcTVONFN6MTNIOXI4VS9KM0c5T2U1TXN5VmxUQTliVER3OUdU?=
 =?utf-8?B?N0kwUmg1VnlKTjgrMTNoNGxRclIxNHFWU0Fndkw1Y01WekJmenV3UWRSUU1I?=
 =?utf-8?B?R2FyaXQzc0R4YW5hZ1hld1J6VWtjbjZRdnhudGVLYlEyZWtzbEN0a1UxNG1u?=
 =?utf-8?B?YytmUndLVFhIdlA1b1B0dWRFRTc2RFh0OG9pTnBmaHJuWmZNUENUbmtCazFZ?=
 =?utf-8?B?MUl0VFdjNStMeWVUTE12VHEyTTcraGk2a0tOWW5jWGs5anp1UGU5RTloWUhB?=
 =?utf-8?B?MU5wYnNyOEpoL05xT3JXbW5ZU0U4cTlUZGw1RUREQlNqMWpBNEd3NEYvMVVV?=
 =?utf-8?B?M3pZZDhER1R2RTcveEF5R2hrTTl1WHFMbXFEOEM1b1JDdVdHYUNpMXVFN1ZZ?=
 =?utf-8?B?TVdoNmJHTWFackxEMTZXd05NajUySFgraW04QjhKcU5JOEh5d2UrZHB1OXU0?=
 =?utf-8?B?VHlCS0xlYTR3SzVwajNHQWpsMVpSdlA5Z2l0SjFDWW1UOUF2SGx2YkhLMXNJ?=
 =?utf-8?B?emhoVHZHcWt1RDQvcjJlMWVpanR4dWR1dmNCSVN5a1d5TlhwRi9iYW5PTFdj?=
 =?utf-8?B?N082Y2ZXV2grUHlMbmE0cE1WZ0JMT2VobFluVXlpakxxUFhoN0NENHN1cjds?=
 =?utf-8?B?TUFvM2RYdFVpVDdaUUhONEFHdEswaXMrNHNERW4zMVg2VlhLa3lSdUI3cGIz?=
 =?utf-8?B?VWVROXo0eUJNUC81ZURIVjZleHd5VjR0NlljcDJrbml3QWdnM3RPT2hCaUxK?=
 =?utf-8?B?alFFLzJILzBUREZGSCtNbEhza0IvaGtFb21UaGVNaWJVOG9BSWtWUUpSTUor?=
 =?utf-8?B?QWs1bnB3alB2VldObDBTRjRycUtOSS84bldHOUZ5SXBXbzdnM3hiWnJlc1hQ?=
 =?utf-8?B?VXFlVG0vMGhPMUI5RGMvd01JUnJaaU9rWGN2MXpHTmI5M1gvWWE4WFN2UlJZ?=
 =?utf-8?B?NFhDY1BPTHhRbzJ2Sy9HRlpDb0pzSnk5NHZhRU81ZWhkaEZRa2FUQ0htbW5J?=
 =?utf-8?B?OGJhV1VnMGRZQjVuN09nMG9RL1VESTI0bUZGUlFLc04rZ2lmTEtxVE1PSGZt?=
 =?utf-8?B?V0tnQi9FL2xIQTJKZjNqSjJnTHZUVE1SRHpWQ0xyY0wvTG0xeXhzS1JPaHl4?=
 =?utf-8?B?a1lFVVJNb0E2UklWV3crWUxnUG5GeUpnR1RQOEU2MDRoamFsdmYrZ281MW9h?=
 =?utf-8?B?eExtQ0tNb256S2h0YVlIU1F1NjJJWE9leEhsUUhOWDg0b0dnNEVLRytaQldM?=
 =?utf-8?B?VTlMT2lIY0pSS0RnaFBzNk5lNkdsN2hnckt5cmpjbnc5VUE2OW8rUWUxOG5x?=
 =?utf-8?B?RlRKV203R2w0Zno3SFdEUTdtM29XLzlGY0cwTzI4RlpiUjY0QUUwZEdPU2xU?=
 =?utf-8?B?NFVhdEFhSURmcmNrZVYwZk5FbHRSaENwYzR0OFZNeXplOVM0THBCNjNLTVA1?=
 =?utf-8?B?TWFMVUdORjNKSHBHNXhlWlJ1TmRuallqeC9TcUd2S3IrK1dCTnhlWnVrY0Nh?=
 =?utf-8?B?MzdNUlJKTlhUdmVFZ1dCTE5HVTZsenNLb1l0OTIvaVkyWE9oRS9NQ1hZVU9Q?=
 =?utf-8?B?MFZTcVhDK2JqMVh6N0lmYzErNEhsNExRci9BK0RkYnhlYjc3bWI0eEx4cjlF?=
 =?utf-8?B?a3JTK3krcGlTT296VkxlbVhGWEMvcFIxY1pkdFRBUDVHMlZHaGhXZWZaQUhz?=
 =?utf-8?B?TndDWlJYd3piN2RqMUovZ2crd2NPeVR6cjBkUjNnQ3JaQUlDbmp4NGxlanNl?=
 =?utf-8?B?YWpoMG1PSUVBTUJhRjlRVlcyMGlrdGVlWGRHZ0pBTmlsTHZkMkU4OXpsL1pl?=
 =?utf-8?B?KzlrbEczRCtWZXVvRDF5VjFSQjA3ZU1yMUw2V3BNSndlY1B2TjJ6dkRqczMy?=
 =?utf-8?B?NkdGTVJadlZMSGV4dXlPVHFvdGVsV1E0RU00SDVOWlhIM0ZKalFPREIyQXpa?=
 =?utf-8?B?QW0rL3Rnb1RIRFg1UDNrR0JoZm9GWHZwR2xudnc5Q25VQkYrNFViMTJxT3Y4?=
 =?utf-8?B?cmU0ZWRCM091MDhrdm9Ka2lEeGxDUnVYcVdDeXFsMFVIYSsyRU9kSU1VdlZj?=
 =?utf-8?Q?BAa8jg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 01:16:39.6350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dbd86b-7b74-4f46-4dcb-08dde5d08a8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

On 2025-08-27 01:57, Jan Beulich wrote:
> Callers observing errors elsewhere may be confused by the ENOSYS that
> the Flask operation would yield on a Flask-disabled hypervisor.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course I don't know whether clobbering errno is perhaps deemed "fine"
> in libxl.

I wonder if it would be better to special case 
libxl_flask_sid_to_context() to preserve errno on ENOSYS.  flask 
returning ENOSYS is common, but libxl_flask_sid_to_context() can 
legitimately have error.

I guess this is fine if we want to use this approach:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -277,6 +277,7 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx
>                             libxl_dominfo *xlinfo)
>   {
>       size_t size;
> +    int saved_errno = errno;
>   
>       memcpy(&(xlinfo->uuid), xcinfo->handle, sizeof(xen_domain_handle_t));
>       xlinfo->domid = xcinfo->domain;
> @@ -284,6 +285,7 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx
>       if (libxl_flask_sid_to_context(ctx, xlinfo->ssidref,
>                                      &xlinfo->ssid_label, &size) < 0)
>           xlinfo->ssid_label = NULL;
> +    errno = saved_errno;
>   
>       xlinfo->dying      = !!(xcinfo->flags&XEN_DOMINF_dying);
>       xlinfo->shutdown   = !!(xcinfo->flags&XEN_DOMINF_shutdown);
> 


