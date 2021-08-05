Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B511B3E0F29
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 09:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164189.300430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXmo-0006Gz-LA; Thu, 05 Aug 2021 07:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164189.300430; Thu, 05 Aug 2021 07:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBXmo-0006EM-HW; Thu, 05 Aug 2021 07:27:26 +0000
Received: by outflank-mailman (input) for mailman id 164189;
 Thu, 05 Aug 2021 07:27:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBXmn-0006EG-Cs
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 07:27:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bded5380-e654-4f15-894e-e7ff4a6969a5;
 Thu, 05 Aug 2021 07:27:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-bnWks8piOmyj6fwLaJyEpQ-1; Thu, 05 Aug 2021 09:27:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 07:27:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 07:27:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0059.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 07:27:19 +0000
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
X-Inumbo-ID: bded5380-e654-4f15-894e-e7ff4a6969a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628148443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzKWbWcn4o74WX1CefrhNZw6LYIzIxlSlEJygoPHE0U=;
	b=UxKVbXF2J1Soi8bxH2EgA3YhXF5yP5li9jS266VD1P1TTFO4oNFO6LMSy1ro2nnzDAoeHE
	be8ufY+/xqsDCoq8sPhv0rhWoz4dHZD5skP2qRpaOcMnIBs7dmRiRt80lIuTF+OSeYMHmf
	kX0Mo9iDLfBPy+iZP+td8o3tkZQ2Mjg=
X-MC-Unique: bnWks8piOmyj6fwLaJyEpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jc9BLaca+yWj/mgB+XIn2gQ9brEcdir1OBnQwxPb0/egbYYUafu4Z3cmpd/lVNqpzVyDSrC5yyY3gj7OwliR+NCJYlDBqpXdquxBsGT4yEsWOBlDfyRkWhfoWuc3zfspU+pkEi0BCJmmCpRHipfGMU3MSk7g61KrUQP9CTmt6AdQKbVD8i5+J+4gspTA4vFm3qWgJHtop2Yl2l9cgswzPEmEtAVTIWSnmxVqyBCYEtZHZ3SoCc1caexdcceMlc4ZSR4+OovDx8nZDH7gAvmPXBQG3KtufPwGG8+sIlwiMaTQgRaeESMa4yf4RYSxojQ+TBtprlQgEyCSFoFOgkMiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzKWbWcn4o74WX1CefrhNZw6LYIzIxlSlEJygoPHE0U=;
 b=XOINSS0+r287PFxSFQpK2jn1v3cKxIBVKXyx0cqNV4LvFbAzHyTIsi0OmZzgnrMy1yPNW7tWjaXwKHz86AZys722nDsEw2Oymggwumeld00s4dOVMpQ74keY58ORwDmPcev4dH0c8b4vutiE1wCmXGrFUT0r40MerA7ia2gbrQIIyu2VtHtbQE5AVsrRXlzM5ZQWoBjf5HIRwIdhbVCrDtiXVQshF48XglVHvKp9rSoPMH2MxG3zVIaKbDGvHptSklEfuesTIkk8TlXPmhicvqdqfTskCwZfhTrXyDHyf5VIUES04zuVrGHdK4xYHK7XnfbaRDoR6uWnwcLX7DOhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 21/31] build: set XEN_BUILD_EFI earlier
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-22-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <791838fb-b69d-d471-cfff-fe984e13f6e6@suse.com>
Date: Thu, 5 Aug 2021 09:27:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210701141011.785641-22-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d4b925d-5351-443f-1b54-08d957e275ff
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7151AC00A4D155259CA4CDC2B3F29@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0+2GE9ClCaJAUjqMTknJWdd6SBuFrGTqv31WXSLftx7aeV4YpABNGHBz7zDC9Q1Q/eewGBx6TVpYFZauqJ/Mrm8GVxJOmtRF8PZLRsuWse5hZZmvp1PG0ntsO133DRqx7GRrd8yYIDOvrIL7Jhkq9ur29zXxxskjUJdNuuOFsDLss9+fcVG3zQ5S1/imP8hlebASuVhsRmawsgfWDRmGhPkyUh7kEEpjb/pDEYvsbWzRno3cRPAQBk1lkbPdinH2SB3Fg5jV2Si6vAbkQZsNgQholbBg3GpgqmDIkRwooNNGcVxuF6IeDpqeanFRVKFExIuUzfn6CuIPDLLpqicI3K/L05RMYWHoxGGGxsOVMc3l7lUGldLNL8ra4y/c7//xnwMCxZF/KHQ5aoLuqh5ULqDIOdCus1nTL+HlFFHkQdAij6ottO3CMPP9VpEMEVpE3bHN9Ft5VCQYhMTvpzG8RJM0rfpzEUo+D5XwIYPLXurd9WEGl5umzfx9GxB0HIoFym3q7K8SZ56xxMTlAmHYKLtcqn1HG7aulyPNxYLF5CYsS7QKb+5OmNe5aTWHqUXHNBSHnouTS/0qTOALXw7Rr0GnrHV+NALrhvb5e3IlQincL6cSFPthHFa437iobjvNZA98zAfLCvzTxs2NEAarLoQqnzEupeyrc4BFaYZ60chebLcSP+9v6hwTzIodMjXjw0YXHr3LIquRbEPrLrhhLljMYwYhHynciBOwPIFnwdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(346002)(366004)(376002)(36756003)(86362001)(54906003)(66946007)(478600001)(66556008)(66476007)(8936002)(31696002)(53546011)(316002)(8676002)(31686004)(38100700002)(956004)(2616005)(186003)(16576012)(6486002)(6916009)(26005)(5660300002)(2906002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0FEUDdtVUFwU2FiTEkyWmdCUUtMVlZ4NU43K1FLSmoyZW1DS1NFRXRtK25J?=
 =?utf-8?B?TWRteXQvaWhWTS9PNitPdXlsZzhVTlJRU2E3aGYvQWkrV2czVkRLVnRLN0tQ?=
 =?utf-8?B?djRxaUNmSjdBd1ZGV1FOdGZVcTBZZnV6dUFUejFOSU9YaDZ6a3VwRlZLM0Na?=
 =?utf-8?B?WXFZbU91MEZ6Y1dId2d5bG9aSmR0SUNBK2w1Ymc1d2xOcml4QjFtQkIxZDkw?=
 =?utf-8?B?QWhsbFFROVN3bkJxWDlreXBrMThQL0Y3Tk9naUpZMWF3R1AwSGpiL0N0N0Zr?=
 =?utf-8?B?SEpDUTdpRlFudm5QOXdYMm5ieVByOWFiVGpnYnBmdmkydDY5Zis2S0lsOHkx?=
 =?utf-8?B?cTV1SWVTUEU3ZWd4aEZIQXhTQUtCNmlWRUNkZ0tENGlEelZ5VVRNUDdreC9v?=
 =?utf-8?B?dnBEUTl5VGMwY0J1UlE1YmQrVGI0NWl6Q2EwWDVGYjVhMk52Mm1pTkRZUHhz?=
 =?utf-8?B?Rk40VExaeU0vbFUzanU0cnRhaHdISmtCaW9BcUFKeHVKd2JsSUVXdURxWEU4?=
 =?utf-8?B?cXgxUm1TNVNmYXR2czQxcnhiNnNubm5TdVNTOXNjaVJLb3NCeW93ZUJ4TUVk?=
 =?utf-8?B?Y2hlaVJENGFadVViQXBoNXlCNWk4S1A3eE5Xa3FTQUlrbUo1Qm9NL2ZyMk5M?=
 =?utf-8?B?SFc2WXh4RkNhQUZYNGVQaW5PZkcwWUxXN2ZKNlhMMWVoeFI5eUJFSXU5VTlU?=
 =?utf-8?B?VHdVaWJUQ284a1N2V1dOdEM4NkplNDdSK25DRlorUllxK0lqZ0Mxa3NQN015?=
 =?utf-8?B?R3p4S1UvUE42bDljeEZCVXpLOFg4bU0yb0MzUEVKN2ROYS9lSTg1bDFOQmFx?=
 =?utf-8?B?NHZDRFpsM21lbGcreENKM2NUTGxjQ2w3czcyM2Yya0pWclN0TVFzcHVPNHJ0?=
 =?utf-8?B?ZlcwMUh0aGJLczZuSUZMQ1FXVmYyWWx0bW1pb1pJSURZcTE3T05WQmZHT3Ux?=
 =?utf-8?B?Y1pFTjRIL1NIeTFjTHVRbXIwZ2prUDVJdEJabjByYnZ1eExqM3NWYnVaVXJx?=
 =?utf-8?B?ekh6aHovcG0zTzFsSmhVQVh0YXRaTEhWMmtmN2Y3ajVadVZjWUQvVmRiNXFL?=
 =?utf-8?B?UE5lVmRhNXRPT2V4b3hiY1RYdVB5MXNjWVoremVDZmZ2VXRucFR4eTR6ZEho?=
 =?utf-8?B?dzVudkhKM3lINE95V3k1akcwVGFzNDNBM2NaK3ZOZi9raDZmaFZ6Z1lSNDR2?=
 =?utf-8?B?blprenZYTFBNVldHcDFoY01RY2h4VHByNUJ6MzhHbWZoVDl2MzRXcGtkUlVY?=
 =?utf-8?B?ZlEyS2dXY2tPcTJHL0F6WTFvWEptNElvZkhKVEdwOFFQNnk3UWdsb3dCZ01I?=
 =?utf-8?B?K280UU1DU2NJOVdsTkZqSVRmN25HWnE1RkJCQXdzVVhycDduUStBcERZKzg4?=
 =?utf-8?B?WmVFUFBxVDJ5UHErMDRzVndkWGZtTVRVdzI4ZEVOdFBUWjRsSWFnZ2xZbURx?=
 =?utf-8?B?VVpFT0VFWXJnYXBWREQ4SXhENW9qMExPWXpqb0l4QXhaS3RlTGhNMHkrdFA5?=
 =?utf-8?B?bExwNUhmcWhYNjRIdklJWC9ONFpadGQ3Qm10eG9GWUtyZDk2UzZxTTMyZjdl?=
 =?utf-8?B?U3NHQk1iZnB3MUFCZUJjWlA2UG1nSG1OSXc3aHloNXpJSDArUmNYU1I5ZEE3?=
 =?utf-8?B?ZWtOcVZOS0pTRlpyWEJabEt5UloyM2tJN2oxamZTQzk2WkgrYmlBYnBEdzlx?=
 =?utf-8?B?YlN3M3o2dUxCdHpQRzRXYTcyUWF5QXc1MjdLeGIyUDlvRlc4ZWlJSEE0eDlK?=
 =?utf-8?Q?gX+OrAV20PZpRkHfJQCfI9U/zMIWhtTJsMxVvW7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4b925d-5351-443f-1b54-08d957e275ff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 07:27:20.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjuwxe01V1pHpcVTRz0qx9864Bn9XpQtovrEmub4pt/YyMC9FcO6KBJYFvOzCXChcS31V8vK5rBlgqVmoIUtGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 01.07.2021 16:10, Anthony PERARD wrote:
> We are going to need the variable XEN_BUILD_EFI earlier.
> 
> This early check is using "try-run" to allow to have a temporary
> output file in case it is needed for $(CC) to build the *.c file.
> 
> The "efi/check.o" file is still needed in "arch/x86/Makefile" so the
> check is currently duplicated.

Why is this? Can't you ...

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -126,7 +126,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
>  ifneq ($(efi-y),)
>  
>  # Check if the compiler supports the MS ABI.
> -export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
> +XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI

... use here what you ...

> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -60,5 +60,10 @@ ifeq ($(CONFIG_UBSAN),y)
>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
>  endif
>  
> +ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> +# Check if the compiler supports the MS ABI.
> +export XEN_BUILD_EFI := $(call try-run,$(CC) $(CFLAGS) -c arch/x86/efi/check.c -o "$$TMPO",y)
> +endif

... export here?

Jan


