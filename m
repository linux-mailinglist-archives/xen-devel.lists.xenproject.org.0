Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F485A04630
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866640.1277966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCRL-0006dQ-8Z; Tue, 07 Jan 2025 16:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866640.1277966; Tue, 07 Jan 2025 16:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCRL-0006bA-5i; Tue, 07 Jan 2025 16:28:23 +0000
Received: by outflank-mailman (input) for mailman id 866640;
 Tue, 07 Jan 2025 16:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVCRJ-0006b4-Vp
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:28:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6866e085-cd14-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 17:28:20 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso105337915e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:28:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e261sm51561401f8f.76.2025.01.07.08.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:28:19 -0800 (PST)
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
X-Inumbo-ID: 6866e085-cd14-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736267300; x=1736872100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x66COL8cMorOqV5+S+Ao/p5Y+jjzvxutFukjG5PvADk=;
        b=V8kykDaV97UeWca5U/8YLrBeg8Sv4xTc1IQ5BE5Sg4jSRVn2cgG097UUldb5oflpEb
         fpLbGT6FpEGoouHDXWwnU5q2Mb2Lhesso99ojI4gkIHsRTkzsmAcERuWEvtfErWL3H4u
         Aw+QTX66FDqt7WjA2ZyRytigelueTIOXZPtI7BNYAszmYCo4GXMeGPrMN2G0TqN7c/LY
         B9a+Zlp8Dff5vj7q9mwY4xj+s3Qs39vRb772Vq00dmywZKSI43xKySl1Q2jgtECJvdgo
         sfeu0wiU4jsNuLMxtEWPmihLB6EwQq7iNYTRU35XazfvUyY3WNO18iMIMKluxfELIU+p
         82QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736267300; x=1736872100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x66COL8cMorOqV5+S+Ao/p5Y+jjzvxutFukjG5PvADk=;
        b=KgEQoS+tY1L5oFhVRRHL+X10GbWnq8VVD0sMG//d9xG8RF2d/rwunfT8OiTKjJgh70
         cG2r4fRM4fp8eERReKa6GaCy56aGWubTbE3kKOe8MvFA28YZYABgrHj3emeCvfeFlHnF
         Cje8h7KoQiv8ihWHa+8tzYpGb9+ynt7wh4rbfZLGsgbeqhH2kkRuo8Rc1ZjMKT2LBOsY
         ldqd0fuWqlfVAnIpGa6q/3p1bGKcZf0/uPs5cCoNylXCpZ5st25NMbCvC4S1VpwkGNuG
         BF5XtfIIT/FY1Fx7HM8yacTIrie247XC5ZbKG4fjj0wpJ6b6BKAANoFaRuIxhIzvnWXs
         bSIg==
X-Forwarded-Encrypted: i=1; AJvYcCVGQDSChOol5EL68R0KjQSPwIemYMiq6AjfDzTgrF0wxtZ8ykF7TSoNAV1ej0M9CeTZ6daCu2xcIAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz0k0hrBcbWlW+Dg4UhW3fAIMJyjcJ3W9MWxOgjlb8QP0dGWIf
	UhQU1yfgi3qJ2Gl0o3/R8sngkjqJWUci+fH6RY0j6Gm0OP9a4cseArEddnMEaw==
X-Gm-Gg: ASbGncuutctzAAa7+9fi9sh9SkiWHoPPNmJ6f1BU8XGiM3YSP68pZNd6OtsYno84RAn
	FTKnPWjUc+F38mpb766TX9jHAgzqJ+f3QW7D9/zn/oPr4QscpapphXodfgcTzjIIpxU6Ba66wyp
	thGk7EcX9oxxb4+le7eFSxwUb+QUcbSmxRSfrBPtondRH+7BhrIQfAAzs2zQKDwoiveU2vCVzym
	mm+7J5y5FToTHNHynwdyaGEmTiZJudXcOXUlYikLJkB5jncakHs4e+qoT+dOETkRMb+6DNWxjEB
	hMVBDlD5wJ+YQ3CTqbkLKZK7dMMfBb9lWi9onf8V6A==
X-Google-Smtp-Source: AGHT+IGt2HAiZjF6JfMzpHacHKNE1MwoQk/whAchyXUSoz2s6FDypgVBAJ8WrZ53+GATzH9tExjYpQ==
X-Received: by 2002:a05:6000:2c5:b0:385:f195:27f with SMTP id ffacd0b85a97d-38a221f339emr56512836f8f.5.1736267300221;
        Tue, 07 Jan 2025 08:28:20 -0800 (PST)
Message-ID: <781daba7-5d6f-4d86-bce4-c5aa9d135513@suse.com>
Date: Tue, 7 Jan 2025 17:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-6-jgross@suse.com>
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
In-Reply-To: <20250107101711.5980-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2025 11:17, Juergen Gross wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -185,6 +185,76 @@ static void domain_changed_state(const struct domain *d)
>      unlock_dom_exc_handler(hdl);
>  }
>  
> +static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
> +                                  const struct domain *d)
> +{
> +    info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
> +    if ( d->is_shut_down )
> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
> +    if ( d->is_dying == DOMDYING_dying )
> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
> +    if ( d->is_dying == DOMDYING_dead )
> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
> +    info->unique_id = d->unique_id;
> +}
> +
> +int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
> +                     domid_t *domid)
> +{
> +    unsigned int dom;
> +    int rc = -ENOENT;
> +    struct domain *hdl;
> +
> +    if ( info->pad0 || info->pad1 )
> +        return -EINVAL;
> +
> +    if ( d )
> +    {
> +        set_domain_state_info(info, d);
> +
> +        return 0;
> +    }
> +
> +    /*
> +     * Only domain registered for VIRQ_DOM_EXC event is allowed to query
> +     * domains having changed state.
> +     */
> +    if ( !domain_handles_global_virq(current->domain, VIRQ_DOM_EXC) )
> +        return -EACCES;
> +
> +    hdl = lock_dom_exc_handler();

Instead of leaving a small window for races between the if() and this
function call, can't you simply compare hdl against current->domain?

> +    while ( dom_state_changed )
> +    {
> +        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
> +        if ( dom >= DOMID_FIRST_RESERVED )
> +            break;
> +        if ( test_and_clear_bit(dom, dom_state_changed) )

As this is now running under lock, does it really need to be test-and-clear?
What mechanism would allow the flag to be cleared between the find-1st and
here? Plus, like for patch 4, I think it could be __clear_bit() here.

Jan

