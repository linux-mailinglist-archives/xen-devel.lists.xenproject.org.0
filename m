Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A47A7B847
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937837.1338711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bZl-0004jp-MU; Fri, 04 Apr 2025 07:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937837.1338711; Fri, 04 Apr 2025 07:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bZl-0004hw-Jg; Fri, 04 Apr 2025 07:34:53 +0000
Received: by outflank-mailman (input) for mailman id 937837;
 Fri, 04 Apr 2025 07:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0bZk-0004hq-Q0
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:34:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ade192e-1127-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 09:34:50 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso12363825e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:34:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34be2f4sm37934475e9.19.2025.04.04.00.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:34:49 -0700 (PDT)
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
X-Inumbo-ID: 4ade192e-1127-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743752090; x=1744356890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F6LuLu7ttBbu+6ihLL7tsvFTfwKTtU6/PD4fs3YDkzI=;
        b=OKaC+FMT1NEu+ntkvz387753jfzh6R7bWkY6ovvXi/nCriqii1r37Ec49MhjMt4u4P
         dmOnqLcLXaiWpzJL4CpPlqICyuP1Z6Ny/rclCTbLMVJORRRFHmI/wUJuWH0Gm9NX/tYr
         144vMJ3BI+ANeDQpb/D8DpACf3jecE/euin03vA2LbhN4XsB4RZfrpU9xQgesDpA649D
         449n9ISLniAoKcY0XP9Gn+5vOf9wniyeA4F1B4+1HX7anUJmrX4gn2TN3S5sGYa7J5xt
         fv3cbHL2MVhJ6purBOsd6MleVMgyKY4toK/tn07zSwIs1Ih4F4QP2gTKM1FSP44qTS/5
         larg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752090; x=1744356890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6LuLu7ttBbu+6ihLL7tsvFTfwKTtU6/PD4fs3YDkzI=;
        b=V4GEW/pu4ypssZ+xmx1oxhlOmcTYu3o+hM4MszsPAEUvoiKvhi0eEYWBo794mHECRF
         +2DTa9My36LjzxYZYOn/867MIepv4FsuMZ46CpI3PzQ8OhCgR/BSmQIW7Vc3LauSvPO0
         Ug5ZFpHzVO98QYQiL5F3VqfSmMUwEqsYIKIV+iZbjvCvXbXFUKiEh1KZfCSX7459+adF
         pszIJ+3eRhwPYppq3ziMcNOOXz0SqNuxjGfRB9r2QUQr4FLRzqZgqdgy/GpAwiIV0kMu
         t7Hk6WukLZtfhVosCYDzrGLBEgXjX+Jh4NMZoctJdJtehQuO7FtK31uiiZMdF7EuBLTv
         3HdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK9p1H4UQH+ccG7P97wBRDYO4tc4NIlh7m6gUW8602I11WjGGAcxJICOfgyjor5kMvxILUuwUaxSI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFDQXM2QVZbhBUbFJjxopkEWrJfFz6gqKb5ww/8tuevqg/jOe2
	9JVQjiIK/fikKPODe7+2oExXhjHhGmtUJTUl/YShhAkhl4uLpAmf7u5FgJK3rw==
X-Gm-Gg: ASbGncvqCiRR72EqR4QVB9TDteAjqUKkpQR9CEC0GvtQvqCNorOv5+DYe5K9ln9tts4
	cI/53aDCcGgoSII9Ad7CgRSYRp/+kObrnOoK5RoLBp+h1Ay+8TAgIHrWfAHHmCf8CLobIMVmM2E
	GaPPKwVGazsgGcrgnO34kSfGCFDKWeqS83nRuwcnP0c9E83Fm0Qqtw8bgFfqesauAFeJSWrxRT9
	0MzYEPVrwy9pfuqwgHurWp6qyCdOFg+GhDKIyXLcBEWYx2FXK8Y/M89gFmzPmchXqeT8Hhq6UbY
	ui5scMBHqtd/SZYVKE7OK/tf74oSnAqegAIBSyUOrbujaau8zocqarL0d5kJ12nA259hB5GKuyu
	HvLmNcq4uTQ7zUpIPevu7Zj+e7lcPgA==
X-Google-Smtp-Source: AGHT+IH872JyRDvaIpe3yJLc3SOHwNB/QQplWT9MK/smPHfiL3IcW9r3+E+sSFWZ0M8Vq9zMz/TX3Q==
X-Received: by 2002:a05:600c:4e09:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43ecf9fe6d2mr18430255e9.24.1743752090183;
        Fri, 04 Apr 2025 00:34:50 -0700 (PDT)
Message-ID: <2d0259da-f617-4fda-bc23-840e54a16527@suse.com>
Date: Fri, 4 Apr 2025 09:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] xen/arm: dom0less seed xenstore grant table entry
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250403214608.152954-1-jason.andryuk@amd.com>
 <20250403214608.152954-5-jason.andryuk@amd.com>
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
In-Reply-To: <20250403214608.152954-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 23:46, Jason Andryuk wrote:
> xenstored maps other domains' xenstore pages.  Currently this relies on
> init-dom0less or xl to seed the grants from Dom0.  With split
> hardware/control/xenstore domains, this is problematic since we don't
> want the hardware domain to be able to map other domains' resources
> without their permission.  Instead have the hypervisor seed the grant
> table entry for every dom0less domain.  The grant is then accessible as
> normal.
> 
> C xenstored uses grants, so it can map the xenstore pages from a
> non-dom0 xenstore domain.  OCaml xenstored uses foreign mappings, so it
> can only run from a privileged domain (dom0).
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v3:
> Expand commit message about C vs. OCaml xenstored.
> Remove __init and flags from gnttab_seed_entry()
> Change frame to uint32_t
> ASSERT gfn fits in a uint32_t

Ehem. For this you need to use ...

> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -788,6 +788,12 @@ static void __init initialize_domU_xenstore(void)
>          rc = alloc_xenstore_evtchn(d);
>          if ( rc < 0 )
>              panic("%pd: Failed to allocate xenstore_evtchn\n", d);
> +
> +        if ( gfn != ~0ULL )
> +        {
> +            ASSERT(gfn <= UINT_MAX);

... UINT32_MAX here. Furthermore may I remind you that INVALID_GFN ==
UINT32_MAX in 32-bit environments.

The ~0ULL may also better be UINT64_MAX.

> @@ -85,6 +89,9 @@ static inline void grant_table_destroy(struct domain *d) {}
>  
>  static inline void grant_table_init_vcpu(struct vcpu *v) {}
>  
> +static inline void gnttab_seed_entry(struct domain *d, int idx,
> +                                     domid_t be_domid, uint32_t frame) {}

Hmm. While generally I prefer using such wrappers, I wonder if in this
case it wouldn't end up more clear if a conditional was added in
initialize_domU_xenstore(). Ideally using IS_ENABLED(), which - aiui -
would require moving the declaration of the function.

Jan

