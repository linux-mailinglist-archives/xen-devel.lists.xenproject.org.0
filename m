Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82705B30EEB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 08:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089560.1447090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLGM-0005Dt-Ey; Fri, 22 Aug 2025 06:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089560.1447090; Fri, 22 Aug 2025 06:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLGM-0005Bp-Bm; Fri, 22 Aug 2025 06:28:34 +0000
Received: by outflank-mailman (input) for mailman id 1089560;
 Fri, 22 Aug 2025 06:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1upLGK-0005Bj-UP
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 06:28:32 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38d1a5be-7f21-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 08:28:31 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7347e09so291035866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 23:28:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4c90c8sm548283366b.79.2025.08.21.23.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:28:30 -0700 (PDT)
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
X-Inumbo-ID: 38d1a5be-7f21-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755844111; x=1756448911; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rx1LD1Ve98xpG5ENa3YojPpGg7PhKM87yn+Tz69EtDQ=;
        b=Gao1LhLBhy0qAkmPXclcx7beBrmwLJFPsrzYKgOtmthjJ/wQyVDIX3QP1X1La9iTS2
         d2BR+RQQCpO0pqn3kNcHhWTk4woi338idiOUL6HM1o2YGPl2cFCpw5eNjCfHWxmZnzIL
         HjtoDDvowWaj+KEX9EOANF9pseJAfYPkb6hOt536rKh4vfyYlE2Q9r432O5/L+gAlquQ
         egwuBgCu2VelR89SFE8fH7aEtTJym11/oknSHXK+nqDD+sVGkJX7dN9Ns5zrhg16SMJW
         bFhKy8U0+L4bHmjyDlGcQOej5NJu3HjB551PZsERH385pRHV9Xb7kJW9WSxDG+uHFz0J
         R6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755844111; x=1756448911;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx1LD1Ve98xpG5ENa3YojPpGg7PhKM87yn+Tz69EtDQ=;
        b=Iio62LMxvYV3P6R2VaxKXnz5vDr0lK/ZFZhub8De8GMA+j0drIQs1mUjRO0KN18yyi
         Uhm8QUT4+7m2UF6lXQPnE9SCjG/X9l3CSQHA9uXIz9RCTHgTTlkm5yr+Wq0R44hPcmfp
         VnLazO6SDO7lNQ8o8Mq6pQuAZDBPc5T1ZYAzE1SLShJzLOIPTe6a3aDXvrD2FVs2EL/f
         Ky0fttvaaKfknHuEBFiK4e9fjxH4NLNaF92mXALa7OqegESriUqy5HRYVu26wm7Xawao
         fKBALi+CVR9JwSwQDEIUZ0Ud0IIXtqfwwXa7Q1bjzkDg+RKTffPJTXLrSKhV++K1rk5T
         7qfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOc3VlBxOtBX0q3Zo6H+LPFd47FfUictLeFhDlBie2AkaBjdStXfyiq82jy5N3RRklnbvSQj45jiU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyx6vSKxKGYYzOVoAFYPofvpIXZjf6FCR7RdzsiN2bK+n4luE1a
	HEhUQaMYUEeS1+VI6vCGXwEDeHsejKdPtrgDN1i0fNcsnKiRHssglqrkKJF7MYxf5w==
X-Gm-Gg: ASbGncsHFcqT5Ry299VLIU7imy4ejRTKkxG2xh0Y93qc9a94SFtaIOSnMtTdndoQiVJ
	iUFvdH5fGuTNQLjZ4C9TZVgCa2rqSJjJLSYCGQgVtbG/wIhxToGRssMzdqMkTiboHfQ8JJEQu0V
	3H8o3xJ4Nz6Gw2VE8362F34JOj6hPwxKMqaLyPtH1j/7/3XChTD84Cg02aMJ8QUUhTfFBKLNJur
	f8x6fVP+h2+pMH8ikw5NcyxW7830xnJyPJGgMSixz8E9i24PmvShc3lHUw1boaSti/0vnw8RGf1
	M8epKuxsNn84mX1PZ0rTL5MhyPSQLDV6dOxWnTOLKJfcYn1osBUSxmyLrKZj+g55fDiDvODoWCO
	WhhdmPnwx9Sd3likqQ+QOq0e3kcAzW6t5OzkKJ+z3FuYWXUScJFF+PcY0JnJVEkaa8xPTf8kRO+
	le7MEu78+3MgBYhXgGKA==
X-Google-Smtp-Source: AGHT+IHAgu4kTQlt7J3KNPI/XBAaVMJqapBJRxt9I1yVCuaC9Qtwj3nKzgZBeRe8tQL2mN5xedTN1A==
X-Received: by 2002:a17:907:868d:b0:af9:7a90:6750 with SMTP id a640c23a62f3a-afe28f8369fmr174051966b.3.1755844110781;
        Thu, 21 Aug 2025 23:28:30 -0700 (PDT)
Message-ID: <d82e4e73-0a01-4c43-be6f-aefc3655ea6b@suse.com>
Date: Fri, 22 Aug 2025 08:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] x86/fsgsbase: Update fs/gs helpers to use
 wrmsrns()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-16-andrew.cooper3@citrix.com>
 <ae2e8b69-8251-4f60-a5ae-f6bfe413aafb@suse.com>
 <3a980515-564a-4fb2-85e8-9ee9afd93375@citrix.com>
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
In-Reply-To: <3a980515-564a-4fb2-85e8-9ee9afd93375@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 22:49, Andrew Cooper wrote:
> On 19/08/2025 2:09 pm, Jan Beulich wrote:
>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -2733,8 +2733,8 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>>>      case MSR_SHADOW_GS_BASE:
>>>          if ( v != curr )
>>>              return v->arch.hvm.vmx.shadow_gs;
>>> -        rdmsrl(MSR_SHADOW_GS_BASE, val);
>>> -        return val;
>>> +        else
>>> +            return rdmsr(MSR_SHADOW_GS_BASE);
>>>      }
>> Here and below, can we please do without the pointless "else"? Strictly
>> speaking in Misra's terms that's "dead code" (things working identically
>> without), and I'm quite happy that I can now use this argument to
>> support my personal antipathy to this style of coding. Or else use the
>> conditional operator in such cases (where applicable).
> 
> No.  I have always, and will always prioritise readability first and
> foremost.

But my preference is precisely because of readability. The excess "else"
gives a wrong impression to the reader, when not looking closely enough.
(And I [now] expect you might say the opposite.)

> I do not agree with your interpretation of MISRA in this case.

Something to discuss in a broader group then, I suppose.

Jan

