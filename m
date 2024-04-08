Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1989B975
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701790.1096300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjsb-0000kw-FR; Mon, 08 Apr 2024 07:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701790.1096300; Mon, 08 Apr 2024 07:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjsb-0000iP-CM; Mon, 08 Apr 2024 07:57:25 +0000
Received: by outflank-mailman (input) for mailman id 701790;
 Mon, 08 Apr 2024 07:57:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtjsa-0000iH-6h
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:57:24 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1cf0ed1-f57d-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 09:57:23 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41649860cecso7531955e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:57:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5242000000b00343c0c24a65sm8289967wrc.89.2024.04.08.00.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:57:22 -0700 (PDT)
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
X-Inumbo-ID: a1cf0ed1-f57d-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712563042; x=1713167842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0U6uGsQnyCGZxhahGWduclr/9yFqdTBMMRYXgEzuy0=;
        b=DmusSA+m7rYaSNcJJWTOnFJ1riBlXfSa90p13L04exepxFu6rdOp0NK3OWRd0D7G8O
         GV45l7/RoQjP8us9NV6pkgOtP7Bzu+7o9w+1XxVWgxtImxfeeWLULaem8qilxUO1qWbc
         AQ1CzX+puE7dnISedyboCc5lZPJ1JIw67MK1P1ScCljNL71Z14TsvkFmwgdkIdlDWSKo
         qHHa6YJ/AMF0UPup3dHLD+lpMZklCV0eYsNj9rFCQer5u7ZqpIwJhGNFr6fKsWrRasz8
         s/farVJ22K3h1ZOCkezUkhHP7FbhIhiIGHfoygTzPksN+EpbNpHeeLq2J6Vgiw8aRAC+
         KPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563042; x=1713167842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0U6uGsQnyCGZxhahGWduclr/9yFqdTBMMRYXgEzuy0=;
        b=i56afIfdA/OaDKZlbMcDw6TmL99Jp89w25Ej7qNsWxJ/YxUxujdPPryVYnQaT6ezK1
         G2nUVE34lUTYnRZoGxn2uEbnsaz0b522O4IrRF4Kt4aeiu58c8WOC1JcRHIGtWtJUy1o
         +CajMzUS5exd98iIQwYpSbhyV3hcPYbACtjiPgO9UZONtpu0uwfTT2XOBrtwhl/QkAkw
         33tUPS4V7OeJ29y4irBdkQRdy/eYlWwH6OJVqc0DvcqA/uXh2b79qXjdxyzQ0oT9jUp7
         BU2lH1aPEtf+VUlWIYRNup0tiQLw5W6m4sKcggZNmvmf1xjipJOTpwb4wKX8PJXsz1FA
         9NKA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4RXIC0GrjVgyJl985X19Q1eJz6lABFFgU9KTRnepqKwLr1o5iYlWy9Ei22+RAvlaXYc5REhempB350GTmomqONpEK+/KVgDF70YsIYM=
X-Gm-Message-State: AOJu0Yx+5XzXoCN9Z6nXLviCei54+po3EGi3GZiMJKHGe5yV98bBRajm
	eXlRgL+zMLBWFV/vas6ItTYw6av5mCfMV6m02UgXJA/lzKBs7f6wsP95ccwi+A==
X-Google-Smtp-Source: AGHT+IGD8Cy7T+o75LFbO+cb/X2dlt44C7YZ/zk3zGLHhfLUh3fZ0Ct9FwLKWsP5rMtJJwXaIDYciw==
X-Received: by 2002:a05:600c:4ece:b0:416:3478:658c with SMTP id g14-20020a05600c4ece00b004163478658cmr4712228wmq.27.1712563042509;
        Mon, 08 Apr 2024 00:57:22 -0700 (PDT)
Message-ID: <1ed00b0a-2aa3-4ab4-b483-e6fd6ed2cd9e@suse.com>
Date: Mon, 8 Apr 2024 09:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 6/9] x86/hvm: address violations of MISRA C Rule
 16.2
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <165d61fab77c0b6613b78e0091195753fe9cd2cc.1712305581.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <165d61fab77c0b6613b78e0091195753fe9cd2cc.1712305581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 11:14, Nicola Vetrini wrote:
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -119,12 +119,12 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>              (mode == 8 ? regs->rdi : regs->ebx) == HVMOP_guest_request_vm_event )
>              break;
>  
> -        if ( unlikely(hvm_get_cpl(curr)) )
> -        {
> +        if ( !unlikely(hvm_get_cpl(curr)) )

likely() / unlikely() want to be the outermost part of a conditional
like this (things are different with && or ||), i.e.

        if ( likely(!hvm_get_cpl(curr)) )

Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

