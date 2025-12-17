Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02BCC7710
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 12:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188754.1509843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVq5T-0003pe-Tf; Wed, 17 Dec 2025 11:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188754.1509843; Wed, 17 Dec 2025 11:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVq5T-0003nj-Px; Wed, 17 Dec 2025 11:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1188754;
 Wed, 17 Dec 2025 11:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVq5S-0003nd-G2
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 11:52:58 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed880261-db3e-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 12:52:57 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so35239235e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 03:52:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310adad05fsm4527733f8f.15.2025.12.17.03.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 03:52:55 -0800 (PST)
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
X-Inumbo-ID: ed880261-db3e-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765972376; x=1766577176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0ou3kxIONaPFk49o97USYmmnLAgtXYZYe3XywDJLius=;
        b=cBfE2ul7MBkiYYLTtC1gQc996rXzBBoy/HcQZI1avQAjm6uhbq054apPKAbh3xL863
         aScHF2d3ctR++H6SRqefshF+mShIXAxdOSJN99qm+9LTuPDKX/zd+/uFKpK/BmPjb8bA
         swUH74yt89fs5tvtdpJRbBbpSSPlOoI0TTiEc7uQiN0LiWcvtqoXL8N5gqcgR0ehB23V
         15avPjT8Gi0RcCPiL+x1iw0wAwheaY7AWD6sYNf4z3XtC7P5J2eHmfEfdItBe5q5Ljlk
         DmIgpcOF1l5baZqJ/2dpjlFWnzwNR1FVvAYNv6rRnlKG8vVxQ4gZILlbDNcS6qOz77yZ
         dDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765972376; x=1766577176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ou3kxIONaPFk49o97USYmmnLAgtXYZYe3XywDJLius=;
        b=pA7/ywJ7v8sSjCRjB7kTTTyVNrjOHQAlG42QcBFUQPI5iKI8vymdgLyrp9wRHbwUSN
         oyqLMZf+x2ObrOsGabDn/oNWbHv10O/oWe4dHWflsfmYGuOCs4PkHO1mzm6Vneqv6a6a
         T6yy/xVYb9nraIckhR0N5vRetgFxjJu49UUr8n4wrJrUd4MkiP9WI/2aVZNdcjjUo8gE
         rcJtqk5wh3hfntmC+BvaVvEf+r3Pc3Gz1vKN6z8XT1FFsbcYQ0jjbprUAjsZOZ5YhIyd
         hJ5O8aRwej02XwclMLuQOzUHyOeWc06hSJBB2Ej2LwYpr4ARhRvILnlOinLx4vD9MgRk
         LGBA==
X-Forwarded-Encrypted: i=1; AJvYcCWiZ6AecixhWRGI7c5i8NTybvnI1t74jbP/9UDqi4S59G7Vg9ynFSp5+5zYYNtqQUruOgzYKACluSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz395LtL/YCwEjUKwNx+H9iSJG4UMRUEej4QiEjATvWkmuZV0Fa
	RYGDvKHIb+4vqYn1+tAKOvk1CoSQsIL5ttumtSPmCv8LOp8oaOrU10yqrmZeN8K/sw==
X-Gm-Gg: AY/fxX6zGpXbTeHHonVZFepE29Xog4+3+h45w3ScWcY9mityUCsWEDwXx3VCWI898zf
	W93R4b74whf1zNcNQ1R7JTEwkOs51l8wwSMQRX7VPOfGTPwrxZmZ/5uR966TthgSu+9FOmjug3V
	9A1rYWLLHrfMGh4QG7ME7yMKZgN7HHIIzIC7RE7ws1qIO+3H3ar25h4Z3mwYa+i0RUmORea72lw
	r9g3eEleCD42YJqFl4tmqjL46cL4H5AEVTuWqwEGerSNGRvZgHhBSOiNq5qa5qWJpViyNusQeEJ
	jkGVkIMy1JbNQlObW7XAaAAuOjAGdgP6jAyvHTzSdxsFU7qzKdTqEOvIipyJIUqE3epPVH9+xCR
	i1jF2wVU3COLQX2gzlzz5ISSnSrlH4vzlrRuJXK3XvZfMpeSQ58mInZWOacrGdL+PUPELxMAtuQ
	8YwmaPzCf7GQDc5ziqwH8hI/yH8qauwMlGySNemMFaDAdqT4IZckf9yb1wDssSKK8YnSwsMyqj+
	kk=
X-Google-Smtp-Source: AGHT+IHSJpgIEc3RFN0DkHSOnU6TaU6ykzSU6NBCYIV34ON4CBbA+kWTzen3IBUKm7X6wwFsoboLKw==
X-Received: by 2002:a05:6000:4287:b0:430:fdfc:7dde with SMTP id ffacd0b85a97d-430fdfc810fmr9699747f8f.36.1765972376203;
        Wed, 17 Dec 2025 03:52:56 -0800 (PST)
Message-ID: <f8a9be3a-a0c6-496a-806f-40760dca5aee@suse.com>
Date: Wed, 17 Dec 2025 12:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move alloc/free_vcpu_struct() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <5f75053750a9fca2b5fecf1dcf6f097b25e8f27f.1765967934.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5f75053750a9fca2b5fecf1dcf6f097b25e8f27f.1765967934.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2025 11:53, Oleksii Kurochko wrote:
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -15,6 +15,10 @@ struct guest_area {
>  
>  #include <asm/domain.h>
>  
> +#ifndef MAX_PAGES_PER_VCPU
> +#define MAX_PAGES_PER_VCPU 1
> +#endif

In addition to what Andrew has said, I'd like to mention that this is also
a pretty ambiguous name. It can really mean about anything vCPU-ish, when
it's specifically about struct vcpu. But as Andrew said, preferably we
would get away without such a constant altogether.

Jan

