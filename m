Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CF46780B3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483098.749033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzFY-0001ct-4P; Mon, 23 Jan 2023 16:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483098.749033; Mon, 23 Jan 2023 16:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzFY-0001ZV-1D; Mon, 23 Jan 2023 16:00:48 +0000
Received: by outflank-mailman (input) for mailman id 483098;
 Mon, 23 Jan 2023 16:00:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozL9=5U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pJzFW-0001ZP-Bh
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:00:46 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1690fc83-9b37-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 17:00:43 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB7696.namprd12.prod.outlook.com (2603:10b6:8:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:00:39 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:00:39 +0000
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
X-Inumbo-ID: 1690fc83-9b37-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms3d8eB4JQjzPsYcN/NRll4Jnyiz2ffPIvxHvGe3UwttY8lh8TWRC4ZmfCFIp3Q75WNOwkn6JRkZiqJdKMG+WFCimXXE/Pmu1RlwEm83Zzmqm5UmRX+kI7gXN8I4D+CveZgJm/nXKV9ymV0VTrH5/sf0iPAy4XsJNdcocXHidO7f+fnrmOmrujRmC3AsLPuVvjL8MTD2VVTuLZ8BbYYvlLlu14oqKXEL/gQKLy3Ya2jNLVvn2xjyc/MTh881FYhbXNmpFKTUUvZ7AEr8kulU0ng54x6/Kow6KJ9EFI/0i0Mi0280FvtTsegVBgR2EcAulqsKtRzmmJFnsHSx/ixAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYPbFfiKt7zIfjPeWWObD4SdpHnEiPChlMM5TGKPguc=;
 b=eTsqjIphwfRdQCHpLj1eb7ozI7+0C7afzHsmppoy2+yrWJWX/6s327j3P6WF39PuCgWGcIhyk+UGAsYDhlh/oi1yqmWVNzESEyGFCrcfUXcBtP4sek4mQjtkE6TxJcnhLOtdWuUkJT0MmyCkap7lL/0hjrUuvqtiWGqfoBk/XnVxpw9eQrwFosmnYOng2fl5HzIGmcISLZmOocicsnmIHmXYZq+vihXoCOa63f01y+IXWRgDexFYDtfYk37i/lAVNFr//J6u2UIRTtq6qLLgE4nDqV2UPXMAaqIuSkiZ4W7rJnF2r4142bv3RqB1SgvPv3giLoM0ixOJzXpWO88q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYPbFfiKt7zIfjPeWWObD4SdpHnEiPChlMM5TGKPguc=;
 b=p0bxbIN6fFlp1sJ8lOOMzWbZAcEuHljEqU1VKfRoN3j8F73Z0xYPVls9oyX/nJKaTgEW/UFqDncM4id4+tvVMcHmxTwxkONZtPRh74sQRCFJQ12UfoNijMpY9WPzkQezIZToIDT6qnw0AZZVqzKWV8S8B2SF4JEbkq8joIA9vPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <be452e89-506d-a187-f918-4e7450c52bb1@amd.com>
Date: Mon, 23 Jan 2023 16:00:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] automation: Modify static-mem check in
 qemu-smoke-dom0less-arm64.sh
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org
References: <20230123131023.9408-1-michal.orzel@amd.com>
 <01297097-d8ce-a22c-a616-f98691d3ad4f@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <01297097-d8ce-a22c-a616-f98691d3ad4f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 5989a562-fdb3-429d-6e97-08dafd5af8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	15Nga2UeoDJvP+LW4bZiE7M5SFwbrSLhnu3r6xJXPivVXWJavz6lwfXtgbF1aSeZK1XeVEXH4s4YitHavLUyiWxQU55VHEpwSek81cInd5PT9CYc7ukVEdhBEHD9NvLcIvgNIBCVyVWIHBUwdosEJye2G5wR9auvuJ71EwxEwmCoPYbxhRpEpZRHHy+vGbXl27yfcu/lAcujz2RGCS9soWADs3L2pWIEfyHefU9ZfXHWHYb+fmW22j+hC9filPAIwxMVOahJ1E5JXAHdgZZQDbi4v9anKxmnzVUiZxixBfOqdgLp4pIEasxfIdoa1ddL+1+idADlCapjK/6HmFkQrTzkORNt3Cf6P2/RfU69ekHL0cSz8McyqS9ODsrBa02w3m5P7SlfeI1+iaHMWqJ6o2T8ErM/oUQ9rABWRp2eI4ZpLhbvdGR3Jzsi3uJSOOpOtVodmf3UQ/IEjG6o5b/NsHQDBPjnNDcphhAd/2d45Ge7obaNmz+nBQLyE7R1PtjJPYCNfTuTBuCHm3aWwqmTgIZg2NK6PzwL1QaWohGMr6HFPa5UEDOzzHfbqXj7pMhh8LJVqTxbta4lgdsLf0O6rl/rqXgbJMtzg2gi1oKa+3OGSxWtyGwUwtxmTyczV4WHZ29c7cNOZ8sRPupd4kU1ZBbMf1yvOpSoQhmY0MNXjglWdEFFigXU49qyDIyefW83o3kyDt+h/ee7kAHustUHxR2bEhLEFll2ML81on2wf3PNjEKuhaDK0VmVeBazVE/E8BPyYfZXIS+nDmgxi1HcJjFBjsl81H4Iv8iIZS89x4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199015)(6506007)(6666004)(8676002)(966005)(38100700002)(6486002)(66476007)(66946007)(66556008)(53546011)(186003)(26005)(6512007)(478600001)(4326008)(2906002)(8936002)(5660300002)(41300700001)(83380400001)(316002)(31686004)(2616005)(110136005)(54906003)(31696002)(36756003)(45980500001)(43740500002)(139555002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkdPVHpjWWFweUZ2SXNra2VROVRDUllCVncvNUVPSjFQcFdJdzRlVnRiS3Q1?=
 =?utf-8?B?K0d0VFJtYi9TSXVrOVNKZm5jcnAzT1VwMEtkbFY4S1VaMGd2eU1WMjRpamw5?=
 =?utf-8?B?VjdDMVNFc0xlMDlkODk1SGViNWZJYTJMLzJycVU0YkNoaXprRlBFS3lwd0Ey?=
 =?utf-8?B?a2RxRXBDU3FNSGphMy9lMlhGQ0YrN1h4Qzc5Qnkzck9FNTdLRHlyeDZYZDQ0?=
 =?utf-8?B?SXFaak1aNjkxMWRFUzNvenlTU0tsMEdpU2R6UE1YR3FUWU8xNjlpZ3JaT2U4?=
 =?utf-8?B?b081ZXRvQTBMNnRsSDMxN29vdm85aDVBekUzZCtUbmM3T0piQjJLUU1JVng4?=
 =?utf-8?B?NFlQZmRIRTY2R0MzM3lHbzRxL0lkbjFTSkVCN1YwS1FoeTgwcFZjelJvUW15?=
 =?utf-8?B?blpFbHVNNCtmREU1MFV0WENhSVpydEoxUGdKeXBkSVBhdUNYYllQUFZvbzU3?=
 =?utf-8?B?M2hUTGowQ3N4em1UTk9va1NyUVB2U1hOZXp1Q2ZEMjNqNldDSVZnRE1WZXpG?=
 =?utf-8?B?L29MU0xWeWltS0hRSDNSS0lZVzRXYVdRbTZoakl4b2JpMUZOeEZPUmtiRGFW?=
 =?utf-8?B?QVRSYXhWT0pWcVNSaFFTdW1EeTA0NGx6R0MySm1QbE1MMHVrOWNCTkE5V2RU?=
 =?utf-8?B?czc5cHMydk0zYlBjeUllRDlIcHVrYjByUlpucldNS2JlU01qMWhlSVdLZlV4?=
 =?utf-8?B?aEhOM1hWcXQrWDdTNTVyTTJoeTJ2U2NwbWcwOHB4VDFVNDBRczh1bVdDeHVR?=
 =?utf-8?B?c0g5blIyc2c5VjJocU9Pb0NGVDVvdHpRa1BRUnVIYkhhaEphbmd6Y04zNVlI?=
 =?utf-8?B?TEdHeWs5YzRpbFc1MXYwU3o0MC9hNUhLNWEremdtcndlT2hidHZyK3F0Sm1x?=
 =?utf-8?B?eFQ3a2Z6ZHNNb3NTeHM0ejlmeFZBUUdscUdjYWZFU213aW9zOTE2K2JaNHE5?=
 =?utf-8?B?MSttT29kZTNWZ0RjVmhUTzZQKzZxVXAzVjIvL1NRMUovbktWVFV1UmRtT2pk?=
 =?utf-8?B?UWN3Sks4a3p6R1FiQytqZXJFdURzckRZbDY3OVJkVVhPb2RZc1ppYWhYTFkx?=
 =?utf-8?B?cHVoMExFdkZiZ1pQMCs4dm1GLzdBNUsvRVhmUXBqd1F6azE5WElXbDg4dmRK?=
 =?utf-8?B?QzRHV05aK05HSFlNQ1czRDgrM2hka1JiRG9QSlJ3VkdVREpNZ084bjgrNlgw?=
 =?utf-8?B?eFZUYXBRRzBxeUR2M2ZVbDNpMStoSXphUU80N1R2ZExRWmgxS1orVG5qc0Ry?=
 =?utf-8?B?UnpLMHp1T0JnN2R5Q3NZRU5ZeFRjR2xPTklLbzAyZVBVanBGYkNiVHVCbXdt?=
 =?utf-8?B?NmRmaXd1TXNGQ3NQN085WngyREpseFFERUVwUkJ1VW9qbWRTUW9RRisrRWJI?=
 =?utf-8?B?Y291ZUZHamxoYkpTK20wcGgrQmNSdTEzKzZyYzhIRk9LTHBuVlE5K0NMUExy?=
 =?utf-8?B?NW1paUszK24wQ3h1RkxyYlZSdys4aXhBeTVtZHJRRXhORzdQd2JoeUp4R2N2?=
 =?utf-8?B?VW5MdVFjeHhYeHlXTEVNdzI2OW5MaEJWN1VhSE5RellqS2xSSlVVOVBJcW51?=
 =?utf-8?B?N3NYK01Rb3lCZ3NLejlGSDY4YTNZeWtlUjJDcUpYZ0dnNDU0UEhwbU8yTm16?=
 =?utf-8?B?eHZDZ3MwWXZEZHBGYW1vQTlpZ0Y0MEhMajVxem5oV0MwRTNmVk4vNkhkV0pO?=
 =?utf-8?B?WkxHNkJpMU40Q1JJNGI3eVZNZDVNZFpXVHAxOGdFNGFwdkEvTW0wUlFyQjRR?=
 =?utf-8?B?TERVNnZsT01NNUVlZkNPRTNBV3RuM2hmQ2pnLzY4djQyb1dQWFpqeXpxY1du?=
 =?utf-8?B?MkQyV0g1YkZhK0lRYkMzbHJ3cTZwVFMwMkVGd3UxNWxCdWJxWi9LSklKQTB5?=
 =?utf-8?B?NnphRzF2WnhZZ0pvdHYyL05uZEppeGFJMnluQ3pxeTlJYndLVWVaZjNVYlNm?=
 =?utf-8?B?WGFDVlNRck9GUWVyQURTa2RwRytqMmljU09Ma0hnMEs5bDg1YWlqQ25jZFVm?=
 =?utf-8?B?RitVZHlnUkJwekVzc2RBeU5JU2VHaS8yZUVHcENvL1YzU0hQeGliSnVyMkNk?=
 =?utf-8?B?bnVEdXJtTmdobjJReXp2bDJyNWU3OFUwMENUcWZISjlzUUZJcE9hZFk4bVVI?=
 =?utf-8?Q?WldJ05PzRkxq0LPS0iJ1W+uXK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5989a562-fdb3-429d-6e97-08dafd5af8af
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:00:39.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omWM8gxr1d2O+pT8Wrpwp+QSUHXl8YliIi6EmIoYikdFKDrE46uXH4u8foearUT9sAc44nweJdd1/7mdjCMCtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7696


On 23/01/2023 14:30, Xenia Ragiadakou wrote:
>
> On 1/23/23 15:10, Michal Orzel wrote:
>> At the moment, the static-mem check relies on the way Xen exposes the
>> memory banks in device tree. As this might change, the check should be
>> modified to be generic and not to rely on device tree. In this case,
>> let's use /proc/iomem which exposes the memory ranges in %08x format
>> as follows:
>> <start_addr>-<end_addr> : <description>
>>
>> This way, we can grep in /proc/iomem for an entry containing memory
>> region defined by the static-mem configuration with "System RAM"
>> description. If it exists, mark the test as passed. Also, take the
>> opportunity to add 0x prefix to domu_{base,size} definition rather than
>> adding it in front of each occurence.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>
> Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
> Also you fixed the hard tab.
>
>> ---
>> Patch made as part of the discussion:
>> https://lore.kernel.org/xen-devel/ba37ee02-c07c-2803-0867-149c779890b6@amd.com/ 
>>
>>
>> CC: Julien, Ayan
>> ---
>>   automation/scripts/qemu-smoke-dom0less-arm64.sh | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh 
>> b/automation/scripts/qemu-smoke-dom0less-arm64.sh
>> index 2b59346fdcfd..182a4b6c18fc 100755
>> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
>> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
>> @@ -16,14 +16,13 @@ fi
>>     if [[ "${test_variant}" == "static-mem" ]]; then
>>       # Memory range that is statically allocated to DOM1
>> -    domu_base="50000000"
>> -    domu_size="10000000"
>> +    domu_base="0x50000000"
>> +    domu_size="0x10000000"
>>       passed="${test_variant} test passed"
>>       domU_check="
>> -current=\$(hexdump -e '16/1 \"%02x\"' 
>> /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
>> -expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
>> -if [[ \"\${expected}\" == \"\${current}\" ]]; then
>> -    echo \"${passed}\"
>> +mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + 
>> ${domu_size} - 1 )))
>> +if grep -q -x \"\${mem_range} : System RAM\" /proc/iomem; then
>> +    echo \"${passed}\"
>>   fi
>>   "
>>   fi
>> @@ -126,7 +125,7 @@ UBOOT_SOURCE="boot.source"
>>   UBOOT_SCRIPT="boot.scr"' > binaries/config
>>     if [[ "${test_variant}" == "static-mem" ]]; then
>> -    echo -e "\nDOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" 
>> >> binaries/config
>> +    echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> 
>> binaries/config
>>   fi
>>     if [[ "${test_variant}" == "boot-cpupools" ]]; then
>

