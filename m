Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56D75680E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 17:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564702.882325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQCF-00047Y-S5; Mon, 17 Jul 2023 15:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564702.882325; Mon, 17 Jul 2023 15:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQCF-00045D-PN; Mon, 17 Jul 2023 15:31:35 +0000
Received: by outflank-mailman (input) for mailman id 564702;
 Mon, 17 Jul 2023 15:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4oQA=DD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qLQCD-000457-PR
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 15:31:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe59::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01afcece-24b7-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 17:31:32 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH3PR12MB8185.namprd12.prod.outlook.com (2603:10b6:610:123::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Mon, 17 Jul
 2023 15:31:28 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 15:31:28 +0000
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
X-Inumbo-ID: 01afcece-24b7-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXu0Ep1f3TjU6PkRNoSZmdK5MfSLQ2ObeiamdrE6uQo0WaRe6l58sQSMxF++TUwhFlko773orT05MQZ96vU5NULxqwOVu14GKqpTEnfZJA++J00/ImK5qIubL6Jag1dghW4np26o8Kun3Cc1ttRXlcWs3XT7nHMdgAY0JkhxJz3BKS6TH3+VdTJZ4gQZlvwBtpnq/PAgYPhDHZEh4/1z92SmLIOHJjmkeD1df0UpGM2RzRn5qIM4niydaXfI6C3PPmkAO4fKs2Ic6n+FjQL8WY53kXOdDb14f9NQ3IT1CDb4DNiZpGKDciVWqFyV1VzCPguB5JMMKn+u0pVfs0fF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLaD+0ThcHVK2/31hvO4n7RuN4Tigg93pMW/x7rwHpg=;
 b=mBh7ziIizl8hHtfYAm+n9nzP5M54G3CqUXBhqHZ3xMjky5qEkdGOecQB4GFdSwgzsI2td+U+GTbSLmeuShdSaeYlGLiuzh32TlPHlXX+5l6v8Md/AVj+LH/y36zY2R1aDT9Rv2Zu9t11Rfql4IxSk2CSwHmobx1srjaCzlGphgPVej57Qyp0cB7UK9kgOfa/JXQVnCOoVeO5VqtlQDLyrbgsZ34ZzxO107Qq0YdjXdE9ZlJeYoYJXOqQgstB5ZWRxLfYZ//B9jnIEOmtmlNWiD0rANJ9YONzhlbpQ4rhq8IgT9mv+YF5FbiNloFMAwvBZKT5PNlUav3EZFquS/w09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLaD+0ThcHVK2/31hvO4n7RuN4Tigg93pMW/x7rwHpg=;
 b=sWeOot6bOCw+wSBtZRgAhP8zCUdC+YOcv2Ch6EdsmGgg+wxgbN4/aZt/lyiRka9coqB0G1WtajOFlyOFYHWjWFewtvIBWtmzxPQgrA5V8ladZPqFPlAkiPn9W0f3i3gBKu34tgScMZKvpsezS6aQjkKMHDfbzmyihD6tjBhp7DQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9dd7e04e-92d9-bd90-dd66-0f8eefefc4a8@amd.com>
Date: Mon, 17 Jul 2023 16:31:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: U-Boot on XEN - dcache off
To: Michal Simek <michal.simek@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>, Xenia.Ragiadakou@amd.com
References: <8929cafc-ea9c-35c9-e4a4-3c7ad2d1acc1@amd.com>
 <b60f4cb0-2a82-4227-de23-c59436cb47ef@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b60f4cb0-2a82-4227-de23-c59436cb47ef@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0548.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH3PR12MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a179f62-d025-425c-2d81-08db86dae34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MiqqSmDRC1T8RKa+thAvTza/3xg+Jtz5eukC5nisz8k+UUbwOyPmUMse1R9JsxYFpGthF57in6sW10rShdSJOuX7DRfeu1C8VeMBfalAa+0Us4b6Iq/b5m2rYtWbO5f0NFqRGbd3362ktjM/e6yNyNfZvwhWvp0/YrKcFB+rR0Wm2TUM999vXBHX0DLnxl/TybgAVieWkgjyKaD2g05TDxqmeZKGMJrT8Ow/QA/YscwTIBGyjP3JHZ4sOO9WU1UtpOdXxQttRjVN33+SCLorQiXZw+kuR2FuNeJfoYgY+HXFpfrpXrPSVtb2fofjkV2MtfZj0Mxt+zDm3xSxp/wW6uOUKw7onkvIJ2VbALsz5uxS989bGPdQm7RjNp/2pj2nIX46NDugf195lMFLn8M7tmeey7+w21l+xri8rGk/oRqWOzqJD2AWxXsKJCRl+iuHqOem57WGqCQrOQwq0qxObMuu/C+v594MnOBoszYpdeZyojVuEsNlSlyNZNDI4OFfg+dCYI04Xy9RPtNoYFV7qzhl+r9PVD/g+h9wopiqnt98G6ZvrTAS7pMbrRJSTF6iahR2QJJyLHUhxfelF4/wpFkgE2WnsI18nfBRuR28x+DU2DD9LR2LNIzSOZqkOEh0h5/QjSJLTbia+Y7LQzTXxOeTqyLNy+3OiFZmPc8DEUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(31686004)(478600001)(110136005)(6486002)(6666004)(54906003)(83380400001)(2616005)(66574015)(36756003)(31696002)(2906002)(26005)(6506007)(186003)(53546011)(966005)(6512007)(38100700002)(66946007)(66556008)(66476007)(4326008)(316002)(41300700001)(8676002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW9meERnUmtWV0ZxVkh2S212bVlvT2RrTWpmLzJSd0EreWErZ0pTVGdPOVBw?=
 =?utf-8?B?dGFMN2h6dXlVczBUVDZtNUk0NXFPdTVVaVFyZmcyaTRERnRnRmw5NkczU1p5?=
 =?utf-8?B?QWN1WXloYVhzN2E4dTBNTHRaclNqSS80ajJuQy9hM2FyRWJRMVRwSDJMZWFN?=
 =?utf-8?B?N3dnQmsyL1ZPR285NzRvSXlUVmZNSGY0RDMyOThyL05WUnJSRWhLTzQydkpI?=
 =?utf-8?B?emdTYkFEc0p3ZXVCb1lpS2dxditrcU5EelgzV2R6dVlpRXpscFMzaFNJUFBY?=
 =?utf-8?B?OGJicWNJMmY5a3VvZzhvbFJ5WjUwTjk0TVN5MnA2WlNOK041eUFiZ2l5MWhN?=
 =?utf-8?B?YXEzYlRNM1FaTTZ1NnZSaTczMDhTa2JzUHo2UzhJdFVOOG9MNUVMS1VnWklE?=
 =?utf-8?B?Sm4yK1Nvc2g0aTJEV2VBTzlMM0hCU0pCTk5OdVpMNmllOTloKzJGN1dBNC9T?=
 =?utf-8?B?NUtZWFdXWFRDQTRNanlFR0VIcTBpck1HZ2JSOFE2bmZ2L3JiVWM3U0RHejFN?=
 =?utf-8?B?b3JsQXZVMDVXMlJQZGZMZUdWWDZWbTZncElVb2R6MzlVczJ5VTEyVFluNlpp?=
 =?utf-8?B?TExKa0g2ZlRiVk1BZXUrTmRZSVpFdEJhOEh6Szh6SUJKTGcxQ2FxQnYxUFp2?=
 =?utf-8?B?MkZTMDNxd3hFVTFCRmFxSDl4RmZEcUZyZlllcVk0eVkvaGVlZm81aGNmTGVF?=
 =?utf-8?B?WHhDaG81bkpIaHVWV0NENlUrN1Z4dFkwSnA2aFl5d2VUd29PQXNITGRudTkx?=
 =?utf-8?B?dnlxNVdsbkFuK1V4RWdqMmZJSHdQMXVzUENaZmwvanNMenY5K01CMUxpKzFI?=
 =?utf-8?B?LzAyVEZPWkVSUWRCVWloVUFRdVJnR0RPOHo5WTdqQ1lPY1lRVGhhV1RqbHNN?=
 =?utf-8?B?MzI0N3I2a21wSmNxVStya2lDOG9UbmV6UVZTU2p0NHk3L3I2ZkVqdHkxbVFO?=
 =?utf-8?B?MUJmYjR0QXhYRnVJZXRVeTlxZHJPVG8yTGc3dkNzUVBHN2tPNlpQZ3VKY1Zp?=
 =?utf-8?B?SCtPQ2ErY3J1WHc0N3NwVDRFYjgvdXJyaVdUaHNrQzRGYlBrc3cyN1dFKzg5?=
 =?utf-8?B?MWxMRDBEQjZPTnZEdlYxMjRTMUdSL1RiZVpUbE91aUJpVEw3algxMHdIN0p5?=
 =?utf-8?B?SEY0bmN1eE9SSG53M1BRTGdIQWJXSHJkVm8yV2t3KzdpV3hWU3V5RjlUMGpQ?=
 =?utf-8?B?YWRnWGxsdUN4L0l2Q3NzNDN1VGlxRmZjSmtSeGZtT29GQW5QTUxnUkx6clhv?=
 =?utf-8?B?eHgzZCs0ZHdjeWNvcHhOSFVhRUFWdnBiR3pGWDBDMmlkTlhBRVpoS0dwSUd3?=
 =?utf-8?B?Yy9uM3VpSnExQ2ZFK1NSOXBBNkFwSWg5OUdPcmc4aG1pbE5MYVBpbzZwUkY0?=
 =?utf-8?B?SUxZU01EWnVWV3A5NXZsYmVKYUJCSkhYcE1kQ0I3cmREL1dtc3NweURDc3dK?=
 =?utf-8?B?TzJKSDg5Q2ZReEowM29aQy9pRDRvVzNORjlYZm9UL0M5Z0lUTktYQTY5amEz?=
 =?utf-8?B?Vkxad3RuTllTMGtFNGtLTU9ybE5UOE52NHZGR0orcGZiQWVGMHlWNUdFbG5W?=
 =?utf-8?B?VVFoeGxkVUZyeWFsdm5LV3liT3F3YUsrNWpGTFBJcnFDZCtzSks4djhhTWtT?=
 =?utf-8?B?anBKRlg2ak55SlRraVNsWW1pWU1Lc0dlL1pWWnY2VEhnSlh2MjFlOXRxamZT?=
 =?utf-8?B?Z3JPT0YyWFQ0VUJneTJSV3FxbUsvSWxnTENYakNnWHN6RjFjalZlcDBWMDNU?=
 =?utf-8?B?QmJTa1Y4VW9wY1lWTTY0RGRNNkFTYU9jaHFwNm51RFlueDNSc1ZCNHhuZVVp?=
 =?utf-8?B?MTVGY0h0KytlaXBXSUdQWGpydWJqcTZaQVhoMTBvekg5V1RnMklDeTNGekhC?=
 =?utf-8?B?T0tjUmxlRGJhYkd5VUpaZU9uT1FCRHRXb1ZpL0k3Z204ZjZwelBIeDg2ekNm?=
 =?utf-8?B?T1pWdVJkZ3l3Q1N2SmJrSHQ3cTF1Ynl4SHRKVWxqcXB3cExpME9WeXJjWm9r?=
 =?utf-8?B?dFdxUERLQlRkcGtYVVJkckRuWHFweWRCQzdvTFcwcGNheWJJdE5qcUhVajU4?=
 =?utf-8?B?THRjT2dJNisrR1dGMDdlTmFtTUtpTVRxWngxSmtOMG5veHhhUGlvMTlIcENO?=
 =?utf-8?Q?FSloLlHhULiUqMBz5coXru5NW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a179f62-d025-425c-2d81-08db86dae34c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 15:31:27.9953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pe8Fftx/GF4HefIaxC6IobLfmbIt1XJQcU2t/bKmKNRD1/SQLaeougtbS/lUyuT1yZgDNAKNEPtu+DSY7GNd1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8185

+ xen-devel (Since the question is related to Xen on Arm in general).

Hi Michal,

Julien/Stefano/Bertrand - Please feel free to add in.

On 14/07/2023 15:14, Michal Simek wrote:
> +xen
>
> On 7/14/23 16:11, Michal Simek wrote:
>> Hi Stefano,
>>
>> I am playing with running u-boot on the top of xen 
>> (xenguest_arm64_defconfig) based on ask from Kris to run QNX on the 
>> top of it.
>> In past we found that QNX requires to have DCACHE off before it's start.
>> Chris found in past that dcache off is not working and he passed this 
>> to us to take look at it more.
>>
>> That's why I enabled cache commands to be able to run dcache off and 
>> see the hang as Kris.
>> I found one interesting commit created by Marc for Android which were 
>> taken back to u-boot upstream. It is talking about KVM and I barely 
>> understand what he is talking about.
>> I of course enabled this option to try it and behavior is the same.
>> That's why my question is what Xen is doing in connection to dcache 
>> operations.

WRT cache operations, Refer 
https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=53b705d02cec03861044e673536586bd1b2443bd 


When the data abort is caused due to cache maintenance for an address,
there are three scenarios:-

1. Address belonging to a non emulated region - For this, Xen should
set the corresponding bit in the translation table entry to valid and
return to the guest to retry the instruction. This can happen sometimes
as Xen need to set the translation table entry to invalid. (for eg
'Break-Before-Make' sequence). Xen returns to the guest to retry the
instruction.

2. Address belongs to an emulated region - Xen should ignore the
instruction (ie increment the PC) and return to the guest.

3. Address is invalid - Xen should forward the data abort to the guest.

>> Do you know what by-VA cache maintenance operations are?

These are cache operations by virtual address. Refer 
https://developer.arm.com/documentation/den0024/a/Caches/Cache-maintenance

The cache operations (invalidate, clean, zero) can be performed in any 
of the three ways :-

1. all - The entire cache is affected

2. VA - Cache line that contains a certain virtual address is affected.

3. Set/way :- Cache line selected by its position in the cache structure.

>>
>>
>> commit 46dc54287031759c03c68902283d92076938305c
>> Author:     Marc Zyngier <maz@kernel.org>
>> AuthorDate: Thu Feb 9 04:54:27 2023 +0800
>> Commit:     Tom Rini <trini@konsulko.com>
>> CommitDate: Mon Mar 6 17:03:55 2023 -0500
>>
>>      arm: cpu: Add optional CMOs by VA
>>
>>      Exposing set/way cache maintenance to a virtual machine is 
>> unsafe, not
>>      least because the instructions are not permission-checked but also
>>      because they are not broadcast between CPUs. Consequently, KVM 
>> traps and
>>      emulates such maintenance in the host kernel using by-VA operations 

I am not sure if Xen behave in same way (ie traps and emulates *all* 
cache maintenance instructions).

@Julien, Stefano, Bertrand - Do you know more about this ?

>> and
>>      looping over the stage-2 page-tables. However, when running under
>>      protected KVM, these instructions are not able to be emulated 
>> and will
>>      instead result in an exception being delivered to the guest.
>>
>>      Introduce CONFIG_CMO_BY_VA_ONLY so that virtual platforms can 
>> select
>>      this option and perform by-VA cache maintenance instead of using 
>> the
>>      set/way instructions.
>>
>>      Signed-off-by: Marc Zyngier <maz@kernel.org>
>>      Signed-off-by: Will Deacon <willdeacon@google.com>
>>      Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
>>      [ Paul: pick from the Android tree. Fixup Pierre's commit. And 
>> fix some
>>        checkpatch warnings. Rebased to upstream. ]
>>      Signed-off-by: Ying-Chun Liu (PaulLiu) <paul.liu@linaro.org>
>>      Cc: Tom Rini <trini@konsulko.com>
>>      Link: 
>> https://android.googlesource.com/platform/external/u-boot/+/db5507f47f4f57f766d52f753ff2cc761afc213b
>>      Link: 
>> https://android.googlesource.com/platform/external/u-boot/+/2baf54e743380a1e4a6bc2dbdde020a2e783ff67
>>
>>
>> Code ends when it tries to call
>> set_sctlr(sctlr & ~(CR_C|CR_M));
>>
>> Here is implementation. I confirm EL level which is obviously EL1.
>>
>> 180 static inline void set_sctlr(unsigned long val)
>> 181 {
>> 182         unsigned int el;
>> 183
>> 184         el = current_el();
>> 185         if (el == 1)
>> 186                 asm volatile("msr sctlr_el1, %0" : : "r" (val) : 
>> "cc");
>> 187         else if (el == 2)
>> 188                 asm volatile("msr sctlr_el2, %0" : : "r" (val) : 
>> "cc");
>> 189         else
>> 190                 asm volatile("msr sctlr_el3, %0" : : "r" (val) : 
>> "cc");
>> 191
>> 192         asm volatile("isb");
>> 193 }
>>
>> Is there any reason why it is not possible to clear to sctlr_el1 
>> CR_C/CR_M - cache disabling, MMU disabling?

Not sure IIUC,  sctlr_el1 CR_C/CR_M are being cleared to disable D 
cache/MMU. Did I miss something ?

- Ayan

>> I checked already that u-boot starts with cache off/mmu off and when 
>> tables are setup bits are setup.
>>
>> Thanks,
>> Michal

