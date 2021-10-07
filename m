Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC6425778
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 18:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203845.358997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYW2d-0002GY-Nn; Thu, 07 Oct 2021 16:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203845.358997; Thu, 07 Oct 2021 16:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYW2d-0002EZ-Iz; Thu, 07 Oct 2021 16:14:43 +0000
Received: by outflank-mailman (input) for mailman id 203845;
 Thu, 07 Oct 2021 16:14:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYW2b-0002ET-Ex
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 16:14:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03c103e1-1a9c-4b3d-b324-a526a5124157;
 Thu, 07 Oct 2021 16:14:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-sK2VNVWmMSGNTM64N_yjIg-1; Thu, 07 Oct 2021 18:14:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 16:14:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 16:14:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0042.eurprd02.prod.outlook.com (2603:10a6:20b:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 16:14:35 +0000
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
X-Inumbo-ID: 03c103e1-1a9c-4b3d-b324-a526a5124157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633623279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZobpDgjbqKs/ag7N0PLA129nreT/lrWiUeQXCQvB9M=;
	b=AZQ2cLu1HWk0IFxz7A6NN94/zGAGNn7jP2I+Ln4eH8QK/OqNZJSthTb2DWGcnsI9lOsibH
	4+/AHPbHYWk0cgjOW9qW1BaetExZivlAQwqxS1n1Ro5n0t9fi1KuU/qa4767bC1SCu+udc
	ze4s8LHCN9RBU5gNDVMAtYtx8MvNnkw=
X-MC-Unique: sK2VNVWmMSGNTM64N_yjIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=St+QzvNYa4ZpT19QhYrmmv+DzC+0krA7yZ6f50quLAmKtEeBU+MizanGJYjcdpxI6SkFiCQrntsHScFkzriXCjw3XKHY0zPYgj97GYQghuPY2EczrrYUMFrax5n0c0qZTHd/X4EkRdgOtRP9BrXFV6u8PNJtqxtqbbg9DKav+imTdLLbZIdOBGUZS5hBZttvg7wxoAXoYUtYD9CluqMiITaJnS89p1yviJkyWgzGrFegysOPgl6rlDGNNe/O9MoukPHMkSkFsckPv52zFhzfEwzxl1/0qPqphVX44aJ01GIRbjFGpNcQPEAX+Rspwo2TXOUceU/D47EC9HNw764J3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZobpDgjbqKs/ag7N0PLA129nreT/lrWiUeQXCQvB9M=;
 b=ACSfQWuklKwznI1F91vKRttue6fqa3xEkNmOpm57hb1RWnvxvehl+boOthyrrOGbnz6wvHuJO5fXAbdz47ssLHTfrDFoBWYGba/G07xshKcbEHDsZzhQDLIIaWteh8wjcCjpUeF8A6syFUVPtkDdm3/GokfSFqPVvtp99xQUHI4Uzn7ctxdoCgMZfU8+vM0qLi0Dh6dQoLrV+MY32DJkECL4ck9l6XZmvLz9xKb3zBDu+YPc88WWYSZ2vga6a3tu9huIxjK6CSx2I4RHfah42+W+UfuJ8zoCN4IdHeA239o5jNhABxtm8oGzMMlC4FPUdzDa7AI/D5CFozw1A2mLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 17/51] build: set XEN_BUILD_EFI earlier
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-18-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d2f9787-d156-0b06-0548-97198af644f9@suse.com>
Date: Thu, 7 Oct 2021 18:14:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-18-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0042.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d77addfc-6f1b-4431-f945-08d989ad8e7f
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295944FCF85F61245D41099AB3B19@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tuCNFXy7WGrpXKrxNx+9ooc1qmlXeP8SxAgQhSY/vBEVNM+o48daYX6EUnCu/w7nGzv24b9uBzWyXtfOmiW0NzDPMevBoZ9HvK1aooIGdg4BFk39abXvHnvJqeo93JrA16ZGjJku7XP8dfKDGbgLaa4G3KoPM2KuWRGH6Hwyy1xku3aL6SLsAPmqIoSEU0SRkRimqhWJ30xbZjM/FaxXjU5Zbde8yvKN8TH7vL9NJycG9z1heM0uXIgcITCjLXnAeUZ5l171kWCkYgvxEcHf7G3rvBNLLcsLZJRemwo6BtPgpiNASCRS0W4ivL6nwssyH1Z65IVLfoD8K6vWGhzw1LaYCS7fur/9Rvs+exPTN4TjgcB+ri/j6LjKh5BPUmJbEcFLMc6ygT49F1orJQfGc3rqW18xXTc2IUIyH8x/FoycBiDDm9t6ufIMzBN6QQhDdKQwUxZl+sy8D81HHmEmRvV8v/GdV5VMLCreFlv9aukXPhpkK8m5DQLKRfREcOlgbwO/DY4uLC7PfqikzwXrh7AhNrEiFVKn+KN6Lm8qOFHJseEJ60Ye2rxHnKpmKI68hMvboWKQgbQfu68Zw1IKPro2P2AuEXUH8wln5VphBCP9cwuDs1pCoNWfzEGH21/ZC0Z32AFUfPhQdFItkzbKHDBjw8N8G5suWbv8uAngWimVnrgPJR2N+XJDxci4RaRWHqpK8kDEpAr1OgYH18iRygl8hnh1cCNg37Ta97ASp9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(6486002)(316002)(16576012)(956004)(38100700002)(4326008)(8936002)(66946007)(5660300002)(2616005)(36756003)(6916009)(31696002)(83380400001)(26005)(66476007)(2906002)(508600001)(54906003)(66556008)(53546011)(86362001)(31686004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGFBb2lOVXlIaU9Ic3ljaEJDcU0yRW5GUFNUUEtRb053ZTJETFJVdTNZVWZ0?=
 =?utf-8?B?ZmFQUStpQ2RCeG1NdzFaK3Jqb1p5eFhUZFQvYjNHbnpuQkJuUlM4cDlLU21O?=
 =?utf-8?B?THIwTmdyb2Z0b3lyQlpYTFl2Yk9Tc3JCaFp3NkdZaC9GWHhkMlJHeGdPeEw1?=
 =?utf-8?B?TlpsVnNrRm5sZWlLWU9LcGkrSXNWNmwxcHJFcGZZUVFBQUJ2RlhjWU1xOENr?=
 =?utf-8?B?aFVzdXJOYWVrYWxudjVEeDNEZDhSaisvenlkeUY4U3MrSzBBVUpCRlBSTk4w?=
 =?utf-8?B?T29KbHQvdHNFNG9aVVBTSUJDdEdocHVYcG5mYjFrUXQ1MG9wV0NOcWRlYW51?=
 =?utf-8?B?bzVYbHBIR2VBV2Y4TTZ2VzJQMWcrL3BkYVIxaFE2RStWMUx0UVl6M0VUSUxk?=
 =?utf-8?B?THRqRys2cUNiL21BSUZMeStNeW5jRkFQZXp6Qk8yMld3cEs3MFUzajBGTjd4?=
 =?utf-8?B?UlNCdnZ6UitERXJNZU5IOVFBMHY0S0pjTVlOOTBXL3R2UXliT2N6RUpoZmxp?=
 =?utf-8?B?RFZwejQvMXNWM1Bab1lzOFBuMEZDbE11NEw5QTViUGxvOHIrVTdsYWZ4V3JM?=
 =?utf-8?B?UDlpbHBraWdFVU1xYzRXTUFOT0FGazd0a0hIUllySmdZVDh2VDRES1cxaGV5?=
 =?utf-8?B?QTdlcWdqVEJVZ3hyQU9NY3pJOFg0eFVUK3IybzdPaTRGTGthcU8yREF5NTE4?=
 =?utf-8?B?OVVhSUZ6dlpuMTE1VjFielZRcFNTVnBKN29DVUwxUGh3ZDBaTHk2MVlYSG1W?=
 =?utf-8?B?bENYcUdYenk2QkZSa1hSOGpuLzhOalhobUVvdVlqc1lNb3pmczdiUEFRK3N3?=
 =?utf-8?B?eEU5eFVJdS9EaXZSVjRhN21td1IxM1p2YjI2Y013UWQxREpxTUxLc1FacUpx?=
 =?utf-8?B?VHlZN2tuY0R5YWZUeW1jVWczN1RYNWFvTjZzMEN4cEk4V0JudTdZSEw2T2Zk?=
 =?utf-8?B?b0RFTngrMGswTTJqU1ovb3ZVUUhQNFNqejN2YzgzTGl3NTBZcVowOEdnVWc0?=
 =?utf-8?B?QXI1RTZsZWxCeHdDeEhaTVg4T0g1Z3ZqRlF0cC9rcW5ObkNxK3VENWtVQ0dv?=
 =?utf-8?B?SHc1MkNjV3k4STdlaEdwdmNkQXN0eW1uenExb2pMRkUxR2NXaFlNRU5IRVhl?=
 =?utf-8?B?MmJtazd1ZjdXOHJibzZRNnRXRUxzZGJmcm1VWmo4Y1pJTG9PNTN1Z3hEZVBt?=
 =?utf-8?B?bWtXK3luOGl1TFlCQ2xML1ZHNVp3R0FzYnJ3amZTeFBNUVZ1ZzVjNWtjNlBO?=
 =?utf-8?B?VGpTNzdDSm5hcTh0enB5Z1diUVRLanhueGk5K211b0ROR2JIajhCdmFCMElO?=
 =?utf-8?B?MDFERGZMM2lPc1dvRjR0Qlg1eHNmNSsxT0Rtd2sxdVVaaW1sVlpNSDFwWUNU?=
 =?utf-8?B?amlFSHFlMko5cEVjanN1VzRGZ1FCRHNNL3k0R1lSR0l3RjcrMHBsVmQ2eXRx?=
 =?utf-8?B?VG9VWkFKSEZWR1dJMWNzanF6Uk9CTUVPUFp0c3lBZGllelFIQkZpS0F1ZGZS?=
 =?utf-8?B?UGFkK3lPbVNKbWNYTHBxODA0Ui8xc0ZzT3Z5eUxkL1RRTU56OWlMZnczbnVh?=
 =?utf-8?B?dUMyMTZMbzhDVGYvSzd3dWxXcHRSYjNydHFGdjdid241Q0R3V2pKT1Q4azNW?=
 =?utf-8?B?eVRXYUlSM3Y0d1dZZFdUNFkxaEtZSlVHOSt4UWNKbVk4SWdjcDc5TkVHOExW?=
 =?utf-8?B?eisxRHdraStmMTNuTGZuaDJGZDAxSEZvc3ZGVEw3c2Z4bE1WRlFGSWJRNzhM?=
 =?utf-8?Q?Ds917jkRW3HF7zlIRI9BBvLoDgrb1hMy5fUlSIc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d77addfc-6f1b-4431-f945-08d989ad8e7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 16:14:36.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/qkojn3omXVUCTA+mKZFjr8I28vrGk+zlew3IwipygHUbU4fiH1prrEHIKVTg2MKnIIdENP9lwqhKC/nVtB5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

A general remark first: If I understand things correctly, a side effect
of this change is to also address the issue that I'm trying to take
care of in "x86/build: suppress EFI-related tool chain checks upon local
$(MAKE) recursion". However, while that one's a reasonable backporting
candidate, I don't think the one here is. Therefore I'd prefer my patch
to go in ahead of this change of yours. Hence I wonder whether in return
I couldn't ask you to review that one.

On 24.08.2021 12:50, Anthony PERARD wrote:
> We are going to need the variable XEN_BUILD_EFI earlier.
> 
> But a side effect of calculating the value of $(XEN_BUILD_EFI) is to
> also to generate "efi/check.o" which is used for further checks.
> Thus the whole chain that check for EFI support is moved to
> "arch.mk".
> 
> Some other changes are made to avoid too much duplication:
>     - $(efi-check-o): Used to avoid repeating "efi/check.*". We don't
>       set it to the path to the source as it would be wrong as soon
>       as we support out-of-tree build.
>     - $(LD_PE_check_cmd): As it is called twice, with an updated
>       $(EFI_LDFLAGS).
> 
> $(nr-fixups) is renamed to $(efi-check-relocs) as the former might be
> a bit too generic.

While I don't mind the prefix addition, may I please ask that the rest
of the name remain as is, i.e. $(efi-nr-fixups)? "nr" because that's
what the variable holds, and "fixups" to distinguish from full-fledged
relocations as well as to match commentary there.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -123,41 +123,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
>  	mv $(TMP) $(TARGET)
>  
>  ifneq ($(efi-y),)
> -
> -# Check if the compiler supports the MS ABI.
> -export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> -
> -# Check if the linker supports PE.
> -EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
> -XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o))
> -# If the above failed, it may be merely because of the linker not dealing well
> -# with debug info. Try again with stripping it.
> -ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
> -EFI_LDFLAGS += --strip-debug
> -XEN_BUILD_PE := $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o)
> -endif
> -
> -ifeq ($(XEN_BUILD_PE),y)
> -
> -# Check if the linker produces fixups in PE by default
> -nr-fixups := $(shell $(OBJDUMP) -p efi/check.efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
> -ifeq ($(nr-fixups),2)
> -MKRELOC := :
> -relocs-dummy :=
> -else
> -MKRELOC := efi/mkreloc
> -relocs-dummy := efi/relocs-dummy.o
> -# If the linker produced fixups but not precisely two of them, we need to
> -# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
> -# recognize the option.
> -ifneq ($(nr-fixups),0)
> -EFI_LDFLAGS += --disable-reloc-section
> -endif
> -endif
> -
> -endif # $(XEN_BUILD_PE)
> -
>  endif # $(efi-y)

Is the remaining if(,) block still warranted? I.e. can't the single line

CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI

live without the surrounding conditional?

> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -60,5 +60,47 @@ ifeq ($(CONFIG_UBSAN),y)
>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
>  endif
>  
> +ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> +
> +efi-check-o = arch/x86/efi/check.o

Nit: Unless there's a reason not to, please prefer := here (and in
general).

Jan


