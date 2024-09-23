Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57697EA81
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801950.1212031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgzB-0001SD-Kh; Mon, 23 Sep 2024 11:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801950.1212031; Mon, 23 Sep 2024 11:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgzB-0001PP-HI; Mon, 23 Sep 2024 11:12:09 +0000
Received: by outflank-mailman (input) for mailman id 801950;
 Mon, 23 Sep 2024 11:12:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssgz9-0001PH-PF
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:12:07 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaab4efc-799c-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:12:05 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f75aaaade6so42542251fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:12:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb5df16sm10204603a12.47.2024.09.23.04.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:12:04 -0700 (PDT)
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
X-Inumbo-ID: aaab4efc-799c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727089925; x=1727694725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/liY+zi1qJrFtjQBvqjQWYQGBxCSwS8usbVtPcyVgzA=;
        b=E5zPegzVR05c6eEL8tYxrMPhFiWghXhBQML+o3y8LYRy43My8QiBQmeDNSKuXVFO4Y
         1lp5XXKXFsPzBcpZAR7UjljQit/ciLWRLi0xD3hTv22OVxBE2LlhbudcdTLbM5Ra7mFm
         Bi1yzUlXJVZSTuiAQJLTF7kVX3C9j/BD/SiFljRyjXDJBkGYS96FRQmPH4beBzqVmQNA
         Tb7LSBKk9uJtKi88gCNy44pZ2MDDufy0NIKHTCuM/VPvMMYIVaqk7TK0BzhdCM/BRWs4
         8QSNz5ADRq4LB1xc1EP+yVUtFuxsVCnbg8LvDABUQZCUUC/lpgRaNyyn9r1dFLRFtTgD
         efzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727089925; x=1727694725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/liY+zi1qJrFtjQBvqjQWYQGBxCSwS8usbVtPcyVgzA=;
        b=HmK0QdNFWnZiTQpUBmvT95naCLcJ2K/CWcZE2KNGYG/leHqrhD4uNNwdesU5GaeOt9
         YEUnUd1KN7XolCSV5EPyqU1F/cqnykbsET0gwVrQdncj1D33M4KEfopBZobQGkBMVzYE
         Iaqqd6YRe/D0sza37n6mkkvWBkQCjpHgy8fIASW1p/jcgrlCdtiRiW7LGy7sLRXRDLE9
         CxV3J+huyPVJnP/WhMw07lPolyVQxLmIX89Q8k8pWMLXPGAMJmHfNFfw2p3B8LKcT1UA
         L1HHzb56yt5jl9Dw++DqnthX7a2S3DFLbS+BKsh+STFTe96SijG6ghm3XifmSTxjWbt9
         BXSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUroYxAdwN5DSM5r3qVmRcx3kYirHZPFMSjtlOg/3zN8ENiVA4/z+DV7b6zU0v4mXxkFyl1fuxv09A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZIny7VAYz3tvENHXKjbhkdbxD7Sub7RM2wp/sbObagOwHQGy6
	CsMxZHOGVcod51hZeDIiPEJ8w3ZRP+4bKF3gAVlDaTUVCrlqOB1eR7YuHQzMKA==
X-Google-Smtp-Source: AGHT+IGIHwsPFuw82Itqsry1wIbAYX2EEinbtk3HrCK2Kp5ikesCGb7BMwZLqwU8C/VsKR+2Wot55Q==
X-Received: by 2002:a2e:4609:0:b0:2ef:1784:a20 with SMTP id 38308e7fff4ca-2f7cc5c5c3bmr42661411fa.38.1727089925114;
        Mon, 23 Sep 2024 04:12:05 -0700 (PDT)
Message-ID: <4920f153-8c46-4a03-80af-92831a881cd8@suse.com>
Date: Mon, 23 Sep 2024 13:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/alternatives: relax apply BUGs during runtime
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-5-roger.pau@citrix.com>
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
In-Reply-To: <20240920093656.48879-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.09.2024 11:36, Roger Pau Monne wrote:
> @@ -198,9 +201,17 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>          uint8_t buf[MAX_PATCH_LEN];
>          unsigned int total_len = a->orig_len + a->pad_len;
>  
> -        BUG_ON(a->repl_len > total_len);
> -        BUG_ON(total_len > sizeof(buf));
> -        BUG_ON(a->cpuid >= NCAPINTS * 32);
> +#define BUG_ON_BOOT(cond)                                       \
> +    if ( system_state < SYS_STATE_active )                      \
> +        BUG_ON(cond);                                           \
> +    else if ( cond )                                            \
> +        return -EINVAL;
> +
> +        BUG_ON_BOOT(a->repl_len > total_len);
> +        BUG_ON_BOOT(total_len > sizeof(buf));
> +        BUG_ON_BOOT(a->cpuid >= NCAPINTS * 32);
> +
> +#undef BUG_ON_BOOT

BUG_ON() provides quite a bit of information to aid figuring what's wrong.
Without a log message in the livepatching case ...

> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -882,7 +882,15 @@ static int prepare_payload(struct payload *payload,
>                  return -EINVAL;
>              }
>          }
> -        apply_alternatives(start, end);
> +
> +        rc = apply_alternatives(start, end);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH "%s applying alternatives failed: %d\n",
> +                   elf->name, rc);

... this is all one would get. Since livepatching is a privileged operation,
log-spam also shouldn't be of concern. So I'd like to ask that at least some
detail (line number to start with) be provided.

Which however leads to a follow-on concern: Those string literals then
would also end up in LIVEPATCH=n binaries, so I'd like to further ask for
a suitable IS_ENABLED() check to prevent that happening.

Jan

