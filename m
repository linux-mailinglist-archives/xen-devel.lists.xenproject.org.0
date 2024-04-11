Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60A8A1FB9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 21:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704193.1100425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0Q8-0006Yq-A2; Thu, 11 Apr 2024 19:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704193.1100425; Thu, 11 Apr 2024 19:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0Q8-0006WH-7L; Thu, 11 Apr 2024 19:49:16 +0000
Received: by outflank-mailman (input) for mailman id 704193;
 Thu, 11 Apr 2024 19:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rv0Q7-0006WB-2P
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 19:49:15 +0000
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [2607:f8b0:4864:20::a2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c722a5-f83c-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 21:49:12 +0200 (CEST)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4daa83054easo45359e0c.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 12:49:12 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u3-20020a0cdd03000000b0069b53e6cc5bsm274476qvk.94.2024.04.11.12.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 12:49:09 -0700 (PDT)
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
X-Inumbo-ID: 91c722a5-f83c-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712864952; x=1713469752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=foP/h3FxkOHZc0fxJCK6lQ8HGxx6TvDZYxOB8aJlUNg=;
        b=VNki9vZ7qhKuvgQ9lzMmO8VpqzSg2c8vyBAicuNuhn46Sp2x24/fGwr2kBlpN95L4q
         eHwyGkFGWrfKqY8VtR1nLvKQ/aPKU6M3MUsuGz0pVWs3Wb97G/4nlg+SpCGgpdpKkgkP
         DuQYiUCxYkjsikoQqt6LplX6sJj5TAPMvIMXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712864952; x=1713469752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foP/h3FxkOHZc0fxJCK6lQ8HGxx6TvDZYxOB8aJlUNg=;
        b=RZQQPFdvMvKjlrcXOl/vs3JPp70Jz+vFNkW2B0q8x54oVElr9Fgxf0BwhoWYJ93r/T
         xILZcSvbKLScOYDtFDsETYkMHwixUtxQSjZXV3CQLl0fUeQbfGPfWAsGsXY77ibtTRWy
         kEEo9yr8cA+I231IoBuWw0OIBvbpE0yPZmneKbIltXTkiM4phT9402K/hOBJtbp5uLf3
         yjBR4nJmclS2U+HmP7NjBsX25uh9Vj4PWVGPJdYhZVYhCmy7uyZ4RWayd7wEP/Z0UmPg
         2D89Ifi7kh7IPYpOz5GiL5cVuTM9PjWvlhbjUGBR4fBivVvS4NFh7Qy5CQO/Bn2/uSyN
         RYEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVVchvgqhzChxW7yn32th91KFHHzpdp71t9mXjpXKmagmjBrPX6XZd/c40hPShNhwFCxjjuudExGKmutE0hZSy9utThSlPWITAu6t0s2c=
X-Gm-Message-State: AOJu0YwdKWCbgyV8Xag6529Ab6xx7nccU38s9r96mYTpexRpcTh/E8nj
	Ovqs4O1ANULiaDEcSHbPsqDCwwBnliQpmB3dzDF8p1rM8YBcnnPctYayECj0rKPLgGz79jkUQkt
	YqY4=
X-Google-Smtp-Source: AGHT+IEMPpbWh4NeYKHax8jYWC3L9s7tn8YQReSKuvqMmA2Nsnln3wdksJ5n4JvNRiGtM+6SAVa5sQ==
X-Received: by 2002:a05:6122:17a2:b0:4d8:37eb:9562 with SMTP id o34-20020a05612217a200b004d837eb9562mr867008vkf.0.1712864950556;
        Thu, 11 Apr 2024 12:49:10 -0700 (PDT)
Message-ID: <5e822498-cbe1-45e5-806c-1c14aaf76a6d@citrix.com>
Date: Thu, 11 Apr 2024 20:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] gzip: move huffman code table tracking into gzip
 state
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-6-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240411152518.2995-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/common/gzip/gunzip.c  |  2 ++
>  xen/common/gzip/inflate.c | 26 ++++++++++++--------------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
> index a1b516b925c9..79a641263597 100644
> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -31,6 +31,8 @@ struct gzip_data {
>  
>      unsigned long crc_32_tab[256];
>      unsigned long crc;
> +
> +    unsigned hufts;        /* track memory usage */
>  };
>  
>  #define OF(args)        args
> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
> index 6c8c7452a31f..53ee1d8ce1e3 100644
> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -140,7 +140,7 @@ struct huft {
>  };
>  
>  /* Function prototypes */
> -static int huft_build OF((unsigned *, unsigned, unsigned,
> +static int huft_build OF((struct gzip_data *, unsigned *, unsigned, unsigned,
>                            const ush *, const ush *, struct huft **, int *));
>  static int huft_free OF((struct huft *));
>  static int inflate_codes OF((struct gzip_data *, struct huft *, struct huft *, int, int));
> @@ -311,8 +311,6 @@ static const int dbits = 6;          /* bits in base distance lookup table */
>  #define BMAX 16         /* maximum bit length of any code (16 for explode) */
>  #define N_MAX 288       /* maximum number of codes in any set */
>  
> -static unsigned __initdata hufts;      /* track memory usage */
> -
>  /*
>   * Given a list of code lengths and a maximum table size, make a set of
>   * tables to decode that set of codes.  Return zero on success, one if
> @@ -329,8 +327,8 @@ static unsigned __initdata hufts;      /* track memory usage */
>   * @param m Maximum lookup bits, returns actual
>   */
>  static int __init huft_build(
> -    unsigned *b, unsigned n, unsigned s, const ush *d, const ush *e,
> -    struct huft **t, int *m)
> +    struct gzip_data *gd, unsigned *b, unsigned n, unsigned s, const ush *d,
> +    const ush *e, struct huft **t, int *m)
>  {
>      unsigned a;                   /* counter for codes of length k */
>      unsigned f;                   /* i repeats in table every f entries */
> @@ -492,7 +490,7 @@ static int __init huft_build(
>                      goto out;
>                  }
>                  DEBG1("4 ");
> -                hufts += z + 1;         /* track memory usage */
> +                gd->hufts += z + 1;         /* track memory usage */
>                  *t = q + 1;             /* link to list for huft_free() */
>                  *(t = &(q->v.t)) = (struct huft *)NULL;
>                  u[h] = ++q;             /* table starts after link */
> @@ -787,7 +785,7 @@ static int noinline __init inflate_fixed(struct gzip_data *gd)
>      for (; i < 288; i++)          /* make a complete, but wrong code set */
>          l[i] = 8;
>      bl = 7;
> -    if ((i = huft_build(l, 288, 257, cplens, cplext, &tl, &bl)) != 0) {
> +    if ((i = huft_build(gd, l, 288, 257, cplens, cplext, &tl, &bl)) != 0) {
>          free(l);
>          return i;
>      }
> @@ -796,7 +794,7 @@ static int noinline __init inflate_fixed(struct gzip_data *gd)
>      for (i = 0; i < 30; i++)      /* make an incomplete code set */
>          l[i] = 5;
>      bd = 5;
> -    if ((i = huft_build(l, 30, 0, cpdist, cpdext, &td, &bd)) > 1)
> +    if ((i = huft_build(gd, l, 30, 0, cpdist, cpdext, &td, &bd)) > 1)
>      {
>          huft_free(tl);
>          free(l);
> @@ -894,7 +892,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
>  
>      /* build decoding table for trees--single level, 7 bit lookup */
>      bl = 7;
> -    if ((i = huft_build(ll, 19, 19, NULL, NULL, &tl, &bl)) != 0)
> +    if ((i = huft_build(gd, ll, 19, 19, NULL, NULL, &tl, &bl)) != 0)
>      {
>          if (i == 1)
>              huft_free(tl);
> @@ -971,7 +969,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
>  
>      /* build the decoding tables for literal/length and distance codes */
>      bl = lbits;
> -    if ((i = huft_build(ll, nl, 257, cplens, cplext, &tl, &bl)) != 0)
> +    if ((i = huft_build(gd, ll, nl, 257, cplens, cplext, &tl, &bl)) != 0)
>      {
>          DEBG("dyn5b ");
>          if (i == 1) {
> @@ -983,7 +981,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
>      }
>      DEBG("dyn5c ");
>      bd = dbits;
> -    if ((i = huft_build(ll + nl, nd, 0, cpdist, cpdext, &td, &bd)) != 0)
> +    if ((i = huft_build(gd, ll + nl, nd, 0, cpdist, cpdext, &td, &bd)) != 0)
>      {
>          DEBG("dyn5d ");
>          if (i == 1) {
> @@ -1090,15 +1088,15 @@ static int __init inflate(struct gzip_data *gd)
>      /* decompress until the last block */
>      h = 0;
>      do {
> -        hufts = 0;
> +        gd->hufts = 0;
>  #ifdef ARCH_HAS_DECOMP_WDOG
>          arch_decomp_wdog();
>  #endif
>          r = inflate_block(gd, &e);
>          if (r)
>              return r;
> -        if (hufts > h)
> -            h = hufts;
> +        if (gd->hufts > h)
> +            h = gd->hufts;
>      } while (!e);
>  
>      /* Undo too much lookahead. The next read will be byte aligned so we


AFAICT, hothing in inflate() reads h.  So hufts is a write-only variable?

Can't we just delete it, rather than plumb it through into the state
block?  It would certainly shrink this patch somewhat.

~Andrew

