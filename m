Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BADD7D7DB0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 09:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623534.971453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuu6-0000AC-8z; Thu, 26 Oct 2023 07:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623534.971453; Thu, 26 Oct 2023 07:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuu6-00006Y-5j; Thu, 26 Oct 2023 07:35:42 +0000
Received: by outflank-mailman (input) for mailman id 623534;
 Thu, 26 Oct 2023 07:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvuu4-00006S-Iw
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 07:35:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42abe15a-73d2-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 09:35:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6951.eurprd04.prod.outlook.com (2603:10a6:20b:10f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Thu, 26 Oct
 2023 07:35:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 07:35:09 +0000
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
X-Inumbo-ID: 42abe15a-73d2-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXTqlW1Ob1s+m7kx9Fz/W5TT06sWjQwS5a3xdpbq2grGGaTtP8OMMwSILYFlVlmE2l0DbkoBuKnd1D1Th889rx2ytCuZ0E2DrOnH9j/yUQdkuoFAVZb5ucugFy5yfee5rxwQwBHD3mWgm6FHt2Wva9WyDfwCjlRdA0PoDvNPoFpeFDJXePqdpkJXHss0w6i0R9DPp238K3hH3yg+fxYqLa76JD7R5I9nogyWtK6oJ8euW31I18Zgj9TbxHPw6NH5Ua27LY7H71IhlLzOxSC9MFQoH+e9TfX7mEc2Rg8hSVE+zfhasVjC7xy56Q02znUEyRWscz7dd4k3hyg3TSVDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsQAxk9u9hohwHEAMZJh0ndDzytoIRuYpXNu5Dpaw0o=;
 b=fISBe0fwUwFOWE0aJ3P1twESlzGY6sTGE6KWc7eVwyzlKMJZnQcmAIKphnZD4RalzzOjCVkUZTe1a1eVTmdqQwRlfi+pIaSFVgQVcnu3CtY6+KALQPBTLoQP+lVCLuXZvwu02MJpF4SbABI8zSJsxYwzu8v9uZieCEeeZzNi45UUYRhjVlohJ0pvl8uNtDv0X56c5SgE4ZQLD+cjzU7kxesaUPEHPdHmIc+JY3iyUqYID0/ScuEofUnxRSentnXebDbQGDUqjLid5fQ2cYURZ/Q70osc8aPtBzcmLIt+1xp3V2FY4Yd0mmiV6bSaycs/X92Szyr+KYuaPvAqeP6Pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsQAxk9u9hohwHEAMZJh0ndDzytoIRuYpXNu5Dpaw0o=;
 b=rGnzklcEOdyD998sx4lrwMVLLj5+D4ryghHsjJJE7bsX1JfEj5gb7IbN3zwPfDPKdz/dRE0M0pGX4I1/NRtw6YuEoMMQpim2l80heoWEUpqu6RMApgUWoSkbQex12lzxGBYNnFYE14ddqmxv6tZDFYKpujpcl+0nH1D88MuxJPEK5lUHgkB1F7VdaZgvfx7ryVNlcwxpj/logsb0jXcSxkO6GevP/wvxdMsCkMd4QPMAVCdA8ZcFKI+L+uQun37PI2cH+TFVl2gSncTTTsapfgAocC7iOPrtzrY5DHNwKRkLG7IuhtjuN7DjuZ2Y+1qajOI92L5lVsm84RlkB6bJ8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
Date: Thu, 26 Oct 2023 09:35:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 1022571c-35c6-41de-8533-08dbd5f6152e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eJsHDQvYh93zEFszkr7dcxinE0fP8T9kI4ppClnA6yeaynRX+O1cOh35Av2FBO+bORmNsV2hkOYybcWk13Vmefr2AY2c+QXmrQl9HuMXfgBcnAKRb6wx1t0dO3NQHq53NveTso0z1K2+bT1iDjCjXOQXg2MPtS9O19Q92CCsEiTNfcvvCQJrbxJ0vuIhhKLo4lOm5ZK7TZ3jPNKh/gLX9lTp70024ddofbS7+mfCGbmfuhWiftth6PPlFLi8gHCNUbyp3SzLt6voYMqD1Ob4W/lpwZuGxxYiq0qPFWPFLT5DcPhoCS7io9B1foe63vlIy1ubi2lNrbRBjnEBKEAo4IDqwXO8AjKyzFJ0C5fcrZdJBuxSk+uZW/KcgDuTayrNKQeLTVowCkEbum1CwtS+jQysaK2vCF+0BcAMSRK4S4Xw5PbxNSsUezqBJRp7oIycboqoGAl/AU/VZ9Jq8YOnrijqvtTj+DVKy1ZBTT14F8XzGKLyAi/Bc33cNwznYaHj+Zf595/6t4tjF2b3h5KP6avddM81WKRSNFGah0i93ATw/BqYfA+zXL2XM/Pcq9A1FuTZ89rHdYRgomXcpe7AW1q74AJ+LkuqYT4J19IR4l14gTKdilsWKCgjLeOdHGAcbpY5PNdEiLIOtCV5bBHa8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(26005)(31686004)(66899024)(38100700002)(2906002)(41300700001)(86362001)(31696002)(5660300002)(8676002)(36756003)(8936002)(4326008)(478600001)(2616005)(6916009)(6506007)(66556008)(54906003)(316002)(66476007)(53546011)(66946007)(83380400001)(6512007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVk2ZWlSd3pOblNUVjRlUWNrLy9RVjJyaWY4dkN1cm4xaklMdnZzQTZlU1dv?=
 =?utf-8?B?dmNRdklBclNsZy84VXZCUW1JRCtoeDgzenVpZlN1SWxYTHNxT0dLKzhESGtu?=
 =?utf-8?B?bWJmVXN4amhnSVRod3V0cEoyR0Q4TDNPUHlBVCtmaWtVWmNUdGliV1FhWEIv?=
 =?utf-8?B?b3Yyb0JpZVlWMDNyNWlvR0pGVTAzSm41ZGFwVkVxNFJGdG1RN0YybDQ4UlQv?=
 =?utf-8?B?SDk2S2dFVlFzbWdXbXB4WjlUNnpJNFordm5KNU9ZZUR3RDhPa25hWnFYSEUv?=
 =?utf-8?B?UFhORW9XZk5rMlJmeXhKNGdvY3lxSDlxRFhRV00wMkVHdkNIeGxzWktUdkZw?=
 =?utf-8?B?SklCVlpzSTZMdmUrMDlxdEczbDRxaG9wa1dQYVhPWUtoN2pobktMbS9iNGgz?=
 =?utf-8?B?aXhmNHBkdmgrU0dEWHQwOC9Vb0NDdkxBTlRCM2E3QU5FcU5LZXBVdnlDdVVS?=
 =?utf-8?B?YkN3Qm9rYXRZcElQeWJFRXVQYjgwU2xEYkVsQ0tEZm05SW84dS9NbzF6Ukdp?=
 =?utf-8?B?dy90TlB2RkFIYmJvUlVGay9tOHhoVWZUem1lSjNTMEtJVy92VlRMYkV2Mmp6?=
 =?utf-8?B?NnB4MUliRzdWQUNJOG9uR2tSSlpmU1BCWlpwdGtwc2oxZW5nYnRteUMwUndG?=
 =?utf-8?B?T3dlZEVsK1hnd0huaFBWR0srMEtZSnJXVHJXN0pWcktiVXRGeWZhVHIzS2Nt?=
 =?utf-8?B?ajBlSkJCU0RHMmVrZHQxNGdIaExRaUpXVWZLRTl3UEQzV0RTTmJ0MlRsUzdU?=
 =?utf-8?B?cVU1WFZXZFVBaEQ3VGxBSGtST3hSanVUVW5xb1dOVDlocEg2cGtqOFFiVHEr?=
 =?utf-8?B?emFHWkNmUG83UFJoZkFtV01uRytsUEdrM0ROaGNzV2dNZWlCQk9FRVNIUitZ?=
 =?utf-8?B?N1ZFcnhmOTFPZHVKdVJKT2ZIbFJXZE8vUzBlTy9nNWVoQkErZWxlUnFORkx6?=
 =?utf-8?B?d3NLS2h4M2dhOG1oOUNYSEg2cUJxQ2RMd1Npc2FCb0hSNWwxcmVRU2tlM0xF?=
 =?utf-8?B?SnRPRnNLelhrZ2VPMkVQYlJ6aWFpRk13R0N1K3ZzeWRIdFRQc3VtbXh2Ukd5?=
 =?utf-8?B?TUx1YnQzK1Vwb2wyVWc5aTNUdkhKcU1WN3Y4LzlXQndvbnRocC9hdm50Zmtt?=
 =?utf-8?B?YkZkdkN6M1ZoVFFCUEFhTy8xMnFJbms3dWRzVzVnTFg1MkdlMHFoRVB6SGJQ?=
 =?utf-8?B?dU1mVWhSdUY4aU42a1hoVDRlYlBtZWo3S2g5V2ZlUFRmMEk2Y3VEUmNYU1k1?=
 =?utf-8?B?d243MDRSQ3J2eWt0THRiOXgrby9BTGNBYWpyZWJ6S3JhNFlTNEVXWCtyUGRW?=
 =?utf-8?B?ZlhsYndCQ2pZUFEwTk95dTd4bmYzcGFVVlBOWFNGQlAzNmU0WUFzNHVYaUYx?=
 =?utf-8?B?QldoMWMrblNOSEM1NjljWTFIQW9zS3dDOEpmaWNqL01adk1HSzBoelByMU51?=
 =?utf-8?B?dDJ1Y2l2ZmNjUTJWaFl1elRhWGxXM0lXWkFXSzZpbzNYcnIvR0ZWOE9lRmFp?=
 =?utf-8?B?Q01MMEFnNWhkTzZMY2I0L1I1enZzNDAwWmo3cnBwcUcvSzJOMFkyajRoYVg3?=
 =?utf-8?B?S0w1eFpsRXo1TzZTUkdLMTh6UG4xMjBCWDBYcHB6S2Z5dzlLSmxHYVdOc1h1?=
 =?utf-8?B?QnVCZjlya1dCVlpwSXYzMXExQlNIZkpjRG9ZNUV0cklScHdNMStjUVozY0V3?=
 =?utf-8?B?M24rNGh5cStRSjUvT3ZMSkpqMDR5T2RJUFY3WUZ5TmtZZkRhdkpoc2RBWjF0?=
 =?utf-8?B?dUdjUGpWN3pvVmwyK1JhKzY1T2xnSnJ0YVB4QTg4VVdVYlV5US9EcWFOK1Zr?=
 =?utf-8?B?Zm8vUHNtcnRpVitUOW1kVmZZNS95VVd6OGJLWWtvbmcrMU1OS2RsWDhlWWJN?=
 =?utf-8?B?eVVyRGx4RGVicUhBT0pIditGM2pBNnF3MU9tcnRmVWM2OCt4ZEptWC9PVFo0?=
 =?utf-8?B?SWFhWE01RlNseUl5K2l4REN3anpPanRMbGpHWS91QjlFRWdCWjRvaEQ5eHhr?=
 =?utf-8?B?Z255aHBjcE9OZ2dUTEZJcXh3SkZpeUpRWTBsaXNzWm9pdDQ3RURpVkJzQ3M3?=
 =?utf-8?B?Q2NJMWJhUEVWK0xBVDdndVdXdXRoVHVVQndTbmFMZitIR0dySUZJN0hjSHJt?=
 =?utf-8?Q?iFaQvVVacTBvyhsSRzQ89a0kd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1022571c-35c6-41de-8533-08dbd5f6152e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 07:35:09.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLHWP2UX2bv+DOEyKqEUFmuRkJQ4QObfEO4r09RYorPwkEMJisJxGZzWL/olt8JRYeHcJ842pYfGEU0ZlfuiSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6951

On 26.10.2023 08:45, Xenia Ragiadakou wrote:
> Given that start < kernel_end and end > kernel_start, the logic that
> determines the best placement for dom0 initrd and metadata, does not
> take into account the two cases below:
> (1) start > kernel_start && end > kernel_end
> (2) start < kernel_start && end < kernel_end
> 
> In case (1), the evaluation will result in end = kernel_start
> i.e. end < start, and will load initrd in the middle of the kernel.
> In case (2), the evaluation will result in start = kernel_end
> i.e. end < start, and will load initrd at kernel_end, that is out
> of the memory region under evaluation.

I agree there is a problem if the kernel range overlaps but is not fully
contained in the E820 range under inspection. I'd like to ask though
under what conditions that can happen, as it seems suspicious for the
kernel range to span multiple E820 ranges.

> This patch rephrases the if condition to include the above two cases
> without affecting the behaviour for the case where
> start < kernel_start && end > kernel_end
> 
> Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> ---
>  xen/arch/x86/hvm/dom0_build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index c7d47d0d4c..5fc2c12f3a 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>          if ( end <= kernel_start || start >= kernel_end )
>              ; /* No overlap, nothing to do. */
>          /* Deal with the kernel already being loaded in the region. */
> -        else if ( kernel_start - start > end - kernel_end )
> +        else if ( kernel_start + kernel_end > start + end )

What meaning has the sum of the start and end of either range? I can't
figure how comparing those two values will be generally correct / useful.
If the partial-overlap case needs handling in the first place, I think
new conditionals need adding (and the existing one needs constraining to
"kernel range fully contained") to use
- as before, the larger of the non-overlapping ranges at start and end
  if the kernel range is fully contained,
- the tail of the range when the overlap is at the start,
- the head of the range when the overlap is at the end.

That said, in the "kernel range fully contained" case it may want
considering to use the tail range if it is large enough, rather than
the larger of the two ranges. In fact when switching to that model, we
ought to be able to get away with one less conditional, as then the
"kernel range fully contained" case doesn't need treating specially.

Jan

