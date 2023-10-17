Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB637CBA92
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 08:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618040.961258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdH1-00061k-8C; Tue, 17 Oct 2023 06:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618040.961258; Tue, 17 Oct 2023 06:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdH1-0005yl-54; Tue, 17 Oct 2023 06:09:47 +0000
Received: by outflank-mailman (input) for mailman id 618040;
 Tue, 17 Oct 2023 06:09:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsdGz-0005yf-NJ
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 06:09:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c45d78d2-6cb3-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 08:09:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 06:09:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 06:09:41 +0000
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
X-Inumbo-ID: c45d78d2-6cb3-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REYGKUaCvwYzvL4fwpTAwYfjtdDkcB76iwqJLcM8GKVFPga8VF8ukNf2srLdXNOMxG5Hdn339+TLv4bVjrhYG2ESXXgzFt0MUEKJdLzUuz7mUDxRfxQoZUloOQmplkZSdS00JvApZ8lVqsRHH+R5rqEMXlCHpRNPoh06imT22SrmA6xIgWe3Mv1mXT74ke4rUEb+Mt2u37DH4b1fGt27RLKVshYXS8rLFbMonWm0jqeHoB6sLboY9pNzKsRAxLTT60rJpMQqueSrhiTTBQxpDpTFpWnQ/NflkDJgWIS8t8N2152z6eMm096Hepds8dJ2jjl50QemVjBJfp+SqC+pSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpuBrt9CJvySavkfGfUcB7OReHxmvuzZluMFYX8FOus=;
 b=UlSDhihfDEDuBfj2pjr6ffKhKkI/GxBp5703rE4hkdEAQdQMxYqBZ5dejz+cTrZGsxf9A/6kM7attRzS4/sBHy357A4S6rpv1L8xkV6P0RTMof3nbCmGD+6MFcGrPy3FH1z9sTb0zyzyesGsz2GvtER4HEkINCRwYnVGocj8IoAxW8+N62oo/Z7boPgx43s7Fr3t70cGt6LTMxBGrqw0Sf7TlZIXuhuXx/RvpP3lKXz98Cq39N0CTe6JMqYG5EWZVjJvKLeidBtBZ6e45mNAG3dAlKm0L/LGJpZffyRVtp9Qkgtmt2oMoudMRMc1MYUAxHf/S8ye68T8qY9l1fGfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpuBrt9CJvySavkfGfUcB7OReHxmvuzZluMFYX8FOus=;
 b=W2rtaGrFkI2ByN0YmdAJdSJdfTHv6KpcgzySY1Knys2zJZVJNYBREtKZKFy8Rn18lE0Mg+r7Y8NXo++pU08hh4BBeE2kuycHTxaJM2P9CtVkARubwA8LphfCLgaAyyMgBuoq44FZhhdgG7xti9iNUg0wxVXP8nfOFsiFjzobu2ct5KIocc6z9QcmIcRuj4p+3uK5H33MhggYZw/VRxuLIqlfLqflAT24Zhd3jVe/9Mvo2ivuXNgGWTRXvE1m53PeUYZzpqR1nTF2g7p759sLGXvQka7rJZS2hbpwcyVytQjnLmNkdOPv0lidAWdjSNGsrXYX7V70ec6XNvJSwOxsAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8546127f-9945-0175-4e11-e187233e13cb@suse.com>
Date: Tue, 17 Oct 2023 08:09:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2 8/8] xen/compat: use BUILD_BUG_ON in
 CHECK_SIZE macros
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <6138e02935236afd51a5db98d3527e5e2602468d.1697123806.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6138e02935236afd51a5db98d3527e5e2602468d.1697123806.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb74b89-6920-424c-9c9e-08dbced7a6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H+L5v7J24w62st0gRqbYa9+vTDdXLPAiebmbfwo8yHWFt/54CrwviTAIRdUPGv9Vu7ueNSftsZZypSaiqUXznD/XktRlfsP66fCcnOPspltTNGSNOysCgQQjZ2iW/J75ANSBXgXkhHUY86gOM12gsDJ/2RN9k0wQBPsYTH7Od6KWkTimZCfO1C9OtaALSnOEM5VEdcomW/UVU9g/VhPJ+6RTa1XzT1zutJ0lwSxeNIkbYMRyLBnQw6VknEUF7WndAuiLLhSAh0ixmiLqR/EX58LIJPm7idgcQ8P/92SrlqqXaB1vmCSm+jrIwetYtz7eYuuYsjoctTwD6dxyWRjVtRG/ElsRBrmuEe+4/RfqxQ5MIKd/505Fs804Cvfc9gj793jJrwKFwzEuf1O5O7geyoy65BXaNGFPXf5u6Uvomjp9KXXxa6W1ONKvjmdiWZa8eVU7RpFutZ3m4w+t4WsyBsF/Zfu+KEbEZWzrJof6Y+7vtnHQ+lADMJfMmXqbdHeX7b6Uh9W7X0HmOimaMckEChiSkesLb7MEIJY2jO4gatYaqpckLKtdFyOzK3/zCAwfJsvdEhlpQFsMoVGozmGMZXj06vFtFmIcs0ECwgdYl1CTB5EMXn21vlCRIToC6dikDqGGWNODVL/agO0kG+3bYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6486002)(6512007)(6506007)(53546011)(478600001)(66946007)(2906002)(7416002)(36756003)(86362001)(5660300002)(31696002)(31686004)(41300700001)(316002)(54906003)(66476007)(66556008)(6916009)(8676002)(4326008)(8936002)(2616005)(38100700002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXNoclF2aWRGS2hxaXd1VXFQazFvcUx1YlRGQmV3cFB1TndraCtkaTd1Z1VY?=
 =?utf-8?B?MDJ2ci9vOTRRVm00ZUdEOVQ0VWxqeWdPd045ZzM1R1pJdFNOWWxxNVZoS1FT?=
 =?utf-8?B?eGJ6QkYxTHZwaDdZSFdEMTlYdk5FVW1lV2ZTRE5UYmFZdnNwUTVkcHFaRHBa?=
 =?utf-8?B?SXBVSGZrajg3dkF0SWtLVjRsSE0rZm1xbHJoaHJGOW5uQXd4RHdzSDBzeEl4?=
 =?utf-8?B?YVZSaityNlRnU0pLdGMxK01jR3VjOVoxdDVvSy9TR0VRS3BGU1hyV0wyeGNY?=
 =?utf-8?B?L1QyK2dPa002VkMyUTZETk9Da3dwaFlPZGxFK29PUitHZ0lBa0o2OXhmY1VD?=
 =?utf-8?B?OVpXNGdCV005bFFkNjVQMjF0dlBOQWFTMmZNQjQ0ZTVxdldUSU95QTBzQnNU?=
 =?utf-8?B?MHFJNTRZamMvbDhJaWRRODUzcGsyTzdKZFNXaDdzVW5FVzRnblNBUnhMYXBX?=
 =?utf-8?B?RXFwSjBmd3hsYkFPOFp1Qms1Q2l4emNEd2pQSndPU2lITXE4VDA2enRpeXpJ?=
 =?utf-8?B?US8xTGV1bm9waG5KZzJQNHB2Y0Q0L1A4ejFSdEswMlQ0VFNSOWdXOVN4b0No?=
 =?utf-8?B?Qk1iMHEwbmJSc1RqZEFTNkZoTjhsYTREU25oYVVDM0RtZTRDMGhZeVVXRWlt?=
 =?utf-8?B?cUFXSStucm96bUU0VkRhZ2pZbnNzUlBYRU9pSG9YMHM4VTF3M0pRYWN6MGdC?=
 =?utf-8?B?SkdKSnFKaEFrc0ovdWpTczdHSFJTVktBQmFNcnVVNThXRWJDZXRLbTg2QmpX?=
 =?utf-8?B?TGJWQml6S3lsdHZqSHFWVWVRNUNuNHNnV0hZUGdTbzBITmJmeWZFekx4czlV?=
 =?utf-8?B?MXIwaWMrTFVucncwWm9iTHh6YUlVMVBGNktUUWZNZ25HTzBFc0NDMU9xWFpl?=
 =?utf-8?B?QkMyb1o5c09ZaVBlNzVTQVlVdDBLRUpudFR4dWt6Y3ByZ25ZNXdLNTFQNHk5?=
 =?utf-8?B?ay9iN1BGNzBremxqb2hKQUR6Ti9XWVZyc0NGSHhiRlNXTWxDZWYrMXBIUmJQ?=
 =?utf-8?B?U3plMU8rRVRUNDY0WmF4ekQ5KzJLUWdGTXpNUWsvNFJQUFVyaUZxbE9yVTZP?=
 =?utf-8?B?L1gvYWl4U2Z0OVZOaGsxSEhtSjlDeDIra0pmYmdwcmJKQThQcFJlSjg3MVZa?=
 =?utf-8?B?VGJuRmhwY2dDTjM2czlFaS9tOGs5Rm5sVnZiZGZrNlZhSnFNM0kvTk1OblAr?=
 =?utf-8?B?WFJDMG9JcStkMlJXYTM2VFlGOWREQWszbnpVdUpYaFoyTHJKY280VE5ZY085?=
 =?utf-8?B?R1F0ak5RdVcyQ0hla3pxRWhxYW5QTGRpWHFtOExTcFFFQXRxQWdENmlhU2Nw?=
 =?utf-8?B?bFhSUWhZcDBpN0ltY2ZGQ25aUEZHNjRqQkFOZzFXbzQ3WTJtajNwdFVObzYy?=
 =?utf-8?B?dGJtUG1QRjVLcnNaMG9jbEd4eHVVV3VHSXZTNEhoSU5ja1ZLcXlsc0FNNUph?=
 =?utf-8?B?aTZvWkhVeTJNK3lTcC90UzU3ZTFUUUh0VTJRWGtuOG5RbEtmNWl5QldUSjk2?=
 =?utf-8?B?MkVWaHJoUUxDSm1LV0tMZXE0VDd0WVc2Wkx2Y3VjQjdmU01lZEVxT0o2NW8x?=
 =?utf-8?B?dWkwZzBpUndJSDhwYlZCaG1sMlpvVUV3c0hjbmt1UjJWZkhoMk4wcHJ0RWdr?=
 =?utf-8?B?UTBEZWlHMm5YdXd2R1ZEamZMQ3UxOWd4VTI1RDByM0JhZWZobGZORzZ5Tmtn?=
 =?utf-8?B?dG5rb3dOcFVNR0tISm1JSkNsQUF0UElFMUwvenJsUmFlWVJaMW1tSnVud0Fa?=
 =?utf-8?B?YU9lVGoyMWVVS2ZiQWc4R0tnbmFuRHBoTjZScDkvc2tCMGU1Ukt5VkszWitS?=
 =?utf-8?B?bUkyZ3dXQ0pONGdiOWZHdk12Q2RSK3V0b3VZd2luUVc4QTk3OERpNkVETlIx?=
 =?utf-8?B?SE11Z0ZnMThna2RrS1hLYnBpNjAwUlNXTHc0RlU0QzVnVW55blRNSFZaSU9Z?=
 =?utf-8?B?SkR4b1hlWUxOKzFkMG5MQUxLRHIvSm9IM0FHVERWZFNHOWNucDd5N0ZDRFB0?=
 =?utf-8?B?SWhRSThDd2dMeVAzTXdHdG82eTNQU3NOVktkR1FvYUpFWWZTUVJUeWxTYjla?=
 =?utf-8?B?ZjNaaDVEazc0SkczK3E3T1U3bmZKejlxcE43TTlHdkh5ZFBta28vYzRGK05h?=
 =?utf-8?Q?4wibxdDwoFO67JvYf+1kKLQjr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb74b89-6920-424c-9c9e-08dbced7a6bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:09:41.5405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flYPCAkOgZ81KkVH2M/17CrVN4T7FxCgk+ZJMAYl1mrJx7bsueAzcnEmjvjF8+BXwcc97Tf7b0xpi1iFfOVG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818

On 12.10.2023 17:28, Nicola Vetrini wrote:
> BUILD_BUG_ON is the preferred way to induce a build error
> upon statically determined incorrect conditions.
> 
> This also fixes a MISRA C:2012 Rule 10.1 violation in the
> previous formulation.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Hmm, looking back it's indeed not clear why I didn't use BUILD_BUG_ON() right
away. Perhaps just to avoid inline functions when things can be done without.
And/or because originally the macros were intended to be usable in function
bodies, not (just) at file scope. However, ...

> --- a/xen/include/xen/compat.h
> +++ b/xen/include/xen/compat.h
> @@ -151,12 +151,20 @@ CHECK_NAME_(k, n, T)(k xen_ ## n *x, \
>      return x == c; \
>  }
>  
> -#define CHECK_SIZE(name) \
> -    typedef int CHECK_NAME(name, S)[1 - (sizeof(xen_ ## name ## _t) != \
> -                                         sizeof(compat_ ## name ## _t)) * 2]
> +#define CHECK_SIZE(name)                                  \
> +static inline void __maybe_unused CHECK_SIZE_##name(void) \
> +{                                                         \
> +    typedef int CHECK_NAME(name, S)[1];                   \

... what's this and ...

> +    BUILD_BUG_ON(sizeof(xen_ ## name ## _t) !=            \
> +                 sizeof(compat_ ## name ## _t));          \
> +}
>  #define CHECK_SIZE_(k, n) \
> -    typedef int CHECK_NAME_(k, n, S)[1 - (sizeof(k xen_ ## n) != \
> -                                          sizeof(k compat_ ## n)) * 2]
> +static inline void __maybe_unused CHECK_SIZE_##k_##n(void) \
> +{                                                          \
> +    typedef int CHECK_NAME_(k, n, S)[1];                   \

... this needed for? The types aren't used anywhere afaict.

Jan

> +    BUILD_BUG_ON(sizeof(k xen_ ## n) !=                    \
> +                 sizeof(k compat_ ## n));                  \
> +}
>  
>  #define CHECK_FIELD_COMMON(name, t, f) \
>  static inline int __maybe_unused name(xen_ ## t ## _t *x, compat_ ## t ## _t *c) \


