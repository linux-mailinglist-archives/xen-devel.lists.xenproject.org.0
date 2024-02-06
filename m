Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C786784B21D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 11:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676754.1053012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIQ6-0005oc-4a; Tue, 06 Feb 2024 10:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676754.1053012; Tue, 06 Feb 2024 10:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIQ6-0005lk-1L; Tue, 06 Feb 2024 10:11:14 +0000
Received: by outflank-mailman (input) for mailman id 676754;
 Tue, 06 Feb 2024 10:11:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXIQ4-0005le-6f
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 10:11:12 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c4bbfe8-c4d8-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 11:11:09 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40ff0799f56so347855e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 02:11:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b0040e9f7308f4sm1496867wmo.10.2024.02.06.02.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 02:11:09 -0800 (PST)
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
X-Inumbo-ID: 0c4bbfe8-c4d8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707214269; x=1707819069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+MyVLWTRba1VFaavpxn1vfOdY+KSP36/07oNymEwEQ=;
        b=a5ZPKeDETkkCDOhNx6/B1JOTw/W5bwidDIqUuvaEWMlr0GhQhQtvzniuIesg0OlErn
         41StvnqK5RJOkcipAYp99kvRLRr9QWXHHAADI9+lF2AIXRcxy/TLm7LlEZSAxvqpx1zw
         6ClXXh3JD8y0CjZVMhzMxBjC6zQuYiLVHu04oAbZaWpmT2WcSUMHZH1CC15jSKNgyCPs
         Mah295BgHhxTe/k3pPUQujLPyTjboCeSvAaOeKXytPIgvyosbc8hy/E7w7EIsjYd3G33
         rwbD5Yi8BD0O02pXQllk288OVdSiflRZYWS5L0U8C7UOpk0WXjoeoH1ZpM6kb+kV1sIN
         7HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214269; x=1707819069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+MyVLWTRba1VFaavpxn1vfOdY+KSP36/07oNymEwEQ=;
        b=QyJa0qiI98AFuakvSZLw4/JH7Ulzjg/VR7ggTaCrJgcR8ou4R334E5MTCWF586YHGG
         55252eK/stfa4Au/5GuTb0OGObDmdrqsYpY5pGCPty5a9mB/0bvsBnlk48G6YYQQRyjq
         bPgLsyxJiSxlaw/uBXejzFHMf2cECH68euvxmQ7SHTmWpnhpFQ76qt0hQM0x5ASIVKsi
         h3Xf3RJPDalelFVkfDz0aMHEbivA6M+4pC71iqbWtfg8r1KGmLXJXsgQUsEog6HLx1wW
         LQiE+0hpyzbk9CpHPWziSQtx2SAdlvBEAmcrfg2fd2b8m/cOkmtTzIjuL/zb2nZgrWue
         rq5g==
X-Gm-Message-State: AOJu0YyhHme1byUShxmWYEy3j2NJDU+9dSEcmiVFck06hEH63f1YEJ+2
	JOfwvcOS+Ehe6tLFGJcMAjfY8MwO6WriVGtmi1XTOdX2RlyMoHgdCFUX+tloXg==
X-Google-Smtp-Source: AGHT+IGfpk+VAtBQ421FXKv9E0220UHtOWxMasmTrSLIcrpUc7RwmaLNeBmf0Wve7/TvZwtB9coEOQ==
X-Received: by 2002:a05:600c:45c9:b0:40d:92c8:2cf5 with SMTP id s9-20020a05600c45c900b0040d92c82cf5mr1484628wmo.20.1707214269507;
        Tue, 06 Feb 2024 02:11:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW7Woc/GDtOnaaHCHGWuWQWfEYWALM3k3qvqMrnW+sngpHs/wpiFLX/rc6y7n909FQ16vrjFk8VUIAGTfRB+uJIV4LdZphMR/qpORusJtD+bLg7Sy6F4IDTyOaBdchy+KBvCDBAEed8OqgazA==
Message-ID: <1c07f2f0-9007-48e3-9914-a283d6497009@suse.com>
Date: Tue, 6 Feb 2024 11:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] Reduce assembly code size of exception entry points
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20240205104840.14942-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240205104840.14942-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 11:48, Frediano Ziglio wrote:
> We just pushed a 8-bytes zero and exception constants are
> small so we can just write a single byte saving 3 bytes for
> instruction.
> With ENDBR64 this reduces the size of the entry point from 32 to 16
> bytes (due to alignment).

Oh, good - when recently touching these entry points, I was thinking
of doing exactly this. Just didn't get to it, yet. However
- since using different size stores can raise performance concerns,
  I'd like to suggest that you mention the fact that we actually
  already have cases of this, in autogen_stubs,
- I'd further like to ask that this conversion then be done consistently
  everywhere, perhaps even including the storing of TRAP_syscall. I find
  it particularly puzzling that you ...

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -898,28 +898,28 @@ END(handle_exception)
>  FUNC(entry_DE)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_DE, 4(%rsp)
> +        movb  $X86_EXC_DE, 4(%rsp)
>          jmp   handle_exception
>  END(entry_DE)
>  
>  FUNC(entry_MF)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_MF, 4(%rsp)
> +        movb  $X86_EXC_MF, 4(%rsp)
>          jmp   handle_exception
>  END(entry_MF)
>  
>  FUNC(entry_XM)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_XM, 4(%rsp)
> +        movb  $X86_EXC_XM, 4(%rsp)
>          jmp   handle_exception
>  END(entry_XM)
>  
>  FUNC(entry_NM)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_NM, 4(%rsp)
> +        movb  $X86_EXC_NM, 4(%rsp)
>          jmp   handle_exception
>  END(entry_NM)
>  
> @@ -933,28 +933,28 @@ END(entry_DB)

... skip entry_DB here. And even ...

>  FUNC(entry_BP)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_BP, 4(%rsp)
> +        movb  $X86_EXC_BP, 4(%rsp)
>          jmp   handle_exception
>  END(entry_BP)
>  
>  FUNC(entry_OF)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_OF, 4(%rsp)
> +        movb  $X86_EXC_OF, 4(%rsp)
>          jmp   handle_exception
>  END(entry_OF)
>  
>  FUNC(entry_BR)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_BR, 4(%rsp)
> +        movb  $X86_EXC_BR, 4(%rsp)
>          jmp   handle_exception
>  END(entry_BR)
>  
>  FUNC(entry_UD)
>          ENDBR64
>          pushq $0
> -        movl  $X86_EXC_UD, 4(%rsp)
> +        movb  $X86_EXC_UD, 4(%rsp)
>          jmp   handle_exception
>  END(entry_UD)

... entry points below here, where an error code is pushed, will
have zero in the respective field, so these can be converted too.
And entry_NMI isn't any different either. Whereas entry_MC even
exactly matches the pattern you have been following, afaict.

Jan

