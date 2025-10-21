Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF59BF7283
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 16:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147390.1479706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDfY-0004oI-8B; Tue, 21 Oct 2025 14:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147390.1479706; Tue, 21 Oct 2025 14:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDfY-0004m0-5T; Tue, 21 Oct 2025 14:49:00 +0000
Received: by outflank-mailman (input) for mailman id 1147390;
 Tue, 21 Oct 2025 14:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBDfW-0004lr-JJ
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 14:48:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 127c9168-ae8d-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 16:48:57 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4711f156326so43825525e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 07:48:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a96asm21010127f8f.31.2025.10.21.07.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:48:55 -0700 (PDT)
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
X-Inumbo-ID: 127c9168-ae8d-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761058137; x=1761662937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o5YjeQyP+ESu4G3mgZF/wfORXL8CyBOWLqyn8VbZL4g=;
        b=E5KGGERpIdi+GKvDUxL1PAcav9Fzmi5CNONYBq4Mt0kI76VmuWdqV6Ht2X1Y7zv5NB
         LCZM0Mlp+r3UWKujJVy4Pw8/9Vn+QKY90TIkgdSDPRo7nkIMbHCdsQctxJaKmucNjXBz
         FzjD9EMJM+if1lJcuLZFLMMZN9xBHsC9B7MhaEbsAHHTTPLnQcjrQ8ud1o3e4c4p7YZE
         K8WaNyA6p+XZCT2Xy2FZcz5ZFJ7zTVcv8NsNkjjLqigjNO2N4eSKC6dh3NdEScSMfWLo
         9/oVR0N6SYMQL/YkUxMxc72rUm8mv1aXSUxs5K+TxvTm9Fs5msCqj5EAMOpCGK3CFOZN
         7b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058137; x=1761662937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5YjeQyP+ESu4G3mgZF/wfORXL8CyBOWLqyn8VbZL4g=;
        b=od4CnlFkKVpMbI25Yj1Qm+bX7o2LzhgQtYNGqeadggrEsxMN231Dfa/6auJ1AyFzYI
         vCl2o7i1yvwcpRT+QoPAR5VzQBSt6XLKFwWeW47hA8QMJh47OwQ57Y+dp8O77BK6P1CL
         zsXDCUnbwKOsAAyncGnKmzuopxkyYZiFHgxaXNroHRlW9tfqrzzyFaT/xNJkBaLr1vwC
         2YsU+ZSW+AFTTr6gVJRZfYWKBR6VdX4bg+iKBueAA1xNTWvAFJPKjNo/GvRMtEGSuHic
         pkdcTM7Mbb2XRCRCGKz3EKIsWmusOCczJXOvDGq+FAqrQdZp3AcMm+AevT9TMp+kab9o
         nDBA==
X-Gm-Message-State: AOJu0YxJmCwPavqj2jK1OkjQasZXo2AThnqxtF2CJgtVz79hp/vaZXR4
	fC24tgWXfOfMY6Ob3B/NO0U3mYBaUKdAuAwBIAb0VQHc56H6iuVy7/yIiQMxb1jOow==
X-Gm-Gg: ASbGnctQNQH5/v3KT94mDPwxEsA900EprPlGrt5KydXAf+bs0WBb/6bD7SyRkGLfNYZ
	MvDCo6B/bRHE71YmkMLjukA/euYAI5sCycptduHJDd+dAegkD1nUY40dq02pH52uTNcY6PoYMLI
	kiQ+I3gtvmUQ5GyNabplCVaSVG3Fmv5d9pEKQqcU8LFQ7mxfdNArD3ciGqo/cHX3MTfZsW8DIna
	K5von2QyQz17Niuuaehqwha6N4YE+u2EpnN4Upiu6jurstc8RgXw4kcexWyFZjb2Qf1UyYvbQkT
	gYBa9aQtQDoXYwFFSMD7MzxAQkrum5uOl2B9kWO227uhHzpJdCuf+/VYfSc9v3gc6bzHHjgApaV
	LSEs0hT9uc9RaLuMXaWjMw6FDCRb6q4sVSgAs3TOemzV+aVV3OCEXAtty7SHSO/VuvO+8J2V2Wq
	UoU19VlMZeXc1wHpyq2DG7StH2tVTWAaT8s+2+iR4lYuvyH0cRPYvUFQGUDjTvL7yzrJ7seJIwF
	7GWCzb6jA==
X-Google-Smtp-Source: AGHT+IH4Ors9ABc71kN8uImCF9L5M7KyNNuBpdDtO+/ICYH12ppqknBAtz+vcEXdN3O2R8Zyh6iGdQ==
X-Received: by 2002:a05:600c:1396:b0:46c:adf8:c845 with SMTP id 5b1f17b1804b1-471178aba5bmr116421875e9.16.1761058136812;
        Tue, 21 Oct 2025 07:48:56 -0700 (PDT)
Message-ID: <573ac758-0322-48d1-9028-64670655bdac@suse.com>
Date: Tue, 21 Oct 2025 16:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 8/9] x86/HPET: don't use hardcoded 0 for "long
 timeout"
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <2e140536-6e24-4de7-a5f6-0c0e19951f13@suse.com> <aPeW5RZgFKKF15hw@Mac.lan>
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
In-Reply-To: <aPeW5RZgFKKF15hw@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.10.2025 16:21, Roger Pau Monné wrote:
> On Mon, Oct 20, 2025 at 01:21:18PM +0200, Jan Beulich wrote:
>> With 32-bit counters, writing 0 means on average half the wrapping period
>> until an interrupt would be raised. Yet of course in extreme cases an
>> interrupt would be raised almost right away. Write the present counter
>> value instead, to make the timeout predicatbly a full wrapping period.
>>
>> Fixes: e862b83e8433 ("CPUIDLE: Avoid remnant HPET intr while force hpetbroadcast")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Maybe I'm missing a path, but are there any callers that still pass
> STIME_MAX to reprogram_hpet_evt_channel()?
> 
> hpet_broadcast_exit() no longer explicitly passes STIME_MAX like it
> did in e862b83e8433, and then the per-cpu timer_deadline variable is
> not set to STIME_MAX either in timer_softirq_action().

Good point. It was me missing the fact that "expire" is an unaltered function
argument; I (blindly) assumed it would be calculated there. So yes, that
check can simply go away.

Jan

