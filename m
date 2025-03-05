Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44400A4F9D6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901929.1309920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkyA-0006eY-Uy; Wed, 05 Mar 2025 09:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901929.1309920; Wed, 05 Mar 2025 09:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkyA-0006cd-RF; Wed, 05 Mar 2025 09:23:14 +0000
Received: by outflank-mailman (input) for mailman id 901929;
 Wed, 05 Mar 2025 09:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpky9-0006cV-Tf
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:23:13 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75622fc4-f9a3-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:23:11 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso1635124f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:23:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a7473sm20686531f8f.38.2025.03.05.01.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 01:23:10 -0800 (PST)
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
X-Inumbo-ID: 75622fc4-f9a3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741166591; x=1741771391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qu1uRwoZW4Grbea5GGS4q97jjaEXRfKeSDceRse/EWM=;
        b=C26DbKaSBOQUpEwhRQXPmudxo0t/sLHZvQFxOWFFkp+mdgXiyawNLBvRJVpl/em2Re
         pROhE3ZNOgw6Q625dYL/0rgpI0NHFknMAT2dKcREsq8qa0H5T9PRN9jxjczh0ExZOJ6g
         JVLJTKUe/9oY2lPqRmWKv9cmylDFawN8m7nxKvruFk0HflH3YTIlWsFT2HH2TAxVvJF8
         mExrwYtBn6I395dCHbdCeNEqdRvrVy021Cbui3lL0vXJFZYIijHp1XPQKX/wCxBLZdF9
         S+WCfCpagXmJtojmgaheJzLP+eqbb+5JYqL6/AshcQkbucCIQrJ4Kx2oOOmKm9mar6IX
         5uSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741166591; x=1741771391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu1uRwoZW4Grbea5GGS4q97jjaEXRfKeSDceRse/EWM=;
        b=AxoVKXaPEvXxL3rLzkm9LQBQ9YP9OtvnLcHKNoL2IM0cS+v58I4/FyXpBlRcWkr6L+
         vVkNp8BAacmheVPhM53sc8rB5AljoTyR1lY3UUvFXmq8wxTfJ0/ZuGS9WBWgW8iDl//k
         iZf+MgVw2iSBTLQctYnIPlQI6v8cwtWZEJZ/LwgUgt9S6ExJuQmLTDG/MVew8Y47SUjs
         6wYCzV1m2RaIY6bGP6GjGOsbLKxq9ghefge0y8UeTFkSyYVkD3gu49WRI8SGpx7aurIa
         0CVrztBYcIAagos7ismoWSR/N6NnsE5P4tA8i0TKBz5nHAKIuzPofZ3I5kbasHAU433V
         MG2g==
X-Forwarded-Encrypted: i=1; AJvYcCVzh5AEthifevntjMSMrHKJiCWBOKqxcJbVOLsIB+H+iwQ5uTQbAcNmoOgAe41orjCkc3SPxNfnFcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiPtR/0X+xCTeDqswiuJrCCH8vaBGhKN9SaaHQRG646nHNXk34
	TrvVF7Alka++V5Im5VOW3efNWZUnCXR3m88hwCF/2PaXGvW00h4bYo2BPG4/7Q==
X-Gm-Gg: ASbGncsaSDCbATe2i5Wazw/M4FS+k7BoR6nKYUNNVnBI2jkbULB15kEJMu9w2mJWwBX
	FcdBCuQe1Gw3Hd/vQ5arqGUv92PifjBrnu8ztE7rleYRTySCk6bApa9ovF8NVExpOVsf5KEXpva
	nA8uQJSsTn0q7ujIkRsR05DoOkiyWGGMx2nldVfDZaugn29VO3imkNTIhfHL8o2z54e2jOuUgiE
	hk4HWK3YEB57HihST5WojOKlLATM45qV0DbiJFwhk2u5IgwCvXhBoqGahcQNEco+H/Evd5KMgAB
	4ZRx6wyl/QmuoD+6AY45opVi4557bgfVaXfTCOgX/nKBmXbQs/NLgRe2huBgiUrlujVx+K6gqN+
	K2cnZvHl0W7PLhyv1QuX1CSzaSEfqtQ==
X-Google-Smtp-Source: AGHT+IHy1I04AeplFbRfUXiRFKE5nJpLdT2zm2Ye/1qhjlzc+0DfWNaEcwpOPcXn0Zvd7AOVfEd5jQ==
X-Received: by 2002:a05:6000:1788:b0:38f:43c8:f765 with SMTP id ffacd0b85a97d-3911f756783mr1663177f8f.26.1741166591145;
        Wed, 05 Mar 2025 01:23:11 -0800 (PST)
Message-ID: <abffca04-ca4f-4d62-8c2d-c687550ca8c3@suse.com>
Date: Wed, 5 Mar 2025 10:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/domain: Annotate struct domain as page aligned
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
 <20250303232941.2641306-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250303232941.2641306-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.03.2025 00:29, Andrew Cooper wrote:
> struct domain is always a page aligned allocation.  Update it's type to
> reflect this, so we can safely reuse the lower bits in the pointer for
> auxiliary information.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Dario Faggioli <dfaggioli@suse.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <gwd@xenproject.org>
> 
> v2:
>  * New
> 
> Interestingly this does cause two changes in the resulting binary, both caused
> by GCC electing to use a more complicated addressing mode to save one ADD
> instruction.

That's on x86, I suppose?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -645,7 +645,7 @@ struct domain
>      unsigned int num_llc_colors;
>      const unsigned int *llc_colors;
>  #endif
> -};
> +} __aligned(PAGE_SIZE);
>  
>  static inline struct page_list_head *page_to_list(
>      struct domain *d, const struct page_info *pg)

I understand struct domain is where you need the annotation right away, but is
there a reason not to do the same for struct vcpu right away?

Jan

