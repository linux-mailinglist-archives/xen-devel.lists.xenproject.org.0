Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385B4AB6DD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 09:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266554.460240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzfX-0005xs-He; Mon, 07 Feb 2022 08:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266554.460240; Mon, 07 Feb 2022 08:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzfX-0005vP-EN; Mon, 07 Feb 2022 08:46:43 +0000
Received: by outflank-mailman (input) for mailman id 266554;
 Mon, 07 Feb 2022 08:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGzfV-0005vG-UC
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 08:46:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77256537-87f2-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 09:46:39 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-RED-pm_0NTieZlRUkgnRig-1; Mon, 07 Feb 2022 09:46:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7063.eurprd04.prod.outlook.com (2603:10a6:20b:11e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 08:46:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 08:46:36 +0000
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
X-Inumbo-ID: 77256537-87f2-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644223599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxlGo5YVbELHevjqX0pMZXl6Q5m9uHmz6oHkG3ocQqc=;
	b=GyBMpwDTwpnfBnN4X+iwCb4K7n4YBzZLqzW3VP4ot2A83QQFtdl0H7qW5UNlsMcozwP1Wj
	wKtLuyGzZkFHbVaYk87HAxAIcjFmxc6pmYweTIRvFsqKhQtylmB4Li2zMKmjHe2wsp9F0T
	tiCRWWtwLK2WgX8sSGr26NZiRl5f/0M=
X-MC-Unique: RED-pm_0NTieZlRUkgnRig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOIb9WFdhu3EOVVQ0iLUYBQPeT0fi0Ksgq+yI43vhq7W4PVawveVzPeFX5mEDZ+75g1gJ3UT2eMbniawLs1uJPQ7JC41fEZvZKs+WxOLJAAR9eHvVSS5XA0w+RG02FXj/Z/rAVu5TNr/kI7IUe4EwHJJjBAqOp94OQ/nk61kYhZ/nt7HIpVBVkJsk66S2qNVRzME7CPOGJmd+NgSj2wAB9wvAgCRqi7o3mOKZsQsVazDMbDCW6UfJHAc6jvrSMV8gpfWsV/E6Lcy9i8sc1jQR2VXymj6ZEm9LXhS+7aeXknlSn35/VzFKRfqmnDBXCD4I9ymRm+pEFqli5Gz7JqiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxlGo5YVbELHevjqX0pMZXl6Q5m9uHmz6oHkG3ocQqc=;
 b=XIHAIvX71hifnvhefRDZL4JxDXgYsEMooI135VrkYroASpNe0HtVLzaMA8cwtzMj0D2hfmSyMGJh7sFhct5VQrW59ENinHDvdMrhcoFQQAKSlqgbPTwZelrlJFQO0z8Ja53QCUrT8Uyih5S8CgxR9PDHzxbctVUxCIE0YIwHdCmjpXudgpVmTeUHEnGRDL3aq/H06RwCE+/g55Jh9R+KO7RhEuaPPhRpuDEKAkOdq3S702nJ6eZDgkXXbrUrcanxkuVno0DytXZJd3prU7eZ11lqawLK8msp/t/ofdFj9xRJX+0e6/lzn0K4qWgktWcmZsTJ+jM614wqA9nqIaqP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88741681-929f-4cda-e841-023bdbf8f772@suse.com>
Date: Mon, 7 Feb 2022 09:46:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 1/3] xen/efi: Always query the console information and
 get GOP
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220206192839.75711-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64d8f6cc-130a-4fe3-5ce3-08d9ea16593d
X-MS-TrafficTypeDiagnostic: AM7PR04MB7063:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB706368D8649DCBBBF768EACCB32C9@AM7PR04MB7063.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rKWI8c1MNHopPALXgeWKEtnDwkvvR+K14WbrfOJ5jlN1WADmYUlA5rnJ5euzNUfoYk7B+Fl30GXqrQVs/pLuIXuy/jy1g2EXKVkNaP2bYrxtoFC11EVBWdlWutCSd2koXD0RcSudPENeKr8F7+L9RZit7xPd6UdR0tmZwP+BGTi1Bu81BBA9sQutm0gdCTMssFGQp9oBjF5t1dglF6edbopF1p61VocaM296GHBiHFoTTEKN95fpFC9Q0cB0IFHy/e0wzkgvBMS9RpVxVI7qACRBECSbCK+VtOedHrAHvQx/QWxVP4m56FS9HWiDvfunzI1zCz9BJLcIAblHJEZ29sIs816Xd1/FXTomjBTg806QuTjtvPIsh5sUrH7EOfW5aa6PzUhAg3X1o3fvuhb/mzSw/fV6jbNlvujQ7ey9i2O1CPnJGlTECazmDTMgOKCUtT7w24Hn2NVTRWAcMGeT9mKWRid8YX+Q0Mr/E/Yz1WpCfruPusbM8XI7efpKG9sdRpowLHI5+4mC4Zmj4XUpx6Gn0qmXCHEs3JYk2O5v0WilqSwp/lO6LjiHfFS8VEnebOyf84toVBsmraJPATcNGsH/+c6wX5jrQ8PNQCGZ/g8HAjkCECxXZGzwkP6+vWT69qUDo182e4KSp+JdmgIlCJU50FiAIan8WUNm9FjFI8OzZSioS9a+lJ7QMGCUXfO1/zQUbMPmGWdwX4WQwx/mOOydwEvsNhvmNm9aTXNCK9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(26005)(186003)(54906003)(6506007)(316002)(6512007)(6916009)(38100700002)(2616005)(2906002)(31686004)(53546011)(31696002)(86362001)(66946007)(5660300002)(508600001)(83380400001)(8676002)(8936002)(4326008)(6486002)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFZEWXhFeTNaMTBTd2FoZ3BWWUZMMG9jQ2hSOGVrdVhaaVVkNCtlZXNCWmE0?=
 =?utf-8?B?dXdXRUtpWmpFWmc3VHRLRmFYK0dva0szcVpGbld3LzVzL2FkS1NsTVB4TldZ?=
 =?utf-8?B?cFFtM3RhYWd0N2xORmh1Z3JZd1h5a2h0emdOQ3ZmcnVYNG5DLzR3TjVrRTl5?=
 =?utf-8?B?ZXl1QllqWDRHa1MrZmJER3pyV3RkVU9kZUtRY1ZkemNpU243QkN0WGhoWDN1?=
 =?utf-8?B?SThXY1VKdS9MNnV1YTNTOWFpTWdWUHpvKzY3eWZGM3FhdENDL1RtbTFpa2py?=
 =?utf-8?B?clNqdVJMak9mdU5jOGpmdUpIN2dkdmJiZEtyMkN0R3MycGxhUVROem5PRFlx?=
 =?utf-8?B?aHJ4SXhrcVN2UXk3TGRRVVU1WXhLSXJRMTR2eUI5akF1c2M0RzR0Y0ZZMWt4?=
 =?utf-8?B?RmlhTmY4U1dIa1dhdDFuaFFBdHRacHdhcVVZc3hpYlJ4MWNuVm5nZjVuQXVW?=
 =?utf-8?B?R3pDZSt6eThMUnhkMldLTWJxQTl2dTBGdGdjTDFXc1NaZ0tuejJlbFZjd2sy?=
 =?utf-8?B?YjI2R0dtL3U1QjZzNnhNZW1XV1pCR29FMU4zaEJnaE9hU1JMOUdGZkRrOENo?=
 =?utf-8?B?NjNsbEQrbk1ONUVaTXEyYlBJZGNQWnVBeWUyS2Q2TFFyZ3o4ekZnb1FZaU9S?=
 =?utf-8?B?dFQ0OHEzYkN2NUVmM0duQUJMcGFzbTJZVURidDc2TTVrVXpqY2NSaTBtRmQv?=
 =?utf-8?B?em1jYXdIM2VjRklOR1ZXdDF2UmhhQ2xKdFl3THhnRE1RY1pmd25BSHUwck1T?=
 =?utf-8?B?cU9iVytzQXVaajNGeWZSVHNBby8yUVVVSDJkOGhFSEoyVVlOWWhaaTRGT2Nt?=
 =?utf-8?B?RVBzU2NUNHI5RWI3ajdRWjdsbDA5R0VrbGhzUW90d2JNdUJvNjNsRFl1WWE5?=
 =?utf-8?B?M2h1TkxoSlFKZUlHMERkV3RMYS9KVTl1SlVtZWozTEVpVndzcFVMQWQzNWhE?=
 =?utf-8?B?cm1aY2lQZzFlRmRBNDZWOEJkT1d4R0x0M0V4WVRBZzk0NlVEYTkxZkxLQVFm?=
 =?utf-8?B?ZTV0a2Rjd0JsMHUvczlpVy8zWGtOZ3d3b2xxWndVQ0VJcmxmdkR5TGc1Zkxo?=
 =?utf-8?B?YkhPbzBKbjM0Y3dSdVJYRkh3U0I0SDRMeEs5KzRlYnNtU3QzdlcranlvY3Yr?=
 =?utf-8?B?NitSRHlCb2N5dUU2UW50enF5ZFQyckx5WE1BZmYvK3BOVGdRTzNFcFNBQy9l?=
 =?utf-8?B?S0NXSEw5cDE2b1dKUUluWHVYZk9nTURNTFlCWjE4TDBUM1ZwL0tLU21KK2Nt?=
 =?utf-8?B?WWk0RzBydWtVOHFQRWorckdFYUJ3UnNrU0VTWkM3NE15NmlxVjdBWE11dm5W?=
 =?utf-8?B?aUVwcHIyYk5sV1pjRkVoVktSeTgwVGtPUU9LVmtqWTlFRnpxOVRkQmp6V1hv?=
 =?utf-8?B?am80TXZuSit6YVRVbWdFVDNuaGhYR0JGOHZYWVVwT0lxRFdNaDZTSXk4cDdo?=
 =?utf-8?B?S0FvMWZGSndhSGwzVXNNZmNxYm9GU0ZlMldJYnhXUllrWktzeFRBd0xSTFBv?=
 =?utf-8?B?Sm9MaTRIVGdLbERTNHZ4RlVUUEVGODZkNHVtOU1idzY2ak5UQWx1UWw5NXZj?=
 =?utf-8?B?VTI1ZnVLb1UrTDlmcU00ZkFuZ0E1SjhxbmRyUm9ZSDRwbE9QTFZMY2ZUcmxM?=
 =?utf-8?B?UzIzeUdNZU5WQTlPVjNPS1NyWTFNbUwyZzNYNTd4VHlyVGI5cy9CRDdKM1A4?=
 =?utf-8?B?NHVOY0RQL0dnK0gzYkxSVm45R1VIL0t1VGdVK3R2M0I1YUdnSVp2S281aCtp?=
 =?utf-8?B?bDM1L3d5UWFNelltQktmL0VIaEFobmIwZjZ0THo5TWdnQ2ljcVBqZmVtVXJh?=
 =?utf-8?B?NVc3OXRwcmdUNktRM3hId1FPUEtpZ1Q3S254ZDltL0VrL0hOVWlzL1Ara2wy?=
 =?utf-8?B?UFpNYXFHY3BVUC8vWlpnMmFZTFpscUdLakVMZnJENlVqNzdVMkNrKzlRMmhQ?=
 =?utf-8?B?UmZxVXpGbzRtUkJIb1NmdVFHOE83MW56di9DbjJLa0pqNHdyZTMxOGF0a0ZD?=
 =?utf-8?B?ajNMTXhzbkp4eDRwMjd5Vi9JWjVPclNOdElidDY1TkZNWjZUZ0JkM3Njdkho?=
 =?utf-8?B?YzlEMTBMZWZLNEpQOHN3NlBRS0E2aVdTYTA2aTlrN00vUnRtR2krbkNmMmla?=
 =?utf-8?B?VVBWTGpzcWhTVUppOWlqRExvM0VsSVR5cHQwN1NtTVlxTExPc3JmQUNlSDhx?=
 =?utf-8?Q?EnwgM+hWJWTbd75Pg3g2dIc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d8f6cc-130a-4fe3-5ce3-08d9ea16593d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:46:35.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mH2D6xfXLXxxroj2Nv8lw7d1fE1/5rU+HiLMAyjbuZFodF9Igl6QjW8ZDKlrpjZvmOOmCH350zavyNPdzkrZ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7063

On 06.02.2022 20:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, the EFI stub will only query the console information and
> get the GOP when using the configuration file.
> 
> However, GRUB is never providing the a configuration file. So the
> EFI framebuffer will not be usable at least on Arm (support will
> be added in a follow-up patch).
> 
> Move out the code outside of the configuration file section.
> 
> Take the opportunity to remove the variable 'size' which was
> set but never used (interestingly GCC is only complaining if it is
> initialization when declaring the variable).
> 
> With this change, GCC 8.3 will complain of argc potentially been
> used unitiatlized. I suspect this is because the argc will
> be iniitalized and used in a different if code-blocks. Yet they
> are using the same check.

I'm inclined to suggest this wants to be a separate change, with its
own justification. You're not touching any use of argc here, after
all.

> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
> It is not entirely clear to me why the GOP was only fetched when
> the configuration file is used.
> 
> I have tested this on RPI4 and it seems to work. Any chance this
> was done to workaround an x86 platform?

This was done so in the context of making the code work for Arm. See
commit c38cf865ec82 ("EFI: ignore EFI commandline, skip console setup
when booted from GRUB"), the description of which explicitly says

"Don't do EFI console or video configuration when booted by GRUB.  The EFI boot
 code does some console and video initialization to support native EFI boot from
 the EFI boot manager or EFI shell.  This initlization should not be done when
 booted using GRUB."

What you say now is effectively the opposite (and unlike back then
x86 is now able to use this code path as well, so needs considering
too). Cc-ing Daniel for possibly having a GrUB-side opinion.

Jan

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1129,9 +1129,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
>      EFI_LOADED_IMAGE *loaded_image;
>      EFI_STATUS status;
> -    unsigned int i, argc;
> +    /* Initialize argc to stop GCC complaining */
> +    unsigned int i, argc = 0;
>      CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
> -    UINTN gop_mode = ~0;
> +    UINTN gop_mode = ~0, cols = 0, rows = 0;
> +
>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
>      union string section = { NULL }, name;
> @@ -1219,18 +1221,16 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>  
>      efi_arch_relocate_image(0);
>  
> +    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
> +                           &cols, &rows) == EFI_SUCCESS )
> +        efi_arch_console_init(cols, rows);
> +
> +    gop = efi_get_gop();
> +
>      if ( use_cfg_file )
>      {
>          EFI_FILE_HANDLE dir_handle;
> -        UINTN depth, cols, rows, size;
> -
> -        size = cols = rows = depth = 0;
> -
> -        if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
> -                               &cols, &rows) == EFI_SUCCESS )
> -            efi_arch_console_init(cols, rows);
> -
> -        gop = efi_get_gop();
> +        UINTN depth = 0;
>  
>          /* Get the file system interface. */
>          dir_handle = get_parent_handle(loaded_image, &file_name);


