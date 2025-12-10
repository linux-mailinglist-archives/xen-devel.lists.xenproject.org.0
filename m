Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CE2CB260B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 09:18:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182632.1505484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFOV-0000au-Ir; Wed, 10 Dec 2025 08:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182632.1505484; Wed, 10 Dec 2025 08:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFOV-0000ZE-GG; Wed, 10 Dec 2025 08:17:55 +0000
Received: by outflank-mailman (input) for mailman id 1182632;
 Wed, 10 Dec 2025 08:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTFOU-0000Z8-56
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 08:17:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b896bda3-d5a0-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 09:17:51 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso55991675e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 00:17:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8f85sm37233924f8f.5.2025.12.10.00.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 00:17:50 -0800 (PST)
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
X-Inumbo-ID: b896bda3-d5a0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765354671; x=1765959471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v1upXWO6waVz4r+zxE5tjeRvwUENGTF8GKiALmJizbU=;
        b=OCnM3uRbEDzv659y4U5pdCRyqXjtN2Hc6134zEZzWaiRZuCLGuYnF3Mg6mggiqbrJ2
         PEPHEgMYUJh9JPd9bK2W58LI+mX0eBdJGx0YMCtdBejp3JwIr6d3Xc3GXlZwHFS5Janc
         jd2ODuVEt1CotRXju3j6TE9kI6fzjJ6CtLSPrhREP1HaaF8FgBSAUFwp5uRs5XEA48Tq
         EgBQu9hn2TwhvsPdNk85hlsXg4CQDpfQu7hZtXE0PwlDFEQvp6RnFDderlrLKjbFTs5u
         tb3fWnui5dnESdHIugAXY2fxc58Upw02TCPGMY28jd3EUWyQh1XxG7EOx1j5Dq7JJ1Vb
         Mj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354671; x=1765959471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1upXWO6waVz4r+zxE5tjeRvwUENGTF8GKiALmJizbU=;
        b=cFc0WHmP3HqM+5u46JjatsH3n7gYZeJ5zrdzJVsPPriVw6eYbzf/xrl4l501IbKd28
         h+wneGJceLTHv9Pp7MGV66K3KMnfuF/jIKlWTYnuWrzyOwZ9zXFKDOLLf/GEnhdC2rqY
         wpd/c6XdPnE+CpHMbTC9u+86WLQaGIEYQrBw4Me22kwXdDOhcixnpS08TsTvkecVENgh
         S2PTCWFLT2n+Ni0Cf5sPESzR6sysLep8fPU+iTVTwj79bYrSxEBJ2oKCjwpJHGO/6g8b
         p+3kFgbrbmeBZvv22njg5kX7Q5vcSn9HnL5FOhARoQhOTNMoXblQtCoTMHzFqtCE/1Tp
         Fb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVj532ctlsOq1lmkCEMpV+k47Ttzo/Z7fdJzyMSc37wCM6Q5f8Ow6CekL4ywhUg0Ois5nM1ei2jcQU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgRH4OHKLZNon8CD+64pTG5g5X4zrD0wS44LoHnRIJ6ObPxUop
	QpTWvHribRzAU6L9lAqVOMFJeyH4alwjeI0pNzmkb/EJ+lhm+xAh+Fi1Cx4gzCP+zg==
X-Gm-Gg: ASbGncsP0h4h5hL+2Sh9Q0lFruI6XMgeLVgsUNX7OqjVHI/Q9i34pjwAOP6RVXaKlxz
	qNAjHWOE8X1dhAAO9kPBWmObjNVH867V+1XoziSgIWYu+o2in+JSwhaBZPE6FKO5ERb8pJACT4N
	Id5UldNHX5WpudWuwGtGGRfDtmuEJ3hPi+8cp7vY4Zo0jD+KYEDWNCSrYyk2focDAd3qx7kwM+H
	y9OazAFacu4uBGYRWrFImG6WzdzIceGStqfYekCi6LI4i8RT1Aty+PGuSfyDdMw+zsyII5w6oJu
	UGG+8ElVvA3t+C4v3SROzpJkVkwFSolGDWvsBfhgjeKURbpJb2x3FOmBgn9dZd3UOoRqtEsPvHF
	boSPqHalarPGz3nps/563wuR6NB9i6v//YkqF86dMeiCBxDAgkn0XZTQkCTM/t7lQ6dgdFFtCwG
	bJmoD2PTb88M9YBGFr33DeqIz+MocgiNMJeVT/WkJxMWCeqpqT0TEfwlHHKrvb/BPPGkCQ7NvWB
	M0=
X-Google-Smtp-Source: AGHT+IEYa0P25ZSDvRtu9wnzfKhlKv/yrtQj6rA7B1xwizZYsKkMx/mAjHzKARKeSD1upcsQnhSozQ==
X-Received: by 2002:a05:600c:4e56:b0:471:9da:5252 with SMTP id 5b1f17b1804b1-47a8379b429mr13642825e9.29.1765354671191;
        Wed, 10 Dec 2025 00:17:51 -0800 (PST)
Message-ID: <a734eeb0-c3f2-4880-86ee-7eeeb7beeacf@suse.com>
Date: Wed, 10 Dec 2025 09:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Victor Lira <victorm.lira@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
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
In-Reply-To: <20251209214728.278949-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 22:47, Jason Andryuk wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -469,10 +469,13 @@ all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
>  
>  include $(srctree)/arch/$(SRCARCH)/arch.mk
>  
> +XEN_FINAL_LDFLAGS-$(CONFIG_GC_SECTIONS) := --gc-sections
> +
>  # define new variables to avoid the ones defined in Config.mk
>  export XEN_CFLAGS := $(CFLAGS)
>  export XEN_AFLAGS := $(AFLAGS)
>  export XEN_LDFLAGS := $(LDFLAGS)
> +export XEN_FINAL_LDFLAGS := $(LDFLAGS) $(XEN_FINAL_LDFLAGS-y)
>  export CFLAGS_UBSAN

Imo the introduction of XEN_FINAL_LDFLAGS would best be a separate, prereq
change. That could then also go in already while the KEEP() issue is still
being sorted.

The appending of --gc-sections should then also be truly appending, so make
sure that e.g. anything set by arch/$(SRCARCH)/arch.mk wouldn't be purged
again. IOW I think ahead of that include we want

XEN_FINAL_LDFLAGS-y :=

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -680,4 +680,13 @@ config PM_STATS
>  	  Enable collection of performance management statistics to aid in
>  	  analyzing and tuning power/performance characteristics of the system
>  
> +config GC_SECTIONS
> +	bool "Garbage Collect Sections"
> +	select CC_SPLIT_SECTIONS
> +	help
> +	  During final linking, garbage collect unused sections.  This will
> +	  reduce the size of the final Xen binary
> +
> +	  Only supported for ELF/Multiboot xen/xen.gz, not EFI xen.efi.

This last sentence is x86-centric, which it shouldn't be here (or it should
say that this is an x86-only aspect).

I also wonder whether this wouldn't better live next to CC_SPLIT_SECTIONS.

Jan

