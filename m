Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ECB9714F8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794165.1202903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbM7-00036g-RD; Mon, 09 Sep 2024 10:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794165.1202903; Mon, 09 Sep 2024 10:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbM7-00034f-OV; Mon, 09 Sep 2024 10:10:47 +0000
Received: by outflank-mailman (input) for mailman id 794165;
 Mon, 09 Sep 2024 10:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snbM6-00034V-7f
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:10:46 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c68f6130-6e93-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:10:44 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5365cc68efaso2197923e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:10:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25950a7fsm320688066b.57.2024.09.09.03.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 03:10:43 -0700 (PDT)
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
X-Inumbo-ID: c68f6130-6e93-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725876644; x=1726481444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TTXwmdtaRtK0/hnBkmBpjyoTVN1PztXTJ8KZiFaNLmQ=;
        b=fZ7+Q6g4pb1dqqBbtZctxEZ4JMjIqDONcz9N6P8zSNXyl1EsMzgCHysueOfWOsWTD+
         oHgPGhvp2Jbnbs90ep/tAv7fC2fLvjz0vpZGbO+N2Wcu5cH83DWzvlLstjOXgkvuig3c
         43PMwK5K4FGVZ94IWo9RhcdwruK+S84oV8Nqp6JHWZrpNZwoiayQDeAVQoBDIKW2IEOr
         S70oSTCZ8AI09JgddF1CXSfy2Pjm7tTV2tsmBurFdXn5YdLtMhppMyjZm3QTTOXnqBG+
         PHKGkz3hbaOVyIV4BOwDWDQYkUiiTeRI8T5vipe3X2/sf5CDQRvhPYX5NeXr8LOC54w3
         fkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876644; x=1726481444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTXwmdtaRtK0/hnBkmBpjyoTVN1PztXTJ8KZiFaNLmQ=;
        b=iwHepmg7GZnK5yrFDP6SZm8oYiBT7RjUxHCfp8iG8pacCvdcn6AW/Fxt87z1IQsydM
         4dm+LQvtIgvEC6EzzEkr/XpyosemH9L7z15Dk41ovtoreEwHqZ9lFehJa4Yaoycumnjg
         dHxl8b3TfTO7a3W41Zq9ZX87zjjgX9zNd/3y7tat81UDx+fKsFky/am2gqnxcuor+5GY
         4CGd8zpYQnnDAgi1fwOP5zdNDxWXMHuyRestF2b6ZbDFItz6guVKOK7KNOpPuPBSOZf6
         e04Rdc4LmIlLnLDhls/xhOwYGAHt8UliHEx1Lye0mKYHkRBIU3eWpQlocEEUGGwli39N
         cYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQHWyQn7hK1B6KODusSPN/etYVQTtdX61YTgPGWmbSMKvfSkq7ckcc9iLcaCWfGKWbrVp9eqh0IEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyugksMbIPTnbukYfIyxEf88tj3l6nHiHB9eqI1IbpIF+S0bVib
	VuzsXjkBuUpIVILii5Z6NsWx9W/wLyhUQR13ujJ+kl26qjfTpQi3Oc4EroaGqw==
X-Google-Smtp-Source: AGHT+IF5wIe1/+mINslLcwsFwfhU/uifPI3c49ooXxTRN3iHXV3PJ11kX/U/6G0TaLPS2YbkHWXDwQ==
X-Received: by 2002:a05:6512:3b10:b0:533:4656:d4cd with SMTP id 2adb3069b0e04-536587c641fmr8253600e87.33.1725876643507;
        Mon, 09 Sep 2024 03:10:43 -0700 (PDT)
Message-ID: <91963d5c-3e59-4b00-98ca-ab4535947210@suse.com>
Date: Mon, 9 Sep 2024 12:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/5] x86/boot: create a C bundle for 32 bit boot code and
 use it
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
 <20240904145648.33707-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240904145648.33707-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2024 16:56, Frediano Ziglio wrote:
> --- a/.gitignore
> +++ b/.gitignore
> @@ -251,8 +251,7 @@ xen/System.map
>  xen/arch/x86/boot/mkelf32
>  xen/arch/x86/boot/cmdline.S
>  xen/arch/x86/boot/reloc.S
> -xen/arch/x86/boot/*.bin
> -xen/arch/x86/boot/*.lnk
> +xen/arch/x86/boot/build32.*.lds

Please retain (largely) alphabetic sorting.

> --- a/xen/arch/x86/boot/build32.lds
> +++ b/xen/arch/x86/boot/build32.lds.S
> @@ -15,22 +15,54 @@
>   * with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -ENTRY(_start)
> +#undef ENTRY
> +
> +#ifdef FINAL
> +# define GAP 0
> +# define MULT 0
> +# define TEXT_START
> +#else
> +# define GAP 0x010200
> +# define MULT 1
> +# define TEXT_START 0x408020
> +#endif
> +# define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)
> +
> +ENTRY(dummy_start)
>  
>  SECTIONS
>  {
> -  /* Merge code and data into one section. */
> -  .text : {
> +  /* Merge code and read-only data into one section. */
> +  .text TEXT_START : {
> +        /* Silence linker warning, we are not going to use it */
> +        dummy_start = .;
> +
> +        /* Declare below any symbol name needed.
> +         * Each symbol should be on its own line.
> +         * It looks like a tedious work but we make sure the things we use.
> +         * Potentially they should be all variables. */
> +        DECLARE_IMPORT(__base_relocs_start);
> +        DECLARE_IMPORT(__base_relocs_end);
> +        . = . + GAP;
>          *(.text)
>          *(.text.*)
> -        *(.data)
> -        *(.data.*)
>          *(.rodata)
>          *(.rodata.*)
> +  }
> +
> +  /* Writeable data sections. Check empty.
> +   * We collapse all into code section and we don't want it to be writeable. */
> +  .data : {
> +        *(.data)
> +        *(.data.*)
>          *(.bss)
>          *(.bss.*)
>    }
> -
> +  /DISCARD/ : {
> +       *(.comment)
> +       *(.comment.*)
> +       *(.note.*)
> +  }
>    /* Dynamic linkage sections.  Collected simply so we can check they're empty. */
>    .got : {
>          *(.got)
> @@ -49,6 +81,7 @@ SECTIONS
>    }
>    .rel : {
>          *(.rel.*)
> +        *(.data.rel.*)

This looks like you're mixing up .data.rel (a data section, where some items
may require relocation) and .rel.data (the relocation section for .data). If
you want all .data.* empty, this section should be empty, too. (I also don't
think this would ever take effect, due to the earlier *(.data.*).)

Jan

