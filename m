Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE96A136FA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 10:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873411.1284376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMWo-0002hx-AB; Thu, 16 Jan 2025 09:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873411.1284376; Thu, 16 Jan 2025 09:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMWo-0002f9-6w; Thu, 16 Jan 2025 09:51:06 +0000
Received: by outflank-mailman (input) for mailman id 873411;
 Thu, 16 Jan 2025 09:51:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tYMWm-0002dP-Ut
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 09:51:04 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66420048-d3ef-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 10:51:03 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so6230375e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 01:51:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7499942sm52962605e9.6.2025.01.16.01.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 01:51:03 -0800 (PST)
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
X-Inumbo-ID: 66420048-d3ef-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737021063; x=1737625863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Q2TkjmnTaEB5x8Xl171g0+JkKKOeL7dJhCQLqhZYRE=;
        b=hG9OvHCCVAS1iefrlTlY9Cda3iaz4Fo5oUCZH2Lh+unqknvL3SyZy3p+9+fjeyMCoX
         rimFtsoxX2tUDQfCvITdrzgkFOdsIxwPFB0DVDMsjSGFhYeBrbL19l/bGJWjoUSEswUH
         o7GPhkiy0b4d8pjhvHvfh7pKEVZ5WoXnGlFxWVoD5XZ7mq5Ze7CRol0DabULNkrxCh3U
         4jbbnhaBQ2TDqxiGqYM2BPXITPulJ+f/RXv7X8XzOOmnl5EXABsjGXxclQnxBKWj+nrI
         ADtgDw/zQ4hHkXgtV756HvBafx1uLhWi1J8I4DY2ZMkdhXqKrUgbNdQW9WxWVMW8QjB0
         BiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737021063; x=1737625863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Q2TkjmnTaEB5x8Xl171g0+JkKKOeL7dJhCQLqhZYRE=;
        b=MuB94ZW0VTvAE/ROAKNiuSgyOztsGZPhv0GHowE2TD0Z9+Ch5kgaN133RW5viGq8u1
         M5M10UjXzNkoTxFJ3n5BjQFS867C5CmiYt3u/IOfmrjNc2dd3ggSUUvdKYValRK/aBZq
         8qsO6ifUUndVklDgVcv4KUFwMC2Sjh8xBcsKNl1OYmDS3uYqHt3lvlu1/po17ipkn2Y/
         unVpUMU1drepO8lIZkX33ZNyr2bSVH3fV8dPPhKjvSwu9FVG90c6gAdgR0vTv+k7K5qr
         HjMjM2p1sEQHvfFhuVn290aYmIysd0pwRwtByRbAod+kx9+E7In0hDZ8r5fJc39Zqpp0
         ybrw==
X-Forwarded-Encrypted: i=1; AJvYcCXeP0cF1FFxAVX7tihSk1oWd4++1f7T/040CuHDICJxp+zMCFsdD/coAd9ZquBJlVPapCGQFTBtPfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwI29nOWYAjdYX1PFTlAGDzC0F8fO5PverWIJq0EivikNJLLpza
	N7uWLq6tte9hIjjpdfcRwMUGLpHWNM9J8iXPSnucOW8w+0WtnQwGRImK4TjAqA==
X-Gm-Gg: ASbGncth+TdcKo8ZQkGxM8PKi+Uj9OHIUpnN+qaLV6SDnvduIlwSYlt3uuuk//jYjPz
	vWqN+IV4ozvDBD+Q/FwkudV92MjT0BavH9YOzQ40Wo8x0T0BClutAp7yz3finMJqvbog6qeAM2Z
	m0dItlHCZs0r1xUQrxtVWhXChox1eSr6CiSRTK6YcrRJXyR3lHK3CByRwUmrejwFN4VQZSZtNom
	jUpQXiaGKDXcoIssxs7/PN3amM6rORmM457L7nV6+Ssb8qtVlwqlYKW4ygmMuGoXqnQwGKxymEH
	Nt2otl+ymZo2Fzkzu8fyvPHGk9c4kHwHP6lisMbj4g==
X-Google-Smtp-Source: AGHT+IEnNZLOrVVu69pYB6p5VD9Sv8RPKa9TAefsGgjmEy4icwJqKrArwoufuE3pCxDJZiK350Uflg==
X-Received: by 2002:a05:600c:4e8c:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-436e271d355mr299560085e9.29.1737021063311;
        Thu, 16 Jan 2025 01:51:03 -0800 (PST)
Message-ID: <d90e5496-cccf-4670-8332-8d2e5f482c5e@suse.com>
Date: Thu, 16 Jan 2025 10:51:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/misra: Document ECLAIR extension to Rule 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <77354513a986a14c37ec2dfc45cf3534b08b5e85.1736972547.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <77354513a986a14c37ec2dfc45cf3534b08b5e85.1736972547.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2025 10:31, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states:
> "Expressions resulting from the expansion of macro parameters shall
> be enclosed in parentheses".
> 
> Document the behaviour of ECLAIR with respect to the CPP extension
> that allows variable macro arguments to be named.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  docs/misra/rules.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index e7763795b826..13890f6d8852 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -671,7 +671,14 @@ maintainers if you want to suggest a change.
>         shall be enclosed in parentheses
>       - Extra parentheses are not required when macro parameters are used
>         as function arguments, as macro arguments, array indices, lhs in
> -       assignments or as initializers in initalizer lists.
> +       assignments or as initializers in initalizer lists. In addition,
> +       the use of a named variable argument in a macro that would constitute
> +       a violation of the rule is allowed by ECLAIR as an extension of the
> +       MISRA, since it may not always be possible to parenthesize such

Just one nit / question (addressable while committing, if desired): I
wouldn't have expected "the" before "MISRA". Is that conventional wording
in your environment?

Jan

> +       argument and the feature is non-standard::
> +
> +         #define M(args...) args
> +         #if M(1) + 0 
>  
>     * - `Rule 20.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_09.c>`_
>       - Required


