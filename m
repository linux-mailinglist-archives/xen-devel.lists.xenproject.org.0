Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC74736CEE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551859.861603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbEL-0005BO-NT; Tue, 20 Jun 2023 13:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551859.861603; Tue, 20 Jun 2023 13:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbEL-000599-KI; Tue, 20 Jun 2023 13:17:09 +0000
Received: by outflank-mailman (input) for mailman id 551859;
 Tue, 20 Jun 2023 13:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBbEK-00058w-BX
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:17:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe12::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0342a3a-0f6c-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 15:17:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7906.eurprd04.prod.outlook.com (2603:10a6:20b:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 13:17:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 13:17:02 +0000
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
X-Inumbo-ID: c0342a3a-0f6c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cueCBVFESthD4vP9XDP2oDqV54230KWoQeJoERnV49gImWJPgcmMk3YbObIJq8oXeaqUFncbKiM9OCRcTM7XN2iNDxOPjONu/TTGZ3cD9KvHbwICnPTmDy7ZF2T7zISsR7R7BsFqrmlbRm6Yo2xZx7fxCzn9tQ/kT2BoPRE9OVDwSvs6kqpt59/kVP4OUlxDkkpMAfdFwgc4WpsxLBpj1uWuQtM/gI7KDaWgaSdzMiIlWuapNRLPpKXQTGhWTwR17cUH4dgiSMqVkFs3d8g9b+fEAYF+ioSg3zLgG9HkXlvFjL5wExj1QaH/rCfew55+w+hH4lDHXbu7BmQB3NxaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq/6b/PPcL2MNnE8hKiZDs1VpqqQPB5Thrprp9akZMA=;
 b=Xc2NAVt/k/82v03mLvVlBEILMlllRXWStL6pA1yowwOOJHsLVH9LR1Sfd0R/np05CamRPkJduGWBAc4hptR7ciGJYcRI4lFKPFe4Mzt/apwuWrhROmBJI/T2JHoWKL7gMB61GbdjYwAbxlnMmKPoDc97Pca3E9ZfQvo4qfBkoYVh9q3sjBecI/kSFkWDtyPfbsEdB7mzVHCSunbYcz6LG+Lja7wEHjIqnWLAzlCAYdJUWbluq7Z32CiVe5kPOLI14fBJmZTqFrwEPSKpXkh2dqiqvjNHIErUJbmKZ7WGPEx0x/ndxEjhy58+9Aox9aoJyNRBDnJ0DVp27b8ZZlNqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq/6b/PPcL2MNnE8hKiZDs1VpqqQPB5Thrprp9akZMA=;
 b=YYfliunsVy5EUn9c6JNxve08ZozfUJwtybJm0ppKyY1LaliWVptUu5jm1yAMvXG9UvMjEQ0jBeW2m8kCoV3B6dA9ZSY2eBkT+pDuxsU0YDj5RyegSM0h6Hm5F7iwF+rI8N0j4XIgCefiKpeY7O55iSDnE5VVynsHkmdtRRvOdZpkOmZOxBQkP2mMIulwzJaxVGXvgyRtqzs0RUaoq/Oi99c39vZ1wtzK5d7VWSsfUct15GpsrixanN618ws9y3CX93NIrHWtAA8zB/jFIVrfSAt+AD/0lvxWl0RNqK4WIltxK/SE+yFvOWniyfByiBAnBR1lNTcu9GFQNREBRqjhDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4bfab14f-c68c-b79e-6a2a-daaaa4c23eb7@suse.com>
Date: Tue, 20 Jun 2023 15:17:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 12/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <27690fdf9658339f12061f1bd171ebe5f969eb1b.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <27690fdf9658339f12061f1bd171ebe5f969eb1b.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c32d72a-94c4-4546-fe1c-08db7190a2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ssk4mNthcnmrI9GuGkHjefOocT06wBJZA1mWFz087R8M27yQfBkNenYQHV8rvCM2TbVlYGkLgx6/mRQgtMIk8k26bim55Q4T7RP/xfOj1QemOuWvLBCmYHO+kpG2MXps6Ijhj403TOfZHTH75oVkBAk66SB0zO1gcHzgQWU04RsqTKFWD7/85V4qO29Rty0AbdglVs7+EIltiIYImQSGBngXX3/sXWPrxaNltI7qxqzIpdILaEjnINJL68iGX6L4lnUoSUq4uCh884Ygcsxz+HWPoCR4L9p0/cqMeDPGMz06TWz1eYoh23Ii29nZfrWIMhKJ0bZnrhz+cpTwcan3XE8876KyVqdu5slrQjYu9f0aldSOUEfHFWpqZ/3vqpAf8u/8Xc4W6IQ6k5VDlod6J9djqu/l82kiGacexCz7EnMoYF3mgP74i9dp4N1rNfl5v4wxA1f/iL5FKYK3cMCM/OCPQS9Bjt2UN25dtoLUgKzabCNDYnMuBSXpV0Alb82GzssOhDlhaJ2xrTRMEyvc0KMN6/VUCMglkXioNjTtQgBfXuHEMbDz+hECDY78F90kAnKmzMPXquhrvhfALn61wHpn655kgejoQeVVUX6OzNsjj+EWDWH1XaOZQrRRsKHuQTsNt63MLkwYT9Qx8sPIQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(31686004)(36756003)(66946007)(66556008)(66476007)(8936002)(4326008)(8676002)(6916009)(478600001)(5660300002)(316002)(66899021)(7416002)(2906002)(41300700001)(31696002)(86362001)(54906003)(26005)(6486002)(38100700002)(6506007)(6512007)(186003)(53546011)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0pjdU42K055ZVorb1p5ZysweGw1UEwyQVdvWFVLUWZMdzArOGI0VkZmeGxT?=
 =?utf-8?B?ZTFTMEJYN09MazZtbGgzTCtjM0VNZmRBRzgzb0pIcW1qWmpNSG0xQWpkcXRY?=
 =?utf-8?B?ZCs3VUdFS3FCdDBhYjBaWFMwVnlZK3drc0o0eGV0RXUvQ3U0eEhDdzY3NDF2?=
 =?utf-8?B?N1FmSTlFNGNFUGtXbk1mSFMyQzBNYys0YzRraDZMRVRpSGJ2YUF6M1VBU1V1?=
 =?utf-8?B?L0xNbUhuZGJSOHdFWDQyZ3Jva2hzeXpuZ2NTZzhHSzcyS0xFdEwwUDZ6ZzJC?=
 =?utf-8?B?WmFtSmtXNG1TdDdQS3prRUpsMGI4cHoybEh6blB1YlZSN1lqSUFrcTdnMHQ5?=
 =?utf-8?B?MlVqU3JnVlArbmhqYVdCRzhsWEhRbEtEQ1BEbGVScEJSTTZqcUc4bVFwMENU?=
 =?utf-8?B?V0k4ZXI2UUZhaTJtUVIvb2Y0SkhFWlVwOEQxWDBtVEt4WmZ6VUo5NXY5bU5G?=
 =?utf-8?B?bEgzTEZ4NVMzWVBrQWV3QjdldDJsVkJLaUsvSUI1cDllcnpmTlRXNDR6TGJ1?=
 =?utf-8?B?ZzdNOTVJWm9RdS9LNGo2b3Vyd3pNb2ptelcvZnlrV2ZOVUJ5YXpGT29nRm03?=
 =?utf-8?B?akU4bTM2ZWtVcVVMTUtkUkdYQ2pBZGtkK05IYmpCbnRYbEk0SnJoYmwrUUhK?=
 =?utf-8?B?ejg4cGFid3RBSlRLU0QwTEJ0bEw2SXlPTnJCRndKeU1aam44aVQzNFFBeEFo?=
 =?utf-8?B?OFhESkc2cUJ0UEJoVjRPVlRTSVM0aTNWaE1SKy9zUHhFYVZXMTI5eGVDa3pU?=
 =?utf-8?B?YzJJQ1RpUm1Fem1DdGxLQjk4eitYTGZNTlZZbkVKNWhkamxxbjE1WFFLWVlm?=
 =?utf-8?B?NGpYNnZFTGx0ZkhDck92L01IdkdVOXd4WkQwZ0VPMHd1RVJpUi9WVllKUW5r?=
 =?utf-8?B?T3pNU1VBMGxCdjFTa3BxcDRHTjkwV0JaRUhybUc3TTNkNVpaNUZOMTdpaml0?=
 =?utf-8?B?M1M3a2N4K2Q5aEYxcHZoUjVWTUUxbml0K0srZDNmeU1qVmxyVGJiYWVsOXVG?=
 =?utf-8?B?c05TMDYxbTJtUzNUUXJCZDJLeXE0WmhrR0I4RXY0MlRCdmlVT2dvZ1RqZW1K?=
 =?utf-8?B?dEV4QXIxeXpHUU9rbWRsSHd0Yi93eTdDUi9McCtBM0xZS3VEVE1GL2NiYXNZ?=
 =?utf-8?B?aEF3QzZqenN6SFQxSnBsL3dRc2IzdGJKNzZsUnRiMkNYNCtKdVVqN3lsdlVt?=
 =?utf-8?B?S1hvcTFOc3RtUVEyajhobWxMNXRIRk5uZHdoaFJPRlJCR2FSZFdrcld0WEcw?=
 =?utf-8?B?ZEVWamhoWTBUZllzQXB5ak91ZnNXSXZDOHRkdEZQMGxJUVNKM2pFQ2NMY0h0?=
 =?utf-8?B?eHQzL2g0bEVXQnJNWnlYcEFuclFmVU9uZ1FyRnp3TVJjQnlvcGNwVTRIYWhS?=
 =?utf-8?B?dUpId201WmdaS1YvMk1OQnFCOGxZTG1nZXdhd2oyWEIyZmo2SS9wU2drSlR3?=
 =?utf-8?B?Sm80UHp4WFNHckFwM0MzdHFWUjExVlJPenRvTzQvMnF6WkxMRlRqbTh2eUJy?=
 =?utf-8?B?VXFwR29wM0hGb0lFT0lLL2RaVm5WRkdqNzlDRXpRamhjcXEzYjBaRWhldm1I?=
 =?utf-8?B?WlZUSXdXYjVLNWE4cVVBblhVaDdJbUx0NStiQ29xSVRvT0VyVFRSb2FIN1lK?=
 =?utf-8?B?MEVoTGsxZlpEVHdCbkNOOFVLODJMN1BLbGZLZ0NwZVpRdjZVaERKQ0NTcEtx?=
 =?utf-8?B?M3hvaVJ5WUZDYzR0M0dRV3g4UGNvS2lIc3JBbjExVU95UVA0MkxXeS95d0Nn?=
 =?utf-8?B?VU1tMW05TEd4MmlnSmlCcFNjUFliS1VUZUFKOVRsUWx1MlpPSEpOVG1FcjF4?=
 =?utf-8?B?alVFV20wUXZnUDF0dUdTenZSM1lCUlFMVHp3bllZb2JnK0ZNVUZrS2RHMHdv?=
 =?utf-8?B?TjFvZDJlbW9KcXJaTUpISXZLZEVtb2UxMkZzc1BobXJ1WmhqQW1KdUNaMFUz?=
 =?utf-8?B?VjNpSUpub01TZFVJYW50UzBWOGxkMjlnWlJuc2lzaE01QWFXWXhCRFZIdjFB?=
 =?utf-8?B?cXk3SndUdlp6SlBDcjFaYjVnd282N09BZUVtUkdLUVNFTjdxWllMWW92R3Jy?=
 =?utf-8?B?MFgxZlByK2JpK1J0VnBidmVuRzA2YzhxVW5vUlppcHp6Ymp0MXFXVGR0UVJE?=
 =?utf-8?Q?x3Trbybxxa2tUiYwkbzvLwQCw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c32d72a-94c4-4546-fe1c-08db7190a2e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 13:17:02.7443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3haKY5h+IAr6mEGut4MJCZuqOcc02nykg1Dl/5Hr+blDQfAUVVW6h+0uiiTA6Bl9lwcKX4VzEmNFhAeFlxlWDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7906

On 20.06.2023 12:35, Simone Ballarin wrote:
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
>       * Setup the APIC counter to maximum. There is no way the lapic
>       * can underflow in the 100ms detection time frame.
>       */
> -    __setup_APIC_LVTT(0xffffffff);
> +    __setup_APIC_LVTT(0xffffffffU);

In cases like this one I wonder whether we wouldn't better switch to ~0.

> --- a/xen/arch/x86/hvm/stdvga.c
> +++ b/xen/arch/x86/hvm/stdvga.c
> @@ -39,46 +39,46 @@
>  
>  #define PAT(x) (x)
>  static const uint32_t mask16[16] = {
> -    PAT(0x00000000),
> -    PAT(0x000000ff),
> -    PAT(0x0000ff00),
> -    PAT(0x0000ffff),
> -    PAT(0x00ff0000),
> -    PAT(0x00ff00ff),
> -    PAT(0x00ffff00),
> -    PAT(0x00ffffff),
> -    PAT(0xff000000),
> -    PAT(0xff0000ff),
> -    PAT(0xff00ff00),
> -    PAT(0xff00ffff),
> -    PAT(0xffff0000),
> -    PAT(0xffff00ff),
> -    PAT(0xffffff00),
> -    PAT(0xffffffff),
> +    PAT(0x00000000U),
> +    PAT(0x000000ffU),
> +    PAT(0x0000ff00U),
> +    PAT(0x0000ffffU),
> +    PAT(0x00ff0000U),
> +    PAT(0x00ff00ffU),
> +    PAT(0x00ffff00U),
> +    PAT(0x00ffffffU),
> +    PAT(0xff000000U),
> +    PAT(0xff0000ffU),
> +    PAT(0xff00ff00U),
> +    PAT(0xff00ffffU),
> +    PAT(0xffff0000U),
> +    PAT(0xffff00ffU),
> +    PAT(0xffffff00U),
> +    PAT(0xffffffffU),
>  };
>  
>  /* force some bits to zero */
>  static const uint8_t sr_mask[8] = {
> -    (uint8_t)~0xfc,
> -    (uint8_t)~0xc2,
> -    (uint8_t)~0xf0,
> -    (uint8_t)~0xc0,
> -    (uint8_t)~0xf1,
> -    (uint8_t)~0xff,
> -    (uint8_t)~0xff,
> -    (uint8_t)~0x00,
> +    (uint8_t)~0xfcU,
> +    (uint8_t)~0xc2U,
> +    (uint8_t)~0xf0U,
> +    (uint8_t)~0xc0U,
> +    (uint8_t)~0xf1U,
> +    (uint8_t)~0xffU,
> +    (uint8_t)~0xffU,
> +    (uint8_t)~0x00U,

What supposed effect have the changes to the initializers of this
array?

>  };
>  
>  static const uint8_t gr_mask[9] = {
> -    (uint8_t)~0xf0, /* 0x00 */
> -    (uint8_t)~0xf0, /* 0x01 */
> -    (uint8_t)~0xf0, /* 0x02 */
> -    (uint8_t)~0xe0, /* 0x03 */
> -    (uint8_t)~0xfc, /* 0x04 */
> -    (uint8_t)~0x84, /* 0x05 */
> -    (uint8_t)~0xf0, /* 0x06 */
> -    (uint8_t)~0xf0, /* 0x07 */
> -    (uint8_t)~0x00, /* 0x08 */
> +    (uint8_t)~0xf0U, /* 0x00 */
> +    (uint8_t)~0xf0U, /* 0x01 */
> +    (uint8_t)~0xf0U, /* 0x02 */
> +    (uint8_t)~0xe0U, /* 0x03 */
> +    (uint8_t)~0xfcU, /* 0x04 */
> +    (uint8_t)~0x84U, /* 0x05 */
> +    (uint8_t)~0xf0U, /* 0x06 */
> +    (uint8_t)~0xf0U, /* 0x07 */
> +    (uint8_t)~0x00U, /* 0x08 */

Same question here. In this latter case, if the array was to be touched,
I'd wonder if this wasn't a good opportunity to drop the not really
helpful (but cluttering) comments.

> --- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> +++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> @@ -471,30 +471,30 @@ typedef struct _HV_REFERENCE_TSC_PAGE {
>  
>  /* Define hypervisor message types. */
>  enum hv_message_type {
> -	HVMSG_NONE			= 0x00000000,
> +	HVMSG_NONE			= 0x00000000U,
>  
>  	/* Memory access messages. */
> -	HVMSG_UNMAPPED_GPA		= 0x80000000,
> -	HVMSG_GPA_INTERCEPT		= 0x80000001,
> +	HVMSG_UNMAPPED_GPA		= 0x80000000U,
> +	HVMSG_GPA_INTERCEPT		= 0x80000001U,
>  
>  	/* Timer notification messages. */
> -	HVMSG_TIMER_EXPIRED			= 0x80000010,
> +	HVMSG_TIMER_EXPIRED			= 0x80000010U,
>  
>  	/* Error messages. */
> -	HVMSG_INVALID_VP_REGISTER_VALUE	= 0x80000020,
> -	HVMSG_UNRECOVERABLE_EXCEPTION	= 0x80000021,
> -	HVMSG_UNSUPPORTED_FEATURE		= 0x80000022,
> +	HVMSG_INVALID_VP_REGISTER_VALUE	= 0x80000020U,
> +	HVMSG_UNRECOVERABLE_EXCEPTION	= 0x80000021U,
> +	HVMSG_UNSUPPORTED_FEATURE		= 0x80000022U,
>  
>  	/* Trace buffer complete messages. */
> -	HVMSG_EVENTLOG_BUFFERCOMPLETE	= 0x80000040,
> +	HVMSG_EVENTLOG_BUFFERCOMPLETE	= 0x80000040U,
>  
>  	/* Platform-specific processor intercept messages. */
> -	HVMSG_X64_IOPORT_INTERCEPT		= 0x80010000,
> -	HVMSG_X64_MSR_INTERCEPT		= 0x80010001,
> -	HVMSG_X64_CPUID_INTERCEPT		= 0x80010002,
> -	HVMSG_X64_EXCEPTION_INTERCEPT	= 0x80010003,
> -	HVMSG_X64_APIC_EOI			= 0x80010004,
> -	HVMSG_X64_LEGACY_FP_ERROR		= 0x80010005
> +	HVMSG_X64_IOPORT_INTERCEPT		= 0x80010000U,
> +	HVMSG_X64_MSR_INTERCEPT		= 0x80010001U,
> +	HVMSG_X64_CPUID_INTERCEPT		= 0x80010002U,
> +	HVMSG_X64_EXCEPTION_INTERCEPT	= 0x80010003U,
> +	HVMSG_X64_APIC_EOI			= 0x80010004U,
> +	HVMSG_X64_LEGACY_FP_ERROR		= 0x80010005U

Iirc this file tries follow the spec to the word. And wasn't this enum
already flagged for another violation? If so, as indicated before already,
dealing with all violations at once would seem desirable.

> --- a/xen/arch/x86/include/asm/hvm/trace.h
> +++ b/xen/arch/x86/include/asm/hvm/trace.h
> @@ -58,7 +58,7 @@
>  #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
>  
>  
> -#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)
> +#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFFU),((par)>>32)

Please can you correct style in such cases as you go?

> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -30,17 +30,17 @@
>  /*
>   * Intel CPU flags in CR0
>   */
> -#define X86_CR0_PE              0x00000001 /* Enable Protected Mode    (RW) */
> -#define X86_CR0_MP              0x00000002 /* Monitor Coprocessor      (RW) */
> -#define X86_CR0_EM              0x00000004 /* Require FPU Emulation    (RO) */
> -#define X86_CR0_TS              0x00000008 /* Task Switched            (RW) */
> -#define X86_CR0_ET              0x00000010 /* Extension type           (RO) */
> -#define X86_CR0_NE              0x00000020 /* Numeric Error Reporting  (RW) */
> -#define X86_CR0_WP              0x00010000 /* Supervisor Write Protect (RW) */
> -#define X86_CR0_AM              0x00040000 /* Alignment Checking       (RW) */
> -#define X86_CR0_NW              0x20000000 /* Not Write-Through        (RW) */
> -#define X86_CR0_CD              0x40000000 /* Cache Disable            (RW) */
> -#define X86_CR0_PG              0x80000000 /* Paging                   (RW) */
> +#define X86_CR0_PE              0x00000001U  /* Enable Protected Mode    (RW) */
> +#define X86_CR0_MP              0x00000002U  /* Monitor Coprocessor      (RW) */
> +#define X86_CR0_EM              0x00000004U  /* Require FPU Emulation    (RO) */
> +#define X86_CR0_TS              0x00000008U  /* Task Switched            (RW) */
> +#define X86_CR0_ET              0x00000010U  /* Extension type           (RO) */
> +#define X86_CR0_NE              0x00000020U  /* Numeric Error Reporting  (RW) */
> +#define X86_CR0_WP              0x00010000U  /* Supervisor Write Protect (RW) */
> +#define X86_CR0_AM              0x00040000U  /* Alignment Checking       (RW) */
> +#define X86_CR0_NW              0x20000000U  /* Not Write-Through        (RW) */
> +#define X86_CR0_CD              0x40000000U  /* Cache Disable            (RW) */
> +#define X86_CR0_PG              0x80000000U  /* Paging                   (RW) */
>  
>  /*
>   * Intel CPU flags in CR3
> @@ -103,7 +103,7 @@
>  /*
>   * Debug status flags in DR6.
>   */
> -#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
> +#define X86_DR6_DEFAULT         0xffff0ff0U  /* Default %dr6 value. */

All of these may want to use UL, as the described registers are 64-bit
on x86-64, and 32-bit only on ix86. (There may be downsides to going
that route though, so in the end I'm not really sure.)

Jan

