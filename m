Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E7DB037E2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042599.1412662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDZh-0005Tp-SD; Mon, 14 Jul 2025 07:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042599.1412662; Mon, 14 Jul 2025 07:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDZh-0005TB-NB; Mon, 14 Jul 2025 07:26:09 +0000
Received: by outflank-mailman (input) for mailman id 1042599;
 Mon, 14 Jul 2025 07:26:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubDZg-0005J3-CE
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:26:08 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cec7c854-6083-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 09:26:07 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso8322725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 00:26:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de436ecefsm91982695ad.259.2025.07.14.00.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 00:26:06 -0700 (PDT)
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
X-Inumbo-ID: cec7c854-6083-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752477967; x=1753082767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W2SXayRwSgIs1qbpMq/6/AnuocAp0jk96mptmDCwW3A=;
        b=VnuXAbqB9R2WO+7nc7gKvjXpMeM5iiPG/dX9du9+TCqi9mnICcKTa8OM4IqfLzTLAE
         pOit7n91TGEktzu7sBHIdGN2v8Qa+rrNSs7qDrjJMpyU2nHvl5MdKybWMVSaMQkcCXqr
         4EjGJZLHWetcj5kcwnMM8ABxg7cp4ygnN1eaVXKDGoHkmL1wMqgeSJFadTdfYPZEjQzq
         TCVOHuUNt0q3s4SUob5/YQDOZf45NG6z1+Cq+RqaBhwsSUbrj0l0YHSMT2nKoNXxhVPu
         Kx8vBP0i/oK+9hi90oYX2uDuyW+GY9G3ZltWwRly21G0f5acpiix2qcQBpDOmvvUQ06i
         zelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752477967; x=1753082767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2SXayRwSgIs1qbpMq/6/AnuocAp0jk96mptmDCwW3A=;
        b=oUUPSwvhnVxGhRKDF/d70c2ScSMeaTDvr8J1UMA5DR3uLBnogQWmPRHyai5Ry0srfD
         Wi86S+hPXxO8pJNxU18OJ9RXC+dSzsldPmn18H62F3qmvI+mp8K9TwaqNafuvEs9XN1z
         ic7/EKhVWpJu9osiR/p0D7/UR96wv9eRDfjnaKTRSOiH3DutpiQa+5RErHa0AieY+3yn
         L379GfZCaF7eYGUweJD6PdYn8NCIMsOGyIQKLwqeRdNbEdOfCFHo1TaC6f1w2K2UXJ1P
         Es/B0iCYsY1jkpQYN2i1ryoB3te9ne2azZcj3pKoYb/+SHAvImfXkYG2v3uwnp71XY9z
         BmqA==
X-Forwarded-Encrypted: i=1; AJvYcCWgqJ63m7drOFA3gI862FzbQ1uLu+4BNHNt9GS6Gu2t0tNabQAJyuDYCPH1xsOCpx1xuJ2fJGCQi8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3XRUTHhimd7sXFDqXYzuVBLWUjEFpRfJy9Peo1ujRpofvCiML
	ztod6yxkfWRJCacSZDL3WfndO0UTm6Z7GWd9PSeWalE7Ntkh9PUyGv6DetebCe15zQ==
X-Gm-Gg: ASbGncuoSSeN8y/tyAOfAMP5cpWXGU1SVgSs0zMu5jPd3kgn9Zgao8WIa5QCrSYWXIS
	0L5tM2Oia9WOOksJdtE7ujFsqd0VFHcbIfnCNVd4OeDK5JIsl4FoQh2E63ecBAz/UKRXtmxtHIu
	Ucmf8nhyp9EXtTnbKgWGLgGknaVCJ4DJNWfTTZDiWbG1Iy/rCI+2m0P5Id5fzfuwHOyu6GBMdH8
	D3ApxNvxM21h3qk7haQ6FVV/NbzM8khkMZaLuJTMFBlDJsvnHKo8mwVgDkyGLlFcWkKoPf72kPJ
	0k0y5zXqdHzNINGjQdWVfQmlFjlu/B4Ha2L1+yWfuYYOC938btORQ97Hqvh1Oy/K8jdkdTSjV0/
	xe2wxGEQNKzmFQqrN1Dm8gWipsBEYFxX7BdwFbao6mJmK2bcoRMwAl4ws8Jw1ajKvHN559Mw1Pu
	tIZiFc2f74log7GRQxxw==
X-Google-Smtp-Source: AGHT+IHCsad35g/znDY8Fj/BqYSlut8P99GRMoU4LXJZ4DybGEYor0HFhK9nnJ6Sy7CBMCihb7zRJw==
X-Received: by 2002:a05:6000:2707:b0:3b5:f8d5:5dba with SMTP id ffacd0b85a97d-3b5f8d55e64mr3848993f8f.30.1752477966901;
        Mon, 14 Jul 2025 00:26:06 -0700 (PDT)
Message-ID: <1110e604-0eeb-4786-a829-8f92280b7dd8@suse.com>
Date: Mon, 14 Jul 2025 09:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tidy page_get_owner_and_nr_reference()
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0d330757-ed73-42bc-8634-e8d445f69c4c@suse.com>
 <d6ac150c-b2c0-4d90-af1e-64f2df151e60@xen.org>
 <5e52900c-97fb-4895-bde5-33ccfb132986@suse.com>
 <079ead0e-e613-4c58-89f4-8a0df1294ba9@xen.org>
 <e599c29f-03e4-40e7-99df-33b7f2143fbd@suse.com>
 <e246c2ce-dddf-49bb-8013-cbc302fe5ff0@xen.org>
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
In-Reply-To: <e246c2ce-dddf-49bb-8013-cbc302fe5ff0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2025 12:37, Julien Grall wrote:
> Hi Jan,
> 
> Sorry for the late answer.
> 
> On 03/07/2025 11:04, Jan Beulich wrote:
>> On 03.07.2025 10:52, Julien Grall wrote:
>>> On 02/07/2025 14:37, Jan Beulich wrote:
>>>> On 02.07.2025 15:18, Julien Grall wrote:
>>>>> On 02/07/2025 14:06, Jan Beulich wrote:
>>>>>> When the bumping by <nr> (instead of just 1) was introduced, a comment
>>>>>> was left untouched, and a bogus ASSERT_UNREACHABLE() was inserted. That
>>>>>> code path can in principle be taken (depending on configuration coming
>>>>>> from the outside), and we shouldn't assert anything we didn't check
>>>>>> elsewhere.
>>>>>
>>>>> I suggested to add the ASSERT_UNREACHABLE (see [1]). My take is the
>>>>> overflow is not something that should happen and it is good to be able
>>>>> to catch very clearly in debug build.
>>>>
>>>> But catching an anomalous entry in DT (which aiui the values come from,
>>>> even if perhaps indirectly) isn't going to depend on people using debug
>>>> builds. It depends on what DT blobs they use. And issues there shouldn't
>>>> be checked by assertions, as those blobs live outside of Xen.
>>>
>>> I agree we probably want check upfront. But I still don't think we want
>>> to remove this ASSERT_UNREACHABLE().
>>>
>>> By the way, I am not asking you to add those checks.
>>
>> Sure, I wouldn't even know where and what. I can re-send just the comment
>> change, but that would feel wrong as long as the ASSERT_UNREACHABLE() is
>> actually reachable.
> 
> I am guessing you mean this change:
> 
>           /*
> -         * Count ==  0: Page is not allocated, so we cannot take a 
> reference.
> -         * Count == -1: Reference count would wrap, which is invalid.
> +         * Count ==   0: Page is not allocated, so we cannot take a 
> reference.
> +         * Count >= -nr: Reference count would wrap, which is invalid.
>            */
> 
> If so, I think it is still valid regardless whether we continue to use 
> ASSERT_UNREACHABLE().	

Yes, that's the comment change which is valid regardless. My reply was about
the dropping of the ASSERT_UNREACHABLE(), though: To me, dropping that
change simply feels wrong, as it was put there by mistake at the same time
as the comment was left unaltered. So to me both changes still go together,
unless by a patch going in earlier the unreachability of that return path
was indeed guaranteed.

In fact I guess I should have added a Fixes: tag to the patch.

Jan

