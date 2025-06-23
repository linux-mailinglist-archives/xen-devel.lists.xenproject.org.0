Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E409AE49E8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 18:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022604.1398427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTjkI-000857-GC; Mon, 23 Jun 2025 16:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022604.1398427; Mon, 23 Jun 2025 16:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTjkI-00082a-DC; Mon, 23 Jun 2025 16:10:10 +0000
Received: by outflank-mailman (input) for mailman id 1022604;
 Mon, 23 Jun 2025 16:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTjkG-00082U-WD
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 16:10:09 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 874fbf5b-504c-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 18:10:06 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso2463119f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 09:10:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a627464sm8635569b3a.88.2025.06.23.09.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 09:10:05 -0700 (PDT)
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
X-Inumbo-ID: 874fbf5b-504c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750695006; x=1751299806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uePKkPU2TXujvE8O8ZTBeYsDZJqCErT8Vmq5w/Qluww=;
        b=IsFqif3EKkhv5HUmXX4rY9UoWKFCh7omNXdBZbaVhOVC6eFQi05r7C+nPolVTRNmCe
         A+TFN5STTLAkIOSmjWoB+mabHp5kn6bSHt2MT342hJag1mxrLrrZcgTIrKwgHN7ljVQr
         Y5SDCwtgH3WaFFm2692z5xlW84TIe8Q+VWk+311Xma1vpZPHZqdtPp2cpQlM+lno2+DR
         QtDKpaPRqk/hEoh+FNC8WnivJM1OmFbTziZ7JnTShZlFGgg4OBr8gf5zsukAdqAsqEdZ
         W7i3KohNKirrjSOq43w5MxeqX8aEdxYE66ZnCIzi018372jsZ/moQnYVYP2jx7/WabVu
         b/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695006; x=1751299806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uePKkPU2TXujvE8O8ZTBeYsDZJqCErT8Vmq5w/Qluww=;
        b=c3TrV2bWIMJkVREMEV2cBnybATHrXdY15p9IVJ70suLR28sDxOiFJcGGkafHEJKtsY
         kK+bwyeMvZsM0scsBL4+V/Y9I1xPQJGy6z206QubCvYt89qMMLgCVh/UKBOUoTxPhHii
         5x6nSDQKN5Y+TEzScFrA+O3KSmjCiGHo7XW61aGPgC8mYxvJeUBXKJRUlkizKk+z5uOc
         4WTm9zF2SdREkTQASfxEocW1Vl3E3jjsBId3waWsQ9HNT3ggHgaLQc/4fruCnQHpk/pu
         j+eOnNvpcG0VBJKl6AP7TYftnKGD4MX8qh5wjlrn76K1Ka/VWBSywVT79b42Cqs1nR9M
         UEKA==
X-Forwarded-Encrypted: i=1; AJvYcCU2whrGLNtE7LLqujh8E5ChvoCHbvVYWb3nL4NgyZ1oIRNV2Dl9csXTODf+i3pW3a2bwIwtlzgvfrw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5Q4nWSgXk9I5Znjab3eeL0f2ehuXhveN0v5+lp83FTflJ+V0T
	jL0oLSqQtc88TWUhMphCDMJ16p/k+wmW4+9F7hm5Tfy3soOTgny6A86L7w1XrvsM1Q==
X-Gm-Gg: ASbGncuA+QCGXja4SWEJXuwaddXSXTFHYdxqCV8qqZek81eYbOK7IjVaf7NYuqRWIAj
	LN+gKPshZPcVQCmlcsXLKb7FrM+uPWABzmP/4CaSqSyu25e5oBg+TOfTQi1fnmaHF0dg4sHsdrx
	FhWzqbSFA2/5NgZaeJnfjGeyKB21Bj+347QBS2Yhr+NKSWw0o9k4p/TLbIFfIbwNWZ3rGjvfhM9
	VA5RTyzfsRnluYOfVJ8NXJPYFVYSS7ogQE6ypRJNTdpB5CZhw4E+MissgWSKaGK2XyNg7eWc4Ru
	7uN2lRU9KvA3wMHB4mjlcxkMIO6yYOC1NMQUkmL5BTr/AQYJPAJcrlUamTmUKr69rrbZKXaQlvC
	637zjUAE9PcI5PTca6MLazrqQxukcezGg0fjyoMBkEcEM69s=
X-Google-Smtp-Source: AGHT+IHbg0ri65Vc5qpnkhvnGmrcY3za+gxMlDYNfPLvnOY7k8F4pwkmwztgBSZl7V0wp7OVAD5fWw==
X-Received: by 2002:a05:6000:25ca:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a6d1301e71mr10140162f8f.19.1750695006091;
        Mon, 23 Jun 2025 09:10:06 -0700 (PDT)
Message-ID: <feb513ba-83c2-4f2c-8eb1-602afd0a298e@suse.com>
Date: Mon, 23 Jun 2025 18:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/console: introduce domain_console struct
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250623013406.174027-1-dmukhin@ford.com>
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
In-Reply-To: <20250623013406.174027-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 03:34, dmkhn@proton.me wrote:
> @@ -769,22 +770,23 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>              } while ( --kcount > 0 );
>  
>              *kout = '\0';
> -            spin_lock(&cd->pbuf_lock);
> +            spin_lock(&cons->lock);
>              kcount = kin - kbuf;
>              if ( c != '\n' &&
> -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
> +                 cons->idx + kout - kbuf < DOMAIN_CONSOLE_BUF_SIZE - 1 )

The dropping of the parentheses around the pointer subtraction is
problematic: You open up UB opportunities this way, as evaluation order
changes. We had UBSAN trip up on similar constructs already in the past.

>              {
>                  /* buffer the output until a newline */
> -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> -                cd->pbuf_idx += (kout - kbuf);
> +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
> +                cons->idx += (kout - kbuf);

Here, otoh, the parentheses could be dropped while touching the line.

>              }
>              else
>              {
> -                cd->pbuf[cd->pbuf_idx] = '\0';
> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
> -                cd->pbuf_idx = 0;
> +                cons->buf[cons->idx] = '\0';
> +                guest_printk(cd,
> +                             XENLOG_G_DEBUG "%s%s\n", cons->buf, kbuf);

There's no need to wrap lines here, is there?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -371,6 +371,20 @@ struct evtchn_port_ops;
>  
>  #define MAX_NR_IOREQ_SERVERS 8
>  
> +/* Arbitrary value. */
> +#define DOMAIN_CONSOLE_BUF_SIZE 256

Nit: The value isn't entirely arbitrary.

> +/* Domain console settings. */
> +struct domain_console {
> +    /* hvm_print_line() and guest_console_write() logging. */
> +    char buf[DOMAIN_CONSOLE_BUF_SIZE];

This placement will negatively affect code generation on at least x86.
I did suggest putting the array at the end, for this very reason.

Jan

