Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7255459BD2D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 11:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391298.629064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ487-00016x-34; Mon, 22 Aug 2022 09:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391298.629064; Mon, 22 Aug 2022 09:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ486-00013a-Vm; Mon, 22 Aug 2022 09:53:58 +0000
Received: by outflank-mailman (input) for mailman id 391298;
 Mon, 22 Aug 2022 09:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ486-00013U-0A
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 09:53:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5656a52d-2200-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 11:53:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2554.eurprd04.prod.outlook.com (2603:10a6:3:88::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 09:53:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:53:51 +0000
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
X-Inumbo-ID: 5656a52d-2200-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZz1A+oNVWjyO1RrTO9Sjtrke84sPPIorLB8K+JU7IjCtWVPUT9/5odMFAXr2AZaHMq7frMEobQXdsT3C0MLmlJ3LLa7HV9oZXvatKwj2fg5+EyTwxkyDxoHnE0SneRaZ576ZmE5MkaUNnEEVaHwaI3ePX8LDmCRXK0T365W9ka6gpO/9zmLiK2zHsmLeMkcJGhQ50jGozT/YpzudCb8d5LPRqGRuaCdPN4a+fGWlN0qIonHJDbPvCPUppC1i/j7iNhF+nssdDAKgvlY0gyokHOBKjzxkki2MuehMHb7TaDE4aGM3ZK+ImQJXKC5pH0+1tEJ87otsCVW2xDVHLO+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVmAOzgmnKNDKsgMRAXM4ZA2vRieRdDS7+CsUxKpyiA=;
 b=EptK1AyGUCYXu+VZyf5TubpUOHFtqL93t5M1bPU1eTOsgStQwQnSDmZcjTOlNSgdj7dNhgR8vH63TUKlaNZMYNZN3cxSUD1M2Q36UykUkPHI98zhe1bkJ1vm6OLHCx9Qg9Y1/nrkqNyh+h/uXjbjB3nr0S1sXLF0HXBiskWAl91JhmammLeu3A/zTAm7I68C7tDMMiPeV3rsFHyWCFtBwCJgxT96ZbmQfVaKOcF39diWPaQRrOFNreBP+4JOclq6RG7uynJfS7V594b+82oj5R4r3hUkgTG3b8cr4VjMp/JA25y/03XFbGgx0tpDNZByRbYGgdVbdxrIYdist81JJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVmAOzgmnKNDKsgMRAXM4ZA2vRieRdDS7+CsUxKpyiA=;
 b=0USQ2nsoGATaT2ONFwfcq3KtBBk2GT/dKu8+WJ2BFOdpPH6C/qSXuAuKEy3vrpRycJxyVRhO4EVyPMA812ZZmUtr5nwZQXojwBocKwX02UX0RBTA7ba6YX3imsUcGsSaCJPVHqrA9yKpigCwOIPK9ciF56MUZ+wcdGcvbAQfIvmoqCcd+XjbRMKsqCLF8rbtA+AzR5+DaLUrohuk8PtVrQfRd0/+EE6bEqNGV5ec3DdtJye4qkCDO4EYFP76ZUUQrpwGSBPsGgem7ZYq14MzG4QZg71l9HzDHvk7+LgqX9qtHCIQBoAT1HwYUYuogL/72Sl/eMRBCIkQ0bIW3rAM9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1df84d5-a1ca-3019-16a7-36d0bb568779@suse.com>
Date: Mon, 22 Aug 2022 11:53:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl> <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl> <YWHDIQC3K8J3LD8+@mail-itl>
 <YwJZ3X0HpT9w6Veh@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YwJZ3X0HpT9w6Veh@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b1fce49-5878-4e64-dcc1-08da842437c0
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2554:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kdCbu42Qoehl7oeQ4dkkgpbjdVTfXosBcN0juG4wRs+Nxik7T0q8Y1W4en7fmIBHws+xjZlPCm83AsUJLPFubzhSXO7KxyZZnXDcSGk/cwGVYeD8HIwnngS7pp8BO2tLowowmB+wPil8kOqBmx5D57QkcE4yibGUWoTwPU4cgWXpOzya7n4Nzh8KubeaPWn/EyOFsqU5Q5a+7Xt05BO+FhG5snsslkJInOeK9Fo+lr5dnYRUV2LBlPKo92HLToHTrvQZmd8fLgzLpJhxHsb1b0y4AVW7cgpO4Ye1pWpZFExdnuCbch4olBc3tRvNFHfAI96wFbnh3DtNR+gju9EzK/RcBEWD0ckyBN3LPUmfWrheBKzP9XjNJ8XPKPS7jojJDCFXgBYy0UT2X6n0fBy8yfrg1PB9xtJeTox51Ai9QIrxDawrqb4W2cjHmna2hqH0GfvFsPqsotjG88f9wi0rLYt0Lge5UxYyxcvqAVZzKhvWgkzJnrNX30m1C5KgbrQZ12eoMv7fIvuEvCEsyBX7jNqoQGTUFiInqOjhj1FY1oXS2rrbJKEfoetbKbPMgieLvFgFwntw9HegzPP2k5fzrRoLcmAqBfZNn+0cFd5AiDtH84LCU6TwU0jx2eBEr4PT0ZO2NOH2CcnMFiQYWVb0+NwXG3udzMP6S3qOq4EixexTReSaGe81sFdrnA+yYTvnial21KOX5Yc8Ubo1sQNE4TpoBrQ7dCheOxz+UfaezdOzqRU4cmBAcjxZQ4LnnXVShMmsBk9IQpX6xaCH14Mhrvn2FtfkezjVMuQNYlZ/uTpC194pAM4F/A19bc0J6q14
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(39860400002)(366004)(66476007)(8676002)(4326008)(66556008)(66946007)(6916009)(54906003)(36756003)(38100700002)(31686004)(31696002)(86362001)(66574015)(83380400001)(186003)(6512007)(8936002)(26005)(6506007)(966005)(41300700001)(478600001)(6486002)(316002)(15650500001)(2906002)(2616005)(53546011)(107886003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjA3OXVWKzdITVQvSUVsaEl4Ti9BeW9jaW1iMVY2bys2dnV1TWZMWGI4N1Fu?=
 =?utf-8?B?cGdTRU5WajBwbWJSSS9mSDFaUkhpbU9ha09nUmw2ZnpLWUVMb0Q5VDZvRXlH?=
 =?utf-8?B?WUR2V1c1bng3TDBTMkRpYVVSbzVaa3lnZ1JpanlLN2R0VGcweHRDUGQ4UlBY?=
 =?utf-8?B?aUxKeXR6QXArZTltVFkxcFVwNmJlUGV0WlRDczdiWCswTG9NR0xuWmNXY3ZC?=
 =?utf-8?B?NkxRQjI1Z1Z3Z2t2YkpQc1QzeEdTVU1JcFZYcTlLUExZZjVycDRTdGRyVHB6?=
 =?utf-8?B?T1Z2aExFaWhFNWpRZm5ZSEhTQjZuaDRpTlp2T0lGK3lQSXpYbXRZaFo4U0lG?=
 =?utf-8?B?bkYxYmt2aU1TK1FXT2RPNXZkcFBTemQ5N2RqVVVFeVlBbFdSa3J0S1BpcGN4?=
 =?utf-8?B?RzlUZGROL3g2QnFPMHNFV29kZDNyM0R2ME5GUDdzQWdJeTI2MDdvV1dUaSs5?=
 =?utf-8?B?djUwZWZzZHNsTlRjTHNxYVhNbHF6Sk5ndHFmNVAvTDZoa2RRTkxWRUt0VTJS?=
 =?utf-8?B?ZHBxSkg5NzNLcnlrL3lFZlRsS1lRQmFkVEcwVFlVbzhqSWx1eDFZaHhrSVZt?=
 =?utf-8?B?bVE3NVRDTXFnc3ZqNW4zaW9zSTlTTTcxTDRoK0xIckJiTWQxM01SQ1dVVXlD?=
 =?utf-8?B?OVhyUkhTenMvSnlyV2pUYzRFanJUSHkxaVg5RVloQlVOYXNiSWp3MHV4aUpV?=
 =?utf-8?B?L2MzY0h6R1VPMVBLYjRYbW5QeUFWbWR5cEhWRUI3TVZMeE1KQ20wNDZZdU81?=
 =?utf-8?B?M2piWTZ2VWFnSzFCNk9RdEJqNmRPc0dGeEZWSVlJQXRQci8vNk85akhpTEEz?=
 =?utf-8?B?NS9WYnU1OStmZU53R0RPT3NUT00rNGtHVUNFY2dMUUxUT1QvdVlGWkJEUXgx?=
 =?utf-8?B?WTVSbkN1T3UrSXhxc21VcUg4U0tBaG15ejFlMENCUWtNUmFwb1R4bUExU0Z3?=
 =?utf-8?B?RDlFd2Q3SzRrZXZYZkhDVk1xd1ROaTQzTWVQc2N6em81c0ZHemkzNGtLQ2Ez?=
 =?utf-8?B?WmQrSE9TK3VpWkMxcG5rTURMa2pGZVRYdmJ6a2pHbXM2dDRvM0pqZkc1LytM?=
 =?utf-8?B?bkhsSHQzYUV1MHlFWjlxc2I2OG5EWjRGTjVUQVFJbnZtaEsvRTVQM0xJK2hv?=
 =?utf-8?B?QTJyNzlwQzZnbG1zOGdTVUQ4MUxPWU9SMDNmbUxKdi9XTFkxc3A1bTZxalJj?=
 =?utf-8?B?VkxIVEJKZ3Y5YjRxZ1g1cWJmbHRtZkd2ZHBIQkpuWXUxREdKSURWUFA0Qldq?=
 =?utf-8?B?Ylo2dlo2ZVlwbUlFZ1dyNUlXUnBCMW9yKzZOZWJwK1JISUhQRGpNS3VLaGV1?=
 =?utf-8?B?OXVsOGZDL0xjMU82d2ZoMlQxMkF6blpHQWNscDd6NFVLdGtuQnFyMzcyNHUz?=
 =?utf-8?B?RUxuWmc2YmcvV3p3NUtHNUt3dVFqb2pEMVRjWTBiVVcrMHc4M0krV2VTYVR3?=
 =?utf-8?B?bGNWSjhyMUtxT2laZ2VsN1FFYzFQTDY4ZUhFaFJJR0FUaW1pNGhjWURTdWpn?=
 =?utf-8?B?dVdtMmtKZ2o3WnBZdDQweWIzRlZHYW9ZQThtRTc0Z05LY1o3b212TzBYL1lL?=
 =?utf-8?B?SmgvSmlLQWxkcUlDRnJRSHVGT2FOemlsM2UxVmY2bWRjSHJ0SG1UYkI1QlNZ?=
 =?utf-8?B?ejEwb2VQd2graytSS3k5S0h1SktMb0VPSzNUUmhJZkNqZE5qMXI3aC9wWEEr?=
 =?utf-8?B?bi80VFdKNzJOUWVsVHhBSlV5b0lrS3kvQklWL2Y0MU01ZXVKZ2ttZzNvclpV?=
 =?utf-8?B?SUlOdGJOVTZkRmVkNTYvenVENjBYRFByeHFDUEk1c1Y3OVhLQzRhQ2FRem5l?=
 =?utf-8?B?RW9ib0hwRUlZWitEcWtSVEMvZzlYYmhWR0V1dU5vSVpYbWNheHFJaTA3K3dS?=
 =?utf-8?B?S2ZUTlBITHU5NEZCeFd2OFY4QXZEY0xaNUs5SUt0TVozMldySHBnQTNBakI3?=
 =?utf-8?B?aXpHdlFzb3NiZjFqY0kwUm14aUsyOVk5Sk9KNHdPL2tMOEgrUlYvK0NGWjh0?=
 =?utf-8?B?WXdsRGRBWG5laldnMitrb01oUDNNUVNLVW5ldVlaNTZ0N1JGcVF6RXlScVJZ?=
 =?utf-8?B?OHBwMGhwSDA5b0g4N05aTTZoZWp2aWhkUGpUMVNPSzRkd2ZobCtGcTQrSll0?=
 =?utf-8?Q?4DnbC6XrRqfjbjY8XPj16edBq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1fce49-5878-4e64-dcc1-08da842437c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:53:51.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhoohEpqhbTNH5/U2i3WEi0uEzxCGAXMc046aFu4VoWoB4sH2oRSoodHJ3yUso3n4f0F370CvMBNmKthLP33OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2554

On 21.08.2022 18:14, Marek Marczykowski-Górecki wrote:
> On Sat, Oct 09, 2021 at 06:28:17PM +0200, Marek Marczykowski-Górecki wrote:
>> On Sun, Jan 31, 2021 at 03:15:30AM +0100, Marek Marczykowski-Górecki wrote:
>>> On Tue, Sep 29, 2020 at 05:27:48PM +0200, Jürgen Groß wrote:
>>>> On 29.09.20 17:16, Marek Marczykowski-Górecki wrote:
>>>>> On Tue, Sep 29, 2020 at 05:07:11PM +0200, Jürgen Groß wrote:
>>>>>> On 29.09.20 16:27, Marek Marczykowski-Górecki wrote:
>>>>>>> On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykowski-Górecki wrote:
>>>>>>>> On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
>>>>>>>>> [Adding Juergen]
>>>>>>>>>
>>>>>>>>> On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-Górecki wrote:
>>>>>>>>>> On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
>>>>>>>>>>> On 18/03/2020 14:16, Marek Marczykowski-Górecki wrote:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> In my test setup (inside KVM with nested virt enabled), I rather
>>>>>>>>>>>> frequently get Xen crash on resume from S3. Full message below.
>>>>>>>>>>>>
>>>>>>>>>>>> This is Xen 4.13.0, with some patches, including "sched: fix
>>>>>>>>>>>> resuming
>>>>>>>>>>>> from S3 with smt=0".
>>>>>>>>>>>>
>>>>>>>>>>>> Contrary to the previous issue, this one does not happen always -
>>>>>>>>>>>> I
>>>>>>>>>>>> would say in about 40% cases on this setup, but very rarely on
>>>>>>>>>>>> physical
>>>>>>>>>>>> setup.
>>>>>>>>>>>>
>>>>>>>>>>>> This is _without_ core scheduling enabled, and also with smt=off.
>>>>>>>>>>>>
>>>>>>>>>>>> Do you think it would be any different on xen-unstable? I cat
>>>>>>>>>>>> try, but
>>>>>>>>>>>> it isn't trivial in this setup, so I'd ask first.
>>>>>>>>>>>>
>>>>>>>>> Well, Juergen has fixed quite a few issues.
>>>>>>>>>
>>>>>>>>> Most of them where triggering with core-scheduling enabled, and I don't
>>>>>>>>> recall any of them which looked similar or related to this.
>>>>>>>>>
>>>>>>>>> Still, it's possible that the same issue causes different symptoms, and
>>>>>>>>> hence that maybe one of the patches would fix this too.
>>>>>>>>
>>>>>>>> I've tested on master (d094e95fb7c), and reproduced exactly the same crash
>>>>>>>> (pasted below for the completeness).
>>>>>>>> But there is more: additionally, in most (all?) cases after resume I've got
>>>>>>>> soft lockup in Linux dom0 in smp_call_function_single() - see below. It
>>>>>>>> didn't happened before and the only change was Xen 4.13 -> master.
>>>>>>>>
>>>>>>>> Xen crash:
>>>>>>>>
>>>>>>>> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) == svc->rqd' failed at credit2.c:2133
>>>>>>>
>>>>>>> Juergen, any idea about this one? This is also happening on the current
>>>>>>> stable-4.14 (28855ebcdbfa).
>>>>>>>
>>>>>>
>>>>>> Oh, sorry I didn't come back to this issue.
>>>>>>
>>>>>> I suspect this is related to stop_machine_run() being called during
>>>>>> suspend(), as I'm seeing very sporadic issues when offlining and then
>>>>>> onlining cpus with core scheduling being active (it seems as if the
>>>>>> dom0 vcpu doing the cpu online activity sometimes is using an old
>>>>>> vcpu state).
>>>>>
>>>>> Note this is default Xen 4.14 start, so core scheduling is _not_ active:
>>>>
>>>> The similarity in the two failure cases is that multiple cpus are
>>>> affected by the operations during stop_machine_run().
>>>>
>>>>>
>>>>>      (XEN) Brought up 2 CPUs
>>>>>      (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>>>>>      (XEN) Adding cpu 0 to runqueue 0
>>>>>      (XEN)  First cpu on runqueue, activating
>>>>>      (XEN) Adding cpu 1 to runqueue 1
>>>>>      (XEN)  First cpu on runqueue, activating
>>>>>
>>>>>> I wasn't able to catch the real problem despite of having tried lots
>>>>>> of approaches using debug patches.
>>>>>>
>>>>>> Recently I suspected the whole problem could be somehow related to
>>>>>> RCU handling, as stop_machine_run() is relying on tasklets which are
>>>>>> executing in idle context, and RCU handling is done in idle context,
>>>>>> too. So there might be some kind of use after free scenario in case
>>>>>> some memory is freed via RCU despite it still being used by a tasklet.
>>>>>
>>>>> That sounds plausible, even though I don't really know this area of Xen.
>>>>>
>>>>>> I "just" need to find some time to verify this suspicion. Any help doing
>>>>>> this would be appreciated. :-)
>>>>>
>>>>> I do have a setup where I can easily-ish reproduce the issue. If there
>>>>> is some debug patch you'd like me to try, I can do that.
>>>>
>>>> Thanks. I might come back to that offer as you are seeing a crash which
>>>> will be much easier to analyze. Catching my error case is much harder as
>>>> it surfaces some time after the real problem in a non destructive way
>>>> (usually I'm seeing a failure to load a library in the program which
>>>> just did its job via exactly the library claiming not being loadable).
>>>
>>> Hi,
>>>
>>> I'm resurrecting this thread as it was recently mentioned elsewhere. I
>>> can still reproduce the issue on the recent staging branch (9dc687f155).
>>>
>>> It fails after the first resume (not always, but frequent enough to
>>> debug it). At least one guest needs to be running - with just (PV) dom0
>>> the crash doesn't happen (at least for the ~8 times in a row I tried).
>>> If the first resume works, the second (almost?) always will fail but
>>> with a different symptoms - dom0 kernel lockups (at least some of its
>>> vcpus). I haven't debugged this one yet at all.
>>>
>>> Any help will be appreciated, I can apply some debug patches, change
>>> configuration etc.
>>
>> This still happens on 4.14.3. Maybe it is related to freeing percpu
>> areas, as it caused other issues with suspend too? Just a thought...
> 
> I have reproduced this on current staging(*). And I can reproduce it
> reliably. And also, I got (I believe) closely related crash with credit1
> scheduler.
> 
> (*) It isn't plain staging, it's one with my xhci console patches on
> top, including attempt to make it survive S3. I believe the only
> relevant part there is sticking set_timer() into console resume path (or
> just having a timer with rather short delay registered). The actual tree
> at https://github.com/marmarek/xen/tree/master-xue2-debug, including
> quite a lot of debug prints and debug hacks.
> 
> Specific crash with credit2:

Are you sure this is Credit2? Both ...

>     (XEN) Assertion 'sched_unit_master(currunit) == cpu' failed at common/sched/credit.c:928

... here and ...

>     (XEN) ----[ Xen-4.17-unstable  x86_64  debug=y  Tainted:   C    ]----
>     (XEN) CPU:    0
>     (XEN) RIP:    e008:[<ffff82d0402434bf>] credit.c#csched_tick+0x2d4/0x494
>     (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v4)
>     (XEN) rax: ffff82d0405c4298   rbx: 0000000000000002   rcx: 0000000000000002
>     (XEN) rdx: ffff8302517f64d0   rsi: ffff8302515c0fc0   rdi: 0000000000000002
>     (XEN) rbp: ffff830256227e38   rsp: ffff830256227de0   r8:  0000000000000004
>     (XEN) r9:  ffff8302517ac820   r10: ffff830251745068   r11: 00000088cb734887
>     (XEN) r12: ffff83025174de50   r13: ffff8302515c0fa0   r14: ffff83025174df40
>     (XEN) r15: ffff8302515c0cc0   cr0: 0000000080050033   cr4: 0000000000372660
>     (XEN) cr3: 00000001bacbd000   cr2: 000077e5ec02a318
>     (XEN) fsb: 000077e5fe533700   gsb: ffff888255700000   gss: 0000000000000000
>     (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>     (XEN) Xen code around <ffff82d0402434bf> (credit.c#csched_tick+0x2d4/0x494):
>     (XEN)  01 00 00 e9 2a 01 00 00 <0f> 0b 0f 0b 0f 0b 48 8b 41 20 0f b7 00 89 45 cc
>     (XEN) Xen stack trace from rsp=ffff830256227de0:
>     (XEN)    ffff830256227fff 0000000000000000 0000000256227e10 ffff82d04035be90
>     (XEN)    ffff830256227ef8 ffff830251745000 ffff82d0405c3280 ffff82d0402431eb
>     (XEN)    0000000000000002 00000088c9ba9534 0000000000000000 ffff830256227e60
>     (XEN)    ffff82d04022ee53 ffff82d0405c3280 ffff8302963e1320 ffff8302515c0fc0
>     (XEN)    ffff830256227ea0 ffff82d04022f73f ffff830256227e80 ffff82d0405c9f00
>     (XEN)    ffffffffffffffff ffff82d0405c9f00 ffff830256227fff 0000000000000000
>     (XEN)    ffff830256227ed8 ffff82d04022d26c ffff830251745000 0000000000000000
>     (XEN)    0000000000000000 ffff830256227fff 0000000000000000 ffff830256227ee8
>     (XEN)    ffff82d04022d2ff 00007cfda9dd80e7 ffff82d0402f03c6 ffff88810c005c00
>     (XEN)    0000000000000031 0000000000000100 00000000fffffe00 0000000000000031
>     (XEN)    0000000000000031 ffffffff82d45d28 0000000000000e2e 0000000000000000
>     (XEN)    0000000000000032 00000000ffffef31 0000000000000000 ffff88812244a700
>     (XEN)    0000000000000005 ffff88812244a780 000000fa00000000 ffffffff818db55f
>     (XEN)    000000000000e033 0000000000000246 ffffc900409b7c50 000000000000e02b
>     (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>     (XEN)    0000e01000000000 ffff830251745000 0000000000000000 0000000000372660
>     (XEN)    0000000000000000 800000025620b002 000e030300000001 0000000000000000
>     (XEN) Xen call trace:
>     (XEN)    [<ffff82d0402434bf>] R credit.c#csched_tick+0x2d4/0x494
>     (XEN)    [<ffff82d04022ee53>] F timer.c#execute_timer+0x45/0x5c
>     (XEN)    [<ffff82d04022f73f>] F timer.c#timer_softirq_action+0x71/0x278
>     (XEN)    [<ffff82d04022d26c>] F softirq.c#__do_softirq+0x94/0xbe
>     (XEN)    [<ffff82d04022d2ff>] F do_softirq+0x13/0x15
>     (XEN)    [<ffff82d0402f03c6>] F x86_64/entry.S#process_softirqs+0x6/0x20

... here the only references are to credit.c, i.e. Credit1 code.

Jan

