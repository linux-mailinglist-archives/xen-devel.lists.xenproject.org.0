Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82854C46A7B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 13:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158337.1486681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIRCR-00027P-1X; Mon, 10 Nov 2025 12:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158337.1486681; Mon, 10 Nov 2025 12:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIRCQ-00025l-Us; Mon, 10 Nov 2025 12:40:46 +0000
Received: by outflank-mailman (input) for mailman id 1158337;
 Mon, 10 Nov 2025 12:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIRCP-00025f-DT
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 12:40:45 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79409d6c-be32-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 13:40:44 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b7277324204so507849166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 04:40:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64179499189sm4264591a12.8.2025.11.10.04.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 04:40:43 -0800 (PST)
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
X-Inumbo-ID: 79409d6c-be32-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762778443; x=1763383243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j87a6bVg9MU3HmA2emq5QiStErZQHTMqJIqHtg/3KiM=;
        b=f5rIHecD8ewBJ807ro8u6XQ4NM3WLjSnlgIsqegf+8BnWTQBJBVQQVHEbCc+ccR1BO
         Op/r1JjUJpg26ucfQ7PXHQ5cIyq13H1S+zvj8wuLuKhv4fOjcz13qkxyLivithLYfp6c
         E6JWgxVB5NuoNKBCTZUSs6d4+tyTCdJ3cEtkdcI7lYRPEMLEbQV3uZc0RqFo1ByFVHxL
         ZGf+hP/4KAMHTkdZdTRC121VAQkZv4TxgA0CGXPla72ylfikrVCKziNXVB5RFXHbBtTB
         NezrxIKEmstmSEo0pwFtoFPfOUhOBVkkB7p3HsKQnIDxGxpD9A0u3LDmT0BLUZjYE/yb
         xtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778443; x=1763383243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j87a6bVg9MU3HmA2emq5QiStErZQHTMqJIqHtg/3KiM=;
        b=l/57C4pBIXWmNvI+Cp76R6/OZzbX3mxp5wZjucTLUueKGe92RGqy/9wlvDy6LXv01j
         ExcAh7/Zfz2pW9rKhqzIfcMeLcPfbyEuN/n+AlD+OBOIswTg/CFnK9HWkOIrzfkRiJON
         1kdTLNcfFza4PYYphwbtTC7jiSxjsygHN3BsSM6aO9zn4azGUzUfGqsPOwtudIgBMsUH
         hBhHWjdg+xReZ4nlLPY5VI3hqX//dZdKrVpPj4F1r+7+pmBCW7LEkLrsxg3t4dgIgXDh
         3+5xJkQQPkMKx5hLrwYVjLBCOsBusOkh8+A1AXi3NOPPZqF9De4/E8ZCFx7chql/T2tg
         ESAA==
X-Forwarded-Encrypted: i=1; AJvYcCWLkbrC9CwccjdyIvoHjB7E8KmYM/3kgCTbK3Lmxrv8YcIxabE16ZUMn0Y5Aq/dItG6pExrvMxFT4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/TAWGUGrJ4k+fcZhq2zcbTYiWgcZmQTFal+V3y4aK3+c+WAdC
	7F9NOmJPZWu5uuGsa3f4nA2+OArLP8dk7z5lJvAOPmcz5iUEQzXQo2K8EiWRLsFAGA==
X-Gm-Gg: ASbGncsuIOGegnkWVtCLaKBBLpNFVsUbmy0RTtAjte/N9jRQMfzYgsTWWsmgp7amGJy
	+YEq/ILSPJU0KSvbLaL7Af1PYePFWSIaQ7P/bR4DIuywW6JI1wHDYtc1KnkZXQgq2SoKa1yq9O5
	l+UhsJJ0TqpGgv+3DO5NZ7PkpPeqpdJ4UmQ0vye0a0ZZM1LjX7yJRW4tS/TfIZbK1UkU/wUdG1i
	oPclb1p2+X1DMDN9x8FVyiaslfZSbqt4ZPXqH77mqTxn8u7VrdzGz1R6yULARCcduJGRgIrCStx
	AZ+ShEQijT6xAIyVogv0RtWngvr4kGzsHSKGGdp8aWMsNlJng2X3dfIQWXEuiDnTnM4zF8fqxw7
	t+ZI3VbBymbWmH3mtB7yzjBPmfFYdAfT3ceJxBeMs2LpsnXYvKhqaheqREtj/UFPapSdzelL0q4
	pBNDe0g/N0K3T6RG390owTWnav4gnLX1X8rkFOeJe8XaJCHPCfVN7iml87mMlUv2Tw
X-Google-Smtp-Source: AGHT+IG5baqsr5mEOt3+qZlFZOEASO9CgA/6SiXUjnceX7GhYw12ZvbeEZDEhzo8jaixkTdAkeAN3Q==
X-Received: by 2002:a17:906:7309:b0:b72:5f93:2959 with SMTP id a640c23a62f3a-b72e02d9744mr690600966b.17.1762778443517;
        Mon, 10 Nov 2025 04:40:43 -0800 (PST)
Message-ID: <f1785ee8-2c70-41e5-9cb6-0506dc110ef0@suse.com>
Date: Mon, 10 Nov 2025 13:40:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20251110123034.77692-1-frediano.ziglio@citrix.com>
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
In-Reply-To: <20251110123034.77692-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.11.2025 13:30, Frediano Ziglio wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -228,17 +228,23 @@ endif
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>  	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> -	      $(note_file_option) -o $@
> -	$(NM) -pa --format=sysv $@ \
> +	      $(note_file_option) -o $@.tmp
> +	$(NM) -pa --format=sysv $@.tmp \

Why is this needed in this shape? Can't you use $(TARGET)-syms.efi here
right away, ...

>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
> +		-O elf64-x86-64 $@.tmp $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))mv -f \
> +		$@.tmp $(TARGET)-syms.efi

... avoiding the need for this mv and ...

> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) \
> +		$(TARGET)-syms.efi -o $@.tmp

... double use of $@.tmp?

>  endif
> -	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>  ifeq ($(CONFIG_XEN_IBT),y)
> -	$(SHELL) $(srctree)/tools/check-endbr.sh $@
> +	$(SHELL) $(srctree)/tools/check-endbr.sh $@.tmp
>  endif
> +	mv -f $@.tmp $@
> +	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*

At least part of the rearrangement here also looks unrelated, and isn't
mentioned at all in the description.

Jan

