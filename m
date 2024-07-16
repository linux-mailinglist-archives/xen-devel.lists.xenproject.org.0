Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E13932114
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:18:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759359.1169052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcRi-0002Jm-BL; Tue, 16 Jul 2024 07:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759359.1169052; Tue, 16 Jul 2024 07:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcRi-0002Gc-8J; Tue, 16 Jul 2024 07:17:58 +0000
Received: by outflank-mailman (input) for mailman id 759359;
 Tue, 16 Jul 2024 07:17:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTcRh-0002GW-3c
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:17:57 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8506996e-4343-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 09:17:55 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-36799a67d9cso4117274f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 00:17:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bbbf792sm51488465ad.96.2024.07.16.00.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 00:17:53 -0700 (PDT)
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
X-Inumbo-ID: 8506996e-4343-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721114274; x=1721719074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1L+thWJhQ94nYSHtBcwn3fQJ1k/di/vkyhHxhGjgE98=;
        b=Ket3nx2gIy+FSmvJNRtT1XDrWDdWbCweyCqr1PD26Nvlu10Mi5k/qvdnBQyz0dy5A+
         C/wxiZCIvKrVJNojSRJQyKUInJxyGhg0sm+oKb2I/M9R9GXXi0eQHZ+P9jE2QS+zVMa9
         on+5RHbN0Y9+94vTTOl9nthb+tg11DYVP19SWXyRywoA29bRKk0GVGVrfAVawE5504UQ
         RYDvfmu/GxM0OEkxTMuuIq9nl3Dd4mP/mSTBc2Hmva4rg7JX4ZpHbjStP6Qb5MtsIjcY
         d27PCyQQM61AQ0AstQTHTmvMQ82d/Elvvh8sy9Kb5fzL35+vCyhonU8bD2p21DhsqD+a
         QIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721114274; x=1721719074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1L+thWJhQ94nYSHtBcwn3fQJ1k/di/vkyhHxhGjgE98=;
        b=JNcVRtn2RozJIwTueJE5D4S/ZWi1oyRKT9cJpWTU6staalwg5amyUhMa2vRahfiZOj
         bpQauZ8ZNKLNAV7/813MAKbpyyC7Ost1/MQ2ZfZoSp/0SzYPByeeMx0CD53xmqP+4vol
         R7HwutSjnF23/zlueL22M4kdvmJS2FvALsxgpFoX5ELMdlyhlCxXSWihHdobF9tzBxzY
         17SGHCbICyE6bQFqmJpCzSyZyNMrTBISuHZs1ZkDI+CQedyKC41ZN9mRc5N0UGyMMBuq
         40gEQjP11rFq24/kyWcLZaODB+dWo4L8AQxXsJq/sj+ZJQdorBzkDBBRBqpQT/vdIkpr
         j1Og==
X-Forwarded-Encrypted: i=1; AJvYcCWrZS/CtbMzmGokGaMMopizhard5+RJEyOFzzEg1Nuf7D3cWYFmEVn396TSHxk70xKHLNOmTfUQoNjNXjaALd/SeBUJhHo/R1U563Y4fkQ=
X-Gm-Message-State: AOJu0YyKN6RGRV5UjoNyDQ1ChfwvSv9L3xQ0gnhHrUOXnLQ2QETI1HdC
	YiYPbnon8npvbi/L3+0BktQ8GboSskctfLjW2873h74UrbHQLZQgCIsRotbKjg==
X-Google-Smtp-Source: AGHT+IE5PvgSgbjgif5ZQgxezZdi3jXDM4UMCmC2mA1QHSSOJSyWzF9yZlKmp89bsWP3EB09j4GN+A==
X-Received: by 2002:a05:6000:1f86:b0:367:f054:620a with SMTP id ffacd0b85a97d-368260d92cfmr1034978f8f.30.1721114273995;
        Tue, 16 Jul 2024 00:17:53 -0700 (PDT)
Message-ID: <4893a89d-9ef5-4d86-94b0-042e88588439@suse.com>
Date: Tue, 16 Jul 2024 09:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com>
 <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com>
 <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
 <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com>
 <alpine.DEB.2.22.394.2407151736530.3635@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2407151736530.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 02:43, Stefano Stabellini wrote:
> On Mon, 15 Jul 2024, Jan Beulich wrote:
>> On 13.07.2024 00:38, Stefano Stabellini wrote:
>>> On Wed, 3 Jul 2024, Jan Beulich wrote:
>>>> I further have to note that, as indicated during the earlier discussion,
>>>> I still cannot see how occasional ambiguity is going to be dealt with.
>>>> IOW from the rules above two different headers could still end up with
>>>> the same guard identifier.
>>>
>>> Maybe something like this?
>>>
>>> "In the event of naming collisions, exceptions to the coding style may
>>> be made at the discretion of the contributor and maintainers."
>>
>> Hmm, maybe I wasn't clear enough then. My take is that the scheme should
>> simply not allow for possible collisions. Neither the contributor nor the
>> reviewer may spot such a collision, and it may therefore take until the
>> first full scan that one is actually noticed. Which I consider too late
>> in the process, even if we already were at the point where commits were
>> checked pre-push.
> 
> Looking at the proposal, copy/pasted here for convenience:
> 
> - private headers -> <dir>_<filename>_H
> - asm-generic headers -> ASM_GENERIC_<filename>_H
>     - #ifndef ASM_GENERIC_X86_PERCPU_H
>       #define ASM_GENERIC_X86_PERCPU_H
>       //...
>       #endif /* ASM_GENERIC_X86_PERCPU_H */
> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
>     - #ifndef ASM_X86_DOMAIN_H
>       #define ASM_X86_DOMAIN_H
>       //...
>       #endif /* ASM_X86_DOMAIN_H */
> - xen/include/xen/<filename>.h -> XEN_<filename>_H
> - xen/include/xen/<subdir>/<filename>.h -> XEN_<subdir>_<filename>_H
> 
> 
> The only possibility for collision that I can see is from the first
> point:
> 
> - private headers -> <dir>_<filename>_H

I don't think this is the only possibility of collisions. The <subdir>_<filename>
parts can similarly cause problems if either of the two involved names contains
e.g. a dash (which would need converting to an underscore) or an underscore. To
avoid this, the name separators (slashes in the actual file names) there may need
representing by double underscores.

> two directories like this could collide:
> 
> - arch/arm/arm64/lib/something.h -> LIB_SOMETHING_H
> - arch/arm/arm32/lib/something.h -> LIB_SOMETHING_H
> - arch/x86/lib/something.h -> LIB_SOMETHING_H
> 
> (Leaving aside that in this example it would not be an issue because the
> three headers are not meant to be all included in the same file.)
> 
> Can we specify that <dir> should go all the way back to the arch/ or or
> common or drivers directory?
> 
> - arch/arm/arm64/lib/something.h -> ARM_ARM64_LIB_SOMETHING_H
> - arch/arm/arm32/lib/something.h -> ARM_ARM32_LIB_SOMETHING_H
> - arch/x86/lib/something.h -> X86_LIB_SOMETHING_H

We can of course, so long as we're okay(ish) with the length and redundancy. As
already indicated before, there are downsides to this. Yet a firm scheme with
few rules has the benefit that it might even be possible to use a script to do
all the guard adjustments.

Jan

> We can rely on the filesystem paths to make sure to avoid collisions.



