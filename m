Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F795C59F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 08:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782149.1191613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shNyA-0000Me-1W; Fri, 23 Aug 2024 06:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782149.1191613; Fri, 23 Aug 2024 06:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shNy9-0000Ka-T6; Fri, 23 Aug 2024 06:40:21 +0000
Received: by outflank-mailman (input) for mailman id 782149;
 Fri, 23 Aug 2024 06:40:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1shNy8-0000KU-3W
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 06:40:20 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fe49427-611a-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 08:40:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5befd2f35bfso2155996a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 23:40:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0515a6342sm1704838a12.79.2024.08.22.23.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 23:40:17 -0700 (PDT)
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
X-Inumbo-ID: 8fe49427-611a-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724395218; x=1725000018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L6rQzet8aaepjX1p6bRXeaq3UnocfIoPmF5UhWJcUQc=;
        b=BaAaghhHhPt+l6xJUdeSZrnI+Y8caZM+UEkb2YrLTyRgPJMIIx1LCiIluQQg0eQKFH
         WMFSbkajUN5wfDYhY/2lpwW3MRIhxx3au30AuKQHMum/Evkt7mE8onApH5SAzU2Ructv
         3djgo9ESH7L1dzQcN6FRGxtUlXgJt45AL/UU4ZfYfZvlEV+3V9PI5CJZ4sCOpURuz+MK
         u6hkvhqqNcxnfshLO3yKgLVE84Tkp+1K8/6s297pH9952do/5wx+jECJcMxf7A0H3bn/
         mVRi5ENWhHFK85M9TWDAKT2xDxi0BYZEWSMaL0dkuhi/+CqKr9bnoPfnSGp+3tGyjmz5
         THoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724395218; x=1725000018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6rQzet8aaepjX1p6bRXeaq3UnocfIoPmF5UhWJcUQc=;
        b=NCQVxJ7B45NDOMb8+nmnj9jHVj3p7wzBqY+jmS9CWLql04UkUZAfHMYVE9EX8uhXlV
         vSBWtVZp/kOzl0ti73pLThSi6VsOcVSkbpCUTbhNQoEARXiqtPx1rdYDV1O1CAOHbmcs
         7tbtUf75/Es77Vhf4w39kbVdCuk4C3Z7SgD23TM+ORqT2zfuNBcsBFgY9Ev5ZpgA0HfB
         W2vt9TPAOMoYyMiH2CMONEkCJcvWg9y6NQJ/a5wqJjh9douakJ+6dnFJx64i4RI9fK6L
         4Dri1FVcrvGVaL+JLPpT27HjCaVh6WcQsNVXXpF9AOpO/LjQPiKdWXb+dpNUPS4ODplE
         XYbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7ATb0tI6RyZjMPHU5jBaqeh8xrtPYM72K2Dr5WmawUkipCd0iHCYNPx2sj/IVIFnVSQmPhHPZ6JQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyV5BKWsF8D/11CXjTz9sr5v97OdVMAsWAWhZLaMORQf0gJgP6H
	gXA2RS357GZLy5wcgnN+COSEOZAEwI2pd1GMWGEclWGtBAewq0JvzQAHWvjMsn+JyNE5yj4y6d0
	=
X-Google-Smtp-Source: AGHT+IEmDwc3AEJ51K18Slqmr+fjOq/XYVgMVeFDNuO8E7/qeuZ3hkscEuEGCfcm6no9D9pBp+dP1A==
X-Received: by 2002:a05:6402:2105:b0:5b9:462d:c538 with SMTP id 4fb4d7f45d1cf-5c08915a80cmr796039a12.3.1724395217635;
        Thu, 22 Aug 2024 23:40:17 -0700 (PDT)
Message-ID: <d65d8b50-5f9a-4495-afd8-7ca4430a2e1d@suse.com>
Date: Fri, 23 Aug 2024 08:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Restore memory used for IP computation
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240822140044.441126-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240822140044.441126-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2024 16:00, Frediano Ziglio wrote:
> We need to write in some location but no reasons to not
> trying to restore what we potentially overwrote.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/head.S | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> ---
> Changes since v1:
> - Rewrite magic number field instead of some possible BIOS area.
> 
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index d8ac0f0494..9b7e7b4e51 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -415,16 +415,19 @@ __pvh_start:
>  
>          /*
>           * We need one push/pop to determine load address.  Use the same
> -         * absolute stack address as the native path, for lack of a better
> -         * alternative.
> +         * stack address as the native path.

This isn't quite right, because ...

> @@ -463,18 +466,21 @@ __start:
>           * relocatable images, where one push/pop is required to calculate
>           * images load address.
>           *
> -         * On a BIOS-based system, the IVT and BDA occupy the first 5/16ths of
> -         * the first page of RAM, with the rest free for use.  Use the top of
> -         * this page for a temporary stack, being one of the safest locations
> -         * to clobber.
> +         * Save and restore the magic field of start_info in ebx, and use
> +         * that as the stack. See also

... there simply is no start_info here. Iirc Andrew suggested to use the MB
area's first slot (which effectively is what you do here, i.e. it's just the
comment which is misleading), presumably on the assumption that any exception
(incl NMI) in the window until a proper stack is set up will be deadly anyway
(which may want mentioning in the comment or description as well).

Jan

