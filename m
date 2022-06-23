Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A155776D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 12:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354782.582080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Jl9-0007GP-7Q; Thu, 23 Jun 2022 10:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354782.582080; Thu, 23 Jun 2022 10:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Jl9-0007Dw-2c; Thu, 23 Jun 2022 10:08:23 +0000
Received: by outflank-mailman (input) for mailman id 354782;
 Thu, 23 Jun 2022 10:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyAp=W6=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1o4Jel-0006WW-Ux
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 10:01:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cf71192-f2db-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 12:01:46 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB3162.namprd12.prod.outlook.com (2603:10b6:5:15c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Thu, 23 Jun
 2022 10:01:43 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4047:c750:5bc6:19d7]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4047:c750:5bc6:19d7%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 10:01:43 +0000
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
X-Inumbo-ID: 7cf71192-f2db-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAUdodlVXEMz28ush/AUBB2qdeafSHPKTqUcJIl7nKIzCP5uGxWCrVsbR8HURgt17L9kGHDuHkCbuIcq9eoXN91fDmonlLkQoGuVMGqvUT35vHSmPhU7wZFyAZt8hzfuCL3BE9fceqvro4Pbpf9biugpwkL7TWwRvLO1CjEIOTtLcXgdagSSN1s0XXtxdvnZp1Nu9zmluJ9kLckLGS7h4QGVeMHDyOhizT5UKYYRoOf0Z8rEfKe9wSwR9pzZtrSlPdTwPWRzrnP/J2psN21ts5rhrV5nvJl4+BLerM2EK5CfES/AwX4m9LfxN4t+aWQZd72JqVvPULLcRbE9+NgvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QchqiwzMhFPp3iADoHJex6tyQYZPXj1IG5hE14D1wWE=;
 b=RFWL+GOxoKi8YMWBnID6HjIvqV4Wx7pllkRNMhijw4pvzQ6FNeVry0ub9e40H+UZSOgoCBjx3n9XCMWtkahcWG0AR1g6uf//4eNCd4JL34/tzbmj5GPEMQA09lUggBxHnYntYZvAmnfEi2djGkRxopYXs8epCs0/nyoKF/ss7EX2C1MtEAXB1XWk01K2E/YMobWEIl+M4SuIa091sADoXiWVG9Swqy5H1QGuM8mQVZr5siAlonPHNK9wvd00ck8qNRs+nVr3FWFHXkJI7bd6K616l5HMvZFQRmiuDTRh7pfjB0c3krGgfh0o+cXBRBJaD4BTNp66QMDc9sWvViFOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QchqiwzMhFPp3iADoHJex6tyQYZPXj1IG5hE14D1wWE=;
 b=lbQvDnhqQoBW9v+6roV0ZYfpz1HbM9H6FAvOJidtxjAvFXuJ4Ph4HKvk4JjDVr+ndA7KHPyqppT0FWn2Snd7nlPbn5Gtt2eRr83Lzg/fprYH02cpF2lVCkAUSrmCsxPDWglCs1yeoVMb8DAZ0crZ1SCMq3+wX0LkNQa5IBW48x8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <94cca06c-8439-ec92-3bc7-8f2a69929beb@amd.com>
Date: Thu, 23 Jun 2022 11:01:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [Viryaos-discuss] [ImageBuilder] [PATCH 1/2] uboot-script-gen:
 Skip dom0 instead of exiting if DOM0_KERNEL is not set
From: Ayan Kumar Halder <ayankuma@amd.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net
References: <20220619124316.378365-1-burzalodowa@gmail.com>
 <80dc865b-f053-d9c9-b8d4-efb19abb2e49@amd.com>
In-Reply-To: <80dc865b-f053-d9c9-b8d4-efb19abb2e49@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0311.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::35) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fba06cf1-3c6a-4509-127c-08da54ff5ffb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3162:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR12MB316263F597647D8758716A4ABCB59@DM6PR12MB3162.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JF1g9IYPbZ1vsaYvzI/ktFfoS2+Ar2fzR967pCeEJi73s1Dsq4w6ZoIGDkewvsrnr+KdxNxhCZP5hwQ5cNLu0sbQfkW5YQw+8E8T4MOvS8Udno/iUn1WrT76myvE9aDfvtg4OZdZRe0gLa2Ona6jtDdQ5FtKo4uUP0/HxOW6eTocxWFY0mPIsT5/8H8Ru7OSVt0oqmRYmZSVeCICRWY2uxz85tqEXrryHSFP59o98fEhoQIYO3D6mqDuqA3LAPPJwWQHKOfd5wV7+BTqV3hIlRZU/1+fOD+gei4MOIHgZsPzGtfiHIytNp6dwJvfflrxb73/Mw0Cv9RcDmwnsZ4c/KohARLVkft/hxxNyRlJffe54WIvoPKmN6lNBrpglhX3oMFB9qVs0LkCjSK0ifi/YQ5HxQg+qfb86PysxFoq97YpZJf/ROW+q6/yZNQAI1r/xP8vfenK7Z25UtFaPKC4iAST8wgPV5it1xip9Wp8CxxAVDLjxP/QkISVZto6ZnvCye3jFFz67+LNcqFfkRQH+62Qo0GKTu5NvKwd7lN4Sn9eXgcgHLx6TyWP73u/HlZu2UyCHPLla9FSVCAGQ0mG/wTA25oMY7kgBg36S0vYb+fX1alq66/xz0Ur0AWMkg1n5KpUbtxkGZ0E/HFqgkK8rRimsrnkiPbm99DDlw4/Qhs+xvTN7n1sEljuY2yZO4+kWAdmv9hV9QjGDAKQws1QPbXFsBgqp9KNFLHGG9yRsSZihCvB8TJwCK3yLqxtwjyYJx5I8LbuqR9h2N5M2ZnIy7MQvvpApO5L+5ajAlgKpNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(6666004)(4326008)(66476007)(66556008)(66946007)(316002)(186003)(31686004)(6486002)(36756003)(8676002)(478600001)(83380400001)(6512007)(8936002)(2616005)(38100700002)(41300700001)(53546011)(6506007)(5660300002)(2906002)(31696002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVhneDlVMUdGQzAwT3NySTU0b0xLbkhVd092L1AzZkw5MWQ4aVhiZUxmc3Uy?=
 =?utf-8?B?akhRUSt3N2lSZTY4NGZaMGZ3S2NidXg2MXZlczBLQ0tDTmpSQXR5NFZNaHZ6?=
 =?utf-8?B?ajBUWndDOXNSL3ZKZWRob2tIQkhNNllldUI5aDhVeHltZk9TUXlCd2F0ZjBw?=
 =?utf-8?B?QW5YTUpLVjRPRzBId1JaczFHRzRaMllKeUQ3Z3lZZ0lFdVZ6YlFNQklxMFRR?=
 =?utf-8?B?THhsR0c4T0N4Q3pkSnlPLzIrRnAyMTQ5dWVkK3Y0RWlkWStBTDQ1dlA5a3da?=
 =?utf-8?B?N3FTTTlURU54SjlHOGN5NkttTzgwalc5eUJKTGNlTm0wQzdsdnViUlB6a2VV?=
 =?utf-8?B?RHFOekRYeG1pYzJuN0ZTeFh6bVZHU280TFd1c2YzdjZOU3Z6U0x5ekF2Rkpr?=
 =?utf-8?B?NnlVTEJPcWUrd2F2cVZHSHNzczFDdHRzKzhVbnhoZXhYQUlFOU12VmRNckEz?=
 =?utf-8?B?dDNWazlUNEFJZ3pzQVhpZGVBNTU4UFd0bmpoNDRRL3NIeVJRMnNYYzZoUDY3?=
 =?utf-8?B?SlAyVkxGTERicTkwa1ZzZXl4OUhIUDBOc1dIZy9sdEhHZjY5OHJPclEyaVFG?=
 =?utf-8?B?NUIrY3lPajAyckNDTExUa1ZxclI0V3ZlTFZFcGYrUHFCaTdOZVdkNlZaL0Vs?=
 =?utf-8?B?RWlObnFHKy9aRmRhZkh4cnFBL1lpT2JQRUI1cFVKQXhkR3Y0Nk5PSXpwb2xH?=
 =?utf-8?B?ZUlIVDd4Y296aCtLU25aMk0rSGJ5RWQySEgwYjlwelNweFpCOU52cTVlRFlj?=
 =?utf-8?B?ejFuaGVOODhVOGZpNTB3Slg4cEMzWHprSmVvejA4MUduMFhGbVZ3VGlIT3d4?=
 =?utf-8?B?K05LT1FWMU9UR0VLdkVQckFrRnZHcWRTK0szZnA3OXByUldOZ05MTitFTGRk?=
 =?utf-8?B?T2E2OXVET1p1S2pUdWVyQ0h6bnhsY0dicy9kYnFyd3ZHZGtKUC9POFR4aTN3?=
 =?utf-8?B?RHRKRWNuWVdvMnF6VUN4SFBuZ1ovUk1vUUVPc3ZYSnpZRHBSd29zNWZESXFv?=
 =?utf-8?B?V3NXMjg3OWVXd21Nd3dsNWVTcXlya2x3dW5wUWk2TmU0YURraEg0TDFwKzFk?=
 =?utf-8?B?VEhMaEdxOGxidXBRdmZWUFVzMWdxU0NhT2lOREpOVUQ5dmVMd28rSnpxanR5?=
 =?utf-8?B?OCt0VnVudHNRTGgzTlB3V3paSUpDSFNrc2VFYnVyZ0ljY0dIU1d1WnBVczJ1?=
 =?utf-8?B?OTlxWng2RzdUcnN5U1AwOUJWN2JDbmV0SDhtSTNDV1Ixc0RmVjNDdGhyb0pK?=
 =?utf-8?B?U1IyQitURWpQVnFTZVVRR0dheVgrOXVkWDV3MmxuRFIxMmxDM3FvTlU1OTR4?=
 =?utf-8?B?VDU5eWpiL1g2b2xGb3dHMnd0RGxUZ3lFMXowQ3RnYXlRaW5EdEhWUDk3WTBQ?=
 =?utf-8?B?NFBiRjNLd3VSazk4ZzJPQ05PSXZlOVpyRHBDRmkwSFgzb2EwcE92OFltNHJU?=
 =?utf-8?B?dHFOMUtNeXRrV0s3dUFGMmNDZW1wTHhreDNvWnlxU2NkZUdtL1BiZUl1dUZv?=
 =?utf-8?B?MzlYQ2w3MFZyZE9sOWVOdzlHWUNJUGZvSXFSSDdGODdvK3NqcG9yVU9Kbkk2?=
 =?utf-8?B?Njg2RGxGYjRFTVg4MVRpYitxTDk1Qzh4SFZyTDZ4OUk1Y1Rjc2UvTEptQ2tt?=
 =?utf-8?B?aU10bVYwajE1ZmkyVzJBR2UwMkgrRmEwbEZoTm9NNUZmZ0xCcHZhdXlDaUQr?=
 =?utf-8?B?a29MQmsvYXpQblhmNXFGUXlYVmNBckxIcUdjMGgxclhvZ0FWS1dxM3RQaWRC?=
 =?utf-8?B?cncydG9BWmNZTmNXK3pJSHRqSTZzOUF6c2JVb0gyanNLUWRYTlIxYjZjbGV2?=
 =?utf-8?B?VmczREtSS2oyVHZTOU12MzlEZ2ErVG12NFNmNTJndzdLMHRadVRlWkViR1NV?=
 =?utf-8?B?U21LbjVoOFFyQUt3RWlaMGtmSU1sTlpwU2IwczV4d05zMlRMN0Fva0lZRjRK?=
 =?utf-8?B?bENLS2RVOVU0WFNvWWphaG9PZ0ljRTU2eVc4VDY3VldxTjdxM2RYcjV2WGxD?=
 =?utf-8?B?ZHlpRkx5RVl5eHFjTDVlVFc3UzNSRWZvTk1LejJCNmtnWVp1QUxOME5PeldK?=
 =?utf-8?B?WW82UmRvUnpnSXVtTGxvdmM0NUlueFpsYm0veVBmY2N3UFRjTjRQdzcwblRO?=
 =?utf-8?B?UXZRQjdQczVLTlh0TUo3U1F5cFM3MlJwY0pzSGpSSWZwaDBQQi82ZGJmdVdq?=
 =?utf-8?B?OUwxZU9INys5dStjelo3WGJSUnQvYTI4NVJXaHAxcXlJRFJXRjh0S1BRSENk?=
 =?utf-8?B?VFVmeFZpbzJGSHFQWUg5Q1JnbkhLLzhGNE5Od0s2dTRzcUxYUnlGenVFOTlk?=
 =?utf-8?B?VjF5SkVUY2dlai9EbFN6V25DeGdTblEyVitRSVJVeDdJcXdzT3RrZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba06cf1-3c6a-4509-127c-08da54ff5ffb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 10:01:43.1436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baY/sfUoILVSvrB5FzYPT0tsvUhEspVkZ3YzwEWgCkE9HTFLCVl/EWBdaUkGYYsUxxIOLLCX6t7AdXJfhygnUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3162

(Resending mail, as the previous delivery failed)

On 21/06/2022 11:57, Ayan Kumar Halder wrote:
> Hi Xenia,
>
> Thanks for the change. It looks good.
>
> Some points :-
>
> 1. In README.md, please mention in 'DOM0_KERNEL' description that it 
> is an optional parameter. When user does not provide this, it 
> generates a dom0less configuration.
>
> 2. In uboot-script-gen, please provide a check like this :-
>
> if test -z "$DOM0_KERNEL"
>
> then
>
>     if test "DOM0_MEM" || "DOM0_VCPUS" || "DOM0_COLORS" || "DOM0_CMD" 
> || "DOM0_RAMDISK" || "DOM0_ROOTFS"
>
>     then
>
>         echo "For Domoless configuration, "DOM0_MEM" || "DOM0_VCPUS" 
> || "DOM0_COLORS" || "DOM0_CMD" || "DOM0_RAMDISK" || "DOM0_ROOTFS" 
> should not be defined
>
>         exit 1
>
>     fi
>
> fi
>
> The reason is that user should not be allowed to provide with an 
> incorrect configuration.
>
> 3. Please test the patch for both dom0 and dom0less. The reason being 
> such a change might break something. :)
>
> - Ayan
>
> On 19/06/2022 13:43, Xenia Ragiadakou wrote:
>> When the parameter DOM0_KERNEL is not specified and NUM_DOMUS is not 0,
>> instead of failing the script, just skip any dom0 specific setup.
>> This way the script can be used to boot XEN in dom0less mode.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>   scripts/uboot-script-gen | 60 ++++++++++++++++++++++++++++------------
>>   1 file changed, 43 insertions(+), 17 deletions(-)
>>
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index 455b4c0..bdc8a6b 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -168,10 +168,15 @@ function xen_device_tree_editing()
>>       dt_set "/chosen" "#address-cells" "hex" "0x2"
>>       dt_set "/chosen" "#size-cells" "hex" "0x2"
>>       dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
>> -    dt_mknode "/chosen" "dom0"
>> -    dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage 
>> xen,multiboot-module multiboot,module"
>> -    dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 
>> $(printf "0x%x" $dom0_kernel_size)"
>> -    dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
>> +
>> +    if test "$DOM0_KERNEL"
>> +    then
>> +        dt_mknode "/chosen" "dom0"
>> +        dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage 
>> xen,multiboot-module multiboot,module"
>> +        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 
>> $(printf "0x%x" $dom0_kernel_size)"
>> +        dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
>> +    fi
>> +
>>       if test "$DOM0_RAMDISK" && test $ramdisk_addr != "-"
>>       then
>>           dt_mknode "/chosen" "dom0-ramdisk"
>> @@ -203,7 +208,10 @@ function xen_device_tree_editing()
>>               add_device_tree_static_mem "/chosen/domU$i" 
>> "${DOMU_STATIC_MEM[$i]}"
>>           fi
>>           dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
>> -        dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
>> +        if test "$DOM0_KERNEL"
>> +        then
>> +            dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
>> +        fi
>>             if test "${DOMU_COLORS[$i]}"
>>           then
>> @@ -433,6 +441,19 @@ function xen_config()
>>               DOM0_CMD="$DOM0_CMD root=$root_dev"
>>           fi
>>       fi
>> +    if test -z "$DOM0_KERNEL"
>> +    then
>> +        if test "$NUM_DOMUS" -eq "0"
>> +        then
>> +            echo "Neither dom0 or domUs are specified, exiting."
>> +            exit 1
>> +        fi
>> +        echo "Dom0 kernel is not specified, continue with dom0less 
>> setup."
>> +        unset DOM0_RAMDISK
>> +        # Remove dom0 specific parameters from the XEN command line.
>> +        local params=($XEN_CMD)
>> +        XEN_CMD="${params[@]/dom0*/}"
>> +    fi
>>       i=0
>>       while test $i -lt $NUM_DOMUS
>>       do
>> @@ -490,11 +511,13 @@ generate_uboot_images()
>>     xen_file_loading()
>>   {
>> -    check_compressed_file_type $DOM0_KERNEL "executable"
>> -    dom0_kernel_addr=$memaddr
>> -    load_file $DOM0_KERNEL "dom0_linux"
>> -    dom0_kernel_size=$filesize
>> -
>> +    if test "$DOM0_KERNEL"
>> +    then
>> +        check_compressed_file_type $DOM0_KERNEL "executable"
>> +        dom0_kernel_addr=$memaddr
>> +        load_file $DOM0_KERNEL "dom0_linux"
>> +        dom0_kernel_size=$filesize
>> +    fi
>>       if test "$DOM0_RAMDISK"
>>       then
>>           check_compressed_file_type $DOM0_RAMDISK "cpio archive"
>> @@ -597,14 +620,16 @@ bitstream_load_and_config()
>>     create_its_file_xen()
>>   {
>> -    if test "$ramdisk_addr" != "-"
>> +    if test "$DOM0_KERNEL"
>>       then
>> -        load_files="\"dom0_linux\", \"dom0_ramdisk\""
>> -    else
>> -        load_files="\"dom0_linux\""
>> -    fi
>> -    # xen below
>> -    cat >> "$its_file" <<- EOF
>> +        if test "$ramdisk_addr" != "-"
>> +        then
>> +            load_files="\"dom0_linux\", \"dom0_ramdisk\""
>> +        else
>> +            load_files="\"dom0_linux\""
>> +        fi
>> +        # xen below
>> +        cat >> "$its_file" <<- EOF
>>           dom0_linux {
>>               description = "dom0 linux kernel binary";
>>               data = /incbin/("$DOM0_KERNEL");
>> @@ -616,6 +641,7 @@ create_its_file_xen()
>>               $fit_algo
>>           };
>>       EOF
>> +    fi
>>       # domUs
>>       i=0
>>       while test $i -lt $NUM_DOMUS

