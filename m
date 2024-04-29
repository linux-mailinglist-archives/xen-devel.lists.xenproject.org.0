Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5E8B5AEE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 16:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714103.1115110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Rf5-0004Cz-Gq; Mon, 29 Apr 2024 14:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714103.1115110; Mon, 29 Apr 2024 14:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Rf5-0004Af-Cz; Mon, 29 Apr 2024 14:07:19 +0000
Received: by outflank-mailman (input) for mailman id 714103;
 Mon, 29 Apr 2024 14:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1Rf3-0004AZ-TL
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 14:07:17 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c83fad58-0631-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 16:07:15 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2df83058d48so30641231fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 07:07:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c4e4800b0041bf7da4200sm7719713wmq.33.2024.04.29.07.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 07:07:14 -0700 (PDT)
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
X-Inumbo-ID: c83fad58-0631-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714399635; x=1715004435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wHrMCtjkgYJaxETiqT5C6GJzomsBeRYSTnV6O3Lel+E=;
        b=QQB2IyJzvjnpTrZVUyT+3XrXXFdcYcG23SLEqB3eY9e2PqeighvoDBdBgXORzIOmp2
         mgmYJwUknyIljEuG9ERaSCgnNMG0VTPoQW6ZZNwnoeZsrEP2y1ZYlgpi521YPFswNRu+
         4DJ/k7dSPgcjo607h0EfXOoDVSMf8RgNtb8SlIQ1DsdYQSRVZXS+F/eIeKompo4JtpeG
         yiDikdu1lX4boiax1L8RxUshLV1c0CzMBOnbANJj1RnRVKfz+HXHOK57pfAC7rutzviV
         42/HOQj1/TLlCEJ8oUfWWMm2wU1Fizrqe1QLTm/wi6t0S3eduxo379n/ak8gxqtuxpuH
         GejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399635; x=1715004435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHrMCtjkgYJaxETiqT5C6GJzomsBeRYSTnV6O3Lel+E=;
        b=LDebLVYhRm/WhSfwkB/BcJBAsjFkVZTv/rX/IMx4ybPw0/IwT53vLuZ+9zee+MKJca
         sHgbCrLkyB99eYUPcy8v8+HmDyQwkcf98DshjhA1TBeXfStYWZOqTI9Xsacrwg6XZhgj
         jfjT8gxqkW1chmGGDeOY8nnDnVeIdp7SvzBxrszw3pr3tfXBjvn0H2bSt2gg4Xpy3HTm
         pniRvtoccKvn8oWKx5qyjlBJxbEwJVSrYmgZxgIRkDsihdVaWF3OheC/w4GeY8r1Kd3D
         0/HfndLGJz3ADr1IAYDPuw+5RW3oSFlL1Noco14epRrH+3djhgj2yP8JRlFr/PeHzcQb
         gKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO4nenAWFGC9B7Qb2go1fWGOEGLdrxsa4eTaTf1lZDkirbjzbQfFXNEeyT+FG9v0mdUQBHjRphojqPKeAlEvltG4OW06Q9CkGhM57z2J0=
X-Gm-Message-State: AOJu0YwcBvnKSmW3q6OkGM4yZVS0XccVdsX5wRou9emMkSkNr/FlkczU
	DVDXfazGRnbqzX3v/SmRfL2jNypgebMVN225MX+HO9VUF6Zv2hSEScJheo6Low==
X-Google-Smtp-Source: AGHT+IGaDl7737BQKYigAVMi3feamdn7ZQa7u3mUAbtwxqiyNsqewEAV/CkOUNRsnZuZxmAxkMJF0w==
X-Received: by 2002:a2e:8605:0:b0:2d8:4158:fa64 with SMTP id a5-20020a2e8605000000b002d84158fa64mr7129941lji.35.1714399634620;
        Mon, 29 Apr 2024 07:07:14 -0700 (PDT)
Message-ID: <6fc4097d-102e-4cee-bf19-b36d8cb9de2c@suse.com>
Date: Mon, 29 Apr 2024 16:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] gzip: refactor and expand macros
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-3-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240424163422.23276-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 18:34, Daniel P. Smith wrote:
> This commit refactors macros into proper static functions. It in-place expands
> the `flush_output` macro, allowing the clear removal of the dead code
> underneath the `underrun` label.

But it's NEXTBYTE() which uses the label, not flush_output(). I'm actually
unconvinced of its expanding / removal.

> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -25,8 +25,6 @@ typedef unsigned char   uch;
>  typedef unsigned short  ush;
>  typedef unsigned long   ulg;
>  
> -#define get_byte()      (inptr < insize ? inbuf[inptr++] : fill_inbuf())
> -
>  /* Diagnostic functions */
>  #ifdef DEBUG
>  #  define Assert(cond, msg) do { if (!(cond)) error(msg); } while (0)
> @@ -52,10 +50,14 @@ static __init void error(const char *x)
>      panic("%s\n", x);
>  }
>  
> -static __init int fill_inbuf(void)
> -{
> -    error("ran out of input data");
> -    return 0;

I'm not convinced of the removal of this as a separate function. It only
calling error() right now could change going forward, so I'd at least
expect a little bit of a justification.

> +static __init uch get_byte(void) {

Nit: Brace goes on its own line. Also for (effectively) new code it would
be nice if __init (and alike) would be placed "canonically", i.e. between
type and identifier.

> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -119,6 +119,18 @@ static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
>  
>  #endif /* !__XEN__ */
>  
> +/*
> + * The inflate algorithm uses a sliding 32 K byte window on the uncompressed
> + * stream to find repeated byte strings.  This is implemented here as a
> + * circular buffer.  The index is updated simply by incrementing and then
> + * ANDing with 0x7fff (32K-1).
> + *
> + * It is left to other modules to supply the 32 K area.  It is assumed
> + * to be usable as if it were declared "uch slide[32768];" or as just
> + * "uch *slide;" and then malloc'ed in the latter case.  The definition
> + * must be in unzip.h, included above.

Nit: s/definition/declaration/ ?

> + */
> +#define wp outcnt
>  #define slide window
>  
>  /*
> @@ -150,21 +162,6 @@ static int inflate_dynamic(void);
>  static int inflate_block(int *);
>  static int inflate(void);
>  
> -/*
> - * The inflate algorithm uses a sliding 32 K byte window on the uncompressed
> - * stream to find repeated byte strings.  This is implemented here as a
> - * circular buffer.  The index is updated simply by incrementing and then
> - * ANDing with 0x7fff (32K-1).
> - *
> - * It is left to other modules to supply the 32 K area.  It is assumed
> - * to be usable as if it were declared "uch slide[32768];" or as just
> - * "uch *slide;" and then malloc'ed in the latter case.  The definition
> - * must be in unzip.h, included above.

Oh, an earlier comment just moves up. Is there really a need for this
extra churn?

> @@ -224,7 +221,7 @@ static const ush mask_bits[] = {
>      0x01ff, 0x03ff, 0x07ff, 0x0fff, 0x1fff, 0x3fff, 0x7fff, 0xffff
>  };
>  
> -#define NEXTBYTE()  ({ int v = get_byte(); if (v < 0) goto underrun; (uch)v; })
> +#define NEXTBYTE()  (get_byte()) /* get_byte will panic on failure */

Nit: No need for the outer parentheses.

> @@ -1148,8 +1135,8 @@ static int __init gunzip(void)
>      NEXTBYTE();
>      NEXTBYTE();
>  
> -    (void)NEXTBYTE();  /* Ignore extra flags for the moment */
> -    (void)NEXTBYTE();  /* Ignore OS type for the moment */
> +    NEXTBYTE();  /* Ignore extra flags for the moment */
> +    NEXTBYTE();  /* Ignore OS type for the moment */

In Misra discussions there were indications that such casts may need (re-)
introducing. Perhaps better leave this alone, the more when it's not
really fitting the patch's purpose?

Jan

