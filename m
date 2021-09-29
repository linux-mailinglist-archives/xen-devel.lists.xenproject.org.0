Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2F41C036
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198763.352425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUWV-0002Zl-3q; Wed, 29 Sep 2021 08:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198763.352425; Wed, 29 Sep 2021 08:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUWV-0002Xb-0e; Wed, 29 Sep 2021 08:01:03 +0000
Received: by outflank-mailman (input) for mailman id 198763;
 Wed, 29 Sep 2021 08:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVUWT-0002XV-Lq
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:01:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff93d627-ae99-4d62-a9a3-82ddb9c2da3b;
 Wed, 29 Sep 2021 08:01:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-fptSl23KNRiKu2VoaUiReA-1; Wed, 29 Sep 2021 10:00:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4941.eurprd04.prod.outlook.com (2603:10a6:803:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 08:00:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:00:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR07CA0025.eurprd07.prod.outlook.com (2603:10a6:208:ac::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Wed, 29 Sep 2021 08:00:54 +0000
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
X-Inumbo-ID: ff93d627-ae99-4d62-a9a3-82ddb9c2da3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632902459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kNCv2JfxAmGrCKSm1zBbx09ONKsK59pscIEd/URrupE=;
	b=Wv6XhOmr1FCYyqWzbbcMR0B/+W7nAEXn7wq6aaEdhd8dWka8G1/q+Ib1Z+HcZzIcsCyKMo
	GUTOTG/0WRfln7H05zE64HDpi68XgNcUw8zkO7dSiDMf1i6MNOf89lfoiHcCacIW80dUlC
	Jl7+yGbJhsHkClODkZWqM8RFCfOuvwI=
X-MC-Unique: fptSl23KNRiKu2VoaUiReA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRskDfeSb3hwMq/cMbYH5pvdR0YRa1OdI83JLMzIA7f+6J+C09jOqggOXLwJZftQNHaAibMCZN17eZSEWefW+XtDSWDgqwVYLjgm/OFMQz+nsXvf7WiE7bEkdE8l4b8TBwDhekw0rdKhDPdutYFmOuLmWwvefFHStcLIF30tnC8O3JTZGoJ4Rcp2r2zPlyPP16Tw3B9qqIblMKT07+DkG6kOJMZF+bOnXlBHWCQIWuRSGA4SnYq3I3vuOqq9bsBoGj3LOdKADnAt2K1x3Nybj1QNCNJOriyz81o8nwCBtQCg0Ig5Vpi/PFwGiJDgAxZcjyYZqGu1e/w5XfFyYYsPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kNCv2JfxAmGrCKSm1zBbx09ONKsK59pscIEd/URrupE=;
 b=jrvzm6QtJ5Z6h76QtSrkHhOfbTnELpWq2GjWBglqCBGJyANkN14e1yV4SdIqFNuQFyfrKkdo6MRAF3Dg+lqXc3NnHmMLjDcv94kTOx9/kIFYTZY8aSUww+y9Oye9Cem4qQ1c8Zfjh6JyE8JcEXZRXlzGLhNEULduv0kEIXTgbZ3bWMWSfenmL1yohQUDkaPYnBkfAsBbVT5j0BMANgYKgnoQWIrYnPmALf/fwsaMeuPoFrZX5ZoUEZgADBaZrD/bj4WrSkNT8mrxh/5JrSFVsC8sdSEkzYXhs6ligIVeqgYwa8qJ5xzNAqUaqygTWcKTTnQ17krN4cRcfvwwuc/V/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 3/3] arm/efi: load dom0 modules from DT using UEFI
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210928163209.49611-1-luca.fancellu@arm.com>
 <20210928163209.49611-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f7422f7-8408-f33b-af2d-8e84dc0eab0a@suse.com>
Date: Wed, 29 Sep 2021 10:00:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210928163209.49611-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc9f16f5-4b17-4a4b-f456-08d9831f43f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4941:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49415EDB677E08011610E588B3A99@VI1PR04MB4941.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OcXKO1Kv+8+UXdPkGtZuw5qBOetqaQUHvbphGphGfAZfYuQe8eaMwKohlD+xmhWBpKEJq2znWA/h1ewjAqRG9kjPPOdwsN9DouAhFVbJXnb8YW1Gu3URQJeYMRoXJz6tPScnRrggiwZ7tmCFR9CkultWLfQ1cyVVK0WTBcTxSPaXwd5HRitWuc+jpgE8zWMWlr989m+Xk0ZEbFDbqbCoOuJciWc7KVva9WBccIH4YUDowjNtKeeru1ghIha9Rj0H7RYEO49yhe1cwR1lz3Fsctm4UITJekdxxSyd957paN3qBphNKh8MtL+f4mecxIJN6EDPa2nd5Q5a6GW3n31upmoLi8wOgTywpdywVJie3+YrOX++58lsYVCs0g88QmA+JNZX2MZtkFYG4LNgAR85UJybcC2ZmOPQUNgIpDmwseqROZsqHAK5Cs3aiu3yqwv6Re7GzrGBq+j1YRnP/Ak35FPcqF9XGiKEgEAzbxBkr/fPD5eZB73gi16rUhE6ypu7FgdTIOAsINSKYX3t5/aG4hIxrH/ot8Hl2ImTfcrpMBj+Toq823OPkMbGrnxRSWiYHK/v92NgmkpH7+GpXhA82AsXA+HZqgiTzHwvEiYUacbDP0hk+wkgyL/9DWF5nJeUeBtVeArhell+b431Qmr1KUy3BbiOx0EMy18HEPMDxelOVQ5b6NEcqEV/2wd2JXGFCoWcE5PWC5fqxF0K3G2IXbvy9CeQbmEtAvuqAe71AcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(66476007)(2906002)(86362001)(66556008)(8676002)(31696002)(83380400001)(316002)(508600001)(36756003)(53546011)(7416002)(4326008)(186003)(2616005)(54906003)(26005)(31686004)(16576012)(66946007)(6486002)(38100700002)(6916009)(5660300002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnhMSXlESUJ0VTJ3ZEZaVWdXMFB3MlZoQmtwTDlSRTAweXF5amk1YWEzdDFl?=
 =?utf-8?B?WFFLMFlhTENOUTdSTzhnNkFwQnBoc0FuUlVaTEFoZzZxV2k2Rm95NHlBeUpm?=
 =?utf-8?B?eHZkalI5UnQ3WTdPVU9Jdzd0TkdqYktuV3l2NmgyUE1pdDFxeVBGeHV2TVhD?=
 =?utf-8?B?K3l1b2NNbVlKMHZ2OEl6ZWFuV1ZnQmVvNW5hWVN4UDM0NXV3aXlDK0VVWmdJ?=
 =?utf-8?B?WGZWVVR0MUR0RnY3bGl1K3QwL1RGT3JpZERrejNGYTQ5enJWTDdlZEtQaHBj?=
 =?utf-8?B?NnFEdHR5ZXRVREJneS9sVmtyQW5KQm5CamM5UzJTckhzSVJocmlDMkNCNXM2?=
 =?utf-8?B?bmN2VG42NjU3ZFNnYWU3OVZFYXBJVjY1R1VqbGNRWWY5b1JFbkVOMWFkaW53?=
 =?utf-8?B?elVQTUhaeFlXam0xQzljSllMY3dYOWk5bk84VE9FbjI3S0t6a0ZWMWJMOEZD?=
 =?utf-8?B?WWRyL3ZOQnV0U24xaGJoL3lyWmJnWitVaVA5TWsrQXkxQXk5emNMV3JRUlpN?=
 =?utf-8?B?YlBqcWlzekd2WEY5b25sbTRwbEd0MmppT1pQc0c2d01yRkdJY08xdUdhNTIz?=
 =?utf-8?B?alVxQ3ZhazZNYTUvaG5zSUM3Qll3NUNTSlZXZVArVk81VE55cXlWNmR1aysv?=
 =?utf-8?B?SDNlUGdoZWdHQXNJVGtVTlhqSXBtSTIxTG8xekRlTC93VWdtMWZaSUNaT2ha?=
 =?utf-8?B?MDFXM1NsV2VmOHJzSDZvbkxoTCtwd3MyYXBRZlVXL25ETS9vQk05RVJxSmpk?=
 =?utf-8?B?ME1hYnB0c01peGtxQlVmTHVTY0w4V0UrMk56NVVWUHZuV1VuRnNhVlpwZWFj?=
 =?utf-8?B?QndoaGptTXRWMkFJS00zRThQaGY0dm9LZEtJUG1SenZEWUdacTlaMTFGaUgr?=
 =?utf-8?B?VzJiZFQ0Rlo0YktrLzRPZG42aVlhZldOOGllWDRaTmtPaVUxTUhJNFhjZFJX?=
 =?utf-8?B?N3pPb291MnM5czZRNnBVVUIwd2V4OUdVdm8zc0Nhd3lheU5TNEFQZGJTaTZw?=
 =?utf-8?B?ZTVVb3FodVVmRVNydWxQR2JEb24zWWxPMU9SVWFBS1YwNlEwYkNDQ3BCNFZG?=
 =?utf-8?B?MlBZbjE3L3NRS1pXQ3dtSFdrOHZoT0hWajViYU1FVDFsZ3lrWU40bzhhL0RI?=
 =?utf-8?B?N005dkU5THlBaFpOb092THB2K1lOSCtlYXdzMW8yOUluanRPSWVKazdNNHpj?=
 =?utf-8?B?eG1BNkhhZ2Y5bFRpMUJOcW5EMUJ2UVZYcDlqaGoxa3B6Vkt1WGpsU1d1Mlpu?=
 =?utf-8?B?dGdGMW9kc1U3V0Z0bGtGTXJqL3JDVnJYczQ0RjV3UkJEeUxYODJuRXJMTlNE?=
 =?utf-8?B?OXlqaFJYZjZoOWwyNUhvKzF0N0RjczNrR21yazJRWFdOQWp4V0NFaDJiWHlN?=
 =?utf-8?B?T2Z4czdQa3dXR09OZ3JoNURMQ0dRdnc0ZlZjY3g2TWpaaW9tT2E1K2hVOHQv?=
 =?utf-8?B?K250WFRycnE4YjQ5aFozWUl4b0xEb0F0dU1sbzE3NzN4cFdHZFBZeXJVQnI5?=
 =?utf-8?B?YjZqeUh4NGFVcGVEdDJSS3ZsdGRmejJhbFhCVmJ0RXNvTUlOMk5EKzlpdjZ3?=
 =?utf-8?B?alYvcEJkOHJNZkpGUkl2UW85S0o4YU5RTWZlMG05T2VtV05DcUJDWFJrTFNm?=
 =?utf-8?B?eWlIL0NEelRnWmo5bmFVRVg3VUp6aUtaN1FZY1dMVU5OcFEzZVdURzBrZm9w?=
 =?utf-8?B?U21jZjUzd1RPdHNsNWNDVlJCUWZ4cFg0NzNTSkpiZnRVbU1lSXJ2aFo4QmQz?=
 =?utf-8?Q?S6ti1tJXMZOrQFwnRN9yoSEEHlXv7YVRgZf8PjT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9f16f5-4b17-4a4b-f456-08d9831f43f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:00:55.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iTZB6JErxzSJAl83PGW37Wt8H+o0DFgWrGL6nX3q26Jhq9DGlFXlAMbRpeihPKmZjJ6h6zvWOIDyYWKQJTLMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4941

On 28.09.2021 18:32, Luca Fancellu wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1296,11 +1296,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          {
>              read_file(dir_handle, s2w(&name), &kernel, option_str);
>              efi_bs->FreePool(name.w);
> -
> -            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                            (void **)&shim_lock)) &&
> -                 (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> -                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
>          }
>  
>          if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
> @@ -1372,6 +1367,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      if (dt_module_found < 0)
>          /* efi_arch_check_dt_boot throws some error */
>          blexit(L"Error processing boot modules on DT.");
> +
> +    /* If Dom0 is specified, verify it */
> +    if ( kernel.ptr &&
> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> +                                           (void **)&shim_lock)) &&
> +        (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> +        PrintErrMesg(L"Dom0 kernel image could not be verified", status);

Why does this code need moving in the first place? That's (to me at least)
not obvious from looking just at the common (i.e. non-Arm-specific) part.
Hence I would wish for the comment to be slightly extended to indicate
that the kernel image may also have been loaded by <whichever function>.

Also, two nits: You've broken indentation here (you've lost a space too
much compared to the original code) and ...

>      /*
>       * Check if a proper configuration is provided to start Xen:
>       *  - Dom0 specified (minimum required)
> 

... you will want to insert a blank line not only before, but also after
your insertion (or, imo less desirable, neither of the two blank lines).

Further I wonder whether your addition wouldn't better be after the code
following this comment.

And finally I wonder (looking back at the earlier patch) why you use
kernel.addr there when kernel.ptr is being used here. Unless there's a
reason for the difference, being consistent would be better.

Jan


