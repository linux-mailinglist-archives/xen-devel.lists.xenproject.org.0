Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F82C85CBB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 16:37:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172045.1497135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNv6J-0000ef-Ut; Tue, 25 Nov 2025 15:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172045.1497135; Tue, 25 Nov 2025 15:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNv6J-0000cf-S9; Tue, 25 Nov 2025 15:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1172045;
 Tue, 25 Nov 2025 15:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNv6I-0000cZ-NJ
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 15:37:06 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9796d0ce-ca14-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 16:37:04 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42b3b0d76fcso3549998f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 07:37:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e5b6sm34688263f8f.1.2025.11.25.07.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 07:37:03 -0800 (PST)
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
X-Inumbo-ID: 9796d0ce-ca14-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764085023; x=1764689823; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uvKePOQK/JgThFPjmPU0QzoZbOmKCWhdAOZGk9NK9rU=;
        b=MBE5Ux3TBwlMkWyiV/hQGqi+yXOWL+vEgdd1jLKYwF1Wf9+iNnWaGTm71A4DwShdzK
         8vBM8+XPFmrQMdSai0VYG572s1ywjAugUdn2CW1cYksqlfMZjRxns7LLRea64YG7Dqw9
         TosA4xMvP89yCM8fw1ilZRDoBEYv4cgeYkiOPIWpg6gggkyW2BqndakPN0gTvVXb74To
         8CIAERgy/el9Zh4H5KmUlN2L7DDv8RBFyA+dJFlpAxgZIFN/RqItc+0LPfj54ePQrPCE
         XDruLTGiqBe2RCTdeSubUd+76Nys6qZ6E+9j+fOzCEbghj1IrLFkfjOADIjFIpyKv9Ki
         GfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764085023; x=1764689823;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvKePOQK/JgThFPjmPU0QzoZbOmKCWhdAOZGk9NK9rU=;
        b=R7/ypE3ODTtMOEigxYAfU/Vfl2n80bELs2R8TbX17Tuksm/qn1pxHxf43Jqhy9iDXj
         EvKNaJW7josWPOVlLWZqnGZ4fBnzYHXcMyAjwWalf9gum5+tHp+wmbnUWg+NdXg5vMDl
         H1UA5M47bwF7uGHjU8EogORSYhm2d0KeCc6Mxi21aeMu/ZwHgSk8Fh/0SwtWODKI3J7e
         +a41HznhCD78LLlTrqQmOL+4HmkWXUOiUwo+7tnVqc4a8AOW9qXtmUa77xztg9CC69Ly
         FRFOp8JZr6qZqfUcN/31OhWIyWhlDSRnmJscDNvhoIUMolZpZWaSyrsdUPTyjo0MMy+H
         qNaA==
X-Forwarded-Encrypted: i=1; AJvYcCV/c9s8JI2wiWRThUF/iZYUjcHWR98Vw19BJwVCq23k/EDsYjEZWqGQBgTV/jHajV/ET0SzlC8uSCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaG43KRSPtSrQ1p6O0TpCIl+GCMkOJqXra4DFxHu5OKUcfES/t
	UIgdDZsntNaFfj0BOqznmn1eKSPYQFJEVwlX3omiGD2hnxwQnePC9MnSuhbTUAkSgQ==
X-Gm-Gg: ASbGncvbao4SwI50auvaRnrh4H/OlzTgkXjAPO4MLj1iTwSraMToDTqgfMgFusuWaqV
	BEKCH+INixy8a4WPb4rUDDVfjzhrWjRmKFpE+Svcbk8yNFkI/GDCl1QFk50dGRUORXBycHaTMAT
	5Y5Diu/yX4UDYzuXIJI77BQl6OFMJ8eTLJouozxKF1LquIy5NUhHCMpG9NH/4qpohokRtcfZGRW
	mr8xRlGNZHUFJ64Z+13Xn/9HuSQwG8oEvUaYAzV7ngGUSc3tRUceTfVPDoBmeJrVq5ZlUWIcOJh
	p7TvYeZMizoS63pyWrkE350rOdrLD5I49p3ANQmVb7oDlllZqWUbJsv2Lw+2uyAkLHGzBXbIiGd
	MjIVr8s5I/Rzq14CmA2lGg1gSzldDOkwtFhQCNBJZmvPjAHEAdvG4Q1F/rpDkDqeV46xKIePp4F
	0ttXCa89m0688b8gk+IWln8//cYkg8lcdO40zgMl1i+XotDzH0LMd0gr0Hd2IL7abM
X-Google-Smtp-Source: AGHT+IHInzVcuUN9DSQvVyI/DQSbntoKv1+Amq2se8Dkzvv8te6qiWaNwnc3HPWOBP5R5vGndkEkXA==
X-Received: by 2002:a05:6000:4313:b0:42b:4177:7135 with SMTP id ffacd0b85a97d-42cc1d35160mr17432900f8f.41.1764085023433;
        Tue, 25 Nov 2025 07:37:03 -0800 (PST)
Message-ID: <6e1dd697-7276-4d1b-841c-a9b1594fa858@suse.com>
Date: Tue, 25 Nov 2025 16:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related domctl
 op with CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-15-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-15-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++----
>  xen/drivers/passthrough/pci.c               | 52 +++++++++++----------
>  xen/drivers/passthrough/vtd/iommu.c         |  6 ++-
>  xen/include/xsm/dummy.h                     |  6 ++-
>  xen/include/xsm/xsm.h                       | 12 +++--
>  xen/xsm/dummy.c                             |  6 ++-
>  xen/xsm/flask/hooks.c                       | 12 +++--
>  7 files changed, 68 insertions(+), 46 deletions(-)

With this diffstat and there being quite a few HAS_PCI under
xen/drivers/passthrough/arm/, what's the (PCI) deal there?
> @@ -772,14 +774,16 @@ static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
>      .quarantine_init = amd_iommu_quarantine_init,
>      .add_device = amd_iommu_add_device,
>      .remove_device = amd_iommu_remove_device,
> -    .assign_device  = amd_iommu_assign_device,
>      .teardown = amd_iommu_domain_destroy,
>      .clear_root_pgtable = amd_iommu_clear_root_pgtable,
>      .map_page = amd_iommu_map_page,
>      .unmap_page = amd_iommu_unmap_page,
>      .iotlb_flush = amd_iommu_flush_iotlb_pages,
> +#ifdef CONFIG_MGMT_HYPERCALLS
> +    .assign_device  = amd_iommu_assign_device,
>      .reassign_device = reassign_device,
>      .get_device_group_id = amd_iommu_group_id,
> +#endif

You don't zap the hooks themselves, i.e. they end up being NULL now in
the (still only hypothetical, provided the Kconfig change will be adjusted)
case of MGMT_HYPERCALLS=n. I understand the former two hooks are still
needed for DT, but at least .get_device_group_id should be properly dealt
with in xen/iommu.h right away, imo. This would then also clarify already
here that that's the plan for the other two hooks as well.

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -407,7 +407,8 @@ static XSM_INLINE int cf_check xsm_get_vnumainfo(
>      return xsm_default_action(action, current->domain, d);
>  }
>  
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
> +#ifdef CONFIG_HAS_PCI

Why the separate #ifdef? Can't that be folded with the #if? Are there further
changes to be put inside the outer #if? (Applies again further down as well.)

>  static XSM_INLINE int cf_check xsm_get_device_group(
>      XSM_DEFAULT_ARG uint32_t machine_bdf)
>  {
> @@ -429,7 +430,8 @@ static XSM_INLINE int cf_check xsm_deassign_device(
>      return xsm_default_action(action, current->domain, d);
>  }
>  
> -#endif /* HAS_PASSTHROUGH && HAS_PCI */
> +#endif /* CONFIG_HAS_PCI */
> +#endif /* HAS_PASSTHROUGH && MGMT_HYPERCALLS */
>  
>  #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>  static XSM_INLINE int cf_check xsm_assign_dtdevice(

The DT counterpart, otoh, is separate anyway.

Jan

