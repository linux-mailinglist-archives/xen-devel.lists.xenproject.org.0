Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183CDA5EEEC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911591.1318001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseVM-0005Iv-E0; Thu, 13 Mar 2025 09:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911591.1318001; Thu, 13 Mar 2025 09:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseVM-0005HR-AS; Thu, 13 Mar 2025 09:05:28 +0000
Received: by outflank-mailman (input) for mailman id 911591;
 Thu, 13 Mar 2025 09:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tseVK-00040S-At
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:05:26 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d58c110-ffea-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:05:25 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso4585335e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:05:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a731265sm46589365e9.4.2025.03.13.02.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:05:24 -0700 (PDT)
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
X-Inumbo-ID: 4d58c110-ffea-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741856725; x=1742461525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WTbqYx9/UaIIRfSOkrKPuMU1yypooXdUfBRHwR/ywhA=;
        b=b5p7BTaRjwVa8iq6CWjrW29weUXbQGNMwjwG1EKlvO/8RnV4bTXuwQnWEwTNgYNsI3
         JMR8W3iEv+5fbPCSK4UgZR98Wgl48nV95FVTPCkUAgTzyxxT4POHyDUl6TAVg2c/D/yc
         9ViBVlLZ6bHkO5+C19roXj8xURW9SpB2yt0RPvXpfrPC0H++T0A17Pr25UxFJDZ4QHop
         g7iuTGYEhH3DAH4ppkyyKnFieZaFCxjrrcqz2Sl6O8A++NVLGC1WhO6L+D8QVZJpyqoe
         khGd6LJ9blW20fXTq1RKblt7tcSU2UGUluFpTqYB5lW3u5Qv7gC/0aHuABAOgwJhHAdW
         S8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856725; x=1742461525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTbqYx9/UaIIRfSOkrKPuMU1yypooXdUfBRHwR/ywhA=;
        b=EyxQyINfYhELC66ds0f3pgW1R4NaslXxUsDEx/3TOUgQi/v3IQKZ2j8hpvSnPzRy4I
         DwMGSVFRbLN7DFMgGCYWxCQa5aF4ZW/stYndCunUkTqbEk7+ppal7YwmdE3u69YR5lio
         yIlXm8JBvDRnCpMuyprxCUE50CFtIU5AOppIeJdFWIe+dtD6sY1gJw4Tw1rFDGbb01A2
         yhOtCwUAC7NjrRq6rrX9Kxz7mbYLIHLe4N7nN2jEKU6w+mN05gWbaUClMDTY4CSsHYSG
         mRnk03z68v+IqC3thLHVkyYuO0qSHT3JGA8sdxvFo2yVwdJ/sj+RJerNN9kyPAVifyl4
         SPNQ==
X-Gm-Message-State: AOJu0Yy03q7NIWYUvrxaxVaniUkaKg65YU28q0LFu5khQXMRH68u6mt1
	fzLnJbWR719JcOnQEbNvWeiPKnyNT9nSuRanNH/ToJHP2NksJ0aOWrrcMOHGFg==
X-Gm-Gg: ASbGncsLE7uYT223LOLrVSVsTNNjNDnyDBMeKXYjHfsi4MpouXSxu+WWA7t2NIZofMh
	3sIJQge1Jqyv6Os8RcGL6eXAKiwL49uaanm2EynF+Dts+ESdhrOYuXgoNAitJkdeAb5ipABKKyC
	uhODvQ5Xh9heibh7Sd4qaVEGIhRofYVaHMNwXzmUIFN6Al2kHDCPxAQ/vFxEY0/6lRB1qschM6o
	oE7eOKZ7Ikx9LdIlCfSlwjYut5/DFuYv5oQNMm7dnpbUbv8ynjxwWdColGnA6yKS/fDMFOcxlFS
	hNNBAQflHy9xIgdNExZQznzg0WicdCfcVaIVljxogv/NdT0RyiBZnEMU5Y6bEN/otv9IRP3IsyW
	tM02G3rp+5xdO7wLRSs6nWm0U3YDRVAL6zvJYau5Z
X-Google-Smtp-Source: AGHT+IGvtW4VlwjPVOqceHRQU6R/wQWjgtXoRQihs1Lyy9/v9u3k7LXf94ufIeGnHhnaqC3C7bTqxg==
X-Received: by 2002:a05:600c:3b1a:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-43d180720e8mr10118125e9.5.1741856725278;
        Thu, 13 Mar 2025 02:05:25 -0700 (PDT)
Message-ID: <4336a7e3-0593-411c-8e4c-b582baca7979@suse.com>
Date: Thu, 13 Mar 2025 10:05:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-19-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2503121643380.3477110@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503121643380.3477110@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 00:44, Stefano Stabellini wrote:
> On Wed, 12 Mar 2025, Penny Zheng wrote:
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -54,7 +54,7 @@ obj-y += smpboot.o
>>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>>  obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
>> -obj-y += sysctl.o
>> +obj-$(CONFIG_SYSCTL) += sysctl.o

This is ...

>> --- a/xen/arch/arm/sysctl.c
>> +++ b/xen/arch/arm/sysctl.c
>> @@ -15,7 +15,6 @@
>>  #include <asm/arm64/sve.h>
>>  #include <public/sysctl.h>
>>  
>> -#ifdef CONFIG_SYSCTL
> 
> Why remove CONFIG_SYSCTL here?

... the answer to this question.

Jan

