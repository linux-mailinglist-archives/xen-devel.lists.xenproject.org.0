Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D94D13F25
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200714.1516566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKeg-000626-4r; Mon, 12 Jan 2026 16:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200714.1516566; Mon, 12 Jan 2026 16:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKeg-00060f-1B; Mon, 12 Jan 2026 16:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1200714;
 Mon, 12 Jan 2026 16:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfKef-00060X-08
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:20:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d134c8d-efd2-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 17:20:30 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so45473775e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:20:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e180csm38499723f8f.10.2026.01.12.08.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:20:29 -0800 (PST)
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
X-Inumbo-ID: 9d134c8d-efd2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768234830; x=1768839630; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OwSWM+LVf9aA20YwA1MIlGX5Irhs0FNaE8nTqtAkxek=;
        b=O96b+jFHGO3fWyLuInwNPfXK9HxUWng78KjtFZ5bivb0u8vA4gU/YgLmGHqeszFxxR
         Y9csdAuENYXgPLj9cEG0hjpbMKKVSKC/hJi1OgYuOTZhiXSNlNUMR4lxhUlfbNP9GgB/
         zE51e6r8tWS+Qczid9sFFmnnnpRqbE0cdZYj26YXbxTcoO7rZDm0TT+H0m23DzkDNhno
         El6yl/nfQ4DRoZ9CWGkiZkNZ7/xBGgJdQ2BolIbN5NAxagylIkJ0NjHuiroEbuzd1sWk
         E0d57ECaj73aKTpvVS8xVo+lBV96sr48FzNPh7jYBEYLnJaCSBataoVwjb0Et6+o5fJ1
         jmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234830; x=1768839630;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwSWM+LVf9aA20YwA1MIlGX5Irhs0FNaE8nTqtAkxek=;
        b=I6LF8uijO5DS5rDlKcFl5dFcR3iLqdR6kKmpoP/UDjl/GVx5emeOX/amAFubqsu+FO
         LBF/IqfSzxTRZvq8pW7ZhYNHRrThzS33gaBO+KMRbI4a5fZH0AuhyXhKzFir1opjRwjU
         Goo+lw+8goIEFhNGFC+ER7wz3ZoNv2DQG9eQzt0RKgozn65kW8+ViChIHN8GqJR8XGux
         mqfqcRt5RY7AvT71qRwEXkFl8Z/fAUdAIrKems+s5ZGa7+kizYD8vATBSfCulyXIEsGg
         gBnY52MfO8KU+pY5LHLRFcmgjCWn+ANVlWkQNtKMB9DG43IneHQq9GlQUnhTmBYAB39r
         WwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAS0QlbiLrFC3sY5WoqTbpcdNdoTSW7Td441ZssWEsAdwMrBB2GLVjZurKlu54gdkFyEnfYiUov/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPTSqpIBaYhD5EB2LUffscz+0/UDDl1+6Osa7n/VvG51jPf5og
	2hcNmsoj/75YksgPKpu0whmOYWds81NOuP4SJCIv4mXkDzs/T2FmKfVlzHIpiWZpnw==
X-Gm-Gg: AY/fxX5NMnFl0CirNG3FmihaoxDmi9VJTHki6frbNL5p64bL9RxAr7ZIA8xbA/k5LH7
	PqkSs9szw7fjDrO6tHIB4SWGMMqpQSbs8qBHVOW6qaYtRygddHgQM4H6IdF/m6kLPrVWqA6/omr
	7sEXftpKa+Ku7cEH6y/KDVG7VuuEOGuXdwPvXlIlRMV0cnAkD7ijz+jFRcq2Ay1IpUqNolSTCh/
	VqEQHPh7/HmSHyql9c/hzyZxqeThkUfNKQIzlFtVC4RhSOqbxpwCSgb/vtqDUuXKWgGUHBNq6y6
	ru0p9Fj5Nx9XZopngJrs5jRlanF8QaUy4NHyyFwkq3TXQ11sO6gHVTNJemjr2wtWzcQcCGSADMU
	i3DaIHVwgpMPPn3d87VuD47oEeNerQ4TpNYCzbrquHWpqg9K/J91DraiPcjQnuWmLDmPZa4Opkq
	J9jRSUaoBmfHShE3jESxvWG9li0DpzyRJAWXPGOWON0KNprcMUxtLXYJqC3vkEk6+6J7N91rJO4
	gA=
X-Google-Smtp-Source: AGHT+IEyZ5yNm6NKEk+9HdQWcXylAU8xwJPOWfOUdQkk3QOe23d8NgDCBL0IPn+vJuo80ulwR4k2Ew==
X-Received: by 2002:a05:600c:4ed4:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47d84b40ae5mr214895275e9.26.1768234830161;
        Mon, 12 Jan 2026 08:20:30 -0800 (PST)
Message-ID: <aa1aecd5-afdc-421d-8b4a-314aa82a1157@suse.com>
Date: Mon, 12 Jan 2026 17:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/15] xen/riscv: init tasklet subsystem
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <7fd154cda45466ca4bd425bc05d191caccc7d96d.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7fd154cda45466ca4bd425bc05d191caccc7d96d.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> As the tasklet subsystem is now initialized, it is necessary to implement
> sync_local_execstate(), since it is invoked when something calls
> tasklet_softirq_action(), which is registered in tasklet_subsys_init().
> 
> After introducing sync_local_execstate(), the following linker issue occurs:
>   riscv64-linux-gnu-ld: prelink.o: in function `bitmap_and':
>     /build/xen/./include/xen/bitmap.h:147: undefined reference to
>                                            `sync_vcpu_execstate'
>   riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
>                         `sync_vcpu_execstate' isn't defined
>   riscv64-linux-gnu-ld: final link failed: bad value

How that when ...

> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -91,16 +91,6 @@ void continue_running(struct vcpu *same)
>      BUG_ON("unimplemented");
>  }
>  
> -void sync_local_execstate(void)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
> -void sync_vcpu_execstate(struct vcpu *v)
> -{
> -    BUG_ON("unimplemented");
> -}

... there was a (stub) implementation? (The code changes look okay, it's just
that I can't make sense of that part of the description.)

Jan

