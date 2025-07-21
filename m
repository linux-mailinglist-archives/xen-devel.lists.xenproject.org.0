Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B4B0BC7F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 08:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051011.1419323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udk0g-0001rD-SQ; Mon, 21 Jul 2025 06:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051011.1419323; Mon, 21 Jul 2025 06:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udk0g-0001pO-PV; Mon, 21 Jul 2025 06:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1051011;
 Mon, 21 Jul 2025 06:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udk0f-0001pG-69
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 06:28:25 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6c934e2-65fb-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 08:28:23 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso2148633f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 20 Jul 2025 23:28:23 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f280:2981:7570:f40b:efd1?
 (p200300cab711f28029817570f40befd1.dip0.t-ipconnect.de.
 [2003:ca:b711:f280:2981:7570:f40b:efd1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61c9f16d9sm9569890f8f.0.2025.07.20.23.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 23:28:22 -0700 (PDT)
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
X-Inumbo-ID: e6c934e2-65fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753079302; x=1753684102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D+DsImP98ZcRha5XYucldwAA7H6nFXHxiKzxxdf+yJM=;
        b=IMko6vPUDKM2H3QEIxjwn2Vu1qy7kOpPxrt3mwd6QetGsNMi5GnyQkbPG9PCnCtxJo
         LQdUcvNpaITwmvUfnZrpWLiHZ6OltRcH2np2ZJIn7qe5XN2XmMZjYUZ9iIr5Y59QyFZC
         7vp0Vjd2TJzng5IIBt1eynJ331zjdJk3JeOKlrPWvWpFkc7gxvtim6X+TijinKt37yqb
         0mYlBtQaJtIA/ZizimQSGtEy8/i9IVV88v9kVCoPAWJ6IkB/pnJcKCpwbf+mv4kFJnxN
         OC/zEITrrX7fxavsopfzTi+ncgCCHA9wOAcDRh8qB9V/KccaGhBrY9p6+FpqDRpTAJYq
         7WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753079302; x=1753684102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+DsImP98ZcRha5XYucldwAA7H6nFXHxiKzxxdf+yJM=;
        b=SQVr6n4dFQmfxAifaAX0ybqbdUWqWKEOb4bnxfRbAaZDaJRft/5Iz5gjr9M6Pir+u7
         XGATPrvDPVhwV8+ObWYczazBC5i+uqeQaiGV5H+Xqbz0O10dO1jfon4jOiYAiOT83Wyz
         dm4XKCMWmfthz67lXN9XYOQ7Ttd7aS/Q5ZbkSawuh/TC/E43Df4bp+omrPkYaGxMPkmK
         ZsqvAcm/7C3EbNfX3lD6rowvAcoyFFBRjbo9yyijefVT88wbW0FlLlR3/bXlVG+GYvQI
         C9LXKJ6+eB1zvvs3WLEBpbDthzs8BrCH0aAP9zqebUUnH3cz4nSqbK5/Rt7aWz0OJ6Fe
         xckQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpfiP3LtJA4BefB5PVA23kV9E6SmEI9k/tbgSPHUVgzmQ3J7hX7WPPjETb/XbGo4edS0h4HzeQBZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzlhb5DZrPXGwjaf0ydLOGTvN3g5Yj1Pwb5e1fAYWtFY+WUtAoJ
	Nr3RkOBHCLxTpHao7sbvYAlU/NgRFDEzt8VbeAn6m7NSf8j5L1CMDzyJHvKcAYD8Eg==
X-Gm-Gg: ASbGncvmZD4sPd2df30bweoq1c3+oAYld4PWvFks5EHU8/uAtR0BsajjD5An00/L5ct
	6cKhcwL33Mb5vJC6Amxn4MaoxTGxIeItDYSZjXblrMQAygvEi5J342XArMJjjogP3yZV1ifnVYy
	h9+ZCgMAFA/MV7EaFZ5FMWDPthQ2WdV6b/r28/GQjiHRBCC69plHeTaX/sRy/B56Pn9N0ihFK8T
	YNuomdGV/hFSE8rtElx4E2MLO1AMk9f/u42asOXXmb2XynIv2raCpf3Xf5pn9pdSGCsCtTrERI0
	GGoKYXYxmvE8h3oBV69RyZZUV/iua18oJ3dlx5s0KG1LoRd560EUHbPEIhj/jGeL0pFm16b213B
	XhMzHGYYwxpCZHgOTfTonLg8fuT7V8Bz4RHb0V83zEBNMzqTCQ9VU6IDbD50GBTv04fYm7fZq//
	HsfOW11CJ05ipEjQmaETccGa//P1Lsbd76h7zG/WY1+OM7UMHOQ20+ZGLz
X-Google-Smtp-Source: AGHT+IFGba2nM6wT0ETXf30EnAqSURw7u7mv71vLd9sRYDYQ5vAwuB2Jxxssdr6OVB0TjAzkawd0uQ==
X-Received: by 2002:a5d:5848:0:b0:3a5:39d8:57e4 with SMTP id ffacd0b85a97d-3b613ea2865mr11266288f8f.41.1753079302592;
        Sun, 20 Jul 2025 23:28:22 -0700 (PDT)
Message-ID: <3a3e48ff-886a-46a8-81af-2cc64b6d797a@suse.com>
Date: Mon, 21 Jul 2025 08:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Don't allow HVM alongside PV_SHIM_EXCLUSIVE
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250718151214.24835-1-alejandro.garciavallejo@amd.com>
 <47704e30-0f8f-483e-b22e-5cdb767699d5@citrix.com>
 <DBFBAURYB2J6.LTV7SKMB1PQQ@amd.com>
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
In-Reply-To: <DBFBAURYB2J6.LTV7SKMB1PQQ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 18:12, Alejandro Vallejo wrote:
> On Fri Jul 18, 2025 at 5:41 PM CEST, Andrew Cooper wrote:
>> On 18/07/2025 4:12 pm, Alejandro Vallejo wrote:
>>> Otherwise compile-time errors ensue. It's a nonsensical configuration,
>>> but it's supriously triggered in randconfig jobs.
>>>
>>> Fixes: 8b5b49ceb3d9("x86: don't include domctl and alike in shim-excl...")
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>>  xen/arch/x86/hvm/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
>>> index b903764bda..f57a87bca3 100644
>>> --- a/xen/arch/x86/hvm/Kconfig
>>> +++ b/xen/arch/x86/hvm/Kconfig
>>> @@ -1,6 +1,7 @@
>>>  menuconfig HVM
>>>  	bool "HVM support"
>>>  	default !PV_SHIM
>>> +	depends on !PV_SHIM_EXCLUSIVE
>>>  	select COMPAT
>>>  	select IOREQ_SERVER
>>>  	select MEM_ACCESS_ALWAYS_ON
>>
>> I deeply regret not nacking this originally and blocking the patch you
>> listed as fixed.
>>
>> This depends was explicitly reverted in 568f806cba4c because it breaks a
>> lot of things, notably `make allyesconfig`.
>>
>> We're going to need to find a different way to fix RANDCONFIG.
>>
>> ~Andrew
> 
> It can be done the other way around. PV_SHIM_EXCLUSIVE depending on !CONFIG_HVM,
> but that won't help with allyesconfig.

And it wouldn't be right either, in the model we're trying to follow now.

Jan

