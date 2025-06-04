Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C333ACDE5B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 14:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005532.1384984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMner-0003cR-2J; Wed, 04 Jun 2025 12:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005532.1384984; Wed, 04 Jun 2025 12:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMneq-0003aY-VB; Wed, 04 Jun 2025 12:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1005532;
 Wed, 04 Jun 2025 12:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMnep-0003aQ-DL
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 12:55:51 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dbb0ee3-4143-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 14:55:50 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a375888297so631167f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 05:55:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affd437asm11070294b3a.150.2025.06.04.05.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 05:55:49 -0700 (PDT)
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
X-Inumbo-ID: 3dbb0ee3-4143-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749041750; x=1749646550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SwEsN8riVOQhHVvIwBUlpvCCfcOS2+JYdhTkiCBfZiA=;
        b=ZYkb+Fw4zh5Xk1miz5RoWJo0pQPWvnIApYInbbhMOtOnsDcgslS8oPvlqZbSp+PHB0
         f3iW80QJg3ddfDEdnBKcJN208D6PR6LI4FjD+4MdzFdPx/03VVk8zX1lH2ba8PeMdkQx
         hcTSuQodi9b2rGzSolIMsvmy1XhqPBrn+HBH0mFq1rngo4A2ie4NzqN5L3nCpO1ZfxyV
         o0fTgqW+lpZnrhhDyo9hes6Ap5AtuwEDzoOzuRAirg2Ctw73hL1sKCrYuyOI1Ksm5lSA
         /Auv5XbtPSTXCUVNREldRiEfDHHyJMGfzDX583vZxgKVJweOlIdZ/LWlbcuh+P/yXQAq
         24Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041750; x=1749646550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwEsN8riVOQhHVvIwBUlpvCCfcOS2+JYdhTkiCBfZiA=;
        b=YRxuQZaJ3jhlDETovTEv2uXzXKV+yp0UOKPX1toWAIRCAaeqwGpPTJTDaf07BrriRb
         DNNicS1z02fqReaZjRnYgxt6Mk0yF7U2Gpfk513KZE5bfNIVixVCQIyObEOwa9OFG4V1
         nY0Ez4iktK8DXZ+nYBG+J12tEBez45+rw2nNSR/yK06WfYSfpEVuYmtIaCEsJf9OlMT+
         NUxCO3aSpOlmXSssczOi11znUcr1GofpICQwU7udg2zPLDCDtqzc53goiRyl3AyJsh5r
         3NOLALTbIkX1Hb5vffCD656xu3WNa/ik1oo884WVoBu3YNITKTan2mq86bXnRnhtq7mf
         vjOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjq9XunYo9P7J5Sdeq9SvxWO3ydwswWhK9gMviUsl82rffS59sxGs5VFfn+HKTlXeCofkDCybKS4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyK+t5G0R2TmmS2Wm7gnaDEcM7GuK0OhdkKr+JJWfNVOS+e5F6N
	ircFSNhx64IkfRym0bpLHjFQ1jltlC2xf/yo/hA80+bTVE2m+sZO9anSwanpW+n7rw==
X-Gm-Gg: ASbGncvrAG579JBEcwjp7b7SAW6PnVV4lY73V8DEfO7n+mh6FOPgHDE7wJB8fk2Jfn7
	NAjuCRLJMpcMDKIgNKadosSFWbO2xr9DtDatn2mOFjFqV0zkPeeiw8cFAbrxRf0cb4nwgzicpHm
	cZBHiKztQrosjSzu/ZIwA09uMXXGgYQ1DnCjY8Y030G9vyNPebfilombGTPl7+jdbvXCAOlShXL
	+F58WdBqFaoGbrXNSEQjFlBVloLBiazrk9r5Vu9RuGC1rWyPOYAU3oJHS/LwWvnfKh3LeoTITg2
	cMryxs9eE2pqiwpImXaopDe5TQryY+zl4KtV6Y05xwdxDhyYv4v57O/76rRcFToxJ3fzkmyQj8k
	U+sCmYAYmFx7gQDEsjbM4B4XEj1lRbNsmo/Xr06aw+bW0uew=
X-Google-Smtp-Source: AGHT+IEmSbwcKsgPKaH72eDwzO6/RXZClFff1QaiWghVzUznvO2srghKd3ULdRoN/TxlwKNXH2m6dg==
X-Received: by 2002:a5d:5847:0:b0:3a4:ed9a:7016 with SMTP id ffacd0b85a97d-3a5141cfce3mr5426662f8f.26.1749041749761;
        Wed, 04 Jun 2025 05:55:49 -0700 (PDT)
Message-ID: <efbd8839-7556-498e-963b-8a04c1ec42bf@suse.com>
Date: Wed, 4 Jun 2025 14:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] xen/console: remove max_init_domid dependency
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250530231841.73386-1-dmukhin@ford.com>
 <20250530231841.73386-4-dmukhin@ford.com>
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
In-Reply-To: <20250530231841.73386-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2025 01:19, dmkhn@proton.me wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2461,6 +2461,39 @@ void domid_free(domid_t domid)
>      spin_unlock(&domid_lock);
>  }
>  
> +/*
> + * Find the ID of the next possible console owner domain.
> + *
> + * @return Domain ID: DOMID_XEN or non-system domain IDs within
> + * the range of [0..DOMID_FIRST_RESERVED-1].
> + */
> +domid_t domid_find_with_input_allowed(domid_t hint)
> +{
> +    domid_t domid = DOMID_XEN;
> +
> +    if ( hint < DOMID_FIRST_RESERVED )
> +    {
> +        struct domain *d;
> +
> +        rcu_read_lock(&domlist_read_lock);
> +
> +        for ( d = domid_to_domain(hint);

If the domain with ID "hint" went away, what is being switched to changes
compared to behavior prior to this patch, if I'm not mistaken. While this
_may_ be acceptable, not saying so in the description is imo a no-go.

> +              d && get_domain(d) && d->domain_id < DOMID_FIRST_RESERVED;

What's the DOMID_FIRST_RESERVED check for? And where's the put_domain()
for the get_domain() here?

> +              d = rcu_dereference(d->next_in_list) )
> +        {
> +            if ( d->console.input_allowed )
> +            {
> +                domid = d->domain_id;
> +                break;
> +            }
> +        }
> +
> +        rcu_read_unlock(&domlist_read_lock);
> +    }
> +
> +    return domid;
> +}

My concern remains: With many domains, the loop here may take quite a few
iterations. That's even more concerning because it regresses right away in
environments where along with boot-time created domains (eligible for
console focus) later further domains are created (non of which are eligible
for console focus). That is, the step from last boot-time created back to
DOMID_XEN may now take excessively long.

Jan

