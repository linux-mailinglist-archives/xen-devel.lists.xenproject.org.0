Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78303AE8932
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 18:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025310.1400945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSev-0003kI-Jr; Wed, 25 Jun 2025 16:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025310.1400945; Wed, 25 Jun 2025 16:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSev-0003io-H8; Wed, 25 Jun 2025 16:07:37 +0000
Received: by outflank-mailman (input) for mailman id 1025310;
 Wed, 25 Jun 2025 16:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUSeu-0003ih-GU
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 16:07:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81774df3-51de-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 18:07:34 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so50861545e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 09:07:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ad3fed402sm2455200b3a.125.2025.06.25.09.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 09:07:33 -0700 (PDT)
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
X-Inumbo-ID: 81774df3-51de-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750867654; x=1751472454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JlWIg5AL+uwdSMf+icLYMi1uOb9L0IeOaxWTplwF3HU=;
        b=dxwUCCChrqCwb8Ue8gnM+/kUIomKIRcnb5I5EPOACteJcIORGVrFtROgzUz+kAg0pJ
         FuGSQxc5Chr03D6JXHyj+UsjMleIOLzC3rD1S9vyOKZyZPhoxSKzJIcO1Ct67a+URouo
         P63inOBJBeKGc+J/PK+ZitJwutRmfzH0LEpzgEe2K+iGkdxAT/KGEWfrPiShsupxLZn3
         SuoW+FUwHNCfas9K8ZauSHrLPkJu4nedZZYAlJ4JZRcEJlEdwxJY3DYvPjM59je0BZS6
         xQE5kkCRtH0Sw9g2cj288ZnGQSgJ58ACK/fLjYw2vXQjMwjpkPWbAWRvX4y7Bq9Z/MP6
         alLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867654; x=1751472454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlWIg5AL+uwdSMf+icLYMi1uOb9L0IeOaxWTplwF3HU=;
        b=mT887tsAiBvHaU61+AAdZVsf4FkBv0uowjZwvWT+8GEeY1aXlBj6ExzF1jEI05EI3k
         EREf17JfnZTYV5Ps1wPGoELmZtGdRI6xPpqLXhU5u+PQz1rVES/wceY7/s7joRsk9wSh
         YDpG+sKOURQq3uIHnkFa6zvR9ptDDj9f8w5Wmdjd1qvuZbvRCKom4Gi0eJ1Km27a/aoS
         CKMZR54oSOFxGiK9MANYsWAoZOIiQfVzHph7POhCqr5uNmeB2BMzET3MlvzslPbGhTJA
         BmEwx5WM8gmio9tNGfau2APB33E0/deBTP27CMTgjCuQQIcxknnn13XgmsB7CUQTJYJr
         rWvg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Aj5ECcgPAGyMIy2H+AAXzJgW3c/jca6Jvq/FUfuo3YSTdrBRTB5R//xfaHfcQGxE2LkN372ddDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzl+YjBZLfijDUfdCBLFlGxA3g1pJCM8SWDdWf5xs5DMPYOJ0pW
	7F8xiBxlhCSLiNE6PCTRZTPbAzO/fnr65Jn9lAykE4r+1y44taUvq7JKuQntDmqk6+jj9chz8bI
	NpT8=
X-Gm-Gg: ASbGncvKfoCRkjNA6LGRix8sDEkjPlxlR3L4pESkgzttjQYj4geQdN8/lMvvsAau4sZ
	z5cNzjBhVsnFYIsBeNYt+9rS3rzMKv34vkqXyOiPb+/BU22p54eMknOc+hIds8/J/V+BAIqFnWc
	dVJINUorofh5tsqdz6oz4nVy6622cxSJN2xbk1YXvdu61ZKWdhKpFHucu+Hjy21kjL9YrwNelQZ
	/kpJk/UBs5EmpQf02exvnyO8uyHIUieoPAYp+eVpmHuCo+OHzz1/7mXSWyDWt03RdqTFEH0DN3n
	VFLPO3LXL8rh1UPyb7PaMqfTNs5PfRj3YpJPYTLXZUByHRNjszIJwLSvRcPM+ydM5buWRLif/V7
	e1aKou49H020t/KcEUOPAa/QoytCTbjBxh56R4pxYpYtxKio=
X-Google-Smtp-Source: AGHT+IEyuvRvIlBmwu5AANJaJnhjtJJRojk01S4w8PQzVXi5dUXR9gMnAIVcPXpCp1mzGVvJRJTzIQ==
X-Received: by 2002:a05:6000:2004:b0:3a6:d579:ec21 with SMTP id ffacd0b85a97d-3a6ed61a4admr2890668f8f.12.1750867653764;
        Wed, 25 Jun 2025 09:07:33 -0700 (PDT)
Message-ID: <21e532ca-2988-4136-978b-a12564e9a5f3@suse.com>
Date: Wed, 25 Jun 2025 18:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Improve paging mode diagnostics in
 create_dom0()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250625150105.402005-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250625150105.402005-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 17:01, Andrew Cooper wrote:
> I was presented with this:
> 
>   (XEN) NX (Execute Disable) protection active
>   (XEN) d0 has maximum 416 PIRQs
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) Error creating d0: -95
>   (XEN) ****************************************
> 
> which is less than helpful.  It turns out to be the -EOPNOTSUPP from
> shadow_domain_init().
> 
> The real bug here is create_dom0() unconditionally assuming the presence of
> SHADOW_PAGING.  Rework it to panic() rather than choosing a dom0_cfg which is
> guaranteed to fail.  This results in:
> 
>   (XEN) NX (Execute Disable) protection active
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) Neither HAP nor Shadow available for PVH domain
>   (XEN) ****************************************
> 
> which is rather more helpful.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


