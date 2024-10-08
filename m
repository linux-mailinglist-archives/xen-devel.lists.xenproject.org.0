Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8252C994C24
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 14:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813093.1225909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9g1-0006Hx-GY; Tue, 08 Oct 2024 12:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813093.1225909; Tue, 08 Oct 2024 12:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9g1-0006GR-Dt; Tue, 08 Oct 2024 12:50:57 +0000
Received: by outflank-mailman (input) for mailman id 813093;
 Tue, 08 Oct 2024 12:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sy9fz-0006FM-JW
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 12:50:55 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2409::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f351d56c-8573-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 14:50:53 +0200 (CEST)
Received: from DM6PR08CA0046.namprd08.prod.outlook.com (2603:10b6:5:1e0::20)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 12:50:45 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::ab) by DM6PR08CA0046.outlook.office365.com
 (2603:10b6:5:1e0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 12:50:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 12:50:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 07:50:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 07:50:44 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 07:50:43 -0500
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
X-Inumbo-ID: f351d56c-8573-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sakpdsTion0Q/fjPI4FhF9ZqdFrexHgMV5LB8DS7B1mPQ6ylF2qViFF5KNy0OI8LIscIDD3HbQOjr18dM9aXpgHIL3W+aXGLLxS0FHkPiDAScdigp6Ud3QYBCf+qY7f54tFnQFKBs5h6VqGka4ovGQdZLUlwX6R5FldGRGueW1AodYQMGymBKBsQfDWbluujfYhzJ/dr+kDj+t37xbHbDvoo8qWnzwzZ/LPK0YiqYIRMC6yt+h5lxBduWYwKWvjBn4kL6TR5dM8gFmgBwBJ5qEeEggOSmfWZ25DCMEcTxeh6mC+vQNeTBRCJFvrs7zoYEqZVWsN+S6AYCJv27+1CNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BxxHN748KKqosFLQm/xYgkzGxJlTZQb0cyL8d+Np04=;
 b=PanlExWs6WHxewcSsHf14JoTAinmr2Q0cajXt19KyfYPHHOSrqyfnWQB3ueh9o1Z1AvW48gwDf272IN8Jjg5dP5ryYKTK10XlgJ6Zm3D59Q0Z0WnftY+T0TFpHfHJTHOkAo33EGsw9Dg8lQnCLd5gAcbzgHRt9JQO2EHX9NA8qYp0iC0hTNNC/cP66ChaTALNtX5cLV3SjovJvmUPrT8XcwPm8jzL3r9oDFG/yiSuUCYZLauDM4FKUETv3KmWg9fWb+OlVrF62CRx13AdcRMncGCBiHIwwnLV62mFD7x1BONzMvwEtqZRhPkLZT10/IkrLgZ2Wuas9DL8THL5qDTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BxxHN748KKqosFLQm/xYgkzGxJlTZQb0cyL8d+Np04=;
 b=CnVuUoT2SXJB58X5I2AAtdkT+H8fINYMroibUkVwH5sq2b4IUqnoyDPbiffhPSFGkVjCQ4zog+T/e7EtKezW4z6znUj6EeQ2hrHBThXI573yxxBMj0gQgtVF9Zt2V3+0+0XD7HwKfY0P1DJjGTVUIpZUHxAxe8I/BGT60e7QHfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <62d1b295-6c79-48d3-a340-1544ca8ed534@amd.com>
Date: Tue, 8 Oct 2024 08:50:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/44] x86/boot: convert microcode loading to consume
 struct boot_info
From: Jason Andryuk <jason.andryuk@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-18-dpsmith@apertussolutions.com>
 <d0d8e53d-d2a2-4441-86cd-6f50aaa36075@amd.com>
Content-Language: en-US
In-Reply-To: <d0d8e53d-d2a2-4441-86cd-6f50aaa36075@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|CH3PR12MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 865bbfd7-c492-4ffe-0c7b-08dce797d38e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGZtTzkva2JremtZeldEd1VEUklUSGlscnJCWkFlQW1aRlBkQ21oQkVyUmdH?=
 =?utf-8?B?QmhHaTFvQ1RWM1hrbFAycGFBekg4M0JTZTg0dGRCRFBQWEliM0lvdldmSU0v?=
 =?utf-8?B?VU9LMjBuQWgrM3dlcVJkZUs2UDFQOXlyK2FoR1hpSUJtYVREWjcwTkVSVFZM?=
 =?utf-8?B?MG91VmFSaGZ1YmNCS05pL096aDUzMjUyQVVmTkw2M0s5cDNyN2FiTFJ2bFkv?=
 =?utf-8?B?WWZXV2EzZE5vc2FFRUlvektXelNMeG11bWdDUFY0bm1pZnRQTS9PUHRQdWxn?=
 =?utf-8?B?WEQzUmdCcStUVjR0OU5CQldJWDBFaW5WQjFkMzFWSDY2OGo0dERseER4a21E?=
 =?utf-8?B?SjZaS2JxNm9heGpKdzRDMS9sTFpQdlpoWVNkNmU3WHduR1BJMzNwbVV0MElF?=
 =?utf-8?B?NUV1aVF6ajVGUXRlWWdyMGNUOVgvNXZwWWNycDNjR2FLQm9QaTVVNFdoZ0Fz?=
 =?utf-8?B?ajBpZE5HMlJjSGJTSk5RRDRFR3hnc29TaHdGY0FXeEg5LzhwY1JiamlKTnZo?=
 =?utf-8?B?VUlHN1RwOFNjS0pWVnIvSExtOW5HeHg0NncvV0QvVWJpVklTNVpMNFQveW1K?=
 =?utf-8?B?UWl5blF5c280VTZkUlhXU1dERVdzbVliUmV6YVozakxkL1IxV1dDM3J1Uzgz?=
 =?utf-8?B?eTJWVVZScVdYeCsxcnFoU1F5Tk1qaFFRNzBZd1V2Y1R5SC9SdHdwVTA4MUds?=
 =?utf-8?B?UnN1dVVkU1AwbHdpSFE5VjEyRzh0UVE0MTZueGg0OHQ5VzU2WVdUZzc2SHVD?=
 =?utf-8?B?UzZMeVgxdGtwU0RERWd4S01WS3hoZnpXb09WVjFOZnBoWEhPTVJhY0Q0UEVz?=
 =?utf-8?B?aG5MSTdBOG82elUvekV1MTZxVXRNVUtHZlBrb1kvSW55YXpDMkYvVGdyanFX?=
 =?utf-8?B?eXltN2YxL3VjSXpyQm14aGhpQ21HNTZmZUpQRS9iMFh2SHpTejI0cm05UUJF?=
 =?utf-8?B?ZGYwdkhyVElJZzJhQk94NG0rc3lsZ242N3hCVnd1OG9qVHEvcm5LL1NyN1FQ?=
 =?utf-8?B?c3RrN3lWdlN4aWMyMVRUMzZEUHpiRUorUTU1WHJBRFl1R1k1ZWpySUp6NXpt?=
 =?utf-8?B?U3krSzNYTitsSVc2cjNoTVlxYzNkR2wxZzRBbVR1QVJ3V09VazVjT0V0MkJC?=
 =?utf-8?B?Zkw1VWxoMFU1eDlFdVpwT0RrQjBMMTB0S2Ivb2NjVG1MdXJWR296OTVIdzlD?=
 =?utf-8?B?d1NZTjNZeHVzaS9Vb0FtOHo1eVlja0tEY2diajd0b0lLeHRydWxRcnZXV0Zh?=
 =?utf-8?B?Z2dra0ljZGlOa1RyOXdaUCt1UG1UY0VobHB0WUpCUkYrZnZkWU1DeVRTRW5t?=
 =?utf-8?B?ZnE3MnVZbmNLR2xuVitBVjVWUUkwTUhEbHdvbnMvd3ljQ3hZb2s0QTRDbXhH?=
 =?utf-8?B?MGJRTXByNEp1OFduaHI1aEtCNFErZGVndEswNzRKcDlQYkw4N2RtdzUyWVd6?=
 =?utf-8?B?WkNCOHR3ZWpXTk13d01SeDYrWU1vdjZJQnVEUCtUUXNEeHBCQUtlbWc2VVAy?=
 =?utf-8?B?R2pOWjhUcnJZVCtrZi9hNWpIeTZCb2xEaVdKQlZuSC81T3p1WTBaVjdla2k1?=
 =?utf-8?B?MG9ONk9tRGRkeGYzZmYwQ1o5K2tuaGh1QTQrcHJOaGE5Q1hFbEZlMlNmbHZP?=
 =?utf-8?B?SEtZcXl4MjdKTE51R2RwMWcrMnNFNTNHWW5tRW5ydE5RNVIxVXRMUXU1QlFP?=
 =?utf-8?B?amdydDgxUVRyMmM0d0dBZng5aklwTWpsVlFSM1FxMzlPcDJaOUxKZmRFaDly?=
 =?utf-8?B?OEhNZDJ5YmRUdzc4ZUtzWURSNWszenJWOG1ydXlMQ0lBWXV4STZybDIwNXhv?=
 =?utf-8?B?U0wzQU1ROUsxaW9kSGZMS2VwendiWmFGT2xOWWc4YitWNkphQkJvcEF4ekxF?=
 =?utf-8?Q?AMLcjPvUl+kZG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 12:50:45.3897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 865bbfd7-c492-4ffe-0c7b-08dce797d38e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332

On 2024-10-07 17:22, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Convert the microcode loading functions to take struct boot_info, and 
>> then
>> using struct boot_module to map and check for microcode. To keep the 
>> changes
>> focused, continue using the struct mod to hold the reference to the 
>> microcode
>> that is used by the late microcode logic.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/cpu/microcode/core.c    | 37 +++++++++++++---------------
>>   xen/arch/x86/include/asm/bootinfo.h  |  1 +
>>   xen/arch/x86/include/asm/microcode.h | 14 ++++++-----
>>   xen/arch/x86/setup.c                 |  4 +--
>>   4 files changed, 28 insertions(+), 28 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/core.c 
>> b/xen/arch/x86/cpu/microcode/core.c
>> index 8564e4d2c94c..22fea80bc97e 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
> 
>> @@ -205,20 +204,18 @@ static void __init microcode_scan_module(
>>   }
>>   static void __init microcode_grab_module(
>> -    unsigned long *module_map,
>> -    const multiboot_info_t *mbi)
>> +    unsigned long *module_map, struct boot_info *bi)
>>   {
>> -    module_t *mod = (module_t *)__va(mbi->mods_addr);
>> -
>>       if ( ucode_mod_idx < 0 )
>> -        ucode_mod_idx += mbi->mods_count;
>> -    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
>> +        ucode_mod_idx += bi->nr_modules;
>> +    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
>>            !__test_and_clear_bit(ucode_mod_idx, module_map) )
>>           goto scan;
>> -    ucode_mod = mod[ucode_mod_idx];
>> +    bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
>> +    ucode_mod = *bi->mods[ucode_mod_idx].mod;
> 
> Why the dereference: *bi->mods[ucode_mod_idx].mod; ?  I don't think it 
> should be there.

Oh, the next patch shows ucode_mod is not a pointer, so dereferencing is 
correct.   Sorry for the noise.

Regards,
Jason

