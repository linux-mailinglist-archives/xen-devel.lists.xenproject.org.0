Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A562369DC60
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 09:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498623.769509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOKH-0002MI-Kz; Tue, 21 Feb 2023 08:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498623.769509; Tue, 21 Feb 2023 08:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOKH-0002KW-HX; Tue, 21 Feb 2023 08:48:41 +0000
Received: by outflank-mailman (input) for mailman id 498623;
 Tue, 21 Feb 2023 08:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUOKF-0002KI-RA
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 08:48:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88349d90-b1c4-11ed-93b5-47a8fe42b414;
 Tue, 21 Feb 2023 09:48:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7499.eurprd04.prod.outlook.com (2603:10a6:10:203::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Tue, 21 Feb
 2023 08:48:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 08:48:08 +0000
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
X-Inumbo-ID: 88349d90-b1c4-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLjZJVtMxc6JpyRtkOYIFzob9C+Vgd8s8ekWWosrLdG8DDIrsb+rvxsVrr8DTWsgojVUO/UqXp0sSfq+z0STTAe3Fl2aWJNT4Qegu+n7DWnJnOMQa2pztGjngPcxcvUGIE/tV4EJ5If26mhFABCeAGbJl/YMfXvDOMJY6VarhevMK+agkgKN1l9yCEuyiiwYFjB1u1mRL4hf9bJQUflvaKt7w4ttk41rF8up4Gb2Xl8hTNGKgObfp4tmu2EEoSRJ/mPq4SURWSP9imvWLo/dITbKFxlJr5wR0ZWSGvX+owRPGqRNPScKwUfcc+tTkIBYpZMsbUkzbcAi5b9FesmBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzS8JE7Jn0QUDZ/qH5Ic23ZH09b9Uv6EWBtNUT05FZ4=;
 b=Z2MWfnmIHP0GU2Trm3L5gYzyLzB/DDYCrRr/EGMAL0ClUCvRjHz93FyQbga9ZPHBumY1z50CXYbzJXmnTq5+Q2RHMYNa4HtVL9RUtlK4F3G3dx48U+4+ZrMgxD7i53NXZgBHjFTTmdcNe7MHLlwuof1weH/2mfd5b5yAeDlzzw/XT+u5N+chEOngzGYaflCpyerV6sqsXlbz4MHSKLlbdHy90XWN+26CRjHBF36nqDLlPdjOcGamFKXIZmKrEjPnFcgZT109KGIuwQfSHv/Ch98sMne+8NMzJkciqkg/BzlS796WKdg6Bosc2D+0TvlcKKRgD14g2AohnVpBWyLqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzS8JE7Jn0QUDZ/qH5Ic23ZH09b9Uv6EWBtNUT05FZ4=;
 b=wTkvjwkctA21AYYQwvFMFZJAKUx+ieoGKHlvyz/8pirI3FA/+ZT+q+VgmilqobRuFu9naXjjoTTnATYzVH1/8qX5HCMM38Bom/p3v0wqg4nuLEZcU9OZg3+g3OfObC/vP1buwRaGCF5ExnQg2+7q6j5kpqeH3yDQ4fw87NVr+9wzdE4j9u74LSCAqkUipLqn9gmVwC3zNtCqqnjLn/uNuLp/MLRYOMR17gcPDiCTzNIl4w3xeI00ysY6xsUw6LeO812lM8aQuzgYorI5D45KIWDrMxLdD50egZDEUT56U/WdD5NsrkehS2WDsgBaS6vQ33rPxDYfnT1Ai/eVox0U3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd562af9-e7d4-934a-d611-8db5db51060e@suse.com>
Date: Tue, 21 Feb 2023 09:48:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <20230216150734.GB2137216@horizon>
 <ba0c8c8f-894a-0ec7-4339-0537952f781a@suse.com>
 <20230220165144.GA2653336@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230220165144.GA2653336@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cba2ac6-6928-411d-aa5e-08db13e85b08
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SyM/PS6HS0Ci6+P3I4wFHZJNm855jTNY5NMZbfq1nRCPARAT0/pd1la9OJxm3QsA6nQ629uKMoIuATsQGzNTX9P0JflrgryuC6vRxptUKUnCzxPKpnue9E8BD3djl0CX+P5sjXWc//htj/P44x4TCFsiALKxMJuMztjiJh9ONlk+gGPfoPmz8bSPRpOfpV/v7Y85lfK+a3kcpQ9QyMl1Qx9awMfpIG/YsAN7PYXpZC73xx+96VZOG1ngmWfBQDyX2SInwLH4AMNawCiVpVWfLFqusRKIIWkKMmzGLz6q+iBO57xFoBx5CwHlpJ0t71b4An9XQF/Axe5M71mpA6PdTXO08vU67HZ5PovQOvFZrKCBDvTIEMUiS0/otqHn3petCMLGSaJMINhM0WvkGnuMj5gE0HwY4Vn3JeNFDMfIaZL64Q4/OcIwadliRQqnK6x3RaK67bzAClMiYhWy7Ji4N7ccwFphfiRDoCgDMWeGvqUmxflzt05zfY3OiJW9pG0NqcEO8d8hyrbWWn32PbNsGeLH5sub15laJd1DIYgo5UaXatHwn+9Xqapgk492tMaoxj067vODaxJ3Ooj0b4gwFpqNhZB4r9UR+7V6hoXVG4wu43z8gRIqpIdtjVwtBdZ/W2fdO9tuMCyMpFny1gNtLmrfNIA8TlViuzG/0k1YV2gOnLZLTVzbQKKwS0QSPVtpZBcYlvxXk1na9c275EM3WDkoCMEc8n+Q02hPKQQQhu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199018)(2616005)(38100700002)(41300700001)(6666004)(54906003)(186003)(26005)(31686004)(6486002)(86362001)(31696002)(5660300002)(316002)(478600001)(6506007)(53546011)(6512007)(83380400001)(66476007)(36756003)(8936002)(4326008)(6916009)(66946007)(2906002)(8676002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1A4OTZhSjhoVEdlaDZnV3IrMllUb0FoRFJUVVAyeEV5UVBDYitmU2VzVXky?=
 =?utf-8?B?WUFBN2h3aloydnpma0NrYnJMRVFrQmtMVWo2WDRsRi9QTjFYS2pqbXlhOVo0?=
 =?utf-8?B?OExRa2ZWTFYweldManFFT252ZE5maGRTUFhjRFFINjZXZ3VlVFM2c1k1ZHg5?=
 =?utf-8?B?dGZIYW5oTDBtWmp0eXdwUXl1Mm5SYnBoc2lOc1huNkZMQjViNmVBSzRZRFh5?=
 =?utf-8?B?dWM1cXJZZCtQeFRzQzVNUXhqMnNIV214YVMxRXpzQXJSdDBpbXRLYkxXaVpq?=
 =?utf-8?B?aFNucGdiM05MQTVNeVJGaFovOW9rTksyVHczaHZndG5aRVZQQlJjMGtSeEI1?=
 =?utf-8?B?YXVIY01Rb1dNdXlsSjVlaE9HS2w3a3ZSRmRCMjhNWVl1QTFVcUZPczI5ZDVY?=
 =?utf-8?B?OENHdTRtcnFZZEduWDc1U1VBMExsRXMzckJiTUxRelJici95WjBFalZIYlM0?=
 =?utf-8?B?eWxLT253aVgyVnhPVGx2d0lkd3ZocjMxQ2N5d3U0M1hXZHVrcWJkUUN2dFgx?=
 =?utf-8?B?eEU0cTFaVktPbHhiVFJHUmJQS21KWmcrUy9mS08raG8vcWpvU2o4andnSWt5?=
 =?utf-8?B?QXJYazJ3aUNyRUJ4eWdETFNadmtrRENTUUhTelc2NnlKaHBCVHg3SHpxa3Ev?=
 =?utf-8?B?UWdUZmFCR3hIcUdiOUdYRGFqNlBGeENWVVhqZVBsZVU2OFBNbUpibUJVbTl4?=
 =?utf-8?B?d0JzNUlMaUxHVGRaT3g0WC9IeEZFbzdsb2p5ajlsejBTVmtzbG8wVlVTZDdj?=
 =?utf-8?B?S1RuU0FOMTBiRWlmdEV3ek00WUdRY1VueldoeXkrRnI2VHJZclJkcndoVHFN?=
 =?utf-8?B?cUZsd01RNS82Z3ZzZVUwTkJobGhzR1JtclJhZktoVlNTRGVMME5oSGJEWTUv?=
 =?utf-8?B?dUJhMitncFdtNGZCQ3N2b3JSVHVXSGl1MjI3TGt5YmY3VDJPK0xGVTg3a3I2?=
 =?utf-8?B?TmlEV1dQZVJGelRmQlNkVitaVWNvQmdmejQ4N1NUUVoxbGhuclRmaUkvTVE5?=
 =?utf-8?B?bnJLdEpZaFA0andXVDF5YUhWRWVvUUU4RHJ4TW92T1VSOGMvL2xLKzFNd3R3?=
 =?utf-8?B?TVZGbzdYNDJRaFNycHV2a1EvQU1mM0xFTkFibURZZ3FURVN1Vk5pL3NaVGJ4?=
 =?utf-8?B?WWJ0M1lNUjFmM0xvajBjdjliTm9TeFcyZU1pWVJiMGw0T1JRcUt6MloxNTVT?=
 =?utf-8?B?YUMyaUVhK05EUFFaMmp4Z1gya1ZXSWE5dFBLV21HNGY4UTJXWDZGNm4vR0Ja?=
 =?utf-8?B?cmZ6SW42NkZwZ3lRaWwyaFB2VDVOR0JBVkoxWUJ3Z3ROa0wrNVNlcXZLQzEx?=
 =?utf-8?B?ME5sTk13cG0vTG45TmQvcUJrZm0vT1MzVktHakFyNkRIeTRGN015ZmNhejhE?=
 =?utf-8?B?UnFjajhwQlRZd285Q1Q4YkcwWktPdHFVS2pVYVJxbmdYSzZOTnFrT1pIL2JG?=
 =?utf-8?B?YWZLeDdTNlE2QzNCSTl6NVNhOWNOMThraU40bVFzNDVrKy9qS3grVnEyS0I0?=
 =?utf-8?B?clF2Wm5EQlBPUG43SDQrYXpKUS8wZkw2RGJzYVBTRWk4ZTNFTE0zTlY5SXRY?=
 =?utf-8?B?czRxbC9BV0tzdC9mcGhRMkdEWDQ3dFBOcC9sYVhzVjR2dTNVODJpQVlaeHhN?=
 =?utf-8?B?NVk5dG1FTHlQMzNQWWlWTXpKcFRxZTFSbi9mRkdwb1FEL2F3WU9OZ3dpem5V?=
 =?utf-8?B?THNUQmhuSjFDVjRRa01sRkxMa2hualVnenZrZnFDd2J6QlAxWGp2cmNnRTlr?=
 =?utf-8?B?SHdDbG4zanRvb0p0ZWg1bXJQYmE1MW1qa3ZTMmNVNlhISUE5Z2llSlBzZ0Fs?=
 =?utf-8?B?dkJBazZ5UURmUExNRktaaEFzU2EzRzh2dlRtdkhaV0RSYnBkWW1EQU4yQUtT?=
 =?utf-8?B?cUZmYSt2d2JVTzUzK1E2OHJneU5Kc1BRM1VxQjhLYk12V1kxbm91bm5iYngv?=
 =?utf-8?B?cm95RzRSMHByRjZ1cHdXanpTUWhTa0Z0cm5HNW5KQkg1eVVqTi9nbVlQMko2?=
 =?utf-8?B?R3V5N3hjVDdwYTltSnV3d3kybU5uYUxKUThlL3gwbExMazJuQ1RSMDlBTGht?=
 =?utf-8?B?ZjY5TmVnSGQ2Qmt5QUE4dTV0ZEFLbncrYTNmeWhVSE1jUzlVVUdVTW5aclpq?=
 =?utf-8?Q?0RLULdkNJDObcROUb0+GZJbHX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cba2ac6-6928-411d-aa5e-08db13e85b08
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 08:48:08.5098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7cz73V/xXf0/cbm+rwGDcDlukYTfim/vCDq97sW0pEgt1aBi2aV2XO0A0D9+m2c8urU0nrUD08PW6GtkrWGNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7499

On 20.02.2023 17:51, Matias Ezequiel Vara Larsen wrote:
> On Thu, Feb 16, 2023 at 04:15:29PM +0100, Jan Beulich wrote:
>> On 16.02.2023 16:07, Matias Ezequiel Vara Larsen wrote:
>>> On Wed, Dec 14, 2022 at 08:29:53AM +0100, Jan Beulich wrote:
>>>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
>>>>> @@ -287,6 +289,20 @@ static inline void vcpu_runstate_change(
>>>>>      }
>>>>>  
>>>>>      v->runstate.state = new_state;
>>>>> +
>>>>> +    vcpustats_va = (shared_vcpustatspage_t*)d->vcpustats_page.va;
>>>>> +    if ( vcpustats_va )
>>>>> +    {
>>>>> +	vcpustats_va->vcpu_info[v->vcpu_id].version =
>>>>> +	    version_update_begin(vcpustats_va->vcpu_info[v->vcpu_id].version);
>>>>> +        smp_wmb();
>>>>> +        memcpy(&vcpustats_va->vcpu_info[v->vcpu_id].runstate_running_time,
>>>>> +               &v->runstate.time[RUNSTATE_running],
>>>>> +               sizeof(v->runstate.time[RUNSTATE_running]));
>>>>> +        smp_wmb();
>>>>> +        vcpustats_va->vcpu_info[v->vcpu_id].version =
>>>>> +            version_update_end(vcpustats_va->vcpu_info[v->vcpu_id].version);
>>>>> +    }
>>>>
>>>> A further aspect to consider here is cache line ping-pong. I think the
>>>> per-vCPU elements of the array want to be big enough to not share a
>>>> cache line. The interface being generic this presents some challenge
>>>> in determining what the supposed size is to be. However, taking into
>>>> account the extensibility question, maybe the route to take is to
>>>> simply settle on a power-of-2 value somewhere between x86'es and Arm's
>>>> cache line sizes and the pretty common page size of 4k, e.g. 512 bytes
>>>> or 1k?
>>>>
>>>
>>> I do not now how to address this. I was thinking to align each vcpu_stats
>>> instance to a multiple of the cache-line. I would pick up the first multiple
>>> that is bigger to the size of the vcpu_stats structure. For example, currently
>>> the structure is 16 bytes so I would align each instance in a frame to 64
>>> bytes. Would it make sense? 
>>
>> Well, 64 may be an option, but I gave higher numbers for a reason. One thing
>> I don't know is what common cache line sizes are on Arm or e.g. RISC-V.
> 
> Thanks. I found that structures that require cache-aligment are defined with
> "__cacheline_aligned" that uses L1_CACHE_BYTES. For example, in x86, this
> aligns to 128 bytes. What is the reason to use a higher value like 512 bytes or
> 1k?.

You cannot bake an x86 property (which may even change: at some point we may
choose to drop the 128-byte special for the very few CPUs actually using
such, when the majority uses 64-byte cache lines) into the public interface.
You also don't want to make an aspect of the public interface arch-dependent
when not really needed. My suggestion for a higher value was in the hope that
we may never see a port to an architecture with cache lines wider than, say,
512 bytes. What exactly the value should be is of course up for discussion,
but I think it wants to include some slack on top of what we currently
support (arch-wise).

Jan

