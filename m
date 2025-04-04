Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D4A7B84C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937862.1338742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bdj-00067F-Nr; Fri, 04 Apr 2025 07:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937862.1338742; Fri, 04 Apr 2025 07:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bdj-00063g-K7; Fri, 04 Apr 2025 07:38:59 +0000
Received: by outflank-mailman (input) for mailman id 937862;
 Fri, 04 Apr 2025 07:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0bdh-0005G0-QC
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:38:57 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd27a85-1127-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 09:38:57 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso1026870f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:38:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d66csm3786424f8f.63.2025.04.04.00.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:38:56 -0700 (PDT)
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
X-Inumbo-ID: ddd27a85-1127-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743752337; x=1744357137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oo9ujPT8cWaLK0iTE7kB3Uob2+wwFuIxbDC/g+i7TnA=;
        b=Z3PO6t0ghdL5O3shzzhbEiI+K7c3fu9NGs56vwVraaMGDjU37YsTPed0X2WyQ4lUlI
         ffRnptrPzoClluup/gRFcpl/93JOHzSt7EBAtAcj5Yv88RICC4yUwmRDvvzWGdPoZSJq
         1QDdt2xhRDnrgDziBAyAbilTSYuGqCITqSGXgPVTINvK2xL2kSzGPczJhBIvYLJGbtWM
         VtpUDe1vcvEpjqXyXtPurRwfsotrP126uX4FgYS1kpWfQ3HZFo2mngPr5mYNApAMHc0t
         DHMYngb/NKuoMR0pgXLpJ27KpGFbsNEUy/NJs21di17WL9kgoiZbWWNCBG0F39dkFXgi
         QClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752337; x=1744357137;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo9ujPT8cWaLK0iTE7kB3Uob2+wwFuIxbDC/g+i7TnA=;
        b=S86cXie9IGOgFr8UV5Yeh+ZM8wVMmOEWlYjEUbITt1tTQRumbySBVtmjqfAJ2AfL9b
         U78SSp6XscebYMws0O1dg9TmXjNmkgIbTp/WqG5n51LFjw7Cp6m2P/aiga/6tcU9QmTf
         H1ZaUXLdkxLTH5jpCbJfL5ndUM/ChypvznAHsFHfPMXJQRUaUWyLn6sllc+Tq2OdqCiI
         ItKUX6l/kexJO8RC4Te1bJDyFKWJAIyuMIPhPx7TWsJWFrPAKcir6xOncKn6WNy5Pz2H
         WWT0nRuiobghN3Y6WpYIGaIrufw/C0F1jl/XHOVuvZqLJdT20rfDnabChlPTvJuGSqF3
         aNOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6ZKOqxKl74N7mtBxLmdj2JEjORUVL9c18eylP7q5Dg3/uUZOadt4ksuv4KahZ6mEgTOj/9i4dKwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIrtycHVT9xKp0TTCjnGssSDyBGV7XHuMl8No4UQy+MQiM755s
	4g51P5GVQrQIHMGibAF4HvvRhGd4V9QrGOXGO6JdhbqWEiiDmL1HaVtqHMpIZQ==
X-Gm-Gg: ASbGncth+LYQuDaBKB+4N0DHJ0u/aygIN3LvkuS748qcOvVYNJXD4CVp/6BV/pgq4gf
	nwMWoLxDCflwW8VCm23TpsS2xqiRmA6nWyHA3/2Mhz0DuyT5pjkCl2aKCLFzl87Wl1bvbUidC+h
	Bd2m7M2xML3FmlAtYv7YFq2v8OidzsEv8j4C0RJM1bJqy+p9XDl+PB4qy4aw4XAJcovzlQEtswx
	NQf2knO4UVqJia2odL6T08FSSKi+sDOYorCcKi0o/N6lQtg9AQki/9Xsw4AGDHhsCz7tTONDIov
	Pxa4FnvqAqBwp3RJEIG1Tz3PnUiEFoH/0vj5UHLBJj7qH3IkIO18VHnjaDhkNObnLkLb2lsVlkM
	1H0F5SP9xJ8ObEGFcp35ox1aBU2v67A==
X-Google-Smtp-Source: AGHT+IGCJsD0bE/34tcgPCUiuXRkRgDUdrYOYhWoyhsgpYiwuWgLT36gtgCoA33ioJcmj7JWD9RdHg==
X-Received: by 2002:a05:6000:2a06:b0:39c:1257:c96d with SMTP id ffacd0b85a97d-39cba9442bdmr917210f8f.57.1743752336757;
        Fri, 04 Apr 2025 00:38:56 -0700 (PDT)
Message-ID: <332e0afc-9c43-4602-9bc0-dfe4ddd1b107@suse.com>
Date: Fri, 4 Apr 2025 09:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] xen: introduce hardware domain create flag
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250403214608.152954-1-jason.andryuk@amd.com>
 <20250403214608.152954-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250403214608.152954-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 23:46, Jason Andryuk wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Add and use a new internal create domain flag to specify the hardware
> domain.  This removes the hardcoding of domid 0 as the hardware domain.
> 
> This allows more flexibility with domain creation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3:
> Or-in CDF_hardware for late hwdom case

Except that ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -820,13 +820,18 @@ struct domain *domain_create(domid_t domid,
>      d->is_privileged = flags & CDF_privileged;
>  
>      /* Sort out our idea of is_hardware_domain(). */
> -    if ( domid == 0 || domid == hardware_domid )
> +    if ( (flags & CDF_hardware) || domid == hardware_domid )
>      {
>          if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>              panic("The value of hardware_dom must be a valid domain ID\n");
>  
> +        /* late_hwdom is only allowed for dom0. */
> +        if ( hardware_domain && hardware_domain->domain_id )
> +            return ERR_PTR(-EINVAL);
> +
>          old_hwdom = hardware_domain;
>          hardware_domain = d;
> +        flags |= CDF_hardware;
>      }

... this isn't quite enough. You're only modifying what will go out of scope
when returning from the function. What's at least equally important to OR into
is d->cdf.

Jan

