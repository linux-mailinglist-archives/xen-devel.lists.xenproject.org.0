Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2388AB9653
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 08:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986336.1371899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFp1m-0006eC-Gi; Fri, 16 May 2025 06:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986336.1371899; Fri, 16 May 2025 06:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFp1m-0006bp-EB; Fri, 16 May 2025 06:58:42 +0000
Received: by outflank-mailman (input) for mailman id 986336;
 Fri, 16 May 2025 06:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFp1l-0006bj-TL
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 06:58:41 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33063bfd-3223-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 08:58:41 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad2452e877aso271414766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 23:58:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4395d0sm101717166b.114.2025.05.15.23.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 23:58:40 -0700 (PDT)
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
X-Inumbo-ID: 33063bfd-3223-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747378720; x=1747983520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mhHzUW5qreKMj8C/BBkmNTtLljVXYRajZEMEwIYR/gs=;
        b=A06zAz/ZhxkFF7+oYxi85RA/c91gbT24pdWRwH4LwDdp83+sWrCK6cwfnYsBO74MtH
         olcTcE4n5UgG1MxeNRF/PPeo/0yr9OyX7hvnjGOs4EdYgA7oahPXIsxYuChylZcV41Wa
         zPW7/BJ/USQ7sdIOP4PMJ6kwY45L1s2gDr8BTWEonND5ivNGqW78EBSvVlqivlIKuvXH
         3y0343snD5Mglvwy8A/Fig+QhrfN0Osla0B9ebhv9cMoWEWQ+tMjHJ2xIzVAp53YTjfL
         4InMy9mAHmCKLGR9R3Ayartk7wDSvIL7CDwer3OqwKtVwllWdnIpAmGtS2ZSE+VHbr/X
         f01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747378720; x=1747983520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhHzUW5qreKMj8C/BBkmNTtLljVXYRajZEMEwIYR/gs=;
        b=gGSR+vMMJVHZ6FEFcsqE9mCdwaQm+jF5hG2zXHWjCAvVkIxPcilC3/JSPp7TTk0KXa
         BqGxPj9M2ZqNX4J7WLVzOXSal7Fr+jn8h2Ct19nw0Y+PBsjBwHGSgnUx6erpvXZy8w7X
         6aqK9PI8jDe9sZlyxeYtyM1kWaxJbl0Zwf0ITg3CWL5ouGwq9eLodnspdx77hVe/zwLr
         k4JhO3k+jx9kguNLI2RQ6NjIX5hRykMJ8CLem18MqWPZwdUl8C0DpoEDpy06g5PAk3SS
         umqT6eBnKENexUfbEeCGBHGOWR4ZvBVK5K7jfklVNFlnNe3CvSGRAiKdkL2EServEMcA
         zRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz+qZC75f0nnc3JKJ+fbDJvRKQU4dwekkVbzifCSlhQu6qH2IpnayIpxQOShspayvxRXUfQ94Fvb4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCZvZ62UhYp8IROMmFvdxZaslx1Ruc3j/07EQy6RdEaLRzDV77
	tSLFm2IQCs5tGtYoAgdyAUZ8ZT1HFtEPPURpLWMz+qDNvkuqDVLtG7FvaKbEAFHD3w==
X-Gm-Gg: ASbGncuTORQt5O7ICfYYkBUJQP+KyPsEOYYu4I/a1Ds29XX1uvNqxp3DdxzYze9p4iH
	W9NEJ1v6WEun1t/WjDXFTmS7G+UeNTunDi6MFXLB88g0Yq/+gAwyBKj7iOWpfhmJTVSHhz0BIHJ
	E8GTVjpNTOtapuNXqRQDjYHXfehtduVm7TgxBPbmUD4kNWTJdq9e+QghVkjtLRmeH0NmUctI/PR
	47i4d+OKJSucd7TNNUnHmply9TLripHpLX5k+wSXPS+yDH0wDBCLHsw5UL6vlzdczBjp9w/+Cgf
	bJ1cdkNjEUhnAU0GhdytUTZlET0QuQ0pwF99l0X/5G51v24hRUTST89SFLTb0ogfCt8V83IJJbn
	tH5wYEzAMjrQT005svAtZDdfUGj3t5wz1JFvZTF7UOi+fdGE=
X-Google-Smtp-Source: AGHT+IHOAx3tt8Q2meyMwbignKMpEcTOs2MjpAnMHsW8Upqe+TPueXfJOFvCgH6tQO++tswBVJPcCQ==
X-Received: by 2002:a17:907:7da2:b0:ad5:2656:ee58 with SMTP id a640c23a62f3a-ad536dcd6e9mr115686166b.43.1747378720530;
        Thu, 15 May 2025 23:58:40 -0700 (PDT)
Message-ID: <df82f2bf-4992-4af2-9ffc-e734ea627a13@suse.com>
Date: Fri, 16 May 2025 08:58:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] x86/mtrr: use memory_type_changed() in
 hvm_set_mem_pinned_cacheattr()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-6-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -605,22 +605,8 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
>  
>                  type = range->type;
>                  call_rcu(&range->rcu, free_pinned_cacheattr_entry);
> -                p2m_memory_type_changed(d);
> -                switch ( type )
> -                {
> -                case X86_MT_UCM:
> -                    /*
> -                     * For EPT we can also avoid the flush in this case;
> -                     * see epte_get_entry_emt().
> -                     */
> -                    if ( hap_enabled(d) && cpu_has_vmx )
> -                case X86_MT_UC:
> -                        break;
> -                    /* fall through */
> -                default:
> -                    flush_all(FLUSH_CACHE);
> -                    break;
> -                }
> +                memory_type_changed(d);
> +
>                  return 0;
>              }

Hmm, so your consideration to avoid the "goto" in my patch was perhaps this
part of your change, where you expect the "return 0" could then stay here.
Maybe. However, you removing the switch() means we'd then also flush in
cases where currently (or with my change) we avoid doing so.

Jan

