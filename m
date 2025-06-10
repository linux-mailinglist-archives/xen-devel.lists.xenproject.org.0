Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F974AD39FB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010978.1389241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzPW-0004ZO-Ko; Tue, 10 Jun 2025 13:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010978.1389241; Tue, 10 Jun 2025 13:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzPW-0004Xf-I3; Tue, 10 Jun 2025 13:53:06 +0000
Received: by outflank-mailman (input) for mailman id 1010978;
 Tue, 10 Jun 2025 13:53:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOzPV-0004XZ-O5
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:53:05 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a2fa61b-4602-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:53:03 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so71265285e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:53:03 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e163113sm140988605e9.18.2025.06.10.06.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:53:02 -0700 (PDT)
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
X-Inumbo-ID: 3a2fa61b-4602-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749563582; x=1750168382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dlJY4iRlUylEhN7xtuvFFCDc5o5qdJM0UQFUX1ID1TY=;
        b=MKbzkTJK/PBsycYb2Tj+k+jK8gZSqma/yzggjxsWiPfwMH9d9ws5r6k9X1kqLuBzCB
         m5TsinxtfsEsYuEaO88mK7H+r5MiTVRAWXndAvFX9Di1TOUmVVEznqluKbBQh6NTUcMf
         ehyNsMz9IRqXVr7DDykxIWJSnUb1+FWjshQ90tMwFef0Qjv/MKfCL9mzE54DO911hb4Z
         IJsz8ZZgXcUpuWNFLtK4n7E9Sibkk8RUAvPrv8np21T3pTlF7nkANHEZdxTW+fzgKcfy
         wQMzAhA9u2CgFgerNnSoFHIz+XmJhwy8NDw5oR5hSf5ySzjuoNvZivRDRU31B4xZJ5n/
         OvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563582; x=1750168382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlJY4iRlUylEhN7xtuvFFCDc5o5qdJM0UQFUX1ID1TY=;
        b=VVqUcQdJ0TZY2g6fKyMuLKK0AuAvSK0BaU55mBDQvazS9sOj/eS/PLW/pRKId40EeH
         vCIxC0HppXG90pKtmMoVk9vNVXQzsHnYCUNLZ32KhJJzf2DftSu/8yH9mMm44jG7qc4f
         IqCi2zBxb6TAvCTB7k7COCqAS/BtLDNxwGKFCM9yb54JbZO9GDUa4uPetNqGOX64/aB4
         UsPgAe2WEH8mPYc6H/VEjPuLzFNyTgqPfXYwFQ0k9+bpqX6Er5FBjcouNz7jafk8uM5s
         L12+XkENrdbUgazKvsTiOFhS604n4dPZfz1PCJetxZuur/1noCVt212UdxMHDQlEB1KQ
         M1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXvXq6uM8lS9E5srkodyT4CSD4M/Ms/l6iGLWARbbSiGMf8WklldMfWMpdRDDSU57Twe0+HR13K5Uo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPgkFozUEeGNfpZNsZw3yVaJK/Zv2XBkzfGqV+EW9GgMk0AR+w
	PqlTFIf8dlfT45q0aLZNEkwjTVRB3lej3PLq+wIFHLwZZcQeftnzW/M1JZ0wZojtoQ==
X-Gm-Gg: ASbGncvDyqt3z3xr1IoxEdQRyb+FrB0gJAoSdX5wl0GywKOq2838KjaaoLoTEQYLlU1
	dV+omXEyMVSgOxN6uaqepZrHLYBKJmR8m1O2TgrEAadK2aRYCpAhuQAghQRZui1dgnJF9get7ap
	p2t1Ek4Z6pieVeM/Cx+wexEppQy5gITO7XubSgq3u9D+KnQ/wec/Y6tExXxYqLrqqD8fQmEJ6B1
	7gNKpfFMJ5nkB7WwmAFbldQ/dJj7Pv7FEJ/6xqCvRAINYUA7uWlcgnfLeF1dJ0fuG7RUC5zaep4
	ZW2vXDFir11ItqlRzkux5uCA9BwY3TcyqPwmhbZ63x+jQPyPaDMdSIS37osj+ki5xghyvuGjtEl
	kpOlNRXv9ZVl+PZp6bf3ArlzTMVX5J3x2WfMRPJkIMcZrBj8TES+3A3lpb1JPA9+oj5Opn7vY+B
	CtMif5IabdbWmAgCwvF1HP
X-Google-Smtp-Source: AGHT+IGNfnUVAodBZAoWm4dNiFWX5uzrzypnwAIYHO+KUqv0pO9QHQITHVH0NPdufAKuQYOKrK2nZw==
X-Received: by 2002:a05:600c:6210:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-452014d99b7mr139911685e9.25.1749563582498;
        Tue, 10 Jun 2025 06:53:02 -0700 (PDT)
Message-ID: <a3e3945d-66c6-454d-a334-72f8154cab76@suse.com>
Date: Tue, 10 Jun 2025 15:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/20] xen/sysctl: wrap around sysctl hypercall
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-21-Penny.Zheng@amd.com>
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
In-Reply-To: <20250528091708.390767-21-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:17, Penny Zheng wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> Wrap sysctl hypercall def and sysctl.o with CONFIG_SYSCTL, and since
> PV_SHIM_EXCLUSIVE needs sorting in the future, we move them out of
> PV_SHIM_EXCLUSIVE condition at the same time.
> 
> We need to make SYSCTL with prompt back and state unsetting SYSCTL in
> pvshim_defconfig to explicitly make it unavailable for PV shim.

I'm struggling with this sentence. but nevertheless it seems pretty
clear that what the latter half of the sentence says is not the effect
of ...

> --- a/xen/arch/x86/configs/pvshim_defconfig
> +++ b/xen/arch/x86/configs/pvshim_defconfig
> @@ -31,3 +31,4 @@ CONFIG_EXPERT=y
>  # HYPERV_HYPERV_GUEST is not set
>  # CONFIG_HVM is not set
>  # CONFIG_VGA is not set
> +# CONFIG_SYSCTL is not set

... this change. The option is still going to be available; it's just
that the preset is "off" now.

Jan

