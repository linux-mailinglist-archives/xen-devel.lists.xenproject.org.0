Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466D9E37BD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 11:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848482.1263347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tImnw-0007xa-2Z; Wed, 04 Dec 2024 10:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848482.1263347; Wed, 04 Dec 2024 10:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tImnv-0007vK-Vp; Wed, 04 Dec 2024 10:40:23 +0000
Received: by outflank-mailman (input) for mailman id 848482;
 Wed, 04 Dec 2024 10:40:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tImnu-0007vE-VL
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 10:40:22 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ff57ec-b22c-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 11:40:20 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so872375866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 02:40:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d4101sm712748766b.73.2024.12.04.02.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 02:40:20 -0800 (PST)
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
X-Inumbo-ID: 28ff57ec-b22c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733308820; x=1733913620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oWVq6j4z997qHNScOgBh97kzZ0u6YgZyVsP/3S57X0Q=;
        b=BjEFHKgeP8WxJN4SWVepcXJ06OZ/TwpI3U34vvvSj8yBdnHPzDFZRLsGF/utA9snlP
         Me8Pl4pSM9AdpLtaJTl8rDgeAzAsCCS18O/rl/AQ/7wQtIiH6JJt262veOZizCEhGUkR
         ozTAa36Q6YMC4hcmfNa7v+ByILTOPazgF5uY//htcwSYJiboiXjpeeSg6eq1UP8uzGXS
         u5t1t1WgzCJhcJ8G+ISFoU87Sc1/+Lo/Ho2Qkq3l3qKhefZc56Ec/TezzlRh0MchwNMQ
         u8WPDXmPgs9jSPRgq70+ONyQdlbpSopRQMi1yxqYJRPixUTIxqGUbOSroXdkcqMfY5UV
         uxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308820; x=1733913620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWVq6j4z997qHNScOgBh97kzZ0u6YgZyVsP/3S57X0Q=;
        b=nbEGNp/DpWxRjhy51AxZlOC9+hZml7w9xi+Ept/YRxi0JEe6vkK0KFv5iB+B/Z9XHD
         +7Wkes5NeClZRrU/1iG5Ij0wwB5U7/2jHZcuQykVOWLflInpyzRKl//iPGI1H+WMQcH2
         Jtsp1nfBbW4anNlLMtfd0KUYwI+YkkenaDaRrzvnybsXvYhsthEE0lYFtppCx0Jde0Do
         Uw3pxxtReLVtpZAP/JVL9Qyxf6xgjnL6pAVOM4jwfyDHRlHEA4PX0Zk/FV6DacFXYyce
         szudhAeyEq/axM2qP3kgbo8uNAdCZQvHIBig9yz4rwkx2FHAsQURSjzqr2DOvO8vUfs/
         SmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkI7HkqLLYJlkuZQ7TIu2vSLrBrx6Vn7u/aj1V0h1iuA8L8x/micMKjsXir2tkH6Gtu2EF95Sh/8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAQxq7gID10PyItyoXFh6Ht6x3prxnV1jt/1bmQqlhnf5CeVQ0
	ospyuFZgtoh/a6Frr4WicW7DqU2M+EtHnQyf0yB8cZVjxCpTahKtltolh91RZg==
X-Gm-Gg: ASbGnct9791UW8niXnmz31zlhkXM/VjJhs6c5gKTeOfUCcROlbvindQA9rLu19RlYcA
	c8n/jyweNR/7rTZT9URtUeCuJ9xI1UuG5KuFholjEu3qlNYzj8bM2CvOszdmvMM/apzywyhYj+p
	dCvlbNlmrMQqBgltBBmMuxAqkvoJc5vfuYj4U6UzdEKcHgpc1N2no6XxWDROVl6IPHQ4YAdveej
	MMyBCNOM2MlWWHnFahvV5zgFnQlUikGDUs/10y5Il37Xqz9g+n/9yT0U4k4dwKJK0uMyP3UES/h
	657pVsFhlegXMQaoxJytuBeBSzp5QxR7lDg=
X-Google-Smtp-Source: AGHT+IHug87E0sEncEmRZlpGvAF79OUkIsA93zqP0eP/wnf8uX7lC0f2MjBxci/K7CERdSGXcsVOVA==
X-Received: by 2002:a17:907:75d1:b0:aa5:31f5:922a with SMTP id a640c23a62f3a-aa5f7d22d13mr537540766b.19.1733308820349;
        Wed, 04 Dec 2024 02:40:20 -0800 (PST)
Message-ID: <6acc7206-86b1-42fa-8106-557ffa1167f0@suse.com>
Date: Wed, 4 Dec 2024 11:40:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] XSM/domctl: Only pass properly initialized ssidref to
 xsm_domctl
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <fbe81175084a2f302a726d3fb8ba3144c6af8e6b.1733307202.git.teddy.astie@vates.tech>
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
In-Reply-To: <fbe81175084a2f302a726d3fb8ba3144c6af8e6b.1733307202.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2024 11:17, Teddy Astie wrote:
> On XEN_DOMCTL_create_domain, we need to pass the ssidref parameter to xsm_domctl,
> currently, it is always passed regardless of what command we actually do (meaning
> that we are likely to pass garbage in !XEN_DOMCTL_create_domain).
> 
> Pass ssidref from u.createdomain only for create_domain command, 0 otherwise.
> No functionnal change as ssidref parameter is ignored for non-XEN_DOMCTL_create_domain
> commands.

And then why is this change being made?

> Fixes: ee32b9b29af449d38aad0a1b3a81aaae586f5ea7 ("XSM/domctl: Fix permission checks on XEN_DOMCTL_createdomain")

Please limit the hash to 12 digits.

Jan

