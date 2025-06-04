Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC301ACD95C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 10:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005202.1384718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMjDL-0000Uo-Gn; Wed, 04 Jun 2025 08:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005202.1384718; Wed, 04 Jun 2025 08:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMjDL-0000Rt-Ct; Wed, 04 Jun 2025 08:11:11 +0000
Received: by outflank-mailman (input) for mailman id 1005202;
 Wed, 04 Jun 2025 08:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMjDK-0000Rn-DH
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 08:11:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7890c3b5-411b-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 10:11:09 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad8a8da2376so1072471666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 01:11:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3130b823094sm899271a91.1.2025.06.04.01.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 01:10:56 -0700 (PDT)
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
X-Inumbo-ID: 7890c3b5-411b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749024669; x=1749629469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W6s1y9MSe1f3GMnf2G7luNsLZfAczGqpzbbZXynEbAo=;
        b=Jj1MXCwoFms0HyrDNybInLrrEbzVt+xhv6tIv93HUUE9KLsVWaPF4gEDVHXR64+p/J
         Rl5zTj/RpXcEl3bjDL8OahkeTw568OfDnMmk81HQzyKHXbddxplbIO00W61QVHNSA3kZ
         rSRrpOffutS0PEP9QzK6NCSpBmtEe6FrEyzSCn2uqxHRHDH6q7Xy8txj4XkjDCAYsVky
         Dk7QPGNI4Vp0xf4EzQaLnD+b2l2ISV+zGIaLgrByZlUZ37j7720ARIQ3M3zMVMzi7k/B
         7AfNq4cYz0GSswA1NMdcLcgEqwPp2GE64m4KaKsqkYdFuxY6HTMZqhsOegHX0tesGlXw
         XvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024669; x=1749629469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6s1y9MSe1f3GMnf2G7luNsLZfAczGqpzbbZXynEbAo=;
        b=g17WdYSYhUSTKgimJj1SC17x8/VlEUmJ9WSiHPIMShj7zewaeKAjltnwv5TzmzZKYA
         m1PqzZRP7x539gD8RB5qKlVYScsVTuxPQjbTVJIloMpUSnGMBPX6C8AZ6rqotETXkikm
         s+e3BFZQ57kAakQHCuFYFkkuPY6jFA+PZ5/lkWvgeKwGHeHvPIcoPAQMk3VOoKGiYOue
         BUWww3k4EyTxY8U2mbaVSYVFhyaRVel4nmSxL6yJESK7lqhNl6x9JIIyyaUuoq/ab52Q
         F5LOPt3hWmCR4n73vhUQfJOJRNXVNgfHjH8KrO6wo2Fa3/BuzinrKO4RygBdew9taN2e
         4tKQ==
X-Forwarded-Encrypted: i=1; AJvYcCURTdGyh41yH8fewfMsygRv0+7n/Vx8tIXtKiL0fAoWHynWYBznHzwxsS5fjJVH8UO8FNfjArceHCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyH3ZvPwlnGCdHagK68r+r//lDwj4wRYM7f6QATDvv/SxLZLzvJ
	yTdZQSppJsR9+MhfVr1zhoGG8rugrGVyzuPpTWqwtUj0gUQWAVwG6JxC+Lr6JKfR7LrBrKEeQQT
	21DY=
X-Gm-Gg: ASbGncsYveRrgmxwEqvTKLjofmaexqEvwZ9HQy6+VgxDd8kqAExrpitSXKr5GIdICi/
	L38aJ9MjhPVX4w1zTzf23efeWdetbN4v+TL2qaofG6DaHB8ylFOQUnAShnCumyc5bX90IuEnLk4
	LBb5vF3cI3AIQ6NJ2b/pi0YRiwVvcJlxsHyNjVAo12yYnj5kri97Km8S768J63kd80F9W+UwcJ+
	MZar6pges3w1SFi0ltufl03TjOrf1zKgUHvOEU3tyhfi4R/xSMdR76TKxqDxW7vLBNr7zXSGCby
	0Hc+4BU9AccrHIj4LP6BF6TXR2bzTCvDc/zNY3SPkmS+LanyM6N19wit7L5zIM6tbJiemzC38eo
	fOQpC6ZXnUlb8DzV44RaTpJcqtOKrOvSimsd9
X-Google-Smtp-Source: AGHT+IFrJ/orOagyAJymgJPSg/DJVqruqyKhIrkVeGYAF60SbrJ+3Q3sY0rzE/YfsLCXA6Yoo+krKw==
X-Received: by 2002:a05:6000:2892:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a51d9807eamr1500605f8f.45.1749024656883;
        Wed, 04 Jun 2025 01:10:56 -0700 (PDT)
Message-ID: <84a62d70-a60b-475c-b0d8-275528dd4f33@suse.com>
Date: Wed, 4 Jun 2025 10:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] automation/eclair: update configuration of D4.10
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com,
 federico.serafini@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506031807340.2495561@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506031807340.2495561@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2025 03:11, Stefano Stabellini wrote:
> MISRA C Directive 4.10 states that "Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once".
> 
> Add a SAF tag to the existing comment on top of cpufeatures.h.
> Add a header inclusion guard to compile.h.
> 
> Update ECLAIR configuration to:
> - extend existing deviation to other comments explicitly saying a file
>   is intended for multiple inclusion;
> - extend existing deviation to other autogenerated files;
> - tag the guidelines as clean.
> 
> Update deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v3:
> - fix copy/paste error in process-banner.sed
> - fix comment in cpufeatures.h so that ECLAIR picks it up properly
> - remove xlat.h deviation thanks to Jan's patch

With this in mind, ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -30,6 +30,19 @@ Deviations related to MISRA C:2012 Directives:
>         not to add an additional encapsulation layer.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - D4.10
> +     - Files that are intended to be included more than once (and have
> +       a comment that says this explicitly) do not need to conform to the
> +       directive.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - D4.10
> +     - There are autogenerated files that do not need to comply to the
> +       directive.
> +     - Tagged as `safe` for ECLAIR. Such files are:
> +        - xen/include/generated/autoconf.h
> +        - xen/arch/{arm,x86}/include/generated/asm/\*

... why not deal with at least the latter (we may not want to fiddle with kconfig
sources) as well?

Jan

