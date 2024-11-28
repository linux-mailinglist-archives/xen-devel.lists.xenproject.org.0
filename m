Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5859DB5DE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 11:43:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845260.1260718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbyp-0001Gs-6M; Thu, 28 Nov 2024 10:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845260.1260718; Thu, 28 Nov 2024 10:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbyp-0001E5-3d; Thu, 28 Nov 2024 10:42:39 +0000
Received: by outflank-mailman (input) for mailman id 845260;
 Thu, 28 Nov 2024 10:42:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGbyn-0001Dz-MS
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 10:42:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79b40333-ad75-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 11:42:33 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43497839b80so3811815e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 02:42:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f2c7sm50303275e9.2.2024.11.28.02.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 02:42:33 -0800 (PST)
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
X-Inumbo-ID: 79b40333-ad75-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc5YjQwMzMzLWFkNzUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzkwNTUzLjg0MDQ3Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732790553; x=1733395353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BuKO2Sf8vhj3X3VoXIayX5XVpATVKvCfsX5S93WGp9Q=;
        b=Z48VSU+cxxKOlVT45oPE0+BIv/Xg28/+MN3eNO3LgP940cIMW1yt4Lp7QcZka9lg/L
         A8VO6mnxHVAreDoxOyaPKPvHRFf7qcWYTvj/CLb/XhY/WfFzrdy2RHlLSA+P53xZsQzL
         rSl6s2Y1qBoxJSyHkIb/VKJ2kn9H6SC7i8IODIvnqb5bprzR7EIlyi34fly5z6xnjDv9
         HrE7GVkUfyfs+p/ophJLP73VVVOefK9MX3+S51AMwujEMZD36Dl2Mt9b3/oQnp6jEXrr
         7qq2n3o2zZII6zdRFlEzNQWI0bI6HCwYWwwJcz8XLIIn3TaOHiOO11MeT7KBF2EstJcb
         JUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790553; x=1733395353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuKO2Sf8vhj3X3VoXIayX5XVpATVKvCfsX5S93WGp9Q=;
        b=t2urePSFFGvAaOv2GMCqV7ZD78OgxEvgKgwe6Aw/ZtpfT9K1GB1mKyUAT4jQAZkx74
         z035DPQKHhAPBjd1GwtjgZLO57LfuznzgsQqCbIjMITcpeub9WDz8GG9qf4tpZ0qb865
         SaZmjIeQ0m2O/MuyfMpiTyNHMgR0/hSK8bpWKwDzOsyILDUMskfKycZJRJAALllOpmny
         jaVAu+bu68Xh39mt7+zj56m70vMFJHTTtfXECJPa7Q0e2VYF1STZIlFRHVgdUy+bc/28
         Xgmmw1HGJYIZO+VE4D6bTta4dlddbkRMRxlHuEZ4FqyQJRM2tTx0ygFJNzCRGPRF2m+Y
         VbPA==
X-Forwarded-Encrypted: i=1; AJvYcCV0UdUXQVWEktKzO0se0JzPYud+ecJ3xBJWqyijQGJMAdbmVjwFWD7NDoUsJTlS/SrX4l4usKqb2Tc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwphcW7Rbew45CtxHG3dET41NZ8eIzFXjTC4+tKfVj5Besjzams
	2kdsCG3A1URyNtTziASfdSyy7Qjiynd1giZ6yVctURO5wYqguEo8SHpt91JgaA==
X-Gm-Gg: ASbGncu/OYcheCEndNJ5CDgI6C1Njq0dit90C8KPXqV56GMRNPfWiy2w53FF777Ciz2
	3RsH/NRfN5BQmD8jGoUMK6VmOzP5DSQDrbbmjpLXDo4aG7KhD9Fw/o3TaBT8j5auJpFfa/uSr+j
	BLK1BCoNIDyxNzPmbpulFjgGFEEOxqGHEGi7f8ZfFSSKLZArM7lFYRkNsGAlQ0u0ImEM/b77DVT
	5XyUOwmNRaxqZod36FHCTBUadrRINFALYr1J7YT7oAflNLFKCfCXtuUnxs/3ZRAZLujjdoqSNGd
	lFJzSVi6ruGaM3ffwlGGDpybBklXI2WNNiU=
X-Google-Smtp-Source: AGHT+IEUSS7OykV2t2b7Qy5X37M3npKjy/FnZZcwZ5XCuSMeWfvxpvlt0lIQhSzhxgkOdsZp33Oqeg==
X-Received: by 2002:a05:600c:1f06:b0:431:2b66:44f7 with SMTP id 5b1f17b1804b1-434a9df7a8dmr66666415e9.31.1732790553262;
        Thu, 28 Nov 2024 02:42:33 -0800 (PST)
Message-ID: <5b5416f9-125a-44c3-a56d-f1ff69d42aed@suse.com>
Date: Thu, 28 Nov 2024 11:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/12] xen/arm: add initial support for LLC coloring
 on arm64
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-3-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241119141329.44221-3-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 15:13, Carlo Nonato wrote:
> LLC coloring needs to know the last level cache layout in order to make the
> best use of it. This can be probed by inspecting the CLIDR_EL1 register,
> so the Last Level is defined as the last level visible by this register.
> Note that this excludes system caches in some platforms.
> 
> Static memory allocation and cache coloring are incompatible because static
> memory can't be guaranteed to use only colors assigned to the domain.
> Panic during DomUs creation when both are enabled.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>

(As this is inapplicable to Arm code, it's independent of Michal's comments.)

Jan


