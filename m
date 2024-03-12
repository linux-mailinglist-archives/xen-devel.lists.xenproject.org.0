Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EEC879536
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:41:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691868.1078371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk2Mn-0002UT-6y; Tue, 12 Mar 2024 13:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691868.1078371; Tue, 12 Mar 2024 13:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk2Mn-0002SY-3s; Tue, 12 Mar 2024 13:40:29 +0000
Received: by outflank-mailman (input) for mailman id 691868;
 Tue, 12 Mar 2024 13:40:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk2Ml-0002SS-Vj
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:40:27 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14bb13c5-e076-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:40:25 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso6230898a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 06:40:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v8-20020a1709067d8800b00a45aeaf9969sm3861203ejo.5.2024.03.12.06.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 06:40:24 -0700 (PDT)
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
X-Inumbo-ID: 14bb13c5-e076-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710250825; x=1710855625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3toOv0f7V7jxo5xnPAfLR8vQRIBGwow3QbvN91f8I3M=;
        b=YzwnBhAKFDo6QH++JIdO7Qy3p+r+spkRdkEmnsMT6fCvsB28bMDrJQBSAAqH68d2qZ
         jGExYUHBNz5S4VBOUrmLrW9B2vNJUzc1vjHXKg1S69mAwk/a/VE7LacCqfOw9vPOjAP3
         XMo8Mo4T6FMWqqLy84Bgszr9nCAipM7HLZ9u73oQ8PDYE/xWkQxtiJy78IYXK4dKj3O+
         Y3OYzWYC0w9e8mWxg3N9XOSWcukqA5W7/lkZIf7A+oXfY35YFrjUqg3ZVRYZ5ztKpKTf
         GKtpXcn0Z4YdDiMPLLKb5zLMFRMluKB5vFLTE+K0ibD9BEHVN/eNXiQvMbMb4tqV/iTi
         zy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710250825; x=1710855625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3toOv0f7V7jxo5xnPAfLR8vQRIBGwow3QbvN91f8I3M=;
        b=v91A1JfUpHeAWeXxVZPxhhYhiD3q2UZr9hfqkx+tIwkIwUaoaQJDsmVHmYMNB2DSoI
         +Su3FhA79NpktbGd8lTAvMTF3jxmRGmJMcpuj7baUj+DK7P5ATwS+PfuGA4A+nIyFp4O
         VRIqvis6b0q4cCozyzxdzaYmdWVmcU5cq+V7yaze8IOxrreAOpmlQaOpnrcsjJa1Ucia
         Q0Ia13dlO0cmjT0ekldYJfWPl7RU/IERBqcg+3W/8WbpwJaNF0uqpRG7iONg7qUwqFTZ
         s5eKS1Oy32zMgGtRV0AeMmHzQlWNsFP76AgnDFfBCS30rBUOWQorUArJeGCudMmIcZe1
         aesA==
X-Forwarded-Encrypted: i=1; AJvYcCUBxtkj939Lc1lBLLJz5mkY7qiAEkYow2Xi6+od4wsvg0hPxXPR0CcAg3RjS9OFCafIpTlJ637LpeuJBMIVAugKDE2lHDGMcvQmUjaSai8=
X-Gm-Message-State: AOJu0YySlbAqEYd0gS2pQ03hp0VkdLc/T6aif5ZfLV78yPwO689k7B25
	uf1XK+NYOksSQlLQPKiAPiHYpCXdcryS008qPCS4B0QNobYUB7s+FN0ssH6AXkvvzkZE+NT4caQ
	=
X-Google-Smtp-Source: AGHT+IF3zmQFlGhpVJZ3iUn8a4FGnT2CVp/HhAHnQ/aK6Y0sSSqdISk2K6HpAIQ/UdFA8jzEqqB9nw==
X-Received: by 2002:a17:906:6815:b0:a45:98f3:997e with SMTP id k21-20020a170906681500b00a4598f3997emr5715553ejr.7.1710250825021;
        Tue, 12 Mar 2024 06:40:25 -0700 (PDT)
Message-ID: <2f41ad83-6911-4838-905b-dfe44ccaf8cf@suse.com>
Date: Tue, 12 Mar 2024 14:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
 <ZfAtahcXWGqckQFW@macbook> <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>
 <ZfBERyqQ7Ous3nGE@mail-itl> <2a04315c-7bb8-4985-8aca-bece9d0d535e@suse.com>
 <ZfBT-xwmKCugJQVy@mail-itl> <ZfBXBe_9Bw9t4NVP@mail-itl>
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
In-Reply-To: <ZfBXBe_9Bw9t4NVP@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2024 14:22, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 12, 2024 at 02:09:14PM +0100, Marek Marczykowski-Górecki wrote:
>> On Tue, Mar 12, 2024 at 01:38:53PM +0100, Jan Beulich wrote:
>>> On 12.03.2024 13:02, Marek Marczykowski-Górecki wrote:
>>>> BTW should e820_change_range_type() return 1 in case of mapping already
>>>> having the right type? Otherwise, if one wants to use
>>>> iommu_add_extra_reserved_device_memory() on already reserved memory, the
>>>> e820_change_range_type() would fail.
>>>
>>> You raised that question on Matrix yesterday, iirc, and I left it
>>> unanswered there because it takes archeology to find the answer (or at
>>> least get closer to one). And, please don't get me wrong, you could as
>>> well do that yourself. (My vague recollection from having dealt with
>>> similar code in Linux is that yes, in the example given the function
>>> ought to indeed have failed back then. Depending on present uses etc
>>> it may well be that we could reconsider, though.)
>>
>> I sure can do some archaeology there, I was just hoping any of you would
>> know the answer already.
> 
> None of the commit messages touching that code give the answer. But
> looking around, most callers of reserve_e820_ram() ignore its return
> value. One exception is reserving memory for kexec. I guess in that case
> it may be intentional to fail if the area is reserved already, as it may
> indicate it cannot be used for kexec. Is that correct?

I suppose so, yes.

> There are also a couple of calls to e820_change_range_type() in tboot
> code where it changes E820_RESERVED to E820_UNUSABLE. There, I guess
> changing e820_change_range_type() behavior would be okay.

Possibly, but please don't put much trust in the tboot code we have.

Jan

