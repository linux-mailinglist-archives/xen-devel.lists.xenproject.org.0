Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78F94B7F1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 09:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773744.1184182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbxf6-0004wv-Sk; Thu, 08 Aug 2024 07:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773744.1184182; Thu, 08 Aug 2024 07:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbxf6-0004vG-Py; Thu, 08 Aug 2024 07:34:16 +0000
Received: by outflank-mailman (input) for mailman id 773744;
 Thu, 08 Aug 2024 07:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbxf5-0004vA-KC
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 07:34:15 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c8e5a94-5558-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 09:34:14 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5a309d1a788so616204a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 00:34:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3c4fsm713666766b.33.2024.08.08.00.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 00:34:13 -0700 (PDT)
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
X-Inumbo-ID: 9c8e5a94-5558-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723102454; x=1723707254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FvbSpkbhROaKt0ZoBbzbmF66E7ChOpZajBTvXGE0qWg=;
        b=Pdf+/tLKbIyg3uHuP+/tXGou3wdnNE8bGFBXGkq67TbG+X8YIGJNHoZGXBv/ACcmUK
         B16HkLdy1U3gUs11GD4tJr7Jzflco81lkYpdUZAeWMzVX9FC7vOh0DF/HbsyZYViYd8/
         zxBi54rTZMua0kEm93DeawwxCs8uMBN4evJn1n3cD0QUk/rTn3z/BjmpviZ4C7DZxvan
         rgYiiZ8RGV55WpCxoSG/j4NMo6lU/W3BMcGpXB2uokpWxjFFg4padB3a5EmcU3tyH31p
         P8vSYuAIEHqnVSyr9UutRG92MWn4fnq+D/DJhAf36ZeU+BPyvAThdfV0E/OMi2ZilQJn
         fHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723102454; x=1723707254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvbSpkbhROaKt0ZoBbzbmF66E7ChOpZajBTvXGE0qWg=;
        b=HPbeyYnhWEZeP7MWJ5moMAAYVMJA9F8DsTJFbjI7qhVqaYIcAIFtyWIhu4CKwsktmH
         xuqKAe7n9moNSkVzcfzY94bdmStUYL0/W0lT98KQh6Vdu+MSlgf44ebmZ2pmQVYDQrMi
         0bOKUrBxPKAlK0FYL+gNCCvuMG2zE8EkvFyOJQr8dQ9xkg01hhgOpvtePVKI4y9rXouC
         Q9C6R/le3iDHWSQqICW1s0nFeKz91jVyKpJvyhxWCG3K3nPxxjE8iBoD4XZVx2S+5+A2
         0IoMtjgq9W0Z8UYqj77Q62xdtK7r7T8Ap8k6wl0q83KU1yaPzh78m3rNhYf5is84c6Jv
         lc/A==
X-Forwarded-Encrypted: i=1; AJvYcCVZlyIjcAOoOmGkUDDwOZfSoRMb1FJGXZtDJklbi5WToL9mvhCnwPkGwWX56lQSOXKkU65QMq0+dhot24riXuMOnEqhXuUfXPiygzCMjmQ=
X-Gm-Message-State: AOJu0Yzt8nSURa/VSLkE05/h/jNBBRsZU5PnzguSZo0wBvOAY8rxBwAR
	eSdslWbvPXNimbmoJUH/D5XVKu97Nxgnh+I0dyvNx/wSHlozwrtiRaHILGyiUQ==
X-Google-Smtp-Source: AGHT+IEO0e2aAnHSJQ8Q3xHrwm7bYfM0DFHfQrEC03pasgqcdlWv3LhgQt4X3tK+4UxXGpzleX3ngg==
X-Received: by 2002:a17:907:f714:b0:a7a:9f0f:ab2b with SMTP id a640c23a62f3a-a8090db15e6mr64311566b.32.1723102453621;
        Thu, 08 Aug 2024 00:34:13 -0700 (PDT)
Message-ID: <ad72cc97-b9dd-4e7e-93f6-333805e40785@suse.com>
Date: Thu, 8 Aug 2024 09:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86: Put trampoline in .init.data section
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-2-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240807134819.8987-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2024 15:48, Alejandro Vallejo wrote:
> This change allows to put the trampoline in a separate, not executable
> section. The trampoline contains a mix of code and data (data which
> is modified from C code during early start so must be writable).
> This is in preparation for W^X patch in order to satisfy UEFI CA
> memory mitigation requirements.

Which, aiui, has the downside of disassembly of the section no longer
happening by default, when using objdump or similar tools, which go from
section attributes. Why is it being in .init.text (and hence RX) not
appropriate? It should - in principle at least - be possible to avoid
all in-place writing to it, but instead only ever write to its relocated
copy. Quite a bit more code churn of course.

I wonder if we shouldn't put the trampoline in its own section, RWX in
the object file, and switched to whatever appropriate in the binary
(which really may be RX, not RW).

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -870,6 +870,8 @@ cmdline_parse_early:
>  reloc:
>          .incbin "reloc.bin"
>  
> +        .section .init.data, "aw", @progbits
> +        .align 4

Is the .align really needed here? I think ...

>  ENTRY(trampoline_start)

... ENTRY() covers this properly? And actually in a better way, using
CODE_FILL (which ultimately we will want to switch from 0x90 to 0xcc, I
suppose) rather than whatever the assembler puts in by default for data
sections.

Jan

>  #include "trampoline.S"
>  ENTRY(trampoline_end)


