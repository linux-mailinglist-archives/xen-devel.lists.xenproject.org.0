Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940DA6AA0E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922682.1326550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHyj-00035u-S2; Thu, 20 Mar 2025 15:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922682.1326550; Thu, 20 Mar 2025 15:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHyj-00034R-P8; Thu, 20 Mar 2025 15:38:41 +0000
Received: by outflank-mailman (input) for mailman id 922682;
 Thu, 20 Mar 2025 15:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvHyi-00033h-Hn
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:38:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64a44a44-05a1-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:38:38 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so8125385e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:38:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f55750sm53304375e9.21.2025.03.20.08.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:38:37 -0700 (PDT)
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
X-Inumbo-ID: 64a44a44-05a1-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742485118; x=1743089918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E0Lci+ECUilnN130JGQy/jV/GSrjNp8lwsMlq7ZZ150=;
        b=JJ7C7om9gws0GAXh5VYsVIliTB9vRF/l18ky3m7Lyz5dSBTIC9umn49Rqrn7cYEYN7
         W1eilZv4FmMxzFePSL8/L73eF0gc8J8CWLW8wYExkYjhR1drr7xlxufkk536O8c1yqGl
         kr1oD9R802F5pJCWPunozWo1+si+tmgxwptNsXMlFSTOOcI5FyTkhHbEnkj1CygjE5Eg
         JLkQZWZ0fMuG+cOWyEgcqKdy7PxtOOBKoYgH2y2jwsKOV4XN+VJ5HfmZxO/SQvuVqk1Z
         0PdRCBnJLUz+RD4OqzQVTsMzLrt2UvloYH6qDy47jvrP6ovUFBTkENDotn8dJWkUiiAZ
         Ovuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485118; x=1743089918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0Lci+ECUilnN130JGQy/jV/GSrjNp8lwsMlq7ZZ150=;
        b=Zi0BQnLGp6K/Sd0zDCN9I2GAI36pJBfrNixSta2xpZ6SRCZqp1nC1HMyKMQR7luU7n
         vNrZwMV7krib6njJ02WRqnQkGQ9Jx9WitEjacxvG/IZiqVzTKrVv5zFZDPm9xHogGYKR
         8k1eFfl5MmvKN7uj3dlcEkzz8vEzL7YSh3gDtPtX6KeW+AfbS5uSzeczIy8Tpp+1G6Sm
         wngbi0YOHZB7aiPOlwVYpL6FCznqiLas6+Qu867xGnvOV5PEKfMPa3MSvsgV46aUGaNk
         itbEasXmuam1Ah/DJhkHHtLaqjWPzKLxYgYe2rubetgySxir84lVDDbFYqGj1zNCk3nC
         Gndw==
X-Forwarded-Encrypted: i=1; AJvYcCXy72L4iQXOXlB2NfaED6h22G3GSKBVgMRyuQVBhIiye9MPlKtEYwml2bfcBYav/wsCjHttYNvlwLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxnJeSJyIKgm4X4REJ0vlFrFs/9Ak9ExjWkLthn155O2IRdH4q
	5RbFX7u1mHDuBbuAR+/6o/0SJP7mGkhs30C/A5h0U+yEj8Wu+rkYUbUn8CbTUw==
X-Gm-Gg: ASbGncsun+tT8NHr+gC3LwcGN87j+UHJGD2u3yqRjy7+0/hdKbhchpfT0+WFNNvYRyt
	34J+l+M4A+7t1sG1YBCveZt7pOlwoHAJY3RDgtAISd3EARsRlzc0cG7ozXh5W7/d1dXo/6Z6Xm6
	D8wyybXBX68hNzY1MpGAtLSjYSl7UBiGUpiAE/JCuC0wr65faZEc+IrE/hQ7KwoE5LjX4itRcZV
	prmICjp+cLkgl9WvqPFYEi5JYiBtn74QRb9DEGmhkdWzcU2iEmHtTQzc0AGLP1NlCSfLCi4vVdw
	w2NpTPdoqOGD6H0+U2FRF/0rpHTGO1hrVydjYctkd+E6rQQQdu9RbN1beQHPP5ogQVybkoit4aJ
	z5WTv2gpTUFACGd0hKCFmQDfry9l04670ROsIhNTg
X-Google-Smtp-Source: AGHT+IFsnJyVxtUWIf6hr4zEEimZ+UMjG5EBAW4/Jf4WNMg3qE2kK3IWR4ZtelwR6DYrxUuOnTuOvg==
X-Received: by 2002:a05:600c:1f8b:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-43d495abc53mr26314395e9.27.1742485117925;
        Thu, 20 Mar 2025 08:38:37 -0700 (PDT)
Message-ID: <4c3820ef-9d4b-4968-88c9-b6210de80b46@suse.com>
Date: Thu, 20 Mar 2025 16:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 3/4] x86:hvm: guard calls to nestedhvm routines
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
 <bd3edffaee9ecdccfbf35f70bf502a1fa00f36de.1742465624.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <bd3edffaee9ecdccfbf35f70bf502a1fa00f36de.1742465624.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2025 11:38, Sergiy Kibrik wrote:
> Check whether nested HVM is enabled for domain before calling nestedhvm_vcpu_*()
> and other not already guarded nestedhvm functions.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/hvm/hvm.c      | 6 ++++--
>  xen/arch/x86/hvm/svm/asid.c | 2 +-
>  xen/arch/x86/hvm/svm/svm.c  | 6 +++---
>  3 files changed, 8 insertions(+), 6 deletions(-)

Afaics common and VMX code have quite a few more references to
nestedhvm_vcpu_in_guestmode(), without nestedhvm_enabled(). Are they all
fine to keep as is, while the respective adjustments here are strictly
necessary? In fact I wonder whether (a) nestedhvm_vcpu_in_guestmode()
couldn't be made constant-false when nested is build-time disabled,
which ought to eliminate the need for those changes below. Or whether
(b) nestedhvm_vcpu_in_guestmode() wouldn't better include a
nestedhvm_enabled() check.

> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -30,7 +30,7 @@ void svm_asid_handle_vmrun(void)
>      struct vcpu *curr = current;
>      struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
>      struct hvm_vcpu_asid *p_asid =
> -        nestedhvm_vcpu_in_guestmode(curr)
> +        ( nestedhvm_enabled(curr->domain) && nestedhvm_vcpu_in_guestmode(curr) )

Nit: No blanks inside parentheses like these. (There's no real need for
parentheses here in the first place.)

Jan

