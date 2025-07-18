Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF5B0A08A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048392.1418620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciEV-0007Bv-UT; Fri, 18 Jul 2025 10:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048392.1418620; Fri, 18 Jul 2025 10:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciEV-0007AT-Rg; Fri, 18 Jul 2025 10:22:27 +0000
Received: by outflank-mailman (input) for mailman id 1048392;
 Fri, 18 Jul 2025 10:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uciEV-0007AN-0S
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:22:27 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19af7699-63c1-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 12:22:26 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso4054535e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 03:22:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d39cfsm10402055ad.175.2025.07.18.03.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 03:22:24 -0700 (PDT)
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
X-Inumbo-ID: 19af7699-63c1-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752834145; x=1753438945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mnMIaXmnz6jgrJN92ntP221+XOKD1yOfvhQexTq2qJE=;
        b=ZwngKSVx9duh3E5O0KW6Nt1oJhXMYbcMNeVZXCI025HH8Aeawk2e4Om/tacCwlVSCQ
         jJBohMCt0PnelYYpKX1o1RzX5NRkJfg/oRIGh/9Jh1oTIvy9RW3Qky/6lLI2h++ri7fa
         zjjqwPkzoZeg1DKx1JugFSAZm57M7YBl50Jq6q/fFMFXK4pmyjfxh5v3hWWYGVYXMKsB
         Hu6cG2Dof8+BVUlicbIjWfdRrpcH0R3yQh7iL7WtNLY5xFt+S4CxGzMs6iFlJMT5h9hq
         F4QKQEeK7eipYVf5NSgk07aPGlxff9Pxfxz9YInj2if9i2oNTPTjFu23uuNvzCeMcpon
         GNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834145; x=1753438945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnMIaXmnz6jgrJN92ntP221+XOKD1yOfvhQexTq2qJE=;
        b=Bh4qA4fC2+VXRNwUbm8qqLJPVt5TiglQmDAkLReZLxLTYzLzmENS2YS4XiThvhDTfe
         Jz1cPQQMIwQCb7AmrC9SnYxbI3XUTVBxDEcE1ORKaQUwyosoB8fTzxA93KqlY4dSXoTL
         Q+umj7BNQt9lTt3l57VK43DZHfUfC/vwPaA+fGfPrtRilBVPIscs8ueXsOc+mYpwnMZY
         C3NjvFZdfN2SNLiELelernoFeZCnC3sO9485gGKh6cJYhBTFY0/a6tfQHpOgNqNHAOoM
         USGpquYc5EUXws2yHIetH3aN6WPP+bEnGrOF+dZg+hUEdkuYRUEeTJOdBjOv/z2/cMmF
         JYVg==
X-Forwarded-Encrypted: i=1; AJvYcCWaMMzFndXNPzQH92BhKnMitdijXh7jPraxPw4t/3V4CA2ZJi3v0Ng2cXmm9Q70pEt1SrJ2al8I/FE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpUX3rhea5ujBIrzZ4W3O8cDA4ugP6vFkckVomH6mCwZXE5HOR
	UJP0ydxkzgwIxRhT0X9aQoSOgXDkQkILXRx5gmabulD5QkBRivQwHNSTfxm9pS43Xw==
X-Gm-Gg: ASbGncsxXlqtANYpWZg+rrgzENRSCz33dzqfWzGRiR02otq36Oz+rSB4syYptv+lOmw
	boKm+J77zbQIpTIIoNQAvQDyw6QhobvyCkNYKS5HCfH1/V7jNyrBgvIZ25WH2fQ35q46Masnlo2
	zVDfQVmOwMUOIKc8YCFvJCGO0Dh22IVnXlKPSc4WdqaJ9TQOzAey8rL0P6P+yD+JMV/IzW9CDJm
	vEk+XMzQGpVjDD2sQMyD8kslOpqv+h82b8x+S2GNmZ3H2B0NGJdRsszkLs5SCjYtnc83rnigunq
	Fzkum5aNg1X2TiXPyOJw0ztDow7nyrG8cuKGUhK2j1ogOF4kovRyK6tsmkMW6fBNE6UrJx1R81v
	TpOkDsEC9R8zJehdFoeAn3FnHxEytrNFWZtds4Guf856y4FhAnGb8zzPLEL8rxkaR/bRyCPRaYy
	3XpAsvqo0=
X-Google-Smtp-Source: AGHT+IEZzffEbDAA0SRZLTkW6AztsR6Inl9vypwIqLYNsDVDRrfWo/XmKjyR5bQf7y1wkMTr33W4Mw==
X-Received: by 2002:a5d:5888:0:b0:3a6:f2a7:d0bb with SMTP id ffacd0b85a97d-3b60dd4aaa8mr10555286f8f.12.1752834145269;
        Fri, 18 Jul 2025 03:22:25 -0700 (PDT)
Message-ID: <fd215aae-fd68-4ea6-bc67-33e908ef6c7c@suse.com>
Date: Fri, 18 Jul 2025 12:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/2] xen/arm: irq: drop unreachable pirq callbacks
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <20250718101149.3107110-2-grygorii_strashko@epam.com>
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
In-Reply-To: <20250718101149.3107110-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 12:11, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Hence all common PIRQ code is under CONFIG_HAS_PIRQ idefs corresponding Arm
> arch callbacks become unreachable, so drop them.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  xen/arch/arm/irq.c | 29 -----------------------------
>  1 file changed, 29 deletions(-)

Can this really be a separate change? That is, aren't we going to have transient
Misra violations (for Arm only) between the two changes?

Jan

> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -595,35 +595,6 @@ unlock:
>      return ret;
>  }
>  
> -/*
> - * pirq event channels. We don't use these on ARM, instead we use the
> - * features of the GIC to inject virtualised normal interrupts.
> - */
> -struct pirq *alloc_pirq_struct(struct domain *d)
> -{
> -    return NULL;
> -}
> -
> -/*
> - * These are all unreachable given an alloc_pirq_struct
> - * which returns NULL, all callers try to lookup struct pirq first
> - * which will fail.
> - */
> -int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
> -{
> -    BUG();
> -}
> -
> -void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
> -{
> -    BUG();
> -}
> -
> -void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
> -{
> -    BUG();
> -}
> -
>  static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>  {
>      return (curr == IRQ_TYPE_INVALID || curr == new );


