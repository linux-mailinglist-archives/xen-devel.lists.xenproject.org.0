Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCB964829
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 16:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785925.1195465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjg4U-0002Vr-Qm; Thu, 29 Aug 2024 14:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785925.1195465; Thu, 29 Aug 2024 14:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjg4U-0002Sg-Nu; Thu, 29 Aug 2024 14:24:22 +0000
Received: by outflank-mailman (input) for mailman id 785925;
 Thu, 29 Aug 2024 14:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjg4S-0002Sa-Vm
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 14:24:20 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60d8f813-6612-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 16:24:19 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f4f24263acso11624481fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 07:24:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891a3d60sm84401266b.123.2024.08.29.07.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 07:24:18 -0700 (PDT)
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
X-Inumbo-ID: 60d8f813-6612-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724941459; x=1725546259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1yeUeXMVCCYMjnDWBO8RbTQPtDKrzLwgR/Gfr6iSrh4=;
        b=QzNIJFPk3hk1YGwvRota2JuSfodU2Una0X2WjbsYy/nZUjaBbxN7H1pm3QSaiH8nCV
         nCMfS0EQ617zG5I0fCvgAYp+Z+rmFNEDcNtNIe4XmHEs+xEHNLP1wHpJegveoe2SUu6s
         pVLHL7nJfdtJcDAl5Jl6jQoaN3BRfArJZlpOjI7bw6lRZYQaneoBYN62WQfd1BUd4d2S
         WSw1XsOPc1qsIcHzGRijCyI6cY/YECYWpIvX0jZmAn2eEkhSA0bsLCrundDAxBN3kA/B
         Wjg8qn1KpLpEaC1e0Qfkl5Mos/HO6391RAv5Wm7XpvChibB9zG85vFjJxFN8BpI5Z6GA
         3NpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724941459; x=1725546259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yeUeXMVCCYMjnDWBO8RbTQPtDKrzLwgR/Gfr6iSrh4=;
        b=GxnXbD1ya3E7mTrcIv2FAZqs5kwcqAnX6jOKfQhkWUgph2VSAUrI9G28x3+ctFsIgn
         QM9U8UWs1A58mHDzUy/28RoclFzhe9lRI/HOWRiIyZpGnZh4ohj1RW3gwdC6+zr/7vE+
         5s5qkyNe5BNB3NVU+ggLk17EAHlgR0fxBAoqwuJ6OUB4I3i7/t2cwDbSCk1XcQTUmssr
         47CHK0y70ZyGD3/FoTgm+DkHFtjFI+CgNYpbNTmmw5OqFPzd0i3z44CrPAcRZt2ztvxX
         mIKdzmtqEIHkatL05gsDL+h5Gnrmh7dKhUgNv8CC74O82oXHwWgl//7RjL8uXh7pl090
         8FCA==
X-Forwarded-Encrypted: i=1; AJvYcCVHlIXl31s/tO8CNarxPciwfb6WyBWWQZ0Ie8/4wzqj8jXTXFcehIoNdg1FL/Pj37pRcoGruTZlqM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyP1srwmR/pGxNpzhHgAZuu8g/PJzuU7mCGae7WGZbfMhSRaMJT
	Fj8NkP0/Igz6utAINq7OuwdIefRRtzD8CkysSfhPMjM+PSk9ySlp5Km4miuZnQ==
X-Google-Smtp-Source: AGHT+IGWHtvarJP6h9sDnWnpOLIEVg37S1tD2gDTbApy82dyRGM5Gk5Mn7iM6KRlO4n4wFHWfIEw9w==
X-Received: by 2002:a2e:be8a:0:b0:2ef:28ed:1ff2 with SMTP id 38308e7fff4ca-2f6105c494emr28019021fa.9.1724941458424;
        Thu, 29 Aug 2024 07:24:18 -0700 (PDT)
Message-ID: <afb66c02-8732-4dff-91dd-3ff1b8a8fa1d@suse.com>
Date: Thu, 29 Aug 2024 16:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] xen/bitops: Implement hweight32() in terms of
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240828220351.2686408-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 00:03, Andrew Cooper wrote:
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -326,6 +326,11 @@ static always_inline attr_const unsigned int hweightl(unsigned long x)
>  #endif
>  }
>  
> +static always_inline attr_const unsigned int hweight32(uint32_t x)

See my question/remark on the earlier patch: I think we want to be consistent
with always-inline functions and const/pure attributes. Since elsewhere we
omit it, I think it should be omitted here, too.

Jan

