Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F356317E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 12:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358966.588359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7DzG-0007Hp-2a; Fri, 01 Jul 2022 10:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358966.588359; Fri, 01 Jul 2022 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7DzF-0007FE-Vg; Fri, 01 Jul 2022 10:34:57 +0000
Received: by outflank-mailman (input) for mailman id 358966;
 Fri, 01 Jul 2022 10:34:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/an7=XG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o7DzE-0007F8-Cg
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 10:34:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72518ea8-f929-11ec-bdcf-3d151da133c5;
 Fri, 01 Jul 2022 12:34:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9217.eurprd04.prod.outlook.com (2603:10a6:102:232::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 10:34:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 10:34:52 +0000
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
X-Inumbo-ID: 72518ea8-f929-11ec-bdcf-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwJBNj3l6BqRYI4RpplM1X6sVSKthrgTB7pofZpUGVPlDNZf/9fe4wjHsl2wYFI3UJa0IPhH3HhGmXGnezWDojNfuvdqCAwKVtkUdv+VBq38l7ptOWCtXferC2fMdTgXKhB42MCM8NaAedhGIzrs30t8YQvlN2+YmmTNySBixVpice+jtXGgyliKVdu7bgBZ2bidkZxgYKfhBkG/FAperf3zkVjXOi6ZsTCDzY8xes0dTT9xRfYeoFG3Go0Cgxdm0MZ0tfMpMpfPIFf5m1qgRMd6Pp65ngGCpfCGrByp/cSksmXOuPiyM/GlK/m1BvD5/MWjGh2kq++hn3td4wCSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmEmzqhS1/vZSZBov0UtRzrUd+zx6FE5U9oiwEXy6K8=;
 b=jSzjBlizHlNet6quWWhhQiAsexgABkDRQDkGalxbElXK4QxW+XBJhB2Dcu3BjJvMCfDtaiw9qG08XHg94mSbgLsRKwQsV+REXgi3z+2cdh7KoBee+T/9xX9Fs8YsBNJx8IuHW7uL2bZvQZWs2rg6ySONhI0sESGCwkLriUn2OmuQrDOSokquD0SPY0FNCb7DQFuXXRirBcNsotv5itREgUeYuhtJbousR/AIyr4KMyu+5KmRh4uB9eItvB42PnrK8sNj403MNMA7WtrSV+K3+jX3JdN+o9/a/rrigXx/e/KirtDQqvF79Chr1rDzFkPzX0JtocrL4USleXylT0vhxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmEmzqhS1/vZSZBov0UtRzrUd+zx6FE5U9oiwEXy6K8=;
 b=tlEafBXkqMorBRyIM1UlldEBgOU3fGNFgcp/KhA+XCqvUYwubEv1FBmw2TiO03iLo9E81vDp9yZs9udLkOCBZM9wqVcgYKHplL3XUIgknRNFWvBjLKF4SrjA7LkHBDGl0pPYFXr7hyPbP7LZAhGfDGYSV38dE1uS22TGWiA1PwmL8Iya/qdDlfDcAC2b1OPPwJqLfnjb/inpi4HLUNGnF9NTtC4g+wGolmrtV/VXS5ru79ZJEfbImwvB0C4NGp5I6O2NGE5coLiCHwe9cER8jSRUgGpLJV9CW22g1A5J39IyEeTPt0g0Qm3SzgfwpwMvBo23tSRY7I2rsv7sUKEjDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <061c06ae-e45a-b18c-9c86-3387dac60820@suse.com>
Date: Fri, 1 Jul 2022 12:34:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Xen: fix EFI stub wchar_t size warning of arm32 building
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220701101358.954527-1-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220701101358.954527-1-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c3a0a28-8dcf-4924-bf47-08da5b4d54f3
X-MS-TrafficTypeDiagnostic: PAXPR04MB9217:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mGb17NP/k9cgkJX/XEAmdNSv0f4kJHH5MvZGQRgmhniFtQ2Fwvv1vUgangz1erLs5Bjk/M2AgJoxpQuNvu4RlT6ebR/4dzX8BwnYj8SRgvbRknUADaNAHZpqvZJaw6LisY62Fyc1b7WWlRUIwp0PXRZR01M0l1VcMYOinnyNd0ogQ4STy7OnvDfn5mCXEpkbpN7DDnxa3tD/xOPTswnLssi7mgyESBGFlVbBPg7XirawZUush1asjmXfEs2IUbjqv6ucLvslOVsmVmhEnXBqOn2KI7zesiw94RxDZbc0nt1cxg4/Ppp0Lfs31xoiTAYcc891LJgXRe43P6Rit/9MvbJf2V0SBJXvJj+oFF/v+UYlc5PvxKMuEexKsJJJkhXI2HP5lMKcG7EXtdZzwL7U1qbpORoCjcgDsSI6MeoaF/LlOWLfMKYeYHNxWb36IbA5u88fomjsPEgOY3VVO+M04wBk3bZGOiCPyTGv4LKxkVrWf2IruzGNloYM2yAVxSpkn+4aFsjOkvt5ovZD/1oVQAacSrRzi5I9XEoSY8RW/B3uqnT3Uk5WdChZMtg3dJHMwqevZBpwpRWw8rvrM+0hHNMjNl04HHqMKqXtNwlFS2Z2F5ZyePY3i0JdgSOb1XVNW3FGRSa3pcJmBW4CYqIs6MQ/2XJSZnT5IY8nepgzCEoGdDXfK5sU5tG2YLJ/wUnjW2Xu2LT0i1xeK4SmNNxe7IA20BrJRjAykxfLxrKUZ5cZnQpzWLQydIsFXvIZiJegBYFZIyUCfk8R+fzwg8hmmcuTxUTNNlhXIYv7wM03bCC6ck13pyWwcz2D8FJB8/FTNukGoop7N8VuWH8fMDnb3kXnogTaBAUiAlu5wl7NT3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(376002)(396003)(136003)(8676002)(53546011)(54906003)(66556008)(26005)(4326008)(66476007)(8936002)(316002)(186003)(6512007)(66946007)(38100700002)(6916009)(5660300002)(31696002)(83380400001)(36756003)(6506007)(41300700001)(6486002)(2906002)(478600001)(31686004)(2616005)(6666004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3pmVGFEWU5rQTZsQllhTTNpMDU4VUpOMlhJTG1vczgzbXNkNUFFSnI4aUlu?=
 =?utf-8?B?Z1RVcnkyM0NoNGZXRk9YdVdYYlo0UmdySXRJSFp2WVVwU3BaZmtDUUVDWHA5?=
 =?utf-8?B?cTQ1RFNlQ3ViQ1l4UEcrQVZLeEhQVUFtVVdXeFVZYis1K2kvZG1pZjhLRUs1?=
 =?utf-8?B?VWIyNUd1SnlqWjhlQndXdE9pQXJVSlpFejVDTXh6ZFhQVXpnVUYvdjlwelpC?=
 =?utf-8?B?cmdBRWJOcThYdDlCN3NpbHlBcTJZcU5VN0M0NTR5MVNyMWpMeTZkYVJyaHJk?=
 =?utf-8?B?MC9EdVAxNUtpV2NEQ0RWdUZFYkxpUnJXZ0E3dENmWUhnVERNcUtSQnBKUXhG?=
 =?utf-8?B?YTYrcEZ2ZGtGU2lMN1ZNaHpkWTJqRXp4QXg1Uk9JOEtQbUVXSVQwSHpUc0lL?=
 =?utf-8?B?TTMzR2M1TE9jTmZyUEVIN3ZGd2VCazU4ZXcveCtMbUJuNDZjbjZOem5XN0Fj?=
 =?utf-8?B?WTFHNFM0SkYwdnJ4OXNGK2xlTktmajV3cGJ6SDVvQWR4MWg1SFpDeW9FREkx?=
 =?utf-8?B?RklSQjNqT0hLaFZyZWdkWDVRSEduRUpHUmduRncrZ1BvZ3ZBMjRwVlR5MkRV?=
 =?utf-8?B?QkNmTFlmYVBYUHdmWm1DUmdZa21jemtvamFJS3l6OWFxcXU0VVZ1cnBBU3Vt?=
 =?utf-8?B?YWgvUENPUnl5VGwxemM3UkZ0L2VCWTBVWjdFY2VqclFpRFZsamlXRWNJbENu?=
 =?utf-8?B?Ri84V3JiTEVkZFdOUzhWZmVyVStQd3A3REQ3QzlhVUVRYkZWZEFjb2ZBRlVh?=
 =?utf-8?B?d0NzRzcyTUtTcWo5TSs3WFMzeTBCUU94b215dVFQQkszS3pZUnVpYVo4ZDZP?=
 =?utf-8?B?T3l2alBNbGdyd0lvSDRlMjA1Tm9vR3NtanJibmtuT2Z5VmpteU4xU1UxTGtC?=
 =?utf-8?B?SWhhaHF0b2dzc0hROC9rVTdUMkpEZlBCdUpHeTMxMjBnaW4yVTdQaE0vQzhY?=
 =?utf-8?B?OGhMUkd1ZmVGZk1BNENNVFlaUkxoaGFjTjVrcEFpK2RJb0FxNjQ3ZmJTT2Q3?=
 =?utf-8?B?dmdiUTVjZU1wN3h6NzIxazhwTFl5TVhxL3FBdFJ3Q3JYeXk3MmNoSFFxRmEy?=
 =?utf-8?B?ZlAveWg5cWR0TnIzQVU5dWY0ellQMTZ2V3A1TWlmVHNBRWpXZkpTY3QvcXkz?=
 =?utf-8?B?dFlDV1FFb1F0WHdlRVdxMHJCVi9IT3BISnVTNHRhek9pUnB2OW9HUGFyQ0pV?=
 =?utf-8?B?MEZiVENWbUpxOXdUbFJ1eFhIekxhUjEyRXFNVGhaUXZEaUh2dlBGY2VJV1NW?=
 =?utf-8?B?dHVjNzJQUzNvZVEzVHMvRUQ0OGpNNHM4Q1hVcmdRMnN3T3cyb2JSc0pHdGRl?=
 =?utf-8?B?R1dDd3AzVnphcFhka25KbTlCWXV6YjVZRFovMFFYc3h4RHg5dlVYN1dYaS9X?=
 =?utf-8?B?NHpjSkt3eGpnZVUwYmx0K0xCSXVIdnVDRXpLRjRGbU5zVGx0RS9uVDZ0TkpN?=
 =?utf-8?B?Ui80U0Q0MVIxMEh1WGhBeElrRGYwS2YvTmZOZVp0R2dXWXdPZHhvWnhTQnJ5?=
 =?utf-8?B?TUNzdVltRkVHYVg1UHZLTGRpcnk4eTFnems1QVVtTWZIeFM3QW40YjN0K3hC?=
 =?utf-8?B?MEJ1Um5uR3hNYU4vRUF3YksrZnhuUzNpQ0tVOXN3RnZHcm9TekJ0NTBHc050?=
 =?utf-8?B?eFdXNWZhY0JqQmhhMXU5dUs1aUdid0k4Q00wbHNIQ1JaTEp1aWluM2Q0ZmRk?=
 =?utf-8?B?dUFDZGZzYkloRXU0RFVSSWp5Qk9Zbm5zaFM0L29aWmdOWHhYM0RTeS9ON2RY?=
 =?utf-8?B?cnExVm8wRU9BcS9udlNQZTZEYkoyTndNME9qZnZZZGxCRkFhNnVjWHE3ZDJS?=
 =?utf-8?B?K3lVaFVxL3ZTaFk1SDRja3JGL1NLaE5meHJLL1AxQWF1eVVXb2NMdFhwOVA0?=
 =?utf-8?B?OXZLcXQvM0xsY3pGU3p2NmJTSWd2dk9nSFc2Y3lTWGtRcHFrZGN0bUt0a3Q5?=
 =?utf-8?B?OUNHendsTzI3bDMxZldQZDJPTGtRWWlKalp6MEt1MVREaGdJM1BHMnNoVFND?=
 =?utf-8?B?V0xHREdGVE1STzAwY0VUUHJ4MWJCRk4xSGFoeUIwdHhERFI1MDhuQlVITFAy?=
 =?utf-8?B?QzF6TUVlTUZ0OUJCSDgzMlRZeTRtNURWU1RIQnU2V3Y3OFRpK1BWL3orZmY2?=
 =?utf-8?Q?VntEJ86tLCcwuX4iIkg/UJV+9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3a0a28-8dcf-4924-bf47-08da5b4d54f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 10:34:52.3622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5pA3arw2CEmwdGwwf1/o5W6r9eq/SQs8aIXKf8+5EKQLKNvEnKW6hbgCEnKRjw0Ez8w7T3ETLjmbytXdw9mJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9217

On 01.07.2022 12:13, Wei Chen wrote:
> Xen uses "-fshort-wchar" in CFLAGS for EFI common code. Arm32
> is using stub.c of EFI common code for EFI stub functions. But
> "-fshort-wchar" CFLAG will cause a warning when build stub.c
> for Arm32:
> "arm-linux-gnueabihf-ld: warning: arch/arm/efi/built_in.o uses
> 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of
> wchar_t values across objects may fail"
> 
> This is because the "-fshort-wchar" flag causes GCC to generate
> code that is not binary compatible with code generated without
> that flag. Why this warning hasn't been triggered in Arm64 is
> because Arm64 does not use wchar type directly in any code for
> parameters, variables and return values. And in EFI code, wchar
> has been replaced by CHAR16 (the UEFI "abstraction" of wchar_t).
> CHAR16 has been specified as unsigned short type in typedef, the
> "-fshort-wchar" flag will not affect CHAR16. So Arm64 object
> files are exactly the same with "-fshort-wchar" and without
> "-fshort-wchar".
> 
> We are also not using wchar in Arm32 codes, but Arm32 will embed
> ABI information in ".ARM.attributes" section. This section stores
> some object file attributes, like ABI version, CPU arch and etc.
> And wchar size is described in this section by "Tag_ABI_PCS_wchar_t"
> too. Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
> but for object files without "-fshort-wchar" is 4. Arm32 GCC
> ld will check this tag, and throw above warning when it finds
> the object files have different Tag_ABI_PCS_wchar_t values.
> 
> As gnu-efi-3.0 use the GCC option "-fshort-wchar" to force wchar
> to use short integers (2 bytes) instead of integers (4 bytes).
> So keep "-fshort-wchar" for Xen EFI code is reasonable. So in
> this patch, we add "-fno-short-wchar" to override "-fshort-wchar"
> for Arm32 to remove above warning.
> 
> Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>

Interesting new tag (but why not).

> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/efi/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
> index dffe72e589..b06fb96c1f 100644
> --- a/xen/arch/arm/efi/Makefile
> +++ b/xen/arch/arm/efi/Makefile
> @@ -1,5 +1,9 @@
>  include $(srctree)/common/efi/efi-common.mk
>  
> +ifeq ($(CONFIG_ARM_32),y)
> +CFLAGS-y += -fno-short-wchar
> +endif

Simply

CFLAGS-$(CONFIG_ARM_32) += -fno-short-wchar

? But, as suggested, perhaps further

$(obj)/stub.o: CFLAGS-$(CONFIG_ARM_32) += -fno-short-wchar

to make sure we'd notice any other uses / issues here. After all it
is - at least in theory - possible that Arm32 would also gain EFI
support, and then it would be a problem if the other ("real") files
were compiled that way (albeit I think the issue would be easily
noticeable, as I don't think things would build that way).

Jan

