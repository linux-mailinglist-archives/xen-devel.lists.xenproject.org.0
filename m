Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E577A72B1A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928592.1331272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiIB-0003Sh-B6; Thu, 27 Mar 2025 08:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928592.1331272; Thu, 27 Mar 2025 08:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiIB-0003RZ-8I; Thu, 27 Mar 2025 08:08:47 +0000
Received: by outflank-mailman (input) for mailman id 928592;
 Thu, 27 Mar 2025 08:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txiI9-0003RR-3Y
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:08:45 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3767b3a-0ae2-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 09:08:44 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so4527855e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 01:08:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b25c9sm18914954f8f.42.2025.03.27.01.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 01:08:43 -0700 (PDT)
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
X-Inumbo-ID: b3767b3a-0ae2-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743062923; x=1743667723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UL26WFIX5hTE6mOhngqDa7aW/SJfv91CpL4MadXwAio=;
        b=ftJGRd3ZcN2+JdHDxZYDg5DKv0t24GKBDlG0Qw5I/pij2uI1e+mP4Nln4uplCYzzyo
         pJlhZBFILOThpO7lsNJYXv4Oyli7Q2zise2fF/c5RC17FN0lEPvIXptLybkZ0Q+Uptvz
         KUsF7X7Ji1tRWaUNm90cNdZ5BiYnFSMIyTdOsY0JtIzsHwvX24wVa3yQkLwX3q1UbwvO
         k2F6nRCSripEnf65qDUBuHhgtY7fvQrvrtfY1JJzTA1qAdZ0YT0Og7RvFlV5kZbJRKBs
         js1iE6EG3MPAoEn36A8VP9IlKgqEh5PC2xD2YDX3A8LG1DM7xuF9X5CGNH9KfOtOeoLu
         e/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062923; x=1743667723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL26WFIX5hTE6mOhngqDa7aW/SJfv91CpL4MadXwAio=;
        b=DizvfvBUtV2tkdzmtpTds5oR8EQb0jKHT03yT44izpb4QIdSvbYryjmtKtU+iKSe9K
         f1a/z+/VCXxCn80VqEzVQbOB58SUs9XrajlSrZ08KHMTyeS5RRtkfM+t+BZq8FN8P4Zj
         MRL2qKcOqgJEKn+EEAy0XwtddRjH0ba6/PIl2wC4CXs2lUb0Wwx9PsLL75/BdqSoymm7
         J+CCAhL4V/JszJ0lIaxf96UYbVMd1c+zWQokutIHoCiUzZ6+MUZK/PPrTdAk9uJ6PoAh
         EwORidoELT5OU5oojJdXQ2qhgLSmhRsOJZMheVllGQwR4+DrszmmLaVe+/896wZZmcvI
         oSQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfYE2HwfgAsr3F9gskRkMGcAyhO+G0zCgCM4qjSf+D9sauC3+/8+zgciF6UOJBiVoKWl7m0wJFWh8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1ThWVZRu6w9i3IpnbrLXkwL/KM2KU9U8Yq/slDFZt6oPiEZgx
	W/ljYqfGFc1+kSda+mmJiXSJ9xR2GRn/SzXWQnBl4l0kRhjVgwFpsWUuoYb+qg==
X-Gm-Gg: ASbGncuDpbx1j5ru41+4eumNIRZTXZj+TqSA4QubjH2aF2qWePYzCA4xWUB29s2cbyl
	DSXidejMDNdFiBB5yzYkbORbWJIAEntub13ZkHIyL5XHemJMhg9XEcwzGTo3J2gDQpOYG4Rnkfs
	PLO+uUX1BBeTby6W4Cst+k6pIsaki1KzqXIm+iSZnzzt/6AxYNZAN/Hd4ljcFZ7zoNxjFOc3kEg
	WzUZcLITyazgqUlkmk3X9xcVqdMFTqM30S8v7aUFlNLjaRu+T285R6NYxWWHobmxj2XgDpTFExy
	RRcsEybsiSZ+jlYgPDj0XMN5sYTr+zHz9vmhRA9JT6pzeWqWwJWMXEjrEIdQ88DO1PmLUAUu2Fg
	sBLaCOFUu0Gqpui0X7Ft+eNUE8xpVsw==
X-Google-Smtp-Source: AGHT+IEk3jkBXEffv4MaWb6altyHlM8gJRR4UfHCD1fur6LdKhQEa15c/zxt03xCQbdye1LByitBDA==
X-Received: by 2002:a05:6000:1446:b0:39a:c9cb:819f with SMTP id ffacd0b85a97d-39ad177b949mr1696083f8f.37.1743062923299;
        Thu, 27 Mar 2025 01:08:43 -0700 (PDT)
Message-ID: <248e8349-1f27-4c41-8747-5d043f45d46c@suse.com>
Date: Thu, 27 Mar 2025 09:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen: debug: gcov: add condition coverage support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
 <20250327004044.2014048-4-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250327004044.2014048-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 01:40, Volodymyr Babchuk wrote:
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -44,6 +44,15 @@ config COVERAGE
>  
>  	  If unsure, say N here.
>  
> +config CONDITION_COVERAGE
> +	bool "Condition coverage support"
> +	depends on COVERAGE && !CC_IS_CLANG
> +	help
> +	  Enable condition coverage support. Used for collecting MC/DC
> +	  (Modified Condition/Decision Coverage) metrics.
> +
> +	  If unsure, say N here.
> +
>  config DEBUG_LOCK_PROFILE
>  	bool "Lock Profiling"
>  	select DEBUG_LOCKS
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -138,6 +138,9 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
>      COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
>  else
>      COV_FLAGS := -fprofile-arcs -ftest-coverage
> +ifeq ($(CONFIG_CONDITION_COVERAGE),y)
> +    COV_FLAGS += -fcondition-coverage
> +endif
>  endif
>  
>  # Reset COV_FLAGS in cases where an objects has another one as prerequisite
> --- a/xen/common/coverage/gcc_4_7.c
> +++ b/xen/common/coverage/gcc_4_7.c
> @@ -43,6 +43,10 @@
>  #define GCOV_UNIT_SIZE 4
>  #endif
>  
> +#if defined(CONFIG_CONDITION_COVERAGE) && (GCC_VERSION < 140100)
> +#error "GCC 14.1 or never is required to generate conditional coverage data"
> +#endif

That's too late as a check. It wants to be in Kconfig (less preferred from my
pov, should at most be influencing the default there) or the latest in the
makefile (see [1]). After all a compiler not supporting the feature will
choke already on -fcondition-coverage, and hence not even get to see this
pre-processor conditional.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2022-09/msg01793.html

