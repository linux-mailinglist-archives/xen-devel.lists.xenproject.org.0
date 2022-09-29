Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D75EF491
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413685.657491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odry0-00028U-6X; Thu, 29 Sep 2022 11:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413685.657491; Thu, 29 Sep 2022 11:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odry0-000268-3o; Thu, 29 Sep 2022 11:44:36 +0000
Received: by outflank-mailman (input) for mailman id 413685;
 Thu, 29 Sep 2022 11:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odrxy-000262-33
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:44:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10054.outbound.protection.outlook.com [40.107.1.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15956b67-3fec-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 13:44:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7355.eurprd04.prod.outlook.com (2603:10a6:102:8f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Thu, 29 Sep
 2022 11:44:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 11:44:29 +0000
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
X-Inumbo-ID: 15956b67-3fec-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/N9mLbiDXl/ORyakW87VFrCL7wAKGxNweYj7GFmTJ7NCKK3SF0QM/VHQB1C6ZHvj4HYuVYFwPJGA3pmqJWfOwf/xCZM1KMy5ZAyWbXu3fzbJ2GGskVmxawcOcKARQpC/EdiiPQtE8r17xsgIx7xeNPFdXtnbUskgeL0Ax2UPESOfDY3HIZf1ViLFNbqVpm5iPE18861yKX5Bl2+ILhL2Bd1/OKy6C1mgOhH8hWl1uv6WAqxhk+iwVudhFGWQxHTAnnkkGOEtP9ih18yrMMGgEFn6z7H/IFSJDjGH9DfCH1ULjx+KZWp3vC5hmKGgkM+ZfLsyV1Xv0mM86XIfN9rFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcZOI9nh7RvLNCNIgUq3HQSOUXZLasPQX4dPaC0wD+0=;
 b=NLg2jvqkYvAmTL5yq8zWNkoPxXM5ydHWbP6SAaEdmvl0DteO1GeTtuoF4z8a9pLyuX4cs/YdSrNbtzjoEBTp2WFn6eACfZt1idg7iwx/kh58GogeJH72dguo36YSxHYnYhk9UiSJjtyvf1L0iO7yg+ROWbshsiP1gGn62MsxTckcsbtLkjjP/rTmHDQw/wrEevWDCAdYChYtXa7EdYvOqHCqEf1ptSKqNSLbQIMAVRV1NoY6a2jKMMg/y+8XPmzeekzwWfpOCWKCN5CL113MlsArpem//gd3y+DkUquHf/Iom7NY2mtYgEUzvj1my/30Bt3Pcyq16eyAKRzn/05hPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcZOI9nh7RvLNCNIgUq3HQSOUXZLasPQX4dPaC0wD+0=;
 b=L6h8P7VBfhmmp5LqIJ/Bjt2LUyJHHVgV6Hai8Rs1qAXfdRXAthwVcrGykWSQhenMsSQHb+jrTOrXSeK2he4Yurv+pkbzWHmd66oK2wDFA7QaRfkcttRJAeizFM7Z8m5Zt2RsZkmsgcp4yCxyB16O+t2bQMnilj8N+Y95WT9gKNfOBrMxlfPZRxlrcw1CN4+sqY6MSsgGqE9/K3yBDPAtZZXxuGPGjn6qiGb6sUxbAiIH0ZNZa+DIJpFOMzdB1pSlFnHA7pdSKWoX/24MpKcMSGCjrLq1VU+JfUCsRJfHfsF7Ho9MsOiWL2Ur6XRdu25/EyFgUwpF2hk4S9y3gMPEPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e329a56e-0a54-dffa-8e55-0cdf030dbce5@suse.com>
Date: Thu, 29 Sep 2022 13:44:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
 <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com> <YzGeY8L6Op7n8pip@mail-itl>
 <ca19380a-6ccd-453d-4693-ea666152f45f@suse.com> <YzV5/0SYbJVQ91YV@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzV5/0SYbJVQ91YV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::37) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 86830c3a-8a3d-4ae9-72f6-08daa20ff7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bEWKcqudjmlg7NBClMWh8UliJkN7ckLL3Y5YYfRm5yD0CNfDD7VPpnAVr8kjbxX6dmuCnU4ulvaoKm1E0JhvlO+pBhM8QUYhVJLwCf5CX4/5u3JMGrzp7tnv/yRZA4Qiiq/kiQxwGjogNPVcyFCHs0a0K3T0oEF32fEmqLluRBX0AirmgRFXp4Yha1JKsjHOy9DJnOFmn9Hl3PYRfg2wd4dEIYpDG4fgp5NFz3c5hrQKA0vqOxZ0gxoqbmaoL7ZTpiy6gIulZy9bSKpd7oJu9Pkfh9zuOvUJnqJbNUyFyEcsJBlSVEX/7u/2wl8tVaIcE4CPF0FIab3zj54bApUFLAJh7nQU94HbMVC0EeHEXRjmQ/gb6KMoKBGkIMB6AxAu3SQPajsTwEDkH+XMbBxUY3OSQ3qSEpxT4olmjIxZBGyBs5GySwZzWHNd2Uh0tcdnkWcZlNQGgquIMnD64Jj8zZO8oVoTBUJIGwogxv24sLEIpZDnONxQZkyNW7NzU3E9ACQQkT83OobidrRbV7/p814Pe5XGOEDYmSWzJK1YWhzYN84NXon9TH7JyHwanmtmKXtHU0w3RnavfsICVMw5qChBc2YxDctNb/9HvTqX54SYnqbB7XQORFiQo+1M1iPtMUqPyGtKl51vO2LtFGpfYmugQO80RejOtaNckBAHAyehNWsDAf63W0/CDG6kzAwvMJLfRpCTxIx2Rakpjva5YJ/Xb4c5YlsM0Udbz0iXWSqxRvcQMwE5zWV08BHHsztwURCu+r2tGc8DOYrFUcVRru6RmXGQkYExQ48d6FWQ2xI8mSXmZjKlMtM+HbkO6oetXVNjDTqcDLTXPQUlJDwIaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199015)(966005)(54906003)(31686004)(2616005)(6916009)(4326008)(66556008)(316002)(6486002)(8676002)(478600001)(31696002)(86362001)(66476007)(66946007)(53546011)(6506007)(8936002)(6512007)(5660300002)(66574015)(36756003)(26005)(38100700002)(186003)(2906002)(83380400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUsxRXVFTDlFUmhvZklFR0xHWXlPRUV4cW8rQ1M5NUpJS0srY2lyTk41ZG1N?=
 =?utf-8?B?eWVlUDJzZkdwUU9nTi9uNXl3NkVRem5hSzBVeGV2SXdMdTgyWG1FZFBnN3VK?=
 =?utf-8?B?aUJiQTRidkd1SXBFaWM0NURHNzl4N2RjM0ZTeHVvdGlIUGpKa05weDFjTHk1?=
 =?utf-8?B?WHdTZDJSYWg4TS9XVzFobFozWnpkdGF6WTJBdi9vY1hJYkRQdnhPbnBkaE9m?=
 =?utf-8?B?ei9mMmUwd3NVaWtoei9GajBFanBJMm9lZTcvRVo1UDdONGxRQWdTSnFGVjQv?=
 =?utf-8?B?eEZMWGE4TlhhdldWRm45dHBxY3orRnJnS3M1Zy81eU4raG5VeTA5SmJlU3dZ?=
 =?utf-8?B?R3M0ekRBQ0lTQWowZUM2alRnT0o2NTNDSkp4M2lBQTNIQ1FJcmUrRlJxeC93?=
 =?utf-8?B?dTFqYVk3SnhEZloyVjVNQUZtWEd5cGpvbkdQeThXY1ArMHM0RkYvRjJ4MmVT?=
 =?utf-8?B?V0FBamE3MFdGeVltb3lwRzRBY29nV09jSTNkWEluN2RzQjQyME9DSTYyY2h1?=
 =?utf-8?B?S25XZStUZ3UweENQSGJzcWpvdVVMS0VJei9uRVNTdEljZTJ6bHA2N0hUYTA5?=
 =?utf-8?B?bW5CVFdkUWEra0RFTzg0d2p1Wkd2NEQ3bXBmOFlVajhtbEFGQStxS1lqSUcv?=
 =?utf-8?B?MU5iZk1kTGNuMnMrVVN2NU1QRnB6SDlwN0ZkQnRFa1k2OWZVeENJRmluVW4z?=
 =?utf-8?B?K0p0Yzc2Z0xVSzZRN0tkd0lYMm9iUmI3bW9Eand2K3d1MlJ4MGd6Sjc0dDl5?=
 =?utf-8?B?bUUxVVRibFZrc1ZGazN5MHBKa244alRuWlZBcjE4SWFYSE1US29MVnErVi93?=
 =?utf-8?B?YXVUUE1meW1tbEIvRHNmQ1FtR0FxTjE1R2o2ZER1bVhtK1NvRG1lRlpwWlJm?=
 =?utf-8?B?aUNKWG1WQWRWa3haSlRWSDk5VmJJS3lmczV1YURBMmlYWGR0RGdQMDZGbXhC?=
 =?utf-8?B?SUkzL2NRWGVJZUsyMjZTbXFCV2F2Q1FpbE82SGFoK2dsUG8zcVlMK3JnZU1Q?=
 =?utf-8?B?WmxTdW5JazZaM296VllPOFNTcUZvZHBFVU1sSFZHMlhaTVVoWEpkMGVVdVVL?=
 =?utf-8?B?VzA2Um5tK29FNkkrTlczdEhFVFVxdVoxWE5CeDF6a2dZc2gva1VWYUhyc2dD?=
 =?utf-8?B?RSs3Z2VyNUdPSXFOMU8waVp4SDc5S3Y4RWFzaGd0TzdzN3BiVndCVGVpTytv?=
 =?utf-8?B?SzdxSldPMkN0aUNWV2RxcEMxLzd1SG8wQ2NCeWlyUmxpbjIyR0lsSzZkdVFY?=
 =?utf-8?B?V3FPL2lVcDYzOGh6NUp4Q3hoUk80YmZESmdVNEpUQkVtVjVXL2RzbkhHWGxr?=
 =?utf-8?B?NHAvbnR6U3J5R3pMSE1iU0QvTDZrdDBmZnZUVDhTb2QrL2lqUTR5K0dCMWpK?=
 =?utf-8?B?czJpYXgyenhtbEl2U2ZlMlkxVkVXeVhBMG91MFczWnhHK2RZR2xubU1tSVBj?=
 =?utf-8?B?a0M5bVZiaHdmZUtmOGJadnB6NFBscGtEV21mSXk3TTVKYmhSQnliKzNVeWxH?=
 =?utf-8?B?UXBFNEl2NFd0R0hXdnhxbjB6akppS3RsQUJDZWRjN2tLa2FYTkxpOFVhZXNE?=
 =?utf-8?B?M1dvSE1sOEljbjllUmw4MEUxQlFTZ3FYQUc0czNVak1xWHYvQUc3Uzd3YXJL?=
 =?utf-8?B?YUdPMWs1Yjd2OGxEVDBqaUtJWHVuWThaQmFIZVczWVNhMk8xcjZXN0twZ1BB?=
 =?utf-8?B?RWJYSU9QbGpkRTZqSkQvVWxqVlZ2OEZXRmxKajlzSFJPOCtCcFVQYlIzdWFI?=
 =?utf-8?B?c3l3K0RsUVdXS09ZQUd3c0JKSEs5MHNvRmM2Ni90QnpKbjYzUnFZMFlNVDFU?=
 =?utf-8?B?ODNmVkZlamUzVlRFSjNEcnlEODFlc3RYQVZOam5MZjBVdjVhZ1ByeGtXVUNi?=
 =?utf-8?B?b3greUlZa1FYdEdNb0FVRGM4VVZwbk4xTURpZktybU5jUVUxTXhFYmtML2Vn?=
 =?utf-8?B?QXhRVXYrZXcxY01UeWQ1eGVxc3JRV3BBRDVGVDhTV0t6UHhFemF4T3dkdkd5?=
 =?utf-8?B?NUFmamdGT3hZV2Z4UG9Ec2ZzdDVsTEh0N0pDRlorczVyKzdYMjVxZnRobmo0?=
 =?utf-8?B?MmJZVTRIZmJ0R3ZocjFreXVhOFo5ODV0TE9OVFA2UVUvZS9WZEhkek1ZaER2?=
 =?utf-8?Q?hXliNeB7Ea3LJpX26hw2TPp06?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86830c3a-8a3d-4ae9-72f6-08daa20ff7ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:44:29.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDHVU/0Y6H/krXGecMxKa9pWSoy2mUd1g9vvVU9VNP0hi9Dn2O6s095TXSuaJQXSxH+GkWETFbjIMJ8knVBOeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7355

On 29.09.2022 12:57, Marek Marczykowski-Górecki wrote:
> On Mon, Sep 26, 2022 at 02:47:55PM +0200, Jan Beulich wrote:
>> On 26.09.2022 14:43, Marek Marczykowski-Górecki wrote:
>>> On Thu, Sep 22, 2022 at 08:00:00PM +0200, Jan Beulich wrote:
>>>> On 22.09.2022 18:05, Anthony PERARD wrote:
>>>>> WARNING: Notes missing at the beginning of the meeting.
>>>>>
>>>>> session description:
>>>>>> Currently a HVM with PCI passthrough and Qemu Linux stubdomain doesn’t
>>>>>> support MSI-X. For the device to (partially) work, Qemu needs a patch masking
>>>>>> MSI-X from the PCI config space. Some drivers are not happy about that, which
>>>>>> is understandable (device natively supports MSI-X, so fallback path are
>>>>>> rarely tested).
>>>>>>
>>>>>> This is mostly (?) about qemu accessing /dev/mem directly (here:
>>>>>> https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579) - lets
>>>>>> discuss alternative interface that stubdomain could use.
>>>>>
>>>>>
>>>>>
>>>>> when qemu forward interrupt,
>>>>>     for correct mask bit, it read physical mask bit.
>>>>>     an hypercall would make sense.
>>>>>     -> benefit, mask bit in hardware will be what hypervisor desire, and device model desire.
>>>>>     from guest point of view, interrupt should be unmask.
>>>>>
>>>>> interrupt request are first forwarded to qemu, so xen have to do some post processing once request comes back from qemu.
>>>>>     it's weird..
>>>>>
>>>>> someone should have a look, and rationalize this weird path.
>>>>>
>>>>> Xen tries to not forward everything to qemu.
>>>>>
>>>>> why don't we do that in xen.
>>>>>     there's already code in xen for that.
>>>>
>>>> So what I didn't pay enough attention to when talking was that the
>>>> completion logic in Xen is for writes only. Maybe something similar
>>>> can be had for reads as well, but that's to be checked ...
>>>
>>> I spent some time trying to follow that part of qemu, and I think it
>>> reads vector control only on the write path, to keep some bits
>>> unchanged, and also detect whether Xen masked it behind qemu's back.
>>> My understanding is, since 484d7c852e "x86/MSI-X: track host and guest
>>> mask-all requests separately" it is unnecessary, because Xen will
>>> remember guest's intention, so qemu can simply use its own internal
>>> state and act on that (guest writes will go through qemu, so it should
>>> have up to date view from guest's point of view).
>>>
>>> As for PBA access, it is read by qemu only to pass it to the guest. I'm
>>> not sure whether qemu should use hypercall to retrieve it, or maybe
>>> Xen should fixup value itself on the read path.
>>
>> Forwarding the access to qemu just for qemu to use a hypercall to obtain
>> the value needed seems backwards to me. If we need new code in Xen, we
>> can as well handle the read directly I think, without involving qemu.
> 
> I'm not sure if I fully follow what qemu does here, but I think the
> reason for such handling is that PBA can (and often do) live on the same
> page as the actual MSI-X table. I'm trying to adjust qemu to not
> intercept this read, but at this point I'm not yet sure of that's even
> possible on sub-page granularity.
> 
> But, to go forward with PoC/debugging, I hardwired PBA read to
> 0xFFFFFFFF, and it seems it doesn't work. My observation is that the
> handler in the Linux driver isn't called. There are several moving
> part (it could very well be bug in the driver, or some other part in the
> VM). Is there some place in Xen I can see if an interrupt gets delivered
> to the guest (some function I can add debug print to), or is it
> delivered directly to the guest?

I guess "iommu=no-intpost" would suppress "direct" delivery (if hardware
is capable of that in the first place). And wait - this option actually
default to off.

As to software delivery - I guess you would want to start from
do_IRQ_guest() and then see where things get lost. (Adding logging to
such a path of course has a fair risk of ending up overly chatty.)

Jan

