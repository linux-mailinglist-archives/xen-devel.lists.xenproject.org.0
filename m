Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65804B002CA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 15:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039525.1411362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZqu9-0007XJ-Ak; Thu, 10 Jul 2025 13:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039525.1411362; Thu, 10 Jul 2025 13:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZqu9-0007VG-7j; Thu, 10 Jul 2025 13:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1039525;
 Thu, 10 Jul 2025 13:01:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZqu8-0007MP-1I
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 13:01:36 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01154c6d-5d8e-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 15:01:33 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so5567605e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 06:01:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4344a51sm21668105ad.191.2025.07.10.06.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 06:01:32 -0700 (PDT)
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
X-Inumbo-ID: 01154c6d-5d8e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752152493; x=1752757293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VHDfhyZQRqi+VH5cNET/LyUZ4ZowwJKX115rvTukrnk=;
        b=EffiilnkGmuiiSAymb6STgKROYdsNZmIMfPh26jH7qGRoxEEbgHfi4RbDl/gUc5jJ4
         YeEisTYNtYIQQLRLKHaptXOZMUPfnkB18NG860/R4uER6yfQYOwa/7GbHIZ8j6FrJIud
         +c01bwfc6aRiW+Ms1uLy9zSTnlKbXd+y+XsWSKKsMCdcuJpvciIvu77b8yyNbOtpSmvX
         2J/GZpt3OiyYCL8B/MXxxdulTN30EYhybP4VfCTk7iV0vkU8WiarvmGJbmb17OWRviEh
         5uND2RkqoujLEoUIIhuSroUwvSSoNfsLc2Pb0awz49zTq/AtPDC6vx6WKX18LsWVYKGb
         ddMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752152493; x=1752757293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHDfhyZQRqi+VH5cNET/LyUZ4ZowwJKX115rvTukrnk=;
        b=ULfP5pBCGx9GQMuXqNCwfBKQhL+v3wGpKWqgjgamRLwK52s1/SvWMQgW4cjIi+JKgJ
         B34SwJiKgpsRgGwK4HxgU+7CBHI0CS1pqR1EvyF2Y98Bib/wIaBgmbwHaB3aSPybOSGS
         RkWRYmQkPIGKl+TzCkG19XF0avmDPXTmqBGIZ0iVAPY2haXOCK0AU0ZtKWKHyMMyK8oe
         b/55I+Ogpen9ztTQuS1jB9RGp4tlrH62zTJJL+C26N7kMMP/5IJtWvQ5NiMDD/nX9H9v
         LF3bwwNBaFIdn5xua8xsebWwohms+2+52af/ZjBDSNjiCwcBqh0z6ogPckaD7Abw/jpx
         MtzA==
X-Forwarded-Encrypted: i=1; AJvYcCVyAbLDtMK1d7MFuTnrlbkdtGE2VTpzv/IrMNDU6SH6QoDRGluaibWm80qhRhct2H0z5gIefLyA5Do=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdnt7rzaeQ1pyPCDKq0CpaLuKg0BHgHRqAlKYAZcMMPS8gQCpk
	GtVSg74ZHaqViDk33RoTi0UrZIZt23wmOUQYsW4nzE6Xq/1lKx0xj1SMDYoLyF9HfA==
X-Gm-Gg: ASbGncsB5Latz2JunO8kZ82sm2Oat9Zj+um7apQJ4uOQK+IdhFFbvIszByiGnZPubrO
	GT9qFAcO7bLBpFQzd53/p3KlPbZq5X4d6Z0tDuNElcvlYNRJNn+84yTvvmZsAfzf/A8XrGHG3uC
	Ux14nPauvnz9onKOQlkaVQqtnbQ9wwO08Wlmx57lkvR7Sz8QQjMs/u6NtqWjNmKTzXuLA3lzHtQ
	bN6iwam5hytZ7a3HzHtbwdTcEJxs/SxtLlXXFVsqtBBlNIVRcwXL+EAlikBW581ed71wOfeYYvO
	QCT3+AJam8Dd4XlcdaLDNA+y1SpCMGWjFvR7UjS3voSp+r1L8IyE878FLtwbGIrdVwIxZ4to92f
	zDFtbqfvUpr08D0pihFK0eYduTXvCUJhTh7wcZp8s215TW6o=
X-Google-Smtp-Source: AGHT+IHTkQyd28WRX2s/3DpwwlIspkmXlgylvbhmK1qJZzJWLLSX4QNn4WnmhLmHURqLnSlrrCFzcw==
X-Received: by 2002:a05:6000:24c9:b0:3a4:d53d:be20 with SMTP id ffacd0b85a97d-3b5e44eded7mr5252213f8f.18.1752152492529;
        Thu, 10 Jul 2025 06:01:32 -0700 (PDT)
Message-ID: <9bac1c94-7b97-4290-9722-2f88f466a49e@suse.com>
Date: Thu, 10 Jul 2025 15:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] xen/arch/x86: reserve TXT memory during Slaunch
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <8d5ba2e7a0a8bd05bb9cdb89db3f15b831f7f4f7.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <8d5ba2e7a0a8bd05bb9cdb89db3f15b831f7f4f7.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -106,6 +106,9 @@
>  #define _PGC_need_scrub   _PGC_allocated
>  #define PGC_need_scrub    PGC_allocated
>  
> +/* How much of the directmap is prebuilt at compile time. */
> +#define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)

Oh, also - I don't think mm.h is a good place for this. Please consider
putting into setup.h.

Jan

