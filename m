Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D851F73B8FD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 15:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554355.865499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCh50-0000TM-2o; Fri, 23 Jun 2023 13:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554355.865499; Fri, 23 Jun 2023 13:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCh4z-0000Q1-VV; Fri, 23 Jun 2023 13:44:01 +0000
Received: by outflank-mailman (input) for mailman id 554355;
 Fri, 23 Jun 2023 13:44:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h2jJ=CL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qCh4y-0000Pv-Se
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 13:44:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff4d741e-11cb-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 15:43:56 +0200 (CEST)
Received: from DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) by
 DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Fri, 23 Jun 2023 13:43:52 +0000
Received: from DM6PR12MB2618.namprd12.prod.outlook.com
 ([fe80::5d93:3c0:a046:a2dd]) by DM6PR12MB2618.namprd12.prod.outlook.com
 ([fe80::5d93:3c0:a046:a2dd%4]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 13:43:51 +0000
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
X-Inumbo-ID: ff4d741e-11cb-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFoSxA9P/bSIlwVtWr7BvVNecCKTLOHrC81JbbE3mL4qLQvFDQWf5ndZK6Z83aG/Xb/gTbLqk8Diup7o+u81+1HZbumBbc4pSaXeaMZjh1vuyi/lfVKwvJIW5pLgRsfUkQ9tPs//rk8cUxSyc+3myv1wRIF/USjklebWSbVphHarXzteIw2rj5+D9XY0fSqTr9Dwm/Je50XOkTesGuLVBkqfNmcYcU630csWbuvz/1ZdUt6uSD0VS44AKx2BONLa/MOKqu8JOCM3ydAPrwzmJiOJerZhFkWrgKSsEs0WcUeqOUdaw8ebbh9dp7z1Df2Z2ZW375k6GG2+B5VCT/S+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6TMpsY9UzQWqypnmJrlcFqSKooAHnszDAhKCVMKBX0=;
 b=bWUeRGJKGV+ajz3SWWgyJEPbqRUYnNPqT305hP3zJOCj9nFj24AxXNDE1Dqg1i308iuJwARgx8YDPVvuMzkRdtHibR8/4DxZ7yZA7ix/Z/0gC2a9PKuVJ9rJ2J+Vjs3DPgfq9ap2IxKcZejh4Ui/j2vgwBEBCey7Ptru3k7Rx5Wb5OBR3cx8OkDl78x2UQ2Lci1pvDREX33+MoDv0ZCmUAlm3rk2oZlzz5nunnspU11sK3e7Ko/W3kbO9aj+plHbRVU0Hfkonq9AxiXrfCN9aXbomc0w81XRYwgRbodJNMyYKU7gLwxIdxFhMdKonK36fTiM6cOwVUYL7hwFqvsZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6TMpsY9UzQWqypnmJrlcFqSKooAHnszDAhKCVMKBX0=;
 b=0o7p5ydKkCBZzDUknDBH+Ll/8tvtjwYSp7+n5ohwYk1h3d7TtX8ilYQS2NjhodH+PhO9yB86ubMlLMORwuspUDo4aekFpuisfw1SpGT9DetPxcamfbydQmstZwBkbpN3ieK6Fkhc6PGvvdgRPaUQQ+QMRmJ3XI7DLDEicLVtlLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <75008370-7141-757c-0768-14b654724f07@amd.com>
Date: Fri, 23 Jun 2023 14:43:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52
 processor
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
 <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
 <d7701ff7-4cee-800a-69c9-deb8560804d3@amd.com>
 <3b7f584e-700e-4598-f36e-51a96140323e@xen.org>
 <bdaa74a7-8707-62a0-fcc9-24f80772a104@amd.com>
 <030fc5e8-8293-2306-06eb-9275c2a2c9e5@xen.org>
 <c7ca9356-ffd7-8fdf-3a69-5267f2957815@amd.com>
 <2fbf6885-5bb8-4b49-522d-eb265349d4b7@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <2fbf6885-5bb8-4b49-522d-eb265349d4b7@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::16) To DM6PR12MB2618.namprd12.prod.outlook.com
 (2603:10b6:5:49::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c0256e-8ad3-4d46-c392-08db73efe13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HFVbVfjqZ0QcviHWhBfFa8DDTPyy+Rk6vGb7CLMU/kSVTuiGawpFzWI/bi/PjKrRZpUOdz2eIKhLlrOnVlhb/41VaSxT1nv2oxTPjmFMAKiQd6LlsNjP9SL4fIBdiT6gpJD1UQOiQKCIqjy6q2KuOKhmrPP+46sufyGRS5kVMMCp3MQ/WCz/eNzKF41iJKIigOw7v/HI4GS4kCpGrm6uYpa79ASJz+//DljC8PlOb1WOY19kedEFyTLiQmDNn1z73JfhY5kh2F9Ksui0RC94ZGnxGWJhcRS15wGc+SYzuRS77AZrQBes4IMcBgFA3z6LHOzKlP/gxQzPuYy9Pc24B1FDgVzvUtOYYxOWM6CSxPGXpG3YNnvXL80GbI1fhwEnANARjBloA4rfkwoPhFlDovBOcoZXSc25r9DftxZXl7quIk2GJXSJ14Km2Y56XtXnQuKBdZ9JCnnqAuBa4/kyVH7cfPAOd9vjwbFSBy4W6f3BTTPhGDK+KveOjllAvpw2+SDvbIn3+pHh7loTb58xaVCL0NtkB7KFLOXs43wjIXUuZEQsZAP8gwCHlo+KW5yzTfy0Rh43F+TIdtRysGM34LqNMcy/O2vDuXcZ8MEBcdbMJl+CQOa8XoIUsCmj++6bFhp0I6pzajJkTTXshr99nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2618.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(6666004)(478600001)(4326008)(110136005)(26005)(6506007)(53546011)(186003)(6486002)(966005)(6512007)(2906002)(66946007)(8676002)(8936002)(316002)(5660300002)(66476007)(66556008)(41300700001)(38100700002)(31696002)(36756003)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlRlV2IyWDNUd3pEb2U1NUxxVzdobTI5RTJHbmFFeVhQQ3Z1NFFUZmo4SG5z?=
 =?utf-8?B?NHpnR3JCSEtRS0QxREZEWlQ2eFRucXFtV0tKbXdkVDRmaXI2Z29zc010Qzdk?=
 =?utf-8?B?b3F6SEpSS0UvUXlTRGlHNHVIL0g2WlpkWjFKMEF0cVNGOHdqRHE1YmdOYjlR?=
 =?utf-8?B?bWp2UjJYK2VzeFJkSXZIcjUzY1B3b0RmL091YkQ1THlmMk1tMU5jYkN0eHBI?=
 =?utf-8?B?STRiT2ppSFM3Q0p0aEdneVZMM3FUQWx2MDhYUXFIZUhjSGZ6L0ZCby9FRDRy?=
 =?utf-8?B?NVl3K1ZJZUYvSndPblVGSnBEOStNaE1BL3A2elRWbDZ6NTQ5MXBaUHRGd0FC?=
 =?utf-8?B?VFo1RXlTTHYzdWRkN0RzM0RRMUFsY3hPYitxMFlydHVrblNtd0wvUWxlUUoz?=
 =?utf-8?B?MmhBNHBiWUpwMEVveEhhRXQ0SWhZTkNJQ0FKb2RNcURsSE9uNEJwckQvaHpC?=
 =?utf-8?B?NXhHRmxyQlE4Z3hKSkNrbWlXU2d4ajc3ZS80ak53Y3NWc3FIK2w4RFMvR012?=
 =?utf-8?B?cHhzbGlSM3RWdFhXVWRIUlF0YTdDWnNTYUVtd2xkMytQZHRtZXBGTzYyZTNx?=
 =?utf-8?B?UFlOZFlJS09EamtkL2FHaVlFR3N0alhCL2hjRlZwcVFKRzZGcDNqM25TKzZp?=
 =?utf-8?B?V2lzTFhUQ0dSRGpLZk1FdUxtdmE0ZDJYU3RxZHpvczM5M1BiTWMwc2FxNnov?=
 =?utf-8?B?bnJFbFVua3FHNjhmUExQTXBTWjB1K2krdGw4RFZSc3V1MDRFbWFQcUhSNTh5?=
 =?utf-8?B?dzZST21nSmRWYnd0bHpzTDBOZFdSSE1HRWFQajBCV2xJTmM0ZlB1VTZyamQ4?=
 =?utf-8?B?NFN2QlA1M2dXeWdOVkp1MG85d2pxUnYrV1Qxd0xsQTdPTmpRYTMzaVVnZ3p3?=
 =?utf-8?B?RzRtWU1RRDZnU1M0SzBCYmEvT2JuTjZ2WU1SZ1pmNlVKWm5udTFqQWtYVU1R?=
 =?utf-8?B?SzBSZ0kzSlFYa1lscEd4NEMwUHh1VUwzaW1ReGswbWF0YW5RelZPQ3dkRkNP?=
 =?utf-8?B?LzQ1Z0xaT0cyK0tuMTBTZjlEeUE1YmkyYU93MWtxeDRHbkI3WEhRWFA5dHBk?=
 =?utf-8?B?TW9mV09nZmZ4eTc2Ny9ENDRDWnVyb0U3cE5rTlBzTzRla0o4WlN4amphTHhW?=
 =?utf-8?B?NDdxVENsOFR5WHVjYjJkNXQ5R0ovYVB4VGxDQk1wR1pQTk9vMFFuU0x2c3dz?=
 =?utf-8?B?bVZGTmFNM1p5eFRUTG9udHVWSFFSSjBORVdFSS9XQmlENDVPZFNGREoyZ1dO?=
 =?utf-8?B?b3dmSExabG5LNnhYQW92RnZDMjRmK2x6dThsMnFUbFFrV29IU1VWTDRxMTZm?=
 =?utf-8?B?eG9GMDdGVWhJa1ZDZlJ3TEplYVFnN3VoYmhQcXJ0eFlPbDZMd1lMV0F0OU8v?=
 =?utf-8?B?MVBNdTNyTnVkUmlhMWVYK1JodU9zMG5LZGdwS0VrbEJUTktVUk90ZW1vNDhB?=
 =?utf-8?B?U0V4YXV4Y0toOWFyN1pzY001V3pOUzg2WXo3ZE5pTDgrOGlmNWRISllqc3Vn?=
 =?utf-8?B?MEF3aXltT3FPdnR0VDdrTmFtTFJuT1RLRHk2WXpCSWpZbWt6eGorUE9uZ2Nj?=
 =?utf-8?B?ZVRNY01EQjBLT3pUZWhZNGdGcXBJbVhpbUk5Mk1YSzFoU2FzL0lrNXJleFdF?=
 =?utf-8?B?REU5NnlzbjdLR3JxYTJkVkl6c2dYdVNSUWE5eUFTRWV6WEtEZHhHcHA5dE5T?=
 =?utf-8?B?S2FCZHYrdTZxUjB5VUhJSk5LdXJaQjh3MUIzT0JFdUNhSnV0cXlBZUM3L3du?=
 =?utf-8?B?enFqNjFLaUUzdnNOY0ZhM1ozWnY1cjlZMTQ1L2RmYzBxcjk1VmFVK0ViZkMz?=
 =?utf-8?B?cG5lamhDZkxvZ0Jtb2FtUFB0R0FFNzkvaTdGRG9UMkorWVVxcmFZMVVsWnVO?=
 =?utf-8?B?bzlKNDY3aHhKR3VCUU1BNks3UkhtZTVpTVlEVU45OEpQQ0FTTTduUFFIZVRQ?=
 =?utf-8?B?Nkg3TUJZM1RkajZzRHVoN3QyL1hWajI3MlZnZlM0c0dCZHJCcXpERXhqTGZ3?=
 =?utf-8?B?RmlzWVhrS2NwZFV0MWQwY3ZOZlNQbmVtay8rRG5XQUlYT1F2SmpnMXJJVXo5?=
 =?utf-8?B?aXBQcG1lR2JlcC9zY094YWZFdUJRY1NITGpYY3RKcDZGQStWY2RhVVM2TWFG?=
 =?utf-8?Q?M35ae+clFIWrs3o7MJiz4gJD6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c0256e-8ad3-4d46-c392-08db73efe13d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2618.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 13:43:51.8424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGGibLuBUD3NHDUW4ynVAL65oeKVx5rbKUvTSIkAPTpuiZQ6mNkaOBpOM6RBGMd463MbezXoyDExcVkTNGp8vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288


On 22/06/2023 17:32, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 22/06/2023 16:41, Ayan Kumar Halder wrote:
>>
>> On 22/06/2023 10:22, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 22/06/2023 09:59, Ayan Kumar Halder wrote:
>>>>
>>>> On 20/06/2023 21:43, Julien Grall wrote:
>>>>> Hi Ayan,
>>>> Hi Julien,
>>>>>
>>>>> On 20/06/2023 19:28, Ayan Kumar Halder wrote:
>>>>>>
>>>>>> On 20/06/2023 17:41, Julien Grall wrote:
>>>>>>> Hi,
>>>>>> Hi Julien,
>>>>>>>
>>>>>>> On 20/06/2023 16:17, Ayan Kumar Halder wrote:
>>>>>>>> Add a special configuration (CONFIG_AARCH32_V8R) to setup the 
>>>>>>>> Cortex-R52
>>>>>>>> specifics.
>>>>>>>>
>>>>>>>> Cortex-R52 is an Arm-V8R AArch32 processor.
>>>>>>>>
>>>>>>>> Refer ARM DDI 0487I.a ID081822, G8-9647, G8.2.112 MIDR,
>>>>>>>> bits[31:24] = 0x41 , Arm Ltd
>>>>>>>> bits[23:20] = Implementation defined
>>>>>>>> bits[19:16] = 0xf , Arch features are individually identified
>>>>>>>> bits[15:4] = Implementation defined
>>>>>>>> bits[3:0] = Implementation defined
>>>>>>>>
>>>>>>>> Thus, the processor id is 0x410f0000 and the processor id mask is
>>>>>>>> 0xff0f0000
>>>>>>>>
>>>>>>>> Also, there is no special initialization required for R52.
>>>>>>>
>>>>>>> Are you saying that Xen upstream + this patch will boot on 
>>>>>>> Cortex-R52?
>>>>>>
>>>>>> This patch will help for earlyboot of Xen. With this patch, 
>>>>>> cpu_init() will work on Cortex-R52.
>>>>>>
>>>>>> There will be changes required for the MPU configuration, but 
>>>>>> that will be sent after Penny's patch serie "[PATCH v2 00/41] 
>>>>>> xen/arm: Add Armv8-R64 MPU support to Xen - Part#1" is upstreamed.
>>>>>>
>>>>>> My aim is to extract the non-dependent changes and send them for 
>>>>>> review.
>>>>>
>>>>> I can review the patch. But I am not willing to merge it as it 
>>>>> gives the false impression that Xen would boot on Cortex-R52.
>>>>>
>>>>> In fact, I think this patch should only be merged once we have all 
>>>>> the MPU merged.
>>>>>
>>>>> IMHO, patches are independent are rework (e.g. code split...) that 
>>>>> would help the MPU.
>>>>
>>>> Yes, that's exactly what I intend to do. I will send out the 
>>>> patches (similar to this) which will not be impacted by the MPU 
>>>> changes.
>>>>
>>>> So, that both as an author/reviewer, it helps to restrict MPU serie 
>>>> to only MPU specific changes. >
>>>> Can you suggest some change to the commit message, so that we can 
>>>> commit it (without giving any false impression that Xen boots on 
>>>> Cortex-R52) >
>>>> May be adding this line to the commit message helps ? >
>>>> "However, Xen does not fully boot on Cortex-R52 as it requires MPU 
>>>> support which is under review. >
>>>> Once Xen is supported on Cortex-R52, SUPPORT.md will be amended to 
>>>> reflect it."
>>>
>>> While writing an answer for this patch, I was actually wondering 
>>> whether the CPU allowlist still make sense for the 32-bit ARMv8-R?
>>>
>>> From Armv7-A, we needed it because some CPUs need specific quirk 
>>> when booting. But it would be best if we can get rid of it for 
>>> 32-bit ARMv8-R.
>>>
>>> Looking at your patch, your merely providing stubs. Do you have any 
>>> plan to fill them up?
>>
>> Actually, I would use cr52_init in a later patch to write to CNTFRQ. 
>> See below :-
>>
>> +#define XPAR_CPU_CORTEXR52_0_TIMESTAMP_CLK_FREQ  800000U
>> +
>>   cr52_init:
>> +        /*
>> +         * Set counter frequency  800 KHZ
>> +         *
>> +         * Set counter frequency, CNTFRQ
>> +         */
>> +        ldr     r0,=XPAR_CPU_CORTEXR52_0_TIMESTAMP_CLK_FREQ
>> +        mrc     15,0,r1,c14,c0,0  /* Read CNTFRQ */
>> +        cmp     r1,#0
>> +        /* Set only if the frequency read is 0 */
>> +        mcreq   15,0,r0,c14,c0,0  /* Write CNTFRQ */
>> +
>>           mov pc, lr
>
> Why can't you use the device-tree (see clock-frequency) as all the 
> other buggy platform does?

That's a good suggestion :). Also, I can do this in the platform 
specific .init().

Then, can I add the empty stubs for R52 (similar to 
https://elixir.bootlin.com/linux/latest/source/arch/arm/mm/proc-v7m.S#L165 
Cortex-M7, cpu_v7m_proc_init(), cpu_v7m_switch_mm() are stubs).

Or do you propose something like this :-

--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -322,7 +322,7 @@ cpu_init:
          PRINT("- Setting up control registers -\r\n")

          mov   r5, lr                       /* r5 := return address */
-
+#ifndef CONFIG_ARM_NO_PROC_INIT
          /* Get processor specific proc info into r1 */
          bl    __lookup_processor_type
          teq   r1, #0
@@ -337,7 +337,7 @@ cpu_init:
          ldr   r1, [r1, #PROCINFO_cpu_init]  /* r1 := vaddr(init func) */
          adr   lr, cpu_init_done             /* Save return address */
          add   pc, r1, r10                   /* Call paddr(init func) */
-
+#endif
  cpu_init_done:


And we introduce this new bool Kconfig option "CONFIG_ARM_NO_PROC_INIT" 
which will be defined for processors that do not need any special init 
(eg R52).

- Ayan

>
> Cheers,
>

