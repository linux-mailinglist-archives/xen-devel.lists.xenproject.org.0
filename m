Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D0B52F0E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119949.1465080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwf4K-00008L-OH; Thu, 11 Sep 2025 11:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119949.1465080; Thu, 11 Sep 2025 11:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwf4K-00005n-LB; Thu, 11 Sep 2025 11:02:24 +0000
Received: by outflank-mailman (input) for mailman id 1119949;
 Thu, 11 Sep 2025 11:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwf4J-00005g-VX
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:02:23 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9f7d1c9-8efe-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 13:02:21 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so94965066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 04:02:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32ddf93sm110457266b.69.2025.09.11.04.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 04:02:19 -0700 (PDT)
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
X-Inumbo-ID: c9f7d1c9-8efe-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757588540; x=1758193340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HOZseogxC7Jw13BzxMtqs9U3YWfc5TF5Ry9p9rPXVxk=;
        b=LHdunsBuwXTtf0qwQjuEaXEy2iTFiYswQ94ocf/IjQRo7ZZx7d0NRLlPUC9Wgk21xd
         VzTavyESz+94tCimkSRupXvysqReknBVKMyCdZqJlTclyBadMEswZDxBoZijBWOT7QGb
         M7PvMR1Qqd+PaoN1Y2meykl+iTvRazyszn6HER5tzRvV9Lqo7DbD2PTpCk+CCIg1gfPJ
         FfOPme5AcwlygDz3AC08ccBvVuVFkP7oDZRzRLG6rCiltlCigqbnekC7jYd3Dn0nE8oj
         2kWOjNgDKREAFsZVSfppp7rqVK8fp1Kzr7bBpakmBmK0ZQgLiR0Oig6gnyO9oCvEQzk7
         cuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588540; x=1758193340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOZseogxC7Jw13BzxMtqs9U3YWfc5TF5Ry9p9rPXVxk=;
        b=GZPLyV+HD9tLkuvMWSvD0IRA84tRJjtPy21QSYn6Hz1ANA9pyr8V81UzwteMwuQ9T3
         Bys4TcURRT7F5al33n6pX2Wj2tHFyz/ETdgzmNmusnTdQd5HaRfWLWAj5fzZ/O6lUF93
         HOPL5nlN7r1pbzIr9KIfTFHJCjkpqjQBvcJ4Tr2I68p6CbCzPt9gItlpRnE3SFxqi2gp
         KfaDtQC8iJcK98WaIDuNWaMkj7PWGnAHh+WaZqMUSPQTf4LxdQl4FMxzjd0bm4LP+ODg
         RVk4GgLDQWdrHKPdF3Sk6bA8wuDexLGgSbgyIIAzDAbmT5c8hDftPKgIehN6J7IU6M/V
         fNRg==
X-Forwarded-Encrypted: i=1; AJvYcCXY2mbSvdZmpUC5SPwwWw82dWmpUNW+4wc96fyJwyD0QQR98Ln1a9RePvBT36aXWOzxUq+V3zpQBaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE491axtRsXXYCkueiZv0FiF6Ovb/oE59lQXYfzoSM3U0C0XvQ
	9LnTg29CLJ10ayEUtVR4w9XY8tn01oxwB5AZBBeQMk0LueuWBwCF6D+WvpLutdI1dg==
X-Gm-Gg: ASbGncuA9Zygn5OBI6vP+MQEqE8pal7+hnQPD59GJtwMGj81l0W2r6Fo8TtMzOry6TA
	+AiofRGWjH3js0yJcoiCT5oltV4Qh7AmJgl+n30sstJ33v/XITUIN5Stf3umUPVzOrhENfFSUSY
	/pRaFin4xhvP2Dy09KNJcWI9cOm/j2VxZTlF2o1YED9WZUH0skVa1mT/NYYeoTwmCtrLYhUzgYZ
	acKm1/GbNRu4qwgMqP0H8cEvm2EO7TSxC/1BD866pPUzbkU9suIuSYBm6VSutOESBLwZl4eFJOQ
	LbOMd1azJWYdOU6JhcpJmISlpxYi9W8/JfJb1We5KqNJvZcf2r1hdokPq+5M+vb6jHe2D+V3fO1
	T8703zVKf8nu9iA9zNT9LZ/dxSKSP53zFNng2oCWkHgima+drDArj4AWfVI/U3U62UiYBY6LFxz
	Wc63HPhCE=
X-Google-Smtp-Source: AGHT+IHnzaLBah+FOTdjftyOl5jR2taPQVoByueBEXEWqPK1VdjzzJkPE0aV9yosXbt73dDXZKlxYA==
X-Received: by 2002:a17:906:b59:b0:b07:8809:9c22 with SMTP id a640c23a62f3a-b0788099dbcmr490214066b.15.1757588540003;
        Thu, 11 Sep 2025 04:02:20 -0700 (PDT)
Message-ID: <1bb90323-6071-4aec-9f6f-33163e6f769d@suse.com>
Date: Thu, 11 Sep 2025 13:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/26] xen/domctl: wrap
 xsm_{irq_permission,iomem_permission} with CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-16-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> @@ -508,13 +510,21 @@ static inline int xsm_unbind_pt_irq(
>  static inline int xsm_irq_permission(
>      xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }
>  
>  static inline int xsm_iomem_permission(
>      xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }

Along the lines of Stefano's comment - why would these inline functions stay
around? Them returning an error in the MGMT_HYPERCALLS=n case is actually a
problem: For xsm_iomem_permission() it's only a conceptual one, but for
xsm_irq_permission() you break x86's handling of XEN_DOMCTL_gsi_permission.
I would have added "transiently", but from the titles of later patches I
can't spot where to expect that one to be taken care of.

> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1111,12 +1111,14 @@ static int cf_check flask_unbind_pt_irq(
>      return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  static int cf_check flask_irq_permission(
>      struct domain *d, int pirq, uint8_t access)
>  {
>      /* the PIRQ number is not useful; real IRQ is checked during mapping */
>      return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  struct iomem_has_perm_data {
>      uint32_t ssid;
> @@ -1943,8 +1945,10 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>      .unmap_domain_irq = flask_unmap_domain_irq,
>      .bind_pt_irq = flask_bind_pt_irq,
>      .unbind_pt_irq = flask_unbind_pt_irq,
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      .irq_permission = flask_irq_permission,
>      .iomem_permission = flask_iomem_permission,
> +#endif
>      .iomem_mapping = flask_iomem_mapping,
>      .pci_config_permission = flask_pci_config_permission,
>  

It's odd that flask_iomem_permission() remains as a function, but for the
moment that looks to be necessary, as it's (oddly enough) called from
flask_iomem_mapping(). However, for that one I again can't drive from
titles of subsequent patches where it would be taken care of.

Daniel - is this layering actually helpful? Can't we either drop
flask_iomem_mapping() (with the benefit of a cf_check disappearing), or
have it do directly what it wants done, rather than calling the other
hook function?

Having reached the bottom of the patch - what about xsm/dummy.h?

Jan

