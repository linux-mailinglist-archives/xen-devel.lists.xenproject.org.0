Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DB92764A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 14:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753816.1162104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPLsY-0007Fl-UH; Thu, 04 Jul 2024 12:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753816.1162104; Thu, 04 Jul 2024 12:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPLsY-0007DM-RZ; Thu, 04 Jul 2024 12:48:02 +0000
Received: by outflank-mailman (input) for mailman id 753816;
 Thu, 04 Jul 2024 12:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sPLsX-0007Bs-Hp
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 12:48:01 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a47e67a5-3a03-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 14:47:59 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so7057941fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 05:47:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1596728sm121860785ad.256.2024.07.04.05.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 05:47:57 -0700 (PDT)
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
X-Inumbo-ID: a47e67a5-3a03-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720097278; x=1720702078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9dEQaZiYtNk0ubS+AwZLZmSSSs6O6DyhdQE8fyruKF4=;
        b=XVz4CCDHbVF/9GBpU/KBkX/XCQZqpQFJoToBGBqQxth+kfE8F3U33v5ilkZ7Oy4AVY
         ugByfvk4JT1pNND2rj/FxBnwCuhf1fr1r1Dv1R9svpP2a7J1l5HghAAS8fJM+PXEVyKX
         liufVwGZIWp3d7fUgiqwDmbiOeYJiVEYSX7AhVIEDQdsKgA05zEAXBT2D+wEy8Jq0Z0d
         My026JDTr2VrlUbuQp3AL3fx3bkKmi4fyuIJN0axLluUraK8WZlcKrqfEoXYiahSKGJ/
         kYH0GfdKdBlLjQ0eX6i+z3rvcTXV905e5jhPl3bgp4nPb9XEVBhNGzQy1kosWAQyl3pp
         vVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720097278; x=1720702078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dEQaZiYtNk0ubS+AwZLZmSSSs6O6DyhdQE8fyruKF4=;
        b=AR0COZw2Yp950MiKnQgwOblDl+E8p23eefWDLK+C0ywUVB5XvUvGnIv+5AMk2+2nSk
         oj535R8JIr4K6bOM9tzAPPltf2d7jrHZR6y/JCer5y/pMUh5trrtlL3H7jGjVL9gmIHv
         bS0UU3p0TVtnmFcPHHIYGqK7vJZJLDBrygXfzmmgwcXOCLA+mdn7ShQTGtzxq3GZi0Lp
         qwIr3aGny++u72T1VAwgCMncUIZbCRZbNCMdH7zdzzenpamLH7VgH53Jt+XLGVXP/K4k
         buFo1icCcGSyudF6tSltkjfDdkLkDeI3YGNuKkBTbN1EX63L1rHV0soNQgJLjcYODD3H
         4JBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5HAbE3LoKoDHEr+PCzyoGfyIvnNGhbiHBJ4/ItEDgOI+lnXdOEyINNbJ0GwAuRrKz+Vf+I6fdzoGh1xUFQRWORCl1l438hyPwRRm6vfU=
X-Gm-Message-State: AOJu0YwBzth/RljFDe6XyKPGWW+CzgPCw704o1khm/YawB675YnH/Rjx
	BhWaoNLla5mK1lTDTbs4CoFCG/513oE7aeOhapWs7UrYcjX3YvKluFKXohDvQw==
X-Google-Smtp-Source: AGHT+IGDA9WDWCoRnD5fdp3D9l5yVw88+GiCjvhH9hiErwE7+uxgh2hIeR3lwVsnAeMlrccbNcivHQ==
X-Received: by 2002:a05:651c:2226:b0:2ec:5061:d7d2 with SMTP id 38308e7fff4ca-2ee8ed5ee10mr13724611fa.18.1720097277486;
        Thu, 04 Jul 2024 05:47:57 -0700 (PDT)
Message-ID: <9dc7f974-de7b-408a-915c-ee0724eaebcd@suse.com>
Date: Thu, 4 Jul 2024 14:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 4/8] x86/physdev: Return pirq that irq was already
 mapped to
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-5-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240630123344.20623-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2024 14:33, Jiqian Chen wrote:
> allocate_pirq is to allocate a pirq for a irq, and it supports to
> allocate a free pirq(pirq parameter is <0) or a specific pirq (pirq
> parameter is > 0).
> 
> For current code, it has four usecases.
> 
> First, pirq>0 and current_pirq>0, (current_pirq means if irq already
> has a mapped pirq), if pirq==current_pirq means the irq already has
> mapped to the pirq expected by the caller, it successes, if
> pirq!=current_pirq means the pirq expected by the caller has been
> mapped into other irq, it fails.
> 
> Second, pirq>0 and current_pirq<0, it means pirq expected by the
> caller has not been allocated to any irqs, so it can be allocated to
> caller, it successes.
> 
> Third, pirq<0 and current_pirq<0, it means caller want to allocate a
> free pirq for irq and irq has no mapped pirq, it successes.
> 
> Fourth, pirq<0 and current_pirq>0, it means caller want to allocate
> a free pirq for irq but irq has a mapped pirq, then it returns the
> negative pirq, so it fails.
> 
> The problem is in Fourth, since the irq has a mapped pirq(current_pirq),
> and the caller doesn't want to allocate a specified pirq to the irq, so
> the current_pirq should be returned directly in this case, indicating
> that the allocation is successful. That can help caller to success when
> caller just want to allocate a free pirq but doesn't know if the irq
> already has a mapped pirq or not.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

I think the change is correct, and actually fixes a regression. You want

Fixes: 0762e2502f1f ("x86/physdev: factor out the code to allocate and map a pirq")

which would also have helped reviewing quite a bit. And it likely would
also have helped you write a description which is easier to follow.
Enumerating all the cases isn't really needed here; what is needed is
an explanation of what went wrong in that re-factoring.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2897,6 +2897,8 @@ static int allocate_pirq(struct domain *d, int index, int pirq, int irq,
>                      d->domain_id, index, pirq, current_pirq);
>              if ( current_pirq < 0 )
>                  return -EBUSY;
> +            else
> +                return current_pirq;

Please can this be simply

            pirq = current_pirq;

without any "else", and then taking the normal return path. That again is
(imo) closer to what was there before.

I would further suggest that you split this fix out of this series and
re-submit soon with a for-4.19 tag and with Oleksii Cc-ed, so that this
can be considered for inclusion in 4.19.

Jan

