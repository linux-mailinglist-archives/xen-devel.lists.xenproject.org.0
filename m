Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175AA4ADA60
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 14:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268356.462179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQrs-0008QH-Tm; Tue, 08 Feb 2022 13:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268356.462179; Tue, 08 Feb 2022 13:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQrs-0008Nu-Qp; Tue, 08 Feb 2022 13:49:16 +0000
Received: by outflank-mailman (input) for mailman id 268356;
 Tue, 08 Feb 2022 13:49:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHQrq-0008No-R0
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 13:49:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c5501a6-88e5-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 14:47:09 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-Ej46-f2ROP2TSZiAi-cp7g-1; Tue, 08 Feb 2022 14:49:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4544.eurprd04.prod.outlook.com (2603:10a6:803:6f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 13:49:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 13:49:10 +0000
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
X-Inumbo-ID: 9c5501a6-88e5-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644328153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0zDDN4nzaJQe8tSrcHGASi0/1j2RHCcWB5fzveZ5EM=;
	b=CMG3TY7CqLCY0TOJXEXKHxAJFJKE/BeKa44+EyDnoZ5Nno/08m9InNhQs4vvEhghhoce41
	eKEZU0TcFHRp3kTTgLvZ5bkXlhV7lKacnGfa3vTsU1FS3HxOqUtSjAU+OvUtgQJ9rVa2HJ
	a8/gXb0tF6GJe9RoX1CZPRs2OHKV7bM=
X-MC-Unique: Ej46-f2ROP2TSZiAi-cp7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvUt8YKoqCIOdamB0M04b3ncShmfpxhps4zPF92XOMG5x3QKJWso6txoG6+ellu9m9eaxDWBF2NFWoxm1/jkv2VwSCxgfCCIkBSaxqJmi49P777dCBXPKgAzMuosrjUbHR+46SxLZ1Po32lywpanrTL8aXtcyOQzhh8smoKIcrUfL90cf8xEt0ZW+xoGNMRbOyWB6Rf/hMks4nZYwI3/wa6pYRZ0BSbwoa4atyhWThhKOE02xeUe4B6Wgi30Qoa4v1pVXsqlLN2ZJ9WUvp3ZKK8uWNIEkYI7qIIKm/GzH8w/SthtfB++1xRw/ooUVFzdUVYSHkLISG+wSuWGq8AfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0zDDN4nzaJQe8tSrcHGASi0/1j2RHCcWB5fzveZ5EM=;
 b=me8Y5jwlmzp8k03QldeMYISU3Jh14cTVqy1mPPnxjsoPQ7Hi9ej23UBg3PTJ1QKuIQ646W4/Q2AjyLu+Z+coZhkC4Ym3Estme7+d6Zg7SHXCKzOdOreOqyRkqri52FflqJi/db3VbvdFrK+tgyGDZHuKyZT8nhQ1wMifgl67SVoVQIpYcnTOFAN/oO0nqGIKAYy0cIPmeOedqf4NY5dpaKD6pY+h5Z0LQjt2gen6FOTlT2rJzoWelWRDGWmlmJgJZTHb/ioYTXKGDb4VmRiAS3C0vXICESWRgq17qJOu+2NCc4z292Sy9tlPo5Em3kCulfvEHgkyByl9OsXojDKbFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f234c5ea-6188-922d-6754-36e4aeb52cff@suse.com>
Date: Tue, 8 Feb 2022 14:49:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] x86/time: further improve TSC / CPU freq
 calibration accuracy
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
 <2e97dd91-5e43-3312-2e47-534f425c28c4@suse.com>
In-Reply-To: <2e97dd91-5e43-3312-2e47-534f425c28c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7db90f1f-f9f7-49c3-719f-08d9eb09c8b1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4544:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB45449B1986CF4EC26BB4E14CB32D9@VI1PR04MB4544.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8GaGvVXt9TeVLDdWDtuPvxIlTuQC5SQu5FnV4J33ALZMDXfC+PWHQ3jTNUAjHnWx3yS+DD4AccozA0WJEtrOkX+HtaRdUBIFgtSy3CFYkw8glR4GLguukTAc2u3TP+kukUAdTWs0E3616shWyF9keDvAtifYcn7NMxO0VcCoPzepbeJ/aZEFSoJfXI3hqnRXG/4EOCUDtGjBVzQ8lDjCjV1mZE3wYoaxLt6du1Tj4BqZLYVmyURW3PJaWUpHzoWa9GIckZ+QhWGGERXPFt6U518txe6rJtLd3UaqvZRxmdFnF0+3ksyvMmpAyWK7L6o4DrEstxhxhSvSsW33VPF4ePGnJZYiq/eWoeGryC5hVsUV9FTMsRK8ARY0QImpz3kZnX1tJslvxp/cboMnsV5bYwcTXzJjPCg+85ttoNX4HubY8gNSIDErcED+hC8ejwE+paoFsJGK0qX+TxtjlNbSfkG+h1IYlTTI3w7Wm7gyaCaKXF6z5Kl93Xeh9tWqwwKRkzNgm67YexXYsIpxnmdRRpUWl7XA/WXKMK1xVQCi8Qccf3Ht3Yl8DXJBaDjRf66xj5SgO6tZh1XXFMzzdUuvzoifNurj5+PIdLlvsaAm8Uua+jBlpgRe0AkKfQs0rozMulkcKEly7+iRYIV2cFsRhJ3cjXMxXY9HrbJ3HEe1LUtRlATxXVdGhND6wyX8+gjLCjQePbT/ty1lZUjkzhl4eeFEDRW77IK9IK+6+vEPqiIptqDr4mpDqbGKd4jS387p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(4326008)(83380400001)(38100700002)(5660300002)(2616005)(6506007)(53546011)(6512007)(66946007)(36756003)(8936002)(54906003)(2906002)(26005)(186003)(8676002)(31686004)(6486002)(508600001)(6916009)(31696002)(86362001)(316002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVV2ck1DeklnMXRTZTBWL2UzbEZDZGFZQWVSMkZnV01oMU1qTWluSU85Nmxz?=
 =?utf-8?B?N1FtU2ZsVWcyMkI1aUlJVUs1MDVaRFg2ZUFVd05lcmYrRVhYN25RaUhnZ1NN?=
 =?utf-8?B?QWk2UnNKWGg4RXNTTjhxZmFLMytPc28wdy9tUTI5a09BVEhJT1RvTFhBYllK?=
 =?utf-8?B?am51ZE5JZVIvcURUbTVGQm5xMEFhV0svZXpWVXhSS1llRnlhOG9teXR0eE14?=
 =?utf-8?B?dmVVeC9tWGZSbWxkNUJRKzFXditqcGRLdXNLUFJWMU9OSlpvZHVVNlVuT1Zn?=
 =?utf-8?B?R3M5d3RZTmN5V0t6ZGtueldTckNWVTc3MnJ1bXJ2cFhIajVTTHpOZFVSWkh2?=
 =?utf-8?B?YzdBdCt1SG5OOUtZci96YXp0ZnJ4WExTVmJxenYwRDFxRWxpY25aRGZPUDhR?=
 =?utf-8?B?cmU0bnRMZWY0M2F0Q2RxRGdTZzRGZktIaE1MMlBTWkk5T0x0aWdtVHdrMWIr?=
 =?utf-8?B?c2tjTDY0dFN6SWhKNm1BaTJGWFNraE04YnpzckRMVDJMU0JDOFVVczdxdUdV?=
 =?utf-8?B?VSs2c1Y4cGhvcDYxVnpUOGhOSTVyRFZUaHRwVnEzUmoxSEIxNzFuUXVURVVT?=
 =?utf-8?B?U09nb0ZycDYzYWlGYVdzclhuWW1GbmVoSUlJM3hDcVZqcnpkR0VkSHdFbWNT?=
 =?utf-8?B?MkdpbFRSdTdpc0YxaDIvSzBHL1ZFZS9MenRLTDIzUzJ3UGxHdDdObGJKeWw4?=
 =?utf-8?B?MkFZRHJuY3J1NlpCQzhNUDMwK200RktFTDV1MTRlRFdlUTRYVnVYZy9FRVhs?=
 =?utf-8?B?eTliUzROL3ppTVlMS3NhaFJ4dEMya3RxY2ZBbEg2Ym5kWnA4REpvKzNVdzhU?=
 =?utf-8?B?emFBUWFEZ0pjZFkwNUdDYkFRWTVDbGZGTldBdFRyS2x2eDd6Q2VsN3ZGcnNx?=
 =?utf-8?B?ZmpxWHYzbEtZbzF5TDdGcEJXSDZINE9raE9ybkFUVTZxSmZPbVJYbzBSK0x6?=
 =?utf-8?B?SGZNWmtrd1lxeERWdmtPczdxYjAxaE5Sa3lXRUVIUWs1ck1rM2dYbGFscFNE?=
 =?utf-8?B?KzNiVFhoeVhMT3NDb3Y4eVVib3BpbDdzRm9ySVZGN0dQVFdjQlJKMTErTDd1?=
 =?utf-8?B?K0tyaXEydjBVYnhmSWovM2ZXeW1ZQVVReVVGdDMxb3ErajZYZ2Q2RGJQSmtt?=
 =?utf-8?B?RW5jVzU0UVQxMlpKKzF5MFBnU04yTnEyYmsrcFpMaGZOOC9xUnBDSnBBNms1?=
 =?utf-8?B?akphdVYyOFpkUEh3UUVzdHZDV3lzOGp6YTU3Sm5kTDVwNXNtM203ZU1hZHFQ?=
 =?utf-8?B?K21MOTY3ckcyRzhuOER3dXFJVkdLbm1ZWGs0dXdhckFjWElPYnArNTF1NmRq?=
 =?utf-8?B?R1JQTmFHallFRjZJa2RyOXhKUUsyMEJsclhwK0UzaHZMbXR5ZEcvRTV0S3Fn?=
 =?utf-8?B?d3piTHNVOGdJRFJMdmFQcGt1SWxhdFlVWUlrL25TcDB2bW92MDFEaVVmSlE4?=
 =?utf-8?B?aW1yRDN2ZnVOdUtsUGJPMnRsdDh3bEpXQ1psSDJGK1lROHFrdDBPdkNWUkdW?=
 =?utf-8?B?ZzNDRmVINWVwMURsbDRqeStjMGFYenp0T29DL0hSK1Nrc1NEZ1ZDS0cvQVVa?=
 =?utf-8?B?ZHBwUldkK3lxOGpGUE5LQnJJcHhCNUFCbnlUcnVseVZLKzEzS0FrdEk0UjY4?=
 =?utf-8?B?Y2VGeTh3a1BLTk93UFh6SGRoM0JxckFlQVhUTElWdFZXOTFKSWdxKzlsRjhO?=
 =?utf-8?B?V3F5NUpzU2x6KzdaYUVkeWNhRnJ4L0tjSXo3Z1RyUDNVSkZjQm5NWnI0MS9M?=
 =?utf-8?B?aGdvRnJRSlptd3cxZ0UzWHQ3bFRUeVQ1dEpydkpMUmpqY0R4UFdWQUxFcDRa?=
 =?utf-8?B?S3JTa0llNVFYbjRkaTdFMkkvMTV3VHJIaU9HOHdFUy9KZkZUY2I1bDVIMDYv?=
 =?utf-8?B?eWNUcXFRZUlrMDJnbGRCTkoyYzBlSEd0dUY2eDhTUktVUzRWYmwxem9wQnUr?=
 =?utf-8?B?Z0g4UFBwMldPNG5pSSs5WGxCbndpbzU5K0RFR1VEVnRIQXNzNzdYTW96V004?=
 =?utf-8?B?RTBqbEVsMlp5MlNOZDl5NzV6S3lVWENqSzJRTkZ1WlRubWViS1VHR25rcnNL?=
 =?utf-8?B?SVVZZ1NYVXUxZEdDTE9hMnk1eE1DNk5EZVlDWmNWdWc5cGs5L2lJWFlZelZm?=
 =?utf-8?B?NU5sNHFzMVVlV2hJcEFTa0tkNVRQTjNxVStiYnU1SXZCNGozYTR1cWFZWkI4?=
 =?utf-8?Q?i5MF3RUsDYIyEefFvLebc6I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db90f1f-f9f7-49c3-719f-08d9eb09c8b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 13:49:10.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m29JDK0sZky0C8XDif/iRjMO4sgpv+zlTzUjvjBhNRNUTBLmvCeOVoe+mFinvLE0VRBmf5FJ4ucIaFNm8Yl8dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4544

On 24.01.2022 09:25, Jan Beulich wrote:
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -287,9 +287,47 @@ static char *freq_string(u64 freq)
>      return s;
>  }
>  
> -static uint64_t adjust_elapsed(uint64_t elapsed, uint32_t actual,
> -                               uint32_t target)
> +static uint32_t __init read_pt_and_tsc(uint64_t *tsc,
> +                                       const struct platform_timesource *pts)
>  {
> +    uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
> +    uint32_t best = best;
> +    unsigned int i;
> +
> +    for ( i = 0; ; ++i )
> +    {
> +        uint32_t pt = pts->read_counter();
> +        uint64_t tsc_cur = rdtsc_ordered();
> +        uint64_t tsc_delta = tsc_cur - tsc_prev;
> +
> +        if ( tsc_delta < tsc_min )
> +        {
> +            tsc_min = tsc_delta;
> +            *tsc = tsc_cur;
> +            best = pt;
> +        }
> +        else if ( i > 2 )
> +            break;
> +
> +        tsc_prev = tsc_cur;
> +    }
> +
> +    return best;
> +}
> +
> +static uint64_t __init calibrate_tsc(const struct platform_timesource *pts)
> +{
> +    uint64_t start, end, elapsed;
> +    uint32_t count = read_pt_and_tsc(&start, pts);
> +    uint32_t target = CALIBRATE_VALUE(pts->frequency), actual;
> +    uint32_t mask = (uint32_t)~0 >> (32 - pts->counter_bits);
> +
> +    while ( ((pts->read_counter() - count) & mask) < target )
> +        continue;
> +
> +    actual = read_pt_and_tsc(&end, pts) - count;

Having run into a case where the resulting CPU freq was 141 kHz (and
boot failing slightly later because of this), I've spotted that this
also needs masking by "mask", to guard against a 24-bit PM timer
wrapping between the earlier read and this one. The original code ...

> @@ -508,22 +539,12 @@ static u64 read_pmtimer_count(void)
>  
>  static s64 __init init_pmtimer(struct platform_timesource *pts)
>  {
> -    uint64_t start;
> -    uint32_t count, target, mask, elapsed;
> -
>      if ( !pmtmr_ioport || (pmtmr_width != 24 && pmtmr_width != 32) )
>          return 0;
>  
>      pts->counter_bits = pmtmr_width;
> -    mask = 0xffffffff >> (32 - pmtmr_width);
> -
> -    count = inl(pmtmr_ioport);
> -    start = rdtsc_ordered();
> -    target = CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
> -    while ( (elapsed = (inl(pmtmr_ioport) - count) & mask) < target )
> -        continue;

... ended up requiring use of "mask" just once.

Jan

> -    return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
> +    return calibrate_tsc(pts);
>  }
>  
>  static struct platform_timesource __initdata plt_pmtimer =
> 
> 


