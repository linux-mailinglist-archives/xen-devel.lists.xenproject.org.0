Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B7A682ADA
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 11:52:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487513.755164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMoEc-0003kt-Gt; Tue, 31 Jan 2023 10:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487513.755164; Tue, 31 Jan 2023 10:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMoEc-0003jb-Cz; Tue, 31 Jan 2023 10:51:30 +0000
Received: by outflank-mailman (input) for mailman id 487513;
 Tue, 31 Jan 2023 10:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLqc=54=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pMoEa-0003jV-Bi
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 10:51:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32efa716-a155-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 11:51:23 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 10:51:20 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6043.033; Tue, 31 Jan 2023
 10:51:19 +0000
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
X-Inumbo-ID: 32efa716-a155-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAcxdI5GvOLyF1/OY3A9njQ34WDLTAebZ9eK5wcV6R6tYZImWBKvvi7aaNjq2tQFEwie7uvK4kTN/t3fc4H9nGlFWfRBRvQu1HnFrfi1wgGAYR9PA7+yiT9Iu8/Uu2omGYtqVX4RIL5xXbC2WeILXVpxXkLnGQZg71aFnE95Zk/QnG7bb8/b8osuQ1RtQgrxUB4XIXG3kIHFdlGHksSbnB8iD5g0WuNxTTtE/szqtSjH8p4qGxzM7ySqQt/ahWZXQr236KtomBDUZvvu9vd19ygvumSUnLOgC7Cbb6CO3ewfcsCl02NoLmhY7ZmOtNKae5mXAczr8/tUuYW34S+o2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lcZovNqwfdmQTyE9LoA0TNs8cfvm8wnIJGJ5hKwhmA=;
 b=mBWxBegzzMaVTGcDVKzzF+GV0guo5uMCVvckuZ42LBPh9i0VY83CpHoX0wgTj2CKro3OWPF/CDFqaM8eO4KbABY60j1xpwCfuUOGje/FmK2x2s4lNNhg+0YXSY4VTzIY+ZdgBpiBRb3rEv7lIYZZyU98+k8tlxECWAZVkLpbGBsnmykXELafe+0f4bq/Gj/kyqeefq96kNQrAjUZWnuYxzWd7FzjiThWdjDX/G+5oPxHJDT3SEGTzYd0/z/cgKicEI+6+BEzZqcBYGNLQykb7Uhk6f+FnbLRlCL43NYhJLEVcrjAz8MEYuYKFmPVw7qMOOi4k0KRBOJ/aUUg8yUJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lcZovNqwfdmQTyE9LoA0TNs8cfvm8wnIJGJ5hKwhmA=;
 b=p5B8q5RWMPCsu4MkdSGKeZR7QVtCFxOjLXgTabln+SKgK0MRy4jFaiGLkdw1XaUVMGOFcay24Jam6L6M9tdmxX5DFoYZ8xhVDt/sdherwWrZgn0zN6//8PTQxzkiRiCIkxUnau1btG0WHblqb48jON8RI5453n0lmWxGoST1gBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <82e2a6ae-b941-6fa6-dd00-c2c36bd5e079@amd.com>
Date: Tue, 31 Jan 2023 10:51:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 04/11] xen/arm: Typecast the DT values into paddr_t
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-5-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191514240.731018@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2301191532370.731018@ubuntu-linux-20-04-desktop>
 <1a227f76-005d-0307-5161-2e8432171eb7@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1a227f76-005d-0307-5161-2e8432171eb7@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d9585d-5d47-4109-9bf6-08db037915df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2zfsljpVPXCH6kpHxUtJK1AvCYZ36DL9h5wH3BQbtwi3oz2KcLpNXLUGnxXJCwhkd8BlZkOZLt3VrM/TEy0ZI5jXEC2Jgn4O89EUdMI5sECSMpNGvSvtDeEG1shG9sychK+zaDiE/PwCo3Kqct6jFkpiLrKN9oWC99H4wh3uS6PYiBmkue0iLuGC0t5k4c+hXv4nc3dZPBTz+6nO2FEPqGqGOj9BSXIHEp+uDdqb1bohg/8kStGLl/2qN6wcJh6lMLvAfIgQLfx5Hwp4xVo0xjNrRUGlckRN/N0H6W6QsPHK1s2YABrvAqgenzJAMFEka8qT6TEr++B7FaANKxUKMHeWP9PKjIDYqWLJh8dNX0W3hg+j8aI1CoPy2RlNDL6hyBio167AWCE13bQ/Rj/lRpY9h2qQxuBoap6LULzo9cJqhw1GG/jnjGhVzrYfFwIYn8tLaQg7NzSQKu9z1tOKWFTt90o8yQvKXT9+IL06ysFZlufdV6sVwjDZoUE5OmwDV20CI3PgvKWFyzkNUdN9zKFGUrBdFT4TS/+k0dT6Ps0r+ZLjGN1O5nto2snntMoT78EcK7TAmJRhHmj1QjtR81bkHYZkT8XWXduh9XtB9nsYlFDRw11E8HFcqkZs1uzosV+etczVCTM/X4ZjfURel/DPjOSWTfEaxyJ2BdrhjmozHOLcuBWDaXlxzxLZ9H9TBlWuVUWer4CYTc1Y6Y06iPZwJhE6T/4Ft+7DJzFotHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199018)(2906002)(31686004)(6512007)(478600001)(26005)(186003)(110136005)(316002)(6666004)(36756003)(31696002)(6486002)(41300700001)(38100700002)(66556008)(2616005)(4326008)(66946007)(8936002)(8676002)(66476007)(53546011)(83380400001)(5660300002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFhlM09uQXVhSkhybzdCaG9hUm9iN0dwTkNONXFJMWFFMXZ2RGdNdWJHR3hi?=
 =?utf-8?B?UE9QdGlubStldCs5cmw2VFFtL09rMDhSdWcrVW9MbzZIUHgyTVJ6YXA4MEpT?=
 =?utf-8?B?c2FJSERCY1E0Z1VlK2o3YlRUblhkRnFPTXF4dldXMTE2cy9CQm9DYlE3WEUw?=
 =?utf-8?B?a05UUnJxQ09BZDZvWWdiSTYxa0FVZkZYYzBKZ28veDErZjVNL0JJMHlWRDFF?=
 =?utf-8?B?d05lU2Ywb1RlMnFBWXhnZlpDUFl6enZ4elFOb0owOUlKSXJmMTJ3TUdRdzd4?=
 =?utf-8?B?cFUwRjc5a3VkMCtzZFIvYWY1aGFPWUlBdVYvaG1OZVRVM0VhMWpYOWlRaUkv?=
 =?utf-8?B?SFlFRVl0TTg2d3BwWEU2Wk1EQ05tSDFDOU9HeHdLdzJDQ0l5NFJmTlowYUlj?=
 =?utf-8?B?U3BvRE90OWg2N2w3b1haYW1qK1pFQnFNMGhlNkxreVdyZzRIZ3o4d0REMm1C?=
 =?utf-8?B?bC9Pbng4Q0FXMXhwV1ZiREFoRGlpdlZlRFY5ekJYUDQwN1pIMGI0dDh4WXZN?=
 =?utf-8?B?VEk0OHU2TTRMaytOREhpNzR3c0tldGhpL0xHMHo2R1g1NW9FbGJ0dTVKL1hT?=
 =?utf-8?B?aTA5T0Zvb09lMkpzZFdwUUR2bk9IRjgyZVVFYTk1d2pxVStQQytXNjMvUm4v?=
 =?utf-8?B?QnVnSXVtNGlkalhKNmNkcUpCZElqS2Vxeit1MGNZR0x6Umhzc1JVOU1lV1BM?=
 =?utf-8?B?SS9xNGpKYUxKWGtmcmk2aVlBS0lrblVLSGxmaFpQMzNNV1lFR3BwR0Q2VXFD?=
 =?utf-8?B?U1NnT015b1dmRTg4SHBJbnNaclRTU0owNU9pS1RsZ2JYa09TaENBS1B5UkQw?=
 =?utf-8?B?YzhLdDBjRm42MU9UcHozYXR5TUFkQzd1bDdqK2Y2dEFWVVp2MnB4N3M0dFps?=
 =?utf-8?B?ZzFKdGlCMStadzBwYUp5WnVDcjM2VEVhVDh1Sm5iZ2YyRVYyNGFiUXd0R3Nh?=
 =?utf-8?B?RjNNWmlwQ01MYnhwcnlnSlpKTFFBbTJuSkErT2NaV3Y2QmNTS0tGZS9BYjQ1?=
 =?utf-8?B?TjhsYUgxcXFzdTg2T1N6RVVhalpHVTd1WXhTajFWdkNpRkcyck9jNjZMVkQz?=
 =?utf-8?B?NHVGanN0ZjN2RlNmUlpCZGt0NkJSQTJ4Rk9WNmhlS1EzbUxaZTNERzA4QWQy?=
 =?utf-8?B?aldtakV0UjRZZFptY3ErUWdORy9iaWpidlMzckZoTkc2OW9qc25ML1pHYUti?=
 =?utf-8?B?RE9IV3RlUGRzbjVrMEhFOGovRkQyN2FTeXZmcXJFdk9Tdm9sNjQ2VEtmbGUz?=
 =?utf-8?B?UUhJR3N3N0NEUVhlVnE3SlNYRjB5bVZBbk5jcHJQY1NYSytoU3NPUUZ0bzJE?=
 =?utf-8?B?V3QrNmZWRjNLMFpLZGtmcEtLYjY2MG5WaHNhWm1FN2g5WXlXMldOR1pyTHU4?=
 =?utf-8?B?cGdpTFErSnRodEVMY1dsYnpqTzQ0QnhCUXVkTEVaYVZCY1l6VVRUWWd0T3B0?=
 =?utf-8?B?WGdhcDBoWTBsVmtnNTJaQ0ZrUHZQNjdjSTdrNENScVVFK01DWk5CeklOZU1x?=
 =?utf-8?B?bko5OUpZU0JGQmROaW9udmlWYm1ocXlhemZFKzZVYnM0OFhMQTU3dUVNelBt?=
 =?utf-8?B?UEE0dlZjYlk4dDUzMWFDby83b1VvTGo0K09tN25hMWV6Y3BqbFdVVCtLcFhQ?=
 =?utf-8?B?TzcrQ2JlV0dySEg0eXNFb2NSMGxSenE5UnBWNitzL3BkRmMwQWdCMlR1U01W?=
 =?utf-8?B?em5talh5eHJjMTJLdXlRU3NadThzMUs5aWNES01Dbis5OStpdnExS2dHZmVl?=
 =?utf-8?B?ZVlRODVDOHR6aVY5TGJnNzVMWThGQzBNRGcvdWtBMkl3ZTk0ZytabW8wNW8y?=
 =?utf-8?B?TnU0Y1VTejBvd3N5dUVzcGlWRTFGVTZENmxmUnVQdVo4T05BMXE4MmJmYVRv?=
 =?utf-8?B?dTJRd2c4U3pRNzJVb1F5NGwzRXpkT1Z3d1JDYkpRbWRzRkdoNCtoK0Q5dXB0?=
 =?utf-8?B?VXVmeGZDR1JYQ3NBQmJLOWtacFdDWVl2NER1SW5OSG1TYnVkZnFVS0ZOVzdr?=
 =?utf-8?B?L3RJZVcyajVnZ3ZaMGkyTU5IZEQzRlNFeEQzTTNnUHVDeVRSSWVTdS9XMERC?=
 =?utf-8?B?andjMU9xNjBTQ2NHMFlpMTVNVkRTNTlIVjdjVEJNV1Mrb1B6QnVVQldLbUNV?=
 =?utf-8?Q?5qygPvvauhcFL/lERhY8UEJDF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d9585d-5d47-4109-9bf6-08db037915df
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:51:19.8615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQxSn6AjJCR/1vqEPyJoNMY/8Q1xgriGuqePmgJjR6xILJ2Hc3vB0T3DwjKgazm3YpkbrFFiCzY56F7KliuOpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462


On 20/01/2023 10:16, Julien Grall wrote:
> Hi,
Hi Julien/Stefano,
>
> I am answering to multiple e-mails at the same time.
>
> On 19/01/2023 23:34, Stefano Stabellini wrote:
>> On Thu, 19 Jan 2023, Stefano Stabellini wrote:
>>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>>> In future, we wish to support 32 bit physical address.
>>>> However, one can only read u64 values from the DT. Thus, we need to
>
> A cell in the DT is a 32-bit value. So you could read 32-bit value 
> (address-size could be #1). It is just that our wrapper return 64-bit 
> values because this is how we use the most.
ok
>
>>>> typecast the values appropriately from u64 to paddr_t.
>
> C will perfectly be able to truncate a 64-bit to 32-bit value. So this 
> is not a very good argument to explain why all of this is necessary.
I can remove this line from the commit message. However, I have a 
related point below...
>
>
>>>>
>>>> device_tree_get_reg() should now be able to return paddr_t. This is
>>>> invoked by various callers to get DT address and size.
>>>> Similarly, dt_read_number() is invoked as well to get DT address and
>>>> size. The return value is typecasted to paddr_t.
>>>> fdt_get_mem_rsv() can only accept u64 values. So, we provide a warpper
>
> Typo: s/warpper/wrapper/
ok
>
>>>> for this called fdt_get_mem_rsv_paddr() which will do the necessary
>>>> typecasting before invoking fdt_get_mem_rsv() and while returning.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>
>>> I know we discussed this before and you implemented exactly what we
>>> suggested, but now looking at this patch I think we should do the
>>> following:
>>>
>>> - also add a wrapper for dt_read_number, something like
>>>    dt_read_number_paddr that returns paddr
>
> "number" and "paddr" pretty much means the same. I think it would be 
> better to name it "dt_read_paddr".
ok
>
>>> - add a check for the top 32-bit being zero in all the wrappers
>>>    (dt_read_number_paddr, device_tree_get_reg, fdt_get_mem_rsv_paddr)
>>>    when paddr!=uint64_t. In case the top 32-bit are != zero I think we
>>>    should print an error
>>>
>>> Julien, I remember you were concerned about BUG_ON/panic/ASSERT and I
>>> agree with you there (especially considering Vikram's device tree
>>> overlay series). So here I am only suggesting to check truncation and
>>> printk a message, not panic. Would you be OK with that?
>
> Aside dt_read_number(), I would expect that most of the helper can 
> return an error. So if you want to check the truncation, then we 
> should propagate the error.
ok
>
>>>
>>> Last comment, maybe we could add fdt_get_mem_rsv_paddr to setup.h
>>> instead of introducing xen/arch/arm/include/asm/device_tree.h, given
>>> that we already have device tree definitions there
>>> (device_tree_get_reg). I am OK either way.
>>   Actually I noticed you also add dt_device_get_paddr to
>> xen/arch/arm/include/asm/device_tree.h. So it sounds like it is a good
>> idea to introduce xen/arch/arm/include/asm/device_tree.h, and we could
>> also move the declarations of device_tree_get_reg, device_tree_get_u32
>> there.
>
> None of the helpers you mention sounds arm specific. So why should the 
> be move an arch specific headers?

The functions (fdt_get_mem_rsv_paddr(), device_tree_get_reg(), 
device_tree_get_u32()) are currently used by Arm specific code only.

So, I thought of implementing fdt_get_mem_rsv_paddr() in 
xen/arch/arm/include/asm/device_tree.h.

However, I see your point as well. So the alternative approach would be :-

Approach 1) Implement fdt_get_mem_rsv_paddr() in 
./xen/include/xen/libfdt/libfdt.h.

However libfdt is imported from external sources, so I am not sure if 
this is the  best approach.

Approach 2) Rename fdt_get_mem_rsv_paddr() to dt_get_mem_rsv_paddr() and 
implement it in ./xen/include/xen/device_tree.h.

However, this will be an odd one as it invokes fdt_get_mem_rsv() for 
which we will have to include libfdt.h in device_tree.h.


So, I am biased towards having xen/arch/arm/include/asm/device_tree.h in 
which we can implement all the non-static fdt and dt functions (which 
are required by xen/arch/arm/*).

And then (as Stefano suggested), we can move the definitions of the 
following to xen/arch/arm/include/asm/device_tree.h.

device_tree_get_reg()

device_tree_get_u32()

device_tree_for_each_node()


Please let me know your thoughts.

>
> [...]
>
>>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>>> index 0085c28d74..f536a3f3ab 100644
>>>> --- a/xen/arch/arm/bootfdt.c
>>>> +++ b/xen/arch/arm/bootfdt.c
>>>> @@ -11,9 +11,9 @@
>>>>   #include <xen/efi.h>
>>>>   #include <xen/device_tree.h>
>>>>   #include <xen/lib.h>
>>>> -#include <xen/libfdt/libfdt.h>
>>>>   #include <xen/sort.h>
>>>>   #include <xsm/xsm.h>
>>>> +#include <asm/device_tree.h>
>>>>   #include <asm/setup.h>
>>>>     static bool __init device_tree_node_matches(const void *fdt, 
>>>> int node,
>>>> @@ -53,10 +53,15 @@ static bool __init 
>>>> device_tree_node_compatible(const void *fdt, int node,
>>>>   }
>>>>     void __init device_tree_get_reg(const __be32 **cell, u32 
>>>> address_cells,
>>>> -                                u32 size_cells, u64 *start, u64 
>>>> *size)
>>>> +                                u32 size_cells, paddr_t *start, 
>>>> paddr_t *size)
>>>>   {
>>>> -    *start = dt_next_cell(address_cells, cell);
>>>> -    *size = dt_next_cell(size_cells, cell);
>>>> +    /*
>>>> +     * dt_next_cell will return u64 whereas paddr_t may be u64 or 
>>>> u32. Thus, one
>>>> +     * needs to cast paddr_t to u32. Note that we do not check for 
>>>> truncation as
>>>> +     * it is user's responsibility to provide the correct values 
>>>> in the DT.
>>>> +     */
>>>> +    *start = (paddr_t) dt_next_cell(address_cells, cell);
>>>> +    *size = (paddr_t) dt_next_cell(size_cells, cell);
>
> There is no need for explicit cast here.

Should we have it for the sake of documentation (that it casts u64 to 
paddr_t) ?

- Ayan

>
> Cheers,
>

