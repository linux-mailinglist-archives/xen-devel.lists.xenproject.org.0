Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD164F0AB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 18:52:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464856.723383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Er9-0001wA-Iz; Fri, 16 Dec 2022 17:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464856.723383; Fri, 16 Dec 2022 17:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Er9-0001tQ-G5; Fri, 16 Dec 2022 17:50:47 +0000
Received: by outflank-mailman (input) for mailman id 464856;
 Fri, 16 Dec 2022 17:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtZB=4O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p6Er6-0001tK-Sv
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 17:50:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27ce94c8-7d6a-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 18:50:41 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB7730.namprd12.prod.outlook.com (2603:10b6:930:85::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 17:50:35 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5880.018; Fri, 16 Dec 2022
 17:50:35 +0000
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
X-Inumbo-ID: 27ce94c8-7d6a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBI1xGG667WJpyFm1V+NHa4Lyw3WDXMyIHOFI/4qz7+FqJoTwcIe7Slwa0aonOA7cCVmpdwZzbweaUkgE9Rsy9QTGlWsJqbkg0nxYAP135mCHlrJs7b8YLuKS6LywBQc4pEW3FIzSX7ljL7rlBbTsC+o2v3tk+6w748GTataJUlrALFNkz9ONFLvRgfwA2K9jsBykKBfeeY/tkmR2BInzrAC7Q9CCFSFGVq1vIGu70HeY/RPaDlepK0THMZt8zXLj45cP3L7QBt5+lbv/krXNh+HazYgjGiy7EKO+BYZMSS1NBqyvAphE8k2KFIJ34pGvN7TmULz+TEe9+VkNW8UgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVNwLsqxWo1vowtRvXKJD+XzfLsOQGi/uv+w8CxO12w=;
 b=i91iPTt2VNG6N20Nnyp9T+uQ9NAF83vOWLw9yoDSgcJ4Ti9a6n2MFihmMp2HwL7/09jHHXxMQ/3Hv38l5iqnxo6z6gT4lTvWwaQoGHgoR0cdfEUBzhcFHRon3bzVG9ohNK7GnRB/NiWqWZ0/zTAO+Ysup6vVmfrWYP/5hcwXgs2slPLOuBWrtFEdnL4FLO7tBxR7AO669wuqZaVqXleIuR6rEdE0W5vJP8tnksxDWsTTlfZDm/bOqG+P2XmI7OpR6rbR1chtqwmLHmlhz6rxKeEdzNSF8jroBSLir4gP/uu3ntKxfSb0DDlu1Co0qCbA6K0kQeHRH821v9Vg2dybAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVNwLsqxWo1vowtRvXKJD+XzfLsOQGi/uv+w8CxO12w=;
 b=mTeGT/TxzM/RVxA9b8xYpbmWAVNYSeKEIZuygh7OeeOQHWXeBpqbua8AokKeREVJbiEcHVumxi1fs08k/4CgYFvqOJTMK8tYAxJeogr06FCGy8wt+b5pn9lmb1CEd2n+Nhf80QT8QXfX+27sUz14D8n1bfydCKgdPKh27mOZ1No=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8d20ba6a-463a-1301-1531-795d1a7f0b2d@amd.com>
Date: Fri, 16 Dec 2022 17:50:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v2] xen/arm: Probe the entry point address of an uImage
 correctly
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20221215123826.24145-1-ayan.kumar.halder@amd.com>
 <8d02db8a-e4db-2e0d-b014-b88714b30b09@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <8d02db8a-e4db-2e0d-b014-b88714b30b09@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0196.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: d1363eda-ca63-41ea-6dc9-08dadf8e08e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1OiUPSnKy/7Vxio0yl6k6tPF9l3VlNf0IgEDwUdqufKzSHSZZG2+zvXH5Q2vHH6pAhYXCkISrboUJXqNURMohB90r7emDNa3IgCF0xz2gm0Lq0lC2KS07b/frREU7cr1tc8PO8LLwaAImFFsmyzqCtlAlRarYXRvryEpzv2GjZbsu1m2+bIzQqeTLhVTkTVhok3o5OBJJAUJJZDuh23lwTh32zONGwAb2HzO8l7XTLwS5dhPGroTBjiNsazyikHiqb6WbqrwemIXvw9ZTjR40hfPX8FQUMjbVHI/RelhJudqElFkNW9MAoY5PuWi/pwStPO7gKrrm35zzugM6xSAUr/2qx0MoHz0ajrGZvgVoTkYGlnurjYgkRa6RSizLOWuOWxh6uIEHO/k7XH3OBbWebmWonAim3ugEKwtWhD7C3pR/wsnovB1tVwKBGdq1XSw/gUS2XMv25tL3LHaiInQ0wyrvPi+pLZrE3pNbaAiwACgdMTUWw7dwbrQ5csZEaeKC7tv9n1ti3vNi2t1e5j1xXxcX9+3wQ2f0MluR9hg7zhE+0NNmdDNPQDGpFWLjwzCrt5et/PZwfglpPMxJoNVOP52iqs+PFzcLZXdsVYfSsMLddPJ5TyRq+W0Vjdy7li3RJ6F4juArkEIIPtH2EUTQk0Y4Ov3QugHd70Kr2QYfWrhSnd6k70ZpsuFiOQKBofsQnb//kNOa3uM7+pgvYz9WBhQIsTeF8uh1ag1ToetRnn2oYsZxeeN/EHp+411mRUbnTo7Z8t6RJHheHhLJRDR4W6d8RgSAsjPWM08SSjmBT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(6666004)(31686004)(31696002)(478600001)(6486002)(6506007)(966005)(53546011)(6512007)(26005)(186003)(38100700002)(8936002)(41300700001)(110136005)(4326008)(83380400001)(316002)(36756003)(2906002)(66476007)(8676002)(2616005)(66556008)(66946007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEEzbHlBREJ4NFFBcTJ1Wmh2OWsyVkJ2SzRQclV6SDlNZ2hsMGRKQWtjMG96?=
 =?utf-8?B?V1JiNE5JcWgwdTF3NThVdXBYUFQrSVBHNWY0dDJZMHVZNVZ4VXVhMXo3anht?=
 =?utf-8?B?T0s4M0k2N1Vhb2JremIvV1AvWFhJaVV0Z0VadjlNbkNmL0RYckZjTHVSaTVN?=
 =?utf-8?B?TFBJZWNvQ2NYTGFDN0ZTei8rVzhUQjI1bGp0NG9IczQ4L0t4QWJDR2RNWjlD?=
 =?utf-8?B?Ly92eThocTlrU2Z6UjBZdmlHaWRZMy9BTXhPWkhZcjZYOTBoNHJvWW1aYU15?=
 =?utf-8?B?c2RWMWx6RUU5eFVuaHBTTkplQXFHVm5mM0JCTktwTys0OFdEbFBjejVnanJh?=
 =?utf-8?B?Y0d2MXJ0M214NzRYcEhYemlXRzVtVEN0NGJQa1lxN2l5ZUYveGhCTzRzYlgy?=
 =?utf-8?B?TWRDQmhhZWt5NlNiVjBSWjNFL1YxR2JRQ0dGUGlLRXdHTUhnV01najhET1Zr?=
 =?utf-8?B?RnU1dWVtWS81RGZpVm5wRmJzbFRsTnViVHI5WUUyQTJ6ejEwMy9idmk1UmZH?=
 =?utf-8?B?VnRKanJDMitpRHR1SHowcTdZS2lEOGhhMUlsLzl2NEZRVHdDdzNNZ2tSR291?=
 =?utf-8?B?cWpEWWpzemV5bm1wM0doYnVvbzhKU2Z3WDRDOGZpaXhVdE1WRTVkT0RBY0Uy?=
 =?utf-8?B?QzRmNnRMdi83WVE3QXVHRUlDK0g1MWdiMnp4RjRLSEdxb3RCSlg5SFNmZ3JY?=
 =?utf-8?B?QlkyWjAzOXhMUzBIRkxyNE5sNjBWWGszbVl5V0NQZ2xST1hCS0RuS1J5amFZ?=
 =?utf-8?B?b3Bxa3ZTTGEvcDZsVUVWQy9VRFlLaHNqN2huaFhGS0lzVXNBWENpZ2dNaW9x?=
 =?utf-8?B?T3l6TXE3VUV1dEFSbEcrQisxNHM5cFpDaE5QZ2JPQ2dzRmVVVGx6YjNJeEd0?=
 =?utf-8?B?R0lyUzNianVqaExpSGpoc3BBZktwU3BNbEZnTnNaZkp4cU82TmVMTC9vRTY1?=
 =?utf-8?B?S1JOOTBQRXI2QW5Mc0R6djBvOUdxYWMxQlE2ZWVVMWxOaHUxODRaWktBQlFL?=
 =?utf-8?B?L3lISlVaMGROMnlOWGN2eHZwa3JLZVFadGpKcy9xWERwNFlDMGpPcFExanI3?=
 =?utf-8?B?UzRudlB3eG5LdmhPcnl0U2FwRTVUWTR0bGZVMjl0cVFqZHplZEtEY1k3c1FN?=
 =?utf-8?B?MGJSOHdpUU0zSVNZOW1FVXJXb2JoaEJqdFAydFpwbndVZ0hEbkNwM3BWbEJ4?=
 =?utf-8?B?UERYNVV2aEhURmo5OHRZOHN2WTRxTUo4eUtEYzI1WmRBdm5VYmRqQ3pKM09v?=
 =?utf-8?B?WUo2TFpINmYvMkpXbGFZZTQzMXhjVTFOUXpvTUkzUHJCQzJ0T2JkK0dldnc1?=
 =?utf-8?B?Znhyb3VydXRUYmZ2dFpjeERENDRvbS8vWnV5MGt0SkpPZkJONHo4VTBPYVBl?=
 =?utf-8?B?eno2THJGbnBVbGZoOXFxUExaQmlUMmhhZkdNcFFtazg3dXh4MnZ1UnZvRHpF?=
 =?utf-8?B?Z083c3ZOOHJuNkFTbzk2Tzk5RVNtUjVpRWMvM0N0K0JGaGVmczFKcG1jN3B6?=
 =?utf-8?B?bGtKRnY2MUxoV2hFR3RObUs4MnVCMlphaWRyU0N0RDV4ZEpJVXNJVHVCbFJu?=
 =?utf-8?B?eUg4NFpieHd5NDFNMGg0Qi9yWkJVcGF0eS9OV3hZQ0RLaCtvdUNSdnhkaDhZ?=
 =?utf-8?B?SFVoSDJNY3g5d0gxNlJaanM3MkpWN2JGNVdEODJvZXVKMFBIRUNVaGY1VEdh?=
 =?utf-8?B?Z29maWY3a21GYlFqUDdVaTVaUnpXcnRsVEtScWRxMTlqT0FtamwyNFFXT0NW?=
 =?utf-8?B?dWxtamxhVnNZMjBad3g2RG9odDFnUzFINGRyUC80WjJKRU1qZTE4YnFPTG5v?=
 =?utf-8?B?bXkyK05ON25vamJtYnZNaXVLQjIxQlVDSXBMSEZpeVFldkkxSWlUV0tSTVNF?=
 =?utf-8?B?YjhCT3lNTHhZeVZlWU1GaXM0b3RzTU42U25scE1JWlNSU1hzZ1B2c3cwRWR4?=
 =?utf-8?B?Q1RUdURNdVRMK0I2bVpxK0FwSzRPbU1qQnJ6eWFGM3pDN3A5R2xmWjVLdnF0?=
 =?utf-8?B?d3Z3ZXZVVU05a3l3dHJmVGp6ZFljUG9zUS9iRGpBWnY4Zm80RUwrMyt5eGRI?=
 =?utf-8?B?ZUtSbzBscHcwZGd5OTFHa0hLWnMrcy8vK3VlVk9wK29wZWpDeEVab0N1bFBk?=
 =?utf-8?Q?K0NVKWl+FtwNIPFjf6DyBE4Dy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1363eda-ca63-41ea-6dc9-08dadf8e08e6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 17:50:35.6671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYGS0b2sh6aneG8jlLQWdO5x1ccs8BovPhVQntFXdDslCxb6nbBBo8sD4aKfLajigj6DI8AklkFkTiD41/iCFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7730


On 16/12/2022 09:34, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 15/12/2022 12:38, Ayan Kumar Halder wrote:
>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>> result, it contains the default value (ie 0). This causes,
>> kernel_zimage_place() to treat the binary (contained within uImage) as
>> position independent executable. Thus, it loads it at an incorrect 
>> address.
>>
>> The correct approach would be to read "uimage.ep" and set
>> info->zimage.start. This will ensure that the binary is loaded at the
>> correct address. Also, it checks that the load address and entry address
>> are the same. The reason being we currently support non compressed 
>> images
>> for uImage header. And as seen in uboot sources(image_decomp(), case
>> IH_COMP_NONE), load address and entry address can be the same.
>>
>> This behavior is applicable for both arm and arm64 platforms.
>>
>> Earlier for arm32 and arm64 platforms, Xen was ignoring the entry point
>> address set in the uImage header. With this commit, Xen will use the
>> kernel entry point address as specified in the header. This makes the
>> behavior of Xen consistent with uboot for uimage headers.
>
> At the cost of breaking existing users. I think this want to be spelt 
> out clearly.
Do you mean I should document this in "docs/misc/arm/booting.txt" ?
>
>>
>> A deviation from uboot behaviour is that we consider load address == 
>> 0x0,
>> to denote that the image supports position independent execution. This
>> is to make the behavior consistent across uImage and zImage.
>
> You want to explain why users want to use "0x0". Or maybe the other 
> way around, that only a very limited set of user (e.g. in static 
> environment) should provide a fixed address.

Does the following explaination sound fine ?

"Users who want to use Xen with statically partitioned domains, should 
provide the fixed non zero load address for the dom0/domU kernel."

>
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from v1:-
>> 1. Added a check to ensure load address and entry address are the same.
>> 2. Considered load address == 0x0 as position independent execution.
>> 3. Ensured that the uImage header interpretation is consistent across
>> arm32 and arm64.
>>
>> Some unanswered queries from v1 :-
>>
>> Q1. "In non-statically allocated setup, a user doesn't know where the 
>> memory
>> for dom0/domU will be allocated.So I think this was correct to ignore 
>> the
>> address."
>> A. I am not sure the best way to handle this. Can we make the uImage 
>> probe
>> dependent on STATIC_MEMORY ? Currently, I have mentioned that user 
>> should
>> use load address = 0x0 if they want Xen to ignore it.
> See above.
>
>>
>> Q2. Zephyr or any other RTOS have different requirements, then we may 
>> need
>> to modify Xen and document it.
>> A. I will take it in a separate email/patch where we can list the
>> requirements for booting Zephyr.
>>
>>   docs/misc/arm/booting.txt         | 11 ++++++++++-
>>   xen/arch/arm/include/asm/kernel.h |  2 +-
>>   xen/arch/arm/kernel.c             | 26 +++++++++++++++++++++++++-
>>   3 files changed, 36 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index 3e0c03e065..872262686a 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -4,7 +4,13 @@ Booting Xen
>>   Xen follows the zImage protocol defined for 32-bit ARM Linux[1] and 
>> the
>>   Image protocol defined for ARM64 Linux[2].
>>   -In both cases the recommendation to boot in HYP/EL2 mode is a strict
>> +Xen also supports the legacy image protocol[3] for 32-bit ARM and 
>> ARM64.
>> +For now, it supports images where load address is same as entry 
>> address.
>> +A deviation from uboot is that, Xen treats "load address == 0x0" as
>> +position independent execution. Thus, Xen will load such an image at an
>> +address it considers appropriate.
>
> Hmmmm... The section above is related to Xen itself and not the guest 
> Image. So I think this is misplaced.
I don't see a booting section for the guest. Should I create one in this 
file ?
>
>> +
>> +In all cases the recommendation to boot in HYP/EL2 mode is a strict
>>   requirement for Xen.
>>     The exceptions to this on 32-bit ARM are as follows:
>> @@ -39,3 +45,6 @@ Latest version: 
>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
>>     [2] linux/Documentation/arm64/booting.rst
>>   Latest version: 
>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
>> +
>> +[3] legacy format header
>> +Latest version: 
>> https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
>> diff --git a/xen/arch/arm/include/asm/kernel.h 
>> b/xen/arch/arm/include/asm/kernel.h
>> index 5bb30c3f2f..ee69a47052 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -72,7 +72,7 @@ struct kernel_info {
>>   #ifdef CONFIG_ARM_64
>>               paddr_t text_offset; /* 64-bit Image only */
>>   #endif
>> -            paddr_t start; /* 32-bit zImage only */
>> +            paddr_t start;
>
> I think the comment should be replaced by "Must be 0 for 64-bit Image".

But, 64 bit image can also have a fixed load address.

For zImage(64), start is always 0.

For uImage(64), start can be a fixed load address (if it is not 0).

>
>>           } zimage;
>>       };
>>   };
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 23b840ea9e..81ac945f5b 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct 
>> kernel_info *info)
>>       paddr_t load_addr;
>>     #ifdef CONFIG_ARM_64
>> -    if ( info->type == DOMAIN_64BIT )
>> +    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>>           return info->mem.bank[0].start + info->zimage.text_offset;
>>   #endif
>>   @@ -223,6 +223,30 @@ static int __init kernel_uimage_probe(struct 
>> kernel_info *info,
>>       if ( len > size - sizeof(uimage) )
>>           return -EINVAL;
>>   +    info->zimage.start = be32_to_cpu(uimage.ep);
>> +
>> +    /*
>> +     * Currently, we support uImage headers for uncompressed images 
>> only.
>> +     * Thus, it is valid for the load address and start address to 
>> be the
>> +     * same. This is consistent with the uboot behavior (Refer
>> +     * "case IH_COMP_NONE" in image_decomp()).
>> +     */
>> +    if ( info->zimage.start != be32_to_cpu(uimage.load) )
>> +    {
>> +        panic("Unable to support mismatching load address and entry 
>> address\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * While uboot considers 0x0 to be a valid load/start address, 
>> for Xen
>> +     * to mantain parity with zimage, we consider 0x0 to denote 
>> position
>> +     * independent image. That means Xen is free to load such an 
>> image at
>> +     * any valid address.
>> +     * Thus, we will print an appropriate warning.
>> +     */
>> +    if ( info->zimage.start == 0 )
>> +        printk(XENLOG_WARNING "No valid load address provided\n");
>
> This is likely the way user will want to use it in a non-static 
> environment. So why is this a warning?

Sorry, it should be.

printk(XENLOG_INFO, "No load address provided. Assuming domain is 
dynamically allocated\n");

I just wanted to give user a heads-up in case if they are using in a 
static environment.

I can drop the message if it is not much useful.

- Ayan

>
> Cheers,
>

