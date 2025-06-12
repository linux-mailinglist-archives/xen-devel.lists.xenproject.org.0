Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55245AD6AF2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 10:36:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012542.1391028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdQY-0003nB-5c; Thu, 12 Jun 2025 08:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012542.1391028; Thu, 12 Jun 2025 08:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdQY-0003kN-2L; Thu, 12 Jun 2025 08:36:50 +0000
Received: by outflank-mailman (input) for mailman id 1012542;
 Thu, 12 Jun 2025 08:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPdQW-0003TD-1A
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 08:36:48 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60188bba-4768-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 10:36:46 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso413200f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 01:36:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c19b8102sm929743a91.10.2025.06.12.01.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 01:36:45 -0700 (PDT)
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
X-Inumbo-ID: 60188bba-4768-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749717406; x=1750322206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=grYE1xGi9+XESSqACPod+6pa8Fv/O2qWhjpwug7vf/U=;
        b=IrsTmx98f9Mwu+/4Rh5IPrb42X21d5Ud45DdyF6YTCof3sm4pYY4TSAh7Uxv1Hd1Uc
         HQkTYyA/FJ3CyeTgUl0xu0IBHmTNz5idRza79uqwXhAjpcUmtLyEeH2DpAlIPxDvTT0Y
         RoG7EUF87be8nrYDxCHRmuTu/uM0b/OUqCMBrT7QdBacMgfLfywwdPW5M7E8ZwcCvhMN
         IyBGofTu01KTrgvSFO7zYjEYyZFphR0GOQWq59FsY5CDq2TG3mYpKD8UaQ6JcC7Sdjhz
         4w8oD7fTrgRFGCm52Nx3s6esHvbPDEqLmRJvQG6uM/IaQN7PNLhhiXC6yBow0kNixMSf
         GaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717406; x=1750322206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grYE1xGi9+XESSqACPod+6pa8Fv/O2qWhjpwug7vf/U=;
        b=F/1ET5N5HjJt8jK2QAU2iby7dsaLGGKudoVDwjVHGSM5SFJeejSfxEueJQRRxTIUF2
         tKxyCTaxCP6gYO/4cgu2FjmnneO+dbmni4kAiqWRIKQn3NB3UP57rdxXn3s/BRmz2aTX
         Jyw7A/2puOhZFyoLgrPgW/47bUZMA+t+P/veCMvMetL151gpOzMcugn5i8wWs6uvOvn3
         CH9blYSpmDJrkAMj/Jqi7YCJiJIhUE3n41kMyqfLCyqZxBQ4Rf2SiZt1P2q+/rA3HK3A
         wylxIA64N1cxox9lAfh1DFM3lsBYEp2iRSfzRIDaGcJbhdsy4TmGpVyIFKD/pfP3nvFy
         GIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5nce4VjVVhzMnbjuQggqLTkctHVSRxK7LwBvRGin/1nhYSG3d9jU4UTMkREHEMh1arT/CIz4cE9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9tlWMuzam7dZN4cboB9KA2oafeTMzEL30PSrx4tNsjmQoBKna
	LjS9+i6g9egLG9RxSz/ET8Ot0ztQ27rXnP06FxgDojyWyBhyAsHog9UmYnc+j37QEA==
X-Gm-Gg: ASbGncsqnew6IkcUtN8NeILKDxNhU92XmldDrTSIyFUE/MFpl7jCn/QjP4pFFqR4IHb
	/9ASGbg1Lst5AcjGGeahpqkfNTVomUXhUqru5TFHI9sieBFlePx0FGrz0PD4FwhBCVAEKwGhA4h
	0coac2KJ8nzqXUPut/NASZzVcnaWpt8UFSP5T+ukaq/Le0UaMufDBk7txiSkXFBwiUPYb/j3F6n
	L1nM2S0r7ZYxmmSloESx1D5kpHnphZ6YNs/1V2nmTffvH20tRUuKy3b5CRURaSy1crKK20yvDXE
	8cojfrY+IqhOdC34T2PrGHfQs8UTfR/U4vhVyLJEBhf9Bt+r5g22VdAkGDMylX1xwVHwQ4LCwf/
	/4xOGzYLbh9Svv3zimkv41mxkbdRuLDv10+rcqCJDuMf60ghxuAX50ZRDsA==
X-Google-Smtp-Source: AGHT+IHR4zrJXOvfDBz06WOUXoWgInC9gURrORWRUb1TOKs+7p7cBnn8ePnrZontMjlo5T/V17P8fA==
X-Received: by 2002:a05:6000:22ca:b0:3a5:2b75:56b3 with SMTP id ffacd0b85a97d-3a558695e5amr5342166f8f.24.1749717405762;
        Thu, 12 Jun 2025 01:36:45 -0700 (PDT)
Message-ID: <84080c88-b68f-4ab3-8b69-a3e45e9c74d9@suse.com>
Date: Thu, 12 Jun 2025 10:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] pdx: provide a unified set of unit functions
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-5-roger.pau@citrix.com>
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
In-Reply-To: <20250611171636.5674-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 19:16, Roger Pau Monne wrote:
> @@ -80,6 +81,39 @@ unsigned long get_max_pfn(unsigned long top_pfn)
>      return pdx_to_pfn(pdx - 1) + 1;
>  }
>  
> +#ifndef CONFIG_PDX_NONE
> +
> +#ifdef CONFIG_X86
> +# include <asm/e820.h>
> +# define MAX_PFN_RANGES E820MAX
> +#elif defined(CONFIG_HAS_DEVICE_TREE)
> +# include <xen/bootfdt.h>
> +# define MAX_PFN_RANGES NR_MEM_BANKS
> +#else
> +# error "Missing architecture maximum number of RAM ranges"
> +#endif
> +
> +/* Generic PFN compression helpers. */
> +static struct pfn_range {
> +    unsigned long base, size;
> +} ranges[MAX_PFN_RANGES] __initdata;
> +static unsigned int __initdata nr;

One other remark / nit: For my taste, "nr" isn't a suitable name for a static.
It's too short, and hence the risk is too high that some function would add a
local aliasing this one.

Jan

