Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C98C8867C0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 09:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696692.1087799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZpp-0007N7-HK; Fri, 22 Mar 2024 08:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696692.1087799; Fri, 22 Mar 2024 08:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZpp-0007LZ-Ee; Fri, 22 Mar 2024 08:01:05 +0000
Received: by outflank-mailman (input) for mailman id 696692;
 Fri, 22 Mar 2024 08:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnZpn-0007LT-7y
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 08:01:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 537b7f26-e822-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 09:01:02 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a471f77bf8eso123320766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 01:01:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x19-20020a170906299300b00a46a2ac0dbasm728592eje.197.2024.03.22.01.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 01:01:01 -0700 (PDT)
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
X-Inumbo-ID: 537b7f26-e822-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711094462; x=1711699262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qtQH0sSUATxal0L789QdEHYXyPfcvXqfHEhjx3+QjU=;
        b=Lm6nRmHkHvc2n6+UIzj+zC90rUa/DqtMibbIuKni784R80N75Z5Zv3W8jokBYqFBN1
         Bdq65fO+Gcl4f7aLQuHUA3OZ0r0LHbzi4dWBNsNaIk7GwdNGKhp4VewjUhWOnGnXeFsH
         TtkdHmW5uGfQYqsliuECyij026veq2H/p50CztMAdYXAlamaeQtPkUTKAAmBvMws2CsR
         MB9Klx8bAuu64S7N8/UIOpIj37RqpPht4Be/pDXIVHaNS8w/7AnMrrIo9Dlje6sV19XR
         HdileNeou91Tm1zIvgmyDDJ/KzaGL6X8TJMqn42Y1yt4IQbfyBCNbOFojOUWDFD7/QGs
         jPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711094462; x=1711699262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qtQH0sSUATxal0L789QdEHYXyPfcvXqfHEhjx3+QjU=;
        b=om6X1vTpSyJl5KTOPgmnzF1rTWjv/+4MGLYZfv+KMIF3ffscG0IfLj2W9IXc0NJfb2
         KUGKylk/5PM75h/bYPwXFj3qpyAcfblSRgFJkj0sS3HZCf5y8T8mw2ks5NQJ3wb/NBDO
         22rhDWpzmiLhGYVVPHZteFdOAK+OZW7QV9YEmRFFJTfxLHzXtBFUxQrhPAY+JoJMIGUK
         XPk4ZUgQ7FFeOre0DQ/2IrPyqucPbVkHrdl7GtqsYUeEWoca7STE28ihVlOagUxe5byK
         37h1ZIpPf4R/g7IAtEyil+MBXCpZ4ohh2ElSk103JGW6oiln+dqEG9ewic8rtKhb3+FV
         q4vw==
X-Forwarded-Encrypted: i=1; AJvYcCXWgBBvABwwIVM6KIuDxEWo1AJqjZupnkP2fEZQ89UHgVz60VEszBu+2kUg9EWy2tbPaN5R8x2skWXbcPyqtZRt1457jqc7Nqu5AyM1VYU=
X-Gm-Message-State: AOJu0YxrLv9jMveTOkrJmBLvwZQWVA6WxM81EYVaabXXjV2FZ//dUK/z
	3OI2D0szITLL6lmYETVfrpBXCrfu3iT6NbzSa5JMZfwc3Wz8lhwb8nrjTeDNqw==
X-Google-Smtp-Source: AGHT+IE6+WUqQQ5bKRNRF05eTh6gNQuJnXZx3CkNfXarpaR0WUCXMaBx++LNXEkUDG1/lo2iaXjJMQ==
X-Received: by 2002:a17:906:af0f:b0:a46:8d95:ff7e with SMTP id lx15-20020a170906af0f00b00a468d95ff7emr1156462ejb.21.1711094461866;
        Fri, 22 Mar 2024 01:01:01 -0700 (PDT)
Message-ID: <3a98757d-998e-4731-a508-5e7e1fc5aef2@suse.com>
Date: Fri, 22 Mar 2024 09:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] EFI: Introduce inline stub for efi_enabled on !X86
 && !ARM
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <39069a589f9c4dc0db9b01b7412c1a99bea55f37.1710443965.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <39069a589f9c4dc0db9b01b7412c1a99bea55f37.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:15, Shawn Anastasio wrote:
> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -31,7 +31,15 @@ union compat_pf_efi_info;
>  struct xenpf_efi_runtime_call;
>  struct compat_pf_efi_runtime_call;
>  
> +#if defined(CONFIG_X86) || defined(CONFIG_ARM)
>  bool efi_enabled(unsigned int feature);
> +#else
> +static inline bool efi_enabled(unsigned int feature)
> +{
> +    return false;
> +}
> +#endif

While fine as is for now, surely Arm32 could benefit from the inline stub,
too.

Jan

