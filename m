Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F887E4D6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 09:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694523.1083346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm89e-0004KG-C0; Mon, 18 Mar 2024 08:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694523.1083346; Mon, 18 Mar 2024 08:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm89e-0004Hg-9M; Mon, 18 Mar 2024 08:15:34 +0000
Received: by outflank-mailman (input) for mailman id 694523;
 Mon, 18 Mar 2024 08:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rm89d-0004Ha-8V
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 08:15:33 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb973c1-e4ff-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 09:15:31 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so924116766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 01:15:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e9-20020a170906c00900b00a46ce8f5e11sm106095ejz.152.2024.03.18.01.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 01:15:30 -0700 (PDT)
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
X-Inumbo-ID: afb973c1-e4ff-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710749731; x=1711354531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wF1t1OePzE2zuBwKuw2iztC2ZI7yiT09I7BHKf/0jJ4=;
        b=UqSZOaW3+8hlzesZgFejP2iOqlvW18yRPu/GjgMVqmShj7gr3IKGbjIah2wR69gEXy
         ybEGrMyqELrUf8EGiOXtFzLC7koVxK585rtsQDbkiHo2Otg4EhGIbrUq25aRDa6b+7MT
         4HgjGdixc3LMEauQkQeROZ7y9vqVVK/mikHyeHgU+Xq2obVWqOl5Dgzp9sc9W/EYI3Uh
         gSby2yZylzkuq4VzIbXdePM1IzCMcLkVTgJRut2ssuyttAA5DaGu4+0MgDtg2qKmS/UO
         yTfLuIQc/UocnRcOabFkJWZ22JjrExemBLgD0ROk85q6xXuQXi1/H0E5tw4+ktaz26Ss
         Y9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710749731; x=1711354531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wF1t1OePzE2zuBwKuw2iztC2ZI7yiT09I7BHKf/0jJ4=;
        b=cz4YyqIqKWqTcnD06lM2wDmHf143uhE3fspQR5iSJMq48v3Vet3jWrNAr2FyY0Z/rT
         NB2CIetxDkNlx1TPNsn8G2uw4HfzhD3G4febIs+xCNrAwzFnxUxeyHJjPbC0nGqs78vd
         DoMbm5LnRPJxDHv8XrYXX8/ZsRs7GwxgFbabt8roC9CsiVwhgv/XAkttAZeDKSYEjguU
         QivPeu7cd+IaGI5+4fMNE8Apv0AW+8VeQOO082yQGG54fQk4Kl8DbWj5a/xQ1kXiPwGj
         yeLzK/MhYsPB0Qae2/WRbp++lT1AEGXilvC5/UJnp0eLvrG22Napqfya6ELS/HxG8nrh
         xudw==
X-Forwarded-Encrypted: i=1; AJvYcCWQZNc9St1EJTafQ+dQaIpmzBipGxVviCRvU3X0++b9H2p2Y8D/Ebp70zfJq4ZQR1wg20xpjcPl8IJxq43X6hUwcR3cyfkHegTcuBzeQLM=
X-Gm-Message-State: AOJu0Yzndqz8FtmU5EqmFBq+SSaDbF9tLdO+WTGbSJFZQ3RS/f/v8XPJ
	UjlnIvzFmwDbJn3DLi0DvzzE/AQYlVP4fak3oD+inT00s+GZwQ5wtS8H5d4Mdw==
X-Google-Smtp-Source: AGHT+IEchdIkjDYa+BxxYFLD694TV5ZPHVPVvRr0W/UOvNmeJ4EVeiVccYFiv6mU81ZMVz9mVQj+LQ==
X-Received: by 2002:a17:906:6a1d:b0:a46:bdfe:225b with SMTP id qw29-20020a1709066a1d00b00a46bdfe225bmr2033908ejc.11.1710749730870;
        Mon, 18 Mar 2024 01:15:30 -0700 (PDT)
Message-ID: <7ab73379-b057-4568-9869-141cef185752@suse.com>
Date: Mon, 18 Mar 2024 09:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop>
 <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com>
 <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.03.2024 01:07, Stefano Stabellini wrote:
> On Fri, 15 Mar 2024, Jan Beulich wrote:
>> On 14.03.2024 23:17, Stefano Stabellini wrote:
>>> Xen makes assumptions about the size of integer types on the various
>>> architectures. Document these assumptions.
>>
>> My prior reservation wrt exact vs minimum sizes remains.
> 
> We have to specify the exact size. In practice the size is predetermined
> and exact with all our supported compilers given a architecture.

But that's not the purpose of this document; if it was down to what
compilers offer, we could refer to compiler documentation (and iirc we
already do for various aspects). The purpose of this document, aiui,
is to document assumption we make in hypervisor code. And those should
be >=, not ==.

> Most importantly, unfortunately we use non-fixed-size integer types in
> C hypercall entry points and public ABIs. In my opinion, that is not
> acceptable.

The problem is that I can't see the reason for you thinking so. The C
entry points sit past assembly code doing (required to do) necessary
adjustments, if any. If there was no assembly layer, whether to use
fixed with types for such parameters would depend on what the
architecture guarantees.

As to public ABIs - that's structure definitions, and I agree we ought
to uniformly use fixed-width types there. We largely do; a few things
still require fixing.

> We have two options:
> 
> 1) we go with this document, and we clarify that even if we specify
>   "unsigned int", we actually mean a 32-bit integer
> 
> 2) we change all our public ABIs and C hypercall entry points to use
>    fixed-size types (e.g. s/unsigned int/uint32_t/g)
> 
> 2) is preferred because it is clearer but it is more work. So I went
> with 1). I also thought you would like 1) more.

For ABIs (i.e. structures) we ought to be making that change anyway.
Leaving basic types in there is latently buggy.

I'm happy to see a document like this added, for the purpose described
above. But to me 1) and 2) and largely independent of one another.

Jan

