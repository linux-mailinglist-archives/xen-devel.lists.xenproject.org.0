Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D659E44634E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222248.384335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyDC-00078w-Df; Fri, 05 Nov 2021 12:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222248.384335; Fri, 05 Nov 2021 12:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyDC-000774-A8; Fri, 05 Nov 2021 12:20:50 +0000
Received: by outflank-mailman (input) for mailman id 222248;
 Fri, 05 Nov 2021 12:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyDA-00076u-MI
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:20:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cde1e27a-3e32-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 13:20:47 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-fYk34GgpNYK3Ngv_6Zopyw-1; Fri, 05 Nov 2021 13:20:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Fri, 5 Nov
 2021 12:20:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:20:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0054.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 12:20:43 +0000
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
X-Inumbo-ID: cde1e27a-3e32-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636114846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDqEUN4ssFvG7PbZpz12I1u9v5m0rsvpqScC+frE0dQ=;
	b=hgy0SfUunOCFAW+2VakQP0ycT1khvu64IGNshgnQwf45nT9hL9PRpCuVrkNG01SzFGpp80
	krUusRtFatIyb8Usf46gPt4ZcFuOJVGkAVksT73jgkpqFSjsc0kwcq9XcXoHAknXTbaWoH
	rod6zIU/YAZaYogi/JD6GhTOoAK/44c=
X-MC-Unique: fYk34GgpNYK3Ngv_6Zopyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePs1oEB/Vu9AYAITyjGBgiqGdyZJCHucQ0uWw30vEgmJkLUUGxXQzHinewyEOYODlHGv+87AQc0D3kCUS59NF0qkVUPVojulwSH7PST4ebuYbjIvqdWGxjcYX+vwFohA0+PFPo5BWfMdNFQnSvAgvewZKcZQWaDJcs87Da/7ozYKBsRmAnBdSC92L2/xap80iaE330NopDC0m80MRSW0xSXG4OhFUjOOzfmaMgNJTkOv5vNgRWzg4tTwRRxIczjX14qBxUjhBiibGltv+0PpJsf1ZZ+M5rmJn8XUS3EiXULpF1QgcVXV3ELj7mHd1FwS46TE7DS0dWulCk3fZQStAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDqEUN4ssFvG7PbZpz12I1u9v5m0rsvpqScC+frE0dQ=;
 b=c6l+iPVxhMynBkjTVDBpAnIO+x+7BAX2HlfDH1R2V5cpXsQUom8Lu1K7sklyIXWgLdTXpNRcEXNhazFE1OQ0yWNKiRsoPCjf3MMTKN46xi/X5qaeO00dZiEm3jK7L70cPj6OMxzIXk5WMYLZddY5ljX10p56F4ZpY8mQItTDkmVP4ZmaSi9gJB0I/XOQZFai81mcVe4DVA3a/7sjTNHk0PfGOkiybQs0HmuPNSpjZ43W/iFofRuD1/7WcpL52oS9RTTjrH39eBmjkGrV2nwihyeH3XJ9CWlPc6aAWzge1RjrUKIARwU2smLPERuRQ/XQgOnkc4ZFhgRmxaP3v+/rTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e10f21db-3533-3c72-b3d7-7857f2f28160@suse.com>
Date: Fri, 5 Nov 2021 13:20:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v3] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com, iwj@xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105112148.48719-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105112148.48719-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0054.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2264d9c1-7d9a-4f80-cad6-08d9a056b064
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233304F77DC8D98BFD62CFBEB38E9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oy8ZhSJx/SxyI7p4FgQmDOYy5C/CArZoDe9zQX/D+LGvtTYPpV+/+0xwD3W4XfjF/yTq6frxA7rqsclu0zO0E1Se0ijfJCHj6BLbw6H2+jdYBB6WcXMHxTYFaErLDFgzZtQC/O8XVrSBbPhlRXj0io4nwyT5YMAGs3urOjfmjzL2hI/HkMzsfHiXv2V3vjiI8V6t7wDVN4ftkEdnvkbpkIsLXqFD5Vtff6osPSLB0rqVNPPQ4nulI4ogZ/sI1x+wXGf5bYcM3oYOwe9syXYGyZl0wMgEgbkiM2K5PJM9yi18IWozWNgeJNJekzHnjQcA50dNDZuno1wezvS/pJcE4Fguves/ny5GpZy97NPM8tE8G1uC++5HsClQZ/5C32D9lTlkLjoWeZPheR2Xl+IzHJJf6+Brl5fxFU96ifxY7+3uj6FCbbSD8+F3ITADSdysC2YjRbBLgD1FCpgNGjqnJ0GgaRsiMbHMZtwPrW5RM/13XmjnN5Clgz/N4spDP+pGRlem9tGq6RNYsd0o0xssQj3mjbHMiJ8tilQwbdDNJfqItXAGw06Io7wYYbCVVqBbpC9xGqKzzx8Q9aJGmYoT8p7gWf2V05l4Y9tfT6H+Wtlg4VSw+aVgFbXLp5+oRW6wo3gPYhzfr8zsCBwL6CYKBf5wQ9kNPzT5i+OlGwwM+Gb1LQhH1yrKLCZOyTWYSyiqkNWLwinvQcmYhShoOYyl0M8HcEpTPOqa1M6KRPhZUKovaPOILKOHw8lo6eu6rX2W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(5660300002)(2906002)(31686004)(8676002)(6916009)(53546011)(26005)(66946007)(508600001)(8936002)(54906003)(31696002)(86362001)(2616005)(38100700002)(83380400001)(36756003)(4326008)(16576012)(956004)(6486002)(66556008)(66476007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUh5eEFjSzNjUHRGTDRzQlp5WW1CZklwdmdyaHdpaE1Sb1BDMDE0ZUc5N0dj?=
 =?utf-8?B?VTYzZkxWU3dlMUJiOXR0Rmd4cGR3ajhHclU3VkVjN0NmL0VYOGgwTzNGYlNU?=
 =?utf-8?B?bWxobUdJUUNpc3VUZ1ExZG04bG92Q1VBRU1ob3grMXRkUXlJeHVXWlRKL3NV?=
 =?utf-8?B?SnJ3OG9qaHRJZW1oQ0ZCMUlRUlNTQkY1dXY1cTVPTTIyOUkwL0taUDNXOFhP?=
 =?utf-8?B?MXQrblova0I5WUtENmNqcFk3RGthTUVObS9pK21OTHBjVkV2U2NTUHZzY3RW?=
 =?utf-8?B?aDk2UUdHbitXelRFM29RZGNqVk9pQ3BIL1JFT1I3NUswQit2aDBnVGdTN2pp?=
 =?utf-8?B?M1VtclcvdEhOWHMxdFBUSXIwTUVEQitSQW93UXhxd05yWUU0aWZVR3R3ZFVB?=
 =?utf-8?B?czlBTHlpS3R3NEFzK3B5SFk1cWpQelBiSDRueGtvVVhzN0I1aElId1IvSDkr?=
 =?utf-8?B?c2wrS2pjS1dtT0JsVldpY28xR2NEUjRicFhvQW9qNzNEUytBVk5lZzJ4Wmhi?=
 =?utf-8?B?dFVqOFNmem11dnUrRko0ZUxGb1lULzUyU0FBK1FVVktOZUVwV3kxR1h2NHB3?=
 =?utf-8?B?ZEFaQUpBWC85SEIrTUVxajFuY05Zd2NJYmJwRDBhbzFtNDhxMTg0djU2cFMx?=
 =?utf-8?B?SERYc0tKaHRzbk1XTTN0aFMzR1JCcnRnNlZ3RENBMHNQaVBQQ2VlSnR1SWZw?=
 =?utf-8?B?a1UzVUJZcnhlZFBtRklTWXNFeFRSalJVRVFmdTltR3BiNmZNL1NyL0ZRNThj?=
 =?utf-8?B?a3FJNE9uNERsZUg3cVFtN3hoNUxYd3NtcjV4SUErUDFPK3BycmdBZGhDaGhY?=
 =?utf-8?B?WWdacFlXa1pONUVMSlVrbUNyT3o4T0pNNHBwZERZajZ6M0JnSE9UN2dvOEJ5?=
 =?utf-8?B?WUcyQzBOUkFCK3U5TFFHc0ZnUFI3YTBxRXdLcVdMUFF5emVlcHV6VFhJVExq?=
 =?utf-8?B?ZFdWTUVBdFJQREtuYWxESnNBMXdiend0Z2dBamlHTDFZK0poYjdVc2dCSXBT?=
 =?utf-8?B?SHp6b3krNElGWUlmaWJkZnpvYWhZUnlnVitOeDBPb2hrREhWcW1ITTg5NUpt?=
 =?utf-8?B?UDVwSEhwUEJWTFJ5VXp3V2NBeDd0bkw4eU1rbVM0d1h2UXEvQlJoR2NSQms5?=
 =?utf-8?B?d2hwV1pYVGs2b2dwVFVpL2l5aEFjTGdOdkdRYUlWNks4bW9hVEVyZWxRYjA0?=
 =?utf-8?B?b1ZVZktjZVJ3V1dXMnlVRm5mRWlCOWpxWFU4cFNXY0hxYjFFVDZlVmVmNTB3?=
 =?utf-8?B?a25vRDU4dW5vMWVtYVdsTkp4SmdoQ2RpTTZVd0xWbU9ENnBHOCsrUVdUaVU2?=
 =?utf-8?B?dFU1V2pUQ1grSHFkTGxnbzdpQm84WDVtSC8rRllHenlTTzRtcXRJZVo1SlZV?=
 =?utf-8?B?SXlqcUxNenJOZm5yN253Qjh2d0Ivclh5Z2U3Nlk3SjRRQ3VmYmlUY0pLbWZN?=
 =?utf-8?B?VDg1RlM1c0pzL2ttcHpXUXdqSTlYODZPNjBxbk5yQTBua0pHTDN4akdVN0pY?=
 =?utf-8?B?SHFobFhuY3BTRDRpU2FHMkFNOVBkQVUwSlNOa241bmpRNGdiTVNhWlZ6czJ3?=
 =?utf-8?B?K1lZd09xMCtjL0lCUjByWHdUOEt4U3JkUzZrZVhNL1dCK2lma1o4NFZWRVly?=
 =?utf-8?B?OHp1TFIrRDQ0d3g5TXI2bHNXekhCOEIvRlhFdlljSkU4aVo2Q3dMVHB4aWd5?=
 =?utf-8?B?cDdUQXJhM2pkWG1PQ0pVV21Zb250S0JhQ3VZU2hjM2R2QW41V21oSmE3NS9S?=
 =?utf-8?B?U0x5V1JJNG1IQlpjSXdhOVlRMFoveGRkYVdyQWJIK05maFhaTnd1ZkNTYWtq?=
 =?utf-8?B?MG4zcXErVW9SQUU1cFZzNUtFdEczUmlaelQzNXFPYnBFQXBIK0o3WVVxeGYy?=
 =?utf-8?B?WEs4dHFrRDJXZkRFelAzUTV5bTg0Zkd5UmtlSnNXWnFmbkFwTXUxQ3NnWm8r?=
 =?utf-8?B?QlRkVmtUdFFUY1I3Sk16d1A0dS9XU3hFUjNIeWZTS1Bib050YWs4SnMyekpK?=
 =?utf-8?B?b0VvbmtxeWVaQWFMWUF5M2QzTWFXQUtBeGZWMlU5OVFYYkkzTWNuZ2FpWUpR?=
 =?utf-8?B?cmJTR1hoUTJDcmIxWDJiQnNqaGZtbGZuM1UyMmNCWGQ4OUw5Tlg1NUpBcGZl?=
 =?utf-8?B?THkxVzgwRzFCWFc3ZEx3anM0K2ptWmlwUjVld1VyQ05WOXpscy91OEFWVjRh?=
 =?utf-8?Q?tFY57yZ+STm3ntsOIm2zE28=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2264d9c1-7d9a-4f80-cad6-08d9a056b064
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:20:43.7722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxGOKb0H00aKkfhI4a5YuqQ0RE1P8FSxf54iOoogoyavEbRrLr28kcdwslWDaKo9SLLy276yYpbplATwOqFgIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 05.11.2021 12:21, Luca Fancellu wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -121,6 +121,8 @@ static char *get_value(const struct file *cfg, const char *section,
>  static char *split_string(char *s);
>  static CHAR16 *s2w(union string *str);
>  static char *w2s(const union string *str);
> +static EFI_FILE_HANDLE get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
> +                                         CHAR16 **leaf);
>  static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                        struct file *file, const char *options);
>  static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *name,
> @@ -167,7 +169,7 @@ static void __init PrintErr(const CHAR16 *s)
>  }
>  
>  #ifndef CONFIG_HAS_DEVICE_TREE
> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>  {
>      return 0;
>  }
> @@ -1225,9 +1227,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>  
>      efi_arch_relocate_image(0);
>  
> -    /* Get the file system interface. */
> -    dir_handle = get_parent_handle(loaded_image, &file_name);
> -
>      if ( use_cfg_file )
>      {
>          UINTN depth, cols, rows, size;

With the dir_handle declaration also moved back here (as I did
indicated in reply to Stefano's proposal), ...

> @@ -1240,6 +1239,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>  
>          gop = efi_get_gop();
>  
> +        /* Get the file system interface. */
> +        dir_handle = get_parent_handle(loaded_image, &file_name);
> +
>          /* Read and parse the config file. */
>          if ( read_section(loaded_image, L"config", &cfg, NULL) )
>              PrintStr(L"Using builtin config file\r\n");
> @@ -1362,14 +1364,14 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>          cfg.addr = 0;
>  
> +        dir_handle->Close(dir_handle);
> +
>          if ( gop && !base_video )
>              gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
>      }
>  
>      /* Get the number of boot modules specified on the DT or an error (<0) */
> -    dt_modules_found = efi_check_dt_boot(dir_handle);
> -
> -    dir_handle->Close(dir_handle);
> +    dt_modules_found = efi_check_dt_boot(loaded_image);
>  
>      if ( dt_modules_found < 0 )
>          /* efi_check_dt_boot throws some error */
> 

... all of the quoted part
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Down the road we will want to constify efi_check_dt_boot()'s parameter,
but that will require changes elsewhere as well.

Jan


