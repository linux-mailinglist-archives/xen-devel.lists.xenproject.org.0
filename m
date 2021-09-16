Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9140D4DF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 10:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188250.337344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQn27-0007FY-M0; Thu, 16 Sep 2021 08:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188250.337344; Thu, 16 Sep 2021 08:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQn27-0007Cu-IB; Thu, 16 Sep 2021 08:46:15 +0000
Received: by outflank-mailman (input) for mailman id 188250;
 Thu, 16 Sep 2021 08:46:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQn26-0007Ck-II
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 08:46:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b5f3462-16ca-11ec-b5b5-12813bfff9fa;
 Thu, 16 Sep 2021 08:46:12 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-aZ6v_N08NLGCKvICVYeHKQ-1; Thu, 16 Sep 2021 10:46:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 08:46:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 08:46:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Thu, 16 Sep 2021 08:46:08 +0000
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
X-Inumbo-ID: 8b5f3462-16ca-11ec-b5b5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631781971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oB3hQsRN+X2NxD/nGE+17py16UYnIKt8HjInNCcduuY=;
	b=UnDTkb6qD+INOxVvhugB3aRgZqtNa9C91tY7j1JDgNX6QmRUBrxmwp1B0Y/nY7zIPxdmx+
	HeOA7P/Vv1MQVuwFA2X9RDpbqDByjQdLe4pA4YVSxBDlhcRWB49gHtv7RK0Q82qxJ87N0h
	IDlkQuMGM9E9F9OHe1xPMQyDr1IPOsY=
X-MC-Unique: aZ6v_N08NLGCKvICVYeHKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eG9IkKy2y+RFQsttWQnVCTOqPk1xvrh6kROJIc8THYi6g0aMShYfUWq4tf55JQbQ48NsFzByzxm7C3nXHPZqcnyXGlTR88/xJ21fAgVH8DudJV4evw6bupmKWwJHLt+fYdUpe+cizlpLUU4KB56a814wi5bP2v8MPEAuf5tYShNXBoCee5EGoB0BiPTvyuLIo7LyKrvS4vOpIFvC9BY00i8K3+tEtzfcRT3GC48nO/KwKdHxbgFzRKW1lslQZtthP0M5oDhup1PveYLU+DNBaAiFx7UUe/dsVOFb4EjjmYihOBSFFZTaSFSsJuNikr7lg+WZcetC0B0IddtoWVxRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oB3hQsRN+X2NxD/nGE+17py16UYnIKt8HjInNCcduuY=;
 b=LcTq4CDjLUmogOeYQiUmkUULtZEo5a4MOCeATzFNkh5fPeVmSpT1KQA36lJ0XK2bnuPmAGvdILpNr6byGWPBpkZfHv9i45iTLJEmod3IOWa3CsGU9blqcNSjfzh8gp7WQ+Z/hPi6xv0R//qRFirzK/qsQ/3nMhoPABxwSCTdFqbkv2wbShGsWAKfn3EyxDtkb4NHdB5uo/szpsRckCj/wwLlojE+Hm/52MUn8uTnL4wCaVPOz6toc37NtmkdLLXGevQgWHVxL6mxdUISrbWcw2QEXrUlzs6OGcddpUr3xINAtSJHnJnh1fXoCuD4SjM+Jejd0EI21P4D9Y2ne7I/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
Date: Thu, 16 Sep 2021 10:46:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210915142602.42862-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb0a7f17-e919-4d84-f63c-08d978ee6de7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54726AEAE04EF4DDA0A2D361B3DC9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pl+UIjvOEEUDkeT18lT01B+4yhrDaxU9OC6lDuilJYHSts/YEZd6udJ2r6Y0N+McCbBm27SxEqP1yRJTGDd99fuVxk/eR5dIkgIyG1UgQpgw3jmZpwp/o++AaOv7QY8ZhxpmOnRKxQSkwsQWJRVylRxCrjLqoesyoU1Quzn30IGm1EPlNntoqOaiGy1Vmxa3TWS3Cwkxs3pC0ccgyb8RI0m9kmq9Buw4CWTMkHjKLi7gopDN6a9/Txnf8OqDCiHQPCsHX72IlDxINCu3Q0eZM2kMbus+CB/u2SrrgNj6qHMUhNDKOKLRt3Aw/wu7lGcor2aJ6mIMdVVIiAj+0Xro+A7CBta136csGr2K1D8xlyIBGYVAbA5VcDxLnjAHO9ukhT8cWwOwJ4cRdp23c8WbQin+Bi+wckhEoi7jChJFCJJalGLfJfLlcYrwnEH1AXIJREh0WzesVxvENJlV7POizi0sY9cDKsw+TzeiW/vfz0M2yDhpqcH9Xa/oiG5GwHTZhWVVfgsjKE3jVi9xeRQdc8iggVsYOD4bU2lpP8x8/23XEhvs/Lq9QqS9i4I++yC5lVJQtd++ZZ6t/WDuohvrXDJn40gQoTGNqULxZKprF4r0BhLuNvRtAk7Ba81ejHJ2neS5eLcetJXYyCZvELMoWc+0jbxtNbtVsL/qDEhw2oJZxIZyzMltNFlYjSNP7wfC8ArdNd0M8igsiPJ+YMZE/dMqPjKyAU/zeHu8snozkuynNbLBjmfC7d8zWGjOqlZukVg5eLMezUtHoXqaOtRB/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(346002)(396003)(376002)(2616005)(956004)(86362001)(2906002)(186003)(8676002)(31696002)(66556008)(478600001)(5660300002)(31686004)(66476007)(54906003)(36756003)(16576012)(66946007)(26005)(6486002)(8936002)(7416002)(6916009)(53546011)(4326008)(38100700002)(316002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1c2VmowNkJ0V3Y0N3FBUFpENm53NXVGVW1CRkpSU1JpWUFVMi9QMmFFM1VW?=
 =?utf-8?B?aHU3M3BuUE52Ui9UbElYOWMwK3c5b0hKcTdCSFJnM2tKT3FmOGptd0VBSFIz?=
 =?utf-8?B?V05NR0RJbVFrK0lTWmNBSEpROVhFamRXOXdWdENZOHFVbWZyZWpxUllPVHBE?=
 =?utf-8?B?ZGtTRWsxL3FsYVhDeFVQYUxFdUczVFNTQzAwODdabVJzRlhVNFllQjFhanNF?=
 =?utf-8?B?dHdxZldnek5MSllRUnY3dDV0TjRwUy9DVFg0YU5VOGtHRzdVUWZMUDdubVVD?=
 =?utf-8?B?ZXhKREhNRlplZlFQUGg2V3VBOXM0Z1F4K0ZxT0hsZ0lCNnZTSHZjQlkrTStm?=
 =?utf-8?B?R3lOQUVkWmNNL2w3UzNpRnR1bHpXWUlTL2gxak1DQU1lWml3NVhwVjNaTG5i?=
 =?utf-8?B?UmEzL05jMGdjYnhoa01yQnhYR1BDWEM2TjJPL21yRFZoQ1M0cER6MTJXMHVH?=
 =?utf-8?B?M2E4TVQvTU1HdW0vS05GUXE3VVoxWk9ZNzJKNUdCaG1Zc3JucVNKZXlTcHBm?=
 =?utf-8?B?SE1HSkxpOFRUZG9vbWRSaDE3NWY1ZldnWURMZytCS0hXZlAvaktxdUNLQ0V0?=
 =?utf-8?B?TzNFdUdwZlE1SVU0c0J2YWFuWm81TjBlRU5qdTM2dm40eUYya083Y1VRb1Nw?=
 =?utf-8?B?cUFRQ1NPWXFaa2FFTUhPYlk1MHo0d3FRaWtiL08xbTFFR2Q4VFZuOTZVcTA0?=
 =?utf-8?B?U1ZjZWVXRGZwV1NhMkEwOUtTZlNZN3lKeTUyODlsdEJzVFpTZzdjdXJQb0dY?=
 =?utf-8?B?TkVuVldaRzlGOHcvUU0zcnBaZEFkRWh4Z041UTR1MEFuelc0Vlhqd3Y2WnYy?=
 =?utf-8?B?OWZvUXhZRzFFVnNEZUE5TThmekpzTm5nN0VJT01oL1ZWTGZJeE5DekxUbzlL?=
 =?utf-8?B?YTBzb1Y3OE9weldPUFRUZkNCK2J3clppakt2MWRESHlIVkhpOHRwNXkvaDVW?=
 =?utf-8?B?S0JZMzYwUGRQeXhYT21ZT3lPSHNtaWdlOWlDdUJDK2liYktTYU5zN0N0YWpG?=
 =?utf-8?B?STUrcHpodnFpeC8zMGl3UkNwakEraWhITE9nTGZpZTF5WHl2SW5XOGlnSE1i?=
 =?utf-8?B?WmFSVDBCc0dBQ2hKKzZMNEpkclVhRTNhQmNiUnkvd3lvWkc3TVVCaVdGN0xJ?=
 =?utf-8?B?TEtZU0xSTGdndlhVaEo1OHhMZUdobnRKZjNTT0ZNSytBV1BkTmJrSEdrdzVG?=
 =?utf-8?B?cTJJQjVTeWM4RVJZUm1Td3dUNFNMbytDdmNYUGI2WUwwTVNUbXpzKzBQR0ln?=
 =?utf-8?B?UGNvVnVZMmg2RkNsR0xGTXhOUWUvbEdTMy94TTF2TEd1RGZwdmEvRXNNaEhk?=
 =?utf-8?B?c3hBV204N1kxNEp3ajN4dlhja2dQR1lVMjhqS0IwUlRWOVkyY3FLaERod3px?=
 =?utf-8?B?dFlMZjdZZExjelF6NmFVVnZXQnRYdnNvNUNXY0M1UUl3S3J5UDNkSk0zMmhy?=
 =?utf-8?B?TXovM082dm5vM2ptcEVWbERhMFZjTjdsY3V1anUyNUp1OHMzbldTOVBSRnBy?=
 =?utf-8?B?Z3l5OHo3RTRmWW4ySmVjdk9wMzlQU2R0aTFaRGxCTG9OQkJzZHRjQ1hvWGI5?=
 =?utf-8?B?Q2xhVFh1QlZuVjBYN3YxZzBPbFJBOE5GeG1ZOXNLS09xeUZ0T3FRY0pyRTU5?=
 =?utf-8?B?dG92L0xaVEw4MUVmc25pdjVrRG5YOUpFMVd2Qk1POENCZEFXN2FlWWo0Qy82?=
 =?utf-8?B?S3pCYmFFVkVqUEVZTUVPbGpjUWNHMUhxbUc0djNMSit3OS9naFI1Rlgvc0FT?=
 =?utf-8?Q?IosH3V2S6U/T63q1wiCz6dOm8QEbEtdMM5opRAb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0a7f17-e919-4d84-f63c-08d978ee6de7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 08:46:09.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VjkD3ITSS9RCMYw7H+T2HSeFTladV8GuZ/Ow1BS6YQAdFIbHvAEFjH0jnzkRDb8SrM4Kh7qKr2FkoRv6X2pqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

A number of nits, sorry:

On 15.09.2021 16:26, Luca Fancellu wrote:
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -8,9 +8,39 @@
>  #include <asm/setup.h>
>  #include <asm/smp.h>
>  
> +typedef struct {
> +    char* name;

Misplaced *.

> +    int name_len;

Surely this can't go negative? (Same issue elsewhere.)

> +} dom0less_module_name;
> +
> +/*
> + * Binaries will be translated into bootmodules, the maximum number for them is
> + * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
> + */
> +#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
> +static struct file __initdata dom0less_files[MAX_DOM0LESS_MODULES];
> +static dom0less_module_name __initdata dom0less_bin_names[MAX_DOM0LESS_MODULES];
> +static uint32_t __initdata dom0less_modules_available = MAX_DOM0LESS_MODULES;
> +static uint32_t __initdata dom0less_modules_idx = 0;

Please see ./CODING_STYLE for your (ab)use of uint32_t here and
elsewhere.

> +#define ERROR_DOM0LESS_FILE_NOT_FOUND -1

Macros expanding to more than a single token should be suitably
parenthesized at least when the expression can possibly be mistaken
precedence wise (i.e. array[n] is in principle fine without
parentheses, because the meaning won't change no matter how it's
used in an expression).

>  void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
>  void __flush_dcache_area(const void *vaddr, unsigned long size);
>  
> +static int __init get_dom0less_file_index(const char* name, int name_len);
> +static uint32_t __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handle,
> +                                              const char* name, int name_len);
> +static void __init handle_dom0less_module_node(EFI_FILE_HANDLE dir_handle,
> +                                               int module_node_offset,
> +                                               int reg_addr_cells,
> +                                               int reg_size_cells);
> +static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> +                                               int domain_node,
> +                                               int addr_cells,
> +                                               int size_cells);
> +static bool __init check_dom0less_efi_boot(EFI_FILE_HANDLE dir_handle);

There are attributes (e.g. __must_check) which belong on the
declarations. __init, however, belongs on the definitions.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1134,8 +1134,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
>      union string section = { NULL }, name;
>      bool base_video = false;
> -    const char *option_str;
> +    const char *option_str = NULL;
>      bool use_cfg_file;
> +    bool dom0less_found = false;
>  
>      __set_bit(EFI_BOOT, &efi_flags);
>      __set_bit(EFI_LOADER, &efi_flags);
> @@ -1285,14 +1286,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>              efi_bs->FreePool(name.w);
>          }
>  
> -        if ( !name.s )
> -            blexit(L"No Dom0 kernel image specified.");
> -
>          efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>  
> -        option_str = split_string(name.s);
> +#ifdef CONFIG_ARM
> +        /* dom0less feature is supported only on ARM */
> +        dom0less_found = check_dom0less_efi_boot(dir_handle);
> +#endif
> +
> +        if ( !name.s && !dom0less_found )

Here you (properly ) use !name.s,

> +            blexit(L"No Dom0 kernel image specified.");
> +
> +        if ( name.s != NULL )

Here you then mean to omit the "!= NULL" for consistency and brevity.

> +            option_str = split_string(name.s);
>  
> -        if ( !read_section(loaded_image, L"kernel", &kernel, option_str) )
> +        if ( (!read_section(loaded_image, L"kernel", &kernel, option_str)) &&

Stray parentheses.

> +             (name.s != NULL) )

See above.

I also don't think this logic is quite right: If you're dom0less,
why would you want to look for an embedded Dom0 kernel image?

Jan


