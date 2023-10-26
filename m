Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DB07D7EC0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623602.971592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvzk-0006ye-VH; Thu, 26 Oct 2023 08:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623602.971592; Thu, 26 Oct 2023 08:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvzk-0006vp-SY; Thu, 26 Oct 2023 08:45:36 +0000
Received: by outflank-mailman (input) for mailman id 623602;
 Thu, 26 Oct 2023 08:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvvzi-0006uR-PA
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:45:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05caf708-73dc-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 10:45:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 26 Oct
 2023 08:45:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 08:45:29 +0000
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
X-Inumbo-ID: 05caf708-73dc-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFMZGRj4bS4uma+aWeIr+An32lUz3mZD2iotzgEcwt94VbI2fjdn0C5qbjYY40grfcl+hQV31fsaX3ZFl5ZHsNdnNO9xBCPWp1of27k7SDLVjcdPkB5tYu3AqnfxUkp7F0qbjq/O7zTJAWm8NMqcROIQRfsHkwDfDGxbnb/gChK7ydcGZq3nxcOABwUG/anISgW9xLF9x6LPNB6TNnlEbvyPlUAdTF7g/dNp84s9eX9NqrM3C8/Ms8DC8uVC8HOosv+jORLE47EXaX3E98EtfPp+14TesiCJmRANE3vruG0o3t6YX2SdoqPNZsaR2bKVULPFCBvmMo8ZRWzI/ZBi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeL4Ujpyh0Z5eCSBCO4lfs1Cmksi/7P3y4PYo7YxKak=;
 b=jaToB0oe+QA64JPD/39vYVcwciG4Va+mb1XIW8IrwFUc3I0l5K7CQ+IX9kHeMklMCubmoDJrg3NCNNZ7DAyH0I0s+CxKhZtVf01tKMn8YCkfKdPUkOd/llAzUJuIHCeLViCrI5/Ga5imat1m6wy8yfnrwcT0VsphvS2NLOIrfCAeNzjnydYksc5MGAXWdQdaoeZGqvjly6HiYZj/QsilkQWZtxk928AT86kSkfme/hmW92j7Ti+qXkmNbjqnX7e88Bp4D9jRnKKZ8Sy7SvFG3Tq4T/4ZfikQJnRlKAErF15zdidsHYqJ8TLjH0O9ab960mEvHdfoeBhAy6YntkRgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeL4Ujpyh0Z5eCSBCO4lfs1Cmksi/7P3y4PYo7YxKak=;
 b=Hk/kUwMThaIKgacLI7TJtvAAJ9mlvmr8FYztXL7eToSXs853sTCRiz57MAwLdccq5IZdEHezNPJhNjzfvPlbG4m1O9dA/bL5Sqg8eLjxxtVDzzr9X4ZlJ/lkIrcVlTnEgEchR8kcTCyELk1yhxC2i/v5x3NohC+npHhYyN2J7lFtjXqvWpVJUpSd76agUtO6YLmVgNRvJlca4Bqnt4s0UFfk8UdnG62jKxdNNvhb6yfkSxv3icWaQiydcjx+NB2+0ynnDPfpiTbawK//kbSEKsqTO2cD11QlLPtQd/dQUDkQioSHca1anum1Lhn/LulkLMZHUliFhCKJTbzwjzCe4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
Date: Thu, 26 Oct 2023 10:45:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4a33a1-effc-498d-65f3-08dbd5ffe815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H5auSD1pimlNse4UdB81TSF6rbGEPgdcAtVIYNwaY/DK1R9eC+y7eV8v2CvPbfSjGas//cj4Xbvlek+sHTMOpkj0zaNKYxG0YbOGeqylCrMOJ2cGX0eIhI4XgmcXsLcso9AEsXLcfIaSU5zrnEJzzx+yDpcfbxdHW23tAhk/OVF9XkEQCU7vseaE+j95i3xuff5hAQp6X/po6CCPgz4ry44oeZWaOuH7tjsbwWhmiXyV9B0Zo6EZiFH86OvzOmK69ZmdkOm/WH1TVWMUK/NdDU6kbOrfEVCWGNVIS6CIHRdFcKRO0hDShx6edynywcJQ2D555XgDESe5udnDiJVukA4N5HmvEWMZaL02GsSvyKcj9MrGiGdjnISU3anaoTucmVOc3oy9EQmQrL4/5FVEqFxd++9eyHvfM4doTpnDFs/0+i8dWbX3J9NFGOMqSpLBTriwUGKqriqMzGIi1/vsmYbi+uWMl0d/gF2FbTKNg/5mEQ+zcub8lCQPcsfYCpIkgMBuV3JZAQtX5P9pFeNtlMvaDU/R1c/LKGNEhjfvN+t2kVTjLcCAdi0yZZhzBy8BsUBT4Tc3yf/bxppST9HN7jCEHAtAdkeOChLzPgGj9VdFF2sQKAWTUUkbKG5g45rn8J6R+BTB/n9vHSJdlJfD8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(136003)(346002)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(86362001)(54906003)(316002)(66476007)(8676002)(8936002)(38100700002)(4326008)(53546011)(6506007)(6512007)(2616005)(6486002)(83380400001)(478600001)(66556008)(26005)(41300700001)(2906002)(36756003)(31696002)(5660300002)(31686004)(6916009)(66946007)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnJzalVVeDN4dlJHK1U2Vk1QRVRjZ3RpVmxHR1JRVENqWmIyRDJuUGZ0dTdI?=
 =?utf-8?B?dVhKTW9ackM2dVlFNlAxeVd6ckswSHdvNTZHZGV2RG50QVdESUk1c1hCUzdC?=
 =?utf-8?B?Z2QramNZSHAxbjRtbU1ML2RzZWhOeldrV0ZvYzhwNWZQekhiakZjMDNuNXBF?=
 =?utf-8?B?N01ER01HSHdhSjkrbElQdFVjWXpSaUhsbDEvS1Y5TmpMdituVnNMU1ltdXBX?=
 =?utf-8?B?VjJaVVZWblFaaWxoWVZ6RXJQTE9yS211YlQycWhZSmlaNFlNbTN4QUIvNEhx?=
 =?utf-8?B?TUVwUFgzRlZEZU42bFVnSUR3VXlRUTc4bHBkSXZFVEtkRUZxaTJoeU1XZlpU?=
 =?utf-8?B?NnNHWDRCRXJvaWo2WEZMSlJpUlNDei9BNjIzdjV0MFBodmU2MzZvVjUxdEVU?=
 =?utf-8?B?aVRMV3NxMlhHb1RMTG4rQzRWa1FPbzZkbExrcmtya2dJTzZSWHlaNEp3WG1Q?=
 =?utf-8?B?YWxHU2xLc2twZ21XUUc4MUQ4aWZPM1p5NDZMSmlET052bXM5dFl2bTM0ZzBH?=
 =?utf-8?B?UHZUNXhXN0ZWemZWZlpaOWhwOWl0VDVGTVVDYnI4NE8rNXl4eDZ2M2dOcSs3?=
 =?utf-8?B?MTd2SFJnVEZ2MFhwTzRjdG1XcjRSL3o0Wllrd2FRTC93SW5NbXRocjF1Nk42?=
 =?utf-8?B?U29iaUxXbzAySVB3ZExUSTh4M29NazNMOWRtL2E5MklzRGdRSmlVU0c3U3o1?=
 =?utf-8?B?ZVU2SmtVcmtDYWtyM3RBS1V0WGRPaUxVQVZpNE1WcHZlS09ZUU1wYXozendh?=
 =?utf-8?B?bWsyV0daUit2b1ZjNk5DY3BtaWpUMlkrYWtxY3FtSDkxRFRiUkVxZXVYUWEx?=
 =?utf-8?B?YmtZUmlzd0lVc25rRElwWmZBNUZDTDBNM2g1ZlgyMDRKbHYvTDNUQ212VHc2?=
 =?utf-8?B?Z3VBT3puL2xxOTYvVTk0bVRGeE0zWnlCSzJ2VTM2VUZ5Um84THBJeE9uc3o3?=
 =?utf-8?B?R0lTT1lONVg3WWF2N2U1dmpPZ2hBYnJuZDh0WXk5bGJZRGoxRzF2Rk11eVlU?=
 =?utf-8?B?VSt4UEZZbjU4T2I4K2tlY0F5TS9lT0R3RlltZWVlTjNpVXZhY1Zwa1NGR21v?=
 =?utf-8?B?MEU0QUZDWDR2U0JNNWtlaTgvbTI1b0JSazJlVkVMNDRQOW1NQjFIVWc3M2N4?=
 =?utf-8?B?bHoyOVlob1hrMS81THN3OStJWjhDMkVaZysrUlRFK2V4MXUrODhXZ0EwYnh2?=
 =?utf-8?B?dGlaRW1Pc3p3azd6WERFeG5BaXVGZ1FjbllEZXVvVStiN1FkWHIwTWlObk5a?=
 =?utf-8?B?TFAxcldXVy9DQnFqS1pnSkZONUdGYzYvVkFqdmpRcit1TWF3VUNXNVB5K1FY?=
 =?utf-8?B?RVl5bFFwNGFOM1NKMHNBNkZnUzVHTFpOVlQ4R2Z5czVqb0VhSW1xVnZHTENB?=
 =?utf-8?B?cnlBQ0NTakFtMDZBRGZsZnphODhPTjNXMUQ0cXVZQXJ6UXVXa1NVeDVTaWlO?=
 =?utf-8?B?ZklsNzRjRU0rVTVwbGt1ZGtFdDdyQnA2UFpqdUN3ckVkVUo2M0lWcTZJYW5p?=
 =?utf-8?B?U2wvYWhPMmtPanVrQksrVUpXcHM5NUFibHpwcEJDY1V2UENOUmNtd09XTnMw?=
 =?utf-8?B?Q0ZPQXB5M2pRVXZSQjM3Y3VUYlp4a2l2ejdBWWJtWmVlUk9LYkNtWUlVMC9J?=
 =?utf-8?B?dyt3Y29JZFp1MkZicjU5bDFDT0taeE0rcEdPRk1LV0U2OVFkNG1WZW5FZUdX?=
 =?utf-8?B?ZGR3dDBzWjIxd0N1TW93M3hwQzNTSE5jZEhBdnFEUHBINlQ2Umd2ZkNtOWhw?=
 =?utf-8?B?NUtPaGlpenRUeXg5Mk45NkkxSDRKWmcwZFZPTGVBdWF4ZlR2NHRDT0lvaHly?=
 =?utf-8?B?em5jR2lDVXl0VG9VRDBTOHdHZWxIdXFldmVrMkNDa0JNdjFONEI5enNpN0tr?=
 =?utf-8?B?a1NFZUFOdStZaUYxR3lLMGxoRlZ2b1RtdHVwejNoUXJRcy82eDJOSllYOWJK?=
 =?utf-8?B?Q295V01aUWUzcFhBWDRNV1Y3SmJ4QTFZVlZYZHBQSmxPaWZwYzZHR0NxTTFZ?=
 =?utf-8?B?NHlOSFRQdFhTbjQ4VDRENHRwVHphSk5GSWhXRGhXYjJiYzk1c1dXdDlPTDZ0?=
 =?utf-8?B?bUlVaFdLOTY2OUZOUERmeHhucmxhMXJjc1BOVXIwUTcxOTAvRzdqQlRrQmZD?=
 =?utf-8?Q?Q0dnChniUotulEaD5piS5KLu2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4a33a1-effc-498d-65f3-08dbd5ffe815
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:45:29.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Wdw+0c8BTfv/a7Gg/aauCpTEzrF9cqHA423KW/iaewACThWbiMYHCdJOLm7F0y3PHwykOTWE4SW8XWeQp8fjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948

On 26.10.2023 10:34, Xenia Ragiadakou wrote:
> On 26/10/23 10:35, Jan Beulich wrote:
>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>> Given that start < kernel_end and end > kernel_start, the logic that
>>> determines the best placement for dom0 initrd and metadata, does not
>>> take into account the two cases below:
>>> (1) start > kernel_start && end > kernel_end
>>> (2) start < kernel_start && end < kernel_end
>>>
>>> In case (1), the evaluation will result in end = kernel_start
>>> i.e. end < start, and will load initrd in the middle of the kernel.
>>> In case (2), the evaluation will result in start = kernel_end
>>> i.e. end < start, and will load initrd at kernel_end, that is out
>>> of the memory region under evaluation.
>> I agree there is a problem if the kernel range overlaps but is not fully
>> contained in the E820 range under inspection. I'd like to ask though
>> under what conditions that can happen, as it seems suspicious for the
>> kernel range to span multiple E820 ranges.
> 
> We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.
> 
> I know ... that maybe shouldn't have been permitted at all, but 
> nevertheless we hit this issue.

How can they expect to have a contiguous, large enough range there?

>>> This patch rephrases the if condition to include the above two cases
>>> without affecting the behaviour for the case where
>>> start < kernel_start && end > kernel_end
>>>
>>> Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
>>> Signed-off-by: Xenia Ragiadakou<xenia.ragiadakou@amd.com>
>>> ---
>>>   xen/arch/x86/hvm/dom0_build.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>>> index c7d47d0d4c..5fc2c12f3a 100644
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>           if ( end <= kernel_start || start >= kernel_end )
>>>               ; /* No overlap, nothing to do. */
>>>           /* Deal with the kernel already being loaded in the region. */
>>> -        else if ( kernel_start - start > end - kernel_end )
>>> +        else if ( kernel_start + kernel_end > start + end )
>> What meaning has the sum of the start and end of either range? I can't
>> figure how comparing those two values will be generally correct / useful.
>> If the partial-overlap case needs handling in the first place, I think
>> new conditionals need adding (and the existing one needs constraining to
>> "kernel range fully contained") to use
>> - as before, the larger of the non-overlapping ranges at start and end
>>    if the kernel range is fully contained,
>> - the tail of the range when the overlap is at the start,
>> - the head of the range when the overlap is at the end.
> 
> Yes it is not quite straight forward to understand and is based on the
> assumption that end > kernel_start and start < kernel_end, due to
> the first condition failing.
> 
> Both cases:
> (start < kernel_start && end < kernel_end) and
> (kernel_start - start > end - kernel_end)
> fall into the condition ( kernel_start + kernel_end > start + end )
> 
> And both the cases:
> (start > kernel_start && end > kernel_end) and
> (end - kernel_end > kernel_start - start)
> fall into the condition ( kernel_start + kernel_end < start + end )
> 
> ... unless of course I miss a case

Well, mathematically (i.e. ignoring the potential for overflow) the
original expression and your replacement are identical anyway. But
overflow needs to be taken into consideration, and hence there is a
(theoretical only at this point) risk with the replacement expression
as well. As a result I still think that ...

>> That said, in the "kernel range fully contained" case it may want
>> considering to use the tail range if it is large enough, rather than
>> the larger of the two ranges. In fact when switching to that model, we
>> ought to be able to get away with one less conditional, as then the
>> "kernel range fully contained" case doesn't need treating specially.

... this alternative approach may want considering (provided we need
to make a change in the first place, which I continue to be
unconvinced of).

Jan

