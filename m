Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651499E9C88
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 18:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851752.1265775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKhBz-0007KE-Gf; Mon, 09 Dec 2024 17:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851752.1265775; Mon, 09 Dec 2024 17:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKhBz-0007HO-Dq; Mon, 09 Dec 2024 17:05:07 +0000
Received: by outflank-mailman (input) for mailman id 851752;
 Mon, 09 Dec 2024 17:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKhBx-0007HI-Gv
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 17:05:05 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb6493cd-b64f-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 18:05:03 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so2651755f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 09:05:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725def37e0asm3471489b3a.193.2024.12.09.09.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 09:05:02 -0800 (PST)
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
X-Inumbo-ID: bb6493cd-b64f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733763903; x=1734368703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8LM3m97fjq/BYaQF/gCO8ywrIRLHoxQl16S/jMd6ovw=;
        b=YYg29ONm/7F5kLNa5gnpEE+01PEEKbAhCr0r8/yBSQ5c1Edon6fG01e+mHhwFxhjxb
         PRgvHWrZOpKQu83jlbVhQGrEQt2Ret4ipLQ19d1EBYi+c8bkjoK6GMTYwAQmd5JWXDr2
         NFoKZ5jIeOHwdCGqAr2NDQvj94oOsnv9+ygBHkd1ejPlSsjZdwaNOKgd7FkIAzvGv+i9
         OnFHnIItdnqfLst+raDUo9I6P0MCXp69y6A5gIY0uP/SSkPDggFiiyCPsp9W3j4rTUtU
         fIcY5KyB+38tuLgcqrdMDyTVVMg6yzsZRAU5bzRXUP/agIaHtQAQ+w1YsIXftF159RK3
         V5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733763903; x=1734368703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LM3m97fjq/BYaQF/gCO8ywrIRLHoxQl16S/jMd6ovw=;
        b=Ps5Z7P01pOY0fCHdRISobih2PE4qhaJIiR+TbO/OUL3mGm0EJCbnrPVNKhpKdXUvlw
         mrDCOE9cBsnz3401cq1dMGNHScoevVTUca1ig34p3yBOz/nciFa+rchZehvRO/4MjY1x
         0uxMrtojcFwhK9z6kJ8a85p/d9sGpb7YmUiEDlWjlLrU2chHUxSbhfWNddQMyNd0KjpB
         TcSmkDsXqQAeFWHY7mJBwuEUOTUu+h4AoEYD5qF51WbGk8EaLYVz7rE4Kw4XTzftEty+
         xym4J01jJfxZuUNi2YOEL0ILc66Hf5iJpULlHma0AoOYidmDJENtDDH0KYY6ZsoGgI+E
         zJsw==
X-Forwarded-Encrypted: i=1; AJvYcCVTH+jWm3R4UKx/YYTQFgZbJxFVKK0ThPOHLHJC6SLm64we23kEKRTSC6HW7mT+VzsVx57rcdYuCeo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgcK84zOuEuEPmtoUhQFO0X8vwj47ZFQVsnl+SN7ReXXWXAgwF
	7chOxF5o05d0h5uLt6KbByKlMqXix9OHR9i77YjtqSp3ErxRxeSfSAX/buARgw==
X-Gm-Gg: ASbGncs67ioewGuI4aq+omQ6dPrzo39ILSOeHa91BGj8of4b7inAKNWLLt8SzdSRbUl
	nulYmesBm23JrXJA/BDz2ujOnwuyWKuA9NZunaLcqWZmv7jG/2hLI5PQtkzr49qzsmCQsmtK6ms
	GvKdBPw3AOdfAXt3WHy1CI7b9DkdH86QNhifcrwUB/zYlzolZqHP9bV20RX6K+lnQu0ecqYtbBD
	5rMEVJ0EBV97Z3ouOn0iiGEzoyUFPHIo+xHSRKnpaH1B6jKVxKNMQNcIlW7Dplrfvv2TNztGQio
	1UGdT9VFiaiyndz6fmYPSMANz7A/IyPZKIQ=
X-Google-Smtp-Source: AGHT+IGfBZfW3V2PiNGe7YaQ+VIiVhVfv2hXadI13zK1NiSKBE3IjDg3se99dmTCBLxgIHh4Jupsiw==
X-Received: by 2002:a5d:64ab:0:b0:385:f271:a22c with SMTP id ffacd0b85a97d-3862b3f289emr10432682f8f.59.1733763902942;
        Mon, 09 Dec 2024 09:05:02 -0800 (PST)
Message-ID: <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
Date: Mon, 9 Dec 2024 18:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-6-jgross@suse.com>
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
In-Reply-To: <20241206130221.17773-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 14:02, Juergen Gross wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -192,6 +192,54 @@ static void domain_changed_state(const struct domain *d)
>      spin_unlock(&dom_state_changed_lock);
>  }
>  
> +static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
> +                                  const struct domain *d)
> +{
> +    info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
> +    if ( d->is_shut_down )
> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
> +    if ( d->is_dying == DOMDYING_dead )
> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;

The public constant saying "dying" isn't quite in line with the internal
constant saying "dead". It may well be that Xenstore only cares about the
"dead" state, but then it would better be nemaed this way also in the
public interface, I think.

> +    info->unique_id = d->unique_id;
> +}
> +
> +int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
> +                     domid_t *domid)
> +{
> +    unsigned int dom;
> +
> +    memset(info, 0, sizeof(*info));
> +
> +    if ( d )
> +    {
> +        set_domain_state_info(info, d);
> +
> +        return 0;
> +    }
> +
> +    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <

I can't spot any check that dom_state_changed was actually allocated. Also,
unlike the public header comments says, the new sub-op looks to be usable
by _anyone_ (eligible privilege-wise) as long as _someone_ did set up the
vIRQ. There looks to even be a race possible when a "wrong" caller tries to
call this at jut the "right" time.

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -278,6 +278,11 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
>      return ERR_PTR(ret);
>  }
>  
> +static bool is_stable_domctl(uint32_t cmd)
> +{
> +    return cmd == XEN_DOMCTL_get_domain_state;
> +}

Likely better as switch() from the very beginning.

> @@ -866,6 +873,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>                  __HYPERVISOR_domctl, "h", u_domctl);
>          break;
>  
> +    case XEN_DOMCTL_get_domain_state:
> +        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
> +        if ( ret )
> +            break;
> +
> +        copyback = 1;
> +        ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
> +        break;

Especially with this being a stable interface, surely the two padding fields
want checking to be zero on input (to possibly allow their future use for
something input-ish). Then even the memset() in the function may not really
be needed.

Jan

