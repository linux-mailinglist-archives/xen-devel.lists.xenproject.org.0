Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A368A22E0F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879590.1289804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUrH-0004Vf-Pf; Thu, 30 Jan 2025 13:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879590.1289804; Thu, 30 Jan 2025 13:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUrH-0004UC-Mm; Thu, 30 Jan 2025 13:45:27 +0000
Received: by outflank-mailman (input) for mailman id 879590;
 Thu, 30 Jan 2025 13:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUrG-0004U6-Q2
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:45:26 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 757d8da6-df10-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 14:45:25 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d96944401dso1371204a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:45:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724045e5sm1100802a12.37.2025.01.30.05.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:45:24 -0800 (PST)
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
X-Inumbo-ID: 757d8da6-df10-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738244725; x=1738849525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dDs+c5r+1qJQcbILWROriYzFnh4iRG1G/YVXdd/RsZA=;
        b=hEViOhYHV531DuG1PvFlp9oVQgzU+BoR4PayEfWfej4KmlNcvgMU95f9LXKzdRGzAr
         L1SBh5P/GQ2eVyedB/yCIMsIrwfLdtelsOalaMRbGGyn9628yUqnA1Rcs1nYUQzVhp4m
         2AvrGYqt9t6OlGseh8A2p5n094Bu6erWQAzZUwre09FY/3LucDG9tiVsunzZ355G1PZM
         Au2u+Os0cQZc1hB/sZLg2XWle43prKpZ+dUALTSJhN1YqGwqnGfk9aB/gM+RTXChcac4
         VyXZnlr43nfgdfqFinbJTpb63BNwW7+29va2Y1x0r4DbavUqeq7KgldktqO309s4ySum
         03Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738244725; x=1738849525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDs+c5r+1qJQcbILWROriYzFnh4iRG1G/YVXdd/RsZA=;
        b=OoPKj9vrRoXPlh4CZG0f1Ep016gduV3ibaakddxbof2V98jlaEtbpwOycfH+EFQBaq
         Ibv5tu0XpMs3uis6aEknmJHSifJxPi8e4p7VHQl51bMf3IY567DXb/i4Zonq28KAPXX1
         Nfb4fZo3FGri6BVcHlG+yk8fDctxBuKFvyOzwGBf9gSvMGIS9ugDBjEGK7SG3UGR6e9X
         JAHpgGfFYst6Vb4DCREwIO+5Pwm/kgqDzhOtR2+r+yypzuLRqYBONPikuP/YRzeKZZdO
         jIA8lJfM+aCWp5ThXbAHEexh+DDyXw2SuoiqsCJzgt/Nr3655GwKu+PiSkNanw23yCNr
         U1zA==
X-Forwarded-Encrypted: i=1; AJvYcCU5JOmanFXvVV8Jo74yUsUulxKvTtJhYv7xObUKLzndlBPQ6OM+5fzhcRea12/goa9CD3nJmFKJunY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/OcuRlU2F3depvOMdw7WqIYNYBA2k8y5X6QVMt7qq09TohDNY
	KVPrUMbTukcND1qFqghJMAYmPi8TY3h9vOnzNDX2buo1qVa5jvVvcCLUpWWYfg==
X-Gm-Gg: ASbGncu+MetbCc9LUVYHTbv8QWgJf61LIA5QGNMko0s7PnaVqsii80vQQEStXGICjh4
	r/eZwwg7dLfVEiKFj9rSOhqc8IHPm0T/ZxYSZ/hxo+a5TkJmQFiaaBiH8o9SjC2OrhO8OSfl3Lo
	yn6cAoNwp+KqeJ4duFOsD+MBtYMLxbQMiV+i+Kg9bKZoKbAs2CW75qvmQ+PUxqNjD7Y3NdfxIRA
	LHf+PUy64Q73YJ/OGxcIKQNEiJrn1V0XNYZROJ265Teeo7KSuT4pm5CEGiKDnu93+Yw2hwFdQTK
	CtUPq86XRvTp11dCADcya+BQ7rkOR+n3w5LGxNi8hsKxJuTWgpQhC62Zs0j4X1PVm5UIZHNtpSX
	b
X-Google-Smtp-Source: AGHT+IGptZ5pGgjW8lLTJvqpZ+K8U4xsJHcPkZ+zmOvXk4Fmf2l6+/tLA41IxZATvgot7gU5CYQe9A==
X-Received: by 2002:a05:6402:1ec9:b0:5d0:e410:468b with SMTP id 4fb4d7f45d1cf-5dc5efa8adamr6274258a12.2.1738244725159;
        Thu, 30 Jan 2025 05:45:25 -0800 (PST)
Message-ID: <2e02b7d6-fe71-4ed8-a09d-5bde7438718c@suse.com>
Date: Thu, 30 Jan 2025 14:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-2-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> @@ -596,9 +597,10 @@ int __init dom0_setup_permissions(struct domain *d)
>      return rc;
>  }
>  
> -int __init construct_dom0(struct boot_info *bi, struct domain *d)
> +int __init construct_dom0(struct boot_domain *bd)

Pointer-to-const? Domain construction should only be consuming data
supplied, I expect.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootdomain.h

Maybe boot-domain.h? Or was that suggested before and discarded for
whatever reason?

> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2024 Apertus Solutions, LLC
> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> + */
> +
> +#ifndef __XEN_X86_BOOTDOMAIN_H__
> +#define __XEN_X86_BOOTDOMAIN_H__
> +
> +struct boot_domain {
> +    struct boot_module *kernel;
> +    struct boot_module *ramdisk;

"ramdisk" is Linux-centric, I think. Can we name this more generically?
"module" perhaps, despite it then being the same name as we use for the
modules Xen is passed?

Also, are consumers of this struct supposed to be able to modify what
the pointers point to? I'd expect they aren't, in which case const will
want adding here, too.

Jan

