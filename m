Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5987A817
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 14:11:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692429.1079543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkOOH-0006ZE-Kw; Wed, 13 Mar 2024 13:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692429.1079543; Wed, 13 Mar 2024 13:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkOOH-0006Xh-IL; Wed, 13 Mar 2024 13:11:29 +0000
Received: by outflank-mailman (input) for mailman id 692429;
 Wed, 13 Mar 2024 13:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bR7k=KT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkOOG-0006Xb-CR
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 13:11:28 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 331fdf1d-e13b-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 14:11:27 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso5252543a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 06:11:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ef9-20020a05640228c900b00566a461e1ecsm4942944edb.73.2024.03.13.06.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 06:11:26 -0700 (PDT)
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
X-Inumbo-ID: 331fdf1d-e13b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710335487; x=1710940287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ukep3jUkH4sPmqfRTOcW0WYTM94o9OLOjax8bs8jJRo=;
        b=AZQAOJLy150kymBl7E9zvqlnDR99N3FcmJRdCXJvtsGx0R4nUwHVUb+Sk31gaX7JHf
         Wx0sX4E3QyhdUI79ppuPZhSFVVhHMeg/mqGwMYSovuJUHCdACBrRSGJ9Sa8FP3AY98/1
         eWJUkl/bMpOY6V2PxgkmaHYj1Lvp0Kfe7l67zYq6TPRzFBOt6rgf1fDLvTJhe8Eb2ALZ
         RypMRYhqcpatkmHOF/eF24jQUi7KqkqWaVY1em3F7PUyPQE6p4XXoi72km77xqmcfxRb
         HWv0ycDzBJpVG12jkdfMOO4eVn3amuWlJEAD33Isq8RfhQeMrO14HW5WG42Bl//vokB3
         X7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710335487; x=1710940287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ukep3jUkH4sPmqfRTOcW0WYTM94o9OLOjax8bs8jJRo=;
        b=M7a+CuIVR7Ks0sLLWFNKxMesVhY/BGoxjskniED9vlVM/8lLhvu1QjlVWgvISuNUBs
         a7N860stQUd9az8GBnQ7CufcuKmUygfDopCkFBgu354q9DZRGfH8dghR6/Hs3P5NWp9w
         PIyZMqpLLg9EealBLVGjO15e3MvYiGXbcXr7hvKvJC47xyJaV0hQO8f6fvl2/V5Rs3I8
         GYUkjshnQQWjFhTmLpNxi+d3u4sb9hJq7hhUMITdR5QJMSLfavDpbqXz3XFhQFH4rX0E
         KhaQ4/gxOCtie4dWqpm49n3P8vtUO7qTABJMg63dyRzce6x1N5/sb1G92Zv6fS2eRepp
         VG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEnI2VpKHmNoqaAx/GECZ6iSPC3QjRncnzPdJWi0nrElTPbWsZw/18IvOlwfQwxtC4Iua6N2ryTrH3p7DDPwoWJOoV83kx4kYIPiUc9RI=
X-Gm-Message-State: AOJu0Yx1Hsf/BXQkjyuXjjgnZ2rwD7Z+CTX999Fu4Z7OhYFTgKQLhKYy
	kOsx0c3m6EK/Gg2HWB4HtPAzmYW10bPW1QYlpfWobgoduW5rtE5YCo+3E10Twg==
X-Google-Smtp-Source: AGHT+IHr6RfFoRkwPirHm2TaTZhSKY3iT4ZC4eMs4MD9pxkEA/3R2vQKyWhNqQVPzTxC7WXvUs6/Lw==
X-Received: by 2002:a50:c048:0:b0:566:aba4:7209 with SMTP id u8-20020a50c048000000b00566aba47209mr3572857edd.13.1710335486804;
        Wed, 13 Mar 2024 06:11:26 -0700 (PDT)
Message-ID: <746d063c-c5ef-4a16-a9b1-30215045573e@suse.com>
Date: Wed, 13 Mar 2024 14:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/9] x86/shutdown: protect against recurrent
 machine_restart()
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <87b0e650f28038c2fb64c5eb607c8fdaa7b4db07.1699982111.git.krystian.hebel@3mdeb.com>
 <665c7f47-a218-4187-858d-562bb5b9513b@suse.com>
 <173cc1f7-d906-47ed-bba3-d43da219fd7b@3mdeb.com>
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
In-Reply-To: <173cc1f7-d906-47ed-bba3-d43da219fd7b@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 17:05, Krystian Hebel wrote:
> 
> On 8.02.2024 12:30, Jan Beulich wrote:
>> On 14.11.2023 18:50, Krystian Hebel wrote:
>>> If multiple CPUs called machine_restart() before actual restart took
>>> place, but after boot CPU declared itself not online,
>> Can you help me please in identifying where this operation is? I can see
>> two places where a CPU is removed from cpu_online_map, yet neither
>> __stop_this_cpu() nor __cpu_disable() ought to be coming into play here.
>> In fact I didn't think CPU0 was ever marked not-online. Except perhaps
>> if we came through machine_crash_shutdown() -> nmi_shootdown_cpus(), but
>> I'm sure you would have mentioned such a further dependency.
>>
> BUG_ON() in cpu_notifier_call_chain() (I've been playing with some of
> the notifiers and one of them eventually failed) resulted in panic()
> around the same time AP did in pm_idle() due to inconsistent settings
> between BSP and AP for MWAIT/MONITOR support after TXT dynamic
> launch. There is 5s delay between smp_send_stop() and actual reboot,
> during that time AP spammed the output so the original reason for
> panic() was visible only after unreasonable amount of scrolling.
> 
> Adding TXT support is the reason why I even started making AP bring-up
> parallel. Problem with MWAIT doesn't happen in current code or changes
> in this patchset, but handling of such error is related to SMP so I've 
> included it.

If you mean to address a latent problem, then you want to say so and you
want to make sure you include enough detail on the (future) conditions
under which the problem may happen. Otherwise anything you say wants to
match present code / behavior.

Jan

