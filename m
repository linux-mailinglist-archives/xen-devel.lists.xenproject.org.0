Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D6B10D04
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056169.1424348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewlD-0001nm-Q2; Thu, 24 Jul 2025 14:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056169.1424348; Thu, 24 Jul 2025 14:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewlD-0001ln-Ms; Thu, 24 Jul 2025 14:17:27 +0000
Received: by outflank-mailman (input) for mailman id 1056169;
 Thu, 24 Jul 2025 14:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v4Oj=2F=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uewlC-0001lh-90
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:17:26 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2418::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa00c46-6898-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:17:23 +0200 (CEST)
Received: from CH2PR14CA0057.namprd14.prod.outlook.com (2603:10b6:610:56::37)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 14:17:20 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::ac) by CH2PR14CA0057.outlook.office365.com
 (2603:10b6:610:56::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 14:17:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 14:17:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 09:17:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 09:17:18 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 09:17:17 -0500
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
X-Inumbo-ID: eaa00c46-6898-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFUQwFP5v9J+yjHtNPIKTMGX9XzKfPKhEyLUzeEIy9Xrcw7BFKaFvXU4oIGUQ3Dp6/57Zj5P6JBO6L+p4VIitFN4c5SV7TmUQNifeyKTcqhaapORYw19sQsfnpz6ZxikD9jKXcTqueCdfuNjc04hNv+RfGRVCHXBtIoVhd0M/BYP9xlX/9MNFvqQvwXUGL39LvVjfpFPoZa5jn6UtPQ7A3uuFmdLxLEq6idjuewWNkPAXepuip19+6zjDSvp9r9RNpnx2sehQhUzYSWQeGfOHw4mGrdE06fy1nuupfLDfXPJDViUFB82/3A+JsAKUDtuRZB5ocRuc0oBk0L/cSlkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+Gcat/R3lDUwKbGUxh6Wj/h1AAMKDVZEiB4szJdajA=;
 b=ouQHiWTIc6eXN+h6DyNtJfBAxiHizsSlV1s2wB0YAMo9+VImK+EvaZ2vi9YndZnczUUjAWByIfDNGKMoHo0wehxEGpOtOrMYEF9mr9TwcOhA4j4MoKV7Kn3vESq4BGP/+/3F7w0riR+IcIfXAJ67MIxaSWZ/BV3U/0hzHKnHJZVvZoCzU93CaMSsWl/Iwj9MJti09buo7dsK5pBjcOz5VpbJDNhiMnZpfTzsWdNvjZMeRpygyWc2ShuGUrygKVcC0IEuIf0EKeGstARZ7/liRUJJ4ndEGDYuE+/gyTKdZpo0NnHqxKKJMP0NbzZ0+8URBfYsPfJFDLKbexoe9Jg12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+Gcat/R3lDUwKbGUxh6Wj/h1AAMKDVZEiB4szJdajA=;
 b=ot//SONPfPRMLnP4ob01GrE+/o6jgBCAXgCxEvRa4nRUCMrToSFm/FVNRqg+in5A/ihrmCYC18c81fQWQIc+fLPgDrC+6BVCtAQPUegXQbUpP1eIOvy58RuPRsisJ+2pBXixeMCdN51BGVqIxqzn5ladYZCO9lLDMh+84cX+j84=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0642628b-0cbb-4f7d-bc04-9f32c67b5965@amd.com>
Date: Thu, 24 Jul 2025 10:17:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/19] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-op
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
CC: <ray.huang@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-17-Penny.Zheng@amd.com>
 <87d9d5a1-39aa-46ca-9f2a-9169a2ef7a6c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <87d9d5a1-39aa-46ca-9f2a-9169a2ef7a6c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9ef449-b16b-460c-fd5b-08ddcabccd4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTNaS0tBNmZDWGhjY2VBRjgrVmEwUEd2b1VFMUUwZGJZYXZ5dXJQWDFZeDhk?=
 =?utf-8?B?TkxJdkhaY2xlaWpCYStPOEhobHRuVzNyS0VCTjZsekttUnFkNVp1bi9XdXNB?=
 =?utf-8?B?KzNha2dndWxkVHV4RWVCWlltVHpaaWVuNzZLQ2hmbXJhK2ZGQXpXZzVKNEpE?=
 =?utf-8?B?cDNBdVVqa3V2ZFBvT1JuZkNWV3ltWHpMOXJXMmZtMTlxQW9UWmRNTzd5S2Yr?=
 =?utf-8?B?WUtESnpzRWUyTVNlYlI5MW00Q0VzS0FNeWRrSmRPY0xaYzBHZHJkTlR0RXRh?=
 =?utf-8?B?M1BPaXB0UmJXWjFXVjJ0aldPUVNISDJOeWxGNlNQRFVrcEVuUytkN1ZBd0xI?=
 =?utf-8?B?YnBIMHJEcVJ2R3dmb2JENGN4L0JIdUVUVmE4L2phWGR0TVRUblJYNGM5TXBu?=
 =?utf-8?B?S0M3QUlnWGVNUzcwWFNmMXNHWEEyM3ZBU0pLMm1yNUx3WlhsaDcva29BTzQz?=
 =?utf-8?B?UGJKYWtJZysrRHZ2WGJBYzU0U2dFTiszZjlPemdodFpnRHpEc0tiR3lhWHBX?=
 =?utf-8?B?VDUvRlJ2MGd1MVF4ZkdUaDVNOXdHbEdWMGExWEgzZnJ2ZmY1SkVDcFdiRjVS?=
 =?utf-8?B?S09JblR2YkVJbm8zVE9YdUl2TGpXNlVDSjNzVVBRYythVmJ2czJZWEE3WXUy?=
 =?utf-8?B?QWZINEVwWUs4ZkZnQ01LTFd0QWprZWt3MFV6MDlrUEJ4am93Zzc0YlE2MkRZ?=
 =?utf-8?B?cWJuQlBXaDNaZWdiblNwaFFRTldWc2wwbWJocnlNMVFDY2pPUzhpbGRMZGF4?=
 =?utf-8?B?ODRKNFh3UDNIVmUvcHd6YjR6WE0xR2RwNlNWRk5WNW1OOFFZbGNocTRaVVE0?=
 =?utf-8?B?RDU5WEplZkVpajBRUXBXeGd4R0xVQ0ttRzJST09hNWtjWURUUDl6QllBS3Yr?=
 =?utf-8?B?cnREdWE2anFYYVAzMmdaeDNNVXg0V01hNHJzeWQxczY0UkNqSERXSEhiMTlm?=
 =?utf-8?B?S2taVFRZV0dLbDBNUjJRenJIN1lYMFpmRzV6NWw2S0RyU1JPODJRcUszb296?=
 =?utf-8?B?aEhVcXdlUnl5bXI3M01hR2RXNk9lTHRSQ1hIUWs0eFZPOVlNWnkzTlNSemhq?=
 =?utf-8?B?dUpCejdFQzhRQmVXUTBoUlJxUWxER2tRN1dkS0ZRU2pRdm90L2o5WEZIV0lv?=
 =?utf-8?B?TVpRUkF1NktCQ29yQkNDcU12S1lrbkgvMkJsVzVqMzQ2a0FPbWpZTXhBSi9r?=
 =?utf-8?B?TkxvUnlmZVpnZ09UeW5IbGNwTW9uZzFZOG44emNvcEN5UWVkNnFNQmJLQnFJ?=
 =?utf-8?B?RWRYQmc3c3ZMZGlUeWVHWWpPa3dPL0F4NHVlQ2hBNjNWVXRYVW9UaUVpZVBH?=
 =?utf-8?B?aXN6MEdEd3RENlc2ZDJ2TDFWeW9Fb0F5ZWVxMVdOTjRaYlhaL3NlbWt6a0VM?=
 =?utf-8?B?R2ZwZThHZlQ4amlvbmc0UVhjNVhhY0RvS0h2Q1R6OFp6L2U4MERUT1l1eTRu?=
 =?utf-8?B?ZDdFNG5QWUQ0YTBWd2NyU2JMc1Nwb3ZuamM3dnNBR1AyNGNuQ21nQVdkZGU4?=
 =?utf-8?B?TUczbHBwRVRXazRtYyswRDJFdHRnK3Bwb0w1L3BxbUZpbnp4Ukw0UldzR0t4?=
 =?utf-8?B?dGVLUTJHQUNKN2VaRDJpYTZFS2xYckhVOGtOcThlUi9xK0gzSHF5THZ5Uk15?=
 =?utf-8?B?by8vUzBHbWMyNHRISDlVcU04UzN3a1FQN2dFZ3RkWW1Jb3hMcmRydEtPSlhU?=
 =?utf-8?B?aDBVUCtJYnNkMHJiTHI2REcvKzM2Q1R0Yk1lWW04MnNoTWZwbXRjNW14VWMr?=
 =?utf-8?B?Uno4cndwT29TYUxUQ3VUd205NHozU2FJVGY1RUZQd0E1SnFyNXVKUnVJQ21s?=
 =?utf-8?B?cWVtdmdnaHltNElQQ0UrZG9seWNDMlBiMUhmMDBJZUY5d21ZMDF4OStYNG1C?=
 =?utf-8?B?dW1HcHdYSzNIRW1TN28zcHRFMWRGK2UrcUNOZXowOGJRUGc2b3Rjd1RXU3cy?=
 =?utf-8?B?UnlFcEtpR2Q2b2U5K3p3SUVRTm5PTlpNYVIxdjh4VW9kVUVQRUN1Y0tGNWkx?=
 =?utf-8?B?TkxndkExcDU4L1hPa0pUYnV4R2ViL2NIeERrMktrcE1FVWNXTWpMUjBaMjVC?=
 =?utf-8?Q?XdXGwL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 14:17:20.3029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9ef449-b16b-460c-fd5b-08ddcabccd4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238

On 2025-07-24 09:31, Jan Beulich wrote:
> On 11.07.2025 05:51, Penny Zheng wrote:
>> In amd-cppc passive mode, it's Xen governor which is responsible for
>> performance tuning, so governor and CPPC could co-exist. That is, both
>> governor-info and CPPC-info need to be printed together via xenpm tool.
>>
>> If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
>> out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
>> make xen_sysctl.u exceed 128 bytes.
>> So we introduce a new sub-op GET_CPUFREQ_CPPC to specifically print
>> CPPC-related para.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

>>   void scaling_max_freq_func(int argc, char *argv[])
>>   {
>>       int cpuid = -1, freq = -1;
>> @@ -1576,6 +1622,7 @@ struct {
>>       { "get-cpufreq-average", cpufreq_func },
>>       { "start", start_gather_func },
>>       { "get-cpufreq-para", cpufreq_para_func },
>> +    { "get-cpufreq-cppc", cppc_para_func },
> 
> Didn't Jason also suggest that we would better not introduce a new command, but
> rather make get-cpufreq-para invoke GET_CPUFREQ_CPPC as needed? Considering that
> as per patch 15 the same information is already printed, I think I'm a little
> lost with the need for this separate operation (and command), and then also with
> the need for patch 15.

Yes, but I thought I was repeating your suggestion, Jan :)

xenpm's show_cpufreq_para_by_cpuid() would do something like:

show_cpufreq_para_by_cpuid() {
     xc_get_cpufreq_para()
     hw_auto = HWP || CPPC
     if ( hw_auto ) {
         xc_get_cppc_para()
         print_cppc_para()
     } else
         print_cpufreq_para()
}

Would that work?

That way the single `xenpm get-cpufreq-para` would return the current 
cpufreq data without the user needed to know what is running.

Regards,
Jason

