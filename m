Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A30A77F7C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 17:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934607.1336262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdt4-0004i8-Ho; Tue, 01 Apr 2025 15:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934607.1336262; Tue, 01 Apr 2025 15:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdt4-0004fH-Ee; Tue, 01 Apr 2025 15:50:50 +0000
Received: by outflank-mailman (input) for mailman id 934607;
 Tue, 01 Apr 2025 15:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzdt3-0004fB-MK
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 15:50:49 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1426846a-0f11-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 17:50:47 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso49821835e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 08:50:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff03715sm161055285e9.31.2025.04.01.08.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 08:50:46 -0700 (PDT)
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
X-Inumbo-ID: 1426846a-0f11-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743522647; x=1744127447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yP1evTyESBoe3kupzMWoyYCDNDlBmidN0AjqoSd5iAU=;
        b=HCfXg7dNPajBGkrbMjEyUZB7duhE10IwAhD053BPaLqlAoN2aT7Xefy41GN3CCzpp4
         3DKMVWXBoAPrZ30WVeIn6iMMgCbysW0p1cMQ/mTLNnDIoFwCIqJ1lKWs/4hUTxkpUFOz
         zckBii694ZNzAmIlG/rNmPmMAZFl9izPrUm1Vyb8E+U1YNQqRY2wVzsACtbquykXw9cM
         CpuFXyAkFki5d1JLePBahi//kRe8TzUa5vWDvQgOu5clJCyc6KONdv92ZbHJcpFEdmwt
         AJXg6/Z2//3//ADkwxqo9youPg8D/PgUbtucOmN2lj97yc71z3yK+Zz1r4O1FUMxw365
         nMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522647; x=1744127447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yP1evTyESBoe3kupzMWoyYCDNDlBmidN0AjqoSd5iAU=;
        b=McSEPehuKnWTos8vyrnmpm2DMJkE3ZA5PAB6HEC9s8vZjpADHxMXlUry1g9j/nN0g8
         ISBbMcsckEDnqzYAf56akrGK2k7sFAGBaVN0E6Zf0e9nZ7hW5AdsryPlYr620s375yh2
         qhK15YHvwZWRXwr67S3aQvUuxeh6umfma+d3WdHUWX0A3rMyxxfAZcdTqgXMtuf/mMCU
         PhzlgxwrvgWLp2pkMIe32dLFgh6iunt46oMgfSW3JjGQcbOuM1N+EL/67L+YwzH8iQ+Y
         LflD4/i05kPJq2s6XpX0pI9KyXmMXzo/SV69hueJVqBVnlYVj2gu58L+b/BnT7WYMoMV
         mZgA==
X-Forwarded-Encrypted: i=1; AJvYcCV3kSMfRwDIzSa1OsmuuWaB7+0KLuJgtmN365GKr5it954OfSzSjgdEwbpAA8ylmv6ohjY/OtXIETA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVakIqUW0vaSDDwWUtzwzDvmu5tQsXNrvvpNTmG0E9e9alqvjx
	Mg3FpTuGHjaTPdpZgqBkaJ3aU6LazjlOXTbiVQGoxD5SQ4SnIAjWNrf6AuU01oswhW8Xv9bg5Xo
	=
X-Gm-Gg: ASbGncvIUFT+P5kmuCcJXZNahQolS3m61ViawF11kyDqfyP1lWUfLUh9XMUXRTFwULe
	obSiKrqHp5MgSbsDs1G1WTK5oY5oR4dREKrXu5CivITFgq37wKnTPQkSeXrtR35vWNY8ZEB2PBQ
	mAB9NIvOQsrAb1pf1y7+8nKXoLnszakBNw7KeRCQkV8NRl8y0YbPWrRtbwKr1EYJCjeXAnQF4jd
	bVK8YB9hG3qaIA96DHewNeVLziXRjrm/FlXZ/Vm4csNZS1BS6++i8IS9IKsmyxX0lBKrNGUSFwz
	4YzOBIvvlsd1NvIAoVDrgF9xLoEySju+iYW2oXzHSVBYw0UkO4Ej9z2WknEu4/ieU4o25XLD9pt
	BTQrRax3cJHViCqRXy+Qe3gSri7o+qA==
X-Google-Smtp-Source: AGHT+IFpubCdsVR6vIH0dRAiFsYI4N35WJaUHlzSAAhoFtWzrxgvzfCw5MMJuqgIrUEfG9LJhopWPg==
X-Received: by 2002:a05:600c:3150:b0:43d:412e:8a81 with SMTP id 5b1f17b1804b1-43dbc6f89f7mr88502995e9.28.1743522647050;
        Tue, 01 Apr 2025 08:50:47 -0700 (PDT)
Message-ID: <27eb6cb1-b891-4fd5-a1eb-12ff1290f68e@suse.com>
Date: Tue, 1 Apr 2025 17:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] x86/mkreloc: use the string table to get names
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-4-roger.pau@citrix.com>
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
In-Reply-To: <20250401130840.72119-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> --- a/xen/arch/x86/efi/mkreloc.c
> +++ b/xen/arch/x86/efi/mkreloc.c
> @@ -17,6 +17,12 @@
>  #define PE_BASE_RELOC_HIGHLOW  3
>  #define PE_BASE_RELOC_DIR64   10
>  
> +/* The size of a symbol table entry is always 18 bytes. */
> +#define SYM_SIZE 18
> +
> +const char *string_table;
> +unsigned int string_table_size;

The way you use it, imo this wants to be uint32_t.

Both probably want to be static.

> @@ -25,6 +31,28 @@ static void usage(const char *cmd, int rc)
>      exit(rc);
>  }
>  
> +const char *get_name(const char *name)
> +{
> +    static char buffer[sizeof(((struct section_header *)NULL)->name) + 1] = {};

As this makes things section specific, may I suggest to name the function
e.g. get_section_name()? Also better to be static again.

> +    unsigned long offset;
> +
> +    if ( name[0] != '/' )
> +    {
> +        /*
> +         * Use a temporary buffer in case the name is 8 characters long, as
> +         * then there's no terminating null character in the input string.
> +         */
> +        strncpy(buffer, name, sizeof(buffer) - 1);
> +        return buffer;
> +    }
> +
> +    offset = strtoul(&name[1], NULL, 10);

Don't you need to nul-terminate the string here, too, to play safe? (Yes,
we don't expect this big a string table.)

> +    if ( !string_table || offset < 4 || offset >= string_table_size )

Considering how you reduce string_table_size after having read it from
the image, don't you mean "offset - 4 >= string_table_size" here? Also
below you use sizeof(string_table_size) instead of a literal 4.

> +        return name;
> +
> +    return &string_table[offset - 4];

Here as well.

> @@ -83,6 +111,31 @@ static unsigned int load(const char *name, int *handle,
>          exit(3);
>      }
>  
> +    if ( !string_table && pe_hdr.symbol_table )
> +    {
> +        char *strings;
> +
> +        if ( lseek(in, pe_hdr.symbol_table + pe_hdr.symbols * SYM_SIZE,
> +                   SEEK_SET) < 0 ||
> +             read(in, &string_table_size, sizeof(string_table_size)) !=
> +             sizeof(string_table_size) )
> +        {
> +            perror(name);
> +            exit(3);
> +        }
> +
> +        string_table_size -= sizeof(string_table_size);

You're careful of underflow above; better be careful here, too?

> +        strings = malloc(string_table_size);

You check for all other errors, just not here?

Jan

