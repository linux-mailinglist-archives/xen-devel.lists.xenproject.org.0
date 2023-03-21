Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB676C32EE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 14:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512630.792661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pec5n-0005Et-7V; Tue, 21 Mar 2023 13:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512630.792661; Tue, 21 Mar 2023 13:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pec5n-0005C7-3v; Tue, 21 Mar 2023 13:31:59 +0000
Received: by outflank-mailman (input) for mailman id 512630;
 Tue, 21 Mar 2023 13:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pec5l-0005C1-9E
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 13:31:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be7082a6-c7ec-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 14:31:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8288.eurprd04.prod.outlook.com (2603:10a6:102:1bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 13:31:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 13:31:51 +0000
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
X-Inumbo-ID: be7082a6-c7ec-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLxFnQSpeoXLRL0apQyheaYfGctP8184I2GKQXTdb38bOh8KWm3tbLVNT6TgDtuTTmEaiYXsQDWjx0M+/hgsJXy+sRwqJm1PxhoGeV8KWj7NSC/ZhXR2UbzNc6UEnxyCHthQZ7eAjPmhEPV09q4+xKUPxt6NMQd5R4MTlJDqGBlL8z2lAO1eBm+gXgA9DsWt0f9W6TmeqI4W2eLWcItzqRNT1gaKoD1DvHQTQy5eAtyGGE2Uc7YF5AST9KQFZn8Dg+qxS+wQLDsOwwi/OWPKMnjxh5ZZ+sIHLdBxMG3hUWmyiYdtltXugL9XiKMUb/d0WOJKvZEXO9idalYx+mXW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYlXL0vljiEbWbR7SY1Gkw0Ha7VVch68JKUN/LVLS9M=;
 b=V1iQ5OVh037uQz75tUP8CmOOXdZCoKT7S+/h2hj84XmmLxehFbOm22Faz9cJZFPlpOyDJOyHwEFoBkqCQ9nN1UQ+lPlCif7KTPVkNnPZ6Sk+LEmqpKNqfeYwlHlwA9HRhZ99pGzQrNVHF6lvpNQSEqP6PHA+kj//k/MfidYhlvzeem4sVAzoF83qVULDatBbQS1eeoRkexYGblTqIKEdtKN4IDhIiDROgEon0Da+lwM7od4JzPFU8hGbUFHZHgAB89G+eZQ/CGPprzzF7vk1yYnlWZue3rzdv989scsX4WGEWzCYIFj5HpfzMd6CUl5XxK+Y21edpM+n3lqQikObQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYlXL0vljiEbWbR7SY1Gkw0Ha7VVch68JKUN/LVLS9M=;
 b=4CwApFFk3T5zOF+rzYIn+WfoZbbdLGCdWmBzTfxbfi/2BMvJIcqf6oPxyRSS5FPZDKE9yatgb3w+97mN5iMFrZKMMdEDku6o0pyFWgwwRCG5zyYFLQ3YDMxTkE7S6tQGbqDcp/YlcVSsdeYJLg883wh6xWATqp8uDUes0AXnSAI7kw//DEbzS61flkXZ7oX5Qk2IMWRXC/C62hstTVWbRsGGt2lut23bluRUB90c4Uaq4xkQ8Cr+Tl18rXYDqw0ITZvV4+Cl71WOzTd3kVLy7KCjLOW4pn8kjhRlvfLRj9j4/Ml3F6Ritkr0oTTnQq2EtHKgEDzH2qJLdnd/EYC8ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f265a82-85aa-b2db-c2fb-182095446316@suse.com>
Date: Tue, 21 Mar 2023 14:31:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] x86/platform: introduce XENPF_get_ucode_version
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230321114745.11044-1-sergey.dyasli@citrix.com>
 <20230321114745.11044-3-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230321114745.11044-3-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dd17e9-1b4d-4a6b-2468-08db2a10a0c4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fzRug64DGFa7tLIYzFDUJ19hj+dCoGGZ1FqBwfkytX8jDAzRF0nedsG+MnpyYZFVd0RPcedZnSMv2CvO/oCpn+hTLAX1C64yjd8qEky2RybFCs+B9hWECvjOBwPQlSrWhMykAs8YsiO1x4JvIFuFih1tARPfV85CM32UIfINNv+Ew+ObtId3BEqpQ9r0FIVDOKW2whtQhLbOYa1970fnMD/wWh0oe+kVllRWnTg+V968wIH7UOcjvHrYbQ00GIMXr4vZJocP9zCP/jT65lNMWIiS1GjvHhnfTS3fGlRCvm1zEAfb9vq/plq+z5gvMgtPahaEQOrCg07Cdl1LqlI7xyTtga1UWQnwEPJi0nDembTtiIPiR3/KKooLDlzw4p9tFcz0hNAyrbWmN6r77j2+tVkFRTYKWgGybUm7Z5EQX6+sEMfqtklRblm2goEdLdHdVp2IuS+QCJp97ig+VFez9Ee43eruVZ/ZF9qyoZDYKhL92AjOeH1h3lc0ZkhTyBzGsoa9VoTFVec56aoBGNKVm3X3cpmfdPbaU/CzbgGyn8DdO8zCaS38NITuuFV63g0JKtZywbkScqNsmBASjErEhIsJL+VhJigvjd5b8TQ+1YRzqzf3LkYkqv1v90+hSi+segd2UojJZ161Z9ADjG7JAr+Q+v4wYEm/i4hfD1qtP3W2vPxGGZHIer/dgivxSR2tklfKJKgWrWUn2Vh9Cejkf+6oYXhbfb97fDNO1dvxnm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199018)(2616005)(186003)(6486002)(4326008)(478600001)(83380400001)(53546011)(66476007)(316002)(6916009)(8676002)(66946007)(66556008)(31686004)(6512007)(6506007)(26005)(54906003)(41300700001)(8936002)(5660300002)(38100700002)(2906002)(86362001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3JPVXRWOUs0VUh3WXQ1Y2NPdk1hazBtUWsrQ1lPbS9zelpXcE1wQkEwa1Q3?=
 =?utf-8?B?STc3MXl1S1hBcTNRRWlPd1JSdUhuWEJlNWlFS1UvSVVmbTdQZTRVenNReFAz?=
 =?utf-8?B?d0dqU2hnK1orbDM3Uk05cWF4MDBFbjVYaEYrMFFRU3IvaWVzVFBuZlFvSTVW?=
 =?utf-8?B?Y1A4SVA3OG9SYU9uR2x0MVJLd0lnYXZEdU9IWWp2MFJzeXNEYkdkamgxTm4z?=
 =?utf-8?B?YWJYYjVOenQ2YTlhTjNJbk8xUW5rSHJRcE82RklqZ0hFMWozbjhBUGpmdFZw?=
 =?utf-8?B?OFVlMTJ0RWZLQ3ZoNkU1YW5BbFN5WDhtaTd5cHN1ZFMyTmwrbnJLdnRtWWc1?=
 =?utf-8?B?LzJENXdVcktZWm52dE5mcWZZRUZwNU1MdjcveThYQTlaWVlNWTF3ZkNCTFZs?=
 =?utf-8?B?eDhoSHdXUmxVWFpmYkdzRHR5ci96ME1NWXphUmozNWtYZXE5VEx2cWFueW5B?=
 =?utf-8?B?ZnNYV0Q1cDRyRjZETUhuRnJzalBKemp5TWNGM2xPZDViVHZ0eHV2MG84UlN3?=
 =?utf-8?B?L0s4bVgwWmtjU09OamthVVhyczJxcG5xQTU5bkxtdXR1YUNKOGdMUVRmSy83?=
 =?utf-8?B?WmRQNUtHaGM4Q3BTOGFpVWlYMk9qNXJhMkxLY0pzNTB2RzZWWW1HTVVDdkR3?=
 =?utf-8?B?S3liRG82Y1VRRDZCN0FTc1M3SlAwRVRESjBNQlZtdFZHVjRGejN1NTJpdmt3?=
 =?utf-8?B?NFBmd0FmYkJIVlNrR0FGaVArOEhaSGxab0d0TlZ2NFNncCtrc2ZsQ1BRNGIx?=
 =?utf-8?B?VTVxRmpiZDBYdVBERXhiNDBmR3Q2K3I4Z1pkN1VPVkNySXV6VUFNOXNTZ3ZP?=
 =?utf-8?B?OE1ZQW1adk5tZk9Bc1pUemVaNW5LY0g3U0lqSi9qaDl6VE5BckUzcmhhRlpO?=
 =?utf-8?B?aktaNlJQYklVVDNIazkxWm9rUWtEdkMvZW96bHZ0M2tBMXhxU1dLWGdhLzlC?=
 =?utf-8?B?aTREUzg4VHcxbkZWS0pzYTVCRnE0N0FnWk5aeDIxR0NRZ2ZEb0ZXbVM2Mjls?=
 =?utf-8?B?M0drN2FlVmhINVkvM055ZXNlMWhabVAyaHJIaTRkQjgreUhFbXRFdEkxM2Nw?=
 =?utf-8?B?N1VwbHozOVdVTFYrOVlUL2FXMzcrUEFqSFpoK0pCRW9wWCtSOXV0aDZCenlC?=
 =?utf-8?B?SnN6MUhNbXdCdGF6TGZEamFSR0Vxb1RMZFovREk0NUo2Sm1lZkk1NGMvcjEv?=
 =?utf-8?B?WVI4cm9VL0F6VjlIb0JYM3hwMU1RN0pOcU5QeGdXdDV2K3ZxQVAzVWhuRk1o?=
 =?utf-8?B?ZFdDWU9hbDFmL3dKdGFjdi9wOE9HQTJGMERDdVNXeUhsbjZoSSs2ZVlieTVv?=
 =?utf-8?B?dG1VV3FvRmdkejMvYTVRQncxcjBJb0xsSlR6VlgzSGlUdFI2QzRHcktZOGNZ?=
 =?utf-8?B?L2x1WXlzR1RjcEl2WSt0UDYxS0pCTmZUWFhkZlI2eGNBK1ROT3FPZU4xbDE2?=
 =?utf-8?B?Ky9TcTVnZjU2UlRpZ0g5ODREUlprc1c2eTE2YXJZQWZRcS93bnZTWFgrK1ds?=
 =?utf-8?B?cEo0L254S0VBYjR6NjQ3L0wrd3M4WGU3UEw3ZStCVHNpLzMxSmV5eFFPcS9I?=
 =?utf-8?B?RFlMOGNvTUV1Q1lJU3JKL0ZtZWNOU2VITGdtK3dpbWVFNzV1TFN1cDF0bWtL?=
 =?utf-8?B?Z3Rjdm9ZUW5BWjk3ZHRFdWRacnRZL0MxZTM1bzVManhkUXpvRDVXaTZDVW9X?=
 =?utf-8?B?RU1wL1ZsY2ZUZUVaVFNzM3hiTkRSVTBOMWFFTmRCK1A3ZTFUTjR2NlRmUFpX?=
 =?utf-8?B?VXcxa2tJVlZJUCttNEE4Q05jb2ZKdUQ2QTJGajY5VGkza0pGVmkzSHVqMkRw?=
 =?utf-8?B?Mm9JZVRidWdxZ1VuMmdWM2orckxZaktwN2dwUDhSY3dIVUt1Nk1aSHhvRGFZ?=
 =?utf-8?B?Y09nZFhkU0tUTmpueElRanZTQmVLRVBoOVNvZzhYZ0h4Ym5lQWxSTTRqbDFP?=
 =?utf-8?B?dkFPQ0ZXOWRoVHpWenB5SGFSYXlEUGJyaVRiQ0RpdEtBakUySzIyRDZlYllw?=
 =?utf-8?B?c3BBSE1mbFlkZC9JSmk2ZEVpTU02Z0lKTTVTdWg3VXBLUCtvdVRBZXprNUhN?=
 =?utf-8?B?d1EyYzJxMEVyY1NpR3RvKzBFM2dYVHlrU3V2NmUyV1RYRnA0eVRWUzNVdnNM?=
 =?utf-8?Q?0K83AUAojJ75fqXbtnbdROoL5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dd17e9-1b4d-4a6b-2468-08db2a10a0c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 13:31:50.9984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5h3wIyrZUiHZulT3+Jt2vYh0l6K1080Lk46Ht1DHHM25N362LZv6ceAwxTQ2J4tmG09kdSrcBgeyc8Z/XrkUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8288

On 21.03.2023 12:47, Sergey Dyasli wrote:
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -640,6 +640,36 @@ ret_t do_platform_op(
>      }
>      break;
>  
> +    case XENPF_get_ucode_version:
> +    {
> +        struct xenpf_ucode_version *ver = &op->u.ucode_version;
> +
> +        if ( !get_cpu_maps() )
> +        {
> +            ret = -EBUSY;
> +            break;
> +        }
> +
> +        if ( (ver->xen_cpuid >= nr_cpu_ids) || !cpu_online(ver->xen_cpuid) )
> +        {
> +            ret = -ENOENT;
> +        }

Nit: Unnecessary braces.

> +        else
> +        {
> +            const struct cpu_signature *sig = &per_cpu(cpu_sig, ver->xen_cpuid);
> +
> +            ver->cpu_signature = sig->sig;
> +            ver->pf = sig->pf;
> +            ver->ucode_revision = sig->rev;
> +        }

While I don't mean to insist on making this work right in this patch, I'd
like to re-raise my earlier comment regarding it also being of possible
interest to know ucode revisions for parked CPUs (they are, after all, an
active entity in the system). Parked CPUs have their per-CPU data retained,
so getting at that data shouldn't be overly difficult (the main aspect
being to tell parked from fully offline CPUs).

Jan

