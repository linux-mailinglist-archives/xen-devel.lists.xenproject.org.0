Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685DFAA50A5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973806.1361847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9cc-0007nw-Nj; Wed, 30 Apr 2025 15:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973806.1361847; Wed, 30 Apr 2025 15:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9cc-0007lo-L9; Wed, 30 Apr 2025 15:45:18 +0000
Received: by outflank-mailman (input) for mailman id 973806;
 Wed, 30 Apr 2025 15:45:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9cb-0007lg-Dg
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:45:17 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c1d4e09-25da-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:45:15 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac2963dc379so1113147366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:45:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf9a47sm946818666b.104.2025.04.30.08.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:45:14 -0700 (PDT)
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
X-Inumbo-ID: 1c1d4e09-25da-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746027915; x=1746632715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oListdUuI0zygMlwtlfFmcXK3frYsfsGysC7hkAsk4c=;
        b=gvQlfw58xtfJYA0dcyiTa3K52MBvR2JIWRCl6r/UnM6h6yvnkfpuTg3TELlPcZxgV/
         HtNTsH+qoFWmV6n2y1yGEHiCSiVjcQE00EUkkCTarkyfexFEumJEu+A1Kj1osXim5ZIK
         8WvGE7/bm+ntNSE0ePuBCqlhKomwATaCi1sGQ9WcxYPeKR15dwRjdXd3qHi0IpQjsbNI
         eC/qKlbq7CW6C9lfNz3dEp7IfI9O36XaV4NTHJlbsCRQLaCGNqxP748NA3ZYK5apOmbm
         vFYrna3uBsnnc4jO6F3zF67AyizyukQmg51pjexe5w+sKLb4pVZ8uFmMz9PpRerwRKQl
         B9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027915; x=1746632715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oListdUuI0zygMlwtlfFmcXK3frYsfsGysC7hkAsk4c=;
        b=iaxj+rTUO4TBZdpK9PnmcYK0fl6qChfOEq36rBxEZIwdoI0K9GDT/lpjPqglwkjp4e
         MEXoUze2rlNTrJuN76Vp09QyxY0FpyoUNoTetCRyERMym7g1AAVnz3rQopJgS8+9VHIv
         wqF31DYm+fwW2N3EypJcPKPeuR3XZq+CEpX914NlUxzA9FV6/4JAXgE0taAg6oBe+69N
         4x6zeTO3Lqp0cTGGOA/YZN+BN7xp4I96ExNdZ0e2uUgVF1E1qCm+eUlhKz1AiI62izJ4
         mGyNJk574RM05YcWk9hwD+2EoCedv4IIdycNfB/Cw2uV2KXhX6mnCqBMZ6N7pG+TgpHj
         r6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVG9v+utIjfDBigZSzhbnpRZMX0mquXJ0ohSv2lz/mFIvHcq79fiToX6L8qJJbkbIFoppaLrsWt1vw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoFjrIeE1LPGA8EfBkQrCNE2LiWRh1kXp9uaHfMRkiaWqa+R7e
	Ew2/B+ECIVrtkn7DiqLgvHReF+xa1HCWlHG6seDACfJmAcyZAvdE+06chkWLJQ==
X-Gm-Gg: ASbGnctvfr7I0l6ZH/iNjBfc9tt4giwD9gvjSdNRqXho/x9ecdPUySJ8QKwE4RMJdw5
	aaSv3mAD2sjo3ayYZdGuEtO68jJiWv/VRvougQOjPsn8knDyrhQLaC9uAsc2GPU/FCitK9k2P0L
	lngl1LnLNrbtoMrh9oIrP44XoejM4MMFauuogc1n3MeLXm1aw1960E8FLTAIpb8DUD+VvqNju62
	3bVgEJdcX4jB9hfHLDvDaDmIwrkayZ73Fc5ywEvw4Hs48YtKEkrQG7A/B857VKvM/IAH2ALCg6h
	OnL6vJ6YPEKyT76TsRjO/aPK7jNpJ8apfRuJtuPl2C/ySZIm3FubPdh6wzx4+39ICq3VECdxqof
	cgCg5yDsbSMq3yX9iGAeUPdi4rg==
X-Google-Smtp-Source: AGHT+IG3ogjlf+uitbI1hLfURJAk3WoxJNWZPMCebhGQImrvhNL69u0/sq13eVnFKMHDvO8qiE1EDw==
X-Received: by 2002:a17:907:1b22:b0:acb:7104:353a with SMTP id a640c23a62f3a-acee21ec86dmr257589866b.34.1746027914983;
        Wed, 30 Apr 2025 08:45:14 -0700 (PDT)
Message-ID: <c2358a47-1573-4a63-b674-b2ccb62ac582@suse.com>
Date: Wed, 30 Apr 2025 17:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/20] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
 <20250421073723.3863060-20-Penny.Zheng@amd.com>
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
In-Reply-To: <20250421073723.3863060-20-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 09:37, Penny Zheng wrote:
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -315,13 +315,13 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
>  
>  /* sysctl.c */
>  
> +#ifdef CONFIG_SYSCTL
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
>      BUG_ON("unimplemented");
>  }
>  
> -#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      BUG_ON("unimplemented");

Looks like the #ifdef would better move ahead of the comment, too.
Preferably with that (and notwithstanding any changes resulting from
the comment on patch 02):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

