Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920998C756B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723223.1127886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZXZ-00011u-A6; Thu, 16 May 2024 11:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723223.1127886; Thu, 16 May 2024 11:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZXZ-0000yy-6n; Thu, 16 May 2024 11:44:53 +0000
Received: by outflank-mailman (input) for mailman id 723223;
 Thu, 16 May 2024 11:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7ZXX-0000yp-SR
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:44:51 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3cc336d-1379-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 13:44:50 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a5cdd6cfae7so201874966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:44:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed0af0sm10403816a12.49.2024.05.16.04.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 04:44:50 -0700 (PDT)
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
X-Inumbo-ID: b3cc336d-1379-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715859890; x=1716464690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPpXE8yYsiVypob5r3TlAADd7rGNXxVldr3zbRZj9N4=;
        b=MYeVQJY2qTtEITPWfHugVzWsgbZIHu3yJgzZp97ZzKrR7vZxprufwYERvR8h8QlyC3
         1VV1v/o3ZLbggeYI1G/xCC9WejxAc+mFpwtH0bwdjUVFEnlIeVicSI+ds4fNWLvHYAu1
         S4cHS5AbR24sBrvaQGpG0ksnO5i9x7Xd8y/Mps1OmwpCxTYgd2LjmdVChIsqJLQYxFyR
         BAmQbaQAARm2uPJX7eQ5Fbn631z0NGN3iZGdURQaRvCEWHdbQgmRyNntHd0EGtJSeb8E
         WLdcfPCELb/DY1b5DHG8F/jIdMwdMhlMtsF+/hSx2kp3KjTmKViYI4DZr+xjwXxlaXeA
         EsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715859890; x=1716464690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPpXE8yYsiVypob5r3TlAADd7rGNXxVldr3zbRZj9N4=;
        b=jKG7mBYQDarFAGGIkI8enpuL03d4bmz0mRG/wmO7CVqN2mDe60dswCp9m8CqYlRyhp
         FEiJrgvWexskP58szmLfhyOGmtao76NLcMry7toPMpll2L6nOv4RCgbDVWGpUA0t/wx/
         jjdYyKSSJ9No+DxUqNfujXzIW/N5N+gHKOt/h9TRnrlqGYXWk2qEjuR9ZF3GhL0cKMR5
         VLBPDw8UUwLEBQNRLt6CXLY9SNeCoQTePFYyL77mvvFmvtKZAca3e6kw1t/NjC8GYty7
         XBXq2ZImWkXIHKs6fEfS4KpmGGab0ui0tVk4WMJ4sI0OIiqAARU99xZrAcHJf2B9X0Uc
         ulrA==
X-Forwarded-Encrypted: i=1; AJvYcCVI/xYO+I7NTSx9gcSSw7XNeW1gTT1TVGVxvdelfnuYYLD5d1SyqL42sGFpp9knG9mQnhQUHXkf2585tGmNPi8WlfpyZEpVq23Een0rC5w=
X-Gm-Message-State: AOJu0YxZk3jfa6nbd7feM6h6MRyhp9Zxi0+A1Qtd8byCQAxZ2W1wq70V
	kVQSjWGRu00gTSi/ldpVBXLk9Y5zHkqIz544CyrShRAdj68CTWjnzAysHPobLA==
X-Google-Smtp-Source: AGHT+IEf/ZiRmzfovEEA1TGrkFaR/f49orm9OX6DvASdIWXHJsx6bwse6SJPwaDuPKa7ZvrYUrMmkg==
X-Received: by 2002:a17:906:6a10:b0:a59:9636:f3e with SMTP id a640c23a62f3a-a5a118c520bmr2144877066b.33.1715859890221;
        Thu, 16 May 2024 04:44:50 -0700 (PDT)
Message-ID: <7d8fa536-f196-46e8-870f-0cfb57c8a65d@suse.com>
Date: Thu, 16 May 2024 13:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Further fixes to identify "ucode already up to
 date"
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Fouad Hilly <fouad.hilly@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240516113103.3018940-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240516113103.3018940-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 13:31, Andrew Cooper wrote:
> When the revision in hardware is newer than anything Xen has to hand,
> 'microcode_cache' isn't set up.  Then, `xen-ucode` initiates the update
> because it doesn't know whether the revisions across the system are symmetric
> or not.  This involves the patch getting all the way into the
> apply_microcode() hooks before being found to be too old.
> 
> This is all a giant mess and needs an overhaul, but in the short term simply
> adjust the apply_microcode() to return -EEXIST.
> 
> Also, unconditionally print the preexisting microcode revision on boot.  It's
> relevant information which is otherwise unavailable if Xen doesn't find new
> microcode to use.

Since you do this for the BSP only, I'm okay with that. Doing this for all
CPUs would have added too much verbosity imo, and I would then have asked
to log the pre-existing revision only when no update would be done by us.

> Fixes: 648db37a155a ("x86/ucode: Distinguish "ucode already up to date"")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one small request related to the remark above:

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -881,6 +881,8 @@ int __init early_microcode_init(unsigned long *module_map,
>  
>      ucode_ops.collect_cpu_info();
>  
> +    printk(XENLOG_INFO "Boot microcode revision: 0x%08x\n", this_cpu(cpu_sig).rev);

Can this please be "BSP" or "Boot CPU" instead of just "Boot", to clarify
which CPU's information this is? I'm pretty sure you too have hit systems
where firmware doesn't update all cores.

Jan

