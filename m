Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C897CBF15F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 18:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187495.1508876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVBwD-0004Vj-39; Mon, 15 Dec 2025 17:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187495.1508876; Mon, 15 Dec 2025 17:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVBwD-0004Tt-0L; Mon, 15 Dec 2025 17:00:45 +0000
Received: by outflank-mailman (input) for mailman id 1187495;
 Mon, 15 Dec 2025 17:00:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVBwC-0004Tn-2j
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 17:00:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 969aaf36-d9d7-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 18:00:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso18154695e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 09:00:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f639c132sm13567146f8f.35.2025.12.15.09.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 09:00:40 -0800 (PST)
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
X-Inumbo-ID: 969aaf36-d9d7-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765818041; x=1766422841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hhVDKiBBRCs0p9ctqMfDm6ayoFlhICw0kQHUDdjJieM=;
        b=dsBcvCOEYZW0KS23ZqkByKbnrgiFEe3eYdeTzjvW+vJqDWovXwSG4972n+o0Z2F4pQ
         qguwlWLpPdggjT5xSfmfL3O/awq2CFTo+3+SUo0S8TIQqcJWw215PopiP3P4/QOe179L
         jRdb9b9fgdya+zy59pl+qdZcJdmVg2Ozr5pbb7C2I78CWfkdl09vmC5Hb5vSi/2wbRgM
         GocJ6CDNOPBA3480VW41MgpCvIhyjCq6Q+ZkUPHfofpEgjzY13v35RxvKIHI5o0qjbgw
         QmpvltX2VqN4RzpG8Dm0d9+KhEdx2K/6qPpFE27GMaZFmOeri864iKEhjeTEXBGhgmXa
         n1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765818041; x=1766422841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhVDKiBBRCs0p9ctqMfDm6ayoFlhICw0kQHUDdjJieM=;
        b=MY6DQntWDe3Cw52s0ddiGPrSjQNaOC/YrG6O8KazFRvLZo24eORjqdCl1NAJYxRkXB
         7YxOV60tvxSTecNDpKZCiX68sOFn2aeTWD1wt24qPZl2o7itsyOPhpEbvqo4njO2K9bv
         GWuG73mHP6PGtZJ+QJyEb2i8wAn48Qfm7lddy15DYosPVEe0xUZbJKlToo6gsDQp9QKs
         f/7fdVLhr5ZmUH7sxXUrJByvWbH10C+Ge5DXQGQbyBjFjlLjnHo8L8YJQLbMBkClMnAU
         6UXWKNiZeuR17ItcUJ3SNRX8g6RuUy9h5jYkzPU8ybYhuiriHdji3prtJVsnkzAKQPXj
         mibw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8T0XgfUFpgjBKUE7cLkloSxDcwV/g6EeGUhv108qC6hM8bElpH3JwDCwCnOdjDy55AZbkgvkdEI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKTDl/UTagUtPcfW6q18Y/79iW26/KktdUBeLzR3uFs9ebEud8
	50uF9Ym4gXqmIiQUl79CR2MPvUuUgLh2YwphUVJT9r01KeSg3k0yNug2HD7uORxdCQ==
X-Gm-Gg: AY/fxX4obDWfzIarJCcaMwNx2dMesAZXKsK3isgN7zu6sceo1TYM4yJyGZluJy88hoz
	IEh4epc0Zu4QZN/MUYHFbxZPtnT4ErX1wbAVc48GVaSFAjscRCwwOXXaNhnrM79u+Ndvuh9Qfk5
	i1vuJvgpDocM2JmJYqKkk8ir5z4LSzkYfqSd/7Hjpt3WZYnl//SUVXK0KRZuyHzNCaNOMwKUtCV
	ZzUtRGaT67txHIMzPCfx9Lm4DP53asT/c+vkvAim+577NGAvTuza/yH9vtM9PafGt4sC8Wzv4GU
	I7ImzeILG1K6jaYlQ6f+d/0w3xjDjuEeXU++yifcukGy8/ie2GxBSEPA3oDrguIcQw6lnzM9rou
	9PAT5uvOiVG6LUMBhwEyrQe57NhkaI8hJSwNZOtMoRXKUdrFUNCkaX6uKJngV6y5c38U8ggOBnA
	tUvFatpZ9eAiL3kakJORM5lGlGfxJYXnmLLXE6DNHzVI9EXJoWGN6kuilrFQtQqUqtRSjgKYhB7
	fI=
X-Google-Smtp-Source: AGHT+IGOZUmESHwEmMO9Ne3aLJtxpBy1yi9TiruzsqJ6PuDoeCUcuEK7qdNEhIcQ4BXj9x/maQHb4A==
X-Received: by 2002:a05:600c:5296:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-47a8f89ba4amr100738765e9.4.1765818041122;
        Mon, 15 Dec 2025 09:00:41 -0800 (PST)
Message-ID: <b14362f4-aaa2-4ded-943f-4ad4a246f521@suse.com>
Date: Mon, 15 Dec 2025 18:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/ucode: Adjust parse_ucode() to match other list
 handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251215153245.2675388-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251215153245.2675388-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2025 16:32, Andrew Cooper wrote:
> parse_ucode() is abnormal compared to similar parsing elsewhere in Xen.
> 
> Invert the ucode_mod_forced check with respect to the "scan" and integer
> handling, so we can warn the user when we've elected to ignore the parameters,
> and yield -EINVAL for any unrecognised list element.
> 
> Rewrite the ucode= command line docs for clarity.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I'm not quite happy with ...

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2752,34 +2752,52 @@ performance.
>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>  
>  ### ucode
> -> `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
> +> `= List of [ <integer>, scan=<bool>, nmi=<bool>, digest-check=<bool> ]`

... this change when ...

>      Applicability: x86
>      Default: `scan` is selectable via Kconfig, `nmi,digest-check`
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
> +The `<integer>` and `scan=<bool>` options are mutually exclusive and select
> +between these two options.  Further restrictions exist for booting xen.efi
> +(see below).

... then you say verbally that the two are exclusive of one another. That's
what the | there was intended to indicate. IOW I would prefer that line to
be left alone, but I'm not intending to insist.

Jan

