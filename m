Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12E435FC0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 12:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214323.372824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdVim-0000b6-0k; Thu, 21 Oct 2021 10:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214323.372824; Thu, 21 Oct 2021 10:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdVil-0000YR-To; Thu, 21 Oct 2021 10:54:51 +0000
Received: by outflank-mailman (input) for mailman id 214323;
 Thu, 21 Oct 2021 10:54:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdVik-0000YJ-Qz
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 10:54:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 122aff75-c86c-4155-b20d-b25441f06cdd;
 Thu, 21 Oct 2021 10:54:49 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-FcdElh5cOECQ090-z0-Qtw-1; Thu, 21 Oct 2021 12:54:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 10:54:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 10:54:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:20b:2e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 10:54:44 +0000
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
X-Inumbo-ID: 122aff75-c86c-4155-b20d-b25441f06cdd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634813688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AVFV0JJo0REmloxEXJk+jf3B2HhXTqY2T7rLcRdYZ+8=;
	b=jElzHR8KYIEbj7ammq7oFPnzkZExCBBuqFkzLLQVrlZ9laDP8LLHEVAwWBsmvoDR1HxOzV
	sA4yB9x31TupyBaWXHnSdClTvC5tCpbbSMUhb1x/VbhCLgJ203gM2Cze4RjCggmVxmbOFN
	BpRnfvmH1ghL4Cqhg4UVXpW0LgzMm+w=
X-MC-Unique: FcdElh5cOECQ090-z0-Qtw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1z1Ehy2JSRYPXVxHWslaZnRm2BIVpGTTBHGs54qSf8mZivc9gEiEMky5htyYSbNosGyAsK0dwQIgME86Y/61vT9wSq67Yj4fhhjEakfoq702uuMGh7O88DueN7uA74gtWXEbSCnpjGavcieyxyVRQwhHrgEwSeXzNu4Jb/nu0XPF37M79LD9ZTs150mgZTgHFskZSNg634C9HoB4wr9f/hXRIK44tdIEfTSEaLQs/MYSi93OG45srPu7G/wD5Ipo1zyF7iaCkIGz1snLCHxYFrCMvBX854fbqTpoAsuuVcJeDevwLxg7FvMaA8kOjsOUOQmnu8gz6Q9C9JoDzeYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVFV0JJo0REmloxEXJk+jf3B2HhXTqY2T7rLcRdYZ+8=;
 b=ajg7zX7Hi8uNzEiH+vX9HOy3rclYsFBPFd4ZCPc80Tn0p3NlOt2pAkpIZrefI1S6f0idiJK2Idrb7LrtGqiaRk3bJo+on+KS6sGLJ704mhJ3M1EI68X7tqvkzzmNcliJ7Jx4ysocUybxJtOymT2iQ63WnyaIh6HBhwagApiVGl/BVcKdmi6fg7xS2u5Que79fKne/TH5fX7tfdTGcWV5sUsJeHcooreH+x+y5tDyN8VxtHXiIlvYg0GdPFAdCUM+oGq4HAyk2VU2Nc2/Nrglokc/kiuiIe3235t/lelFoWcCgaJMU3GXM0g+x/UHzpi+TvADmocMP5Iy/RmylK6LWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v4 1/6] x86/PVH: improve Dom0 memory size calculation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
 <4684f314-2c4e-f662-bd4e-132be001da9e@suse.com>
Message-ID: <efc20786-5873-4b28-7977-577d6bd99167@suse.com>
Date: Thu, 21 Oct 2021 12:54:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4684f314-2c4e-f662-bd4e-132be001da9e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0019.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e51e1ad-c3d5-45df-a1d8-08d99481317b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4349897053C3B1FC4470CA7DB3BF9@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bb6+sMBLX1kQQei+EM+hqPuPgr6SQvr+zPR0xpAy7DTX8rmXdq6Ol3Q5mcon0T5uEMTDqBg16I5d22m9OGCYw1yo+ndd0w6L2fctskb2t1EaGCMuhB5J5LbwPLr8Rh6R854vJ5TUY37luFLXk26jjDd2jq/GfXrByvZ9ej823rZMiDjiLN/V1eLYYZD/OHUCJXU2bpTpPvPH/K2lmEUjmu4xOthRjHEIUChALloARi1CHi7gjBIChM/SH/qsL6b+2Tsvzolbyws1iQRxBFHUfMIMqFTiLtr7KQWf16+DaQeXwh7sdbGFrVzgK9QOTJW2Hrige/JJVQcfqeuPg5ZbJEU1xPWwCjY+D/KQ1S5xiWZo9ry6h6UvylzvCs/e4dZ/hA//1GQgD1ZVEAZLgZ7CIUhBsa+Bl947FjN9mVtDfi/vYwuiTmSdPRljCgYGqCpxUC+UNU3o2oToj1oPmf5I9xuSfPaZhZ1t8goe6J5lI1pX905kXso8EVtu9QI0Ap+5Z5WNQbcLozzEuHoDtCwvkxKBedV0WmHXiFbriUtIm638hxq8q5xtrfWiKXF6zEd1jFZXnfceX70TcOX21LtXbR6+q+Uw2a+bz7tb2w/6/4EvGwyNSiOiwglD3rhnHNcQNAbio7Wivx+0tSjPxaK2RuCiI5tLLi1CUh6X31RoR2cnnSVAwXZwSlNoQbWx/RgVn9VWhE44w2Yd/ps6qOJS9e/673fJSFwDrcQb25mWPDCV0zTxSdzZ98RNqlnEDugy5L563Zrv07U9EzP2/FJGOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(316002)(38100700002)(16576012)(54906003)(4326008)(66946007)(6916009)(66556008)(186003)(31686004)(2906002)(53546011)(2616005)(8936002)(66476007)(508600001)(5660300002)(83380400001)(36756003)(6486002)(26005)(956004)(31696002)(86362001)(25903002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3ZIemppYk5hL1ZsR0RudUFuVnFtNFllR0h6eFZQd0UwOXN1Tm81UmxzVnRx?=
 =?utf-8?B?YlVCbkQ5cTduVTlZUjV4SEE4ZFNGUGJ5OTVsckN3cG51U0ZLV2hWQ3gzQnZH?=
 =?utf-8?B?ZkUwZHF6OVdoTW90aUY4SFJKMTJBUUsxRHdtamtuQ0g3UHVsM05TaWVSN1ov?=
 =?utf-8?B?YmhQZVpKVzNDdk9yQ0xCRFNRNXFoa1ZJYTBLdmtiNWtPQ0tsVjNTR096MGxR?=
 =?utf-8?B?bnNoV2R2T2RMWmhiUUlkUUhTSlpmQnFhRnlYeEU0NFZRK1g4UUszVkhtY0Vk?=
 =?utf-8?B?TWZoOXpSbmZzYjVxV0tBNUhCQmdQNVEwTEZOR04rbGR1OTNaaTB1ZWlkWVEw?=
 =?utf-8?B?akt3ZU1GaTZnQy9qVW9sZjIrTkdaRGhyUTR2eC9waE5naXNFS1NCd1ZjbS8y?=
 =?utf-8?B?VlhNWDkvdU92TnRvN2FzdkJSTURXYkZ0YWJsYU1mTnNVYUpGNGNpamVObzdV?=
 =?utf-8?B?eDV6SHRxY0VzMFhNTWlJUHhzdDN6b1lCSjFZNXBoZFAxTW9wcWZLalhIczhy?=
 =?utf-8?B?STBvSGdjTEtsVms4SEpyMFkvdG1iU1BOZjBtR1lDZTV0TGl2MjhScGJES2Z2?=
 =?utf-8?B?Q29UcW5yY1VpV3N6VlBmSnpVYWEzYUJiaGR4QTZOdGFhV3BjYldnaXFWU1d2?=
 =?utf-8?B?a1U5T3VocnFjSGxlWmtiZkNaaWQ1eXVPYXRYcndBL2pTWFpnMVovR3FDSkhj?=
 =?utf-8?B?OThIWUtWRkFwaHUxcHhubklzRnc4WXdqKzAzZGJhUEp4d3dIdnJ5NytvYnR3?=
 =?utf-8?B?Ylc3QlA0eVVtOGlmeEQ0ZFZiWmkzNGt5RmhQTlVqelBFTzBuaHovTDhYaEM5?=
 =?utf-8?B?TXVZdTgrc1pDQkJWUFZVdEcvL0F0TmlhbVFXd1A4bldWdTJxU1YxQTk3UkdH?=
 =?utf-8?B?N1dhNmpkNHlHd0lXQlBOd3dWR0UzWVVPektjbHNvWXo2YXROK1BZRlhnV1Zj?=
 =?utf-8?B?QWRwOHF2QlRPb2grS25XN2dyRGxFeWZoMTloUEJLTlNBNHdVZE0xWm9tS3VR?=
 =?utf-8?B?UzkxVE1UTXZDcTcvMzFnN3QrMjl0ZEhrUTJ5WUM4Z0JNUGl6V2JoT3dGSlM2?=
 =?utf-8?B?czRGa1c2cTJsSlZLdmgwQ2lDUEpsMG5HUGMrUW1mSmJIN2FrMFBsKzZXQTBS?=
 =?utf-8?B?WkVsTC9QVWczaWFWS2hyVVNBNWV3L1NjZmNEM09NYk5OL2FrRW9FWkt4S0ho?=
 =?utf-8?B?TVVzNkh5TFBpeXlXY2EyMG9Cem1NRzRwSFlBcTZ6a3VVQWZTYlRTOU5YTjZn?=
 =?utf-8?B?WlYzbkFSOXpiSmZNYzUxdklLR2R3RUFLTk1CaThYMmRxdkxuZHdsSHlKYmVN?=
 =?utf-8?B?Sk5ISTRydVAyVlg1eVVmTUpORk5QNDBrTXg5dFNRYm1nTnc4bmVmRCtiQUha?=
 =?utf-8?B?VVErYVQyUStuNTVaYkt1MGMydHB5empoc21QNDg2V0twVmFYbHArSXVzZjU5?=
 =?utf-8?B?MFVwSHNyU0lWc3g1T2krQllSeUswOHhxM2lmSG40SzJ5NTByTUREdXpDTnpM?=
 =?utf-8?B?dzlRWVFrb01MY2IxbG1IUGhZcE84WEtFTVM1YW1YRFpIaTdjWDBsN09KbG9N?=
 =?utf-8?B?QW5qVkR1U1luSjRoRUZiQ1RHTjZqTmUzNFg5dm9kNWU3aENlb0ZBTVE1R3NH?=
 =?utf-8?B?cGxkdmtUeEVZMnp3NzFIQW13TWp3eG1QVlFHc2EvUDVaU1p5Q1pwcUZLbkNm?=
 =?utf-8?B?ZUFTWE15T25Zb3FZM090djF1ZnhPbUZCZHJRdkZudGZjWDJReHQvMCtzT3lQ?=
 =?utf-8?Q?Un736UUTCowPM2JBCNMZB65KislEbIp1RNHRrqa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e51e1ad-c3d5-45df-a1d8-08d99481317b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 10:54:45.3082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 29.09.2021 15:13, Jan Beulich wrote:
> @@ -337,53 +336,65 @@ unsigned long __init dom0_compute_nr_pag
>          avail -= d->max_vcpus - 1;
>  
>      /* Reserve memory for iommu_dom0_init() (rough estimate). */
> -    if ( is_iommu_enabled(d) )
> +    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
>      {
>          unsigned int s;
>  
>          for ( s = 9; s < BITS_PER_LONG; s += 9 )
> -            avail -= max_pdx >> s;
> +            iommu_pages += max_pdx >> s;
> +
> +        avail -= iommu_pages;
> +    }
> +
> +    nr_pages = get_memsize(&dom0_size, avail);
> +
> +    /*
> +     * If allocation isn't specified, reserve 1/16th of available memory for
> +     * things like DMA buffers. This reservation is clamped to a maximum of
> +     * 128MB.
> +     */
> +    if ( !nr_pages )
> +    {
> +        nr_pages = avail - (pv_shim ? pv_shim_mem(avail)
> +                            : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
> +        if ( paging_mode_enabled(d) )
> +            /*
> +             * Temporary workaround message until internal (paging) memory
> +             * accounting required to build a pvh dom0 is improved.
> +             */
> +            printk("WARNING: PVH dom0 without dom0_mem set is still unstable. "
> +                   "If you get crashes during boot, try adding a dom0_mem parameter\n");
>      }
>  
> -    need_paging = is_hvm_domain(d) &&
> -        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
> -    for ( ; ; need_paging = false )
> +    if ( paging_mode_enabled(d) || opt_dom0_shadow )
>      {
> -        nr_pages = get_memsize(&dom0_size, avail);
> -        min_pages = get_memsize(&dom0_min_size, avail);
> -        max_pages = get_memsize(&dom0_max_size, avail);
> +        unsigned long cpu_pages;
>  
>          /*
> -         * If allocation isn't specified, reserve 1/16th of available memory
> -         * for things like DMA buffers. This reservation is clamped to a
> -         * maximum of 128MB.
> +         * Clamp according to min/max limits and available memory
> +         * (preliminary).
>           */
> -        if ( !nr_pages )
> -        {
> -            nr_pages = avail - (pv_shim ? pv_shim_mem(avail)
> -                                 : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));

Just FYI that I've noticed only now that moving this only up is
not enough; the same also ...

> -            if ( is_hvm_domain(d) && !need_paging )
> -                /*
> -                 * Temporary workaround message until internal (paging) memory
> -                 * accounting required to build a pvh dom0 is improved.
> -                 */
> -                printk("WARNING: PVH dom0 without dom0_mem set is still unstable. "
> -                       "If you get crashes during boot, try adding a dom0_mem parameter\n");
> -        }
> -
> -
> -        /* Clamp according to min/max limits and available memory. */
> -        nr_pages = max(nr_pages, min_pages);
> -        nr_pages = min(nr_pages, max_pages);
> +        nr_pages = max(nr_pages, get_memsize(&dom0_min_size, avail));
> +        nr_pages = min(nr_pages, get_memsize(&dom0_max_size, avail));
>          nr_pages = min(nr_pages, avail);
>  
> -        if ( !need_paging )
> -            break;
> +        cpu_pages = dom0_paging_pages(d, nr_pages);
>  
> -        /* Reserve memory for shadow or HAP. */
> -        avail -= dom0_paging_pages(d, nr_pages);
> +        if ( !iommu_use_hap_pt(d) )
> +            avail -= cpu_pages;
> +        else if ( cpu_pages > iommu_pages )
> +            avail -= cpu_pages - iommu_pages;
>      }
>  
> +    nr_pages = get_memsize(&dom0_size, avail);

... is needed here, or else things won't work e.g. without any "dom0_mem=".
I'll introduce a helper function ...

Jan


