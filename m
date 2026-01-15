Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6273D2561D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:34:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205360.1519653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPMM-0005hP-Jc; Thu, 15 Jan 2026 15:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205360.1519653; Thu, 15 Jan 2026 15:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPMM-0005fu-Fd; Thu, 15 Jan 2026 15:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1205360;
 Thu, 15 Jan 2026 15:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgPMK-0005fo-CW
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:34:04 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e37c8b3-f227-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 16:34:02 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so6734265e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 07:34:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acd0csm52404385e9.6.2026.01.15.07.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 07:34:00 -0800 (PST)
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
X-Inumbo-ID: 9e37c8b3-f227-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768491241; x=1769096041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NbpdJ4oz/23kVurwARU+dvJPq+baPgP/RkY7VRdYnyw=;
        b=VxXN2THvrH8/Hpaw9EPbTsdWnlgUDa+sKxZkBpG1wBdABgnI0c+/KL2PxMv+ZMgzQK
         /5Kq7M84fk+pPVTjkb9/BEQw2hsbcaGq3s6pIJlfFxn2kV1tYbMfC1an3YSJrmz1JC9Z
         avuiH/SU/13Qj86st2nJvV1VFRkM8GJzSPqz84Jr0dE4G65RWM0eK3zioDhaPNFiwOOw
         sKz4RdJ4avSkvCM5Ls7i3H/2e7Kn9tCZUrwR09tNXJpEWBNGCbkIAdfVMZivuCQSnasH
         FSmtbFER6SosRhoRh2H6YKObV55IJBWuWtRuJT2vvNMma9LexbLdHgBgiZqwvaxMrdj2
         2i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768491241; x=1769096041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbpdJ4oz/23kVurwARU+dvJPq+baPgP/RkY7VRdYnyw=;
        b=P/Mvd3WrdkBOYm8alJv1P8RdWNCUZYTtvZg/UrVPqZGGo2BQta1WzMlWNmK7bzCrm/
         uMlop+ZGxvGMEpaR1YuOe83Pusy+18ycJy6/vmowQ1LwvebNUOqx3Z7taIAP53eTqKw7
         IRe2yEGpKdVVwhMDbiiPol7CLpWJyjbyg2hpNlK5jPX79d6Re1BRlRh+/S2yFtZExN+Y
         tpwpdke5nwEms20P5cZDpm8jCxy+zSg/V1ZcAMSXzOZMDZDltm8Etnm2SY4UseNq6IQh
         UCU96MGo4F4aKWGmAiEQrOpi5boJJxK0fT78w9bsy44XJ7o4VCkSvCZaOrH/+oFVmNd4
         m5CQ==
X-Gm-Message-State: AOJu0YylI/t0axxK6Whj2iiLsS73BlWUzSbeSGOnV2084gzlIAMrURJO
	dmMXTBZj6w0O5btM2CGvF+jFVtKIaJrXmbB59Dr6CYtMWDciY+F9GXKgayJsYK1Hyg==
X-Gm-Gg: AY/fxX650Xsl7NXvde1okftIcluezdAxek5eRQuR1zU5ldpNJqScPTtMMm5JLMfKo6V
	AX4004uf0OC/atBHOexKDFYbSbnDz+AKUec1uIpxZ/lhvlLT1f7WqUKGvuogQQFWf1rKTykD0W0
	cFk+tyOfm6wJIUJKMhfHw0lPoAL2dOHs5y1s9O0gdsvMVLEemnmoXdfkPoZXwmUO/7SE0IlNyb9
	iR6SFFTEH4cxjxir0yP7Fs3JxqA9cAhPa/37keXWn4k/qmFBfL5A35pcWYVyY+0Vc9Arc8hEKME
	jLzkV8T+HKiAHzWSKGVjPPQA9c7coODk1mdooroYUYer+oAm6BuFCSJejRitQXIhDl+0rD1EzLo
	AhUxyvem2UZnNIsVXFKXfWtWhJp8V3EJeS2hvF75rcowZHG/gQoFM+06Oc+JGxS4Ahaj/PYiVHt
	mQuhbzC39jhEmMwFElWTB7errW1PC15LqgL4aAsNFzU9fJJyq1sTtpLNV8EcAoB73mIUPja3W2V
	WE=
X-Received: by 2002:a05:600c:3e14:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-4801e30b8ffmr2183025e9.13.1768491241530;
        Thu, 15 Jan 2026 07:34:01 -0800 (PST)
Message-ID: <d237b414-eec7-4cf2-bf1c-0c12b0f9f364@suse.com>
Date: Thu, 15 Jan 2026 16:33:59 +0100
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
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com>
 <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com>
 <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
 <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com>
 <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
 <35819233-07ba-4e00-8939-74b2f4454250@suse.com>
 <CAGeoDV_fN84JPxLJfE0uWujYfeb+7t5HnFhK-up1Oymk0VT2MQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_fN84JPxLJfE0uWujYfeb+7t5HnFhK-up1Oymk0VT2MQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.01.2026 07:00, Mykola Kvach wrote:
> On Mon, Dec 15, 2025 at 1:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.12.2025 12:00, Mykola Kvach wrote:
>>> On Thu, Dec 11, 2025 at 6:40 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 11.12.2025 17:30, Mykola Kvach wrote:
>>>>> I have now attached the corresponding build log.
>>>>
>>>> Okay, so indeed not a table size change issue here. Then I fear some instrumenting
>>>> will be needed to at least know what exactly is going wrong. Alternatively you could
>>>> arrange for the intermediate binaries to not be deleted, and make them available
>>>> somehow / somewhere for me to see whether by inspection I can gain some clue.
>>>
>>> I prepared a small patch to keep the intermediate artifacts instead of
>>> deleting them.
>>>
>>> It removes two cleanup commands:
>>>     xen/arch/arm/Makefile: drops rm -f $(@D)/.$(@F).[0-9]* (keeps
>>> .xen-syms.* intermediates)
>>
>> This alone should be sufficient.
> 
> Understood. I have rerun the build with the cleanup line removed
> so the intermediate .xen-syms.* files are kept.
> 
> The build artifacts are available here:
> https://gitlab.com/xen-project/people/mykola_kvach/xen/-/jobs/12707528457/artifacts/browse/xen/

Apart from the intermediate files there's a file named xen there, but xen-syms
is missing. I'll see what I can do without that.

Jan

