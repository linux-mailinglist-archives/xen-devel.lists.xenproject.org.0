Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE9CB6729
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 17:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184380.1506846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjSO-0004MD-2A; Thu, 11 Dec 2025 16:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184380.1506846; Thu, 11 Dec 2025 16:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTjSN-0004JW-Vb; Thu, 11 Dec 2025 16:23:55 +0000
Received: by outflank-mailman (input) for mailman id 1184380;
 Thu, 11 Dec 2025 16:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTjSM-0004JQ-Ei
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 16:23:54 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c86b036e-d6ad-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 17:23:53 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47755de027eso2370245e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 08:23:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a851sm6945537f8f.29.2025.12.11.08.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 08:23:51 -0800 (PST)
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
X-Inumbo-ID: c86b036e-d6ad-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765470232; x=1766075032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4xW/aVp81xxlOlQp6Qu7w78OFuVlRLTp3quohIuhsw=;
        b=RSGndpbpZNGVvoPbmPyTuPrRJ6U2+4xa0mqQ6uzAy/MjxbMozFSitWvL4fszATGaG7
         LmVwL21WGRz90fRYJHr6Rzc17LdxDCHDrrAIm5TTm+rN+dXk3wcOYfQ9n+2GB2Xl2ShU
         fvoW+nvYM4XnHozIJ/3fFusq5pN31pi0xa1uKrJ5GY/YyNH9iza9XhYXugsY52kDruy0
         NG1tNe7zTMXFWMYBtEt20MUWgQDdggaKdX/jfjFJDjRKO2W5La2+LAAKgd04BjRQIObU
         uLkhccAk5XVKMyoSv1JPmeKhs722mmNYnf8jgnN6p50DPTtcORtGa84P19/9r48TKQt2
         IYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765470232; x=1766075032;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4xW/aVp81xxlOlQp6Qu7w78OFuVlRLTp3quohIuhsw=;
        b=K+uEJ3zGdFKCfxx1EYX/DRowDwTRdWAoH/MmoSOefYceHIAYdBLFkL/t6mAt/vfTi2
         1mIm/XspmH6Opbk3Kt+XgVL3wB9pwnKcviTdWQrK+xFA5jAK7HBKR/M7Pos9HaegWZWj
         RzajHP2KG08WtfDPT2tXrYr9O/0EmAWnqTgkolq2bM895u4+C2CFTr/I22pZxO2qnDzg
         cpvNaxHuQEqYkwS7qameHmHApjHTZ85v1f3agTqMWnd9lWSzjGjA10rqFxA9nnEr9DMS
         UQL2YVY+I95oLDsO0+HpDAc3CAHJNxCu7PIqYRFovXb7UncbxNV2ehEkMaL2MAD5hdMZ
         WkrA==
X-Gm-Message-State: AOJu0YyGEpsc2mKc6hKKXjl1Dd5U0zyIp7E+AjAmlUXmMcuZhNgGICqt
	BVReNnVGxo4dSCGpVDmFqxjwOGnYdFljlC13fIkzJRc47XpXdu0FY473EF3SpPq8Qg==
X-Gm-Gg: AY/fxX62QQhpp+LfKJGclQhSBW4fShEnyM194Awis2gSxY7bk0F0sicYmiDgF7Utt+5
	5+rCUZoZUuJo6tdBMIYuUHzwVEslmsfyBrBJuDAYvUGb8SbF3VlmE2rgxGn3fV+MKE1PGESTFXN
	uyGvn+H//YZdizSeYyFHqEY1Hib18YZ8BSIqTMoHiTrrYZhez79CdOMQBWuQnlfIrCJ2aLvZCy4
	wbSv72jXWFIlv6LQesOPqVHmDBdmrrIS1NFc8NSKY7vzn2v489nW24On7vfpZAGSBsgXHF6Bxds
	Ryn+84gZdb7XX1vJeDpscRFPjeCiemSnaZK7bhxgX5fu9DzJ4qdwl3TosPRPn14h5QmwQOVjMMB
	3g2oCx7dPkniviB0T3yN1az+jotbWZKuKAa8cXzFAuv4EF4JUlwfLT+ljWq3azQ5mzReWlHi8ri
	q0BqDOEv1Zj09aiIKWg1LHuUqqR0/OryIZqSJXR2+gRYU0lMapdrVS9l2XN9RXGLo2H77cViHUl
	3I=
X-Google-Smtp-Source: AGHT+IHG842eRlVSjDvL4qVp3+K4uuXsw6fyPdAHD/cGBWB2gmT0Tid3YC9I5J4I+zaw7G4cJXzgCg==
X-Received: by 2002:a05:600c:8b35:b0:46e:3d41:6001 with SMTP id 5b1f17b1804b1-47a83859055mr62020755e9.34.1765470232277;
        Thu, 11 Dec 2025 08:23:52 -0800 (PST)
Message-ID: <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com>
Date: Thu, 11 Dec 2025 17:23:50 +0100
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
In-Reply-To: <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 17:05, Mykola Kvach wrote:
> On Thu, Dec 11, 2025 at 5:59 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 11.12.2025 16:57, Mykola Kvach wrote:
>>> On Thu, Dec 11, 2025 at 5:31 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 11.12.2025 13:06, Mykola Kvach wrote:
>>>>> On Thu, Dec 11, 2025 at 1:44 PM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>>>>> I tested the issue with the provided patch, and it is still reproducible.
>>>>>
>>>>> I also triggered a pipeline with the patch you provided on top of my
>>>>> changes [1],
>>>>> and it failed there as well. In fact, it exposed additional problems
>>>>> in other jobs.
>>>>>
>>>>> [1] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/2209153728
>>>>
>>>> These are the failures we're trying to hunt down.
>>>>
>>>> Looking at one of the Arm build logs, I can't see any indication that you actually
>>>> extended the patch to Arm's linking rule. Hence my conclusion in the other reply
>>>> may be wrong - we simply still don't know what the situation is there.
>>>
>>> You're right, I missed the necessary changes. Would this diff be sufficient?
>>
>> Yes, this looks to be what is needed.
> 
> Unfortunately, with this diff applied the issue is still reproducible
> on my side.
> Please see the attached logs for details.

IOW the build succeeded with the check added? You didn't provide the build log,
so I feel I should double check.

Jan

