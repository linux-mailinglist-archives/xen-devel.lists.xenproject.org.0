Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3EA2F31C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 17:21:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884886.1294631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thWVs-00022g-Ib; Mon, 10 Feb 2025 16:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884886.1294631; Mon, 10 Feb 2025 16:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thWVs-000219-Dq; Mon, 10 Feb 2025 16:20:00 +0000
Received: by outflank-mailman (input) for mailman id 884886;
 Mon, 10 Feb 2025 16:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thWVr-000213-7p
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 16:19:59 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd2c89ff-e7ca-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 17:19:55 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab7ca64da5dso151984666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 08:19:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7bf9ae406sm256165166b.82.2025.02.10.08.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:19:54 -0800 (PST)
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
X-Inumbo-ID: dd2c89ff-e7ca-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739204395; x=1739809195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ymQ7+UR1tvSFdXu6qsGWrqn+4lXo47T1oKSxkLWDgPc=;
        b=GaBS0z1geAI/BvjWxYBPgwTdviCDblk0aWkBeuRTIqdOrVMj/ajs8X7OUoOqUrPHyr
         vSLi3n17J9JWED+7WtgguO+hZl0aS06Jtkxl1KZzeQr40JJBvtlzPYCRhnW/SXSamNVU
         ljkLUX5XJDceMIYYmVMpAUBxUt62YF5VVfeuUucKx4XsD9SKm7FWuZCWUMt2H0BMF5Np
         C8EUjx5dIN421fRTggOqG7S4Jq5ctufz84/iITaiPjW5nHJ+wiv8NTbT4Y7D6unzgS+W
         +58ZWH61gbydo8mlXKK4UYeXev/areKlhJ+sZO5lIhn0heWmlsemJhyCeRgJYq8KVHLB
         c9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204395; x=1739809195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymQ7+UR1tvSFdXu6qsGWrqn+4lXo47T1oKSxkLWDgPc=;
        b=ksvNS7PP3Sb1P+jWZWxZ5J60nKvs9Kv5vGf1iXQUOMHjj+6Fn3oH1gRsJ2t0ezMAbo
         Gi0bAimJ8qRk5v5lIeac8D4yR34ZdQSw4A2RWzk6Q27y0b47Cg4FdtRApZy4fosfh0zX
         vOmwobdE27EN8CK8ZJ7zs7c+g+O+TThXIw3XxLxpICx3OFbt/o0+ezzvJ+zDiLXABARR
         r3lAX0LRr4MbdBKy68OAzQyvnbRSBI+YKCr1iNy6ccK2Jr95jAB7bKiaRC/U9lZAhDwS
         ujmMX5w15vVjjE4VvqsIbPDXTzG/ZakbTeBCvAV91R6UXdXJn41w+QqiRCVXghRNa7Ev
         VfOA==
X-Forwarded-Encrypted: i=1; AJvYcCUryA0/xjWzOgvSQt/3uFZI1RRnB0YmCOdNDVRKdKd7/8U0m1VHt98zENAey4wXHSstWkLkuDnNpzE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrNinA5nVRYu211PvvbSB4nXXraQCghCTPKdZkHgWLCxN/B9zC
	VqtCmuNhx47q6Yg3PxDFQN/G85YmB5DtUyGbi25ABHn7X8jpz7amDL0GNP8mqA==
X-Gm-Gg: ASbGnculfOJXNA6/kZVL+1pzDsofQ/WcYmcrp6Gk0LIOPkY596KRu/XrR4EINEbpTDh
	nBHpoEcpIVl9xYT6lnjUV2QnfIo55JqVU+VP9pdiBZp+ao9DBYszrXk+LsVd2JGtkVAe+jaamQX
	qmr94MrhQSErzLOAm9f3YbvrKG/Rb/rasZSoSlnvuL8SeF0z0sZ2Hwa/0nkHNSqrghZDKmrSPR+
	C8zt7fp5DS6R0nAI7sUOZydrU4aKg9PJnl1E07DMePYsqmslaXgMeSkcY1hDk390W9m4xF3u+X8
	d5sp0k/lLDRxSci/G/uBknZ5ehVJC5rCuAEz6YveDgVjkaQVIucZ4CHc54hbx6fPlEKtCtuu40p
	o
X-Google-Smtp-Source: AGHT+IHldBaRDDD4QoUSSMFTCbRK+ci/xMIZ2qnTSRoG5QNC5hyG2jN9LO6nNO4zhyEz+CZtKSiFCA==
X-Received: by 2002:a17:906:c105:b0:ab7:d1d0:1a84 with SMTP id a640c23a62f3a-ab7d1d01b6bmr148629166b.4.1739204394606;
        Mon, 10 Feb 2025 08:19:54 -0800 (PST)
Message-ID: <18030e36-ac28-42e0-9bcb-2457c0281273@suse.com>
Date: Mon, 10 Feb 2025 17:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v5] xen/riscv: identify specific ISA supported by
 cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <39eacdb6312988fb746e3dff7e29db2f9fcef614.1738958635.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <39eacdb6312988fb746e3dff7e29db2f9fcef614.1738958635.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2025 21:07, Oleksii Kurochko wrote:
> +/*
> + * The canonical order of ISA extension names in the ISA string is defined in
> + * chapter 27 of the unprivileged specification.
> + *
> + * The specification uses vague wording, such as should, when it comes to
> + * ordering, so for our purposes the following rules apply:
> + *
> + * 1. All multi-letter extensions must be separated from other extensions by an
> + *    underscore.
> + *
> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
> + *    single-letter extensions and before any higher-privileged extensions.
> + *
> + * 3. The first letter following the 'Z' conventionally indicates the most
> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> + *    If multiple 'Z' extensions are named, they must be ordered first by
> + *    category, then alphabetically within a category.
> + *
> + * 4. Standard supervisor-level extensions (starting with 'S') must be listed
> + *    after standard unprivileged extensions.  If multiple supervisor-level
> + *    extensions are listed, they must be ordered alphabetically.
> + *
> + * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
> + *    after any lower-privileged, standard extensions.  If multiple
> + *    machine-level extensions are listed, they must be ordered
> + *    alphabetically.
> + *
> + * 6. Non-standard extensions (starting with 'X') must be listed after all
> + *    standard extensions. If multiple non-standard extensions are listed, they
> + *    must be ordered alphabetically.
> + *
> + * An example string following the order is:
> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> + *
> + * New entries to this struct should follow the ordering rules described above.
> + *
> + * Extension name must be all lowercase (according to device-tree binding)
> + * and strncmp() is used in match_isa_ext() to compare extension names instead
> + * of strncasecmp().
> + */
> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> +};
> +
> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),

Why would these last four (Zifencei below) not be included in #ifdef
CONFIG_RISCV_ISA_RV64G, just like ...

> +#ifdef CONFIG_RISCV_ISA_C
> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
> +#endif

.. this one is?

> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +};

Despite earlier answers to the same question, looking at just what the
patch adds I still can't conclude how a system offering the B extension
(under that name) will satisfy our requirement of Zbb. It's okay if you
don't want to make adjustments to the code for now, but this at the very
least wants clarifying in the patch description. Better would be by way
of a code comment here.

> +static bool is_lowercase_extension_name(const char *str)

__init ?

> +static int __init riscv_isa_parse_string(const char *isa,
> +                                         unsigned long *out_bitmap)
> +{
> +    if ( (isa[0] != 'r') && (isa[1] != 'v') )
> +        return -EINVAL;
> +
> +#if defined(CONFIG_RISCV_32)
> +    if ( isa[2] != '3' && isa[3] != '2' )
> +        return -EINVAL;
> +#elif defined(CONFIG_RISCV_64)
> +    if ( isa[2] != '6' && isa[3] != '4' )
> +        return -EINVAL;
> +#else
> +# error "unsupported RISC-V bitness"
> +#endif
> +
> +    /*
> +     * In unpriv. specification (*_20240411) is mentioned the following:
> +     * (1) A RISC-V ISA is defined as a base integer ISA, which must be
> +     *     present in any implementation, plus optional extensions to
> +     *     the base ISA.
> +     * (2) Chapter 6 describes the RV32E and RV64E subset variants of
> +     *     the RV32I or RV64I base instruction sets respectively, which
> +     *     have been added to support small microcontrollers, and which
> +     *     have half the number of integer registers.
> +     *
> +     * What means that isa should contain, at least, I or E.
> +     *
> +     * As Xen isn't expected to be run on microcontrollers and according
> +     * to device tree binding the first extension should be "i".
> +     */
> +    if ( isa[4] != 'i' )
> +        return -EINVAL;
> +
> +    isa += 4;
> +
> +    while ( *isa )
> +    {
> +        const char *ext = isa++;
> +        const char *ext_end = isa;
> +
> +        switch ( *ext )
> +        {
> +        case 'x':
> +            printk_once("Vendor extensions are ignored in riscv,isa\n");
> +            /*
> +             * To skip an extension, we find its end.
> +             * As multi-letter extensions must be split from other multi-letter
> +             * extensions with an "_", the end of a multi-letter extension will
> +             * either be the null character or the "_" at the start of the next
> +             * multi-letter extension.
> +             */
> +            for ( ; *isa && *isa != '_'; ++isa )
> +                if ( unlikely(!isalnum(*isa)) )
> +                    goto riscv_isa_parse_string_err;
> +
> +            ext_end = NULL;
> +            break;
> +
> +        case 's':
> +            /*
> +             * Workaround for invalid single-letter 's' & 'u' (QEMU):
> +             *   Before QEMU 7.1 it was an issue with misa to ISA string
> +             *   conversion:
> +             *     https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
> +             *   Additional details of the workaround on Linux kernel side:
> +             *     https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
> +             *
> +             * No need to set the bit in riscv_isa as 's' & 'u' are
> +             * not valid ISA extensions. It works unless the first
> +             * multi-letter extension in the ISA string begins with
> +             * "Su" and is not prefixed with an underscore.
> +             */
> +            if ( ext[-1] != '_' && ext[1] == 'u' )
> +            {
> +                ++isa;
> +                ext_end = NULL;
> +                break;
> +            }
> +            fallthrough;
> +        case 'z':
> +            /*
> +             * Before attempting to parse the extension itself, we find its end.
> +             * As multi-letter extensions must be split from other multi-letter
> +             * extensions with an "_", the end of a multi-letter extension will
> +             * either be the null character or the "_" at the start of the next
> +             * multi-letter extension.
> +             *
> +             * Next, as the extensions version is currently ignored, we
> +             * eliminate that portion. This is done by parsing backwards from
> +             * the end of the extension, removing any numbers. This may be a
> +             * major or minor number however, so the process is repeated if a
> +             * minor number was found.
> +             *
> +             * ext_end is intended to represent the first character *after* the
> +             * name portion of an extension, but will be decremented to the last
> +             * character itself while eliminating the extensions version number.
> +             * A simple re-increment solves this problem.
> +             */
> +            for ( ; *isa && *isa != '_'; ++isa )
> +                if ( unlikely(!isalnum(*isa)) )
> +                    goto riscv_isa_parse_string_err;
> +
> +            ext_end = isa;
> +
> +            if ( !isdigit(ext_end[-1]) )
> +                break;
> +
> +            while ( isdigit(*--ext_end) )
> +                ;
> +
> +            if ( ext_end[0] != 'p' || !isdigit(ext_end[-1]) )
> +            {
> +                ++ext_end;
> +                break;
> +            }
> +
> +            while ( isdigit(*--ext_end) )
> +                ;
> +
> +            ++ext_end;
> +            break;
> +
> +        default:
> +            /*
> +             * Things are a little easier for single-letter extensions, as they
> +             * are parsed forwards.
> +             *
> +             * After checking that our starting position is valid, we need to
> +             * ensure that, when isa was incremented at the start of the loop,
> +             * that it arrived at the start of the next extension.
> +             *
> +             * If we are already on a non-digit, there is nothing to do. Either
> +             * we have a multi-letter extension's _, or the start of an
> +             * extension.
> +             *
> +             * Otherwise we have found the current extension's major version
> +             * number. Parse past it, and a subsequent p/minor version number
> +             * if present. The `p` extension must not appear immediately after
> +             * a number, so there is no fear of missing it.
> +             */
> +            if ( unlikely(!isalpha(*ext)) )
> +                goto riscv_isa_parse_string_err;
> +
> +            if ( !isdigit(*isa) )
> +                break;
> +
> +            while ( isdigit(*++isa) )
> +                ;
> +
> +            if ( *isa != 'p' )
> +                break;
> +
> +            if ( !isdigit(*++isa) )
> +            {
> +                --isa;
> +                break;
> +            }
> +
> +            while ( isdigit(*++isa) )
> +                ;
> +
> +            break;
> +        }
> +
> +        /*
> +         * The parser expects that at the start of an iteration isa points to the
> +         * first character of the next extension. As we stop parsing an extension
> +         * on meeting a non-alphanumeric character, an extra increment is needed
> +         * where the succeeding extension is a multi-letter prefixed with an "_".
> +         */
> +        if ( *isa == '_' )
> +            ++isa;
> +
> +        if ( unlikely(!ext_end) )
> +            continue;
> +
> +        match_isa_ext(ext, ext_end, out_bitmap);
> +    }
> +
> +    return 0;
> +
> +riscv_isa_parse_string_err:

Nit: Labels indented by at least one blank, please. See ./CODING_STYLE.

> +    printk("illegal symbol %c in riscv,isa string\n", *isa);

You may want to consider to include %c in quotes, such that even for e.g.
a blank it'll be clear to the observer of the log message what is meant.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef ASM__RISCV__CPUFEATURE_H
> +#define ASM__RISCV__CPUFEATURE_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/stdbool.h>
> +
> +/*
> + * These macros represent the logical IDs of each multi-letter RISC-V ISA
> + * extension and are used in the ISA bitmap. The logical IDs start from
> + * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
> + * letter extensions and are used in enum riscv_isa_ext_id.
> + *
> + * New extensions should just be added to the bottom, rather than added
> + * alphabetically, in order to avoid unnecessary shuffling.
> + */
> +#define RISCV_ISA_EXT_BASE  26
> +
> +enum riscv_isa_ext_id {
> +    RISCV_ISA_EXT_a,
> +    RISCV_ISA_EXT_c,
> +    RISCV_ISA_EXT_d,
> +    RISCV_ISA_EXT_f,
> +    RISCV_ISA_EXT_h,
> +    RISCV_ISA_EXT_i,
> +    RISCV_ISA_EXT_m,
> +    RISCV_ISA_EXT_q,
> +    RISCV_ISA_EXT_v,

I'm sorry to be picky, but: If you use lower case letters here, why would
...

> +    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,

... e.g. this not be RISCV_ISA_EXT_Zicntr or RISCV_ISA_EXT_zicntr? In the
latter case this could even be leveraged to simplify populating of the two
arrays (RISCV_ISA_EXT_DATA() could then get away with just a single
parameter).

Jan

