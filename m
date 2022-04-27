Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD414511370
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314519.532604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njcxY-0004Hr-TP; Wed, 27 Apr 2022 08:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314519.532604; Wed, 27 Apr 2022 08:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njcxY-0004G2-Ps; Wed, 27 Apr 2022 08:23:40 +0000
Received: by outflank-mailman (input) for mailman id 314519;
 Wed, 27 Apr 2022 08:23:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njcxX-0004Fw-Ro
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:23:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56be714d-c603-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 10:23:38 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-9ig4BNOlM_i6x3xx6bEYuQ-1; Wed, 27 Apr 2022 10:23:36 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB7816.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 08:23:34 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:23:34 +0000
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
X-Inumbo-ID: 56be714d-c603-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651047818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IL3Fx0qFFzIpeqVv/DoVmusloahGUNLdrxYU5jQBYJs=;
	b=NWkM2sUHRFciuatMXqDASbdV5oL0omGag8QZ1LwZqzeWj8vp9UDQVosvFelAS6hXuR7sSW
	Xpg/hXHudQQz9xRED3kRcIl//MK89VGEuq3OmybmQKalo/8Iia1Qic4Dyru83ze/YpgFAF
	A2Vjnh6pGQrKMAjDE+/bTipsnStzh7Q=
X-MC-Unique: 9ig4BNOlM_i6x3xx6bEYuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfTBvPc6IuMk6yye55zpD4kBWoBpTUDellm/Ivj8Ab6+MRkzMOoCUZI/fSF4d8ayCTDPg9ZmDBeuRsYvgKzcpaahtNwey3GnM/WV4Ei9k0fvU8o7aJU9Gm6+8FMhjdHq/yrYuvemx/T/+F4AsSPhZIF1W6IH+Paywkakj0EKhHY9tBLJb31xb5g846skxm/9J59BBCs9DOSmlcTRu9BZFpEvBwdCfmVQ08u975fPuHLP++pLrn6UHiJh4X+mWh+C7bI/8jY6DS5UuZGxrI+hUqw048wix5Pagxh8B61StsfV8HTJSCtsGQlMG3QIJrRRR9rLp6anAQj/y1VeJcv7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL3Fx0qFFzIpeqVv/DoVmusloahGUNLdrxYU5jQBYJs=;
 b=bPGf/cJ8PwgmSKOsYOEJfnYaSnqFnBHIk8z+VE3FFuUI2XxdaMfwVkRcVIc4fV2nMDO78skgvGz7gNwsMp+fg53ProqXJSBnb3M4CYAuuY3YTFHSpqyYdksEotpdCfSD/6WiQ5Z8xDhSaXDX6twyK3ewaShFG12HzG2FPajayPauCIikAI3OFasmppUkgYViS6mKpro+pKEMGMfYBdapfdo3l7KeOFPOQSYth+cuPoRGM3tCOKe/iMXbcMZIjJeaQINz6vPaCofbdRYPcJXBzbrhiyqMa6jvcM2GJy2Kigjj3AteBajYxVw7Oo/Qm7++0hRbJja4VKBCOYHnkywKEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ccd53e7-d651-434a-ad05-72cdf468127e@suse.com>
Date: Wed, 27 Apr 2022 10:23:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/4] Grab the EFI System Resource Table and check it
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <Yl7WHv6+M+eJwQep@itl-email> <Yl7X3mAJhR5ENSpl@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yl7X3mAJhR5ENSpl@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0389.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae190da5-d835-4be3-4555-08da28273840
X-MS-TrafficTypeDiagnostic: AS8PR04MB7816:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB78164564216D3856A98D3E77B3FA9@AS8PR04MB7816.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vppckT2/dfQ8r/Mr4KdGSgwRKZ+ZolFWHf4az52VBl1a6sZVr6pslYjHBzU2D5MGFWuzEkND6mXik8ECgpUXY/SaEmW6YYBmOXA7S5Vie5HMIJPXy5EHcsTcALDwr+BX3tjvlvNoL/oUmrShuQt2wj0dApnIu/zhQRP1LIuIag5j7bECfZpRpOJhgrQkzs8cpdbjyeIFgwyWcMQCkZgDK/0fil+HaTe4CsE02lUa2X5dqb34RHswagjZJxMbqZmp2M1j4eSp5H7xSxEhnuZm/bca056rJEKx2Eo6OhUD7a4A8JcoWPbWgbFsuN1qy7OQf3d0XBebGXXJklQAidYVejxmR+IT3uB7MMOonJzxJX54uPTWFaqug6NDs6SILJwpvWvPHh05SWRQrKvxSeTImlKBVJ+fyjuURtKc1t4Kc7hL4F8J7azTWzvCEuYyv9M+h/z4qN+JRM5aJPNG7tRtgeCDEOHvx0/wgaIFJclUl8931Nk0syWHcPYGVMdB+sGh4lfH2XZU1i6ZMKWJGEXY6xS6QvsYeJV0pdulwGENfANeTpkalqy4lAZJ8/fxeNEqaLo3R+Ff5sY2yXrdIzBPJCNWjABG3R/phqUaLkren8Ej6UGe2YtCf/y36NxjlLspr2nEIzq2KEwjR6sFL42pHaiH69JFsRbWG/nXFqgya3y0SS0YdBMjctbdvvj4wkeTJEzq31uLcFkuKar9B9uacipBotxqXO352kxPIWFEOwo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(54906003)(66476007)(31696002)(2906002)(38100700002)(31686004)(4326008)(316002)(66556008)(86362001)(53546011)(6916009)(8676002)(66946007)(6486002)(83380400001)(26005)(186003)(508600001)(36756003)(2616005)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzhDVlhzL3BXY0pzTW1FbXhkazJxN0txNE9NVHlsVUYxcnYzRk5RYnRKcm8v?=
 =?utf-8?B?TzNZWWFYRkxRK0RYYXZsaHNMM3NYVTFtbmFKczRyYXJDS1E5R3ZiQlBZSlkv?=
 =?utf-8?B?NUtteU9SQXFCSW5aWm1BLzNPcU9FMVBSaXVsb3JsNjI4b3B5UTFkWGMyME43?=
 =?utf-8?B?UitDUTcxUkdXYWl4Z29tN1huVGRDUG43RUN5cktEeEJMYndNYlFVa1FYUFMx?=
 =?utf-8?B?SkpVK09IRUNqblNnRGYyMDlWY3l4RjRkN3lINEtGMWI1dncxT3pHalZYVXQv?=
 =?utf-8?B?S21GeFI4OHA4bm84RlU4aUFGdmN3dElpMDN5TVZHQi8zbkd2c2E1VUxndzZP?=
 =?utf-8?B?TWNhRzB5WTZ5eFd0SGxScWlNNDJhcENUODR1aVhnVkJLVTNZdHpySWtvckJt?=
 =?utf-8?B?SWxaTjRHVUZHS1BkTEgxbEN3dVRkOHlrcWV6aW01Z1QwZ25TWlF3dXFYZWtM?=
 =?utf-8?B?RWpYbGJRbWV1RzBJNDdrRTUyNVNDYzZaWEUxcUdTT3lESXF3bTdwUFk1dWxT?=
 =?utf-8?B?U2ZXcTdhWnNUK29DZG9aUUMwZFk3bTdHQUF3akJNdk1lb0FCOW5LbkxySjYx?=
 =?utf-8?B?RDVRNFhxVGVJbUNBOWk2UXpyR1g5WFRGWmZoMDJ2UjFtcmxtbm16NWozc3Rl?=
 =?utf-8?B?YkR6d0ltUStBRTFNeEhnY1VOVzFwT21BUHRiWkF4ci96OVY1NnMzY1N6aHJa?=
 =?utf-8?B?aDkxY0IrbFhJWVRJOEJya20yTHhIR2pHOFZmSEhjLzRwOU9rdEtNeE92MXZN?=
 =?utf-8?B?LzBZUWVPYXo3NFo3YkZYYVorTFprRGFleTc4eDNGT1B1R0p0UmJOeVoxc0ND?=
 =?utf-8?B?OTdPZ2VCTTdZZUc3Nk1tRW9KQTdtN3FQWDd6VVpueVhWa0dNdTBKQks0R2da?=
 =?utf-8?B?Wi9tb3VwczhXbDlqTEZvKzRZRlhPTXJNQjRwdzRNQmRKWlhZemcvak1KbzNT?=
 =?utf-8?B?ZkhSS0NTeVJMdDlpNlN0dzViYTlPNWFpcStibnV5SllZZW1UbjV3VTVLRzFB?=
 =?utf-8?B?SUZmckdqZEFsaVJrVFZ0dkRhM1p3b0hJRWkvd1VrWnNmdENWK0k0dG84RlBX?=
 =?utf-8?B?eDZ6aGkzdUZsRVFlWldYdEtKcDN5d2F1TVh6R0JUd1N6MnhHTXRVZVpDVHlE?=
 =?utf-8?B?WlFvYVNiR3VBMXJnemo2eHZONUc2UFA2MEZHYy9YZm0vcFBDTVRzN1FzZmNC?=
 =?utf-8?B?cDI4TUY1eDMvY2lJSnhxMFZXSER1bnZ1U3NQSW1ZellyVUl2cS9Pc3JRVFRU?=
 =?utf-8?B?ZjZHVXl1YU1wRFpIREpHcTkvbHo4d1l2Y2xHTmtaRzFVVzFKblZOazZON1lR?=
 =?utf-8?B?bTlUMFZCM1dKaVp5MEpYSGxZM0RSQ042a2VnNFJoRkRpWWMzTUsxQ1NKbHBw?=
 =?utf-8?B?NFhSVVBPTWxOcTloaDZvUWdsZ1RPQTVTZGw2NGJoSTE3SmFzSWQ3MitGTUtZ?=
 =?utf-8?B?cHNmZCtHbVU1alJxcmV5RWFBUlFqdnFGaVU0blhvczBqOWhRdlVxcTU3STdz?=
 =?utf-8?B?YTQ5MjE1MklHQ2hCbnBOeGRSbVZVOEY2RVNVM3h6anFaQkQzcEcxUmRkY21s?=
 =?utf-8?B?UExSQ21PdHJCcnMyaVNzY2pYU1RKY1hrRXM0cndERktSeWFDQ0k2SDkxNS81?=
 =?utf-8?B?RCtFdTU3ZkRFYUNsMXNiTGxGSWVHT21aaFpjVkVzTkZ2UThiRnZFZ0lEeDZ1?=
 =?utf-8?B?MzhiM0dCTzIvRWY3REd6UDM5bWtOVzZtS3N6MitUL1BCY2VVZ2J3WEk2Lyth?=
 =?utf-8?B?dG9WeWsxbjRIK3QwaGlPeTNKSm85NldZTHR3TDJaSEdwbVk4YUlwNDNBcDdn?=
 =?utf-8?B?THFFYjI1bW83Vk9nNktvTUY1Y0U4UEhpNU15WWxTTHcxOTFKNWV0VnpJWXF3?=
 =?utf-8?B?MERvYU1EVjdrelk1dTJyUVdCUWk3ZHJ3Sy9SS2wrM21TMnBUbXBWY20zRDF4?=
 =?utf-8?B?VDJ1T3FTdWI3UXczWFhqMWI4Q2pkOGQzT0xUK0dNbnQ5YnVpcUdtZnd2M1dn?=
 =?utf-8?B?cDdYdXVKQmhzWEVONDAwSjd1T2phdDNNMVZwMlJ6bjlwSHVVak94VHVmWHJL?=
 =?utf-8?B?eFFjeHU3dlV2MzBIMXg5K3FRclRsdWZOUGNSSGNOV3FocXNENlRUSXZXVkFn?=
 =?utf-8?B?WUdhMXV6YUhDS3pEUXIvMjNQUkZBeXl6MEdhM0dqVEFEckRyc3BsUlM0VGNY?=
 =?utf-8?B?aFJjb0tSMExoNTI2WVpXS1UwUmVNN0dLaFJFb3RmOWpmeTJDazBXT3hLV2RI?=
 =?utf-8?B?SVEvZzU1Y3VSa0o0V2FnK0dVdHQ3WGZWcVBzSU1mMFRxK0dXaUNFM3k3K3ps?=
 =?utf-8?B?alczdUN5TThBUEdEQ0h2T1o5RTBrbVgxUVVhYlpiQUpqdEZqTi9Sdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae190da5-d835-4be3-4555-08da28273840
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:23:34.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3B2zkbhMeXvjizAj8aHUNUWPtSiya16wdTkvA5c8YDm3hgAagWCs7YXXmDRzSmJJxo++yBjgT7wfaPZRDVOGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7816

On 19.04.2022 17:40, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -171,7 +171,7 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
>          {
>          case EfiBootServicesCode:
>          case EfiBootServicesData:
> -            if ( map_bs )
> +            if ( map_bs || desc == (EFI_MEMORY_DESCRIPTOR *)esrt_desc )

No need for the cast afaics, even more so that it casts away const-ness.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -567,6 +567,38 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>  }
>  #endif
>  
> +static UINTN __initdata esrt = EFI_INVALID_TABLE_ADDR;
> +
> +static bool __init is_esrt_valid(
> +    const EFI_MEMORY_DESCRIPTOR *const desc)

As indicated elsewhere before, while we want to have const on pointed-to
types whenever possible, the 2nd const here is unusual in our code base
and hence would imo better be omitted.

> @@ -1056,19 +1091,19 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      EFI_STATUS status;
>      UINTN info_size = 0, map_key;
>      bool retry;
> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>      unsigned int i;
> -#endif
>  
>      efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
>                           &efi_mdesc_size, &mdesc_ver);
> -    info_size += 8 * efi_mdesc_size;
> +    info_size += 8 * (efi_mdesc_size + 1);

What is this needed for? Does this perhaps belong into a later patch?

> --- a/xen/common/efi/efi.h
> +++ b/xen/common/efi/efi.h
> @@ -10,6 +10,23 @@
>  #include <xen/spinlock.h>
>  #include <asm/page.h>
>  
> +typedef struct _ESRT_ENTRY {
> +    EFI_GUID FwClass;
> +    UINT32 FwType;
> +    UINT32 FwVersion;
> +    UINT32 FwLowestSupportedVersion;
> +    UINT32 FwCapsuleFlags;
> +    UINT32 FwLastAttemptVersion;
> +    UINT32 FwLastAttemptStatus;
> +} ESRT_ENTRY;
> +
> +typedef struct _ESRT {
> +    UINT32 Count;
> +    UINT32 Max;
> +    UINT64 Version;
> +    ESRT_ENTRY Entries[];
> +} ESRT;

The names in the spec, which (as said before) we're trying to follow along
with the gnu-efi package, where we would generally be taking things from,
are EFI_SYSTEM_RESOURCE_ENTRY and EFI_SYSTEM_RESOURCE_TABLE. The field
names of the former also don't all start with "Fw". The field names of the
latter are still quite far off of what the spec says.

Also, why did you move this here? There's no need to expose things in a
header which are used by a single CU.

> @@ -269,7 +270,7 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>      case XEN_FW_EFI_MEM_INFO:
>          for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>          {
> -            EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
> +            const EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;

While I don't mind this change, it also looks unrelated. Perhaps again
needed by (and then supposed to be in) a later patch?

Jan


