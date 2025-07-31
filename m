Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E03B1741C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065834.1431145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVW6-00060e-Q0; Thu, 31 Jul 2025 15:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065834.1431145; Thu, 31 Jul 2025 15:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVW6-0005yF-LI; Thu, 31 Jul 2025 15:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1065834;
 Thu, 31 Jul 2025 15:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhVW5-0005y9-Dh
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:48:25 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cacfb614-6e25-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:48:24 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso696261f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:48:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfe539dsm1954409b3a.122.2025.07.31.08.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:48:21 -0700 (PDT)
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
X-Inumbo-ID: cacfb614-6e25-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753976904; x=1754581704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G/MEa9DkjFXY0vTnxN5wQ1ixrRwf8KBGlMZLyyspsyg=;
        b=BHvSR357oo2wMnbTj36eOifgwEtfXSecO2jPfzBHhy4LHEqglMrg+4Sgc+mnPmplNN
         vTMMNuV7FLzM1CJQx39WooDtDRVRYxETSj5BG4aW3IhdLP8Y+I3doBEBvi4+E1tz6Shv
         g0Uc3dBk6UI5nhImEXPKwnbYtXzNtgR6+chxPC8xode935Rjgyfanix9Sc8X/u4GT7nV
         fkGVSiVZanMOYekKTEb9yIAnVHzg/iG7gcffZ+p1PDIAYcUr7S06tG8Cej3JGq/vXMln
         G7SbbfMqq1NDC70YLEZHx+MgjkcvQ+nxAMkTDq6yDVg2GS+OHSysvLYMGGvi1HQtqExa
         W+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976904; x=1754581704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/MEa9DkjFXY0vTnxN5wQ1ixrRwf8KBGlMZLyyspsyg=;
        b=kLxvQKk9H+nA5kaLVgktcNB3l4XgIZON4mKyKL0AW4yEQBo2iBjRwXshNT/ndEnBL5
         VjrgtghDpqLkDNKxc1b3O+VpmMZo8tKEuQSasIfeeDqwi6tW+vDH6nRtF/DK+BuUW03N
         H4RK7FFKiCMbopbMgCuPrNWnQbW7+e24s015uEqYs+Kl2ZcEnY2rnoFeUNwux2GrlHXV
         CUTOLvid8/+7xkhFJUJxoPXXlR+/WHRjvxZ8Pk+2WfHygrCAfJHeG1k8BlbXMkM8dojF
         Ftht3nZfqqSNHJUJI3djKCzIKVfpltGZY9s8qns6x0ug6oQKPsCr9WkxwfscqNDFKepa
         O53Q==
X-Forwarded-Encrypted: i=1; AJvYcCV842Q4Z00NprhDfI8AmeV1eeibNDG6YOR6IN1fzW3fYBiUaxPqs8xcw7ZyfpcFOo7Wr69ioamIAS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/hswhMh4JIQut9I9DuThOuXHes1jq22gHlv8v+6O0108TFXkg
	SXicD7GvGbRW/slKbQNfcak7h8QFAJodSrU6IE/EmFUsSQPv/qLCugxh0Em3YP2HP5KJsGXnHjj
	g3NM=
X-Gm-Gg: ASbGnctQnLiZt59BzbU4C8fapE0nHEQsrdsgW29b704z4zTzPG43DL4RhK6RoGbXda3
	IWeUE1rik4FvBsL5fR+etMFCmwt8wAJnS8E9NRhHxWTR4hQerKIBClymsDRdVTW1Ws7KM532pEh
	ZVTykagkhxoEhtzRL/7nYSUZXDacEMYSjRzBXrfx0AbWyTO+XC1BADvsoJnV/Wl8zlHLSPKWJJl
	BTT66UsltS6xI02cDFXEK4FrmcjOrj8W47RArPghySilGK3o/uH1XtOrq7gdAk6DtmG2qBoKdob
	4A45jMeQD5xxel4ieqLRcwcdRbVesrFMtuev+SWIDhJXLccBNWM6tEOfgqQ7RZiriw2nZ1lvWqu
	iLv1w+/UzZbBTdv6AwW9C2XlWH8kzoSBsAGtXbWN+5pOL/NVhNTakzcJaE2NoKXdK3joMZxy0DK
	uvmZwQ07g=
X-Google-Smtp-Source: AGHT+IHZBwqdlmv/yxUyZtRKknntTVljjgGIggjaib24O3m0CWPGU61+wAuHvHFq1wDIekuCeTc4jA==
X-Received: by 2002:adf:f503:0:b0:3b7:99cb:16f6 with SMTP id ffacd0b85a97d-3b799cb195amr3544814f8f.53.1753976903927;
        Thu, 31 Jul 2025 08:48:23 -0700 (PDT)
Message-ID: <52d64de1-1e01-422a-8bf4-c25483475415@suse.com>
Date: Thu, 31 Jul 2025 17:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/16] x86/svm: Move svm_domain structure to svm.h
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1747312394.git.teddy.astie@vates.tech>
 <ed6f03900e75a3b0fe620096ac01f067e7085521.1747312394.git.teddy.astie@vates.tech>
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
In-Reply-To: <ed6f03900e75a3b0fe620096ac01f067e7085521.1747312394.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 11:31, Teddy Astie wrote:
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -16,6 +16,7 @@
>  #include <asm/hvm/io.h>
>  #include <asm/hvm/vmx/vmcs.h>
>  #include <asm/hvm/svm/vmcb.h>
> +#include <asm/hvm/svm/svm.h>

Does the vmcb.h include then still need to stay here?

Jan

