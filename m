Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35831917D14
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748684.1156480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPP8-0000TR-QU; Wed, 26 Jun 2024 09:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748684.1156480; Wed, 26 Jun 2024 09:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPP8-0000QH-Lf; Wed, 26 Jun 2024 09:57:30 +0000
Received: by outflank-mailman (input) for mailman id 748684;
 Wed, 26 Jun 2024 09:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMPP7-0000QB-13
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:57:29 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ec9c3e7-33a2-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 11:57:27 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so72171851fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 02:57:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8d8091dc9sm1230678a91.53.2024.06.26.02.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 02:57:26 -0700 (PDT)
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
X-Inumbo-ID: 7ec9c3e7-33a2-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719395847; x=1720000647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N3vczh/MDS73IKdcjDeqjM+rc5bYV5Lpeh4SgTSwqY4=;
        b=b9Gwvsuw+2uiBdHPfYSi3e9Gu4HVqY8thfCQilK4uZ+JV2dY1h9+DtfFq6O4awsyNh
         nQG4pazhi5ZSjINcJLRNMJwL+rWqZ/of2UnXoMAPkklVVtNnYxFCv+9Cw6lIpU68yT/Q
         a9N/Dqkc++oT5u77G8I0xcskH/ZJCcSgsZVbH3KuYg5m/GyrCfYU4wzNWXYPvP9O9NPv
         sO8UQ4VVCo9HRln9PvafaWRfAs/dv327KaND6J12ZvhASvdrMJdMURtuutWQeTEAYMjH
         rkZZ9lNIaGNLgVMkcagRrVjSklKa1MpgQmyRYOkLn3iBaM8TX7CNYIhHzkcz+znB2rAj
         MFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719395847; x=1720000647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3vczh/MDS73IKdcjDeqjM+rc5bYV5Lpeh4SgTSwqY4=;
        b=YTy5LWOGw3ssSA7qcqcKwT2eHPoPwqsDz5/3eKESprhSS5jMW4yWusJkxmlPp9oqdE
         cqVqvmDB+gk/fYa4xLDsyx9sedtpML6j/Hz4fXuvk4s6oFc5vPRKJsI1NUC1j34UzDuq
         HuMUcnO2NpPOEB6DG7QCo1N4fdLuCVbMV0rUANq7KT4cNZ3HC+mE0iL0JEbNipv0pYII
         aPFNgy+phDF2zgn+5t6XSXOBh82tfgg4WSx9Tkm9oEZ3f/oexO3san4/7ln6gR+EE2La
         /yzF0XM6wIMknmQDqHfTsAQif/QsVs/L7ScTYqJv5zeb+qtUinkR/xuKaqhoAJ/2vZgU
         k6uA==
X-Forwarded-Encrypted: i=1; AJvYcCWwSsC8o+9qrrrlk5+VdW7oUmdVyXE785NQld3fOT4OGD81BnSXLjFUT1Lof7tzztJdw+EfXxGbmi2y7ew/NGohM2wR3Ptqxj0jg63mw78=
X-Gm-Message-State: AOJu0YyTfDcJZPeqAmoM60RQaNtYbIxDf7t+2ylskF4IImiFWoRd/keM
	JaFUZKTd3jSHGB835I7CCGpK2l6VGQlhy3lCJr5TOjJyopihP3TYYtDI4LQuWA==
X-Google-Smtp-Source: AGHT+IHhE5FZhWIfWXbrfML61WT5V1pjJGJP7MeitxmwtWhovQIKnHpDGObDPyhqq857DaHTu90vQg==
X-Received: by 2002:a2e:a17a:0:b0:2ec:42db:96a2 with SMTP id 38308e7fff4ca-2ec5b38b432mr57959711fa.29.1719395847206;
        Wed, 26 Jun 2024 02:57:27 -0700 (PDT)
Message-ID: <3899bc21-c6d5-4643-9c6d-4a01af37cfd6@suse.com>
Date: Wed, 26 Jun 2024 11:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 00/12] x86: address some violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719383180.git.federico.serafini@bugseng.com>
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
In-Reply-To: <cover.1719383180.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 11:27, Federico Serafini wrote:
> This patch series fixes a missing escape in a deviation and addresses some
> violations.
> 
> Federico Serafini (12):
>   automation/eclair: fix deviation of MISRA C Rule 16.3
>   x86/cpuid: use fallthrough pseudo keyword
>   x86/domctl: address a violation of MISRA C Rule 16.3
>   x86/vpmu: address violations of MISRA C Rule 16.3
>   x86/traps: address violations of MISRA C Rule 16.3
>   x86/mce: address violations of MISRA C Rule 16.3
>   x86/hvm: address violations of MISRA C Rule 16.3

Just a remark, no strict request to make further re-arrangements: Looks like
what was patch 11 in v2 was now folded into this patch. Yet then why were
other HVM parts left separate:

>   x86/vpt: address a violation of MISRA C Rule 16.3

This and ...

>   x86/mm: add defensive return
>   x86/mpparse: address a violation of MISRA C Rule 16.3
>   x86/vPIC: address a violation of MISRA C Rule 16.3
>   x86/vlapic: address a violation of MISRA C Rule 16.3

... these two. In general I'd expect splitting / keeping together to be
done consistently within a series, unless of course there's something that
wants keeping separate for other than purely mechanical reasons.

Jan

