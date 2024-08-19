Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF8956B1E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779664.1189373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1mD-0007wu-W3; Mon, 19 Aug 2024 12:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779664.1189373; Mon, 19 Aug 2024 12:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1mD-0007vO-SR; Mon, 19 Aug 2024 12:46:25 +0000
Received: by outflank-mailman (input) for mailman id 779664;
 Mon, 19 Aug 2024 12:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg1mC-0007vI-93
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:46:24 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09c73d59-5e29-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 14:46:22 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff443so3088305a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:46:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebc081afbsm5496258a12.94.2024.08.19.05.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 05:46:21 -0700 (PDT)
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
X-Inumbo-ID: 09c73d59-5e29-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724071582; x=1724676382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t+hIBbUaZseNvk9sZpDgJCsqGb4kdpZ3CHU8yep+ly4=;
        b=RXDfqL4D9w5r3LbRvyZtaeR5JGkejBmcZdwd/lDNs6R/0BZ1LFPe/zLu39Uw7o4/7K
         epxmkVOrRwlmN7V+gKe99sc2OYyur1Yo7SyJRpAlb17rm2xlB4WKeTM8I9b5Ig374zfm
         0odr8G+QRxxcM+sK41GDc6mpAsE8TMYEIb+10Zktusc6s2pAtHSzkJtgAbo6FmU9zEEa
         7uKS7pD/+3O8SdZE7QWVZRjlW4H9r1N7z3Yrx28ChY/+KMbvZjEbSopJTuuSiG4mE98R
         GD/9pt4GaK1qSExqOqxXjkrqH0JFFmBF0d73Sv5aUeMirqqXQND4x5vg4XQsUR0dnZ4O
         UNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071582; x=1724676382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+hIBbUaZseNvk9sZpDgJCsqGb4kdpZ3CHU8yep+ly4=;
        b=MAnfGYZjTMWXTMNN+dDShlbHqhsSvcYcKv4FGerK6D8u7ikiGeSl57XaJP79+3HSVX
         SspZp7tJ0eMnP8ApDbXO7mwx+gix5HMB8YrEXj+1t+lUFnohbewnj8TK24wZXR73b4YJ
         7fa/MUOVUp+oE2knlQqtpJjLTiwCggxxBQFEswbXSupGYsbsB7qLfgSzXgDaydaer48o
         HS7ujWABCVW0a12tOS2ukF3EIrki6RPR1WOJ+TlqM99hdRIINECl9Cn0Lw9wZG56kJ1o
         E+Cbi5THPo4eqZCxAutMCTODtNkXPI5FPinKzp/oeKTygLqnpvxU5S4reWRdORR60PS1
         gokQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrz37t/FcpCbKZ2m8zNNjmaFnRzM93MkzzlsbzYWG/pwnPIua64Q1h4j/WbF3r/lMyjnK0IvcsMbttTiYkPkLAofxPp3jK1GbqNoY0HHQ=
X-Gm-Message-State: AOJu0YzTV5HW9x0pdEp2o4KPRhT8gtDwB2RN+jf2WzzboAC2dVI81jlv
	nBgw6devZwU1634qa+9auP5xiYIkPsFK96zE1EZsZ3bKQmamnUP/izS+pV0qcw==
X-Google-Smtp-Source: AGHT+IE0QSyEGB5XajIdqVhFBJ/6rQEcNRWyyh50SPrGVHVccP1JyFFh2rXKaqLw85Jw4hoL4I0p3A==
X-Received: by 2002:a05:6402:190c:b0:5bf:279:ca09 with SMTP id 4fb4d7f45d1cf-5bf0279ce89mr631071a12.17.1724071581694;
        Mon, 19 Aug 2024 05:46:21 -0700 (PDT)
Message-ID: <5bc2bd73-1698-44d5-ab78-c7b6118709df@suse.com>
Date: Mon, 19 Aug 2024 14:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240819123508.217444-1-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240819123508.217444-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2024 14:35, Frediano Ziglio wrote:
> Although code is compiled with -fpic option data is not position
> independent. This causes data pointer to become invalid if
> code is not relocated properly which is what happens for
> efi_multiboot2 which is called by multiboot entry code.
> 
> Code tested adding
>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> in efi_multiboot2 before calling efi_arch_edd (this function
> can potentially call PrintErrMesg).
> 
> Before the patch (XenServer installation on Qemu, xen replaced
> with vanilla xen.gz):
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 0000000000210246
>   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 0000000000000000
>   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 0000000000000000
>   RSI  - FFFF82D040467A88, RDI - 0000000000000000
>   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 0000000000000000
>   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA1228
>   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007EFA0E60
>   !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=000000007DC28000, EntryPoint=000000007DC2B917) !!!!
> 
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> 
> Fixes: 00d5d5ce23e6 ("work around Clang generating .data.rel.ro section for init-only files")

I don't think this is right. While this is where the array was introduced,
it was correct at that time afaict. It went wrong when MB2 support was added
about a year later. 9180f5365524 ("x86: add multiboot2 protocol support for
EFI platforms") may be reasonable to blame, albeit I'm not sure that was the
final one, after which MB2 support was considered complete.

> @@ -308,7 +325,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
>      PrintErr(L": ");
>  
>      if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> -        mesg = ErrCodeToStr[ErrIdx];
> +        mesg = (const CHAR16 *)((const void *)&ErrorStrings + ErrCodeToStr[ErrIdx]);

As said when suggesting the alternative form in reply to v1: This is now too
long and hence needs wrapping.

Jan

