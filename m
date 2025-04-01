Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57589A77F02
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 17:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934580.1336242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzddq-0008IE-TV; Tue, 01 Apr 2025 15:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934580.1336242; Tue, 01 Apr 2025 15:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzddq-0008GD-QA; Tue, 01 Apr 2025 15:35:06 +0000
Received: by outflank-mailman (input) for mailman id 934580;
 Tue, 01 Apr 2025 15:35:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=neKF=WT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzddp-0008G7-0x
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 15:35:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfc3c97d-0f0e-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 17:35:02 +0200 (CEST)
Received: from BN9PR03CA0844.namprd03.prod.outlook.com (2603:10b6:408:13d::9)
 by DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.54; Tue, 1 Apr 2025 15:34:57 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::f5) by BN9PR03CA0844.outlook.office365.com
 (2603:10b6:408:13d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:34:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 15:34:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 10:34:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 10:34:56 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Apr 2025 10:34:54 -0500
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
X-Inumbo-ID: dfc3c97d-0f0e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViD9SvXjABuJxiSbApd5LWmkEqiVZiepGgQuEp7xD6GychxWUNDcgrsG1iekMuFiQLRz2q/pdabYDs7nYZ8lNdrW9arR8/J51AVwbqFfexIwJ449pzz6/QheuU6Wpz8BHtktK/kbhS77Uk7Wn3SpZAVxEMbsAuXFy5Qq24DCHsVQoS4GcgB8Fe1UMmitC4dSTu3tDihnkiyb86F3rMo6ujbBjlZEM20Y42Z3OmKtEnQLA22nTyMRsYwnM0Ih32jubpwx/euddGhZ3A7yfyhNaBWp6REntF7zj3u3dvfQ6tReHj4HRS1A9FDesQIMGkhnNiJXPTBRkRqG2tgPy6d68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYv5beCDUcMPfKuKRp8fAjK/10MpX+8ppWciSJUjTnE=;
 b=je2z/BuJ/b0qGH4R8VlB9XsT99F45H4wYXKcgSFxM88Vug1R933apaMkbkNXXVTALezEFjyermmggS8nmnbFmf4RqvW4rfKPP8/+OYzhR97PTpobMQ9gK/MnaZWX9rzfy2MxExUGMhc/VL8xtDR8oStU1imv+Sl9RnZ3l7R4Toa+yyxg01qtB7nrge5c5JV7dtJlRA/s//EqFimPOLyGJUfGI6Ph8dYZSvzO0E8jJtGd90/0Cm3j845T3Zd6guVYRtafG2BHLSJJsb9HG3+vAdOv+QjCkqjyZfqezKGo0Oi9BuxijLQ7IUauJQTYfGofFHGQDOrX73J1M3XmzdmsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYv5beCDUcMPfKuKRp8fAjK/10MpX+8ppWciSJUjTnE=;
 b=R1DOgw3YrlDBVLB8gIJ07urDRXbeTUVwXSz5GEBf9tkMr15Cc97Bmiqb3oo+QT5ZteZqAI7u+9PsT+n1w7beyoZlEtOu4U+T09vTTn7//7Te7Z/JAUVQi2qAekMbIhNxjK3jtnem+wMhnMZGaMJ5UiaEd6cc212Gn32rJcegmhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3d800459-7762-427e-8765-044adbb6459e@amd.com>
Date: Tue, 1 Apr 2025 11:34:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/arm: dom0less seed xenstore grant table entry
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-5-jason.andryuk@amd.com>
 <6765d129-66dc-48d9-aaac-2b973edfda80@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6765d129-66dc-48d9-aaac-2b973edfda80@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|DS7PR12MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 961627ba-0daf-4a5f-1961-08dd7132c1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFBVYVVOQWpJbldCZ3hRMjJBeW9pUDNPaElNSHlyYkJDbkhYSjNDQ1FxT0lW?=
 =?utf-8?B?MFUwZEpINlhwS1pEK2lQaDJxVFkwMm9DelNLWG5XeWVyeCtCajVKb2x5SzFH?=
 =?utf-8?B?OVhOKzBQWFNDbmxuRzdjeXMwOXNCUlB6MkM4ME13VFE3SkRiOCtGdEdQZDZI?=
 =?utf-8?B?RElNSG81bVBlVkx5NkJ1aUVkd0o1QlBzc2V0ZUlqOC94RmphZERXWjBEVGFu?=
 =?utf-8?B?NHhDdkxUcWt2NFZBUzcwclVwMVZnMUMyTjBLQXQ1VitOa0tjeS9zOHRzUVVW?=
 =?utf-8?B?UndDZkdpdHZ4dUpSMDdxV09mb04xVldxbWNNQTZXYnphMVFsaW9YaGtERC9w?=
 =?utf-8?B?TXlrTGEyM1QwblA2RGloU3JiYXFJRkR6ZEhYMWMrK1M1bzNKUHRveWsyZEND?=
 =?utf-8?B?K09Vc3NtK2JBbXMvOFExTzJUU05neXRoYUVhWVYwOTYzbjlWSjd1TGIydVRi?=
 =?utf-8?B?MC9QbEJWQnFHc1dySEpKdHpTZEc3dFByTDRsL2pHUmNISEVpd0p6SEhQajNC?=
 =?utf-8?B?SWtrcVEvYTMzRW8xV0h0VTM5d3F3RnJVUmVzVHk4ZDZxa3k0RElyeVNwRXB5?=
 =?utf-8?B?WjNHblY4T3BUZ01JZTlGVkkxQUdHYkJwQ3B1L21Sbm90ZG1HV0hleGE0eHc4?=
 =?utf-8?B?VGNiVGhkcHJSV1l2TGpiLzAzd3lOY29kVTlsSGRwREVFYzVzY3VFNTZ1YWc5?=
 =?utf-8?B?S1ZGbE85c1NaTWlmV0pCc0EydDJTVHhHcnNvYWpYdnQzTWJTN1k3N1c5Z1kr?=
 =?utf-8?B?VVNjQmdaTWxCenlqcnRRZ3M1Z21WdXk3YWNwVFJTWnFsQkFDZzNkbkVOVkVL?=
 =?utf-8?B?YjhJR2RsemJtTnVoVnpIZ0E1a0wxMUNMdlhUZ3h5L2ZsbHpxSVc1MWV1TmhE?=
 =?utf-8?B?SDdtdlE3ZEs3bjdEem5HSmt4ak0zRFZ4Y3BBMURrK3M4V041T3dFY24vc2N0?=
 =?utf-8?B?SWJ4TDFrcFdUcWszVkExYXdZYyt3UUV2bFNJZFo2VENYaTJVbjF4MnlvTDJT?=
 =?utf-8?B?UkF5aWVGc09zdmp1Y3Q5Z1l6ejJTNHovMWgvSTJ0NW9UdldLZHZzMEVkK09a?=
 =?utf-8?B?bWhhVUZBUWZ6Y0hJa2g4VFNKZjJ6YXAvTGk1bmJEdVo3ZG80MHNJYnV3anhw?=
 =?utf-8?B?N3hkMnZBMEV2YUM1aDY4WmZPcjMyMG54N1Y1WXc5emhxTDl5dW8zanMyalRp?=
 =?utf-8?B?dEFuaU5laFI2ck9ITE0va3d6MVh3ZjUzM0JScTJYeEFTM1hTcDNKM0ZndE9X?=
 =?utf-8?B?cmlrMWFxL1hzR05wbVNnamxsRnYzWDNqRUlNT0dEQnBDVEdkOUtqek16d2Vl?=
 =?utf-8?B?Wkp5WmtuQWlHeXM5bVZqU0l1T1p3SmNDcVhBTWlpREluNHlXdnh1UG5iWkMz?=
 =?utf-8?B?dU55Q0hIbGdqd25CenVoM2x2MnNtYXR3TlpFU0FQUXZFb0JlSmdZeVVzWE5z?=
 =?utf-8?B?cGdPbnV2eE9yM3RQYktlUHZCbHJPS1NCY1Z4TkFIRzFHWUNIQWVhZE1WOWhL?=
 =?utf-8?B?ZnBTd2pHd1ZWQ0lUNnZsdVlNNkx0M3VMdFI0bC9hZW45czg5ZDdyeHJ1UmI4?=
 =?utf-8?B?bTE5WUJKd2NqcTJIUzd6eSt0SHFpWWJrTjJxaVptOVVBOGlRRHBJS3Uwa0R1?=
 =?utf-8?B?MTFjQ1FCekdlVEg2bE96alJWRmNka05oaDNWZjRIaGJXWlRtZk9IRWRsSGd6?=
 =?utf-8?B?cjNmODQxWWZPcjloSnR3dkorTW5EM2hiSHErbnRqWHhuaDRNbWxyOE5CeXdB?=
 =?utf-8?B?ZGlvQ2NUMVJ2aVJFYWJDMFFWanBJWitIcUl3c2R4eWJlN1NhOE1LdFVGeXRI?=
 =?utf-8?B?b0pXMUdrelJMMzNidEpWZTlpbnd0RlhMVDJzbjI3V1ZGUTEzc0hLdXBiYTdZ?=
 =?utf-8?B?bS8xeDNRWDZ4a1BWTjRHd3M1dk1aaERpVmViL0tQd3FWOWx3eXo2cUthOHBK?=
 =?utf-8?B?MEsreHR2SmFQSzFIQVFhMjhOMTBock9YVmthZmdZejhIM2VQN1RqMEFrd0Jr?=
 =?utf-8?B?Znk1dnRiczM4ck5rMnVROC9waU9MeksvNGNsS29yZjRPQ1puZ0RiSTZRdUo0?=
 =?utf-8?Q?DSW7Lz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:34:56.7095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 961627ba-0daf-4a5f-1961-08dd7132c1a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8252

On 2025-04-01 08:16, Jan Beulich wrote:
> On 31.03.2025 23:43, Jason Andryuk wrote:

>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -865,6 +865,10 @@ static void __init initialize_domU_xenstore(void)
>>           rc = alloc_xenstore_evtchn(d);
>>           if ( rc < 0 )
>>               panic("%pd: Failed to allocate xenstore_evtchn\n", d);
>> +
>> +        if ( gfn != ~0ULL )
> 
> Is this an odd open-coding of INVALID_GFN? And even if not - why ULL when
> "gfn" is unsigned long? The way you have it the condition will always be
> false on Arm32, if I'm not mistaken.

The gfn is pulled out of the HVM_PARAMS, which is a uint64_t.  It is set 
like:

d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;

But pulled out by:

unsigned long gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];

So your comment highlights that unsigned long is incorrect for ARM32.

While I realize fixed types are discouraged, I'd prefer to use uint64_t 
for the replacement.  That is the type of HVM_PARAMS, and uint64_t is 
used on the init-dom0less side as well.  Using unsigned long long to get 
a 64bit value on ARM32 seems less clear to me.

Thanks,
Jason

