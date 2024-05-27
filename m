Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E07F8D009E
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 14:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730729.1135894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZvJ-0004aX-4m; Mon, 27 May 2024 12:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730729.1135894; Mon, 27 May 2024 12:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZvJ-0004XM-1X; Mon, 27 May 2024 12:57:57 +0000
Received: by outflank-mailman (input) for mailman id 730729;
 Mon, 27 May 2024 12:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBZvH-0004XG-As
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 12:57:55 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bade3e22-1c28-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 14:57:53 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2e6f51f9de4so136655851fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 05:57:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a62c501e85dsm247769766b.117.2024.05.27.05.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 05:57:52 -0700 (PDT)
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
X-Inumbo-ID: bade3e22-1c28-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716814672; x=1717419472; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Fvwildf8cnAtHd0zQYSd/l8qEHNqNAOg6zUFk8KfZg=;
        b=D4+NJP7TaSaMEigajgCxugL/tpqK4O8LKtA1DBcmx0FsWOTX3ivIYMFQfJRCevl320
         jhPhKjTET4wBH9WY6JvDU27MARSjURNKl8sVWPlAphS6TZ3wZmh9z47J1liMw6JzNR1/
         Bg52ojrmnW38PDssREDHZQ2Re/MDG/CT7m40y/8f1mxhV+nY/FyX0q/WFR8ptct3YtYA
         X4vX3q7YAk3SvawBF3ix947OWEkZAzd/14SNSo2y0oGrLfrQYzcdu+Pd85zfDFlNjnBt
         x6TO88kXv90SaQ86151LnjM3lyMfqBh/ukEt7NGuPrvtdEcFAogBFBLYNJKP30d/Q6ko
         GdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814672; x=1717419472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Fvwildf8cnAtHd0zQYSd/l8qEHNqNAOg6zUFk8KfZg=;
        b=wBYkbIljtW6cW2+f0oL3Idsyfw8CiNAxUPEsuKr80MwXjhAGqt/Zh1MRGzJXo2kaBh
         yL6TJtnGTon+tHIhTz1RAs+9IB8xDbMp2SKs2I9bojfi1SzLAWsQb98yoEffjOV9olmK
         rRe1IJWn9hI19MKwvRJzt94I+R3hRvIpd+JXR7viivxTcT5Ei6iySbcVTr+2bwQZVBho
         XFRsBHkWZXan0GbDumPFs4Y/Y+bD0yYaKELJSv0+zOe8buo7Ut3IDGiyNyNSx4FvGwyH
         3dMoX3s72+ZItBG32mygPbQ/5dAjvbdZJLf4nzNcPqQEqpwdMUgFMUy4lhJ9N6E84aGO
         iIxA==
X-Forwarded-Encrypted: i=1; AJvYcCX+XuduFdaqi2JhKFRl4U9kkwhQ30xTDJFcjaG4pDShpdloDiFMEQSVjcyTY+GzbEBvg3NrLUednlh6OX7SC+/Y52zgc8Fn/k1uSztgzbQ=
X-Gm-Message-State: AOJu0Yyn/w0BNfUhjWKvCChYPUrkjmKXSQIfvfswUTPLDXTSRCtxPosV
	RnwQk8wVkcrld8zEXFfH1X29cHWX8Ijl1PXF6Il+aTdCwQkECllsQcZf2qzMxQ==
X-Google-Smtp-Source: AGHT+IE2flPVjnRYafEEF37l7wv3+ENaWRXBlbtOqLd3oW1iSkrvs7+8BE732cGwR4Hz21mhIpwOug==
X-Received: by 2002:a2e:a782:0:b0:2e7:2c84:4f65 with SMTP id 38308e7fff4ca-2e95af0ec44mr92309331fa.0.1716814672480;
        Mon, 27 May 2024 05:57:52 -0700 (PDT)
Message-ID: <fb5e42db-38fc-4426-b111-ccd454237119@suse.com>
Date: Mon, 27 May 2024 14:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] xen/bitops: Replace find_first_set_bit() with
 ffsl() - 1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -335,7 +335,7 @@ static void timer_sanitize_int_route(HPETState *h, unsigned int tn)
>       * enabled pick the first irq.
>       */
>      timer_config(h, tn) |=
> -        MASK_INSR(find_first_set_bit(timer_int_route_cap(h, tn)),
> +        MASK_INSR(ffsl(timer_int_route_cap(h, tn)) - 1,
>                    HPET_TN_ROUTE);
>  }

This can be just ffs().

> @@ -409,7 +409,7 @@ static int cf_check hpet_write(
>          {
>              bool active;
>  
> -            i = find_first_set_bit(new_val);
> +            i = ffsl(new_val) - 1;
>              if ( i >= HPET_TIMER_NUM )
>                  break;

This in principle can be, too, but would require a little further care.

> @@ -535,14 +535,14 @@ static int cf_check hpet_write(
>      /* stop/start timers whos state was changed by this write. */
>      while (stop_timers)
>      {
> -        i = find_first_set_bit(stop_timers);
> +        i = ffsl(stop_timers) - 1;
>          __clear_bit(i, &stop_timers);
>          hpet_stop_timer(h, i, guest_time);
>      }
>  
>      while (start_timers)
>      {
> -        i = find_first_set_bit(start_timers);
> +        i = ffsl(start_timers) - 1;
>          __clear_bit(i, &start_timers);
>          hpet_set_timer(h, i, guest_time);
>      }

Same here; in fact {start,stop}_timers are needlessly unsigned long in
the first place.

> --- a/xen/arch/x86/include/asm/pt-contig-markers.h
> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
> @@ -60,7 +60,7 @@ static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
>      /* Step 1: Reduce markers in lower numbered entries. */
>      while ( i )
>      {
> -        b = find_first_set_bit(i);
> +        b = ffsl(i) - 1;
>          i &= ~(1U << b);

Considering i's type and the immediately following expression, this again
can easily be just ffs().

> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -137,7 +137,7 @@ static void set_iommu_ptes_present(unsigned long pt_mfn,
>          ASSERT(!pde->u);
>  
>          if ( pde > table )
> -            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> +            ASSERT(pde->ign0 == ffsl(pde - table) - 1);

pde pointing into the page starting at table, this can be ffs(), too.

Preferably with at least the easy adjustments done:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

