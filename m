Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59E559805A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 10:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389377.626243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObG8-0004i0-Am; Thu, 18 Aug 2022 08:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389377.626243; Thu, 18 Aug 2022 08:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObG8-0004fN-6q; Thu, 18 Aug 2022 08:52:12 +0000
Received: by outflank-mailman (input) for mailman id 389377;
 Thu, 18 Aug 2022 08:52:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oObG6-0004fH-BP
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 08:52:10 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00066.outbound.protection.outlook.com [40.107.0.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ad7d78d-1ed3-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 10:52:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7487.eurprd04.prod.outlook.com (2603:10a6:800:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 08:52:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 08:52:06 +0000
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
X-Inumbo-ID: 0ad7d78d-1ed3-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJEN6HjgDFvWNM4PkL4jslkD1SLeA/dtAhZbkp/JOuVpSITQbOh+GlytHQAd/Nk+rG0HoVCmSATgWOnkMl5iAfmGCNkK8Re2biZkAYFHaH2HKlLb0sidin41Ljli54ZM13XHwGjkWWoEPTkT/xU5rSf1ozt8gbrIEe4qqwYkL4oxekFv5DFE2dZItySmJbY4h0kX903GfgphxeYBHw3YeID0sfiKaF7jDOYO8MA1PNr3+ojPPDb8Kkv/8APeVE2ZoHW6j/BAWQ7b6XIpOKWvDnlRe/BsqlrWOqqEHas0fOGGOJ05uQS5ZLRsKRvekibfAhvrLUAqivO9HvSGJKFbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBBgTfeIwaWlegm8J0ysD718Rr60FxDmu1Ck+c27wcY=;
 b=bUM16LjqvdY4w1qqGXP+UAn6cU17b0QctrTI+j0ULVX/R0q/3eWU6ckqyPKZbl7j1sSXseLPds5aXcfHFDZQteBBVjdkdmlOeIrxX6Q+yvzrFc98GFjkqHg6jf1hunEha6qV/289y84zj8hnZu8OVtMrX/mW3YBRyOK10A6eQnS23RHSxg8LeWGXHdnTcbsMXuZqah9SNAcU1w7z+/isqwX67K/TxdONHKH3xuieFwl4DegVcuoorn7OJvCeL8GS+D12C3RpCbIpo277MbyM89JeEZOjtCfoBPJzywjvRTt81zVjdj+hrGvKRY3AZ8Rx2ZxSDfKFYjZkXhmKjc8z3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBBgTfeIwaWlegm8J0ysD718Rr60FxDmu1Ck+c27wcY=;
 b=icVYuq5CGHMVEKD1ivld9uOpz3z07ZCnr8aEc962eY3V5xq4Gdg26l6v+3xYS+xmI1AwNLcA2BQT3EC7pMVdBKNckCWjVeLjHG5hJ1RKBx9DAOf5NEiHDpKwzy75Ly2o0N9SMpu8oLYD8myGyQFI1uEvOQyp+6DAFxz+bn+iVBvV39A8DGk8/dJ7m+h8wmw2noPheWTTlzqnS6DiWrFQNEv+wgyCS9germ44xgb6DZQzA1u8RpzWMHjN4joV4QCteLHSX1tjRiac39QAYCqQ/gOxFM2EnpTocRhpHkY5Ejo7FC2ucOjtGmuQPEjuE1Q1hndmZFPsfj6aKvAbG2Otag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5c21aaf-2946-feb9-2702-31c1a84a6539@suse.com>
Date: Thu, 18 Aug 2022 10:52:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Peter Griffin <peter.griffin@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
 <3d2fb83d-f75e-6c12-a48d-bfa175e6faef@suse.com>
 <Yv38Zdxy8qGY/hpF@leoy-yangtze.lan>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yv38Zdxy8qGY/hpF@leoy-yangtze.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cb0e9e8-624b-4ffc-7fed-08da80f6edd1
X-MS-TrafficTypeDiagnostic: VE1PR04MB7487:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L7fk3hNTxyM/4RG8FbljCWNt/aw4OrCc4Vg/0UJfgs6Mw+bohk0/LQbTNIUhHfSgkowM4ZlppNNqTgiNxk2qNakvlW2f4i930pS3e7n/Buu7mazdkd5N8lUBNndFW7FF+hbovp75IpfAtX2/STbiv2+sbIQZgd69xiRvMK+cUlWG3NKNcunuZAV2fSLIuejCDb5QsF45DVprzF5tQwY2Z8dyBjnghztAEPX6aZ8D7TRywl9BGhCJYbUn9hh1PXQW8upyWe0jh7v+LOL7qMh0dX9t+3zdBa8d5F6TRhUBB6spVheDWk3oEnNZ75zKNMxu5p3z7p5HvmGW3tPLNnJc9Zn2NnF4r3sSEyu8h6of6BTeZ0gX/FGiEImFKIQ3w+I+OgArGg6/Kjxq8hrNbWOvfC9PXx7ifoIU7t64HGGW7kydq/w2dJsLS5st/jjD6jOF7JhJ+9y+Elsw2wedgAEtTR6yzxfmUHAswnE1sT04FzQk7d8bXHvu7d8LhytOC54O+Y6Av0LV/265gD/UxXK+i7KUIpV70xChjsPbCv3GRD0puZCZV43cbX6dMFMsK698XYYeOqewTLqN43C2akaaVpq4zIJwd0aeQpf0yHFCI9BdzB277gD0zAvW8hmKeCGVAXqeUxLuauKvaZncDEBdzeAXkiEVrQuhT9MLQa63Ovk1PMyWSaBSBxWbqfLDt9LjoVYCEyb61ZrEkTIQqfu6K8Z5Zn/iZIc75vsI8v+QS1OhhY+yeFIKCNIZtyjeHxldabmh/ZtS9M6GKrRu6pYbGIZBQFW0zNIZf4lYhYek0Jg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(39860400002)(396003)(136003)(6506007)(6512007)(41300700001)(2616005)(53546011)(26005)(86362001)(31696002)(478600001)(83380400001)(6486002)(31686004)(36756003)(186003)(66476007)(8936002)(66556008)(54906003)(316002)(66946007)(4326008)(8676002)(2906002)(5660300002)(38100700002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ly9hSEJuREg1V2JiQ2VVdXBZbkpGdmowa3U4cnlsY1JVNUhRY2pxOTJGYUpS?=
 =?utf-8?B?UFRBbm5pcnkwOXdvNkswWEpGc21raE1KOThBQ00xN2c3MDFGVE9SOWVIVDRW?=
 =?utf-8?B?RU9jNERBYjR5TzlYYi9mQlVGNmVRcnQ4b0M1bVJDWENBYWdYdjNoTWtVNkZ0?=
 =?utf-8?B?bXZxMFFLd1EzYkNycG8wWUwxdktzTzJ1Z283c3l3Q2NMelJiazdlU0I1K1dQ?=
 =?utf-8?B?blBSTjEwbVFTbGhWb2RKRldCVjJGcjJPUWN2TlN6ajV0SlJ2Y2M5UFBOWjEz?=
 =?utf-8?B?RG13MjQwNGpKdTF6TXltL3BzSWNQU3BYekxpTWQ5L29PZGplVzB1R1M4UUhz?=
 =?utf-8?B?K1RiMEx2dE9mQW01cDRvQXRHM1llMGkraWNGaktHRjZncG1PMzBZR1pnVTM3?=
 =?utf-8?B?dG9OYXIvVEU0U2hlS0ZxYzRyblA3RkoremJsUHZuMDR5OU5ZMU5SZjVwYnhM?=
 =?utf-8?B?QmpqNHc1QTN0K0VhRnFzL1grMTVKd0RQUlJJWVV3M1pFTVA1UzdVN0VTdlpT?=
 =?utf-8?B?RGhZQi95dm9LQXM0VU1FN0VMd0JjUTE3ODNhSE0xK1lWM1Y4SVdoQXJzaGxD?=
 =?utf-8?B?Z0hkQXRVVi85YUozSGprY0pmOWUzTWZueHFwNGhrbUcyMURaODZaK1RFZmQy?=
 =?utf-8?B?aWtkajdCMEgvOHMyZ2hHL3ZtWlRNd0pUaDFkVGJaVmR1d0hsRHdaWWc4d0Rt?=
 =?utf-8?B?Zi84WWxhV2Z6YlYrRlNJVzVkK3orN0JiZDE2V1pRcWFMdzlmRFZLRm5YdlVa?=
 =?utf-8?B?VEpKWjhFNU5ZUXBVTG9SLzI5YWhRRlV4emhHTHRRNVZkcjN0UksrdHlXVXJD?=
 =?utf-8?B?T2xDMENoNXZuMFJQbWQwYWFoY2pDSm0zbWdaNy8xQ05SNGtHUzhwWGlyK3lw?=
 =?utf-8?B?bWY1NUVWNmM4T3JTYUpUYkR1NXpmaTdHTTNIdGVvdDdSc3FZMTdRZnZiSEpN?=
 =?utf-8?B?b3RyemFnSTAxdkFnalB0d0E5WVVEUU1hODVYbG95THdzcDBnZE0wK2JZd2VQ?=
 =?utf-8?B?bVIrRjZnSGZqRkNwVytSOW5PS1F0R1RhdU00VjlOaDJVVXhJUFNyK3VlcTlD?=
 =?utf-8?B?emNHZUlKbGNta3pHUW9VaEhVWGx4YXpHSEF6Ymc1aGhiZE91RmRVT0FNWExG?=
 =?utf-8?B?dzBhMlpkSTRRUHdlUWR5WWN2bGloZm9iQ2lKaHUxSkhRcnJXeHoyd081b3Zw?=
 =?utf-8?B?aDIydWVaOW8rcHVYY1pOWmNDRnh1TG52S3hEaHFxdWtYOVJuTnY1NmdrRjNT?=
 =?utf-8?B?V2lVTG5ybDhwYmRCTGI1L2FOR2k3VFg0TEJvNk9EMXoxV21mQW1hWkNDK0c0?=
 =?utf-8?B?dlUyNENMeU5rVU5RUE1jUkZFU0MweXNWOWtjcCtvY0EyLzNLZ0tQY0RnQ0pH?=
 =?utf-8?B?NkVFd0tnbi9ZdmRGaGJwRkkwUWU0akNSVUFDL2lzSk1vclovM2Jqb3NGWnd4?=
 =?utf-8?B?Qms0RjZsWTBmb0QwU1owdWZIUElWblArZXlZbjNoQzdWQm0yTVd0b3lxMnVv?=
 =?utf-8?B?ZEY0dC9PTGVSeTUzT2ZPMGZLNGFyekVuQ2ltSzZXT05ubTZNOXk1WHBLSGsw?=
 =?utf-8?B?d0JSU3ZkT2VzWTNZekRKMER4bmFhOTI1T0d6Z0hSSlRzMmc4Y1FNczdlNExK?=
 =?utf-8?B?dnVBRkxBQ1huVEhxUFNsZWtKTlNFU0dhMEswNk9xWGxZNUFMZDZTOWp6M2Vr?=
 =?utf-8?B?Y0c0Q01XRVZxcVRUQVAybysvb0cwU3ZXTjhVT0orWjI5amZKQ2tOdSt0emhO?=
 =?utf-8?B?dzBmUGN0ZE1hWW9wcDh1SkZNL0gwSlZRNkd3aHdYVWFKbGFXMCtjZnUvZWRH?=
 =?utf-8?B?MURQZU1xNnk3R2xRTTNROUVnMkRNVjhNNmNBR014U2F6MmlCUGlxMnpLK2Rl?=
 =?utf-8?B?WFB1c3BuTUlrQ3RacWZPQWUrRVFHSXN1ekRiT2Z1WmpSelZMM1laUFhudW5J?=
 =?utf-8?B?U0VodkRLdlMrckhmZ0hCc1ZzZzMrRksrTDFWYU9RaitUYklGRDUySEdwaHhD?=
 =?utf-8?B?Y3hXTTRNdEZYTGVWTWZ2SlBmVlhrM3l1bk5LdFJXMm41cEFnN0Evd3l2KzZs?=
 =?utf-8?B?OXhtcW1DcW1NbndVQWloZmVHRGora2VPTDlKNGUxN3FKa2hyMGhBbHFrVVIz?=
 =?utf-8?Q?FmTzEK3x5i68GXNf7oOCe365s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb0e9e8-624b-4ffc-7fed-08da80f6edd1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 08:52:06.7524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzsiJfmws1F81DNhLG7NlW/fXM1jQsz0A3921G1okr5U2lv6uT2NKZs3PR9Umxhg6cyG8jT86cCFUeDJ/dLvsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7487

On 18.08.2022 10:46, Leo Yan wrote:
> On Thu, Aug 18, 2022 at 09:47:46AM +0200, Jan Beulich wrote:
>> On 18.08.2022 09:34, Leo Yan wrote:
>>> On Wed, Aug 17, 2022 at 03:17:53PM +0200, Jan Beulich wrote:
>>>> Furthermore - what if Linux decided to change their structure? Or
>>>> is there a guarantee that they won't? Generally such structures
>>>> belong in the public interface, guaranteeing forward compatibility
>>>> even if Linux decided to change / extend theirs (at which point
>>>> consuming code there would need to do translation, but maybe using
>>>> a Xen-defined struct [plus translation in Linux] right away would
>>>> be best).
>>>
>>> I saw Ard has helped to answer this question in his email.  As Ard
>>> said, the general way is to rely on Linux EFI stub to allocate the
>>> data structure for MEMRESERVE configuration table.
>>>
>>> Given Xen uses pseudo EFI booting (the ACPI table is passed via DT), in
>>> short term I don't think Xen can support Linux EFI stub, so we need to
>>> maintain this structure in Xen as well.
>>>
>>> This structure eventually will not change frequently, so I assume
>>> later we will have little effort for maintainence it.
>>
>> "Will not change frequently" isn't enough. Imo there needs to be a
>> public interface structure in Xen and translation code in Linux.
>> That's the only way the consuming code in Linux can remain (largely)
>> independent of changes to the structure in Linux (i.e. changes there
>> can be expected to be accompanied by updating of this code, perhaps
>> simply in order to keep things building).
> 
> Yes, actually Xen doesn't care about the structure definition for
> linux_efi_memreserve, it just allocates the table and finally used by
> Linux kernel.  So another way is we can simply allocate a bigger
> memory region (e.g. 64 bytes), which is sufficient than kernel's
> structure linux_efi_memreserve size (only 16 bytes), then we can
> initilize it as all zeros, and this can be helpful if later kernel
> extend the data structure.

Well, no, that's not how one would define a structure which can, in
a backwards compatible manner, be extended down the road.

> But this method is a bit arbitrary, this is why I did't write like this.
> As Julien said, I think the critical thing is to make a call to support
> EFI stub or not.

I don't see how this can be a reasonable option - we'd have to re-
implement an almost complete EFI (to cover everything one can do
via boot or runtime services). But I'm not an Arm maintainer, so my
view here is at best advisory.

Jan

