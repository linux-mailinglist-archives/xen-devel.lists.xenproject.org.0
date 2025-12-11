Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34AECB668F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184325.1506806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTj4l-0006KK-E4; Thu, 11 Dec 2025 15:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184325.1506806; Thu, 11 Dec 2025 15:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTj4l-0006Hp-BS; Thu, 11 Dec 2025 15:59:31 +0000
Received: by outflank-mailman (input) for mailman id 1184325;
 Thu, 11 Dec 2025 15:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTj4k-0006Hj-1O
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:59:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f8b99e6-d6aa-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 16:59:28 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so2179825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 07:59:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d1e539sm16828955e9.0.2025.12.11.07.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:59:27 -0800 (PST)
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
X-Inumbo-ID: 5f8b99e6-d6aa-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765468768; x=1766073568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rIM5pIC6+d2m2A5CyYzzyyTfrPXkEz89T6gtzuPITn8=;
        b=FFFkji26/If8xp+pXSC3yaPM9fgWx7/8kZ0LrP2afptPSK6K0yCs3zOjx7lrQikRne
         YmgekLCpp+1KkMKGMelAePV23v1NTFjjLSnTsp09LTNRQTffAlJa2MPjtDzQ3barxU8s
         jyIGuE8NbiwFtnIpgytwRa1b02bSu+YPkD9XAFqXiFTYBjEWevYXmkJZnYMcdp8KjtTP
         iXfNrcrHKflvrHc1YwRgC91DfS41h12XSo2jyUdIsF7F0DMeQFgPlJn8vvTTnlBBcck1
         wMllDlDecDt3z/0aTJHeW7bU+Mw/3oCBWwFHBeWwOL7CPveCuAqvHGQR3M7JIIrmYKwJ
         stXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765468768; x=1766073568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIM5pIC6+d2m2A5CyYzzyyTfrPXkEz89T6gtzuPITn8=;
        b=B7pFaKs/X2VVtULiFJLthKCGqqzHjMFOVjQ/vr8hTOZF0rztahnKV6aYbb0oC5R0V+
         6Kz7x5k9bGTWXCEzsPu16X7ySi/IGdWyOj4f9KMTxV5DvyHLyX4IRS7kacQ9GBQuEmFG
         54qT5sdt7wzhnFtHQbzOEORR/LW9pi8e+ibXZxToh5AqyMV7Vod+DBrTXORzKOFNBdD5
         fZBVy2dwOjxpy/mH2ICguXuAypsjaS0gbOFaO2VwDiPNwL58MiQi/adCSBTJjq7FtPtr
         q6OtXr6t9ZqAcqdNwc8/ekGTaXq1kTdj+A61C/f7c6FABJoUFHoZQ9D8kwB3hY9l2Zfp
         F4FQ==
X-Gm-Message-State: AOJu0Yw1NhcE9xUkWN+Ey6Jd0zPAyYCWck1t1sla/I90DQExApZ6WRMV
	iO4tgzWCRcTt5RkhOybNH0MKAcQKRxQTEwpgzPSjgrgEYxqdSxeOQE4KuKAhE4x1Eg==
X-Gm-Gg: AY/fxX4DhX7dQGKv7PhI6DISZjwJd0A8pqW/vyPi6V6wrkQYee3cHL+0ePzyJx1+mrx
	ykXCHGK4cTr7MEmmW/vqDi+C9kpcRvfeh8GfXg0xpzWWjizT8yZD45wqm88lz4Ybf8agQg/QHnJ
	+dduILxy5T5Q86XjNQLQU39Nyp3TxbbV9jxRildRQBZg/5O30l0S3XpUC7BDmRsNtB3MnFwtY8u
	vEg/rQEzmWEP39GTl09chnORY7+YqCC6nMGn3/E5qwOCMDmEMcC3gmFjp2hzXVhrFWs4t4Cxb8a
	A+bWgKsc4o9/YfWY777yJQKy/+cfRtE11jMC0s+2LzOW9C0lZ82WiXbuxrXsuacBQGaZqYqjXjl
	n477KbRx6m1IJyaAH8OSJdQU2ufUjGXiOeWbjBSEnYs1dEKiMXTClKBmlFsLwozHIeoSiX7iqpW
	qssxIzqUriaFPVI9uIqbvLzqcqe33obIJ7KNpzdn/LTE5JOHpTS2dB3VLroahntMa3sohp0PF0K
	SlBpc+Up/CMYw==
X-Google-Smtp-Source: AGHT+IGYDc0yNcU8555hDX6YydiVjHtHugd2qYJjgsWDW1LgL8iAs2bX9gDXzb6lvGA2cR5JUvJKuw==
X-Received: by 2002:a05:600c:3485:b0:479:2a78:4a2e with SMTP id 5b1f17b1804b1-47a89f9219cmr26910935e9.7.1765468767954;
        Thu, 11 Dec 2025 07:59:27 -0800 (PST)
Message-ID: <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com>
Date: Thu, 11 Dec 2025 16:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
 <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com>
 <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
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
In-Reply-To: <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 16:57, Mykola Kvach wrote:
> On Thu, Dec 11, 2025 at 5:31 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.12.2025 13:06, Mykola Kvach wrote:
>>> On Thu, Dec 11, 2025 at 1:44 PM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>>> I tested the issue with the provided patch, and it is still reproducible.
>>>
>>> I also triggered a pipeline with the patch you provided on top of my
>>> changes [1],
>>> and it failed there as well. In fact, it exposed additional problems
>>> in other jobs.
>>>
>>> [1] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/2209153728
>>
>> These are the failures we're trying to hunt down.
>>
>> Looking at one of the Arm build logs, I can't see any indication that you actually
>> extended the patch to Arm's linking rule. Hence my conclusion in the other reply
>> may be wrong - we simply still don't know what the situation is there.
> 
> You're right, I missed the necessary changes. Would this diff be sufficient?

Yes, this looks to be what is needed.

Jan

> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -100,6 +100,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>                 | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>                 > $(dot-target).2.S
>         $(MAKE) $(build)=$(@D) $(dot-target).2.o
> +       $(call compare-symbol-tables,$(dot-target).1.o,$(dot-target).2.o)
>         $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>             $(dot-target).2.o -o $@
>         $(NM) -pa --format=sysv $@ \
> 
> 
>>
>> Jan
> 
> Best regards,
> Mykola


