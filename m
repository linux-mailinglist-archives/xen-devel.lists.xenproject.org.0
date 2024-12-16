Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0CE9F2E4F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 11:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857703.1269919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8XV-0000iC-Hg; Mon, 16 Dec 2024 10:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857703.1269919; Mon, 16 Dec 2024 10:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8XV-0000gj-En; Mon, 16 Dec 2024 10:41:25 +0000
Received: by outflank-mailman (input) for mailman id 857703;
 Mon, 16 Dec 2024 10:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN8XU-0000gN-PO
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 10:41:24 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b8969a1-bb9a-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 11:41:24 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso27679565e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 02:41:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436360154c7sm80505735e9.1.2024.12.16.02.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 02:41:23 -0800 (PST)
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
X-Inumbo-ID: 4b8969a1-bb9a-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734345683; x=1734950483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U472/Npzn+Rc8KBcwENfcdFf4Nfo53RnxwaAKI9LbU8=;
        b=WCWj9amvLdMA47cjPR95ozmLg16WcUDCtnmPuZGPhGwUUtew6zGBOwfDh17CmrC2s9
         AYnI1LFUko6DhfUzL5EbGLlEYz9gk1AdumF9CyDMlJ3eCnuNlq2EFNsRYN7KgxYWz9NM
         KkXOyA7UrTftaxGJ7b81ifx2bvidsjGQBsOIKpdcOCB4aRkpOXceo0M/D/7+Plyqs7a7
         rBx2wzW/Hbsp7ac7JJhY6ZgBLJIDgKldw78K9vX+R4Ibs3KdwZnOHXFHGEQGJLCWiQMH
         pWhGbGcmVTYmpiIyEqhMCbfnGPP8sZSCvI/o/rS9htJxEbApj1/BYZ1DPRgD6rli9cCS
         M6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734345683; x=1734950483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U472/Npzn+Rc8KBcwENfcdFf4Nfo53RnxwaAKI9LbU8=;
        b=kfMda5pA7B5w3hBjPU3WZE+EJ3ocTk5+ni5nw7whMQRFyipzTKUqf+Q5IsdkQ8HCBv
         qQoKpbEHdY5hIk4IaVhi4RhB0oG2+HEZTAY5XjUWL0Y+fP86y4HAvC7VwBcs2XsiWuWi
         DA4C6ZgTAZ70RoLazNOtuY9mWhlqRMeCXM5Nm1iZdNk9xB9ObceJPjQssoMOYOBQpgnj
         FQJPgYon6B/eynvWEdeoctwDTlRSALexAi/7AcUR1jKmEgUrYjkEaIM8/atUGG4pPXdB
         ojs3CXOJ3csNN8RNFBKmJfOv2dzezv9WTfx355IojwFjvpzmBc0USCSZpQ2ydKvBFINr
         lQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCVgVfPz7lN+0xpei4bVuOwfP8tFfDjW8AnfjpG3daKgktCOkhHxIzjk5OvheVnz77KYqrqL8AetRn4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmARIVHv0prmlqpz4sY6Cn/ZxInNaivRnPgp8nJEy+RF++w/YE
	0hzxWSwOFAg5qsrrP+2W1o2IOqVe9XaeBrZ4rR3kuiEkvxBhewtjrF0v0DJjBg==
X-Gm-Gg: ASbGncsFKgL6M2V4YfLvmtzSXdYrBj2eSOI79UoVltvtcXKTH7LogsScdLTHBsp/7We
	9jc2phjL1sMHTCB+eVZ2OF7Uepdxnta53/KiyPlHiPmE7jvMi/91ZUZYcH3LNBjLUY6x/i+hegY
	qNUByOLWA5WXyFuGmcDkhVQv4taPbci9fZy4vM2mSP9Ql4zlYZkfjrSmZ4JuNjdntE2c77N1Sbd
	UaEDC851hEwLj51rpZwzal7KLIa6/UtYswxaV12FBXqjWM+mp/tCwQEtUL/xI/i4eEdLhgw4zeZ
	QylpOsyr8hGCA8AD/005I2FcL9ejiJKDlXsNF2gqLQ==
X-Google-Smtp-Source: AGHT+IH8GlOnrPLZYbXM5JU1fntsaCPcyTL3jUF4/R+hjyeUPoWTONv/YYBXb9eX95sks1ySRhfN9g==
X-Received: by 2002:a05:600c:468b:b0:434:f871:1b96 with SMTP id 5b1f17b1804b1-4362aab4cb4mr101242055e9.29.1734345683429;
        Mon, 16 Dec 2024 02:41:23 -0800 (PST)
Message-ID: <f5371446-98e5-42ff-aa8d-0a7252e89f1f@suse.com>
Date: Mon, 16 Dec 2024 11:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-6-jgross@suse.com>
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
In-Reply-To: <20241213162421.16782-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2024 17:24, Juergen Gross wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -193,6 +193,57 @@ static void domain_changed_state(const struct domain *d)
>      spin_unlock(&dom_state_changed_lock);
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
> +    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <
> +            DOMID_FIRST_RESERVED )
> +    {
> +        if ( test_and_clear_bit(dom, dom_state_changed) )

For these two accesses to dom_state_changed don't you need to hold the
lock patch 4 introduces? Also didn't you say you'd constrain the new
sub-op to the sole domain having VIRQ_DOM_EXEC bound (which, ftaod,
isn't enough to eliminate the race)?

> +        {
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

Oh, on the implicit "else" is where the original memset() would come into
play: You want to make sure at least ->state, but perhaps also ->unique_id
are cleared (rather than demanding the caller to clear them ahead of making
the call).

Jan

