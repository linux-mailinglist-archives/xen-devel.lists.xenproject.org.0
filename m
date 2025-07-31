Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5E6B173FF
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065797.1431114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVJl-00039C-9P; Thu, 31 Jul 2025 15:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065797.1431114; Thu, 31 Jul 2025 15:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVJl-000378-6m; Thu, 31 Jul 2025 15:35:41 +0000
Received: by outflank-mailman (input) for mailman id 1065797;
 Thu, 31 Jul 2025 15:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhVJk-000372-NJ
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:35:40 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02f17349-6e24-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:35:39 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so929256f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:35:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8ac8de2sm20848945ad.185.2025.07.31.08.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:35:15 -0700 (PDT)
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
X-Inumbo-ID: 02f17349-6e24-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753976139; x=1754580939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gnOmLhGjXjDHdg6NJj20A3wDt5nwEhbcZ918iQHtIEQ=;
        b=I5qEXQAstWbsssgl+kqvDlvqJVaNaExhO9zkQtPfp1sjkkr49kWfMmCQ2l25PEXbzP
         OzsF/Urw0cwkCJ+zRJkMXZZUGCBk4tDY1iW3gstJu1zP/jWxwU6aDF9Hhqf/N2H9Ngaj
         v0CJBPEmKmzwPu3KfAsCkZjZIZrUASzBPOTukAcZ7DdBp8MBjnALJWTW1c62E3zCdAKa
         1oQ0Gqi1NTKpSQ3bDowcn9LOTqrhyI2NajGnk8xD9xTi7HIE21LnQIszwsAWRK7asnm4
         eWIaJkZXW9ThSnfW1N/r7b+/JpaJnpw/2wIo6yEAMBCV6MmVVIsHcsM30WG2cu5W7wuL
         1Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976139; x=1754580939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnOmLhGjXjDHdg6NJj20A3wDt5nwEhbcZ918iQHtIEQ=;
        b=QnLNn/yvgvu1zYH5E4PMrWDoM9i2wraxiNopjC+d4jOr7ypY7BoMmt1jtIpXPlkGyO
         ZDTZYgAKefSZDsu9f5Ui3sVk5XAylHNIsLdzMl3OyiRWLVH+W9VFcHhYb0oFHNlU6SxQ
         7F5kS2F/stCjj6uztkmTu08CFLAW2ucZZQJJVVRnvPbt5ymREmDwkEE3ymIHG64tTdYY
         o4GoR6oh02oCssAsAkMF+H4PwwLxX8v/FkInBqUIRfQq0NKRcxFaEwIcbyAxieZANAiA
         DGkmLKfX89RJC9YR3EasB/NwYKoUeSLH3E0+PYkNk7vdV5XSs3qfOyp+gvvjbvG5vcd1
         ECew==
X-Forwarded-Encrypted: i=1; AJvYcCUsEs6pZyFZ86rvZ+CFxsBgvJvlhhVdGiAuiI1bWxmr1AJKEcu0LTAZfo/JSYcmRsWdKYaAqxo1Phg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVIoQ875anoaszaMYn6HssQlXGtdxcuYJmxfvvRW91qt80KMLN
	MnvoadCKKIo75H1RDmAD8nOoU+IGCQRhR3eqLr6K/55JutSJPjcIE4kur22RfT9IUg==
X-Gm-Gg: ASbGncs4K570W28J2Lcz6skj6lFG5zJxom5MIjzyJdResM6utEt4jAGOx/Xop187vcZ
	oBE9TA60KdwrAcHxfVChdb9tY7gqJdsLuIs4iY7zR058EkRLvlKdAd2IQk/+W2J3C29x8uD2gnp
	/6KqV4H9k20wiIx2WTLfcWDSDjJK0kCa5VMAKgsfoURwYa5RIi3ubtpH2QoBqUBnHR11k2waWod
	0f1c5eFmHZ0aO2YPiIB57lEk03/1fpECR3DTqBhwIVz4p0sa+ZKcV0KtLrrX7hHBtTcCXAfyUl6
	SLOjCM7qmJL/AdD6Fz9bYS/UPNRfbX6HIsC9kyy1oML/F8Px83DWWiuoPQuHNCWwE53We0tXgSD
	X97mGIQpIIOb9kRViQeemSUnnbKTPrpC46nTo00qKw7HJE1a99s/3plXPuA06wCgB1vcnLwYhag
	JlnnOYxGmimK67KOzynQ==
X-Google-Smtp-Source: AGHT+IG1981hPPVH3+t0CAhvnVrM9TMRxAnNefZZnwZ8uxjKEWepbZD4b5YUfRJOlzehwxWuLBJ8vg==
X-Received: by 2002:a05:6000:2c01:b0:3b7:899c:e887 with SMTP id ffacd0b85a97d-3b794fdef74mr6145578f8f.24.1753976138992;
        Thu, 31 Jul 2025 08:35:38 -0700 (PDT)
Message-ID: <1b8a754f-608f-4439-9dca-1e18e12af1b4@suse.com>
Date: Thu, 31 Jul 2025 17:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 06/10] arch-x86/pmu.h: convert ascii art diagram to
 Unicode
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, andriy.sultanov@vates.tech,
 boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org
References: <cover.1753372928.git.edwin.torok@cloud.com>
 <8d7f3eb14bee79c63af02b228fa02761ae2db6c5.1753372928.git.edwin.torok@cloud.com>
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
In-Reply-To: <8d7f3eb14bee79c63af02b228fa02761ae2db6c5.1753372928.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.07.2025 17:06, Edwin Török wrote:
> Using `aa2u` tool.
> 
> Signed-off-by: Edwin Török <edwin.torok@cloud.com>

How come the use of that tool made ...

> --- a/xen/include/public/arch-x86/pmu.h
> +++ b/xen/include/public/arch-x86/pmu.h
> @@ -75,8 +75,10 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_regs_t);
>  #define PMU_SAMPLE_PV      (1<<3) /* Sample from a PV guest */
>  
>  /*
> - * Architecture-specific information describing the state of the guest at
> - * the time of a PMU interrupt.
> + * Architecture-specific information describing state of the guest at
> + * the time of PMU interrupt.
> + * Even if the interrupt arrived while inside Xen, this will always contain
> + * the guest's state.
>   */
>  struct xen_pmu_arch_guest {

... this comment change, or yet more interesting, ...

> --- a/xen/include/public/pmu.h
> +++ b/xen/include/public/pmu.h
> @@ -148,7 +148,7 @@ struct xen_pmu_hv_stacktrace {
>      * arrives while in Xen.
>      * */
>      struct xen_pmu_arch_guest guest;
> -#define XEN_PMU_STACKTRACE_PAD 48
> +#define XEN_PMU_STACKTRACE_PAD 56
>      uint8_t pad2[XEN_PMU_STACKTRACE_PAD];
>  };

... this value in the public interface?

Jan

