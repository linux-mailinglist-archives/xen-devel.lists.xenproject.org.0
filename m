Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E4561921
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 13:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358425.587628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6sLz-0005f4-4u; Thu, 30 Jun 2022 11:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358425.587628; Thu, 30 Jun 2022 11:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6sLz-0005cJ-1B; Thu, 30 Jun 2022 11:28:59 +0000
Received: by outflank-mailman (input) for mailman id 358425;
 Thu, 30 Jun 2022 11:28:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sqd6=XF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1o6sLx-0005cB-QD
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 11:28:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3a9ff1c-f867-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 13:28:56 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4332.namprd12.prod.outlook.com (2603:10b6:5:21e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 11:28:53 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::6d20:93ce:c4d6:f683]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::6d20:93ce:c4d6:f683%4]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 11:28:53 +0000
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
X-Inumbo-ID: d3a9ff1c-f867-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMHzTQHkx05JTezr7ua8QAivFGX+g3ryJhqZFmpcFR2kq/FPgE537f3qpvRrAxNSyofp15vBya+E0zZBC0k5+n2Q5Rt/Mi/o9kHw7+58CAcjw8HN+e3ry6O9UTX8u3+i5CHXaU5x2o5q6fm8t8zrzaHHHsD1mHRWuiix+ufWzNVBdu6aluCSL4ueOIFz4DEopBeXdp6xmOPRCbHoWr3lPCI/dbByZCYdA3TaaVUrbGrW0KypEGoCrodOInISNpsbCfbYRCardpUBR+CfcSoTp03dUtKfZ6NpOXzOryMi4FmPupTSDvXeMZo0HBfl/b8ySsCPNlxrUSWs+BY85BUvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Vj7T/Wb9689p5EhEAfOVENGEodFALw/hDr1aTqW//Q=;
 b=klADr37/9Gw6wHBomABvQUluB3No/TWJI99LxaFCH3K4Ae9CJPNn5UJ94e0YwKXSa5XpdaP7CgE8ZmNF4xJ9t1zDk2sRsgtaEozm+GRW/cRZhG3ZhALO/yQPBhClEGWcEMsL3Fi8adOE1v9zkjas9bqm4BgbiBqkd/0KPQ3qTqXfZi5S1vafmc/Mw43kO5X8HkriqAghHJ1Zmh0jhFzZiBkQNF8Xt4WHkX7vRvalkV2rfG97vijZ+sN9YcRCgOEX1bQ382+SkHnWof/OinU6yDbEMzydvItOMvDljwQyQbbtbwVYZNOGEdWVGFX4aiwiIm/fYDCrdm+FSc3ttr64/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Vj7T/Wb9689p5EhEAfOVENGEodFALw/hDr1aTqW//Q=;
 b=W+Mzvl8ZF1KA6XSgOy5PnREYWPO5Fl2ZN2+EoYyxtmrA9scxkrobEXw/+XjgQkaPBsdEhM37pzvEf3Oh9E69cwafUARp3Maju6gEjiUKl2kPqgUxr7nesG9obYkIrxQL+a3pthpMwyh/R8YUIkyE1IkzF2OveI27cL/tXUSUL4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d2057409-6557-ec71-ab68-e74dc9aafe66@amd.com>
Date: Thu, 30 Jun 2022 12:28:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] uboot-script-gen: do not enable direct mapping by
 default
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xenia <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org,
 viryaos-discuss@lists.sourceforge.net
References: <20220626184536.666647-1-burzalodowa@gmail.com>
 <20220626184536.666647-2-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2206281727080.4389@ubuntu-linux-20-04-desktop>
 <22476413-14da-21cd-eb02-15165bfe602a@gmail.com>
 <cafc1602-6f5f-3238-801d-29c13ed37f50@amd.com>
 <alpine.DEB.2.22.394.2206291323470.4389@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2206291323470.4389@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0413.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37d94577-9e52-410b-b7cd-08da5a8bb62c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4332:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NVFgnMPb3tqGHqMbAy34kPfthQqqvuOpcqCwNWvGWYVGa+E5eNUFyBuf1jthGNzlOPPtCmddvhC8Ugst277kcVbWEXR/MfHs2xwkWwjuSZc8CHmh94U+YRJOr5xGSdP7OK2lh5h7tBBqi0UZznm2+F9dhyh4S8mA8oRVE62atrS7zwxaweTu7Bm1b+iD6Vyy0B8zNKLRXfeod5IX2ZAv+JyuXCzQ+dFzMf/uDnvFzYg7f+3jNnJpUtFLq261oLBCMo8/WeBocbRrdwL4gi+pp3NszlNFLAE0WEydETZJTcgNHLQzHwTJrgoNvEkYmPcSV63XiO240qoE9aoQQSK+Axhrhkf3kMd7JcGk3ROfmWpWZdA8XRcOlOvwAFO7GBqXEZeQqtZMhnDPrhBhvkxAF+97XT0EtDwKWPkCyu9JbW8XoGskMjEproWz9z6z7ic7h3Lja5oGFQz6dTM52RdRzUtHMb02Yt7c1xZZbkdffS+vqyhbCDpCx8siFFQMFptlHNgUCQK65tME35i1W4OVhMV9P4WO75wP0xmuMKpojmR2aa7p/2w76crkecjkgOjnn9QztjrJsuFtiptpI5JB24gPM2/AO4POQeKvGhVcTGXeM8mIEfg5OCGbk5hxB+YgQOT4NCFz7QB8s7ukoAra5IvooEBOCKJPdvtD6VRn28G3VUZI6+cRxkaofF2HLOLYUlSPc9kyCGDa4HGaxCdZPsvVtgNvtinZCd5qzaiHCv5t3R3ryqUej8/Ja1xEKt1DupUPZAbBeYVIijC+7i4LtS/v3ZZ4ibCm3/w1MwAsJ6NtetjER0kPG9H32wmqw81xAcFgyoKYomRR3+SzpJxdJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(5660300002)(38100700002)(6916009)(66476007)(36756003)(41300700001)(2616005)(186003)(31686004)(316002)(6666004)(2906002)(478600001)(6506007)(26005)(31696002)(8676002)(4326008)(83380400001)(66946007)(8936002)(66556008)(6512007)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVOdWl6WGh5bEpJMUNpUjkrR0R6WGJzSENOWEtmb0ZNK01haERyVlhBa3RF?=
 =?utf-8?B?MTNSSFdsOEhZeW9rMTgyWG9sS3hjWHRZU2VlVlIzdE04ZkpmWGhhRzZvRDBG?=
 =?utf-8?B?WFpRcHlzVEVXcHdZMVdkNzlrWDFDdmI3dlhwUnRjdE84Tk1sVm9yUzlyS3Mx?=
 =?utf-8?B?Z2VuZFpGcEQzczJhTnNHRitsc1BwWnZhQUYzd2JSZmwzYjdOVFFPcDFwVGhi?=
 =?utf-8?B?VU5FZ254eklZUmQweG96b3czeU8zcHRPVWhPUkw3d24yUno1Smg1UXhQMlp6?=
 =?utf-8?B?c0RkMndDVGdwZnpzZGg4dTZWR0tGMU5iZGxLMXpXSUdnU3FBKzdSUXJla0t1?=
 =?utf-8?B?RUY3UFBxSENlK3BUNjJISFJ4Mk4yVXU0T0JOWE1GcWJvQjZ4UTF1UHUxS1RF?=
 =?utf-8?B?Rnh6b0NHa0dmc29jbkNuQmhBQ1ZpQ28yekY3dnBFSlJKcXBJT01DNFNPZ0tO?=
 =?utf-8?B?ZEhMWjIxZVNHdERhYUJPSDIxQnVxY3UzS0lvMDVhQVJSbTVKc1d3eDE0ZXU2?=
 =?utf-8?B?S3creWRmQlE0MkIzSnRmZEpnNzBSWCtMajVLcXJSN2J1UzlaWHdjMHBVY3Uy?=
 =?utf-8?B?MVdQQnM5RmlIQ050NUkxcEdUZUhPNTdrZk96TzZNWFlJSFJQSmlwWVNSeHJY?=
 =?utf-8?B?Q3JWQ2tRWm5pMWpseHVYZldLTWp6TmE3T3U3ZlkwVStRRHpHQUg3RW1hQmpl?=
 =?utf-8?B?RytMV0ZRV1RCRlk1M0F6WDZFWFcrVC9uUXg2QU9LRTUrc3VuS3RNcGsySG1D?=
 =?utf-8?B?UWNhNzIwV1NmU24vamNCTGREVFBDc2VXcCtaUndscWNVMmpIbG9SQmRrNzhP?=
 =?utf-8?B?UGNZYXdpRXJtdGcwNFhXa2tDNklqODhjOVNCZk9OZllJWFJhaVZacklycEN3?=
 =?utf-8?B?R3NmenFGOG1XVVF2a2JWcFdhZm01b2puVFRjeS8yZWRWdSt3T0RwQ05aRWFH?=
 =?utf-8?B?K3RsQUx3dXBXeXhDTll4WXJCZzd0ZUwxWFdLMmRYSVUzSWRvdXExMy9OaFpq?=
 =?utf-8?B?d1p5TkhlYnNNcnVJcmJWTm52UWF4Wk0vN2dkYitrVEVFUm1qLzJ1a05KQ3Br?=
 =?utf-8?B?bWZrTm14YW00Y2dhS3NkMWxyOFo4eDVuUTF2NjYzOWtvMDZnSloweW4vMk1K?=
 =?utf-8?B?cFMzTjY1SjNBdkxDTjZxTU5LNll0L0h2c213cFF6SUZ4cDY4NTdPOXAzUDFl?=
 =?utf-8?B?RFhzblMrMUdkdGo2S1dTQUJYbmZwSUVSbUJqaXpjcGZnYmVHWVFGcnB5MFFq?=
 =?utf-8?B?Z0JhQXUrU25acmVkZUpaS3o4Z3lVblZQSVFTRllzVVRJb08wOFZXd3poa25H?=
 =?utf-8?B?TWpiNWt1OVd1REQybW4wMkZmYS81ZHJKQjdJcEhJaS81SVJtZWtMRE5WVE5D?=
 =?utf-8?B?WDFTblpaUmxDZHpTNDVoaW01UHpnSnYwWDFRNVpjR0tzcU9SbmpUTFZWMjdu?=
 =?utf-8?B?MlpQZGRyMFZ3RE1LWjA0N0xPa1dzVjRkeE9EZGFHVS9HOEVMR0pYZHRka2JE?=
 =?utf-8?B?SzA0UGhZck8zeUxkQllQQzdJcWRDdDRGQkRmcHprWTViSHNUa2VwZmNLeVBM?=
 =?utf-8?B?WU8xRDlNYTBWK1JWa3lTaDh5aGVoN251bWFQN1Jpc0VnczdFdUwvY1ljU1RJ?=
 =?utf-8?B?SkRnZzU2ZllkQnpkQXdHNlJ3OHk5bDZKTkZ0cjJtU3BYTFZmUi84RW85a0Fi?=
 =?utf-8?B?Qnh2UzdMOE54MXJrRTJpaW40V1ZhOGZNQWNYSGNwT1k3bzR0SWltNE1Xd3l4?=
 =?utf-8?B?aUViNFkrS1l5Rk1xWVZTMlVzTy9CWEJndDN4NDdQaHhzcW1FOXFJTWNZYnYr?=
 =?utf-8?B?LzdGbmVVSU55R3lPM2l0MVI1SGJsdUI3cm9DK093bzArZlZ2dWxGVDljWmR1?=
 =?utf-8?B?TVk4M2NLRTlhMW8zUmhsdExzSUpDSzJ0ekZtWkV1Q1J6VEgxdjVmbHp4Q3JL?=
 =?utf-8?B?a2R5VHRoVjhkcndmVG1WcEJCWHpWZnNSZG5WdXVzdkU3QUZJeFdkSUpYaTN0?=
 =?utf-8?B?NTYwK3ZEc3dwY2xncnNQSm5XU2V2QkdEYzVpc1hQVjR5V242TldacUUySWVU?=
 =?utf-8?B?QndTb3oxcFB3Rit6b3BuRE14UWNUMnR4RU9za2xHeUYxWkJhZzRNM050N3A2?=
 =?utf-8?Q?w5a4U/385xUu1p0uGGpE/QpgB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d94577-9e52-410b-b7cd-08da5a8bb62c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 11:28:53.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhxGxaT6eA4+3lUfH9kOCjVYs/BV2g1Kc1xkSj4o82S+qwgBzytNFAUxAY7hOFVNb+cMihe3Y28HCTcY7PN0ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4332


On 29/06/2022 21:28, Stefano Stabellini wrote:
> On Wed, 29 Jun 2022, Ayan Kumar Halder wrote:
>> Hi Stefano/Xenia,
>>
>> On 29/06/2022 18:01, xenia wrote:
>>> Hi Stefano,
>>>
>>> On 6/29/22 03:28, Stefano Stabellini wrote:
>>>> On Sun, 26 Jun 2022, Xenia Ragiadakou wrote:
>>>>> To be inline with XEN, do not enable direct mapping automatically for
>>>>> all
>>>>> statically allocated domains.
>>>>>
>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>> Actually I don't know about this one. I think it is OK that ImageBuilder
>>>> defaults are different from Xen defaults. This is a case where I think
>>>> it would be good to enable DOMU_DIRECT_MAP by default when
>>>> DOMU_STATIC_MEM is specified.
>>> Just realized that I forgot to add [ImageBuilder] tag to the patches. Sorry
>>> about that.
>> @Stefano, why do you wish the Imagebuilder's behaviour to differ from Xen ? Is
>> there any use-case that helps.
> As background, ImageBuilder is meant to be very simple to use especially
> for the most common configurations. In fact, I think ImageBuilder
> doesn't necessarely have to support all the options that Xen offers,
> only the most common and important.
>
> If someone wants an esoteric option, they can always edit the generated
> boot.source and make any necessary changes. I make sure to explain that
> editing boot.source is always a possibility in all the talks I gave
> about ImageBuilder.
>
> Now to answer the specific question. I am positive that the most common
> configuration for people that wants static memory is to have direct_map.
> That is because the two go hand-in-hand in configuration where the IOMMU
> is not used. So I think that from an ImageBuilder perspective direct_map
> should default to enabled when static memory is requested. It can always
> be disabled, both using DOMU_DIRECT_MAP, or editing boot.source.

Many thanks for the explanation. This makes sense.

I think this patch can be dropped then.

Xenia, apologies for suggesting you to do this in the first place.

- Ayan

>
>
>>> I cc Ayan, since the change was suggested by him.
>>> I have no strong preference on the default value.
>>>
>>> Xenia
>>>
>>>>> ---
>>>>>    README.md                | 4 ++--
>>>>>    scripts/uboot-script-gen | 8 ++------
>>>>>    2 files changed, 4 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/README.md b/README.md
>>>>> index cb15ca5..03e437b 100644
>>>>> --- a/README.md
>>>>> +++ b/README.md
>>>>> @@ -169,8 +169,8 @@ Where:
>>>>>      if specified, indicates the host physical address regions
>>>>>      [baseaddr, baseaddr + size) to be reserved to the VM for static
>>>>> allocation.
>>>>>    -- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
>>>>> -  If set to 1, the VM is direct mapped. The default is 1.
>>>>> +- DOMU_DIRECT_MAP[number] if set to 1, enables direct mapping.
>>>>> +  By default, direct mapping is disabled.
>>>>>      This is only applicable when DOMU_STATIC_MEM is specified.
>>>>>      - LINUX is optional but specifies the Linux kernel for when Xen is
>>>>> NOT
>>>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>>>> index 085e29f..66ce6f7 100755
>>>>> --- a/scripts/uboot-script-gen
>>>>> +++ b/scripts/uboot-script-gen
>>>>> @@ -52,7 +52,7 @@ function dt_set()
>>>>>                echo "fdt set $path $var $array" >> $UBOOT_SOURCE
>>>>>            elif test $data_type = "bool"
>>>>>            then
>>>>> -            if test "$data" -eq 1
>>>>> +            if test "$data" == "1"
>>>>>                then
>>>>>                    echo "fdt set $path $var" >> $UBOOT_SOURCE
>>>>>                fi
>>>>> @@ -74,7 +74,7 @@ function dt_set()
>>>>>                fdtput $FDTEDIT -p -t s $path $var $data
>>>>>            elif test $data_type = "bool"
>>>>>            then
>>>>> -            if test "$data" -eq 1
>>>>> +            if test "$data" == "1"
>>>>>                then
>>>>>                    fdtput $FDTEDIT -p $path $var
>>>>>                fi
>>>>> @@ -491,10 +491,6 @@ function xen_config()
>>>>>            then
>>>>>                DOMU_CMD[$i]="console=ttyAMA0"
>>>>>            fi
>>>>> -        if test -z "${DOMU_DIRECT_MAP[$i]}"
>>>>> -        then
>>>>> -             DOMU_DIRECT_MAP[$i]=1
>>>>> -        fi
>>>>>            i=$(( $i + 1 ))
>>>>>        done
>>>>>    }
>>>>> -- 
>>>>> 2.34.1
>>>>>

