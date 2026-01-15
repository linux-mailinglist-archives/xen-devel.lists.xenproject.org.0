Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD85D25C62
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 17:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205556.1519759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgQKc-0002f4-HF; Thu, 15 Jan 2026 16:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205556.1519759; Thu, 15 Jan 2026 16:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgQKc-0002cu-Du; Thu, 15 Jan 2026 16:36:22 +0000
Received: by outflank-mailman (input) for mailman id 1205556;
 Thu, 15 Jan 2026 16:36:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgQKb-0002cl-Ex
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 16:36:21 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 521132b9-f230-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 17:36:19 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso7613495e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 08:36:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af65363dsm7032369f8f.13.2026.01.15.08.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 08:36:18 -0800 (PST)
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
X-Inumbo-ID: 521132b9-f230-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768494979; x=1769099779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HWoVJSYtgIiM0jpqJ0ctVniWXXN4CsswtXafNoh3awE=;
        b=IG34ZbIn7OXuXsiE9Ujn3BuS8lKUcyGVyilqYLXwxXThmfXOuZpQMBmv0bDw3RbZBz
         t4KEY8WBRIXSmS5g5el/+jo4Zfp1ZZgT7yZS03z68bdubrZdbD3kjd+vo/joWB9TfJGx
         zwZ+lr8hTrWCZuQQ1G2XFvpbEdrI2bD6E1mjSNqzrca7VIbH2CJECgT1L8AOBrGYYMWk
         92SMQDoQR89lcK2DJLVVB/OKG2Y98XXlM35Q6tNpSrghipDVQ87F+UpI3JpBrQFy5Y+w
         WrhwdIJPfQEjA/Nfb7y/n2hw8m1jPlLeOv8nhaSVmMx6lGpWN8U1R1y6fwbwG7E3LBCY
         zEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768494979; x=1769099779;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWoVJSYtgIiM0jpqJ0ctVniWXXN4CsswtXafNoh3awE=;
        b=hmo9m+PKxzS7xGUpb6YsOlB9grexiORvX7I404PuQmJraWueP5yHY2ccPNhJxoe4vh
         WvXsaCRDMeUlQQnDBr9pM9ayn/8vatFM4xEbieYZ7uy38714kpMuroCgHO7jrXBYsrEw
         EMcBjSA2nfPvSRq8D8lMZizhsCPz0+GOVTgFLsAZtGBL1zNDMOMNUI4S71v90KBXYLcw
         Ufgs7mvEyiXqkdZT6riaewKGfnOmLLk0RPBMmeh6N3rGZQcBM8gH2iKTf1UZ1Ap8Jb12
         VwrhAT2DwvzgNYAZs9tu/y35OMRBDfiQ40uqK9itAv9dyUUtUhp33khDl5pZWkIH1euQ
         SbjA==
X-Gm-Message-State: AOJu0YwTPToLlVW1bEAjrOhehbeQdCAY/FqqYPyW3xoOxCwuCbQ6vYef
	ElCTe3Tw3FeBqNwUiyO1rlj/CTckEztCG6/DCXEvhNy8+bmmC4jTK6QXmXln8vSsqw==
X-Gm-Gg: AY/fxX6H1c1f2i7teS7yin9fR0ZQJM3e5lyeglgT7m6nTcNQ6pco9FCrqEBzWKsbZVY
	2Tovzba7EeUWA5SATiSbh3D27LLvPfhFfImn43SEjihwn4Lj5xJ9ALOCsCBT9VUoYG3Tf6w35Ux
	A2jUGyXP4BYcHvPhmvpkaE26ydST3SI6jIOSHXI0n43VP0IjbA/xwk+AFolHnc5ViFQKl3uGyZ+
	8maQ0BG0qSGp02FtlaWewl7FDT2mLAH+f9usKrDVB39dlguuMaYRxk/Hrlotoumn6CBFF6RpCoc
	qEHYEsO3dSuH5ENl0I4pxklhH3lHpg9oApevlQnR/BzqnvgpD7pY/4e68hDhIILmE7WiROe6sha
	aKOV2OIWoCKkWndJURZLgcta3YPlNK+UsjT2d9u77Owl/SK2uv3ZCI3yAVa03iUdPt9pQr2rn7R
	phblK1fuQ4Z2WnQEz+eq82ntx3LXwA+CglGzXnufhWj5QThA3b9zrPSoTs7EJ3/3oG5EGToNzZs
	1s=
X-Received: by 2002:a05:600c:1d07:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-4801e2fc194mr4183835e9.5.1768494979300;
        Thu, 15 Jan 2026 08:36:19 -0800 (PST)
Message-ID: <e1ca1818-d067-49c0-aac8-3d9bc742c6d1@suse.com>
Date: Thu, 15 Jan 2026 17:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
From: Jan Beulich <jbeulich@suse.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
 <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com>
 <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com>
 <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com>
 <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
 <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com>
 <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
 <35819233-07ba-4e00-8939-74b2f4454250@suse.com>
 <CAGeoDV_fN84JPxLJfE0uWujYfeb+7t5HnFhK-up1Oymk0VT2MQ@mail.gmail.com>
 <d237b414-eec7-4cf2-bf1c-0c12b0f9f364@suse.com>
Content-Language: en-US
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
In-Reply-To: <d237b414-eec7-4cf2-bf1c-0c12b0f9f364@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 16:33, Jan Beulich wrote:
> On 14.01.2026 07:00, Mykola Kvach wrote:
>> On Mon, Dec 15, 2025 at 1:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 15.12.2025 12:00, Mykola Kvach wrote:
>>>> On Thu, Dec 11, 2025 at 6:40 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 11.12.2025 17:30, Mykola Kvach wrote:
>>>>>> I have now attached the corresponding build log.
>>>>>
>>>>> Okay, so indeed not a table size change issue here. Then I fear some instrumenting
>>>>> will be needed to at least know what exactly is going wrong. Alternatively you could
>>>>> arrange for the intermediate binaries to not be deleted, and make them available
>>>>> somehow / somewhere for me to see whether by inspection I can gain some clue.
>>>>
>>>> I prepared a small patch to keep the intermediate artifacts instead of
>>>> deleting them.
>>>>
>>>> It removes two cleanup commands:
>>>>     xen/arch/arm/Makefile: drops rm -f $(@D)/.$(@F).[0-9]* (keeps
>>>> .xen-syms.* intermediates)
>>>
>>> This alone should be sufficient.
>>
>> Understood. I have rerun the build with the cleanup line removed
>> so the intermediate .xen-syms.* files are kept.
>>
>> The build artifacts are available here:
>> https://gitlab.com/xen-project/people/mykola_kvach/xen/-/jobs/12707528457/artifacts/browse/xen/
> 
> Apart from the intermediate files there's a file named xen there, but xen-syms
> is missing. I'll see what I can do without that.

I will need that file along with the temporary ones, sorry.

Jan

