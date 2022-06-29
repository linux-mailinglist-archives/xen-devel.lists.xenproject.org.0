Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B475609E6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 21:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358054.587024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6cxc-0004gi-QC; Wed, 29 Jun 2022 19:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358054.587024; Wed, 29 Jun 2022 19:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6cxc-0004dp-NU; Wed, 29 Jun 2022 19:02:48 +0000
Received: by outflank-mailman (input) for mailman id 358054;
 Wed, 29 Jun 2022 19:02:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Omrp=XE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1o6cxa-0004dj-RY
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 19:02:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e814f6d-f7de-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 21:02:44 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB3213.namprd12.prod.outlook.com (2603:10b6:208:af::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 29 Jun
 2022 19:02:41 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::6d20:93ce:c4d6:f683]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::6d20:93ce:c4d6:f683%4]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 19:02:39 +0000
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
X-Inumbo-ID: 0e814f6d-f7de-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7yhwyW5XKCuJtmcURuiFUKUCOQ4oAc9ZtHo4/D60DzzCqsWjS2MDltwX91EQSzHgv4E+g9CHzaI/4XhuipMmyFd0NWT9A7jXJ3VQjMaBpk/GkUhQGFsgXvHSM3DxrtDVkezxwhMCxVazQyM+vZ1S9e1uruz1CvDCsdQDseXA5Aj3ATGmbMjdGQC7o5rKwwqbe4qvKJ+ilmYPiGFjj/D9XGSzAOtl7uEJtuSizniqpOkCmA5e+3/FY8WvawTBjJKu+lLnOp+xZn+FxzmAa1rlb8iHsHjvtUVWRIhUyIvqT239j6/ySEupzLFXoBXaX+hxoRjZN55u6muKk1LcDCaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JGreh3MVBlu7GqnDF7jol/Jz//foxmoiPKAeC7DaPk=;
 b=EpUFwtsVaumQ7bXfzJl0sq4Tu+pefiJIAL4r73c7w5yX+YPSSkWhuZuTnwm9ejRtQkKIKOr79PyHB1/c58nOUM3bYeV4wII4oZJU2YrduG2AgYNFjKkeoOk02PDs0YZMsdlROtPTZyMpm2huFKSkFK1GnfiRGdPLkVSqZupGJCC235AAbrNCreuKUaiSwzpHG1VBQwCli4GKVLLmO11DGf5B73PHQlR1HWhbuQMUHPk/1bCAIoaBfd+7AEFxBwvpR/XDZCQ32KsJZdBU5WJzjIJpT5VXyxyi5w2+mgw2xOtido34aI5nrHns67UniyO+J/zXowSkcarGcT1in4gO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JGreh3MVBlu7GqnDF7jol/Jz//foxmoiPKAeC7DaPk=;
 b=qZMvPozvhDQdgWBKK1JrErT5AR0rf/bsY7Smd83YqOX+XwWXS6z92YpCaFsiC3mMdjdjzs8gx+toZ/Sx+y+ADxaOBllTgCncRnbXWRl9WMNGb7v4GArk2FIWS1V85SrF/XaqKeEi2mFbTpi/997tpZrCtjp+6jHJE2n2qP+p3Vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cafc1602-6f5f-3238-801d-29c13ed37f50@amd.com>
Date: Wed, 29 Jun 2022 20:02:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] uboot-script-gen: do not enable direct mapping by
 default
To: xenia <burzalodowa@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net
References: <20220626184536.666647-1-burzalodowa@gmail.com>
 <20220626184536.666647-2-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2206281727080.4389@ubuntu-linux-20-04-desktop>
 <22476413-14da-21cd-eb02-15165bfe602a@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <22476413-14da-21cd-eb02-15165bfe602a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dbb6d1f-1523-4c13-5463-08da5a01effa
X-MS-TrafficTypeDiagnostic: MN2PR12MB3213:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T1zs6+JEVk8BAVVphdMakwyGz8GHlUoUWSIqIPgnggbgzi9Kxj66T0QaufmLG5YFxxnX+wfKOR8AAT8sAKIHd0hhhaUK9hXnXzON0t/Fv5KOFPmJUw2h39LPxZwOg+VaSx55QIm/mBHAKE30WsCr+85FTM2qusiTuN49f0TBzoYy8GetpIQmtMr7wX2eCg3hno3QzEvraVsF1DTO3bdArno4fA8nxajmaRqEjkvDGuC7vS4EBP5Lg9NEwwYep2KG99dgpjtgPlP2cCT35Wji4tAf0T17CffS86ZvuWZzK33w6mFyvrAzC0ex08Pae1QPrBMEggNUC1/xWtjd6Q/4cexzWVG38dZf2mlLJv92oRpQPJ5o5bO8bI7HWgs6Ygty5/26EieoGERF+lrDOvulfDvCl4AdbIuOpn1d9+mBQ7APexNwfPGIFHsuJVRf5Z3JCp6f5RxbviNdrhiIRiFZ0VmS/crwamCqrcs4dAt21wXSKsDiAZ4gX+PqFfO7c0AgCN0Kb/nA8AXA9DSNJcT5hMs2oTmPytwc92PSiAlyxGM9WInrGEoAFGylIXMpxXIsZiJsqD3OBCQoxBFTfRVZHYT5Lm5dDDE8YE6CLc4Di/olWA2mTBp+/oN1h5OgNotkjO+5TVqCmbV3guiliNmiZa38zaUS+A11KAdx6ir1s480D5yx/850b60xZGrUouN0fpIIMNeZWzRJ5db3qV+EpNJLXwlKyJh25ItbaXt7UPouPsZATvyF9c5sYthm9VxrsBSywVRvDw5ftxBPEofmQ58B4EfToadTOv9WKB9bGOsVvav+5zGc/Z7koYoiY7k5j0C9dnW6zB3Ejks35hKtvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(66946007)(41300700001)(110136005)(8676002)(6506007)(53546011)(6512007)(36756003)(66476007)(186003)(31696002)(31686004)(8936002)(2616005)(2906002)(38100700002)(316002)(66556008)(6666004)(6486002)(26005)(478600001)(5660300002)(4326008)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEVlK3lqTVRpVStSYzJHNHBEalhNQjFjaGZEN2JWNGhCekIzV0dkcjQvdFVB?=
 =?utf-8?B?NGd2ZWpieDJNZjl6OFo4L0w1YU1oRFVSd2F6UFgycEo1RXRJc1g2bHQzK1Y0?=
 =?utf-8?B?dnZaQy9kbGloSm5xa1QxQ2hJbE9xT1BSNkgzRFlqMDYvT1lHNURoQk9DMVRw?=
 =?utf-8?B?NWJucDlBaldPQjZLcUVabU8xNEtxb0h0V2VTZ3hQNVQ5c3hRWkpCNU1xaGNT?=
 =?utf-8?B?QWlCcFdic2J5TTZjZGN3UWhqN2pybjlCQ1BDYksxN3Y3elZKMjdWQlZFMldK?=
 =?utf-8?B?dUxuamdBWVVzdnlNbWdTOXd4c1NYM2tua1Iza1B3TWsyaWR4N0w1aUxQeE1N?=
 =?utf-8?B?N2FwRS9kWTVRZ3plSFQ5SDQzMURlMTRyMzdtdXpleEN0YjExRlpIRnZWcDZr?=
 =?utf-8?B?TkhmN3ViWTV1M3VpRWlKak81RmU4YkpWTnBnM3lkSEMyM3FkUXNPMlQvT1dN?=
 =?utf-8?B?NHEwMmpNdVRMYWhxeWpMWlRnSFZOQ2NLY1poWmN3U0pOVGVuaTJTR3NIMUFD?=
 =?utf-8?B?VDdMd05Ja2FQdFVxSG1BR0lGV1g3M0VEQ0NsZHhQdEZHZS8ySGVkYmVXU084?=
 =?utf-8?B?KzNjRHF6bWpHWFhtY1l1Vk5mNkRUVjV1UnJZeUsxWlllNjhuOFBXcTJBZDBL?=
 =?utf-8?B?YWE4TTFCNnpBQzFHbFRoSzl4cGtmYlRrL1QyV1d2cGtaQ0k3Vkc5S2NpbDFJ?=
 =?utf-8?B?QWtkT0Y1b2lnOG96ZVAxdUVOVEJsS1hma2JPVytsUjJFci8yM0RJQldEMTFm?=
 =?utf-8?B?N3dNVkdURDZsc05GQ1pVQVJmNFpDem90NnVaTzVFbElaZ2NLQS9MU1pmMXFt?=
 =?utf-8?B?U0xLM0ZlVTRLMTV5YjArNWlRUFFNVDlRdXp0VjlGU3Uxd0I1bEZnaXg1MHNS?=
 =?utf-8?B?L3AxZ0tlV01FREFOQUtZdTZVSlhWZkdUYmUrVzZHcmU5MEVkQXFKRk5jMHFj?=
 =?utf-8?B?RWgyaC9LTjRHMURrVG81SitpQ3p1YUpZMDhjNG96dHJtUGptOGRuSXBOWllL?=
 =?utf-8?B?WVB5dExEUHFlL1gyT1N3QW9PMlRZb0lCUXdkUktIOG0yZTRNTjN4cHBsdFI5?=
 =?utf-8?B?REpydURlLzAxc1VZYWxvV2JYZXBlVXE2R3hLaG0xM3J3UWE4WWR1b3FMWXpo?=
 =?utf-8?B?SEh4Q2NETXZjdjRYbHNDblBVZDB2eTJKaW1PaWgvcDIzYUhJMHBudThpZ1Zi?=
 =?utf-8?B?WlcrQ3VROXFvRVUyTDY1MUVKL0tsOCtVbjUvRmM0M3Fyd1J1a3FMOGN6U2Y5?=
 =?utf-8?B?cEhHekdEcng0ZXVhNUhJRFdxU2JJcXY5cTFIL2ZSOUFnZGUweGJIVm1kQWNy?=
 =?utf-8?B?dVFNT2JpMmJHWGxocUFRVU80KytsVFdLYllIUFFXTVFOdnNwUkVwMjRwWFNB?=
 =?utf-8?B?cmc1T3c2N3ByVFVvRnVzTk4yZ2xEb3dLQWRpVHhNUC94blhJSVFIUWo4VGkx?=
 =?utf-8?B?b0tPTXRGYktwUWJSTWVBeFVxUHgxV2NOeFFpL0l5SjlpRUJIWGZ0ZGQ2Y3V0?=
 =?utf-8?B?WEhORG04NnQyaGZHLzFXS1RINmpwcTN0YjRBQ0RGZVdnemtoNEs2RVQxSXUv?=
 =?utf-8?B?S3VUSFFVMGFpam9BTFBMQmpiNlFiRDEySHlNbWxYQ3RKUW01SnIxYkF5WGY3?=
 =?utf-8?B?THNpNjc5N1h3NzI4SWl6eXJTanJ4bGF6VklhSGpvZHlxZDk0VnVvM3BGUXhq?=
 =?utf-8?B?d2hWOGhpN0N2KzM2Q2dGc0Z4Z3VnNVdGRkZqekhvejZZVWwzc2JmS3o5RU9r?=
 =?utf-8?B?SWpXTjMyM1VZd0s0LzFpaVRzSVBCS3cvNXpyK09wYzhqM1RPZXNnYkd4V0x4?=
 =?utf-8?B?eWNQOEd1STVMTXp6QlRNTytheXE4aXk1bFB0UDhyOFk2NW5GN0dDYjNSazB3?=
 =?utf-8?B?Sk5zLytLWHdrTFgydFUwVm9lRldsSElqT1RYU1hjdEpiTlVObXZBNUIrczRm?=
 =?utf-8?B?d0t4UUhPTnBWWUIzelVMdEx4N1NlTGZSM0NIUTE0SlBpbHJkMXNiZTB1dDBn?=
 =?utf-8?B?SWhDcUVkZXNETzlKWjBuS0MyTW1jdXQ3Sm4wSTdZc3BkNmdkY3FFSGFNM2kv?=
 =?utf-8?B?V09DT0ZMcTROZTNxOHRqUnRySVcwalc2TkVzQjJySmlpQjZnMWpiV094a2Zx?=
 =?utf-8?Q?iTV3K2PSTDKjBLIoswWrZmSIM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbb6d1f-1523-4c13-5463-08da5a01effa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 19:02:39.6629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZ1Kq5CIzUT/CrHm+7XB0s8j5ontfvWzuPxojisrYN4Vi5vd932RaMh3AS0j/g9sIQL4t4s54U+EEO/V+8a1oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3213

Hi Stefano/Xenia,

On 29/06/2022 18:01, xenia wrote:
> Hi Stefano,
>
> On 6/29/22 03:28, Stefano Stabellini wrote:
>> On Sun, 26 Jun 2022, Xenia Ragiadakou wrote:
>>> To be inline with XEN, do not enable direct mapping automatically 
>>> for all
>>> statically allocated domains.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> Actually I don't know about this one. I think it is OK that ImageBuilder
>> defaults are different from Xen defaults. This is a case where I think
>> it would be good to enable DOMU_DIRECT_MAP by default when
>> DOMU_STATIC_MEM is specified.
> Just realized that I forgot to add [ImageBuilder] tag to the patches. 
> Sorry about that.

@Stefano, why do you wish the Imagebuilder's behaviour to differ from 
Xen ? Is there any use-case that helps.

- Ayan

>
> I cc Ayan, since the change was suggested by him.
> I have no strong preference on the default value.
>
> Xenia
>
>>> ---
>>>   README.md                | 4 ++--
>>>   scripts/uboot-script-gen | 8 ++------
>>>   2 files changed, 4 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/README.md b/README.md
>>> index cb15ca5..03e437b 100644
>>> --- a/README.md
>>> +++ b/README.md
>>> @@ -169,8 +169,8 @@ Where:
>>>     if specified, indicates the host physical address regions
>>>     [baseaddr, baseaddr + size) to be reserved to the VM for static 
>>> allocation.
>>>   -- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
>>> -  If set to 1, the VM is direct mapped. The default is 1.
>>> +- DOMU_DIRECT_MAP[number] if set to 1, enables direct mapping.
>>> +  By default, direct mapping is disabled.
>>>     This is only applicable when DOMU_STATIC_MEM is specified.
>>>     - LINUX is optional but specifies the Linux kernel for when Xen 
>>> is NOT
>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>> index 085e29f..66ce6f7 100755
>>> --- a/scripts/uboot-script-gen
>>> +++ b/scripts/uboot-script-gen
>>> @@ -52,7 +52,7 @@ function dt_set()
>>>               echo "fdt set $path $var $array" >> $UBOOT_SOURCE
>>>           elif test $data_type = "bool"
>>>           then
>>> -            if test "$data" -eq 1
>>> +            if test "$data" == "1"
>>>               then
>>>                   echo "fdt set $path $var" >> $UBOOT_SOURCE
>>>               fi
>>> @@ -74,7 +74,7 @@ function dt_set()
>>>               fdtput $FDTEDIT -p -t s $path $var $data
>>>           elif test $data_type = "bool"
>>>           then
>>> -            if test "$data" -eq 1
>>> +            if test "$data" == "1"
>>>               then
>>>                   fdtput $FDTEDIT -p $path $var
>>>               fi
>>> @@ -491,10 +491,6 @@ function xen_config()
>>>           then
>>>               DOMU_CMD[$i]="console=ttyAMA0"
>>>           fi
>>> -        if test -z "${DOMU_DIRECT_MAP[$i]}"
>>> -        then
>>> -             DOMU_DIRECT_MAP[$i]=1
>>> -        fi
>>>           i=$(( $i + 1 ))
>>>       done
>>>   }
>>> -- 
>>> 2.34.1
>>>

