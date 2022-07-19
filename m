Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D21579F6C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 15:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370646.602505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDn8J-000181-0J; Tue, 19 Jul 2022 13:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370646.602505; Tue, 19 Jul 2022 13:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDn8I-00014l-TV; Tue, 19 Jul 2022 13:19:26 +0000
Received: by outflank-mailman (input) for mailman id 370646;
 Tue, 19 Jul 2022 13:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDn8H-00014f-Fc
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 13:19:25 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50069.outbound.protection.outlook.com [40.107.5.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 681d7a71-0765-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 15:19:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3522.eurprd04.prod.outlook.com (2603:10a6:208:20::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 13:19:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 13:19:22 +0000
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
X-Inumbo-ID: 681d7a71-0765-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTxuq/0TLlMgydkyuT+chdQf2ma4SuZAr6AEqSdEZt8LumzzjXrEsDfHfcycEftiPAtAt54l/V1AbcJfB9oTwcpavzyjjc12ttno07orPArgIsQKt4GsoY5B5WjGn9kDDzrIs49WphdnqBKBvg4uEHtrg0Kvk/h9c3Ii5LrShqINqX6Qdp+7MwkVvpN4MdCNo/08IPUfQEx2gJQoOg4xjztzRne/n9hWqbfI3iEkD9NgHUNbZyB3QMuDtrMcvcD1s+RKeNCvOliVs+IW2GHand5oHwXxmWf4iT2OIjap+RPzXZXdADBt+urnO2BPtXvhE4u/wVjc8/OWJ7/0gvNN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbaQLiU87Ncr/+dCFhJb1eHf05fRwFAZ1IPFbm+ULDk=;
 b=Khz/VnBSYTReMR/HqeWY900kWmDfV3typGeD1Vf6XyylaHjYY5kmF+6lnsNPaHaFX0YMgbRyd5FPPtpTceGjK8Qfr7nn1QBcnv7u5bHJb0ecaj5xhbmzzZ64HnlW4Kn1a++/fHpUe6Qsuipyeqy7G72fyIeKm/bu1w4/MmDfE9jCT7ikkP8ie/gJVafRwbVvxldPWXtIAKu/3EemZBxpF+VZZ32nXU4rswspZhDLm1cgHScwKarApxw/Z41ZfKoItJFvSTG2/RR+vRS7EL79T2DKQzr696AEvnOzkuxqWE/ehFLYQ8s8LCxAsszcRCH2ARbwBwc7PLXCFoWEIcPGtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbaQLiU87Ncr/+dCFhJb1eHf05fRwFAZ1IPFbm+ULDk=;
 b=GU5WoMPrSLp0qlDQKiH81SuXj9fZ0co6NzqKfVLcBd7QwwOzfGWt5+sF3phT6qPHIPqJfmaPxn7bgl4Zr6LSl0esNcaouc5cK3rz1bCYXcDPgZMV9+dygRj4xePwMo1Z1ZdLPGfkhH+Uzdz8VNwI5mhF4f9q1y/NRD+Ld7f5rxYq7u2XdQyFs9eqytPgjlT3S7pkVymC1iq+8ONCgP4fUB8us6SuO6KPN/EmZNUIABVa/JTt3obFzjN5SgICJvNu2jOoy/HV8BHmyLgmItzh3TA4W61+Iw/Epk5TUS36EnkGowZgxnr+eLWJhmvJEye4KorsI524Mm+NzBgiAYHAPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e51c7a13-24e8-e07b-445d-4dfad9302c67@suse.com>
Date: Tue, 19 Jul 2022 15:19:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 03/18] x86: adopt new boot info structures
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-4-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc456d51-89be-4db5-0886-08da69894b67
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3522:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vNq5RyRXB30RYE3e48YQJ4VsGkHLPHpMy+SEXcmuou7cueJIg3ochm1d/U+JpbGfcnAq7QoCDUsb/gJDn1hnVWo6OdVk3PwFimOpR633QKiJUcbI2jZFLSj1WWZ8n8lipbHXmkJiQ93C9mWOMIdGHp0C6Vl8TvrvqAiQVV2nRQK6YNmL0wFBDVAjBMxyJPW2or8R5psnLctcyhSxvBnHMJ1m84XPyV25bfKRuKqjbeKS6lcbToBdLMwoaRqiq2Ur4H3YTdejE+u5J/O6CwNS+cz4q6rXpFJrFQhw3sPBcl3joGRWP3g70BW7gsHAtU8TRUOQLBha5DlryuaxWrOq4g5gqUHedsCEFcqS/n9Ie1utYgW0otNb8+pAQ3ODstr0k6v95LzyTFJosJDoeqLSDGYogrho9SwgrVLMKExk8HcCXKJgIpsrfX1DRyOBpt76FJ+eyLnf+YiCQ4ha3vB9+aq3TCOB0imuZGHYOG5/g2kbP0PaTa1RXPk5wLFPybj1FihtpVmFaU1yIBxz0mRdm3I2Lg1vsLKCftzGmm8pbM/aQ2x8ScfA4EinY69rQGSsFuqfIi2J5JIxYFFnpqLiQJE58ki2nCkGk2Ninp2DYWcq3ZGOm4slBGk+cDQbZATmv7eMP3nGCAwAC/XLr6ofSt+TNwLfL5pP1alvkiORc1SrYDHj+RhOPOq7ChrJjrHPGcgtb95vEHf66kThmQrHULuZEvcLvIvANUg7PL3bJd23JZrXxItnr2zthL13AFJa+bJiTSbgetMpxEkNLAH+665XZjS98vtVyzdnhL8fVnXiEJ1OAImrzVKHQ1xwbOMc2G6A/DmQ6Db0k9k7rtYcAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(346002)(136003)(376002)(2616005)(83380400001)(7416002)(41300700001)(186003)(31686004)(6512007)(26005)(5660300002)(2906002)(6486002)(478600001)(31696002)(38100700002)(86362001)(66946007)(66556008)(8676002)(8936002)(4326008)(316002)(54906003)(53546011)(6916009)(36756003)(6506007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWpMSXJsSDFMRlhOT2J5OEE5UU5hZFFhTU5JNXdTb0ZLdzRTNHh6TEhJSzlV?=
 =?utf-8?B?N1doTHNyTk1MWWx2SlVPQ1JLRmpFQmpTKzBNWVlSUUErMmJ0V0lBTVh1cEpZ?=
 =?utf-8?B?b0VTN3B0MXlOenptdUdHOTZzOFVBMnUySlZLYzRTSkF3VFRFSzM1aTl2Ynl4?=
 =?utf-8?B?Y0JOYXV2VkdxSDRPZ3hXSkJyUkZkdEhVNk9iVGRPTGxZbk42c2VHa3g4a2JJ?=
 =?utf-8?B?MDZIaFJLVVM3emV2R2JCbXFZUGsxTjAybDQwNnZWYlNHMkRSeE5oZ2duTGpM?=
 =?utf-8?B?RWJjVmZuYUFPNnA3RU9GSTljUlNJa1BqR1RkSlV6Z2htbWdHZUdWR3NFN2V5?=
 =?utf-8?B?S2RxQVJZclVXY1BIY1BWcUowTXNnL00wWWswMHh5bjBXUE8zQitQYUN6QmNx?=
 =?utf-8?B?RlFCNGhrMDJyKzMvbVRScGpNT1FRdUFCUlNoR3JTK0ZpNjV6WFZZRk4rWXBx?=
 =?utf-8?B?WEtQQk45ZFJCdlF4bkpSLzVkN0JaamMxendXSiswNVlvR1BzODd0MFRWMEkz?=
 =?utf-8?B?WTNlWWxXanJ0NFlIYjAvUlZVeFBKQ1dPUVVBZkUwWVZzOGF2c1R0MHlTVUlu?=
 =?utf-8?B?aHhSemQ3MU8vUUZiRTIrRWpiVGdzTDhUaFF5M0MwSE56NURYbGxodkZyby8r?=
 =?utf-8?B?OTBjUnM4angxS3VNL1dMLzRFT0VRMHM0VWFmWWpuL0tyT2Z0bzFYV1I4a1ZY?=
 =?utf-8?B?dkVoSlFaZ0E5S0EySSt3UVVpY2NLbGRNbnpqNVhqWGFiZGRPV2dMR2J0ZFM0?=
 =?utf-8?B?VXAzY3drbFQwWnhMejRlVzAyZS9RcVVRNnZnbXJjOERPc0xMcDh1TkwwQ1Fm?=
 =?utf-8?B?SFIzUUhKNkVWaUs2N0xSK2xRVmVSaWJGbGtjdGh1Y2pha1BDWGR0RlFMRlds?=
 =?utf-8?B?QmhCS29lTlltN2tBQ1JUT1Z2UUQ5eVZ6SXdQZFpyNVdPU2xGWjg0bFJnYWxi?=
 =?utf-8?B?VUlpSTNNV3ZWQnQzRmUrZjVJWHI1UklVcXhVbGU0NWVoVjQxcE9QMlNUd2dY?=
 =?utf-8?B?SkRyVitFQ1YzT0g0OUdUQ1NpNkNLNld4eUVaaXlWM2RON3E2UG5aczU1NUpI?=
 =?utf-8?B?a1F2RXhkN1h0cFhMZzdTK2Q5K2d4bDFVSit0NHhDYUMrY3pCWDdtbVN2RFZu?=
 =?utf-8?B?a1VYZlpTbDh3a3NoZzRFNGNVeEM0TjNMR3FkaEtkMVg3eEFBQzdZWWluOE9w?=
 =?utf-8?B?MmErSHd2aE1QMTdjVUtoaWFsTFlTZXIyT1cwc2pkNFZlbStFVWJxMkpITHI3?=
 =?utf-8?B?bHRDeldCNHdnUnAzUTFZbUtRT2VrdjJtVTNEUFhUd085QWtJbEtoMlViZWR1?=
 =?utf-8?B?cjN0c0RXak9qamNnQTJyY3ZadE9TSWRSaUVzSlNsNjJDT2hDMGYvcmtxZjFM?=
 =?utf-8?B?ZTBrdEp1KzdEVGVUam45QUdDM0hETzZra0tsWmVLbkxEN2ROL3ZiRHM2c0Ji?=
 =?utf-8?B?T0ZrMHZSRUphN0t2c1VPRmlsZUplMllMUlVpbXpFaUxnSTQ1NXdkemJwQUhU?=
 =?utf-8?B?S0xKUlJvci9rWDd0dUNEb0VuaUV0MDZ3MndWYXMrWG1HRDI3VXIxanYrR1ps?=
 =?utf-8?B?SVRub3ZwZzFSY1UwVHFEdnJoY253K3BpQjhnT3hOQW5na3pZakdVNzhUY3lO?=
 =?utf-8?B?eHd3NWZPR2dHdlZWak1tOGdSQXgvK0lONjFoWisrWE9haVJYNXJFSE1TVU9H?=
 =?utf-8?B?dWtpdGxuV1BHSG1oM3FuQUdaZjREWmxJMkk0OXEyS1RseGQwaVNzMWdLMGdi?=
 =?utf-8?B?Unl2TWl5RVBNdTdGYzNwdUpxN0l6aUpYdTlieHFrcjVBSWdOYkltZmhEakor?=
 =?utf-8?B?aDJVOVRZQjRlRlRDbEhvczFaZmYwSnM0N1NKdjQ4VkIwdnBsdGgyRHRGeGpw?=
 =?utf-8?B?UWdhcStoRGNzanFaT0RMdXpXN3VoUnVzNC9POS9MSXIyUFlLS1ZTbUtOZ3Aw?=
 =?utf-8?B?NlBpVEEyUjR0STJPUmhwZ2ozSGE3VTZvZUtyanlpWDEzUWhwdzg2TEhLRitr?=
 =?utf-8?B?Vkd2eDFqbFZIb2pQSWk3WnR6ejh1Mlo1ZHdHaXpTbGZtUmR1SlVEWWNkdmsy?=
 =?utf-8?B?MFJhVDJOSzlUYjlNS0JaUGYreHJtZHRRRUVUU0tsZXZucVQycFZqUVpvVC82?=
 =?utf-8?Q?0GM36ny6CAImVshfwf9UZBloI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc456d51-89be-4db5-0886-08da69894b67
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 13:19:22.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dksFKyUX5H4cFFURzAvgfV7Ht6Z3UqYD6yo4ytiQtoWA5Cq1AdhUw6HQOOzFUbIrK7QGKJXc2GRZebyJSmm7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3522

On 06.07.2022 23:04, Daniel P. Smith wrote:
> This commit replaces the use of the multiboot v1 structures starting
> at __start_xen(). The majority of this commit is converting the fields
> being accessed for the startup calculations. While adapting the ucode
> boot module location logic, this code was refactored to reduce some
> of the unnecessary complexity.

Things like this or ...

> --- a/xen/arch/x86/bzimage.c
> +++ b/xen/arch/x86/bzimage.c
> @@ -69,10 +69,8 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
>      return 1;
>  }
>  
> -static unsigned long __initdata orig_image_len;
> -
> -unsigned long __init bzimage_headroom(void *image_start,
> -                                      unsigned long image_length)
> +unsigned long __init bzimage_headroom(
> +    void *image_start, unsigned long image_length)
>  {
>      struct setup_header *hdr = (struct setup_header *)image_start;
>      int err;
> @@ -91,7 +89,6 @@ unsigned long __init bzimage_headroom(void *image_start,
>      if ( elf_is_elfbinary(image_start, image_length) )
>          return 0;
>  
> -    orig_image_len = image_length;
>      headroom = output_length(image_start, image_length);
>      if (gzip_check(image_start, image_length))
>      {
> @@ -104,12 +101,15 @@ unsigned long __init bzimage_headroom(void *image_start,
>      return headroom;
>  }
>  
> -int __init bzimage_parse(void *image_base, void **image_start,
> -                         unsigned long *image_len)
> +int __init bzimage_parse(
> +    void *image_base, void **image_start, unsigned int headroom,
> +    unsigned long *image_len)
>  {
>      struct setup_header *hdr = (struct setup_header *)(*image_start);
>      int err = bzimage_check(hdr, *image_len);
> -    unsigned long output_len;
> +    unsigned long output_len, orig_image_len;
> +
> +    orig_image_len = *image_len - headroom;
>  
>      if ( err < 0 )
>          return err;
> @@ -125,7 +125,7 @@ int __init bzimage_parse(void *image_base, void **image_start,
>  
>      BUG_ON(!(image_base < *image_start));
>  
> -    output_len = output_length(*image_start, orig_image_len);
> +    output_len = output_length(*image_start, *image_len);
>  
>      if ( (err = perform_gunzip(image_base, *image_start, orig_image_len)) > 0 )
>          err = decompress(*image_start, orig_image_len, image_base);

... whatever the deal is here want factoring out. Also you want to avoid
making formatting changes (like in the function headers here) in an
already large patch, when you don't otherwise touch the functions. I'm
not even convinced the formatting changes are desirable here, so I'd
like to ask that even on code you do touch for other reasons you do so
only if the existing layout ends up really awkward.

I have not looked in any further detail at this patch, sorry. Together
with my comment on the earlier patch I conclude that it might be best
if you moved things to the new representation field by field (or set of
related fields), introducing the new fields in the abstraction struct
as they are being made use of.

Jan

