Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7702AFDF52
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 07:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037685.1410236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNW2-0003my-NW; Wed, 09 Jul 2025 05:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037685.1410236; Wed, 09 Jul 2025 05:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNW2-0003k8-KQ; Wed, 09 Jul 2025 05:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1037685;
 Wed, 09 Jul 2025 05:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZNW1-0003k2-4h
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 05:38:45 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa336c00-5c86-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 07:38:44 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso2824267f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 22:38:44 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2be:e417:6234:73d2:3c23?
 (p200300cab711f2bee417623473d23c23.dip0.t-ipconnect.de.
 [2003:ca:b711:f2be:e417:6234:73d2:3c23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285e236sm14712280f8f.100.2025.07.08.22.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 22:38:43 -0700 (PDT)
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
X-Inumbo-ID: fa336c00-5c86-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752039524; x=1752644324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cG9f08U84saaTi8wzRsP66B/MAIKLHNWGF+vEmJU/XI=;
        b=YG0RbBR64hDZHbFztxpi7ToUOe8oGGlumCOUBt7/SzLCz0T4F8JI8kjIhOa7eFoCCC
         8Alge59xZ6bwhVmblpuz39oURzECZbpObSWO8bqeLKaN/ZwFKqX6/hAtURq/CZ7QWewp
         A4Jm2Iuv8F1PUm26M34zs1EJIoZfMSUnTe5lzPrrJKH9Pnau8SJXlfNLaxTSn8yfkRUu
         96I71iNUg2QdJgCaKBcremBF5gpkMeLdHuchNGIKNOH4OxTDG8bkXP810zJFY0FACkFG
         yVJhCprWLRdNGtCncmW5qJd6C2QPsMp7rWSNogaPDehsgFnGp+SjoYVFZx8Va7w52Bee
         n2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752039524; x=1752644324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG9f08U84saaTi8wzRsP66B/MAIKLHNWGF+vEmJU/XI=;
        b=lTpGEqYu9RMwiutPKpq8E8VNynQe+YZeQS7HYNl0YhYJ7clyyfwr2ticWgPtQDvfWk
         cf3oW4e0EU0Lw6Ucy8IuZVVHxPMMY/7d2rKGXvzjdSaJZB6ILUxvqze+5x3Em68eB6eq
         Os8msn6NoWWI/Cw0xlL+T2hI46i8j59LZlWXbpBqmY87to8FSnUbzePa3ZdRgycg6X3F
         uzkXc5kcR/OU+jbsQ3YfDqivqH0LwOqUbdRCv54hC+ASRxk0d0MqvlTaBh2eTiSI2DDH
         wBubrhlisp0wMCbtZtd1dJECum6exmU70D28sGnO2MjpTWOgNXYI3O3ADfH05ibDSSGS
         8sSA==
X-Forwarded-Encrypted: i=1; AJvYcCVcynnsaq37G9YvpORmiEP5ABFGtnWtythHefaQ8mrgLzUNWzus6paidCWbrbLANexLppi7m9+HYXU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMhbIvQx6ChyIjVojwWGa9JLsebODqnwCTrYlE8rnM8JTvTSs6
	AzUFFvZmyPNnNHfkWHeAe8qV9/AHEG/sLuj9P1IlW4dgB9ab6yWlO61M2xQvpk7POw==
X-Gm-Gg: ASbGncukbCf3PvS+2+C8IoYsO3sT0wo3UYc2V8wnN9Ijh0Ur2k9YbrtusIebzHn+ltc
	opuNfSPEJYQ1S/gshAzldcnhAxu5EAYZ6CwovQjucAef60BNf4tnkYh7Wa4TDB0/KWd0dkSGCbJ
	d7aTj952HCwzwmT0CImxMRDgXrHeHcCMWhXj8eAMLNdYVtxBPfI2xUJmbrURmbN4M/nvtEzi6EP
	HRe7Wi16Me+K07YdRtPg82VmaJTyBBg4p8YnHX7lrwEa9mCmeFxYL2QAHpC+5TmjFozTGNxa8Vh
	lgd1y1Sxai5vhR5R0gfIHH22VqOJUaOHoo4rD46S5H7A1ytd267kHQ3Xzef35w545GksnddLly6
	0L96N3YXeyWSeA9FUUOpQEXhVTDQ+LVaGVzPcv0DxGHLERDawDVRBF5FVlwp/1EehiDZ8SyfqgD
	F7tLIbA7+ug4pRkWRZr2F4
X-Google-Smtp-Source: AGHT+IEeYVUKeP0d7MLsxoPl5Two51vPcW5tI7FGMv9mu8Hkx65yDqVBJoGJTKvLEiLKHEeYIyjc3A==
X-Received: by 2002:a05:6000:2485:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3b5e4546cf1mr613753f8f.57.1752039523612;
        Tue, 08 Jul 2025 22:38:43 -0700 (PDT)
Message-ID: <27ca400b-ceac-40c4-a6ed-f26c1129ae2a@suse.com>
Date: Wed, 9 Jul 2025 07:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/x86: address violations of Rule 11.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?B?Um9nZXIgUGF1IE1vbm7Dg8Kp?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250624002018.4121819-1-victorm.lira@amd.com>
 <20250624002018.4121819-2-victorm.lira@amd.com>
 <b31da849-283e-4f84-854a-50da2d0878d7@suse.com>
 <alpine.DEB.2.22.394.2507071453370.605088@ubuntu-linux-20-04-desktop>
 <6b23c2a3-9e2c-492b-843f-c3f830394f3e@suse.com>
 <alpine.DEB.2.22.394.2507081031210.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507081031210.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 19:32, Stefano Stabellini wrote:
> On Tue, 8 Jul 2025, Jan Beulich wrote:
>> On 08.07.2025 00:00, Stefano Stabellini wrote:
>>> On Tue, 24 Jun 2025, Jan Beulich wrote:
>>>> On 24.06.2025 02:20, victorm.lira@amd.com wrote:
>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>
>>>>> Use {get,put}_unaligned_t to ensure that reads and writes are
>>>>> safe to perform even on potentially misaligned pointers.
>>>>
>>>> Also applicable to the Arm patch: Please can such patches mention the
>>>> main subject of the rule, not just the number?
>>>
>>> +1
>>>
>>>
>>>> Overall I'm unconvinced we really want or need this on x86; I'm curious
>>>> what Andrew and Roger think.
>>>
>>> To be honest, I had a similar reaction to you, which is why I suggested
>>> on Matrix to:
>>>
>>> - deviate the rule in its entirety on x86
>>> - deviate the rule for all mappings except for devmem mappings on ARM
>>>
>>> Leaving aside ARM for a second (this is exactly the kind of very
>>> arch-specific behavior that is OK to device differently per
>>> architecture), would you be OK with deviating the rule in its entirety on
>>> x86?
>>>
>>> Or do you prefer to continue with this patch?
>>
>> Neither. Imo globally deviating rules needs to be done with care. There
>> are, in principle, misaligned accesses in x86 which can be made fault
>> (and I think this was mentioned before). We want to know of such risks.
>> Hence for a rule like this one more fine grained deviation is on order,
>> imo.
> 
> What fine grained deviation do you have in mind?

Ones for almost(?) everything that is having actual code changes right now
in this series.

Jan

