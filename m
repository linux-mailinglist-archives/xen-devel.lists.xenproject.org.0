Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066E86C2EA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 08:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686869.1069438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfbJM-0004s4-9q; Thu, 29 Feb 2024 07:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686869.1069438; Thu, 29 Feb 2024 07:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfbJM-0004ou-6e; Thu, 29 Feb 2024 07:58:36 +0000
Received: by outflank-mailman (input) for mailman id 686869;
 Thu, 29 Feb 2024 07:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfbJL-0004oo-GS
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 07:58:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55446d58-d6d8-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 08:58:32 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso901372a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 23:58:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s25-20020a05640217d900b005661a50b7c5sm363398edy.13.2024.02.28.23.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 23:58:32 -0800 (PST)
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
X-Inumbo-ID: 55446d58-d6d8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709193512; x=1709798312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z0ZPYVhutgapvoG0oXtXKA7FLhQPQCscjuBl1qW0rxw=;
        b=ciQP1TL4UTM9a0e38bKhxRMoBnSGzD8G/lXjWRj1XSwLrw+uiklAB5Xt+l0Z75PGeZ
         sLgi0RCLNJyTLHAtO4GH+zpiv0ygs2vxuPiWz7vIE0GeVJviMFbPdxx+m50ZvhBEQl5Q
         pYyN5eBwMg3ZXIOt43ypeKBM3O/9P1sMSiRNTWYKgQYgpVhnhM9nkofLjtZb+xINNGAm
         Nx7umTw2bCl5R6vCnjYso/csEOsCGv96fte/xHlnzZ7zMR1IwWKHN74EFaojHcCBsxbJ
         T785ajSh2znloviP9OWrmb4TOixRUxuigVxOALzrS0k4d0+lcSVgVXEQkBDp/Q1kXWy7
         i1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709193512; x=1709798312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0ZPYVhutgapvoG0oXtXKA7FLhQPQCscjuBl1qW0rxw=;
        b=PPR2HNV8CcFg5m8B4kQpGcsbzdtjqJMiPObPfDQkuiLbFszkTkXirikagewE242FEe
         19ZTFb1DkxvIkfOzmntwNmSIJExcXZhDghydggUqOKdCpdlb+IJi+SHTwOshnxKD8x2G
         2bVHUa/x/emWYILuaQz0JbQg6scE+PbzV9DkEjBCG9KQXMgiAx6d1Ausoal5nFxpepQI
         LVhQa5MarOLya6M1R3V80+1+ok1qwk80y5JllbKTgtYdvDjQSmKKIwNzSE2fbilka+8e
         7r/AWFEyFqmWhbQLbAk+MULMURa30bcM+j+OoD9u1PPmb3UwrGd+U1Xx+fl861vWilfu
         UxBA==
X-Forwarded-Encrypted: i=1; AJvYcCX98K6fDq9IwEE4YmuS2BAnKJ9ueXskqI9yjG4yA5oa6If5t6eG5eqSyw2OaeEBAkBI75tzruXua0BHyHVZd1xqFgF+A0iBtZ2cvT3vKbA=
X-Gm-Message-State: AOJu0YwtcwEYKO2ng+yOlTSzCvLvB4uiPEFl0dvFPR9kZc3qgDqSCyzh
	xPBpQhCwIr2/eRDqW1myHoi1M0wvMh9vnTpGUbxNoI7qrUqKF0pobJ3EnZCXyg==
X-Google-Smtp-Source: AGHT+IHKjtqdCUKNSMQ7XwVBupCzypDcAZ9ITc9ihPdzjObPek+h8iVmRwmanCt6ZCtHZl1rAvfjwg==
X-Received: by 2002:a05:6402:520c:b0:565:6911:a82b with SMTP id s12-20020a056402520c00b005656911a82bmr881174edd.40.1709193512312;
        Wed, 28 Feb 2024 23:58:32 -0800 (PST)
Message-ID: <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
Date: Thu, 29 Feb 2024 08:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
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
In-Reply-To: <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2024 23:58, Julien Grall wrote:
> On 27/02/2024 07:55, Jan Beulich wrote:
>> On 26.02.2024 18:39, Oleksii Kurochko wrote:
>>> This patch doesn't represent a strict lower bound for GCC and
>>> GNU Binutils; rather, these versions are specifically employed by
>>> the Xen RISC-V container and are anticipated to undergo continuous
>>> testing.
>>
>> Up and until that container would be updated to a newer gcc. I'm
>> afraid I view this as too weak a criteria,
> 
> I disagree. We have to decide a limit at some point. It is sensible to 
> say that we are only supporting what we can tests. AFAIK, this is what 
> QEMU has been doing.

I view qemu as a particularly bad example. They raise their baselines
far too aggressively for my taste.

>> IOW it is hard for me to see why RISC-V needs stronger restrictions here
>> than other architectures. It ought to be possible to determine a baseline
>> version. Even if taking the desire to have "pause" available as a
>> requirement, gas (and presumably gld) 2.36.1 would already suffice.
> 
> I think we want to bump it on Arm. There are zero reasons to try to keep 
> a lower versions if nobody tests/use it in production.
> 
> I would suggest to do the same on x86. What's the point of try to 
> support Xen with a 15+ years old compiler?

It could have long been bumped if only a proper scheme to follow for
this and future bumping would have been put forward by anyone keen on
such bumping, like - see his reply - e.g. Andrew. You may recall that
this was discussed more than once on meetings, with no real outcome.
I'm personally not meaning to stand in the way of such bumping as long
as it's done in a predictable manner, but I'm not keen on doing so and
hence I don't view it as my obligation to try to invent a reasonable
scheme. (My personal view is that basic functionality should be
possible to have virtually everywhere, whereas for advanced stuff it
is fine to require a more modern tool chain.)

The one additional concern I've raised in the past is that in the end
it's not just minimal tool chain versions we rely on, but also other
core system tools (see the recent move from "which" to "command -v"
for an example of such a dependency, where luckily it turned out to
not be an issue that the -v had only become a standard thing at some
point). While for the tool chain I can arrange for making newer
versions available, for core system tools I can't. Therefore being too
eager there would mean I can't really / easily (smoke) test Xen
anymore on ancient hardware every once in a while. When afaict we do
too little of such testing already anyway, despite not having any
lower bound on hardware that formally we support running Xen on. (And
no, upgrading the ancient distros on that ancient hardware is not an
option for me.)

Jan

