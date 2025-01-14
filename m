Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E11A105B0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:41:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871248.1282293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfI4-0007fB-A2; Tue, 14 Jan 2025 11:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871248.1282293; Tue, 14 Jan 2025 11:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfI4-0007ca-6m; Tue, 14 Jan 2025 11:41:00 +0000
Received: by outflank-mailman (input) for mailman id 871248;
 Tue, 14 Jan 2025 11:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXfI3-0007Ur-2V
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:40:59 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c0b8e78-d26c-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 12:40:58 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so38405605e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:40:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddd113sm211227465e9.25.2025.01.14.03.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 03:40:57 -0800 (PST)
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
X-Inumbo-ID: 6c0b8e78-d26c-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736854858; x=1737459658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wYbvAXc7HfoH241Y+kQfPQUVsIwe/U9vO2ClxzNnzJ8=;
        b=ctbL3xQRtFuLtYtCdt6YdEU+mUyHs0BwZEvE7urLPsMDeAwht+AdPnlnXphLyrOqPZ
         JUS2wjtqDZjVHHbaAjo6TZDUUvLvheqsaFF/MxkIVJ47/HPdd3kTCudPj/8npe5072GP
         tDbqd8Qa03AkKntS3URPYRqFRLpPo3yzsmloyg6VQVKNqPVkYJsDLpftW0hyIgL+5unu
         HS4nSHWmxdtl/1+D8mCODprGkdIoxUgd8nvjQ0fIenYygjML4Mrst2XY6P6LLsVxfAOo
         7xAtgO/hAt6M1GOvgodNL7qf5T+Zw4uNHOn8qFYBWx6BNhujuCwzOo5cH9jv+w0/dJDz
         eapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736854858; x=1737459658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYbvAXc7HfoH241Y+kQfPQUVsIwe/U9vO2ClxzNnzJ8=;
        b=Yo+aAFA7OyOQ1v1rFqP7nOYt1+GIaqr12vg1eWaESDAQKmx0Es/uVoXg5VybHha05E
         Tu6tDPfMDVlZ1OfQLmby5ZoXU3JkB9Y36sVwHj3FL5HkMU0wdQ1D5tojBbG/0mTdErIu
         mY602CB5LY3WhwjX5Im+0npdmhdBMQC6SnSbgh2nb4pXbe2by3xpPwrYHN3ixYa0tQcz
         NTgLInusd40j84CefBiVTGXJDCZnD9oB2Zg2VdKq58hmMJn/Sy6KEGs5oVJWMohyiIGj
         RmSsj1vJJKNST1iPJ6iCM6sFbOahE/yDbGPlbf+rkQSbUhiutUlGbaFF3Q+RqgaazTuD
         6HjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+1wdOLh0ipMjC5jXKV6ikqiVHh4ou1f+iMffV0tKKNfSLRWdFx6Y9XbMR6NwvlOpPRqbFdS/SdD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfbHALQrd2R3YWQw0dNV4tw3mFgllvXEt5OEJ+4CG4b6IJ9aEN
	rzalEYHh4R5pRM8h82sEj+63N/6BhyeNPdMisqOH/n1x8BvSHS3t+beX+OD4Ew==
X-Gm-Gg: ASbGncu4WA3IFKxz6Zd/fn5HlgwyR3X/1ME4EJbyArWHvmCjffiyoUX1TdNSF3OFQZ/
	1kmCOoFUywxtakF4ufFH2eRY//cppNsF5kF7+vpvTg93Q/j5wGJswGAYaPgmn7FahmvUuiAE4vb
	Vs/6B+m1rAmfFse70FUblpsHRob9TpNhn6UAgTB8d8uWdPmv41byUlFQhSbaYFyxwT+XeIFIUAp
	SaKwIRzluP8ivkZW1rhb3fbvR67kAtckvYecKQm/KQa7lpGTZ6xcE02LeB+creyKVXUud+GjVrE
	yxGgGagrtqtdONU7fyTiV5qZxwZBp48PlY3LZhqw3Q==
X-Google-Smtp-Source: AGHT+IE7/Ohg+9Lshbyl63eDzjCYqUM8sVpFOjYhIXbihBFA7aiKB0W/o9L6nZVrI16RV3mcMJ028A==
X-Received: by 2002:a05:600c:a01:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-436e269715amr213727235e9.13.1736854857905;
        Tue, 14 Jan 2025 03:40:57 -0800 (PST)
Message-ID: <32141eab-e26b-44f4-ae5a-cbac0bb8ec0e@suse.com>
Date: Tue, 14 Jan 2025 12:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Handle better alignment for 32 bit code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20250114095914.93226-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250114095914.93226-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2025 10:59, Frediano Ziglio wrote:
> Output file didn't have correct alignment.
> Allows alignment into data or code up to 2mb.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Afaic this is way too little of a description. For example, ...

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -40,8 +40,8 @@ LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
>  # are affected by both text_diff and text_gap.  Ensure the sum of gap and diff
>  # is greater than 2^16 so that any 16bit relocations if present in the object
>  # file turns into a build-time error.
> -text_gap := 0x010200
> -text_diff := 0x408020
> +text_gap := 0x01c240
> +text_diff := 0x7e3dc0

... how is anyone to derive how we ended up with these magic numbers?
What parts of them are arbitrary, and what parts are required to be the
way they are?

> @@ -69,7 +69,6 @@ $(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
>  	$(LD32) $(orphan-handling-y) -N -T $< -o $(@:bin=o) $(filter %.o,$^)
>  	$(NM) -p --format=bsd $(@:bin=o) > $(@:bin=map)
>  	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
> -	rm -f $(@:bin=o)

This looks like an unrelated change. It may be okay to have here, but
then it needs mentioning in the description.

> @@ -80,6 +79,7 @@ cmd_combine = \
>                --bin1      $(obj)/built-in-32.base.bin \
>                --bin2      $(obj)/built-in-32.offset.bin \
>                --map       $(obj)/built-in-32.base.map \
> +              --align     $(shell $(OBJDUMP) -h $(obj)/built-in-32.base.o|sed '/text.*2\*\*/ {s/.*2\*\*//;p;}; d') \
>                --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
>                --output    $@
>  
> @@ -90,4 +90,4 @@ $(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.offset.bin
>                        $(srctree)/tools/combine_two_binaries.py FORCE
>  	$(call if_changed,combine)
>  
> -clean-files := built-in-32.*.bin built-in-32.*.map build32.*.lds
> +clean-files := built-in-32.*.bin built-in-32.*.map built-in-32.*.o build32.*.lds

This looks like it would have been needed already before, if the build
process was interrupted before the "rm" that you remove above.

Jan

