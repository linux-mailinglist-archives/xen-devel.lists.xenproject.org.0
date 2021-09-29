Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3821D41C01E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198752.352415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVULy-0000Mw-PC; Wed, 29 Sep 2021 07:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198752.352415; Wed, 29 Sep 2021 07:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVULy-0000KB-LT; Wed, 29 Sep 2021 07:50:10 +0000
Received: by outflank-mailman (input) for mailman id 198752;
 Wed, 29 Sep 2021 07:50:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVULx-0000Jo-DN
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:50:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43fac505-82f1-470b-8cf8-c59989ef13ba;
 Wed, 29 Sep 2021 07:50:08 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-ZQAA83LVNcWOUcel7qB7Tw-1; Wed, 29 Sep 2021 09:50:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Wed, 29 Sep
 2021 07:50:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 07:50:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0134.eurprd05.prod.outlook.com (2603:10a6:207:3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:50:01 +0000
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
X-Inumbo-ID: 43fac505-82f1-470b-8cf8-c59989ef13ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632901807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgShhN3zrmhC7mXQRzGue7jBiclU++igG4SklAgWBnw=;
	b=A0YufSx2yoWNQ9CoXDvWq4VM6GhlDsxZ4wv4z+yx5YCrzzx7Aam4uNPwOXkdI38erVegwk
	M9nzrWmrn/R/ZuLq478mPD9n14nRrJAdJ4wBK9yAKdGohQyl4bblSfrC46FEwbaNXg9Gzt
	1UMoeXXorpeWvIFMigpSs9gQSbvgYlE=
X-MC-Unique: ZQAA83LVNcWOUcel7qB7Tw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WH+tEfrv/hPWC0hGLFBE6u5+VjpDBnPcSubET54bWtCNo1mQdRUsYHJXfQWtq6+27cQ+Hdh2bE48oOu4lP/Nm9ROQaJZ1OJ5JKnDgXHsvNsVqrBHhWcdFGujjGoq3CyQ6KgUsAwmxayrgWSQIa4WvSVaqxS1ZMk7sqg2oTrvaY3IDYI7ZM6113PAZTG5m+Xsrko0V5S2Mgh57u5JB8rSrXMJVjoc+rfUakkiQF+yD6d8AAnCQ0NFUC+BiQwJL8+WP+wkgfVW0ru1d65YJ6I2a6IVb96TvTzgpHEmoLo5HeIV/9jr70mI2LMGS7A8rPKafn3e6Qlf5pawJ7n6I5vbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zgShhN3zrmhC7mXQRzGue7jBiclU++igG4SklAgWBnw=;
 b=VMeHHLDZ5+uAaypsBjzZuq6BkAyu2s7Htk8q5xPKan0MIHXVRVlWpdCf37Hm83SOFo0BliBu29A6rQsXTLmgjZV9cufVP+O9EPyHyoqSPixum7hZ3GZHutSaVKW/xPSPrvbX8U+EPrIih0G+wFq9H8HjIGRF8RXCCir4cejGY9Izc6jgEk6jgAIPk0VdpmCZAjXSFIOichrtRNrwcEYt5Ub7SjemcVgT9mD6YZJcJGEAQOKCNj5Rel5GGbqVeNAXfvHEANgeJfqH9QGYEPP4bQRFpKOLv/sItIO6bdZXDTyqybOK2E1p25kP85Y4Ec18sEJlxMHp/V+OYERYPx0cCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210928163209.49611-1-luca.fancellu@arm.com>
 <20210928163209.49611-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <120aae99-d8f9-eef3-e6ac-b1b9b842083e@suse.com>
Date: Wed, 29 Sep 2021 09:50:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210928163209.49611-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0134.eurprd05.prod.outlook.com
 (2603:10a6:207:3::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 590b3a1a-58f9-43bb-1d7c-08d9831dbecb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39336895CE238C2DAB3997E5B3A99@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4IM1OQ9DkGj61JQ4tem0HfR0rjweU6Q2RkT5BvlkZ17GBNX16hEZwe29tqrw8vPnhmUXpRy9Dek+vUF3Q2o9VN8laFDky7dvKXL91Z9AxMmhQ1dfjPiyaVt+AkZRK3JN52Z3DaUWk15889MC/ynie4LU1wbsJ3oYSOaLqkqYbD2bsiAhxBq+d1oEDfYYJFzKruK8DuQgHsXYUEbBv7NP17mN8wsJUJbzq1uRTGU6n6HC3+DWe5FJo/YcMlVx+Cuv0V2bLGXSZnKR6VpGme39BQcLae+5yx6rsOA3qRtPQVN45zhRUmmalUhq0DNivFA/CGGMGe0K0Hx+fZKgn/Why3BanQmyMzB8F/h7ljnvIgLzTrpCitseSxiYrB5BK6c18lttl2BvvWob8oyzq0JoM+ip/Z6CDe/LIO4hNygHJxpS6V3aP1lFZKldn38u4id1VQIJhMd+I0dAPqM+Lh0SClsNQDUoQ5AMCtZk4fJD4yjHk9qBUau5IS+wUfe1F/psVgAVORkY4qGkqTczz+8VkXLiM6upphR3nn8AjLhiPyzO0tKPrFoemkPU8OF9pOBabFQhulbZv1bVjsdjpsKxMdbJ4RmVAZlnCq4cnXmxP54xYWu1N6TMM8gg4tCtZhVI4dNQe4ZyuTbriZFc1GKUV+jONXmLJAwfWO3EkBth7IMl+I+Aw8v1UOCvvPSI6LLK49wdmnq60bOkrC9kev9qYKDnC58VjuTZrtRnUkaPV1eJQS2E0Lrthx3z6IsgtZP+9CCSyFIBTzjQ+CKhdSiiYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(38100700002)(54906003)(5660300002)(316002)(53546011)(31696002)(16576012)(4326008)(83380400001)(6486002)(6916009)(2616005)(508600001)(36756003)(186003)(66556008)(66476007)(31686004)(66946007)(7416002)(8676002)(2906002)(956004)(26005)(86362001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzFyRDlXL3ZYbUhaUnRzcW56SGgySTdYaG52NGI0T1V2b3REekQ4cUJmYitq?=
 =?utf-8?B?SXcyZWF0N2NPZWVVNy9nQ0orNmVBeVU0ajU4ZmoxZHdoOXhjbEhuVlFmR3pC?=
 =?utf-8?B?MkJOWkErRVd1dzVTajY1TjV1ekhDZE5WRkhDTzV1ZldTbnF4dSticndtUUZT?=
 =?utf-8?B?QkgvdGFBSEgzWU9IQmk2SFdyVGRwdC9EV0dhVk1KUDRINjE3RW5MRkZQVWhE?=
 =?utf-8?B?ODVqMW9wQ25EMDlwNys3Zi9OTkgxZEEwR1Jrbk1SOSs1VDJWNmYzMlFkRzk5?=
 =?utf-8?B?NjgyUVFMYnhsd3duc3cxQjQ5THNkWnIrWWZ0VU51UmRkZ2s0VXI0OEJTek1y?=
 =?utf-8?B?WGlNd0UrSXcvSUdscER4cVJBZ2tRWlV3Q0ZRTUZwb1NEUTBCMkl0cnpyZXBO?=
 =?utf-8?B?SGdVa2pyejRRb3R3bUtMYVl5TEVadmg1THp3UURyaEdyY0g0ODIvVG5jdlpr?=
 =?utf-8?B?c2REMnZLZS93czQ5OFRBMGxpZm5VRlE0RzljTER5ZHBiakwxSllQTFdRRU1X?=
 =?utf-8?B?UUJYVmF1SDg5TkJvaVpPUU02WWIwODJ3VHRiVEowU3prSGFVdkJpaXJodm8r?=
 =?utf-8?B?czgzNDFXNzdzUVRZUjhIY1RzY3RLbWFKSkl2NE1FSUpiR0tNdjRxTmtZOWp5?=
 =?utf-8?B?bW9OVm5Obkd3TTBsbTdGMGFzWS84ZDk0Umo1NEZFUUs5MUlweUQ4TzNQdDVl?=
 =?utf-8?B?OFlQeHdkZm9oNUVxQUkvSWpyTVdxSnU4OXA5aVNOYmpQdjlNd0JwWHp6d29w?=
 =?utf-8?B?ZU1BZEo4ek4yUGE0WFJsTDc1QWljU2I0dTNoSUx3OXF3OXY1RXQ1cGRvN2JX?=
 =?utf-8?B?V3RkSElUTDUzNE5jNUNLai9US0U0VXl3NE85U0I3NFdKVVVEVDMwMmJtYU8x?=
 =?utf-8?B?VURRbUZnWUs5Yjl0THROQWV1Ni9MS0dvcGFaUXZKSVBIalkzMGNCRm8rYTFP?=
 =?utf-8?B?bUFVWnFFc3NwMzQyZ2I4dUhkczRBcG9XaXRHUWZVNzRrUmhlZm5yTkJTRlls?=
 =?utf-8?B?RE1MMi90R21VZE0razZEUjFlMDgvTllaeEx5YmtoUnE5ZTd1YWNFNWJ3WGdP?=
 =?utf-8?B?NXYrY0NQUTZkL29XOFQ0WUtwRW1WekxBYWhQWlRkd1B1eTAzWUxFWEJhQmtj?=
 =?utf-8?B?bHBIT2tMb2NPZm11WlBpcEZpSWYrQlVUQTY1N1ROMFEwOFFZci8vVmZjdTUy?=
 =?utf-8?B?SE5HcEE0L3M5UXVLRDFhTTdlc2U0WFdTRElrTnp3TlhOcDl5QkpuMVBleVZC?=
 =?utf-8?B?S0l6WVROR05KOTNlek5WNWxmYnRFOG4rbWd0QUhlUkRKRXYzRzFMaU50TjYv?=
 =?utf-8?B?czB4WkV0eXdwUzBLcngzZzBscGxTV3ZPUC9WNjE4bmhrK3dPelp3aUpxOXR0?=
 =?utf-8?B?c3hlRS9DSmRaVXVOMnJkUURHZThITFFud0ZpbjNDaDZnTXlEaTAzSWEyTjZU?=
 =?utf-8?B?ZlZvTUtUYnRsQWV6TnczTy91VGYxWnVXU2Y3TnlaUC9PSDNYQUc3U3NsYTNu?=
 =?utf-8?B?SVJ1ZTBJR3JtenBaWnNSV3N2YnhvbGxjMjRGTEdISXR2K2FDc3RXcDZXV3Jh?=
 =?utf-8?B?WnZ2czBRNUhrWmkrYzFTaWlBdVBqb29HVWRvTkhneENUdTlmUUtjeFBDR3N5?=
 =?utf-8?B?UHpBRVpwMG5WQWZGOUNHamluQUozQXVRbDFURS9oZCt5MlNtTG1ET3FobU84?=
 =?utf-8?B?enZLTDhHT1pvWFRYaEQzcHlLczhhUFk4ZHdFY0UvK0dFNE1OaGxHR0xzb1lp?=
 =?utf-8?Q?m9Hlg46tx4zeAUdWr9Sp2g96ppRs3UjlRqYM3SK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590b3a1a-58f9-43bb-1d7c-08d9831dbecb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:50:03.0137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTLJiHi1G60GGzRUUesqZlE/lJmSF0l+mhRVlgBgMq3zYtkHFse4jzvXwDQhZluEIktrgdfrH1VgV7QMGOO7hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 28.09.2021 18:32, Luca Fancellu wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -678,6 +678,12 @@ static void __init efi_arch_handle_module(const struct file *file,
>      efi_bs->FreePool(ptr);
>  }
>  
> +static int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +{
> +    /* x86 doesn't support device tree boot */
> +    return 0;
> +}

Every time I see this addition I'm getting puzzled. As a result I'm
afraid I now need to finally ask you to do something about this (and
I'm sorry for doing so only now). There would better be no notion of
DT in x86 code, and there would better also not be a need for
architectures not supporting DT to each supply such a stub. Instead
I think you want to put this stub in xen/common/efi/boot.c, inside a
suitable #ifdef.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1127,15 +1127,17 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
>      EFI_LOADED_IMAGE *loaded_image;
>      EFI_STATUS status;
> -    unsigned int i, argc;
> -    CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
> +    unsigned int i, argc = 0;
> +    CHAR16 **argv, *file_name = NULL, *cfg_file_name = NULL, *options = NULL;
>      UINTN gop_mode = ~0;
>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
>      union string section = { NULL }, name;
>      bool base_video = false;
> -    const char *option_str;
> +    const char *option_str = NULL;
>      bool use_cfg_file;
> +    int dt_module_found;

I think this variable either wants to be bool or be named differently.

> @@ -1361,12 +1361,26 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>          cfg.addr = 0;
>  
> -        dir_handle->Close(dir_handle);
> -
>          if ( gop && !base_video )
>              gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
>      }
>  
> +    dt_module_found = efi_arch_check_dt_boot(dir_handle);
> +
> +    dir_handle->Close(dir_handle);
> +
> +    if (dt_module_found < 0)
> +        /* efi_arch_check_dt_boot throws some error */
> +        blexit(L"Error processing boot modules on DT.");

For this use, bool would seem appropriate, but ...

> +    /*
> +     * Check if a proper configuration is provided to start Xen:
> +     *  - Dom0 specified (minimum required)
> +     *  - Dom0 and DomU(s) specified
> +     *  - DomU(s) specified
> +     */
> +    if ( !dt_module_found && !kernel.addr )
> +        blexit(L"No Dom0 kernel image specified.");

... this (and my brief looking at the Arm code) rather suggests a
count gets returned, and hence it may want renaming instead. Maybe
simply to dt_modules_found.

Considering the new conditional I also wonder whether the error
message can't end up being misleading on Arm (it certainly should
remain as is on x86).

Jan


