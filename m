Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E741EB51
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 13:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200538.355046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGJB-0006Wn-Tl; Fri, 01 Oct 2021 11:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200538.355046; Fri, 01 Oct 2021 11:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGJB-0006UD-Qc; Fri, 01 Oct 2021 11:02:29 +0000
Received: by outflank-mailman (input) for mailman id 200538;
 Fri, 01 Oct 2021 11:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWGJA-0006U7-MZ
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 11:02:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5069137-a4a1-4543-a8a9-d415cfcac6af;
 Fri, 01 Oct 2021 11:02:27 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-T4f074yVOoyH22-5GOVMfw-1; Fri, 01 Oct 2021 13:02:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Fri, 1 Oct
 2021 11:02:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 11:02:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0042.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 11:02:22 +0000
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
X-Inumbo-ID: b5069137-a4a1-4543-a8a9-d415cfcac6af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633086146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ph6KaMbPkah9J+JxsGqXX1y6eNR6L6NWApTdufs4h/Q=;
	b=D8qfhSWcyBVoiLkWDez1YpV+N4A75TTvSeN4drXoh2PfhwiCk8bzGPmM+qVead9Z09XX3c
	Bf0u99w36l/RUmF9u77FcDBiG08zjgN2Wmx17Y1ESh1yKAH/rF526PI+w2W8J1McsllsSg
	7molv5SgT4+yCFOxZ7veGDNfiZWsVCw=
X-MC-Unique: T4f074yVOoyH22-5GOVMfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvbnVegP7m2yzbDQ/Vw5KQEzE4p5t53q0PQHitooL8tZY+FrwZpjAZeA2LNQ/3W+wTa5bFdpGp5lbjy0HOwpjElnzT3uk5J+DCRUSFT7XSSiT5iFPb0UUFSWLbgRNzKjxk6cLvitYbba3G6ZkrsAvUMBCSl16WzFGec2gBRJp9ryNXk0YeOXeVU4cPyQKHaNDeWBZ98KVFCfo1pbONKKdtX3oC+d37T8vTy7BzQrPv2ge851UC3rxUIkgEhZSbXweXkDFXosuGP14mbPGJMlz0F9KTT6X0AL8/W1oA1ON+Q+WHW8vC09yNe2udnBgJTWbRpnBneCDdSU7qzMD2s7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph6KaMbPkah9J+JxsGqXX1y6eNR6L6NWApTdufs4h/Q=;
 b=j47QE0dntEYJuLXVS2x/GGhNSQPZzVfyV1nI3N/3/FxnyMqRj0q8GkqJHBhre6SNELgilfe6MqlcJRI1JsEk9LIkIzT1Ij6ea1RhFdm/OPnthMsPlTEANRK8bHpteKNntsYZCaSOCrhKB3hI0kvVj6/WAGQFTovIOQPplzPHcns3FLQdBWYHEs72QOqEbFSUg37ChqQ0+8PBcKtFxydmNLVHGF3JOfiDNeUbklL2dgre28gz8vTLXVnSnAL0ceAVc8uz+/BL+v4eoHLPo4MTprVl13UrbKrKQRPG4PRp1xseOt341YTAuTz3k7Um+4RX1j0oj5UT518loG9IBSDLAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2fa4be34-9c69-21cb-632f-f566caf622ca@suse.com>
Date: Fri, 1 Oct 2021 13:02:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930142846.13348-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0042.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f56697d-1063-4dd0-bea7-08d984caf27a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB329507DCC9BD2A532D7417A5B3AB9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HphvIm+8SKJGM4w/KENOPeO2DSekkrsLRO9tcuxH4G+C2uD78DRBauD9LKTYFL6NDd3ZMQoRPVTh8n0227FOnFXUXOrRFT7x6agNKj9ogxPzLJoXlGWDQ9jhNa1Y+n1O5KE+fURtVw+W6r1Q2rx/iroZDevR5ctpDQHwQj5pHIpmGsrntgGJXoGr3KbbBFUZERKnAjgzer77HnIGznUoukSr3jj57OlIDjS3P5mUqDJViGk7z4QzpxO+Wprm76/iFt2PdRGDpkQNDxlOnG5tbuI6VbEn0B6DFJc8Z/gG2Gze04gGpdA5s+HcJ8onHPQulo2V6z4U3v5uREd9cNGLTjUbVZBvLdJ+z+fk5hiT3yeHWrnzmCAykhdpG/w86WogmwxbZxcfqSkpaQp/ZqdPBQTTBrpgKMhrB3nvZl3S79y8P4dn+RlR1hjVTzQuPYmrQ2YOhuwu4WR89wthsGIAqMAc0mSrycT0Uy/uOTsN6EWy7nhMPymNkgvZ+JAIVNYOQzorLKLJWJY7fq3vdUxGF8MwFb+QOPA9uNJ9dKTqtx0Acxy1+amA9EyvThhXMJIAn5tWMdh/GyrBK3jFbtm0vYaYHUX0hfIw7Bxe6wtIGgk50JKgPscuNu85+oyw2wEidniIoNLTv3P4COTr9kNUaeNZTVFO+mlJFyARAHxwq4NWbFCmfuSpRG5n5YKv3nlOs+0q2hHYazDHsbT8KamqdTtZfja7ACgI31Qou6GpKUh7zSL9ER1oGOEAI6SdvDPKSW2i1NLaijaZZ/szKuyvAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(2616005)(83380400001)(38100700002)(508600001)(956004)(36756003)(186003)(6916009)(4326008)(6486002)(2906002)(66476007)(5660300002)(31696002)(54906003)(86362001)(7416002)(8936002)(66946007)(316002)(31686004)(8676002)(66556008)(26005)(53546011)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXVKNy9WclZHK2RvZS9oRzU3L04zU0pjWk9GdE5yRnp1TVZKSHV4eEF5VUQ4?=
 =?utf-8?B?RlhpckoyTSsvZ2lHU21UYVpWOEpUK3NFNjVxbmtPaFhaSWI2K1hsWFU5TUVC?=
 =?utf-8?B?eG5Xb0RPOG9VM2FqL1JJVEFEdFVvMWN1c2ZXUkRTaXU1REJ6dnRRMTQ2Yk9W?=
 =?utf-8?B?TUNyR045TGFPTlRNcHBBM3hTOUZSS29WVkJERjBQSXVYYnFDZy91TmRENHl0?=
 =?utf-8?B?QTZTWTZ6QlBPOVArRDBFSTUyQTUzbjdEQ1N1d3owK0s0cndpRG50dXk5TUN6?=
 =?utf-8?B?WHFGN0FYNmI4VUFIZjgramk0OXo0SUo5dDJGMDJoa3BjY08zK0YyTitzcDc4?=
 =?utf-8?B?RzE3Sm4xMHNsczdTUjVUN3BYb2dZaU9MbWg1dERhRmxYSmgyTTRlODE5ODJF?=
 =?utf-8?B?TlVRcThpdmovbUdYNElJZ05xdTNRS2RXd2d5cHo2QUhSdGJTbzVkcTRBU3FZ?=
 =?utf-8?B?eGl1TlA4R1RIZG9ZejROUWNnaERCQml4U2crTWRqMHVCV0ZsV3l6SXBJWVBO?=
 =?utf-8?B?R2FKQmZZVGdxdEI2SCtZYXl0T2E1MHgzblR5V1ZPdWljd2JhbUJ1STJYTkZJ?=
 =?utf-8?B?K0FEdjEvTFIvTXgzcmljRExMM0VZak9idEtHYlJNU21xcmoyTWx2RjJoL2Ra?=
 =?utf-8?B?T2w3eFhkMjVZQnJXS3o1MnVnNDkvckZOSGJqMm9yZk54S0w3NmNFQ3F6WHli?=
 =?utf-8?B?UmhKbjFNMXU3aFhVbVZ2T1ZKclQ4cnhid0t3Ym5MMXJlek9NUm1Ta1piMkZS?=
 =?utf-8?B?T1VtUlZlOW04L0ZUWGd6MEpSa2dpNTI2U0RrR0JuR2EwczlubHh3d0pQa3FD?=
 =?utf-8?B?RWxsellON3VONjdCNzFRRjdMcUFNbWhWSS9UQUxBaTFqSjR1R2xHWmlzKzlK?=
 =?utf-8?B?aVRqV0w3alZPY0FMaDI5NU9lcmRyQjJiWnVkTGloVFdIV3R6bnFUWVAvWU4y?=
 =?utf-8?B?S0p4K3Z5YnZFN09BMU1pWU0wL0xoMStpTkFySGZYL3FvSzJCKzlBZytjbGtP?=
 =?utf-8?B?RDdmbS9nSitxUTZzYjRQUEczblRZc2NOTGY1ZHBCdGVoODZLS09URm1BVmYy?=
 =?utf-8?B?TjBPb3hKcTdPY1FvM3dNei9WczJuR0FCK2lIQW5qaFQyMnBhTkRpdjlqcUNn?=
 =?utf-8?B?RmxCTmR5UXgwWDNlSjdFV2FVL2doL01zNmJIZmxZVFlVYzc5MjhnVVFGYjZp?=
 =?utf-8?B?emN6cVNkZUhGanN5TFI2ZTVmQ1JQV0xaN2NQMlJUN0h3S1lNSUJkMEs5NVk1?=
 =?utf-8?B?VXdHd0dPVFlFUmNZa1pSV2d1MWcxdUF5Q2JUVzg3QVZzR29hZm9xRG40TlNJ?=
 =?utf-8?B?YjQzRUhCY2dmdTByOWJiWXFrb0l0NkU0UFdKZ05IZnhGdUU0VjZCWTRTZWQ4?=
 =?utf-8?B?WVNyYU16TWVabGVqZnBFZjFWR1R2ZjNPaThyeFRieWNBWnRpVVI4dkkyeGFl?=
 =?utf-8?B?Z1RPdm1TS2dZTDJONXVhUlBiOXMyM1poditGMHFFR0JMTHRNYkVHR1g1U2hw?=
 =?utf-8?B?MlJSSWJYc0hEV1U2OGxPL2VqOVlKLzdtdU9aSUxoZW5LYW04dmh6c1hhYlds?=
 =?utf-8?B?b28vVHNVbXp6a3BvYmlQYzlxdVBQZXFPdkpzVGdXRERvWTJ6QjFLWnlJQ0x2?=
 =?utf-8?B?MTIxOEZaNVo5NkFmME9oWVkvYWdtckFRRkgyL0hKa28vak1MRWMwWkxnRHd2?=
 =?utf-8?B?ZzcvdmlaZDI3QThZY084TURUQkNVbXRjSzY2ckFQM25RQk13MGtJRHo2SVl2?=
 =?utf-8?Q?xLaG72d4IbN5lZueHeTBQUg14XGrlLRZHXnQu+i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f56697d-1063-4dd0-bea7-08d984caf27a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 11:02:23.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NW++IzWQvWTvIHmjqZh8Mi4kLyPPqbZwUcD5U6h0QZdQqHrSJGnqUl1QDR3Mslwh0e1ziGUVRLST1Vlxri97bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 30.09.2021 16:28, Luca Fancellu wrote:
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

Are these two changes really still needed?

> @@ -1285,14 +1286,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>              efi_bs->FreePool(name.w);
>          }
>  
> -        if ( !name.s )
> -            blexit(L"No Dom0 kernel image specified.");
> -
>          efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>  
> -        option_str = split_string(name.s);
> +        if ( name.s )
> +            option_str = split_string(name.s);

        option_str = name.s ? split_string(name.s) : NULL;

would be the less intrusive change (eliminating the need to add an
initialized for option_str). Or if you really want to stick to your
model, then please at the same time at least move option_str into
the more narrow scope.

> @@ -1361,12 +1361,30 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>          cfg.addr = 0;
>  
> -        dir_handle->Close(dir_handle);
> -
>          if ( gop && !base_video )
>              gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
>      }
>  
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    /* Get the number of boot modules specified on the DT or an error (<0) */
> +    dt_modules_found = efi_arch_check_dt_boot(dir_handle);
> +#endif

So I had asked to add a stub enclosed in such an #ifdef, to avoid the
#ifdef here. I may be willing to let you keep things as you have them
now, but I'd like to understand why you've picked that different
approach despite the prior discussion.

> +    dir_handle->Close(dir_handle);
> +
> +    if ( dt_modules_found < 0 )
> +        /* efi_arch_check_dt_boot throws some error */
> +        blexit(L"Error processing boot modules on DT.");
> +
> +    /*
> +     * Check if a proper configuration is provided to start Xen:
> +     *  - Dom0 specified (minimum required)
> +     *  - Dom0 and DomU(s) specified
> +     *  - DomU(s) specified
> +     */

May I suggest to shorten the three bullet points to "At least one
of Dom0 or DomU(s) specified"?

> +    if ( !dt_modules_found && !kernel.addr )
> +        blexit(L"No Dom0 kernel image specified.");

And may I also ask to alter the text here, to be less confusing to
dom0less folks? E.g. "No initial domain kernel specified"?

Jan


