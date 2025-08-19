Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D029AB2B973
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 08:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086324.1444503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoFt1-0002u7-N3; Tue, 19 Aug 2025 06:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086324.1444503; Tue, 19 Aug 2025 06:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoFt1-0002rr-KN; Tue, 19 Aug 2025 06:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1086324;
 Tue, 19 Aug 2025 06:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoFt0-0002rl-1a
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 06:31:58 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30edebd3-7cc6-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 08:31:51 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b7c72so6746345a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 23:31:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a758ba909sm1160510a12.54.2025.08.18.23.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 23:31:50 -0700 (PDT)
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
X-Inumbo-ID: 30edebd3-7cc6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755585111; x=1756189911; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SB411tn72i4zMsUdiLXP/quoibJz06k/85c4iYW2i2Y=;
        b=Z6Wb2mIpyjLn++Uc0uBBa+Z8j4svIPU2HxxedimPk3Q+DYmk9YkaF+x99vWmMoBThB
         7E/5R4xptwkWaAn5/dnudXAxctP29BSk0op7iGgIkn6LsIZtyTyM9RbA745HdGUhpllZ
         OYSvCT0OIMY2ALxSJ6HmSa3lK9W9HRPs/0KycCz7vAjtGqXvEdq1OI8WWeF2kRfcoocL
         Q5HcsqWucu6YvKuNU/90IKRABAd1hx5X5dzjeQMfcUsTc+Xi6UFwolZwRpQ24WgIuB1I
         rWB9KNEcqBDWmBWXnXT5sSMlbJoxGGj+/aY5J1THXFDE8/+C9sZmu6ShFsv6QWGdTNWm
         WxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585111; x=1756189911;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SB411tn72i4zMsUdiLXP/quoibJz06k/85c4iYW2i2Y=;
        b=uUNCCRG1+E0X7hWA03vf94/9YAVHZJYoZlJkTgXjJQ6QZi2zC3756BRAXJkKV6l55u
         E9BSj/ar6K6HsoHESIhQJ/qL28a5szRXIgLyM2j7eIHEWPaCQIuGeHDhsTiJH1IjiYfY
         /KEjLCPhzV2YO9GVtDcorXJ7TNhTMLn2GBV0BkUqoymgOlewGL23BbLVGOc0rCs/nqJx
         H9yDfHupQBE45GBIVlvbkkdbl7Y/0f1s2hdKdEE161ou9b+0zToYf8PdPCoY4iAw5qVY
         0wBSfVw0Ino7/Ceh8ROoMJahKpAF5XH1zWr7QYgqguInaloKOatHCYYQrqn2IySTrzm/
         noXg==
X-Forwarded-Encrypted: i=1; AJvYcCUDjcmpqktK4gLKZJVVq1aIApjje3Nj425jT/rtv4VKfPwszoVI+PWOsFPPvYsMB9kDsXRBBjAW2kQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCLdRtsX1Rf2eQ5c+z4hNSqs2pGhVk1Ki+NlLt0vudcv0Z/XbK
	YCP950vgg5xt+e4N5a6DWUQvaax/s1BrPyyDPNHSn6qimolddQ6EN2g32M7SMNvfhw==
X-Gm-Gg: ASbGncudB5/R9i7i1SSNXxpkR/X/nhtTiR9QTyMp/5Ub2VI6vGTsfrCI4avYRSKoSMR
	qI8dl4ssM886CKYBnqoHEL0PxqX3wPdPo30FLQ6rVqWemBSGSRgsD2066wUqouJqK2UxdTkEoJi
	ByAnf0RC97G/EHmwmLdctO+B5dy9ZrCggugsehUOmg55H8UYJZy6mUCQwLrdnOh7oqvGuIEOe1N
	eNRDlrN209xiCt/RkZRlty+vpeJrkslO7Q3s4giwlQ3WSNcWYOEPX/ET0sxF+T/+tUqpEZpqSln
	IXo+hgYrfyRDuSAdsDXdF0Pv9kZZK6gYDrYdlNilW97lbJ9o3LH/mdI3ofgXM+TMDEnDAw/55wu
	vE3W9LNWNLMkBbjw2LNVi/o+3AGp2MZZcI6McA7va5ONh48GaT9sO77WB+7JhCmTawijPRPEdaI
	QlgIvdRN8=
X-Google-Smtp-Source: AGHT+IGcG66jpih18affm4ZkneIwNbQNDz34ljfuyKXUgspRcU/aGtvMsKudByr/K7DPs91/qsnRHw==
X-Received: by 2002:a05:6402:5cd:b0:615:ad47:58c6 with SMTP id 4fb4d7f45d1cf-61a7e75e3d1mr952394a12.30.1755585110994;
        Mon, 18 Aug 2025 23:31:50 -0700 (PDT)
Message-ID: <a4e1f505-67fc-43e3-861a-30edde43216a@suse.com>
Date: Tue, 19 Aug 2025 08:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/22] x86/vmx: Adjust NMI handling for FRED
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808234920.1214924-1-andrew.cooper3@citrix.com>
 <d1a49f35-250a-4db5-88f7-fd0b8e6d1a1c@suse.com>
 <9657758b-6f10-46c6-84cb-14f425f412b8@citrix.com>
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
In-Reply-To: <9657758b-6f10-46c6-84cb-14f425f412b8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.08.2025 19:18, Andrew Cooper wrote:
> On 18/08/2025 11:02 am, Jan Beulich wrote:
>> On 09.08.2025 01:49, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -4209,8 +4209,18 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>               ((intr_info & INTR_INFO_INTR_TYPE_MASK) ==
>>>                MASK_INSR(X86_ET_NMI, INTR_INFO_INTR_TYPE_MASK)) )
>>>          {
>>> -            do_nmi(regs);
>>> -            enable_nmis();
>>> +            /*
>>> +             * If we exited because of an NMI, NMIs are blocked in hardware,
>>> +             * but software is expected to invoke the handler.
>>> +             *
>>> +             * Use INT $2.  Combined with the current state, it is the correct
>>> +             * architectural state for the NMI handler,
>> Not quite, I would say: For profiling (and anything else which may want to
>> look at the outer context's register state from within the handler) we'd
>> always appear to have been in Xen when the NMI "occurred".
> 
> We are always inside Xen when the NMI "occurred".

How that? The perception is based on "regs", isn't it? They're representing
guest context here, just with ...

> In fact there's a latent bug I didn't spot before.  Nothing appears to,
> but if anything in do_nmi() were to to look at regs->entry_vector, it
> will see stack rubble (release build) or poison (debug build).

... a few fields (apparently wrongly) not filled.

Jan

