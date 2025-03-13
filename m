Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75002A5EEB6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911556.1317971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseQB-0001vs-BC; Thu, 13 Mar 2025 09:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911556.1317971; Thu, 13 Mar 2025 09:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseQB-0001vK-7G; Thu, 13 Mar 2025 09:00:07 +0000
Received: by outflank-mailman (input) for mailman id 911556;
 Thu, 13 Mar 2025 09:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tseQA-0001pm-6u
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:00:06 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d815a30-ffe9-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 10:00:04 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so3915445e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:00:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b6d48sm13162775e9.9.2025.03.13.02.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:00:03 -0700 (PDT)
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
X-Inumbo-ID: 8d815a30-ffe9-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741856403; x=1742461203; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KweaQvLI/SaeaKVhvDS3nZ+h6KVKXNtoM06/6+alpOQ=;
        b=gugBByk22TMbmwwLoBitNEonsyKskUlEVJmiI9QcbFoXO+ieef3YpAOnIpzZZFriyS
         rTUr2FZE5+QCc9oBrpv5bnvslb2L/7dhkHypufroCrZjCEeGRlIrom69b/ULOAtTE9PL
         H4fZ88d+CjTLeVh4eygZRxV3xHuxZgRtQ4M6Ps0fjrgzZnbqYB161L2XhBcaJxeB2Eut
         8hPcm8lRjUEii8bqXwF+0YsfWU0cTkyPrQ6XZZANz9YRj1IOFDvk2HM8VCSA4Mbji2RE
         MuxVci2G8Wru+92hqUMgRFNHsanJz0IrRxPfviU0fgSXNfXr9n3c3ChSgS7+rYqjc+mT
         M7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856403; x=1742461203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KweaQvLI/SaeaKVhvDS3nZ+h6KVKXNtoM06/6+alpOQ=;
        b=piILHnbBNDsiC08dZc8l1SWSZmSSN7xK/YOG5OouFuPMp9lHSL1+Kh4lhNEd4Pt02/
         N8o2fM4DYAAr/z2VgBOwjS0FLVD8w3SLgtjoDcuX1VK4/blvyU4oKNjPqdFanhj9i/17
         ylzWejL8zwOQjRC5FxLWr4xaXCdSLn1pJWcknmv6erlDVgBn84Vd6BclYBOzbD7+OHz8
         OSA3WPvjqVBXgw5qx1QDx2tXFVoNMH4W5sVw448BhMoCHFH7q+dqg2ZfF7z+EErYDTrA
         x6fuMUYkdew51mhouLcgG1mi/WSV/JL+VpmAqr9gU5qTnWOR5mBJRrTaYsXOuOXYf+dL
         0SDw==
X-Forwarded-Encrypted: i=1; AJvYcCWcqEVE1IRps2sGsOKfDhD0DtIMYcTIvuE0zwUg4A0wMeIvdoU1jcL6aDp9M+hzr8i3g9O3qOttiXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/rZ1M8eA9bPkk5Ib8vX/ngKWZgUMQNVR9suTBrP+oRPiIZsxW
	nhNDyjr9GNMpPyXYc0p9eSGRMpfXSJwGzbIl5db7nrh7hBv3fpl8zkClw4tQiw==
X-Gm-Gg: ASbGncsnTLIJWp0Z0bSvxTk6e0xVHSa2Mt68UbC119ujOTIh6Sexri7zET+pAkMg0/7
	97adaKHshCYjdRUa5Rj00NSr7uPHK+uhQtQCimGIznWl98+Ee6iZ6ymfYds78rL2wkveiUzRjZt
	bo7DtVx9jU0a+NHUZ9ghov1sCESEjlQihRqqb5otsMtd5UaIuxJtZNJPIOmYUWOWhm0iodXStcj
	u2Nt+woM3aLcg3EJ3h1AnlM118WgpgTeWMuqje+7HwMAywWRYh0Dxv01E8aOHa4HLyhm+QvKsMK
	sFJtZU15O+VtxOwTIEkNKIaxHG5xDyjs5g/1/mB6ZAGEGk9jXofbnwsGBoNzsJnQeGdTbNdbWOQ
	oXGKSg4R+Y5o5WIq7DVG+Y0TWssLc9w==
X-Google-Smtp-Source: AGHT+IE+Wub/LOuCuQ9ayODwifh4Rg8db8etaGWAVCwEeYZalleKvuJnYED9UhjrKKkCnAFSGo/biA==
X-Received: by 2002:a05:600c:510e:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-43d068397bemr74588425e9.15.1741856403556;
        Thu, 13 Mar 2025 02:00:03 -0700 (PDT)
Message-ID: <c084d064-6478-443b-a508-10a31568e4cf@suse.com>
Date: Thu, 13 Mar 2025 10:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
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
 xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-16-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -15,6 +15,7 @@
>  #include <asm/arm64/sve.h>
>  #include <public/sysctl.h>
>  
> +#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
> @@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>  }
> +#endif

This is being removed again in patch 18. Can we try to avoid such back and forth,
if at all possible?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -581,6 +581,8 @@ out:
>      return ret;
>  }
>  
> +#ifdef CONFIG_SYSCTL
> +static unsigned long avail_domheap_pages(void);

Instead of this, ...

> @@ -2796,12 +2799,14 @@ unsigned long avail_domheap_pages_region(
>      return avail_heap_pages(zone_lo, zone_hi, node);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static unsigned long avail_domheap_pages(void)
>  {
>      return avail_heap_pages(MEMZONE_XEN + 1,
>                              NR_ZONES - 1,
>                              -1);
>  }
> +#endif

... can this be moved up please? Then also reducing the number of #ifdef-s?
Arguably avail_domheap_pages() could be inlined into its sole caller. That
might then be a legitimate replacement for patch 14, without breaking the
build.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -131,7 +131,12 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
>  unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
>      long pages);
>  int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
> +#ifdef CONFIG_SYSCTL
>  void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
> +#else
> +static inline void get_outstanding_claims(uint64_t *free_pages,
> +                                          uint64_t *outstanding_pages) {}

This isn't a valid stub: Both arguments point to outputs. As it stands the
function now requires the caller to clear respective fields/variables up
front.

Jan

