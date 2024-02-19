Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A11A859F7D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 10:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682730.1061861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbznS-0007fE-JC; Mon, 19 Feb 2024 09:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682730.1061861; Mon, 19 Feb 2024 09:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbznS-0007dM-GJ; Mon, 19 Feb 2024 09:18:46 +0000
Received: by outflank-mailman (input) for mailman id 682730;
 Mon, 19 Feb 2024 09:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rbznQ-0007dG-SM
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 09:18:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df48d019-cf07-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 10:18:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41266ef4bc3so3728315e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 01:18:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b004124907f43fsm10086350wmo.12.2024.02.19.01.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 01:18:40 -0800 (PST)
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
X-Inumbo-ID: df48d019-cf07-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708334321; x=1708939121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iDwWtX23r2V8KSj03hLJqOS1zFTYx+OKrB2vX8bbu0Y=;
        b=UQ/UfG0h47EV4AKVNJ9jreMMnfGAGQThQ/6dsu+32ruwezdeL9FR5s6nuT9mDhIf31
         KLCEEvdAzD2zsZO753r7Fnxg2KpoO1gBrEafGKqkM3t0+DJjoFifOHaCHQzg9QU9H27b
         Sy3WViBDhdQQgnxGpgwWnuxIjwm//LUnXRJ8CUfQwQs4DhJOy3z6WgNh3EHggH0nA8F/
         3CZRUYdxPhvEGVAxhRRiap7cyVsn2wWe7NHJG1b6x3EgVrCMUmsvbtYXar60jVUc2v7Q
         AOsp8kWlrc6O8r3amG39zxlGg2p7as7u9kw4cJ+UNWutRBNiYeBg+RD6upGl+4+j90z+
         2Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708334321; x=1708939121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDwWtX23r2V8KSj03hLJqOS1zFTYx+OKrB2vX8bbu0Y=;
        b=q8dbzN6hLbDxHLKwEyk1ljiC8ECKwmUYeIg6a5EXl9OX8gPz4EUW95NDUXgFHlVSGO
         +NJOdwUq94ShH7yag4eUGKHy51pbZ8YZwHFW99iIBDFqylYEQEct+Ayqb5n9o/+L3TI8
         T2DaHrkFt6NdLsPiEWDMzSYn6/MaGUPZmXl8NIZN1v+CbOcCbXJjH88dznUxY1LdwCyL
         fu85CluAfux7cwYQhhYlhIZBvm3KrTKc9/BLNqNBj9bQTo3pppCjYMaUdof1J2tsMhU9
         obn7q1juM5DD4XF4aw/mXH/LFtV4GCZVe5tH+zSmSh7WWCEOgTiJNciwUTp3BYfGNJJZ
         PaUA==
X-Forwarded-Encrypted: i=1; AJvYcCUCP+UJzYV/N1JPHgPpfEAASJiXoMiKJYZCmum4PQcC/qtUv3PjZAtVv4AXjU8WcGWIg3tdwv0VpgyPgwHAEtM743x4pc59dwdTj4OOx54=
X-Gm-Message-State: AOJu0YwgYWkyloV4yZrICaGBkAOybPRd0dU+tkCtkGnrBhXNXy55q0MB
	s/mz46EPSOaBSdkVtm4W0G0Jt3RNuaqiv2mE0TfLAbMs38XKPPqgwzHjqcUvLg==
X-Google-Smtp-Source: AGHT+IFEHc4IH0UcRO+ZtLpyzJ7eO9bxp8hT5gfZO4XBj6RsD/vDDoadPcjxIAec9YxltcSL9Grvgw==
X-Received: by 2002:a05:600c:35d0:b0:40e:f693:94dc with SMTP id r16-20020a05600c35d000b0040ef69394dcmr8189355wmq.11.1708334320974;
        Mon, 19 Feb 2024 01:18:40 -0800 (PST)
Message-ID: <998a0511-b47b-49c8-8db4-9c2adb3b3d9b@suse.com>
Date: Mon, 19 Feb 2024 10:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Reduce assembly code size of exception entry points
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240216105028.9517-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240216105028.9517-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2024 11:50, Frediano Ziglio wrote:
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -22,6 +22,14 @@
>  #endif
>  .endm
>  
> +.macro BUILD_BUG_ON condstr cond:vararg
> +        .if \cond
> +        .error "Condition \condstr not satisfied"

Maybe

        .error "Condition \"\condstr\" not satisfied"

?

> @@ -187,7 +195,8 @@ FUNC_LOCAL(restore_all_guest)
>          SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
>  
>          RESTORE_ALL
> -        testw $TRAP_syscall,4(%rsp)
> +        BUILD_BUG_ON(TRAP_syscall & 0xff)
> +        testb $TRAP_syscall >> 8,4+1(%rsp)
>          jz    iret_exit_to_guest

Nit: Blank after comma please (and again elsewhere).

Preferably with both adjustments (which I'd be okay making while
committing, so long as you agree specifically on the former)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

That said, especially with this not being an entry point path, and
neither this nor ...

> @@ -254,7 +263,8 @@ FUNC(lstar_enter)
>          pushq $FLAT_KERNEL_CS64
>          pushq %rcx
>          pushq $0
> -        movl  $TRAP_syscall, 4(%rsp)
> +        BUILD_BUG_ON(TRAP_syscall & 0xff)
> +        movb  $TRAP_syscall >> 8, 4+1(%rsp)
>          SAVE_ALL
>  
>          SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
> @@ -292,7 +302,8 @@ FUNC(cstar_enter)
>          pushq $FLAT_USER_CS32
>          pushq %rcx
>          pushq $0
> -        movl  $TRAP_syscall, 4(%rsp)
> +        BUILD_BUG_ON(TRAP_syscall & 0xff)
> +        movb  $TRAP_syscall >> 8, 4+1(%rsp)
>          SAVE_ALL
>  
>          SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
> @@ -334,7 +345,8 @@ LABEL(sysenter_eflags_saved, 0)
>          pushq $3 /* ring 3 null cs */
>          pushq $0 /* null rip */
>          pushq $0
> -        movl  $TRAP_syscall, 4(%rsp)
> +        BUILD_BUG_ON(TRAP_syscall & 0xff)
> +        movb  $TRAP_syscall >> 8, 4+1(%rsp)
>          SAVE_ALL

... any of these being exception entry point paths (and hence none of
these changes being related to the subject), it would likely have been
a good idea to split this into two patches.

Jan

