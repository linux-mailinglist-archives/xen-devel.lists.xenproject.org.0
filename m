Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B188134C4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654632.1021774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDndY-0004wB-Df; Thu, 14 Dec 2023 15:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654632.1021774; Thu, 14 Dec 2023 15:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDndY-0004tg-Ak; Thu, 14 Dec 2023 15:28:32 +0000
Received: by outflank-mailman (input) for mailman id 654632;
 Thu, 14 Dec 2023 15:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDndW-0004ta-6j
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:28:30 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e74e276-9a95-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 16:28:28 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50c0f6b1015so9658768e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:28:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 he43-20020a1709073dab00b00a1e21893a26sm9462019ejc.222.2023.12.14.07.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 07:28:28 -0800 (PST)
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
X-Inumbo-ID: 6e74e276-9a95-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702567708; x=1703172508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VDIexrzVZRd3Ykzq4FJxkRhO49UpQTV8isXD61Khu0=;
        b=c7e2QKcRG8chva53PiSG933+C9BANgGerdsmzHOnzrbc3aK1h8kq7i9YJIFrZQCag7
         8Cqy7iuCjAPJQAVmWzni1RWFt5dOFRLsJTnyXc0PxDb5jSOv/BU+BJY95+D7ySsKxsLm
         JPq9y26SDc4snc87aHeZV92Jpxsp60gWj45tbor1VJ+EssGh4ALBlL+3w2H/JXvgKznZ
         x1pI5zNstDVc6/A6G5SZqh2tmL+Ek6cM9GxdbyVS9B5+x5hehyYkFodkAB54Oqsu5NSS
         f3ZVunrnrjBWPhwGwfgWaVMRhk9ZZ98MFUKodw1PHBiD2TFwHil1LUy9ZG4OPwDR0BeZ
         7xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702567708; x=1703172508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VDIexrzVZRd3Ykzq4FJxkRhO49UpQTV8isXD61Khu0=;
        b=FXr4xK165BrYV/MEgXh4fo/tE9Y3vAKpgTr9rFsizgmjFQc4lirg5z5y7JQthSO1St
         xOeiMoV1hvRo0oOSMKDpfuNzNQE158ywg1RRwmFhtZttoBvuWmDYXhc3eahwyYbAvJ6+
         npL31HIj9k4Jr3kIM3CcFNrWW1Y88Mvjlv6dQSVs4uFDSpXopqIquVGNATxyWM1qIN2g
         hR6626v1mX6lGhGV/42r6MJcXxl+KUnXyCPuGfTYLRe2vANVXQmlHKER1plAjn04OdYp
         OEMQ0HpFSYTI3piX/ZVeyypTyAfX/lUMax2qK35aJ37JMl1+zrM6gUIf8VrNgwPBAlW6
         7z6Q==
X-Gm-Message-State: AOJu0Yy58Z99yBpNg44z8NI2kaGzn7k3gGcVm+FLEvnNHYCfIijgl1j6
	LuGSdcoOE3UDGva7g3foThxA
X-Google-Smtp-Source: AGHT+IHSyz9YG8lLQyzBxZwNK2fJATEg9kKQ2YRefDwzI/iXKSEHI4XxsE6n8kjz8k0FM7VZJRD9zQ==
X-Received: by 2002:a05:6512:23a2:b0:50b:ee8f:2fb1 with SMTP id c34-20020a05651223a200b0050bee8f2fb1mr5881333lfv.10.1702567708538;
        Thu, 14 Dec 2023 07:28:28 -0800 (PST)
Message-ID: <9030ad37-62f2-4cfc-8f82-83c51cd5c763@suse.com>
Date: Thu, 14 Dec 2023 16:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-2-roger.pau@citrix.com>
 <4f6c3481-a44c-4176-a414-b32639556bb0@suse.com> <ZXsFCSd1xpngciP3@macbook>
 <89c741b3-9388-412e-87bf-4253e28c7808@suse.com> <ZXsdKsQS20IAyAny@macbook>
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
In-Reply-To: <ZXsdKsQS20IAyAny@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.12.2023 16:20, Roger Pau Monné wrote:
> On Thu, Dec 14, 2023 at 02:53:13PM +0100, Jan Beulich wrote:
>> On 14.12.2023 14:37, Roger Pau Monné wrote:
>>> On Thu, Dec 14, 2023 at 12:18:13PM +0100, Jan Beulich wrote:
>>>> On 14.12.2023 11:17, Roger Pau Monne wrote:
>>>>> The minimal function size requirements for livepatch are either 5 bytes (for
>>>>> jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  Ensure
>>>>> that distance between functions entry points is always at least of the minimal
>>>>> required size for livepatch instruction replacement to be successful.
>>>>>
>>>>> Add an additional align directive to the linker script, in order to ensure that
>>>>> the next section placed after the .text.* (per-function sections) is also
>>>>> aligned to the required boundary, so that the distance of the last function
>>>>> entry point with the next symbol is also of minimal size.
>>>>>
>>>>> Note that it's possible for the compiler to end up using a higher function
>>>>> alignment regardless of the passed value, so this change just make sure that
>>>>> the minimum required for livepatch to work is present.
>>>>
>>>> That's a possibility which we don't need to be concerned about. Yet isn't it
>>>> also possible that we override a larger, deemed better (e.g. performance-wise)
>>>> value?
>>>
>>> I'm kind of confused, the compiler will always choose the higher
>>> alignment.
>>
>> Will it? Before writing the reply I went through gcc's respective doc
>> section, without finding such a guarantee.
> 
> Hm, yes, checked with godbolt now and GCC behaves the opposite of
> clang, and will always attempt to honor the alignment passed in
> falign-functions.
> 
> Maybe for release builds we should select a 16b alignment on x86?

Might make sense, yes. Iirc there was a time where 16-byte alignment was
the default for functions in gcc.

Jan

