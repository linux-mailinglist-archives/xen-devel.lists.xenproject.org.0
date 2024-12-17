Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5589F49FF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 12:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858864.1271091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVqg-00028R-5I; Tue, 17 Dec 2024 11:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858864.1271091; Tue, 17 Dec 2024 11:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVqg-00026H-2f; Tue, 17 Dec 2024 11:34:46 +0000
Received: by outflank-mailman (input) for mailman id 858864;
 Tue, 17 Dec 2024 11:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNVqe-00026A-KE
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 11:34:44 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e918cba6-bc6a-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 12:34:43 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e3621518so2627436f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 03:34:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559ed8dsm174314595e9.23.2024.12.17.03.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 03:34:42 -0800 (PST)
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
X-Inumbo-ID: e918cba6-bc6a-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734435283; x=1735040083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FGcCn7MS4hx/mI5jQMgSZdmLZ7w8ly50SQXxSiWuojM=;
        b=Eh5jJ+YLIP7pqeYK0mvciUJ+Z65FA13EHu8xFVAszg/P/mNoLyXtgg/JF35ekGfxpH
         6z6rKeiP/nfHi+7xSOKXHVq3hNgcDTCYvvAhCK7rblu3oUnYm/lTyi2Nw9oEFXSVdUTg
         Z3zBUVUM2A5pFmHxqN28e+K06WHQjhASRyinkB/0jSuVlzc23fqgALMT7tTbnN7WYxgd
         dLEJTsZnOkPUmRSwzAF/JSVXpHKaLjLfVnaUTIFkzJmNEOdsNRWUaoqtusJ6bGb69TFn
         DVINuBxFfbgNajtlRNVwXTksTvZBctePB9NgLhV0YIhFGOxpfD8SX0HQ1AGDBChXjbb9
         ESTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734435283; x=1735040083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGcCn7MS4hx/mI5jQMgSZdmLZ7w8ly50SQXxSiWuojM=;
        b=JrObzVYYt1od3x8eVJ/z7IpLBjUgR3awN+BskEnWYubxgszqqv2+TNvr3qnEhfdV5y
         L+g8bWu/L5ntabpwR7cIh68jJRElHxE5j9iBlyvKD7C7kcyqBXAbLtYLcJzE9BQ4IuvR
         hopnFtoT5OAfeu2/Q1MT3JPjlax4O8tHFG/zrCKwe31K8Hq7wE8Pdte1wDaNWxtNSMzG
         kNlOq9Ob75F4vVuBQjkZ8ElMEDKC3+VRb9R07v8TCodK01JvMvkiDVnkYC5PsjKyVea2
         vf3sj7JgAq+NnCSIaHVRP86YG49MhzSlOy+/tQNzE9mWK91Vm6u1Xg3zgdLsTHHEZNr6
         MpWw==
X-Forwarded-Encrypted: i=1; AJvYcCXUzJJJmkTn2kAubu/OazC1v2ByAwikmBUWZF8esQcZjmm4otFVrf+3lgkVvRXl6jtRP/SSpV5B8yw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwTz6lTrqsu/7Ct6W2ZHhsBBc3L75X3TBu8z8FgJB4v/6c+/n2
	7Gjr5MkSHAVN8A4vgRiU97MqtZ8RgNYmdq0lojynkpt5l+J7XJ71WtesLKcRag==
X-Gm-Gg: ASbGncuOT67Ooy8xU13pwLIqDQYHcPL1YWgSvYynduk/7ExIaay70uyLOsN0pd3FjYT
	7qfGvxVA0yV5dAdfX2Z5k2NQY+uOhpudlr6At3xOML3EfH2I7wnGMAcJ1mR8M8d/WTHwNDUKChk
	vMSIshJzd13Mgg/lkB8TNZPOKOCKvaOOYK/774ffaGFbMI18SB1HhCdZOSuZp3/er+mHk2CEj+8
	8PQDjisj2SSHyG6LWRGCOWOLVRjCV0ubtT7IP67g7RdypoqzhP9lJ7wQheFiryv+YgKortFm2IU
	VDICx+kdIMJyVCicvAuvULvyRUIeybsDTLxSVqjXdQ==
X-Google-Smtp-Source: AGHT+IE3cVCZYJw5RP+SUQZl1V6FJus3GXx3LC7njx+bKToBK8dFlvJ0YsX6BXBg5D4OaoaZwP5SeA==
X-Received: by 2002:a05:6000:400b:b0:386:4a24:1914 with SMTP id ffacd0b85a97d-3888e0b8acemr13099063f8f.37.1734435283067;
        Tue, 17 Dec 2024 03:34:43 -0800 (PST)
Message-ID: <11d51fc8-d286-44cf-bbbf-f7a592785430@suse.com>
Date: Tue, 17 Dec 2024 12:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217111247.2204-1-jgross@suse.com>
 <20241217111247.2204-4-jgross@suse.com>
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
In-Reply-To: <20241217111247.2204-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 12:12, Juergen Gross wrote:
> Add a new domctl sub-function to get data of a domain having changed
> state (this is needed by Xenstore).
> 
> The returned state just contains the domid, the domain unique id,
> and some flags (existing, shutdown, dying).
> 
> In order to enable Xenstore stubdom being built for multiple Xen
> versions, make this domctl stable.  For stable domctls the
> interface_version is always 0.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # non-XSM/Flask
albeit ...

> +int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
> +                     domid_t *domid)
> +{
> +    unsigned int dom;
> +    int rc = -ENOENT;
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
> +    spin_lock(&dom_state_changed_lock);
> +
> +    if ( dom_state_changed )
> +    {
> +        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
> +        if ( dom < DOMID_FIRST_RESERVED )
> +        {
> +            __clear_bit(dom, dom_state_changed);
> +
> +            *domid = dom;
> +
> +            d = rcu_lock_domain_by_id(dom);
> +
> +            if ( d )
> +            {
> +                set_domain_state_info(info, d);
> +
> +                rcu_unlock_domain(d);
> +            }
> +            else
> +            {
> +                info->state = 0;
> +                info->unique_id = 0;
> +            }

... memset() may be prudent to use on the "else" path, to avoid this becoming
a pitfall if/when one of the padding fields have some meaning assigned.

Jan

