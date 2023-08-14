Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C377B22F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583236.913330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRon-0000qX-5p; Mon, 14 Aug 2023 07:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583236.913330; Mon, 14 Aug 2023 07:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRon-0000oF-2Y; Mon, 14 Aug 2023 07:16:49 +0000
Received: by outflank-mailman (input) for mailman id 583236;
 Mon, 14 Aug 2023 07:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVRol-0000o5-Ec
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:16:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 871c6dfa-3a72-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:16:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8547.eurprd04.prod.outlook.com (2603:10a6:20b:422::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:16:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:16:44 +0000
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
X-Inumbo-ID: 871c6dfa-3a72-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoRDwZrpmiEtsJMliq8Q0vdEpKxByJvodeSPj5QjTTh24K0XjKLjmK93IPCCHYPRNUz1Y4A3AhuoAUGngyw1pgM1SRdV9jKojNRnBVMFIaNy1kuGTuLgm5KrWWFiPx+y/YNTsMHDDt6eRnuWne/QrN3lNLok4Xxj6LEJhCFjrGZnDRaUJgRua72QxfcS6Kg6yT2cXQKG4/H1pYOkTaFuD64mCfEHoX5SW/F/pt0wlwXpw7mR0ixL3RNzOdPhZcRL60P+U71bSi/cp0kws8L0CDwfDty4KhWjpDB3VX48YG/5MtfPr0o3ChMF7JhcdLPZEyHK/i/yC1cvlQ8+0MbaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwRS2+dFdMXNaE+6d8LOg6DOaiWWw1h97YGxv09qc6w=;
 b=PpKsTTCcWK/S8ZHeoycjuJ9qS0VMo1SDnBcH5O7qy5PlDsiuve9XYymu79o5/HrdLmc5+O1atFLoLPIxhPeEgEZt8D6mO068elva7QyocOV4lrgKpmg55saNNlTkKWt7qf/ZaFVC2SGQzkGa3Hdq/GzubsRcwteDoBcuvQB+Lp+b9Yl8ab6p9XNib+3pJiJ+YlaJxVhOAflA23ppy/EpUtVOTLG6Y+Gmy1xCcdd+6U/mHZCDmqalZay+JhM4XJRSyKS3KJvb4gC9AyZDTKbwmBZnKCTw+lAdyYYSMNQwFnxOB/6ZuCRtCGs+XYTB64Gwl9l20jDB2Z/hULYwKaP1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwRS2+dFdMXNaE+6d8LOg6DOaiWWw1h97YGxv09qc6w=;
 b=pHGGiWRaqSwTXz9PWBTzYWMVQAwmTRhsFrhEXclqCpsn1CtnWNe89MI58dj4Z1haKXt3fR10muOXaHyoUqkf+RrjM6GxZigNIm0P1F2GV8Z7QMfALzPevXGK93S7VfsfF9duwXsOSEa/acjWUQ6DcSSI6dms7h5zkSb4ZQj37/iEp3cNVSnM52V+DO4qq1K0WPqGN5bme4SQcExLCQkbJwogwaN5A0DP/OzYNEGr0aivAqGDELXbEbSZlBiFEAoqk0TJASEUwpMbmIdK8ZRhk0ugzmh4gPURmJVJmcVpSA0uhkA/EUL+/DPWIyk0cMGcOYDOavtqluHPzUf9daH85A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4546cf22-b1b4-673e-4fae-1a4d48f77ae2@suse.com>
Date: Mon, 14 Aug 2023 09:16:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, tamas@tklengyel.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308111600190.2127516@ubuntu-linux-20-04-desktop>
 <449fa348676e754b7eae9b8acc00fb86@bugseng.com>
 <2319b8b3-a6cc-7e04-0f2a-ad73a87deb22@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2319b8b3-a6cc-7e04-0f2a-ad73a87deb22@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d28d52-c93d-48e5-f204-08db9c966a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IlM8lxmaC09WnsgImz82D/C/B2RwOaArjZvrVc8+oR4eGL552P+q94/nJpEI78KPqRNwXjtVOcefU26DCsYKIrkUbR385UH6acrQd0HMCKvZOF3NzhMZYykzsGkVZ3/p1CS0uOm0nZ4tAVmMYwyxvVXs1LIFYSVoLFDLRvM7v3bk1DqbFfHoqyuWiADIhT+Rw6RooHQcecRexf2yEdSSs7JKG8zj92iTKSZ0F4vVv/U0M5nwU/V5wCg8b0v+ORkwlsavLw6MPjwfrGR3B+i1AIyLGUzyBqTZM4iqgyAMGZwnLC1g9LlRkH+nRHvR8TC0c6P2c7jGV6kgZjDmbo9XofnxFPA/vzK07/GL5gMtAPDrMGS+n5ziSqq35uQ5TPeuT32M8mt7TMbLl6bkUdOjXjxErerA9u7biOMYHnyxwaV4IkTdRdF4I/UPWK6RI+958d7jEpAuYBBDjIMO21BElIgsTXyDH7ez5tXh+NE13O4rLMXWV7zRUZclkUQYwTSbwmXxQ3vash42e7EkHmI3SRvhPKiUIbV3Q5H1KLbQ1tOZGiHq3VcnFi+M55FXQY1BjekyPoC7PVt0RkyTnl7f4H88maWJegXQDrLOqQKqnxtsM5yxuUdujehnzFCRr0yAAbVTb1Dd6yWinLOiaU8coQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(366004)(376002)(39860400002)(1800799006)(186006)(451199021)(31686004)(6512007)(6486002)(8936002)(31696002)(36756003)(86362001)(38100700002)(83380400001)(6506007)(2906002)(478600001)(110136005)(2616005)(26005)(53546011)(7416002)(66946007)(41300700001)(66556008)(8676002)(5660300002)(66476007)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzhIVHNEOHMwT01MUjNodTdNY3pQRjg3cGR4NFhiazJKZjE1QncxWHdudCtT?=
 =?utf-8?B?RnZVVyt2RlRTZUhQUHprZVVpTnJ0UEVMd3FrQ2dadERkSnB2ZjNvbkNlV0F1?=
 =?utf-8?B?MDdlSzdVelhzU1VYRW51dFdSVHRFdjZuc05nYVRxRFA0UmIwYVFEc2FVYWdN?=
 =?utf-8?B?RXUwL2NyeGJLZXVTcjZnYWNsK1I3UFphMkloRjdJSm1HV0c0SElVcHY4bFNi?=
 =?utf-8?B?dlZiNi9XaFJOb0VJRFp3bkF0NjgvVzNKQUtBc2tjUjRHVHJFMzI1RVFBZUZ2?=
 =?utf-8?B?Vmg5OFpFYWtNT090UmJnOFExR3ZTZi9CK2J1WnBSQVJKaENtcGtySTgzcFdE?=
 =?utf-8?B?RHhyL0MvLytLV3ZRUWI1YTUxaWg4Wnh2Z1ZESWZVVE1IWmlGeGg2TFViWmov?=
 =?utf-8?B?NGI2VFZpbm5hMlY1ejA0citZbzM1K1gxTEpERGp0R2RScnV6MS9wbVZVTFZz?=
 =?utf-8?B?b3hzT0tlT3dDVW1MV0VRcWQyd3ZUZ1JvQ0NkUEFvdkcydERjU21sVkN3dnJY?=
 =?utf-8?B?QlF0OTVCMExjWXJMcTllaGNBdXNnbEczUExXbW83ak1qRzhBRkhJTUJGendE?=
 =?utf-8?B?V0l2bFEveHRxYVhESmRaU1dyZkZQSkNudkdtT2QyOUNmSWpWRWZ4WmN2WVJi?=
 =?utf-8?B?RVp4dml6U0RJSzhqMzY5eXdRV0VFOHBBWnhTNmlDWTI1Z0lhT0trekFlS2kx?=
 =?utf-8?B?OFc4c0t1VUlRNElKRk5DbS9ZQThNWnVUWkowWEt1WGdVa1V4TWk5emdGaU1C?=
 =?utf-8?B?VmJwdzZ5eE1KcVlMUlY4V2xIaUkzUmsvdjdFdk1Ea3lLTlhrdWplV3R2NEwr?=
 =?utf-8?B?bjNrRlpyQmgzRFlwTVNvVFZCOGdoTDU3ckdsZ3hUN25wU2pPNUhVQkZkWmZW?=
 =?utf-8?B?SGcvYXB0NGNWdEg3ZGhDamppRWlIVkpRcmZYNUVqYnJKVGZLbDJ6bWZ4LzZM?=
 =?utf-8?B?RGpUMG94TTZMQWp4OXJ0dDREVEN3SFkzRkFtTzFVTkJ2YTlDZ0MzOXluMnlz?=
 =?utf-8?B?TkNFbzdVbWhzUEtBNGk5VXczUVpFVkV1dzRmc0VYa0c1MDhSSnlkdjB6Y2Fz?=
 =?utf-8?B?dGE4Q3kzMHYwUEEvMmhCdy8vZC8rSWhCMThwUzY0M1BDdEVlUlVwb0UxQjBF?=
 =?utf-8?B?bkY1S0txTVUrU0ZseVhKMVpsNldWUzdwL2kwR2lDMW14UmU1R0xOVXJNeXgz?=
 =?utf-8?B?UU8zWUdPaThOSm11enIwckpqNFRoRU1IenhSeVN3YnFsMFBXZHoyTERiemgx?=
 =?utf-8?B?ZXFYZGNtOGIyRFFITG1wdzZKalEycEgzaE8xR3VVNTNSUVZaNitJaFNYTmhu?=
 =?utf-8?B?Q2YrTlBQODl5Zk00aXI4TUIyaHgvcm1zeTVnV1daRmNaSVRPNTRpU3RaYm1S?=
 =?utf-8?B?RVk3TWRjaFZQWVBSekwyM0RyWDRLTGRHbHFzdHhCVGtNNjl1T1N1dkRXWkxR?=
 =?utf-8?B?WWVFNFRCaGhvYW0rcXRDTkRjVXV1VlpMeXcxQXBmb00wR1hoWkxlUTRwTmYw?=
 =?utf-8?B?bEhoN2lsK3Z2dWs1bW42bHdtL2RZUmJGak12UWpRVU00OXVDQUpBVjRvMVcy?=
 =?utf-8?B?OE4zT3NxanlheWovcnV3aklwdHRib2ZpUWNNcS80anZjbjRCWVA3YWhRV1pZ?=
 =?utf-8?B?MDhia2Q4RVRtT3NwWEdYVU5jY29pVXFXaE9PdUNCdkRKZGRXN2JueTI2b3Ay?=
 =?utf-8?B?djZieEVVcWxEVnFZcGt0eG1INCsyK2xpWEl6ZCtDTXBkZlpHNDlkeExWbHFy?=
 =?utf-8?B?Kzh6T2xEcVJHS253ZytybFY1am8wTlE5RjVoTzlUekpQZ0FhNGo0WktLeXBt?=
 =?utf-8?B?UlBaQ0pUNW5oWnJ3WUZpcFQzc2FNSTRGVFdYV3Qvclh0S1hpL3VSYmdWZHNt?=
 =?utf-8?B?eGF1Q1RmWlk3aXJHTkZFZVdUQS9ydXU2K25LQVorZUdqRTNSbFVxMHlWM0Nm?=
 =?utf-8?B?UUVkY3dESnBUdDk3eldkNkdURjFuMzAxaWt6TUxFam5oWFZkeWQzRG8yb2lK?=
 =?utf-8?B?aHExY3E3eUpYYml0OExjb0pseDl6MDV1YTRkMnNmYzNGa1RreGRaVmlMZDZj?=
 =?utf-8?B?Wk1SYXRxUWpCRmxCZHUwNGQ1a2x3YkZmUEtDY1d2amhSVXNVK2UvdmNwLzdG?=
 =?utf-8?Q?Tt81lE7iv0lPoBMc8UNanoA71?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d28d52-c93d-48e5-f204-08db9c966a51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:16:44.7043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feJcP8K+S3F8IGuEelIKB7ELmP4/J5iYjpZiBEJWK2E8HIJTJRqty/G7j/8qO4gfY9e6micXamEkE9KKOjgk0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8547

On 12.08.2023 13:37, Julien Grall wrote:
> On 12/08/2023 10:53, Nicola Vetrini wrote:
>>>> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
>>>> index 7027c08a926b..499b6b349d79 100644
>>>> --- a/xen/arch/x86/vm_event.c
>>>> +++ b/xen/arch/x86/vm_event.c
>>>> @@ -20,6 +20,7 @@
>>>>
>>>>  #include <xen/sched.h>
>>>>  #include <xen/mem_access.h>
>>>> +#include <xen/vm_event.h>
>>>>  #include <asm/vm_event.h>
>>>>
>>>>  /* Implicitly serialized by the domctl lock. */
>>>
>>> I think the problem here is that ./arch/x86/include/asm/vm_event.h,
>>> differently from ./arch/arm/include/asm/vm_event.h, doesn't #include
>>> <xen/vm_event.h>
>>
>> I see your point. Do you think it would be better to include xen/vm_event.h
>> in asm/vm_event.h for x86 or move the inclusion of xen/vm_event.h for 
>> arm to
>> the source file, as done in the patch?
> 
> I think it is a bit odd require the C file to include the arch-specific 
> header and the common one. It would be better to include only one.
> 
> My preference would be to include <asm/...> from <xen/...> and then only 
> include the latter in the C file.

+1

Jan

