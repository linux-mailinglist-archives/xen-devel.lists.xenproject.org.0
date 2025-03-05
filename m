Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64639A4F84C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 08:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901779.1309709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjZ0-0004WB-F0; Wed, 05 Mar 2025 07:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901779.1309709; Wed, 05 Mar 2025 07:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjZ0-0004Ts-CI; Wed, 05 Mar 2025 07:53:10 +0000
Received: by outflank-mailman (input) for mailman id 901779;
 Wed, 05 Mar 2025 07:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpjYz-0004TW-Gc
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 07:53:09 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd5bde37-f996-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 08:53:02 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-390eebcc331so283291f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 23:53:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c841sm9497915e9.8.2025.03.04.23.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 23:53:01 -0800 (PST)
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
X-Inumbo-ID: dd5bde37-f996-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741161182; x=1741765982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Pa6tXK+1ttLMdugFkaiTNN4R7BTebEbxBi5gF10G1A=;
        b=Nwzp1PY2oS81+QW+hqhbO22lufqVtdZY2waZ2iX1NESbSk+exxFz0r1/HW2itgQ6+g
         LRhclio50pCElZMWkYMz9Dnsv5O0lsiUdnc8a7LYhLFyqe/nVCRb306zB5bBMwzoztMs
         naTFS1int1OH6g1Pg1e+3YX5/su0GFC7mnkpGi7eqKRvlO8OXMW9bYSjlWKdxnA+Qouj
         TM5PkpR6sGBufCrR8fdY8njKmv0rF6WsNX3DaTFr2if4xALGDSjiLAe4L26nzWq5PPVS
         4psjRvr8YXxpf4mtR0HbNm6K7pRcYNblS6rz2iVU+zNh9yrsd8UPzwJoMm07lHp6JdIU
         spGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741161182; x=1741765982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pa6tXK+1ttLMdugFkaiTNN4R7BTebEbxBi5gF10G1A=;
        b=BnVGJ0y+6O6qEABq2Fwum92AahOscA/sY+YTihtCvGfNxC83rRW4yo+TjcoqFuN61X
         zs8orPNyWaRQlON143cSX3gPeSpjC2iTjzlf+CsaBXeo5goYKqWmeEU1OFuuED/YNe0H
         M4eDxU4JmCH+wAPIEqFmUlqhX3fjx7F8Qq1PbctSa8b+ekfZLjOVq8qqU2ki6nEOyFg+
         Zz6SbdTzlsjaXrZDnwS0SAOrWmsjfzBW7mQi9nWBMjipInxkU9VqQhobweguLS2dB+4O
         6tQmmdlQ6YNUD0AFVYa4AkZG1Ri666Hjo+AFNECFPjFF5BDgZOChKcIn8PEqIwk/FG26
         VLag==
X-Forwarded-Encrypted: i=1; AJvYcCVgMHFEft8No21j4FYL4rTvl9xahJ/wpM7HwYLL+/DP8a2Oe++KtmUrFhNnq6ugWLUPR9/kbxak8to=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxU7dzST8ggYfHKBgncDHj/sC7lOrsv54Uz6b2OWesdo67wBCw
	ULggpL1Szzu2fQ9f5iM+WM5Wtr6tSzaE5mKOFiYe8f8zCR5RKNz0JuRlxzz15A==
X-Gm-Gg: ASbGncuy2r/Pqy9bQ/AtSbnWVPDw9OQicjCJ2Ov+HQj/Ii0oiiSgnVQbbsbv3lrFDFl
	q1oH7/D9Q+CZDN8+agvuKYhtL5073jipD53fBqfiVmC54L3Y1M+SNMfvQoiEeZ0srj2+1mLZ32l
	/6v7cqBRgjskNVcQqXCYrj6OpgWd8s6j0k4t2QQO43hh0XN/xZORBKUlyOPmkzZiuZsAS8+OT1L
	uHF06RmiIzLwv3T99Ax1PsyDJDehv4bliI6qZ8oNKCM5zO2mblYLe67PVAiCGS0c+pc5KLH5vJ9
	NqUvo0QhA0r64C/JlzP+gQoNNZyv3GHRnei5uxjSyJQoEWc/A7nz1uT1XRKmRQfEXhmBYUmLI2E
	HUQKnw5MB2S3LhQqLrSqrUuFQD0hLPQ==
X-Google-Smtp-Source: AGHT+IGvbv2lLDA6uWnjmUM8epToYBhvDhAklQfARHog7wDYBHb4Dpbz+e9c5skpPqvEemPicoUB+A==
X-Received: by 2002:a5d:6484:0:b0:391:b93:c971 with SMTP id ffacd0b85a97d-3911561aaccmr4718034f8f.20.1741161182122;
        Tue, 04 Mar 2025 23:53:02 -0800 (PST)
Message-ID: <98998559-27d6-4b65-bd45-cb1755d48564@suse.com>
Date: Wed, 5 Mar 2025 08:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Don't cast away const-ness in vcpu_show_registers()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225230213.1248136-1-andrew.cooper3@citrix.com>
 <7e77dceb-489b-4022-a665-2a008ddfe844@suse.com>
 <f62841d3-b0e4-4007-a056-a807a19fc988@citrix.com>
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
In-Reply-To: <f62841d3-b0e4-4007-a056-a807a19fc988@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.03.2025 17:52, Andrew Cooper wrote:
> On 26/02/2025 7:33 am, Jan Beulich wrote:
>> On 26.02.2025 00:02, Andrew Cooper wrote:
>>> The final hunk is `(struct vcpu *)v` in disguise, expressed using a runtime
>>> pointer chase through memory and a technicality of the C type system to work
>>> around the fact that get_hvm_registers() strictly requires a mutable pointer.
>>>
>>> For anyone interested, this is one reason why C cannot optimise any reads
>>> across sequence points, even for a function purporting to take a const object.
>>>
>>> Anyway, have the function correctly state that it needs a mutable vcpu.  All
>>> callers have a mutable vCPU to hand, and it removes the runtime pointer chase
>>> in x86.
>>>
>>> Make one style adjustment in ARM while adjusting the parameter type.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>>
>>> RISC-V and PPC don't have this helper yet, not even in stub form.
>>>
>>> I expect there will be one objection to this patch.  Since the last time we
>>> fought over this, speculative vulnerabilities have demonstrated how dangerous
>>> pointer chases are, and this is a violation of Misra Rule 11.8, even if it's
>>> not reasonable for Eclair to be able to spot and reject it.
>> On these grounds
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>> irrespective of the fact that a function of this name and purpose really, really
>> should be taking a pointer-to-const.
> 
> No - this is a perfect example of why most functions should *not* take
> pointer-to-const for complex objects.
> 
> There is no such thing as an actually-const vcpu or domain; they are all
> mutable.  The reason why x86 needs a strictly-mutable pointer is because
> it needs to take a spinlock to negotiate for access to a hardware
> resource to read some of the registers it needs.
> 
> This is where there is a semantic gap between "logically doesn't modify"
> and what the C keyword means.

And hence (in part) why C++ gained "mutable" ages ago.

> Anything except the-most-trivial trivial predates may reasonably need to
> take a spinlock or some other safety primitive, even just to read
> information.
> 
> 
> Because this was gratuitously const in the first place, bad code was put
> in place of making the prototype match reality.
> 
> This demonstrates a bigger failing in how code is reviewed and
> maintained.  It is far too frequent that requests to const things don't
> even compile.  It is also far too frequent that requests to const things
> haven't read the full patch series to realise why not.  Both of these
> are a source of friction during review.
> 
> But more than that, even if something could technically be const right
> now, the request to do so forces churn into a future patch to de-const
> it in order to make a clean change.  And for contributors who aren't
> comfortable saying a firm no to a maintainer, this turns into a bad hack
> instead.
> 
> i.e. requests to const accessors for complexity objects are making Xen
> worse, not better, and we should stop doing it.

Okay, let's agree that we don't agree in our perspectives here.

Jan

