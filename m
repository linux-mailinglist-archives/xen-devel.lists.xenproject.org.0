Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582D98A96C6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 11:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708170.1106817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOSJ-0000MJ-Oy; Thu, 18 Apr 2024 09:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708170.1106817; Thu, 18 Apr 2024 09:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOSJ-0000Ko-LP; Thu, 18 Apr 2024 09:53:23 +0000
Received: by outflank-mailman (input) for mailman id 708170;
 Thu, 18 Apr 2024 09:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxOSI-0000Ki-J4
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 09:53:22 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cd1ff65-fd69-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 11:53:20 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5194cebd6caso762293e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 02:53:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bl28-20020adfe25c000000b00346bb778e8bsm1431519wrb.5.2024.04.18.02.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:53:19 -0700 (PDT)
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
X-Inumbo-ID: 7cd1ff65-fd69-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713434000; x=1714038800; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVimCs6r9BqJJcB1Thmw0iqO5UAo1fiEaWngHlO6jl4=;
        b=K4piUTMPwRzaoHHg3s6i1m6+ZVLXccLQSUCrxn/XKLA7KmXyUx/OUEs8QeyGDO3pb/
         MJjTe9NwQWi6oz1eDE8w3ydmptdmD9mAOFAIoAZE4yBQlIYCX++vJNSV2Bq1/TNkmBli
         UoWoF0mva2fDnm3hbeaI1RYA66GC0cH4HTRZoAeybbJ26btTgvrPSRFXiDzxdXhsoAZQ
         GYZqP3MzaofOed+ppEh9QqbjB9ukOulBQQwH2IqcgJNmspl3QLIaTUzLwkR2buB7JqbT
         u5MLN86D6IJp0MHf6/WmsRKCWCM4+38fVsuqdJ9FURxX91ifk61sP4DjcsJRLdq9x7tf
         rd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713434000; x=1714038800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVimCs6r9BqJJcB1Thmw0iqO5UAo1fiEaWngHlO6jl4=;
        b=A9VqYUBGSEIgpn/rfxZlLUreOoQJSnn1dyyNhdA0ESuWVpmGrrW5nZb7ATIwq2M6+V
         e9qR9puxonN7lParQAH1PbX6bVBcV92fDbJquLiNY/WAjnTU+yTHQFYCoCRBiMlqZrHn
         hD7/06MrUaZ9oPuYqd809tppieSa7yjsALksDpz+3dOurhKuvX8KmFaq5A/j/jVt92qT
         KIw9zNNH+EqNnSW9G31z3A9PY+68sLeS7xJGruJI543wMPtJot4mBWhmVphyH8nwNtDm
         sySMHDjILpwUbeVFNYEIe3pmMWnocMiT/RSFi+UlJvS5pvjcQOlu8TCnjyZWzht9ZO0X
         dADw==
X-Forwarded-Encrypted: i=1; AJvYcCUb5FdxlUXB0qPcADsBjmDWiyY1yE9A9rxG8SWRHod9tlBtt8iEKRWd4bBybs1r4Kj6vYn7pfUfSjcSDuLfAQ5gBFkf9YoeMGTqn0MPpnc=
X-Gm-Message-State: AOJu0YxtjxSHDS9kvhS05SWtjL2K1IkAez/fw5i5rbafjKJXzGiafH2t
	hq9bsPk6jvLBknJ37hbp3+NpQKlODhlPiByAAYVEhky9k3apEjkRywhyoYwrzw==
X-Google-Smtp-Source: AGHT+IHXSdUNSuxKT+jKROsxgow2aSoz+NKatZ55hxS+01uehnxR9pR5PCe4bb2sCxtAZ8I8HtrBmQ==
X-Received: by 2002:a19:ca02:0:b0:518:96b5:f2cc with SMTP id a2-20020a19ca02000000b0051896b5f2ccmr1102616lfg.55.1713433999765;
        Thu, 18 Apr 2024 02:53:19 -0700 (PDT)
Message-ID: <12adc492-aad0-4971-b744-e6dee87630ac@suse.com>
Date: Thu, 18 Apr 2024 11:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs/misra: add R21.6 R21.14 R21.15 R21.16
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 21:27, Stefano Stabellini wrote:
> Also add two specific project-wide deviations for R21.6 and R21.15.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 32b02905d1..9123c8edb5 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -387,6 +387,22 @@ Deviations related to MISRA C:2012 Rules:
>         of the Rule due to uses of this macro.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R21.6
> +     - The use of snprintf() and vsnprintf() is justifiable as, despite
> +       the fact that such functions have the same names of the
> +       corresponding standard library functions, each configuration of
> +       Xen has a unique implementation for them; the code implementing
> +       such functions is subject to the analysis, so that any undefined
> +       or unspecified behavior associated to them falls under the
> +       responsibility of other MISRA guidelines

Checking the Misra spec, I'm actually surprised a deviation is needed. The
rule's rationale talks about streams and file I/O only. Why would the string
formatting functions be covered then at all? They also don't have, afaik,
any undefined or implementation defined behavior.

> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R21.15
> +     - The use of void* arguments is justifiable as the rationale for
> +       the rule is to indicate possible mistakes, and void* is
> +       frequently used in Xen to represent virtual memory addresses

But that doesn't rule out mistakes. Are there actually examples in the
code base?

Additionally I wonder (a) whether the rule actually needs an exception
and thus (b) whether the deviation isn't instead for 21.16. As to (a) I
understand the rule is worded slightly differently than what would
strictly be needed to permit void*, but the general rule in C is that
void* is compatible with all other pointers (suitably qualified as
needed, of course) anyway.

Jan

