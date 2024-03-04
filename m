Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104698707B8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:55:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688471.1072627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBb6-0002eE-7e; Mon, 04 Mar 2024 16:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688471.1072627; Mon, 04 Mar 2024 16:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBb6-0002bc-4l; Mon, 04 Mar 2024 16:55:28 +0000
Received: by outflank-mailman (input) for mailman id 688471;
 Mon, 04 Mar 2024 16:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhBb4-0002bW-BG
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:55:26 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fee09b49-da47-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 17:55:25 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-566adfeced4so4960330a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 08:55:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 zh14-20020a170906880e00b00a456573f9c5sm962292ejb.0.2024.03.04.08.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 08:55:24 -0800 (PST)
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
X-Inumbo-ID: fee09b49-da47-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709571324; x=1710176124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNFZEtzSJ+jfThZTaJeRrh/ySGvQQLfYI0+jZ2xyf0w=;
        b=AHR25hecsVyY4jlRCM3ep8JNxpt9F432fh2+VvRYBbXNCgkZAAo3fQt84j+rOdksLr
         PqRqd231yLH5v5PPGb3XIE6tKDsc/8dsblvfDjXxHTt9/XiH2tUJwB2OfflG+ryC3cJL
         77BYh7tQ3Ne1LPmd6kw+7Gnl/aVdQ2VA00oRUrdNbUDv19A3h94yzacOlICXMJH2Iaqp
         nwlhubS3dElh/C6dMmrIgtjCfa3ffvuO1vJr3gm6ZDTYN9e7+y4cJEzoNtcBwnT6aEEF
         1h1caotBpZr/PI6vIP9fdQiZ+qobaM9Ld5k5jkkhO7VUxarkxc3HuUGStaIh+rWGBf2+
         AYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571324; x=1710176124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNFZEtzSJ+jfThZTaJeRrh/ySGvQQLfYI0+jZ2xyf0w=;
        b=S8huiqtfnSaGAk4wDanWp+UvK6sx0pCdGZ6zGYNzDSuQbqswYLXordKP5FQ2NvDjDt
         hCCHJdJBVC6IIV+Cq3gXiSd5XOYre9HXiAKYuaFdiuqsUjQ+2390KEBp0BeAGmNmmFe8
         C33xJ3V+i2EykYL6Dwgh9b3arrtPtRstu7PtWUcAWNlboUxHXdE93OLU1VVsRK+hiTF3
         BrPh7As20ASP2/AyC7ROrIa9tbU6AjVVK9zU0Y0g4IQ8Mi0vufBFzHbyyzGJFOKGAi6P
         S+RPSfcUWvcCnfPKhqmjp1WKPlniErQQ5T9tkkjverfC6ncUE5U6jOeKtUfjojCg83cT
         ukFg==
X-Forwarded-Encrypted: i=1; AJvYcCUJkdesmLo7TsyMP2ZRJyhRCGILDo4+tl0VH9UnJcvJlbZsWMKlHpg/eZzFubbUgVlgBClAaPgIEmyZ5X8hp7yvAhOmGIwiQfkhNh/z4X4=
X-Gm-Message-State: AOJu0Yzt5mve7hy2JrNKXvXUChpzTSJ09Ia2Lj8LElZ976GfSl11dbJ8
	sIg3O29mlLjpQlKW414HqutxfNJ1Zi0mrUARB1cEvqAI+MLs+ZflWIdbXVay7g==
X-Google-Smtp-Source: AGHT+IGwsm6Oo+lqBQZLQcBjgPg2tqH2eB8mW3pw3q2ZpiqpREEVrrJGIJgAtNLRQmpgS5ReAclfHA==
X-Received: by 2002:a17:906:f9c9:b0:a43:a834:c301 with SMTP id lj9-20020a170906f9c900b00a43a834c301mr7012574ejb.46.1709571324460;
        Mon, 04 Mar 2024 08:55:24 -0800 (PST)
Message-ID: <141ed8a2-df4f-492c-a192-4ffa7f4c8384@suse.com>
Date: Mon, 4 Mar 2024 17:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
 <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
 <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
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
In-Reply-To: <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 17:46, Julien Grall wrote:
> On 04/03/2024 16:41, Jan Beulich wrote:
>> On 04.03.2024 17:31, Julien Grall wrote:
>>> On 04/03/2024 16:10, Andrew Cooper wrote:
>>>> It is daft to require all architectures to provide empty implementations of
>>>> this functionality.
>>>
>>> Oleksii recenlty sent a similar patch [1]. This was pushed back because
>>> from naming, it sounds like the helpers ought to be non-empty on every
>>> architecture.
>>>
>>> It would be best if asm-generic provides a safe version of the helpers.
>>> So my preference is to not have this patch. This can of course change if
>>> I see an explanation why it is empty on Arm (I believe it should contain
>>> csdb) and other arch would want the same.
>>
>> Except that there's no new asm-generic/ header here (as opposed to how
>> Oleksii had it). Imo avoiding the need for empty stubs is okay this way,
>> when introducing an asm-generic/ header would not have been. Of course
>> if Arm wants to put something there rather sooner than later, then
>> perhaps the functions better wouldn't be removed from there, just to then
>> be put back pretty soon.
> 
> I am confused. I agree the patch is slightly different, but I thought 
> the fundamental problem was the block_speculation() implementation may 
> not be safe everywhere. And it was best to let each architecture decide 
> how they want to implement (vs Xen decide for us the default).
> 
> Reading the original thread, I thought you had agreed with that 
> statement. Did I misinterpret?
Yes and no. Whatever is put in asm-generic/ ought to be correct and safe
by default, imo. The same doesn't apply to fallbacks put in place in
headers in xen/: If an arch doesn't provide its own implementation, it
indicates that the default (fallback) is good enough. Still I can easily
see that other views are possible here ...

Jan

