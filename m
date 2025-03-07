Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A26A562C3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 09:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904705.1312546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTHO-0000u0-Qm; Fri, 07 Mar 2025 08:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904705.1312546; Fri, 07 Mar 2025 08:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTHO-0000s9-Nq; Fri, 07 Mar 2025 08:42:02 +0000
Received: by outflank-mailman (input) for mailman id 904705;
 Fri, 07 Mar 2025 08:42:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqTHN-0000s3-7l
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 08:42:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06971b9f-fb30-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 09:41:56 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43bc38bb6baso9181425e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 00:41:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd91338cesm62935545e9.7.2025.03.07.00.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 00:41:55 -0800 (PST)
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
X-Inumbo-ID: 06971b9f-fb30-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741336915; x=1741941715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3PXCmsE5+ZqD7GfMdkI9s/1ITxDw17hPdBYplkZdj8Q=;
        b=JQ/f+42d9BUxAaLTLGvl54GXy0P4T+ZEUWORECJ23QrQ7k7+LEspOYd7mHlAVkSyw9
         o+uFzjGNXUcmJrWkw9VZTuRz0MKduX6cOG2rAbO46D7OCoElQj4ZwSkgZBQyYWSi3iRm
         zXw9sIhaLEuPW8Ma81uaYO3UNxnBhgHI8qwdhhq0BNTwMFBV9nRkwcic44cYcQ1iQGns
         oB+BmJ2QI+gFlMgC+PVvWmPkh/y0NBxqYQ98PFNMuMaaBfOlcw6dkhgOgHkCD4PFEG/U
         aSV+WVAzChFIX8qyUpIxs4iBQHZwbyeljUjwZaF+PfAD41yG9ekXk/6M0FPRPQzjCq/o
         tZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336915; x=1741941715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PXCmsE5+ZqD7GfMdkI9s/1ITxDw17hPdBYplkZdj8Q=;
        b=k403zF8D4tEjjTjz8wdQI3AnIPq5hWOsCO60n+Eut2xr3qTY0rpy3Pirvxtki0r5CM
         qiQOL3Ppr2R6SoyDPRVmmgKYIbzNyTVNZYqIVuvB+yRXaonTogn4Hc0A+fnyCFloim1t
         ezA8/ppv6gf3XrOOEJj3PUWBmIJ+Ce0mQe1y/p2fcVm0RfpCEGsYsFs8ROuD/ii1/FNJ
         dZYV2omuz4VdrTWBnyBRexPijsssCJ1h6x2b0exkTJ5Dk3ezT8B8I+GNHWlUAwn0RIq/
         5YVdGjchb2zNWBtNKYkPfp/v2l78imN0WLcaVu2uTvBsWmzWTFwJTJAlm6xYI7qbn9BV
         GaPA==
X-Forwarded-Encrypted: i=1; AJvYcCW3nvWxuXgQKNxk9m8qUzv0T2HmAefX3ER88SyHtrH+yYuQ4U6yVUQBt1w9kj/P+Xa+ZlAVNLi/8q4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvfxmbtqSuuymBCks1pK4srFw426CbHq8I2Ljj4TG/dQ3Di2bK
	KEJRkM/8vr1II7dvuHYj8iL6GQXtthfTZmiRl4X0BAT/ZZW5mX9YJqie3AptPA==
X-Gm-Gg: ASbGncuz6y23CfSS2/am7EvS7isiMhU01+A2vZeh1pceWk7SU1A8WThtecLBHJ7GhC7
	DRIBy5dBgNDJdHkeveBf0Uv/9akrh6uo7S45h50dJoZwJOxetXzyyuJfCwLP0ND38VsD5KRx8F9
	z+vebETKkilWAngnonrU0kZM8cRi7D3BIpd0DvBZ7cXMGRxX/qu6m9SSCzCriIGCgt/Aj3n/7uq
	8XPe7gG/wmkxs8EmaRDkO7gFTPGdwi9ePywjr7lcxSoi6S0LWyLzhA3PEEE2qbz/tCEkMUgR5eB
	Hw8fXcWXY0KYpq5/CQ17N6Y1hMSrbh/lkg9/V21lPQrSqGOE8qOc4nEQIdZYXf7/cflzLqbVqsU
	54jN8kJiyDEvqWEr9EpMglG7TJhEd9Q==
X-Google-Smtp-Source: AGHT+IGbZd891KWxN3oQ5QqWX3SXjHxvbptnJVdcnayJ9yEw/stvcftk3rNXLRXYwfrP4rX/6AHtqQ==
X-Received: by 2002:a05:6000:1789:b0:390:e521:463 with SMTP id ffacd0b85a97d-39132db206bmr1439628f8f.52.1741336915520;
        Fri, 07 Mar 2025 00:41:55 -0800 (PST)
Message-ID: <9d9bcc66-0031-4ec4-a335-23009cedd27b@suse.com>
Date: Fri, 7 Mar 2025 09:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: fix global virq handling
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250307070507.30102-1-jgross@suse.com>
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
In-Reply-To: <20250307070507.30102-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 08:05, Juergen Gross wrote:
> @@ -913,7 +917,7 @@ void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
>      struct domain *d;
>      struct evtchn *chn;
>  
> -    ASSERT(!virq_is_global(virq));
> +    ASSERT(get_virq_type(virq) == VIRQ_VCPU);
>  
>      read_lock_irqsave(&v->virq_lock, flags);

To better fit with this function's name, ...

> @@ -940,7 +944,7 @@ void send_guest_global_virq(struct domain *d, uint32_t virq)
>      struct vcpu *v;
>      struct evtchn *chn;
>  
> -    ASSERT(virq_is_global(virq));
> +    ASSERT(get_virq_type(virq) != VIRQ_VCPU);
>  
>      if ( unlikely(d == NULL) || unlikely(d->vcpu == NULL) )
>          return;

... I think this function wants renaming to send_guest_domain_virq(), to
further eliminate underlying confusion. Ideally right here, but certainly
also possible in a follow-on patch.

Everything else looks okay to me.

Jan

