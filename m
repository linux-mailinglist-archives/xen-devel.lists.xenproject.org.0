Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E9C1FF1E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153581.1483884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERVT-00083i-Vd; Thu, 30 Oct 2025 12:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153581.1483884; Thu, 30 Oct 2025 12:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERVT-00082B-S3; Thu, 30 Oct 2025 12:11:55 +0000
Received: by outflank-mailman (input) for mailman id 1153581;
 Thu, 30 Oct 2025 12:11:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vERVR-00081t-RI
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:11:53 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e3ab59e-b589-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 13:11:52 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so966683f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 05:11:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b79cbsm31797195f8f.4.2025.10.30.05.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 05:11:51 -0700 (PDT)
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
X-Inumbo-ID: 9e3ab59e-b589-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761826311; x=1762431111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lb+ITqz/osCli66h6LV6unEl/fCffaGx/xLxzW610ic=;
        b=B5wC9BGln3FVvQ8Gp78Nv8X/fF6S9bLELmv4GLbdv7PYzfUnE2SlWM7ECIyBqrtGq9
         oUvAk4OaVyIegPQ5Mylt1KKJU2BSsRwEgalDBsB+myYH1P5DeJ3q2xNBZr/lAFEpr1g5
         pFpramadUnuZXh/eV7YGFhlLuS35vub99XdGAQIziY9VJCWXvb2wo0VO2NalL6f4O2sI
         am7zgtUuncVFUbNelrUX5S0rp4N3A02qdQISp6dS6pvw1YkWVMj0bYLxh5CFNjeiwPUJ
         cXAQ99Tqti97NobGCdZgV/tO9bkENwPKTqfNxwUba7hOqF75WEZlXRp7youLR6NhxG2N
         glbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761826311; x=1762431111;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lb+ITqz/osCli66h6LV6unEl/fCffaGx/xLxzW610ic=;
        b=RXA+uRJLfklKF6By911C9wurmFHHrCcun2lbRGgCNFVYoMaWqrQTsPvCjg+cCA94Ql
         Om/KTDjR6xgRhF386jj1rXDSU9tr8feprZGusBZMV57e5osOsaX7WWJ73sE9IA1xq3BH
         LT57znyZh36qz0CHfhUwseRi7kGOqFoqYU0amYXo5LSD+mmcjzk7/Of8Q1PQTT37KZqs
         bbB6ymtQRfAivYLalNCrR2ayBJYbJSjj3inAz9T1HjfZiPR1Ixc9yP7MwpzfGp9UJZRR
         qVGXXXykGmQqSWDUnB9eZLJ5EKA+DdspeRd0NX+O3HUXMZw2QNofcaVkuaFZDZSywexZ
         MQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCVjdwMYcWvNUwrcZEandLbeJQQs9RZAnCY9/XLx3LiYjSNLH6999HaF8iqgRhVMQ3VthYF9XQNuwig=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDg20+ZXZaA4A7fkfLvnS2Ciz9fAWhYHqKUtvTG1VfOVa+iXCA
	SfiBOESfO7JqGbKdp3xP+jHWQs+Kne9dxSq1S9FWa851uvdgdbh4xW7nchF14QYbgQ==
X-Gm-Gg: ASbGncsScftq4wsYXUUw8TwhtMLx1LFq8M/F8cYbk5F3wFfYi6k03FT8iBf0QT1tlbn
	gKPypC9eQ9gupCVSlKuUBFkNsopLjFiSuyWcYydKStehxQxQv01n+u49a1+cNrSwSuvISOT0/Gg
	TButch3/LR1xEiOE0tlORu/KOfoTDOhFnEWwu9L91TXP0buGW6XmXhxflpRaflVlidne4L8LiJl
	78JEmC5GNnWR0ghgsCWxY9Xxa0y6hioNigf9f61mI5Orc5b724O9J/jkm9JJz5iSXlgJ73RVqHb
	1oGqxAx+vQH14+lWWuyKYXh6avwYfFGngmS56yHd6PS0W4YXU347gpPmH294tfMsboTmk0B5kcP
	UnQafmH/SF30DtREhUaNv5FhZ5sngXXDJh/D+xNUj42v6yrODxd3TMI2i+uAT3dsY75VPlCpnX0
	ZQ/okFobUjhggdAUXvLLzaAb/hwyYxGKgQASiKf6l4bPnHGjwx02RKB7uolHeC7B1cEApPA0+cm
	NLh9miH3Q==
X-Google-Smtp-Source: AGHT+IH4GOD4md/A8Yfqy7mgMQjKWA+/4VdxWo4vilmgR4dnX9uFBzFHD1YqKoP2Jh30yIz57rXnkg==
X-Received: by 2002:a05:6000:1885:b0:429:8afb:ed5e with SMTP id ffacd0b85a97d-429b4c7f885mr2312288f8f.8.1761826311325;
        Thu, 30 Oct 2025 05:11:51 -0700 (PDT)
Message-ID: <456e115b-19a4-4be2-81c7-39839ec8392d@suse.com>
Date: Thu, 30 Oct 2025 13:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/3] x86/hvm: vmx: account for SHADOW_PAGING when use
 hvm_shadow_handle_cd()
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-3-grygorii_strashko@epam.com>
 <32fd9825-45b7-470c-ad0e-f1941faa4d52@suse.com>
 <483bb615-addf-4038-995d-9babb79ba85c@epam.com>
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
In-Reply-To: <483bb615-addf-4038-995d-9babb79ba85c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 13:07, Grygorii Strashko wrote:
> 
> 
> On 30.10.25 13:12, Jan Beulich wrote:
>> On 30.10.2025 00:54, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> The hvm_shadow_handle_cd() can be used only with SHADOW_PAGING=y,
>>> so guard hvm_shadow_handle_cd() call with IS_ENABLED(CONFIG_SHADOW_PAGING).
>>>
>>> bloat-o-meter
>>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-290 (-290)
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Requested-by: <me> (or some other of the available tags)?
> 
> Will do. or Suggested-by:?

Your choice.

Jan

