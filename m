Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C350AA77BE4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934279.1336039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbWA-0001sl-Sp; Tue, 01 Apr 2025 13:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934279.1336039; Tue, 01 Apr 2025 13:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbWA-0001pw-Or; Tue, 01 Apr 2025 13:19:02 +0000
Received: by outflank-mailman (input) for mailman id 934279;
 Tue, 01 Apr 2025 13:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzbW9-0001pq-2z
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:19:01 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df3f5209-0efb-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:18:59 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so36008585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:18:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b665707sm14392394f8f.38.2025.04.01.06.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 06:18:58 -0700 (PDT)
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
X-Inumbo-ID: df3f5209-0efb-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743513539; x=1744118339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zMmEMEWdVmIruzzY6wmLLgf8ZzpH2/FIAZvu1Yd2zeQ=;
        b=J7Ol4bkLLb+5WgAcWq1yXKNT657ix8mDN+Qx4PNTBuJQkZl+RN7pDBZKfc9kJ8zdpX
         sKEGcAxgBAWzmVZzPIlJa1fM1ReUx+9iMd+usvEAxb80NFSgq7Lpfb/V6LClFYnksqmT
         2OAbvws+Byg+VdAo+svRsQP98YsdnHjnu8bAJsGnBBy2FnZPQsSvSPyFdLTomE5Yxqqk
         W+wLSZ9DQnX0uuHUWKgRMa1vPLx9eQMsgWY/ZscYkCz/ZatkmBx5zJW07DelHVcpDQuv
         zyHThnrFOe4C9qEee5FlgDYptgP9Pki0QcbNNDlzVWR3qFrVj+ktyLDKH2nTLkuBhIdX
         TE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513539; x=1744118339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMmEMEWdVmIruzzY6wmLLgf8ZzpH2/FIAZvu1Yd2zeQ=;
        b=fpQjRNKaDhA8GmDSSrWaeP0Vt6R8MkWZSz3+svaAq+SxUYJlAX0zBZfcgX32lVjpSU
         4IK7lUi2InCnL8sGxKF2KI2Q+Qad2oLgIb3HthhcjSAxQyQIpIxd54DGSg/nARHvQTZE
         2nJwhLJ930hwhELO+Zj/XL30iSlD2kSzqgVUJxCHpJtkYbvNpofWPWzZhwqZ+QGj4ysh
         tKSu1vsDF0Wgaw7Gufm9nszgtVALcbr1p8Zc+FjsmHRL6j8fmQDvhLfOfGhNCGJTJt5s
         +M4Hnr0mYqrnAsz3+9+Lpp/SUqxnqgbir5sFGL/scmvLgBrOcpGwQr80RfsTq+bZ83TY
         9x2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpL0GHSlx+HWdBqBAi/GXlkl0JsyetTRA0FQn8iN/UiMbfyNc3pxBjpVoax/SMjp/mspbb7iY/BGQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGG9TRq1BMGm2SwGTJOQQCs+wFoPKH0K+6U56e6l+6WclZ4XoM
	yOZnhciIvkTc1D8t55fcKwA/MttxWtB7i2DRrK6GGq3hHvSbVj1TVBYxhaeQLQ==
X-Gm-Gg: ASbGnctG0q0bWxwPbyMmvjuAMEBHswy3TeIgLLtavsE4Tmz4fNIh/KVIaojd+8NzR5x
	jJwyq61ACzp6THp3lconK8sCIJCuOAhw8rUNJnWyRI9odXJWTOqY/+zUAqJJ4ngpUqz8sQG/cin
	w+gLpSSR8FyTdtSi4ZQubnuZX5k6/et0FUUtzZhNjpj+3Yq9M4lu7iIPwjxtXpni+lnkrHkPktN
	L7uWqCquZM0VswHiQZOiMsB2xNOe/sXzMNlAvjpJXLAeuF0ObqXJgfo0mI6yTU4pe6TRB9YK8P8
	iI8SxKx4RKVwszuImqtM5JtenE2eXBnAUq7X4Xt9yOpIyfLqx8UbyryaD9RJLfd5dD8PYC/X5ug
	0JmINwfC9t1a93A8VVqBWjEFqBOPXuQ==
X-Google-Smtp-Source: AGHT+IGLj05hEc00N9mMliVgZTaXvX0aPtfyeV8Lv8IoVr9e8UdbHbCgOJBrG0zSWIdPuVdANFOVmQ==
X-Received: by 2002:a05:600c:c15:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-43ea7cc382amr26149375e9.21.1743513538877;
        Tue, 01 Apr 2025 06:18:58 -0700 (PDT)
Message-ID: <9fb343fe-8bbf-4af9-a204-46eef4bd2aac@suse.com>
Date: Tue, 1 Apr 2025 15:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] x86/efi: discard .text.header for PE binary
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-7-roger.pau@citrix.com>
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
In-Reply-To: <20250401130840.72119-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> The multiboot headers are not consumed in the PE binary, hence discard them
> in the linker script when doing a PE build.
> 
> That removes some relocations that otherwise appear due to the usage of the
> start and __efi64_mb2_start symbols in the multiboot2 header.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> We could also place the multiboot header in it's own isolated section and
> skip such section for relocations generation in mkreloc, but it seems best
> to just remove the code if it's unused.

I agree. I'd like to mention that I recall people intending to try to make
xen.efi usable with an MB loader. Nothing ever came of that, so if anyone
still wanted to pursue that route, they'd need to undo / redo what you're
doing here.

Jan

