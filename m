Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC3A5FBCB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912842.1319036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslUb-0007lg-32; Thu, 13 Mar 2025 16:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912842.1319036; Thu, 13 Mar 2025 16:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslUa-0007jY-VL; Thu, 13 Mar 2025 16:33:08 +0000
Received: by outflank-mailman (input) for mailman id 912842;
 Thu, 13 Mar 2025 16:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tslUZ-0007jS-IH
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:33:07 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7781f40-0028-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:33:06 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso11277325e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:33:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74cf8bsm59580315e9.12.2025.03.13.09.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:33:05 -0700 (PDT)
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
X-Inumbo-ID: d7781f40-0028-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741883586; x=1742488386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdgvrlj+8ATY6up6dBRR966j2QHpKJh9PP/iYbKOS58=;
        b=dC2wTImTn94Y/aeY3rqp1cjqhzPHQdxnaybcsEPmSSeAJQt4U8SBTldgKx/KZSeZDl
         SEdQyuqXEVBUIBRTC/zggengtJKF6JexzWu4Nj6jmwxctImJPAN4q7Qk5BIzZDedbsP1
         cBvawuTMYp7RabJzgQv5Ep0q5DGCEgv9gLn/KOGis8+pbBjjyYv9CkBTjjOEuyWHSTl2
         uQVQSnM8ZKjYMpUAM5u1u/cYzIe1Anj56b7VK+vH0mcJHs4Mv7nMoNzKdjO9DnprOIZp
         7BBeqF8NlSzaXPxDnbgeHLRW05A1LBYv0yLwK+z3Mzy+zmz7uATTg/GI+pglUgdqZa3q
         jR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883586; x=1742488386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdgvrlj+8ATY6up6dBRR966j2QHpKJh9PP/iYbKOS58=;
        b=H/YBTC4+XgIYv+wsDOTO2W9pEZRXOnRvGBrzzrmSLNMeaXf1j3AHL4oWTIun0YqtWt
         UrbU1BvgHhSE7lgB0AzRsyzLr8AbS3fGeZA+Sx7g72emlhhpUoRb1S+ulmCPwZLfFj0K
         gz5KMw8poQ5hR5TmQdoxjjzo2GXMLs6dDHlB10oY9S5Fd1lnY0HYFv5x30rESP4tH712
         YQxjXHAal11tpzov2BnuyN/1r3ECrjiPTnXV+c8INS4/m8iff8TQWAJ2O+j7qh5axFk7
         3vDYwlh1M0BbTFXY71vyKISLhakyA7dOCFDZGWCfBicVQG5/DqS0eZrsZpK1TikYxTOo
         /CxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0kyGxd1ejsvu048dc7bp3zXn2F/AkqTZyFEE9YPTFvRimpuTqImhVkBowPwuguuwT5VK/wr6dTp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEtSvPtt46uYuyhAaUJ3RpogWl6R5rC8IXjTGqbDLt6FCu1ctu
	psKL3jHVbGSksNv8diXKtuonTXhtb7cb4UcVYMDInAuIZrlj6C0pg5qjdZXQGw==
X-Gm-Gg: ASbGncsxToe2mmlrQoibz7Zc4XH7gjcXPOykKzU55Be0fG2M+KowXNt5KdjRmaTJLgY
	USVPBTTEh/ES/cTKJ6X8WyHwtOTzVAp08geXRk3Ul8YkXW+uSzYTrD9ATHUUhtODsVPuzkob5vH
	jW3J89KEnBO3gq3WMStuLuTBGbRTNXxhxf/PF9JTAzUnsNq/8hq7qvN5CVKdzgKlR68waKkO+Ck
	/sb3wYXbmd46v4tbtxGIDNtHsdZMUgYZtxRqrcd/fsyjBorQi/VWlD5wE63ZMq+PjfwWsUTlpRU
	Yydedva2xlM+5VVOZup2jXtifVJka1iKUSofkiDxhYcgVT57Oll1iIu5hQzo5nBerpY8JLyZsAL
	0Qffk5oDfYWFj8uk8lOoGGtgLrEY3zmMJisy1yCJy
X-Google-Smtp-Source: AGHT+IEpSFNsjQkZ83qNgg5+vrJGwZt48Z4+ivt+JFsMmsVcx/xYLJW892wDk57fay9SiugXmc2Qgw==
X-Received: by 2002:a05:600c:3513:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-43d1d8e4734mr2667485e9.22.1741883585618;
        Thu, 13 Mar 2025 09:33:05 -0700 (PDT)
Message-ID: <18983fc2-08e7-40eb-b5d7-738e36a2a271@suse.com>
Date: Thu, 13 Mar 2025 17:33:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/19] xen/sysctl: wrap around arch-specific
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
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-19-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-19-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -140,7 +140,7 @@ config HAS_ITS
>          depends on GICV3 && !NEW_VGIC && !ARM_32
>  
>  config OVERLAY_DTB
> -	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> +	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED && SYSCTL
>  	help
>  	  Dynamic addition/removal of Xen device tree nodes using a dtbo.

This wants to be "depends on", not an extension to the prompt's visibility.
Else a "select OVERLAY_DTB" somewhere would be permitted by kconfig without
issuing a warning.

> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -322,13 +322,13 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
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

This kind of a change would preferrably have the #endif annotated with a comment
mentioning the #ifdef's condition. Such comments may best be added as the #ifdef-s
are introduced. They can certainly continue to be omitted when the range covered
is only very few lines.

> --- a/xen/arch/x86/include/asm/psr.h
> +++ b/xen/arch/x86/include/asm/psr.h
> @@ -75,8 +75,10 @@ static inline bool psr_cmt_enabled(void)
>  int psr_alloc_rmid(struct domain *d);
>  void psr_free_rmid(struct domain *d);
>  
> +#ifdef CONFIG_SYSCTL
>  int psr_get_info(unsigned int socket, enum psr_type type,
>                   uint32_t data[], unsigned int array_len);
> +#endif

As before declarations alone may not need #ifdef-ing out.

> --- a/xen/arch/x86/psr.c
> +++ b/xen/arch/x86/psr.c
> @@ -133,9 +133,11 @@ static const struct feat_props {
>       */
>      enum psr_type alt_type;
>  
> +#ifdef CONFIG_SYSCTL
>      /* get_feat_info is used to return feature HW info through sysctl. */
>      bool (*get_feat_info)(const struct feat_node *feat,
>                            uint32_t data[], unsigned int array_len);
> +#endif
>  
>      /* write_msr is used to write out feature MSR register. */
>      void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
> @@ -418,6 +420,7 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
>      return true;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static bool cf_check cat_get_feat_info(
>      const struct feat_node *feat, uint32_t data[], unsigned int array_len)
>  {
> @@ -430,6 +433,7 @@ static bool cf_check cat_get_feat_info(
>  
>      return true;
>  }
> +#endif
>  
>  /* L3 CAT props */
>  static void cf_check l3_cat_write_msr(
> @@ -442,11 +446,14 @@ static const struct feat_props l3_cat_props = {
>      .cos_num = 1,
>      .type[0] = PSR_TYPE_L3_CBM,
>      .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>      .get_feat_info = cat_get_feat_info,
> +#endif
>      .write_msr = l3_cat_write_msr,
>      .sanitize = cat_check_cbm,
>  };
>  
> +#ifdef CONFIG_SYSCTL
>  /* L3 CDP props */
>  static bool cf_check l3_cdp_get_feat_info(
>      const struct feat_node *feat, uint32_t data[], uint32_t array_len)
> @@ -458,6 +465,7 @@ static bool cf_check l3_cdp_get_feat_info(
>  
>      return true;
>  }
> +#endif
>  
>  static void cf_check l3_cdp_write_msr(
>      unsigned int cos, uint32_t val, enum psr_type type)
> @@ -473,7 +481,9 @@ static const struct feat_props l3_cdp_props = {
>      .type[0] = PSR_TYPE_L3_DATA,
>      .type[1] = PSR_TYPE_L3_CODE,
>      .alt_type = PSR_TYPE_L3_CBM,
> +#ifdef CONFIG_SYSCTL
>      .get_feat_info = l3_cdp_get_feat_info,
> +#endif
>      .write_msr = l3_cdp_write_msr,
>      .sanitize = cat_check_cbm,
>  };
> @@ -489,11 +499,14 @@ static const struct feat_props l2_cat_props = {
>      .cos_num = 1,
>      .type[0] = PSR_TYPE_L2_CBM,
>      .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>      .get_feat_info = cat_get_feat_info,
> +#endif
>      .write_msr = l2_cat_write_msr,
>      .sanitize = cat_check_cbm,
>  };
>  
> +#ifdef CONFIG_SYSCTL
>  /* MBA props */
>  static bool cf_check mba_get_feat_info(
>      const struct feat_node *feat, uint32_t data[], unsigned int array_len)
> @@ -508,6 +521,7 @@ static bool cf_check mba_get_feat_info(
>  
>      return true;
>  }
> +#endif
>  
>  static void cf_check mba_write_msr(
>      unsigned int cos, uint32_t val, enum psr_type type)
> @@ -545,7 +559,9 @@ static const struct feat_props mba_props = {
>      .cos_num = 1,
>      .type[0] = PSR_TYPE_MBA_THRTL,
>      .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>      .get_feat_info = mba_get_feat_info,
> +#endif
>      .write_msr = mba_write_msr,
>      .sanitize = mba_sanitize_thrtl,
>  };
> @@ -808,6 +824,7 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
>      return socket_info + socket;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  int psr_get_info(unsigned int socket, enum psr_type type,
>                   uint32_t data[], unsigned int array_len)
>  {
> @@ -839,6 +856,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
>  
>      return -EINVAL;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  int psr_get_val(struct domain *d, unsigned int socket,
>                  uint32_t *val, enum psr_type type)

That's quite a lot of #ifdef-ary here. I wonder if we can't do any better.

Jan

