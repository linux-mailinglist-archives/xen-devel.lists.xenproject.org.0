Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9745CBD9B3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186895.1508327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV74o-0002x5-2Q; Mon, 15 Dec 2025 11:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186895.1508327; Mon, 15 Dec 2025 11:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV74n-0002uE-VJ; Mon, 15 Dec 2025 11:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1186895;
 Mon, 15 Dec 2025 11:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV74m-0002u8-8u
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:49:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13739411-d9ac-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 12:49:13 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47798ded6fcso20868535e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:49:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f49da20sm181447205e9.5.2025.12.15.03.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 03:49:12 -0800 (PST)
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
X-Inumbo-ID: 13739411-d9ac-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765799353; x=1766404153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LytDBX+HvWp8PceFA9W1rsQIAKVTDSBgA37g9exLRas=;
        b=DUwsLVCLvnoHTi3dpfqx1Camb5d/BvRIR6ylKHFvjbteTrFq3X5DaZ/jyRJCbQXz9O
         e5uF7SARwvsDM2giga0YkmlwbR2evfCA/KSRA2abznqFjWZ+IFyDt0l31THUlQ3Vtyri
         sM6kGlzsHnPVT8i1n8zlhX33OmtemA8P5Es8HhtElnjKG37Cn5Dj/VZIrpQfxlPN2jJh
         dWoofuN8rjWudLjLbMUT6zQjpb+o5RamU8lZf2D9VRjBR0KQhMr1VDUdD1ERDK9aTO3K
         kz9q1R1oTplYK1VJ+cO5zaCc8WdNPSMCmNjHaXrLW0mLpBTO4TZV+st8MzfGnajtfxFK
         I07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765799353; x=1766404153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LytDBX+HvWp8PceFA9W1rsQIAKVTDSBgA37g9exLRas=;
        b=OfQc7VOloLlpE/qeGLME2ZxXgyIq15GD1F1i7c2uK0bFoJ/+sD7ht5C8N2McuSiv6h
         pbwgLrGUya4sI0D77bYfdZF6SaiTQQWBbY6Cdl9ifg5+q5GWUc/j8CxPiwo+nlGFgY4X
         JPxkYHBmN6b2RE77FkAlM0YzsIlLEcgeygm3A5bCd7tiZ6ts/LAZn0/lONPboblFFoYL
         my79RXYLxmyqAOGtfJyJL8L8ggrGH9Q/8NvWQ0OtNeq+Gr/AIe1af8m5Gz22cOG8lu0k
         cqUssaeE/TdHQrlJdw1q3eTLZT3Vp3mkbznz6+kNm67IGIf9ULLLAWcwZ9dS2AKKa6fM
         YLWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA3XuXo4nEiSJMdQ+bCmi5Xn6peeRZkFPTFPcpbm5/ES+Tv6dG/s0WGsjsiMawH0tiRL0tWcY9Rfc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd/egQGseH+aD9oMl4+ZTaJT/3ufWOLfp/lUBCacDvO1DVjBmx
	g95RnWggEkC8KEjAT1GmnRviNqX4mhYRd29hveK9H7AbTWOai1N5fN4S13+TQ8meWA==
X-Gm-Gg: AY/fxX54kXLEz6wdIa/1MQwq6Bf+tOfXsqrQNkcJ1tRaFYkXVgpfF/WM//EPkWdup17
	hgGALDvBuNPb6kSb5igRvMwMCYTpdJmYeZMrwdFNCglHjq827kObnai+pyCzLrf0wJXAAplu5JW
	R3M/1a89uAvWuNaMVo8O3zF5p58gx0JUyNPcL1F0IAeCzG9uY9+Y+56jBS6KepBMGFN1KtQAvtQ
	U9KS+h7/nTNWpJ5lO5fJIBdIi0HLtqL4cPp6xvCdUsfdFopr5EUSV2Ir+mB4vgt1n6QlNbjyWl2
	ZpQvuuU0RHFhUtX0gT2lEDqejfAir/pHbYU95birgospHntCb679D5JmS7BXerNCtG3Y63kIqiw
	L5Y/EJhm/cJtwetHQcxYs/jHAWLU/0MtPp4aWCkhlIB6iSyUFmwyHE7rVedKY6mruq0EgUzAR6g
	jb7VFjIKDIXedMtDI5g3muzIBOtimnopU65BV+CI0lfD9tdz7sHVU5BrDQWG0RuMh0GVl2AZfWg
	nKc42k8bw7whg==
X-Google-Smtp-Source: AGHT+IGX2G4JM+jjUaLmFnmcP9FZn4jxx01nQcjQD94IPAlHqBA7mewTHWnE6edTRIwzH1an32h9rQ==
X-Received: by 2002:a05:600c:8b83:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-47a8f8a88f6mr105361555e9.5.1765799352768;
        Mon, 15 Dec 2025 03:49:12 -0800 (PST)
Message-ID: <5bfbdbc6-c1ea-4aa6-acf0-1516b226f3c2@suse.com>
Date: Mon, 15 Dec 2025 12:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/12] xen/arm: Add support for system suspend
 triggered by control domain
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>, Saeed Nowshadi
 <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <66fffded45f39599c62a1e4dad83c34f9de51d7d.1765472890.git.mykola_kvach@epam.com>
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
In-Reply-To: <66fffded45f39599c62a1e4dad83c34f9de51d7d.1765472890.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2025 19:43, Mykola Kvach wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -137,6 +137,11 @@ config HAS_EX_TABLE
>  config HAS_FAST_MULTIPLY
>  	bool
>  
> +config HAS_HWDOM_SHUTDOWN_ON_SUSPEND
> +	bool
> +	default y
> +	depends on !ARM_64 || !SYSTEM_SUSPEND

As written, this would want to be "def_bool y". However, I think I indicated
previously that imo it would be nice if we could stop adding more "depends on"
referencing particular architectures. Instead "select" or "imply" from
xen/arch/<arch>/Kconfig appears more desirable to use in such cases. That way
each arch can control what it wants without needing to touch common code.

As an aside, in the context of PV_SHIM_EXCLUSIVE it was also said several
times that negative dependencies aren't very nice to have. Here we have no
prompt, so the "allyesconfig" concern doesn't apply, but I still thought I'd
mention this.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1324,6 +1324,11 @@ void __domain_crash(struct domain *d)
>      domain_shutdown(d, SHUTDOWN_crash);
>  }
>  
> +static inline bool need_hwdom_shutdown(uint8_t reason)

Personally I think "want" would better express things, but I don't really
mind "need".

> +{
> +    return IS_ENABLED(CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND) ||
> +           reason != SHUTDOWN_suspend;
> +}

Seeing this in use, I wonder if HAS_ is really suitable here.

Jan

