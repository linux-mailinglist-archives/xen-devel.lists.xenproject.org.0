Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B511E9020BC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737230.1143442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdYB-0006d0-QS; Mon, 10 Jun 2024 11:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737230.1143442; Mon, 10 Jun 2024 11:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdYB-0006ap-Nc; Mon, 10 Jun 2024 11:50:59 +0000
Received: by outflank-mailman (input) for mailman id 737230;
 Mon, 10 Jun 2024 11:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGdY9-0006af-Rp
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:50:57 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2651d89-271f-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 13:50:56 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a63359aaacaso659846766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:50:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f18bbf3cbsm186992666b.1.2024.06.10.04.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:50:55 -0700 (PDT)
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
X-Inumbo-ID: b2651d89-271f-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718020256; x=1718625056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O1ZGV3J5wNqgYc0jHVNgrLKV8UB8hbRxEYdcXlor08c=;
        b=H/1qHww14YKYnYJaS2lHqDknegCHZrrM1OL3/ns7fhk34ZfGH93GWrw8xOXBD0D+i9
         Zl50SLOIzu0MUKSsIwcbTDlNiwD26eBoVMt8yLVl8rkFw6EDcwx5iWI/MjLA7QBxplWI
         iHTbXd29Mb+rB4tdHNqajnyi74M+7NuTz7r0HqeMaG/HL1Q/lHd1xX1xaEPru7lgaZ72
         +j1EdfL0ZY9IzyTJUNxrieTWi/jZ7WAbqn+jNeT+nv/mK5eKK1C+at1TZYHIwWL367Se
         Y+8TBPcUNIlfe+31nHahs9S7zjQFbPNpE6rXp5G23AXvbGY+VrE9t2qHJSbU2SmKqPuW
         EMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718020256; x=1718625056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1ZGV3J5wNqgYc0jHVNgrLKV8UB8hbRxEYdcXlor08c=;
        b=O+kCiSwoRfyn1c6QLIDUIzbAnYhFUFWW+xn9q0KsBXwE6TzsmZL7h+6nkZ+8u23ZVS
         jg0F76NatI4C401mC4WCGsv0BCbbMMFvg9lKStNII1vM60Kko2KM5LxrstRyj7r7xit0
         3NacybK2tHNmaWqsB+2wOEg9PWjyAzF3uep9aix96Ga6hrr58r8f1oRrr/ftU5y7PDae
         vlGkcW3o/F0+GJB91Q7OvN0l5dfTdHDR8IDs6YDOYVowkmxe6mehZYf6QoAH1bKzxBE+
         8WWyIWy9TeGE5DQMIe6ntAE+fZ9hJsVikX/wvV0JNPKKiPmPzsEDlhpDYEaU6Xtsg80U
         /eRA==
X-Forwarded-Encrypted: i=1; AJvYcCX+JtUKz8cehel88wRjL0dL0F1wWKYUhI0RK5sxv4M8LoqG1oYClvMjJwSZvsZPgwQ1cPR3ZHG3Oe8CMXmHkoZqhdBfm5ZWadHQAcBGWLg=
X-Gm-Message-State: AOJu0Ywb0nDx5D6Dt6w+hwp6Dch0Pgc0FoF6rXxh6zIL1QNUoNtC8BnK
	8+v+YBE5Q88v+dQH9Kd52/o2MfTI4Kr1rzeXQu2SR5YYjLvC8YZu+NdRKHzLcw==
X-Google-Smtp-Source: AGHT+IHZDj9HvAgwD3EhGOx8JG0inz+TWItul4SQrZOUiGN4ZvOltlajhKqfHyft/8tAZPI4Zpf2sQ==
X-Received: by 2002:a17:907:7748:b0:a6f:15f5:261e with SMTP id a640c23a62f3a-a6f15f52770mr221409066b.7.1718020255704;
        Mon, 10 Jun 2024 04:50:55 -0700 (PDT)
Message-ID: <c86a4b33-7c35-4b1f-8d02-2431decf5140@suse.com>
Date: Mon, 10 Jun 2024 13:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 01/16] x86: introduce AMD-V and Intel VT-x Kconfig
 options
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <72439ab1749b4bdca3c74a7d2af0254d23626797.1717410850.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <72439ab1749b4bdca3c74a7d2af0254d23626797.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:07, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Introduce two new Kconfig options, SVM and VMX, to allow code
> specific to each virtualization technology to be separated and, when not
> required, stripped.
> CONFIG_SVM will be used to enable virtual machine extensions on platforms that
> implement the AMD Virtualization Technology (AMD-V).
> CONFIG_VMX will be used to enable virtual machine extensions on platforms that
> implement the Intel Virtualization Technology (Intel VT-x).
> 
> Both features depend on HVM support.
> 
> Since, at this point, disabling any of them would cause Xen to not compile,
> the options are enabled by default if HVM and are not selectable by the user.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Yet to clarify - my question as to ...

> changes in v1:
>  - change kconfig option name AMD_SVM/INTEL_VMX -> SVM/VMX

... undoing this still remains.

Jan

