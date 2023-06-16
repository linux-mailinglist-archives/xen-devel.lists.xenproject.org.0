Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035F732D0E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 12:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550072.858956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA6MZ-0001Mg-C7; Fri, 16 Jun 2023 10:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550072.858956; Fri, 16 Jun 2023 10:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA6MZ-0001KR-9S; Fri, 16 Jun 2023 10:07:27 +0000
Received: by outflank-mailman (input) for mailman id 550072;
 Fri, 16 Jun 2023 10:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA6MY-0001KJ-C8
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 10:07:26 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 978df4c3-0c2d-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 12:07:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9687.eurprd04.prod.outlook.com (2603:10a6:102:270::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 10:07:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 16 Jun 2023
 10:07:22 +0000
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
X-Inumbo-ID: 978df4c3-0c2d-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gl3JfBrALmCqmpK3Ws6LnQ6cEz6LWUmUg1dKyMCNssEWZDojM68Z5sm1qzgU/Wr4VCoJCZf0sEsCuxDAn8tpQE2QmUqIhISxlYvDxmGfLaoCaQ5wJkvnOI5q/BqUdsEcQl1jOsAk0TyneSDGjTzv4P+WlxSn6kr++8zZbMp17xRWcucrTww4YI4SRC5Uz9Xo5keAKi0c4W6ABEcWg+oVOx+7XizIpSMgiQ39VuNoe/EUxLkzpatKIzRfQH5MXb2ji3xT9YC00wBtQZZCpS4Y2znpRPQooRhDbNQ0iNl+CvJLN6PHBIZyMKRwAhBXi1DZaMw4wN9Y+MzM8Fc1AmZwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GCVSF+xRa5nKArnmz74uJeaknbxVohR+Sa76QFPa7U=;
 b=GBgdGe+RTLhcBcWsjlklBah37liVzDfKjymgJrGwRoEvMgvuT6basErl8wyapPq1BDgAZP3ZFRp/yJM2oZ1iY9kRn31nuKYz8dN5LH+FzUx5eBPxgBV6luGywG6DqGZhaw1iX31iIUyW88hJIgdHr74cgsczYCfpbv8vJK5pwDsDXRHqxDdEFxVWS7VA8jceyiuNSB5WFU78p6cqDp0Q/Sd80Zoi2VTMjf+lSeACy9yEgW+hb4w92RQDYAy/UlGfAy3brJs3VtYvPLO36XVWgTDCCKuzqeKWvdNUjsV2y3y4s6e1pjUKep/vOjNIzDr3nU+7BhZ6CJD483hskri/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GCVSF+xRa5nKArnmz74uJeaknbxVohR+Sa76QFPa7U=;
 b=QntHemvm2tqV5l0r66jFQ88V+HGncxrjaiSY5n76WqslHRePj7nYA64StKW/S3ASZNUaeVgegQK44XZnNlxkeoMHhJ6uZ7bpshUz93/2YydNdAzhQRcaK+/1ZlFguW8sIRAvObxk2Z0E8/gu1KaFjwVJUyNMBf6RMaEtY/roHvOCtGC2S8TlJtgsg+klUha+0/j9xRcvBK0FqtSVcSLKrRQ5K9t8McpEgLbBXthpjo2VRORdt7Kx5gwCoKl/h6MygNk0hZb4jhM06g8G4EBxJZYTGINrlkeVgQ0v8H2uRtaTWQp2ZZlJqvQa/GYIB/0c/Kdj6+5T/n2+0axpdviwHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <554d9f6d-0ff4-c387-3f7b-4f04e24f5197@suse.com>
Date: Fri, 16 Jun 2023 12:07:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: compat code lacks support for __attribute__
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20230614104234.56835aa9.olaf@aepfle.de>
 <ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
 <20230616115103.1fc88699.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616115103.1fc88699.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: aea6e0ce-40d3-4586-aa44-08db6e517a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HYnpm4L1rh8O0GDI8CcSeeUguhUI6KQylQ6Gm6EPx8foasFO5+CZ9yEyOHPcXrPETWnksL+Z4CgxvqIta2Lk8UVAPXC+3X39mCYub79GBBf6sXryBHfZUNV2nYJU8HrqRiuq41kLQFK6qdGafLq8TPmQpZgcyULwx0hj9b4Ux8W5tv641rSrxHPajRoIjCQUwyyuDPgF6T6t7a34RnnBfF5HlBvKoK5lJVK9UuurBfBwTsHQoHXhDyv6CSWP07gGvwRgoTiMyWjpn0D+T+9/8PMOG3gkenSRNnqIdT4THvJnSsr996loeNbyv6sdxTro88sCKDPazYFEr9okt19GH7zdy4ziJmvE6nFzCUq+1eVB3v+cS2ZESJ91I4K8Hn7S9nw/xx6OlEHTENTgaFadAHs2QOg+T2X9hsWQmplbSgOqUqgVu+RfRwt1F3cXEO3hzGZK83e2HcKYWtO4IWVGzL+OjP+Ln5h3tJthvicDImf7YGvJ903pGRk6URDJwX6NOF7ia2109jURXfjv2Dnm7G1/5KWlAN+fFtbfPcyyYdxQLGn1kyq/Jv9KpIs3QM3xDQwyi0z9jRMssbZYXfFwl55Zdn4h6fhetX+dLjg+SsHC8UUg+M70vh26FfsJVnx5yIXzsyM35rlFlJJH6Zp6FQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(26005)(6506007)(36756003)(6512007)(478600001)(186003)(53546011)(6486002)(2906002)(316002)(41300700001)(8936002)(31696002)(86362001)(31686004)(8676002)(5660300002)(38100700002)(83380400001)(2616005)(66946007)(66476007)(6916009)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWU1NTRwbW9vdVd5MG1oekdNNWlZU2RVNEROWklJTjdtc2ZaZlNPMktkNHp5?=
 =?utf-8?B?YUFjSlNoTVZMcDZldU44Z0xjSFN2NWV4NHpBc2JTc04wZVk2NWlFYm84NEZF?=
 =?utf-8?B?TUdBeldiUzhzeFVqa0lEcDhVeU1ERWx3SkdzK2JpTHV5MzJWN01Wb0l5eHRm?=
 =?utf-8?B?WnZlRmlhL2VxNHdxcjZaUzQ5OE94Rk5WNWRqbmFHRm5kbHp2d1BhZEJDM0xF?=
 =?utf-8?B?N2VVZnpGc1M3VmNTb0xSZEt2UkJMQkJjd0lDTktmaEVyQ1MvdkxpbjZwbExC?=
 =?utf-8?B?bG9nZ2ozUnpYdEVRRW9na2o1MGJEQkJyRHB2ZDREMmpJSUs3YkE5S0JjYjBm?=
 =?utf-8?B?REF1OHlQVGIwTThkQVhEZTAvWElmKzZ2R1p1UlFNYTZjN0g4d1FSbCt5b3VO?=
 =?utf-8?B?Z0dadC9RVVJvNzRIUnduVFBYanN1dWZIZ2JzSGJwN2VFanBVYmMvRzZXSkk4?=
 =?utf-8?B?dWUySVpLSmIvdGdudFpPSTlYWmEwM2FIUkRMa3NDRVV1Sm80cHZNcmdOTnc1?=
 =?utf-8?B?cmszeURRWDJGQUhBVGpuVDl6VUdyczFTZFdISWhmQVpqQytlTFNHWStZVG9P?=
 =?utf-8?B?bnFwWG9PbTVvQVhiTDkxaVRySldyZjh2V01scUtKOG15Y1ZIQmN1VElOVlhv?=
 =?utf-8?B?QUxEaXp2NUh0bHd1bjJLd25iSURoTU9XU29TbWJSdkhITUZtRy9SdGF1Z0dF?=
 =?utf-8?B?RGFPdmE0dTNvK0FGL0MrQ29odTBjUWhydU9OZjY5K0J6YWV4QWFZNkxqblp0?=
 =?utf-8?B?OE5YMWRteFM5MGhRVTBVdWVkZmpTMHRxSzRmaTc1SnBZTGZXdFU4WmwweUJ2?=
 =?utf-8?B?aGpuWDdENHlXcVMrek9oSWhNdkdHcDhyWG1SMlJSMTJFV0xwMUluYnRydnBt?=
 =?utf-8?B?N2VyYzRmeFhYUjZEZVVNWkhIWVdLeFFaaVBZdytUaU9FQUZqdHFRRFhFOWxT?=
 =?utf-8?B?YTFJR05UOEROZ1orOWRVclpWYm1WdGxFQUhCcENhWVpYUm9hSkk2MWJUR0pw?=
 =?utf-8?B?dzBkTDJ3ZzhVTk1zN2VyMW84aDJyVGUxYy8wNmh1RHFOS0FUdGh2NEZuSy9y?=
 =?utf-8?B?TFltZHVXU0JNd0tacUp6WjhJb2FiWEFKamFaWU9LeUJuZmc4RW5PaTBnVFVs?=
 =?utf-8?B?Wjk0amdGQnVZWktOZG5oYjJHYitrNXBwOTQyVzB2bFdxYmRvTnZ5Vk16V1J2?=
 =?utf-8?B?a1M1Mm5vakphbUVqakVrN0Y2WGRzKzZkNXRJeWJGWks2TzdmTjM0S1dmbXZO?=
 =?utf-8?B?L2pMNit4R3d5Ylg3ekJWdTltZ20wRnFySTN3VlAzdURnam5XUUxGMXF1bGUx?=
 =?utf-8?B?ZUY1bWZQdFIyVWQwRGxTaTVYZGRxNzlBcVhocGVtVUhvM0xkamdBUThhb0JF?=
 =?utf-8?B?WGRhalAzcFduYlczSDJwQm1RZkl0ZnQzVlIvbTUvazVZeEsyYm5ScGRFTHBm?=
 =?utf-8?B?b2tLcTZJK3hHYXJHRGxsR0oyOG1HUCtJMTdZQk5QUGExVkVVdi84REdaVzJw?=
 =?utf-8?B?ZGRmT2FzNHNhVXNnazdUaGJTMGNYcnN1cVBoNlZJSkJ5Y1MzYlVsTFZkS0Uz?=
 =?utf-8?B?WkpRN0FYQWc5MDM0UnI1NDZ1QjNRZlZnMlVwZTl3cTQvNS9nWSt1Z1M1OHJC?=
 =?utf-8?B?WjhHak5ZSHZuRXRhUVNNSTZVMXdpdTR5UzZPb0w3N2RYTVpqaHBZUGI2RmJ3?=
 =?utf-8?B?bURpcUZ1ZFdWUTlIL3d0VVVEOU1SeGtPTHJmUXkrdUJleVAxRVNJZm13SWE4?=
 =?utf-8?B?YTdsN0JoME03LytncElIMDl1a1plMEFobHBjcDhKMVRnU2ZXelY2TWRvNlF5?=
 =?utf-8?B?ZHZoUWY1aDEyWG4rVHQ3blgveG12aVFYeGtvbkt2Uzlmem80bW1iQ3pWZzZ5?=
 =?utf-8?B?QXg2UVh6RHBXa2ZtOGlDQ05nc3dXZ2tXN3BNT3VOcmk2Zlh2NGNuY0NhSkM2?=
 =?utf-8?B?SW04cm5BcFE5b3VyZHB4YnFJb2VxOHV0TnBqTmcxTnE5eU9UcHN4R0ZqUFZD?=
 =?utf-8?B?OHl4ZU1PS1k0R2hmd1gwRmdTZFJTNit1NXZPc3BhU0NoQmF6SVdWOUoxN3hN?=
 =?utf-8?B?bUtZMm8ycW1TN3BNcGduazJEMTdkZ3VQbStMSHZwMjRKdGd5VHZ6SlZ3N3BU?=
 =?utf-8?Q?twHa8iwVsnr/hebnddIpeqOLf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea6e0ce-40d3-4586-aa44-08db6e517a01
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 10:07:22.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sur6iMOxV8+cYrhsBHbsoE1W02cUeX4DKpq6IFjp9yovVL6++UK6jQjHpIITiVPa/xNGlYVrlrhuR3MRvLBbfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9687

On 16.06.2023 11:51, Olaf Hering wrote:
> Wed, 14 Jun 2023 11:49:35 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> However, if you're after adding packed attributes, and if you're
>> meaning to only communicate between Xen and the tool stack, then
>> the requirement above doesn't exist. Yet then I would also wonder
>> whether you need any compat translation in the first place. Those
>> packed structures would better be arch-/bitness-agnostic, wouldn't
>> they? So perhaps we could arrange for your additions to be excluded
>> from the compat translation machinery?
> 
> The change below works for me. I wonder if any special compat handling
> for t_buf and t_rec is required. To me it looks like only uint32_t is
> used, which will most likely cause no unexpected alignment issues.

No special handling is needed, indeed, but ...

> --- a/xen/common/trace.c
> +++ b/xen/common/trace.c
> @@ -34,15 +34,6 @@
>  #include <asm/atomic.h>
>  #include <public/sysctl.h>
>  
> -#ifdef CONFIG_COMPAT
> -#include <compat/trace.h>
> -#define xen_t_buf t_buf
> -CHECK_t_buf;

... you're removing the line that's actually verifying this is the case.

Jan

