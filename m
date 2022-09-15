Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BB45B9BCD
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 15:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407380.649880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYosG-00006m-Jc; Thu, 15 Sep 2022 13:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407380.649880; Thu, 15 Sep 2022 13:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYosG-0008VM-Ge; Thu, 15 Sep 2022 13:25:48 +0000
Received: by outflank-mailman (input) for mailman id 407380;
 Thu, 15 Sep 2022 13:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYosF-0008VG-Bq
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 13:25:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7deae78-34f9-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 15:25:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 13:25:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 13:25:43 +0000
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
X-Inumbo-ID: e7deae78-34f9-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UA9lbMFAxiujxIwz+uIFC2wehApq6wpbUaHtMLLb9PTbYid9jgk2/UUSK86/3/jCnb61VrLyzu/4WiHDnL1OGHOheXLOoTF0DyCBPojLSFDaw0uLjbUzZi4s9HO3bfBRcLBofxOzEdUw4/mcS8kjtG2P8RZNMi9yyI1aobpfstQRzT6m5ojfC7Z3c7EeXzIhi5TNuxNzAaubazxxgVpCqjfmqPi6Wu4v84ZFOtrdYmM5Z/khXbrZKeYhn5m2HXhvWGt9A1bonTA+i1TfNN7AqpCGcX+LKmMyB9IZvYE1fWJLsw/q2m0hO6YSbBxgdE5FP4vnUjASVbkPu+S3FIl6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4Z3F4o351xCf3aEuqf4PpLzBJ1/7waz0/pFnhv+1U4=;
 b=VUhVYZ0qacMlE3VYUsl8KUwp069paXAYusKC8QPlHO5Fg7FcwRVWzAv90z9g1JcdLKByNrgIBZT1r12Fa/AJatYE56h2Ld2tUhX60cOxzGPvTOmL5SU/XNGKGBiGAvuTM6no+/RmYR5xmtTgRuxPH8QBcqqRgCAecymtoBQuj0Qn0oJR3fYC+l7SOwbOgSj0JfiQvcunrzV68wdafwFNEfhV15nj2VJlYmvIFnwjlkrcmcXoLL5frmgiB6JaZ1Wrawhu5eO9HKWi3UsIC9aBnSBP6mQvGpyPG8+20wWf2lNzlrYogxrE/swrPzVwfQa/ZqeqC63qqjFRAk0Zk9bCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4Z3F4o351xCf3aEuqf4PpLzBJ1/7waz0/pFnhv+1U4=;
 b=0bMjS6SKypgrOfumXz/IYu+oIg19M9+4Ge1YEo8y7n+yK82zH8sesvVLfjtBwzuk+vmYN1Ii0trrdCExCzuodZQDSuuhrCz1u325eAd2GdnapD4WQ3wMVfnLvAdpTIpcKdB/orpNXJx9poAktJ4EDkXIoMjCEHkNJOzgndLhycmbXDg1x9ZBGcJLN7cn7CvfHx9C8hf0xQV+DoxEGkE9/qJeIPf2Aeynu7GWKO+dXWhgvn385TF61SG5rG1tEmU1xzkFpmOM7ZxKTu11q6woWavl37x9URU06FXMxVLO3tZtSGeTvGzD5BYgjFFQWA4qNgnMEJPSnNiYokzgB9wKiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93471d92-bc61-56fd-5b52-413303d35da1@suse.com>
Date: Thu, 15 Sep 2022 15:25:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 12/12] xen/arm: add cache coloring support for Xen
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-13-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220826125111.152261-13-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cca7db9-36f8-40ae-8c99-08da971dca52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NNvwP/C64jTngpjWb45hyfiCEtgm2JmmmlmvwVYt84OvRw+haXEGnFBhYhw6GR7+8ieAo+RNZK3A7uiYfa5qWbfn3CGEax0OWFnyEG9I8Yj1667nes+oUP2EJYB1HQcnl4VJSmZFQbNoCDKXx3PZwFOUJ19P0XaGFb49EqAo21q47EE9GGII2h5F4dDl7Ih3VWBnhGjwjrTWtq6YvIqpgQJ5hcaN1KXGaFkz4nWdKyCOy4DtaLl/853N3R9SFffVOp9wpCKNARgW6WgikH3ngEfzGDTDX1jPIfOsBcESebA5ix5SYRURJaj+Ds3LhVhTmJxxPRmD6LoAi7pwEZB2aNhcI/KmTiTR3T0y7yvQbYXHdtfN24WfGaqkqT0M9fY8T+uCsy4VdN3rdsVhkK7gT5VhQvlfB4InCiv283STJ0O0KXAVlwn/T69PGSLNUSyFF9uwINPW2/+r9Y9QjjJZUhj+6xAVALHBZiD/ClT7xSIpLDtXbGSAtDEANp6SJjbP+E8oSXxKPBOgLV11hVpHD+Z0Ad1rZa5/zkGrP2ltWMR65fG1D8q8H1qNgpCmOAmiWBPVoI45r+TXYzCbPVo9LivCAdNZBpW6A+ZyvNT/mpg+vattp6fYObwlvGOY43ioK24CA4IIgo3yAedmjwo3jywMq6INiclVw+p1tLZ2qk6srxK0K1mG7FbzVAcB/He6CryozqYnQZTuvILmm/eLY1bU3DQgJV4WKr8R2Czt5IcQpUcuDaWLiEMxesA3DDAO5EYjLMUZDgoXlJhuLHk3xWOyZ38BasXkiA8mb5Tmypc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(31696002)(86362001)(38100700002)(8676002)(66556008)(66946007)(4326008)(66476007)(6916009)(316002)(8936002)(7416002)(2906002)(5660300002)(478600001)(186003)(2616005)(83380400001)(6486002)(53546011)(6506007)(26005)(6512007)(41300700001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yzc1WFI4Y2VzYjN0S0JSUHBqK3c1cUFOWFVtT0UvUjA2di9sdWloSHErbmxn?=
 =?utf-8?B?QVBpY0FPVG1uRjJsM2l2U1grWll2YkhwMzc1M2U2cnBXVE5OTEZjSzRhWFB1?=
 =?utf-8?B?K0psaVB6aW9GckVDU08wejFTdEprNFl5VkNwMVNpMDExUkp4MC82bHYwZjY2?=
 =?utf-8?B?TDk0S2RXNDZLcWNCU3NqYlM4SFE5M0puSWFodXo3R2VZazgyTUpONjhZV1Zk?=
 =?utf-8?B?WlVpc055OHRzV1RtVGFNbGZhLzZyYzVFL0MwMzFSQ1J6VnB5cUlGV3lBSWNl?=
 =?utf-8?B?R2ZvRjdwN2tRRHVLNURpWjNSZnJRWkxKTDlaY1p5RllnNGxhQW5sL0hwQVVI?=
 =?utf-8?B?MnlpeVRldEFzTElHc3pJRW1xd00wV0NHcHpBSEhZOTVtdVRnZ2FsL1MvMU9K?=
 =?utf-8?B?SVo4VmxLamk4alpjVnlGTldWMmtBVE5DNHlmWjRTWFJqaTBPUkg2UXh2T1lo?=
 =?utf-8?B?UU56SFhEQnJoTjdxS01ndWp2SFp2YWJxWllwRmJtMFJ2Qy9sNHlkKzBvc2VG?=
 =?utf-8?B?cituSHJ3SE94bTRoU2hna2RSMll3dHpGRnR3ZkJPL2U2U0NvdHl4OVV4RFhC?=
 =?utf-8?B?VkFWT1pOMlpvNWEramZtVHdiMjRpZWdIb0VoTDhwL1RpcG55SGJpUFdLVkNp?=
 =?utf-8?B?N3RqVUV3eG5vWVQ4bkdZTTBrczAwcnJwUTYvYzMwVVloblp4eEhpZE9ROHND?=
 =?utf-8?B?NHIwMVBBME1rWVNTNkRLL1crOHJNM09GWVNiZ2cxdTZIMWpoU3RweEtUU0h5?=
 =?utf-8?B?dFFicUduSmlIdnk2L0Nja05hQ1BtRGZ3ZjNLRzF0YlUxbzAreEFWaXpNTVhr?=
 =?utf-8?B?aElaVWlxY3IyQlE0ejh2cWdaSmVTdU9nVzFnZEljYmZ0VDdNS0VQSzliRUIw?=
 =?utf-8?B?dnhSeVVmSG1Va2p3UG5JLzhXWVZpVjJrTWlYQ3ZKOHBLSlVrM0xsbXFjalFt?=
 =?utf-8?B?WkFCL2dZblgyb2F0M2lEZnh1UEFFb1NCUEFkWk1qKzNFdFNXcTIycEZjb2Qy?=
 =?utf-8?B?dU9KOWlhWm54aytvTExUeEczdzIrVHA5aThKMmRhb2tXeFhFQWVGWW5NcWV6?=
 =?utf-8?B?QzY2SWVlVk9lUzQyN1RiS2NjYVhKdFRrbHl3YjRHb0cvK1pXdG9xRG04NEJ5?=
 =?utf-8?B?cnUwL2lpZm1wZGJIbERieUdTeFpGVzJPa1g2VGI2U2FIWEYvREpKR3ErK3hJ?=
 =?utf-8?B?a3pySUQ0cnk5U1JlQWI2djlEVlFpUTV6Z2R3aEZ1SEpSNjMzOWgwR1ZFWXVW?=
 =?utf-8?B?T1gzTVo2akh2b3BUcEtmSjhFZWFROGx5dXplSHNvc3YyYzdGUWVTanFBKzdz?=
 =?utf-8?B?bE1zT2hxaWFrN2dkZmZlSkNmNFV6aVdvZjJzb3d1OHA0TGZpdUR1NjhNRWxw?=
 =?utf-8?B?ZjE3bGJUQmp1UGRGZjJLekg0THlsZ1VyUWRNZDRGYzdpZ0VTNEVUakJNZTcz?=
 =?utf-8?B?N1BQbXBoSklidGFLLzN2amFzMmQyOThjem9SM2N2dVRzQUxHVXcxVnpqTTZ5?=
 =?utf-8?B?SzlzVWFQUko0dVBudWJYR1cxQjBySmkwK0Q5b3R6QWFWWHFCb0wwYzB3WnU3?=
 =?utf-8?B?WUlaNnFxOW5ZOTZzK2NOQ1gvekhnMlFJQzIwV2RuVGxUWmtINDd4cW5WZmhJ?=
 =?utf-8?B?a3h4aU9TUmRoajFVZ0xVM3lxSjRRUWRLa2l5bWxnSEhZYzdtcjRqRjIvWU42?=
 =?utf-8?B?dHlOT2ZJNTErbWRQRnVTWWdOMUd1Y0VkS21MYTRqNnFTcVgrTmVleHV1R2xH?=
 =?utf-8?B?MklYM2ZCMGgvSHBnWk9obWJZK3oyQTdOdDJkaVAzL3U0YWh4T0JRK2R6OUEy?=
 =?utf-8?B?Nzl6VUMvUFI5dVdDRTJEWURXQVBEU0pmcVZYcnRQOGlpcTJHNkRXd0l6YWZr?=
 =?utf-8?B?VVJ4L3JlT0hHUHpyLzN0R0hmRndzSGVpRkg0b21iYjBqdEhGYmZJNjJqcFp0?=
 =?utf-8?B?ZE1vOFNZWjBNcStjZ1d5MTd0eFJnUkZsL0FYTzlKZFp2M2VNME5qODRWM2NM?=
 =?utf-8?B?RndPeU9PZi9WeER3RFhVU21wRFg4VDkyTUFvak44dk13S2Q3TURrajB6QkRH?=
 =?utf-8?B?RC9PUlNRcTJFN09kajZQN3FKclB2NVZNL212WVdNT0QvdEVBWk8wbnNBTlVW?=
 =?utf-8?Q?pEFv+HfyTWdlgSq4Hd9KWiEGs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cca7db9-36f8-40ae-8c99-08da971dca52
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 13:25:43.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeE6tybWU5/UKFKGOCcohHMUBX/OrFaGuX/uGYWdzzG5ZSYj/nH9kwT4XPSFlt9UqOJ2ykpKSTwLEMYrIJmcSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690

On 26.08.2022 14:51, Carlo Nonato wrote:
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -8,6 +8,9 @@
>  #include <xen/types.h>
>  #include <xen/vmap.h>
>  #include <asm/page.h>
> +#ifdef CONFIG_CACHE_COLORING
> +#include <asm/coloring.h>
> +#endif

Even independent of my earlier question towards more code becoming common,
I think there will want to be a xen/coloring.h which takes care of this
abstraction, requiring such #ifdef in just a single place.

> @@ -218,6 +221,28 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
>      return va;
>  }
>  
> +#ifdef CONFIG_CACHE_COLORING
> +void * __vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
> +                      unsigned int flags, enum vmap_region type)

Please no new functions with double underscores as prefix. Only static
symbol names may start with an underscore, and then also only with a
single one.

> +{
> +    void *va = vm_alloc(nr, align, type);
> +    unsigned long cur = (unsigned long)va;
> +    paddr_t pa = mfn_to_maddr(*mfn);
> +
> +    for ( ; va && nr-- ; cur += PAGE_SIZE )
> +    {
> +        pa = next_xen_colored(pa);

This may alter the address, yet the caller expects that the original
address be mapped. I must be missing something?

> +        if ( map_pages_to_xen(cur, maddr_to_mfn(pa), 1, flags) )
> +        {
> +            vunmap(va);
> +            return NULL;
> +        }
> +        pa += PAGE_SIZE;
> +    }
> +    return va;
> +}

Afaics you only consume the first slot of *mfn. What about the other
(nr - 1) ones? And compared to __vmap() there's no "granularity"
parameter, which is what controls the mapping of multiple contiguous
pages.

> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -14,6 +14,10 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
>  
>  void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
>               unsigned int align, unsigned int flags, enum vmap_region);
> +#ifdef CONFIG_CACHE_COLORING
> +void *__vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
> +                     unsigned int flags, enum vmap_region);
> +#endif

I don't think such a declaration really needs putting inside #ifdef.

Jan

