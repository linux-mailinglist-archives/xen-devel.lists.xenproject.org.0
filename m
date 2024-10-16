Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA89A0B09
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 15:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820038.1233539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t13lk-0000SK-Sh; Wed, 16 Oct 2024 13:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820038.1233539; Wed, 16 Oct 2024 13:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t13lk-0000QS-Q4; Wed, 16 Oct 2024 13:08:52 +0000
Received: by outflank-mailman (input) for mailman id 820038;
 Wed, 16 Oct 2024 13:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sXg9=RM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t13lj-0000QM-Lg
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 13:08:51 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8cfe557-8bbf-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 15:08:49 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-431195c3538so47204605e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 06:08:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa7a04asm4290072f8f.8.2024.10.16.06.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 06:08:48 -0700 (PDT)
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
X-Inumbo-ID: c8cfe557-8bbf-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729084129; x=1729688929; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YSZjA06rawFFyjY0W3eN3VrL0FdMjMV45ul5kD2Df8s=;
        b=f5P6tEVNZMGvTIIlBh+r9S8hIpi34K4dAI4VhYcVr/qERjtEV3o3/Zzgkzg4GN3kgX
         UUjQzmC+SySAfEP30exTnteadSJHX4ehVGwZpGib/bG4EjjiCbp6BKt9CX9wtJCw6ygr
         EYvhbxwxun2rFeILKlForcvpDgVzYOMuvdFjZFNlrL/sYT8RJ9SfFdEYQ/rTqLoVf4E4
         BQ19jQolAgweBXM2NAZ4y5vDdkk/kfEwpfjQoH2hloRrVDfuB8BJgB6ISthjjyL91QMQ
         RMd0oKHTorhXIDxzbGIAqCt6bR+ZpRHuOhboRHfastfU3X/mnolAAnxgw0mZMSVSOF2V
         6VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729084129; x=1729688929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSZjA06rawFFyjY0W3eN3VrL0FdMjMV45ul5kD2Df8s=;
        b=texDz/DkBFUg5ewa73WbR+kPhxJ8MJJXjIUvbbCbATAJldr4tBGh04LYvsdq7cnXzJ
         PWe4gDzULrRJrzDH+UuEdZkxxu4XeNB1eJNu4lYMYCywVF0e5tFMX3rQDIdZmmnigBv3
         q0POBHn505ZUN/+C4SK9q334pyGhU2BSQZCVr7ZWHdBgVbfoA8ZQSJJ+1d5QG/ZGvnko
         l39rI34VrFkjEPmIWYuFSB2QrlxrQMR3nSnRN8Qf55uTGeLsv4sySaoWoky6MzbgKe7p
         Eos0iaLLW7qSFp2AXtpEQi1x69DfmNzTTdWuc7IWz/HG8VlWCYTkw68sdqgjujAfGZPC
         4V6A==
X-Forwarded-Encrypted: i=1; AJvYcCV7TO+0T/vPI0Dh9rTUf9GMDykVqaXoKoiLoQWsWKoosNmHQRCg1rN4Vy/OMIyxBQOopjWSJpTwk2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDiGYFYRm738RtMQVfAynSIYn5VKTmqhgL1gfgGgQPK48uWKFT
	GdG9hU8lSP9naLfXqrOXWNLllSNAACxCf6qsKwCKxgZTuYocYJuyexHsffLput7g45B2sg5HFaU
	=
X-Google-Smtp-Source: AGHT+IHFS1GwwF/9VO3Hyi0Eqqq6LdeqtTD0Xsqpt0cXDt4KMnbIxoRTTXW9Em9EU/2/j2+gpf8K3Q==
X-Received: by 2002:a05:600c:314f:b0:431:52c4:1069 with SMTP id 5b1f17b1804b1-43152c412eamr15087595e9.8.1729084129042;
        Wed, 16 Oct 2024 06:08:49 -0700 (PDT)
Message-ID: <7d289c5b-ea3d-4d0d-913d-d8e0b1bc24a1@suse.com>
Date: Wed, 16 Oct 2024 15:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: update documentation of reboot param
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20241016124202.801139-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20241016124202.801139-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2024 14:41, Marek Marczykowski-Górecki wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2153,14 +2153,13 @@ Specify the host reboot method.
>  
>  `kbd` instructs Xen to reboot the host via the keyboard controller.
>  
> -`acpi` instructs Xen to reboot the host using RESET_REG in the ACPI FADT.
> +`acpi` instructs Xen to reboot the host using RESET_REG in the ACPI FADT (this is default mode if available).
>  
>  `pci` instructs Xen to reboot the host using PCI reset register (port CF9).
>  
>  `Power` instructs Xen to power-cycle the host using PCI reset register (port CF9).
>  
> -'efi' instructs Xen to reboot using the EFI reboot call (in EFI mode by
> - default it will use that method first).
> +`efi` instructs Xen to reboot using the EFI reboot call.
>  
>  `xen` instructs Xen to reboot using Xen's SCHEDOP hypercall (this is the default
>  when running nested Xen)

Hmm, out of context there is the pretty bogus

> Default: `0`

I wonder if we shouldn't adjust that as well while at it, to perhaps say
"system dependent" or some such.

Jan

