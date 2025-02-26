Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB7A462D4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896722.1305478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIRE-0004zo-1t; Wed, 26 Feb 2025 14:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896722.1305478; Wed, 26 Feb 2025 14:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIRD-0004xc-VA; Wed, 26 Feb 2025 14:31:03 +0000
Received: by outflank-mailman (input) for mailman id 896722;
 Wed, 26 Feb 2025 14:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnIRC-0004xL-EL
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:31:02 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cb04930-f44e-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 15:31:00 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390d6b29ba4so397961f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:31:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba587163sm23454675e9.36.2025.02.26.06.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:30:59 -0800 (PST)
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
X-Inumbo-ID: 4cb04930-f44e-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740580260; x=1741185060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oRopZ9VAfkEX62+B0+1BBmoCWS3ITmOl7/Yt4gcbRBM=;
        b=DR0d0MojkCx5xP3HcyT50JNJ3nkM0nw0/7jHlP98BxtgmWsx3M7zZwQ8ToAZLySCcL
         m/RyqY+Qb0aZ0ZS5HtqLQx88l9JscvqYsYPTLJBrBdFp7kSft0YsEsdIvQzixzfCG267
         82AJShPka9F+O4LdBzCH4QJP1Zfg3xwyNAypE2BmaIZ9skKeghP7YHJKA+L6SEobtX6U
         p0zzN26prn3Op/1WQwkB5K3/ySwzgKdG7ZhTq3keMFwpIMJ2XFXzBjRl3OcB6OR+yk6E
         pVG3hPYztkQNuNAhmmkWeztX/pCkZoKiSGO0nx39TNdfh9z5OP3KuxWq26T64UmU8fUw
         WaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580260; x=1741185060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRopZ9VAfkEX62+B0+1BBmoCWS3ITmOl7/Yt4gcbRBM=;
        b=E5QqSdCmK3xqaUjVp1BFevMbckGItHH6iagIyOYCaNnn0H3JhX0rm4XGcuZYCX1aFk
         7+Gz5tBmU8p+1oFea9R+Wbx+CDinG61zWgVxEfSzeo7t9EfUcR+hKJnu90pipB0PI1tD
         PExUEiIsARBDlJANYtVJanc09Zz7KVk8Me604Qk1uw1YAqkDwm/6inwyFKIAnTXelAur
         Ya5hiUhTUdVsYs7xIlVRKKzUAjKQljMtYbIFxUWX8or4GXy5xam7NAO1o7+sLD/o4OgX
         4ya1QUcVSqTz7Lc/w6yDqk+hgcBxNFFWSEh3xl0Z2KfyP0NSs+SyoI8zDyOi7LkXapaC
         Wnyg==
X-Forwarded-Encrypted: i=1; AJvYcCVee+AfuBJuAcgm+50gNLarug79Fthcufrccg1Dwa/oN/ssYtY2ZZ71Wjlb5kXThCsFc/Ya8KoA1Cw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5dE8bicKvte04ulImx/1zHQDaMokETvLO24yuWTWbc92w65Xh
	05n93MDIcVsrg+1ccWEHJYiSkwowI2RLE+N11aL3OmpItOm+NWqnYGKK34OwRw==
X-Gm-Gg: ASbGnctn/ZJ3ftbw+lXkcvyC38SaB+Ai5nYf+5WP9oCHg/g3toN0Wdiwj5lp2WA8wEB
	hE6PBuDXwj0VJ7ai7h8Nard2Kp0a+GBJZTLPZMuJk/pIyHuNePnWOp/wjp092qTmlS2vgInIe30
	v9IUpXJBoC1RCHp6xOX7AkdW8eIQRl0orB9G6O9PDgnrEyi8bMO3NKHVfIIal4Jm94oIy63exNX
	BOmVXrvsv2npLWqek/BLl8QRj+EklVaT7CDQP4T7WqNbSnBOnu68UiLy5YtDZDD+ZZrjUkwc0oX
	299zWoihU69v46XVuZ+VXW+6g+uc6eZejk3l7SIUjrIHfF4J1DkcRfpPQ5pZxYvYUD1sxxbJkGC
	yr/Ud3aew28A=
X-Google-Smtp-Source: AGHT+IFOC2Dqqp7NDMPjbB39Lp9uTRhZvp5w5WGqVWZf9kWxuxl0SrnPgEZZcBJqOaFe5qTtGoaHhQ==
X-Received: by 2002:a5d:648d:0:b0:38d:d701:419c with SMTP id ffacd0b85a97d-38f708279c3mr18582511f8f.41.1740580259806;
        Wed, 26 Feb 2025 06:30:59 -0800 (PST)
Message-ID: <f5a8262d-8397-46b0-83f9-5b597ac322e1@suse.com>
Date: Wed, 26 Feb 2025 15:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/ucode: Adjust parse_ucode() to match other list
 handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
 <20250225222905.1182374-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250225222905.1182374-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 23:29, Andrew Cooper wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2721,34 +2721,42 @@ performance.
>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>  
>  ### ucode
> -> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
> +> `= List of [ <integer>, scan=<bool>, nmi=<bool> ]`

While this makes doc fit present behavior, it is the behavior that is wrong.
It was - afaict - broken by 5ed12565aa32 ("microcode: rendezvous CPUs in NMI
handler and load ucode"). There should not be both an integer and "scan=".
(Really we should have taken measures to stay consistent even if multiple
"ucode=" were on the command line.) You actually say so ...

>      Applicability: x86
>      Default: `scan` is selectable via Kconfig, `nmi=true`
>  
> -Controls for CPU microcode loading. For early loading, this parameter can
> -specify how and where to find the microcode update blob. For late loading,
> -this parameter specifies if the update happens within a NMI handler.
> -
> -'integer' specifies the CPU microcode update blob module index. When positive,
> -this specifies the n-th module (in the GrUB entry, zero based) to be used
> -for updating CPU micrcode. When negative, counting starts at the end of
> -the modules in the GrUB entry (so with the blob commonly being last,
> -one could specify `ucode=-1`). Note that the value of zero is not valid
> -here (entry zero, i.e. the first module, is always the Dom0 kernel
> -image). Note further that use of this option has an unspecified effect
> -when used with xen.efi (there the concept of modules doesn't exist, and
> -the blob gets specified via the `ucode=<filename>` config file/section
> -entry; see [EFI configuration file description](efi.html)).
> -
> -'scan' instructs the hypervisor to scan the multiboot images for an cpio
> -image that contains microcode. Depending on the platform the blob with the
> -microcode in the cpio name space must be:
> -  - on Intel: kernel/x86/microcode/GenuineIntel.bin
> -  - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
> -When using xen.efi, the `ucode=<filename>` config file setting takes
> -precedence over `scan`. The default value for `scan` is set with
> -`CONFIG_UCODE_SCAN_DEFAULT`.
> +Controls for CPU microcode loading.
> +
> +In order to load microcode at boot, Xen needs to find a suitable update
> +amongst the modules provided by the bootloader.  Two kinds of microcode update
> +are supported:
> +
> + 1. Raw microcode containers.  The format of the container is CPU vendor
> +    specific.
> +
> + 2. CPIO archive.  This is Linux's preferred mechanism, and involves having
> +    the raw containers expressed as files
> +    (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a CPIO
> +    archive, typically prepended to the initrd.
> +
> +The `<integer>` and `scan=` options are mutually exclusive and select between
> +these two options.  They are also invalid in EFI boots (see below).

... here.

As to EFI boots: "scan=" ought to be usable there, as long as no "ucode="
was in the xen.efi config file. I think your code is correct in this regard,
it's just the wording here which is too strict.

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -113,11 +113,6 @@ void __init microcode_set_module(unsigned int idx)
>      ucode_mod_forced = 1;
>  }
>  
> -/*
> - * The format is '[<integer>|scan=<bool>, nmi=<bool>]'.

While personally I don't mind the removal, I think back at the time it was
specifically asked to (also) put it here.

Jan

