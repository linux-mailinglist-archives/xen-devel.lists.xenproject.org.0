Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0977E1BA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 14:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584744.915547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWFj4-0007ke-HA; Wed, 16 Aug 2023 12:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584744.915547; Wed, 16 Aug 2023 12:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWFj4-0007iB-Dv; Wed, 16 Aug 2023 12:34:14 +0000
Received: by outflank-mailman (input) for mailman id 584744;
 Wed, 16 Aug 2023 12:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWFj2-0007i5-Ly
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 12:34:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3213e16c-3c31-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 14:34:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9728.eurprd04.prod.outlook.com (2603:10a6:10:4e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 12:33:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 12:33:39 +0000
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
X-Inumbo-ID: 3213e16c-3c31-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZsa04zU2YMgouj2MjqkvXCrE8UQZw1yH4OxOBuRRcmLmewhDtVZZ7h1JeYDEykCPNX6dKHus8yOVRgveNrO05WSJjY1hMhJLYpFVqNaw7IWfHGj1faengjh0UnEGeZ+KHgJjRs5kit1LAOvq6a7EQ6Et4jON8r59uhcesCEtgVFV6rmT3NBwd3HnDt0Ci2mRahTt3bzgDo8gYazrR9XVJUENe5MItRCquK3ZpBI/OJrQRY6GUtvm0aJ45NRkgIEAA7Lr9dkmG1avLj18UxMRsQv3D9QVvmqQ4wUDfqts8OpPprI/yL9ytfOsCpwo+kFu3jssEkUXZRDoGS6/k81tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9k9aL5neHSzQcmuiaw/nE6KOobv9P4LIKb6LhpSKKs=;
 b=kCgIDEbiig+GkOlNg5zin2jEMlJPk4+0jWH+FV7nPPwsF7fVBM+h29y3nbbfc76l3kr/2yIcJpfM7owcSvRBAnIjuu+blQwCJV+TCKPaS7+yFZ7OcWSPtpCgF6lvCQKWcuJzKpVeGEqIzWvXlhExu40Uf8qWSE78O1sC+zXds2b/9XDQCHpsJOWf9ZJBhAADGNABH5/S6HLRxIBlnLmgtGT0CGeq2nHKA9rRjZAnGaaLCIT7XeV8xWMKOCMCBGeQlq9DU8ILCdM5rwD1bldi+NVAsk/a0j1QZFvcjNgj2X9CApOh4cSEbTdS/kT7tQKbTW0BlIfaJqNTrdHJ6f+Whg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9k9aL5neHSzQcmuiaw/nE6KOobv9P4LIKb6LhpSKKs=;
 b=RdlFiHUYjc43fD0o+EwQ+GlK/rRlGGdkViaNAJ1wI+GOYTWGAJ5Z8WwCof5sMADL0Fqd71QMaSmxT53bfrWRGe0zjd8R1IUHKQ0JNlxyp/qbkr+qbh2lQiRHanRLmJElY/jT/3fdeoTl+KSe/by1QOCxIBGUHorCSl6GeN0tyaOmbaTDSNdc509HQeudsJU/BpNIXD0ftobWK/M8Icl/Io8rD0F/F1H0LzY0j+5SOEEdn43BFt093Ef+ABdPHHQuEahRJ7W3qwwkuhxoElrTzDnH4+NRQOyb05YIl+c9Tr1EeR2B+qWLPztHUzE4GVqhrFAwZioqTNQdJjPietmH6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b90b577a-cb2f-9b00-f7a5-c405c6729e8a@suse.com>
Date: Wed, 16 Aug 2023 14:33:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] x86/msi: dynamically map pages for MSI-X tables
Content-Language: en-US
To: Ruben Hakobyan <hakor@amazon.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230814161502.88394-1-hakor@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230814161502.88394-1-hakor@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: 067a4bb3-5037-47bf-bce0-08db9e550488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UFAYI2UopCg9Ih7ILbfeEUWNepYjSgn7NQgbe90SPvuLvlm/V9/MhgwJXE5v3Y8FaPVd4sMzCDa3wdGpDyemp/Zbg2rsfeTU6fCHypreH4ga3RVWehTadcVu4owhXUFpRPhOvWLgORmi8iKPO1jseh6hIsUXhynXNjPtBO2+OxWbFyGKH7MZgX3LN622htIF0KTHvQ9HRDBzYOkvncSWGA8cHYIdGSKdOBynC0T/BTrz+dpLpRNQxvz9CvPrQef4VNsONnHTg2ZlZwS1dgZnID8wzeZIsSzaQOxZV5BUrf0XjzJunEZ8+dtGn9T2aiHo5Ta8uOM0Y9Pn0Nsif/JGOoQnY6kEDfv7rUmjJNYIalq21L8hLXGqqSlUo1UVtIdJEO3ZzF1TFVXzwcn3ZCa1/r5ylW+DkmtkYWLuGLpdK7dKlJEUuYXPhWl4/1gNYy6BbGol1xVWbnil+C3OcmJMPvG//eCaDFaU/9bT4khH/hX9Sc/pdTDGAMAnzAHE8BXWkLerqUSUWA659GJZTCP/ySnMCFqzplCLhHrZE/rKQO35VyKeew8WaH/oEPmO5TMZ/DdemQ4CI6Imml+QUVxrvkDXfjseU9ARi1a656lFGauvxrfGVIZRs/xW4x3WwDihnFtD1zyUwMlY8i9+gW2gvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(2906002)(83380400001)(86362001)(478600001)(31696002)(6506007)(36756003)(6486002)(2616005)(6666004)(6512007)(53546011)(26005)(5660300002)(41300700001)(54906003)(316002)(66946007)(66556008)(66476007)(6916009)(31686004)(8676002)(8936002)(4326008)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGlYbk9LZTFzUGZEQVRpWXJjTG1zZ3BBM0tVWEY2R1cyMExab2Mrd1Foc3l0?=
 =?utf-8?B?SE1ZUnRuWTlOZTkxSk80ZUttWGZwYy80MDFEVGpmVVNHMFgrVlNoVjVwZ0VH?=
 =?utf-8?B?dW9uTUozQUNueFVUSEs0MlloSHcrYmk5L2tjUExUNGVHZUJFd2toMFNoNHV0?=
 =?utf-8?B?UjFBMW9qL3h4dlZLZjdQRGo3SnRScEIwcUpmUktSdHhYUWtrUDNDL2lFT3ZS?=
 =?utf-8?B?SzFzTmFtak5hTCtHLzVadW1jbzBIVHEvNzhlN0k2TjNQN01PdzlLVDJkenQv?=
 =?utf-8?B?TWY1OFNxeC9ZSms1YzNYM045UnNCTWN1OC9NYlFRcG8zOTl2UjRralJueVlm?=
 =?utf-8?B?eEdkTHVibHRDRXZzUS9kcFhMQkpoL0lVbGdUUS9wMHdDc1MzaEdRQjJ2ZzB6?=
 =?utf-8?B?T2VGRzZ5N09nT0lDYlFsQlhPS3lRRnBjT1lPNnZLS3dKRGNTY3lZVzlkdWx6?=
 =?utf-8?B?VjVhUVJIa055NWN0VHNDcVVPeXdUZlhMa0dZUFlJL3J0T3ZLU1E4a1Y1Q2ha?=
 =?utf-8?B?djZRcUsrVCtlWlFaY1RqNU9RTzJrMU1ibDdadGpqQjNkRzg5UFcrZjNEaG5x?=
 =?utf-8?B?ckx2QWdTYVpmbEVCMkRwTXJ5Q3NZa2hTNUdWNnNrTmFHb09OVmp3ZTBTWlJu?=
 =?utf-8?B?ZEtMMkR0Lzh2dUNLemc0T1RTWEplN3lldmxNSDJuRWhoODBHeUNjVGE2dGF1?=
 =?utf-8?B?U3VzTVRRMm14T2QzSi95d245SHVHOUJ2U1JQTnlicFU3RjRRc1JmRm5adHVx?=
 =?utf-8?B?OUlzaG9XZ3gyWWEwTWpFb1FMTXY1UFhteW56Tk9MZ3pwcTRhN2prdlh0TE56?=
 =?utf-8?B?U1NCTG41WDRPTytTdlBQOWl2VGprYTdodndCVnloTFF1RnhKakZHVW0rM1gr?=
 =?utf-8?B?TWRWRUZURjk4eGlzWEdXRG95dEhZMStlQlM0UC95RFlOWi8wMWRJSm5ieE1q?=
 =?utf-8?B?NWJoRXNjT0FGc1Rob2lPV2VVb3ROTUJYcHowajFOdXVZcFVIKzFhcDFkUzda?=
 =?utf-8?B?bGU2Q1pYVndqRFM5MHB6NmVENWRud0xRR3UvcVFuRlp3YXFQQkUwVThHSHpC?=
 =?utf-8?B?ZGMrcmRXcndxNlBGTlZiQmtoWVpNSkE4U2pITkEzNWlBbjRpWEE0RWJpQnQ3?=
 =?utf-8?B?L1NaVkZuTDBlSUNINEdGdDNzSzJBcDgzbjRIOFVDajAxbG1YekNWTGxHd2lr?=
 =?utf-8?B?Qmw2UDdsSmNnZW1DWi91ZXZpRy8vYW0yck5LRTZnZy9xM1ErZEhlRkFoczBh?=
 =?utf-8?B?MFFTU1pxMUxHb1ZQNmxvUEpWNEV3Ty9PVkxnNGxUeHVDdWdFMkdkYm9Xem1Z?=
 =?utf-8?B?RkQ3UTdMR0ErYXFQbEZXREpzYXNHY2M4RzRaQzlLVFNKZ2wyR2w4QkZsNCtr?=
 =?utf-8?B?N2RBOWJYRGRlRjB1bGVuRytiSm1zZGZ4dENMZnRDWnFGa0VOektQUDF3clgx?=
 =?utf-8?B?KzRWQXZqTGdSS2pLMmFmdVYwY3M3dmp0L3BJais0VHgxYjhsb1JETUVIQU1J?=
 =?utf-8?B?MXpVTUlrMWRoRTlqdXBIUmcxTHhPeG5OQmJXN2MxWHpOVHdqTVFyVWpla1N5?=
 =?utf-8?B?aTkrbEJicExEMEhRQVIzMGZyZFUxb042bFFUd2hQRDNhRVhta2d3eEtXWFha?=
 =?utf-8?B?S3pTVkc5ZGJTNTZxSmZ2WmxFMlpPUE9Nd3J4Ym5IMy80SmxzUUpIQUtrQitB?=
 =?utf-8?B?T3ZTUm9hbnF1YjFZdmZIdzFTd1FtdDl2TnAvbWEra0YyT3dlbm9SMkVCL1lz?=
 =?utf-8?B?eHJ4RTlHb3VWSkp0Sk9xd2xOQkNlYWRjTHR6VGdvQVdPT3c4K0FHOTZwaWVz?=
 =?utf-8?B?SGh6RFNKSDBjaVNmeVY0TjNvSDBBVnF4LzdYTDJIU3NFN20zWjV6Y3ZRb2xn?=
 =?utf-8?B?YWxvN3U1TWU5VDUxRDdnQlZuV2N6UE5Od05JcnFaR2x6cnlsMDhmbkxnb3RP?=
 =?utf-8?B?MWJ4VkpqL05pRTN1ZDM3dmdjYjYxZy8vbkZETm0yK1JQd0pLQjVYeWVSVW0r?=
 =?utf-8?B?M2F6a2N1K00xWlpoaVNqSkhhaW1OUXUwd1UvWDl6OGpvZllXaDRUUE9IQ0c3?=
 =?utf-8?B?WW4zYTVNQjZac2hwajRCZkZ0ZkZOWHBDMjBlaVlYdklyL29uNWswZlEvWkZa?=
 =?utf-8?Q?QOEdFFrHkEvp39Buk7Kc9wKB/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067a4bb3-5037-47bf-bce0-08db9e550488
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 12:33:38.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSb6FK9WkA3MTphz6IhgUgy0DOrLHU0ljQU2qfSOcWbCLTv8SBzKjtpQTKiZ3R93ogGDTpQP1z535WwHw8fCWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9728

On 14.08.2023 18:15, Ruben Hakobyan wrote:
> Xen reserves a constant number of pages that can be used for mapping
> MSI-X tables. This limit is defined by FIX_MSIX_MAX_PAGES in fixmap.h.
> 
> Reserving a fixed number of pages could result in an -ENOMEM if a
> device requests a new page when the fixmap limit is exhausted and will
> necessitate manually adjusting the limit before compilation.
> 
> To avoid the issues with the current fixmap implementation, we modify
> the MSI-X page mapping logic to instead dynamically map new pages when
> they are needed by making use of ioremap().
> 
> Note that this approach is not suitable for 32-bit architectures, where
> the virtual address space is considerably smaller.

This addresses one of the issues raised on v1. There was also the concern
of the mapping now potentially involving memory allocation (if page tables
need populating). I wonder whether, alongside emitting a warning, we
couldn't fall back to using fixmap in such an event.

Furthermore there's the concern regarding VA space use: If the 512 entries
we presently permit don't suffice, we talk about more than 2M worth of
mappings, i.e. more than 4M worth of VA space (due to guard pages).
That's not entirely negligible, even if still only a fairly small share
out of the 64G that we set aside right now, and hence probably wants at
least mentioning.

> -static int msix_get_fixmap(struct arch_msix *msix, u64 table_paddr,
> +static void __iomem *msix_get_entry(struct arch_msix *msix, u64 table_paddr,
>                             u64 entry_paddr)
>  {
>      long nr_page;
> -    int idx;
> +    void __iomem *va = NULL;

Unnecessary initializer.

>      nr_page = (entry_paddr >> PAGE_SHIFT) - (table_paddr >> PAGE_SHIFT);
>  
>      if ( nr_page < 0 || nr_page >= MAX_MSIX_TABLE_PAGES )
> -        return -EINVAL;
> +        return NULL;

Please don't lose the error code; callers should not need to blindly (and
hence possibly wrongly) assume -ENOMEM when getting back NULL. See
xen/err.h.

>      spin_lock(&msix->table_lock);
>      if ( msix->table_refcnt[nr_page]++ == 0 )
>      {
> -        idx = msix_fixmap_alloc();
> -        if ( idx < 0 )
> +        va = ioremap(round_pgdown(entry_paddr), PAGE_SIZE);
> +        if ( va == NULL )
>          {
>              msix->table_refcnt[nr_page]--;
>              goto out;
>          }
> -        set_fixmap_nocache(idx, entry_paddr);
> -        msix->table_idx[nr_page] = idx;
> +        msix->table_va[nr_page] = va;
>      }
>      else
> -        idx = msix->table_idx[nr_page];
> +        va = msix->table_va[nr_page];
>  
>   out:
>      spin_unlock(&msix->table_lock);
> -    return idx;
> +    return va + (entry_paddr & ~PAGE_MASK);

This is wrong in the error case, i.e. when va is NULL.

>  }
>  
> -static void msix_put_fixmap(struct arch_msix *msix, int idx)
> +static void msix_put_entry(struct arch_msix *msix, const void __iomem *entry_va)
>  {
>      int i;
> +    void __iomem *va = (void*)round_pgdown((unsigned long)entry_va);

Nit (style): Blank after * please.

>      spin_lock(&msix->table_lock);
>      for ( i = 0; i < MAX_MSIX_TABLE_PAGES; i++ )
>      {
> -        if ( msix->table_idx[i] == idx )
> +        if ( msix->table_va[i] == va )
>              break;
>      }
>      if ( i == MAX_MSIX_TABLE_PAGES )
> @@ -115,9 +84,8 @@ static void msix_put_fixmap(struct arch_msix *msix, int idx)
>  
>      if ( --msix->table_refcnt[i] == 0 )
>      {
> -        clear_fixmap(idx);
> -        msix_fixmap_free(idx);
> -        msix->table_idx[i] = 0;
> +        iounmap(va);
> +        msix->table_va[i] = NULL;

While possibly benign here, please clear the field before unmapping,
such that there's no doubt about a transiently dangling pointer.

Jan

