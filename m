Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E918FD01F2F
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 10:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197477.1514997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmft-00005J-BO; Thu, 08 Jan 2026 09:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197477.1514997; Thu, 08 Jan 2026 09:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmft-0008UH-8P; Thu, 08 Jan 2026 09:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1197477;
 Thu, 08 Jan 2026 09:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdmfr-0008TV-Vt
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 09:51:23 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9673cecd-ec77-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 10:51:21 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso17185195e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 01:51:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d87018bbbsm37478445e9.1.2026.01.08.01.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:51:21 -0800 (PST)
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
X-Inumbo-ID: 9673cecd-ec77-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767865881; x=1768470681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aEyUHDBjJ769a3+Sae0aBoPq58a2gfDkOEbDVOQBYxU=;
        b=Cp13xJTY3twSVMdGqXtFLbD5deNMZzv42WpWaoXaGcsi4iazDzG29gkKKqNFp+t6Zd
         dD2Opk5aU1/i5+aZ9dAj5xxWwuaaRB7/n6K+bAam/d4gxasfo8J0tmmHtEpdcdm1xtut
         u1D8Tc8KhBbi0RlLl+M37Fx7Myo5mzvEQsajsrYGdUHe+z8dbUerfrrg5CulYvM3kmU9
         OAPdn01VrbBRwysSAXdFKJLXcIbyov7LD10TkeQMcuIov3qQQnimjtwJYhwrDGcisZu0
         BPf3uXRt7Ni913ByJ1lhLUkLA/JhIPKpSo9aynl+NPYwkg2+K+FD0F+Xpw6myLn/eIvr
         qwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865881; x=1768470681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEyUHDBjJ769a3+Sae0aBoPq58a2gfDkOEbDVOQBYxU=;
        b=oFwK9COqRIBvWlFYRhRuWW2avaeXwIhyWm03L4c6LIDqe6wmLpE25xMf8f1o8m4ou3
         0RlJX3K0edBq+DvEaN4jjloqlIz++c74POPsUPDggUYGlA3NHNeoH1lz8vy+l1GprPUL
         EID4QZpwSlz80fXXBFr6aW26y9kwB7rr3AmtzmXzzKrBA9asymkPXrDBAuJdnQCLUG90
         SjKrvOR+rm1Uy0H5O+oFrg0X2M5SLXzt0KFon7TOecerOOB9MjLjvd0Ftj+LLti6x0vQ
         tO27DM0pytByEs6fTvFXZytaaVjD0r0Fc846/1lv3f9A2JtemOU65fn2RdwXwTXnSlWI
         3pdA==
X-Forwarded-Encrypted: i=1; AJvYcCXPe9GIPKF4X7uqmf9Y3DhIg+20W/yzajzo+fKiUkiBkvZiErBMhdFlOlkV2WicI4QwoGN+3oJTjas=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXY3ky5CI40dKgT0FLRABt5xRM3toSuYX3ci+l1ZUEXfHk71qV
	h3EKsMY24/fSz7xj0hVBS6f6TqC0s0Nh/6mo2PZkElErqejI6GY+euIyIk37trMg9g==
X-Gm-Gg: AY/fxX5WFB9WvuU4UPBkHi9eC1PIkSYYdo8gl/WJrDGzkdqqs96zfN4ULqgpyCvqLej
	qJAYmvciI80DGgQ01jvHpqGSaddDVqug9cT9WxA010iSJKQ3cGSuK7BnkNoewCRa7nbQH9oflF7
	FFchPHNduPblEKRS8FhWCfsuzNz2aDkcVrb/hHhrPsNR9YJCQzJDbpfayE1ZwRXckh+5xruhEyE
	tiJ0BnLi9BYiGrfq8mRngEkmoD52cnz1jAsDeesRVdxvLe4wNoXIwWtHPD0q40gMjWXpcdB1PiE
	MjYhu1dQa929ArKhOAYx88Ibb7TPvk8Ifi+ljwj4DEFSRPvL3tyyXEa7371PSZxbsOeASo0f9PE
	R9U8+EwKVKQjCvPfqqCBIjWhFnaQp3kSntjeGVl2gwsSOCouuY/JKnJ/3VisbgWuYqP2wVzuqr/
	G+09yEdVhtxa1gaQknekJVlLKDVreHCOW0YrKQlz/g+fNIgKvP8gpQQPKerjetthGBurL+xwqhy
	WGK4RDJhTud1g==
X-Google-Smtp-Source: AGHT+IHm1VLPAgFv3OFFZvGUIcRYdSkEge78eyWO4EYUWNo+rD7CXgWYH/mDerZ2jOX3Iq6sDF4rnA==
X-Received: by 2002:a05:600c:3e8e:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-47d84b1820amr60012385e9.13.1767865881352;
        Thu, 08 Jan 2026 01:51:21 -0800 (PST)
Message-ID: <e6a4064e-d9fc-4862-98a6-86d78b471110@suse.com>
Date: Thu, 8 Jan 2026 10:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] x86/pci: Improve pci_mmcfg_{read,write} error
 handling
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1767804090.git.teddy.astie@vates.tech>
 <1042a6163ae71527987a853e3c746c8a6633c0ee.1767804090.git.teddy.astie@vates.tech>
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
In-Reply-To: <1042a6163ae71527987a853e3c746c8a6633c0ee.1767804090.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2026 17:54, Teddy Astie wrote:
> --- a/xen/arch/x86/x86_64/mmconfig_64.c
> +++ b/xen/arch/x86/x86_64/mmconfig_64.c
> @@ -60,15 +60,15 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
>  {
>      char __iomem *addr;
>  
> +    *value = -1;
> +
>      /* Why do we have this when nobody checks it. How about a BUG()!? -AK */

While it may be okay to retain this comment right here, the next patch the
latest should drop it (and its counterpart below). Question though is whether
earlier replies to the cover letter won't result in there not actually
appearing any users of the return values, in which case the change here
would be meaningless. Hence while in principle I'm okay with it, I won't ack
it for the time being.

Jan

