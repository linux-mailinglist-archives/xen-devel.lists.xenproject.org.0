Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359B5F62E7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 10:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416716.661378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMPQ-0001CN-CP; Thu, 06 Oct 2022 08:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416716.661378; Thu, 06 Oct 2022 08:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMPQ-00019d-9c; Thu, 06 Oct 2022 08:39:12 +0000
Received: by outflank-mailman (input) for mailman id 416716;
 Thu, 06 Oct 2022 08:39:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMX9=2H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogMPP-00019X-MA
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 08:39:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60047.outbound.protection.outlook.com [40.107.6.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59022e2b-4552-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 10:39:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7429.eurprd04.prod.outlook.com (2603:10a6:10:1a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 08:39:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 08:39:08 +0000
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
X-Inumbo-ID: 59022e2b-4552-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeVQTQRHyLzYIBgmMAc/g0EidRefepeeglbhj0se35pWyZmsWhGOPUmCW4nfog20znUZ11IIC9RxNHkHSl/1sFfdAoL20mFSOeON0te3EDWjWoVDS4eHOFf4Psv6jWmAB01tSQ8SXbJbVfQ3nBhWpvoCEzSOKSEZFs5u7A0u29oIvGlQtfrRz1SvCo0diDoj2Jk8R/zc3fHobteeVIutgscjg0GJes/xCCVaJk7ENewQeTnB9p9bnj9y7bG6ZaArV4hQgEnLFWA2IdnxMkmANRbDH+g0X7PUFS/jG2e7Q5Z8Ki4arB5g245Go/H9tiJTngBP4I6DBqRwp/esmWgWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D6BjJR1XSCo7F+SGErGgKQd6M3dfgKlllcFTmbq9TY=;
 b=n/75MNJeEtxYljayTMygXjy1J6blIXDiIl7o4k0LwaDlzf9sYE7SugTThnlAyHc4EO9RCPIVmgC1PFsGwUzCCiCv+ejdaKLRfpSAaBbZaS4O3ja/6huV03Pc4OK5gSF9D+ybdMDxD2SNH4K6qqXYrb8pwZUSLDf//RExvdaA74480LFJCULIPhkJJtktSt8ml9Therdf7hh1CZJjLXw/kAm+6dtwLKisKIXP4IJPRqweZFVkNz2ihuyNcR1DSHx9Qqb95Z/Ju9IMB4jABxB3jym3TRgvfocaLhNLeLWDg6Bz7UZL3K2jTRGCyrsq07BelyQvb3Nm+wrxtTXZkMyl8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D6BjJR1XSCo7F+SGErGgKQd6M3dfgKlllcFTmbq9TY=;
 b=Kr6IEvBIKXKIzYyev6GaQVUDWIEQglhBuw6BDnCvE20Ybr2gcvo5tG8/gUh6xeoFi4lAzL0LhlEUUGb1m/4T6fye1K2x/2L1b89N9ynOPjLuIRHaHQz96SlNKw0TAkKQZZt0i0iBw/HnBtQ6HB7mcLneFqNCUuE8E8MFIlGX2+rngjcoA/02mTu0RJan+6fzYTnyoAgQ9wWrtHj7uHTs8u6rY1PPdLke1qxgn/1Tc6T8mX59jLv/tfGkKvoE+BYplhDYEJ2k6wJrrSwyIUwIS9MGJ/RiIJQJLiG+CUgoNTc+o1v1bX8EFS1Dh2uW0IrXmWTsfUx2jGK5PkYgnCdWyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d152954-4f5a-2833-f974-442c15f4e8b9@suse.com>
Date: Thu, 6 Oct 2022 10:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
 <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
 <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org>
 <0d33ecc6-898a-9379-f934-fe569cbdc8f9@suse.com>
 <3b3f6e1c-4f41-6b1e-b226-f0dd515d14ca@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3b3f6e1c-4f41-6b1e-b226-f0dd515d14ca@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 213c9216-d98e-4ba2-53bd-08daa7763c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hnUz9en6CAQ9C/qJj6Ut7h5Htp1Vu5p/DDU8CP+ydM0TJ78C+Cu4zMBSKnZ59qstCrhF41RuAewm4D23hyI3mZ0yUvHNqqtgAOYTyp1HvXzNs2Y+c8pXdeRL8m+EmOO6ZGWvnPpjQ2k2BYsXclHPtXU/CGICXzoHk6AQXuaXJ3OE8NAdVv1yDWDKFTycLFVsxtTzXA0RHHlMqsjBpLSIPh8eSfsYnXp8R2RAKofNTTBZMBlZpmrfp5ECGCQRKDbjV4nVX3fqJTfNG1CZAZEAZHkLY0CGIGheFPBohGnaPICRgQ+LJoo8xE2lshweThZJG0aP6nm6PO6A5XNEdYvIP65H43M2WGlcTb8hjK6FHYQiEfr7vJd2WpOdHrNwr9bD/2wZPAED7/wZ8B3MCyclTgc9aRfjfZHScxkHhdNcJH2ylt4Ua8tbfr5VafJdUqODXUpKgqbbv9p2wbF/HvDXrjZ1ZCZMi3SW2yf7kNaL9CeeyVN1PTIh4Oe9t6hWKsFuDk/baQzRTrap0Ho1EjzxW0m4gLCrsCEr22c/Uemeix5YninLVQxq1zoAQGcGWbSbXybgaZ6Np9+i9nqFUy1QBK/y2TkhNR3lLAlE2ohZLVDf8xhci/p+CFx5nc4rVQU02sRntgqYON3sPbuuX4N/v14bWbXBWVRG31zlP1+y2AWY8AIRL6yyNsaFI9imbh4paDRUx9Bc7VWWC8cRaHGbOCI+vIy2my3Wd49hmskP71K3NSDd8dK52yis2alkHAAe2G1gn8MbhIlGGh/RWowLw9MJcLxvSBhA5dmDBcCTueA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39850400004)(136003)(346002)(396003)(376002)(451199015)(2616005)(83380400001)(38100700002)(31696002)(36756003)(186003)(86362001)(5660300002)(8936002)(6512007)(66946007)(66556008)(66476007)(41300700001)(2906002)(26005)(54906003)(53546011)(478600001)(6486002)(31686004)(6506007)(316002)(4326008)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2FCQktzVGpGc1l2d05JS1c3Z1B5QVQ3TGlENmZDV3UwbzdJYmVCVkJuaVhm?=
 =?utf-8?B?Q04vczhkUDJIL0kyOG56WVlVUmRXdDFoMkcxVnVNZWZMM2JWVG1TS3FTbkk0?=
 =?utf-8?B?ZkRGeGsvNWNDZTNSdkdJNW1kMFlJNHdwNmpFOXo4YVE0Zkl4NW8xeXRXQmpG?=
 =?utf-8?B?djdENkRHNlJyd1pIT0ZsZnRNNVR3dVlJQTYzM3E0dlpRbXo4MnNrNG5aUzE3?=
 =?utf-8?B?aWs4K1R6SjJyYXVTTGlTOEw4Rys0UEd1cGlNelVyRi9HVU1xNVRiUkFsYTBB?=
 =?utf-8?B?dVFsTHpKQW1PTTlQMURNMEU2NFZsNkYxZEo2SkZuTWRNTWJ0bW5sbGlHSWVk?=
 =?utf-8?B?Rk9wMFVQL3JlNG1KdVhXblhDTnBZQ21ULzhEd0x5WXhEWURVazUwYUE0aDJJ?=
 =?utf-8?B?d2d6cFhnS09YemdLOXdMRTB5dVU3aHRrSHRFQ3hodUtkbGRFNzR2dVEyTEN0?=
 =?utf-8?B?R05SRkp2cDZmMmhKTHJ5NmdvU2x5ckc2ai9JZmxWVU9WV25PVkc1V2xTUVR0?=
 =?utf-8?B?NnBGc043YklIMWZuVkticFpNN1E1NEx2NkoxWUgwRGhkNDdkam8zUThEV09W?=
 =?utf-8?B?MWtuTDFmSWxLTnV0dUJvVGpMM0xjTExwQmowcjE3bDA5aFZVQXN0Nmh2dTJB?=
 =?utf-8?B?QmNocnZFVzI0Zm1Ybk43SzU0bWdRWFc5RWtldzdRa3ZTRDJpejJZSE9Ld2xa?=
 =?utf-8?B?Tjhlalp5ZFVkZ05YTlAva1VGQjJmQ3lMZzdsb2hrL2Z5WlBVOGxHNGgwRytj?=
 =?utf-8?B?dWF2UzBBYzAzK3E0alVVc0hsaEExVm5PZUhSVUdJNzh3dVIyYkc3TGNzR01l?=
 =?utf-8?B?YlZqZ2xzbXNwRW9VYUtIbHUyM2xPRndsU2c1a1JSZnFuSEU5Yi9zVXNYSTJr?=
 =?utf-8?B?cU5sUllEMWJMZTRUeWNheGN1ekJadC9UK2Zobm92cE1HZ291T0ZadlYzZFVo?=
 =?utf-8?B?NWlHcjNjNlFVaFJyUVpYcWc5bFB3K05yMVp1KzM5WnR2akVRc05sY1FuZVpx?=
 =?utf-8?B?dTFjZXRCOHVuSFlDcDhGY3N1LzRPU2Z5K2NOK1JqVHJkbjNsWTFGYkZnS1JO?=
 =?utf-8?B?SnlUdUdWRGFURk5oODZlWEhGck91VWsyem56TGVkOEVDT1JYSkRvS0NnejI2?=
 =?utf-8?B?alVGMStMZjlHczE2emQxYlYxR3hiTEViZ3F5VHJ2TXdRczBtMDc3V3lBK0g2?=
 =?utf-8?B?am94U1Z2TlcrUkVZcytpdE4zS0VxNVdXYmlOSG8yanZGZWcyQk92YklNQjVG?=
 =?utf-8?B?WTVpU0dzUFVid0J3SUY2cGpuRDhYd1NwRHJZSmx3RHI5N0dlK0MxbS93N1ZQ?=
 =?utf-8?B?dklvd3FOb3lsNXFGcTdWMFppM1g5d1VvWXNPT0xodFFaZmhLU2JWMjZiRGZH?=
 =?utf-8?B?a0h2V0VSd3NEem9qTGpEcE5sNlVUYlErQm5SbDNTaU1WRUNmbldFMmxpZTZq?=
 =?utf-8?B?eGF1aHRRSkY5VkIzQm5lbElySm42ZGNjQ1I4d0xFRVdaTHRKamNtcGNJWVZt?=
 =?utf-8?B?bVJyYUNWQ2xxRVk2RlMxRHJhVzk1ZUx6ZVpHQkhwQ2Ewakw5WU80MWlrTkVu?=
 =?utf-8?B?eWRhZzBTMmJRQTlVSnRnN0ZXMnJzd3g3TzNNWUFvMG5DR05YU1JhR3VwQWRH?=
 =?utf-8?B?ZENRSkNzQ1ZYNHlwdjZ3eDR3VkYxaEhldUdHTE1XOGtuWGpSeHhhQ0FnNHN4?=
 =?utf-8?B?QkRtaXZLWUdFSXg4RmpkcSs3TkdXeHV4ckJvTzlSRktnMlZtY2dMTXE5NDg3?=
 =?utf-8?B?Z3Naa293MW4zRWFvRk1zajREdXh5U0xlaTZKVGpzOE8wV2lsbGx2V3lwT21F?=
 =?utf-8?B?U3pkbE9WYWcvcnFwUGxuSkRLcFpuOTdNYVMwdzlGNjZZL2lPTmhDaVNSVDZH?=
 =?utf-8?B?Z2hsVjZ0U21LZVJvV1NFVjJSK2I4YlhMWUVCL04yc3NNTzhrYjd2Y0k3MzI3?=
 =?utf-8?B?cVJDV3VNU2FwcUdqYVlhWlRvbkN2REg5b0QxSFFhVEsvSVVERzNzOTZvKy9D?=
 =?utf-8?B?SEZZdFlLVjQyM01HYWVadkxseW5XSG5IZWJJdVVFQjlSQzM3MVdxOXpYeTlS?=
 =?utf-8?B?M2J1bmo1OEtxMER5enBHTHZBOFZ2VkMvVTdMeHJaUGlyc3MvcngzaWVraFpO?=
 =?utf-8?Q?2qnmFd6dxPYKDj40O0XxzOp/y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213c9216-d98e-4ba2-53bd-08daa7763c3c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 08:39:08.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9snuwcQ6F18WplFkSAozlvnpvMwXAM6F0kjyMRklRJyZBbbBQXkTiLc7hNhnv9ibTrSf1u1UOxHRkbnhxEzmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429

On 05.10.2022 20:09, Julien Grall wrote:
> Hi Jan,
> 
> On 05/10/2022 12:55, Jan Beulich wrote:
>> On 05.10.2022 12:44, Julien Grall wrote:
>>> On 04/10/2022 16:58, Jan Beulich wrote:
>>>> On 30.09.2022 14:51, Bertrand Marquis wrote:
>>>>>> On 30 Sep 2022, at 09:50, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>>> runtime which was re-used for other purposes, make
>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>>>
>>>>>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>>>>>> Fixes: facac0af87ef ("x86-64: EFI runtime code")
>>>>>> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm
>>>>
>>>> Thanks. However ...
>>>>
>>>>>> ---
>>>>>> Partly RFC for Arm, for two reasons:
>>>>>>
>>>>>> On Arm I question the conversion of EfiACPIReclaimMemory, in two ways:
>>>>>> For one like on x86 such ranges would likely better be retained, as Dom0
>>>>>> may (will?) have a need to look at tables placed there. Plus converting
>>>>>> such ranges to RAM even if EFI_MEMORY_WB is not set looks suspicious to
>>>>>> me as well. I'd be inclined to make the latter adjustment right here
>>>>>> (while the other change probably would better be separate, if there
>>>>>> aren't actually reasons for the present behavior).
>>>>
>>>> ... any views on this WB aspect at least (also Stefano or Julien)? Would be
>>>> good to know before I send v2.
>>>
>>> I don't quite understand what you are questioning here. Looking at the
>>> code, EfiACPIReclaimMemory will not be converted to RAM but added in a
>>> separate array.
>>>
>>> Furthermore, all the EfiACPIReclaimMemory regions will be passed to dom0
>>> (see acpi_create_efi_mmap_table()).
>>>
>>> So to me the code looks correct.
>>
>> Oh, I've indeed not paid enough attention to the first argument passed
>> to meminfo_add_bank(). I'm sorry for the extra noise. However, the
>> question I wanted to have addressed before sending out v3 was that
>> regarding the present using of memory when EFI_MEMORY_WB is not set.
>> Is that correct for the EfiACPIReclaimMemory case, i.e. is the
>> consumer (Dom0) aware that there might be a restriction?
> 
> Looking at the code, we always set EFI_MEMORY_WB for the reclaimable 
> region and the stage-2 mapping will be cachable.
> 
> So it looks like there would be a mismatch if EFI_MEMORY_WB is not set. 
> However, given the region is reclaimable, shouldn't this imply that the 
> flag is always set?

Possibly (but then again consider [perhaps hypothetical] systems with e.g.
just WT caches, where specifying WB simply wouldn't make sense). In any
event, even if that's the case, being on the safe side and doing

        if ( (desc_ptr->Attribute & EFI_MEMORY_RUNTIME) ||
             !(desc_ptr->Attribute & EFI_MEMORY_WB) )
            /* nothing */;
        else if ( ...

would seem better to me. However, if the mapping you mention above
would be adjusted and ...

>> And would
>> this memory then be guaranteed to never be freed into the general pool
>> of RAM pages?
> 
> The region is not treated as RAM by Xen and not owned by the dom0. 
> Therefore, it should not be possible to free the page because 
> get_page_from_gfn() would not be able to get a reference.

... the space cannot become ordinary RAM, then such a precaution
wouldn't be necessary. After all hiding EfiACPIReclaimMemory from
Dom0 just because it can't be mapped WB wouldn't be very nice
either. I guess I'll submit v2 with this part of the change left
as it was.

Jan

