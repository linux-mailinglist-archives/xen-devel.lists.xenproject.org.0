Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D1A3585A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888539.1297893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqeX-0002vY-2b; Fri, 14 Feb 2025 08:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888539.1297893; Fri, 14 Feb 2025 08:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqeW-0002u3-W1; Fri, 14 Feb 2025 08:02:24 +0000
Received: by outflank-mailman (input) for mailman id 888539;
 Fri, 14 Feb 2025 08:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiqeV-0002tx-Cg
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 08:02:23 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0528c2ec-eaaa-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 09:02:22 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5ded6c31344so1656122a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 00:02:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece270972sm2440281a12.51.2025.02.14.00.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 00:02:16 -0800 (PST)
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
X-Inumbo-ID: 0528c2ec-eaaa-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739520142; x=1740124942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IbyPrOXODrduJN/1ZF8PcGYTRk4LtU7T/DQs8R8NO6c=;
        b=LH6gJ+5qEl70aaaY4ewyiG2ghAv9Rg0t9OfbX3ggO7TEuiEfnpAE/Mdk4gwrek41kS
         0+RuUUKyvkUF6KBA+HbPevFeoX9uMk207Eium/xaC3gpm+ZQzbvhiPfWQVm3j0taPXoX
         UULCl7VUkqy/u/gJMyrb/XeQG6AOiJcoTwdj6m4gpcdYncaUlqzCV3p0Yc3io7otipjz
         oLdZBap0BeFyx5ThwXbv+wjrlL5Vwv1xeozpx5Kyz7BwEEZlOkcFHlTIJsyqpwiAeh8W
         GlqrFMVD6VdKmH1huAA+3GssYy6qUW8O4WvkfoKORy0qeXeW1fqizFtPrerd9H8/lb5n
         JoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739520142; x=1740124942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbyPrOXODrduJN/1ZF8PcGYTRk4LtU7T/DQs8R8NO6c=;
        b=Y6EQu7FgMcks1ba58clHRqwGioU25wEUJ2+h1Xe91WsePs5OAKg440JottLhAXTK9x
         mKatRKkGH0f6jstEzWqYewnu0dmLeKLoA9Gr6qhUgkeHPVMRRqMOlKavafutNw9DFKrb
         evyuVIb9N8CF3z9enRxYD+JQx7HsgkFxuq6xrMPm04xOVvFUmbMPj431fdAq0QNTOJck
         phhVfNpw9O0+skvylJdDiqqOwryEojQ7LB3RFqkzm3XGmmyuS/cWrYFxloJ2AnIkwmBd
         FlPyqteW4UgtENcCvFiDETg7e2qq7axgCkdebVgXUvetzmoFaWZEgNn7VvLT6r5Ded3K
         3PRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1a6tPmNadyGm9PU90evwII9h3gyNGmKbQNsSP8D006mlxidQOyJvegx2HO6+0ddNQgF92YEBuh5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXgDmyM3/8FVJ95to16WzyjYD7I6j+tehuHHc7/lh+9sLHMYAg
	s3RBJEMIsEj8wBPFTz4S7TZhrqqg3rp1M/Il/Cyz9fcDxUOVW0vNcwCIrjuPl2CUpDqDzULiSe4
	=
X-Gm-Gg: ASbGnctRMKs/Jk7X4fFURcIkh4IbIIIKANapT0Kc+/Aqz4s29McIFigSs058jVfnfOv
	paS9N3mNnsWHkC/gZXjCADVqmwxy1nAoU7+srKW8PYwWD2SMPQJFFliJjFdMogBTpqnsxN31Y/b
	McopVJlkZeK6Aw/at6OuWhTU5FPQFqBVcYbKc2ReGunaF6lslooAPENPukQbgG0yr8BguzoemFg
	1ZU8ukaNayO3Qx/EbKTlJrgr7GgZ1AVwuJb0ip7nqViKcc012L0/WJR23xQqBrdonHeBAjesZTi
	P4zWwxX3iFUNdr/zxMG42odUh86oQbpNikkl+TDtxsdTC1CudoQmUjcldB5MTnHKK8KkXvhnMpd
	D
X-Google-Smtp-Source: AGHT+IFGVjVXXDDBpwq5KtUovotP3vYBIdROcmoFJI7hf8GXmBqChEMDONu0gdCxgA9K5Ovzek0Q8w==
X-Received: by 2002:a05:6402:5111:b0:5df:6a:54ea with SMTP id 4fb4d7f45d1cf-5df006a55fcmr2121700a12.11.1739520137051;
        Fri, 14 Feb 2025 00:02:17 -0800 (PST)
Message-ID: <9d42062f-a388-4b95-9218-d87f0b788c4c@suse.com>
Date: Fri, 14 Feb 2025 09:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
 <20250213220021.2897526-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250213220021.2897526-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 23:00, Volodymyr Babchuk wrote:
> This patch is preparation for making stack protector
> configurable. First step is to remove -fno-stack-protector flag from
> EMBEDDED_EXTRA_CFLAGS so separate components (Hypervisor in this case)
> can enable/disable this feature by themselves.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  Config.mk                            | 2 +-
>  stubdom/Makefile                     | 2 ++

Bzw, since on v4 the question was whether this series is ready to go in:
Strictly speaking you'd need a stubdom ack here as well.

Jan

