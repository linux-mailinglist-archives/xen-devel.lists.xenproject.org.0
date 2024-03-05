Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8EF871983
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 10:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688649.1073086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhR0n-0000fr-Ms; Tue, 05 Mar 2024 09:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688649.1073086; Tue, 05 Mar 2024 09:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhR0n-0000df-K3; Tue, 05 Mar 2024 09:23:01 +0000
Received: by outflank-mailman (input) for mailman id 688649;
 Tue, 05 Mar 2024 09:23:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhR0m-0000dZ-AD
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 09:23:00 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f462285c-dad1-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 10:22:58 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-564647bcdbfso6234596a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 01:22:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 es14-20020a056402380e00b00566d9c8e6cesm4402905edb.21.2024.03.05.01.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 01:22:57 -0800 (PST)
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
X-Inumbo-ID: f462285c-dad1-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709630577; x=1710235377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/lg/dBVXYVnTxa9YsDLClf8gxSp0d+Ecm3//9clkvk=;
        b=FeDuSGpZ8m1gsgZm6Ov24Zq0ci5xncJFoc17NNWIxdp10mFIYnnlp5liHsKRl5WfIg
         iK+kgqC5kL0HFinO8/+nMWAKLCEi6M3JY2KQy0+mDUE2t8A7NjZ1C4MPudjVMsuxuyL/
         gMWCdhA0DHV07prkkMxAdJN9B51+M7xAcv71RBvgq27CrMohB2Wjh+EZzmN74ptmBdo9
         cmKlFe79BwCIWFZJmlIcf60Gx3bWVywA0Q2C37ucGHUry3zbNOcG4lF3jdhtF/ne7ZNT
         UUYtQdWkig5FoLqALZcOYsWAoOUNm2uvI1HDG7W3AoHukNYVUSsBinkJu6uucjsWLncm
         B6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709630577; x=1710235377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/lg/dBVXYVnTxa9YsDLClf8gxSp0d+Ecm3//9clkvk=;
        b=cZvxGU9j0b1cqEXglB9nEttl3RL06I8A5oqDJAT4EG16T6DF/SAnXAc2lu21SxfYym
         k97c8m5ZoHYvArLm1eOET+xYT+AtmjlY+gzVDDQvM2MT2TLEc4W1Esr8SpfsONkkiEY7
         uHKBG1zSusbQGEsS/breppOcVzD1HfJg0gG6DaRStW59Sk1lfFHGUG8AL4FAtyO0Ppty
         Ej/Ztou2xpXT5T2VfgKJl4iw37MtuBKKKI8v3niezavK954IbEbXMhMduBwSROla7jU7
         6utqgVqgsvBJdqiE2mvzSCH6fmnYAnGKWCOeww4QEXmUdgsY9Pr1jcS4mCcMZJtegGfs
         DudQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4lEIAFFxbCs6kyMGwqb6cSy/Y4k631MFg0vSCMRW8QnRG8DdCni2EQ75iPv52OKgv4HuzoGWOBeTImIMk3Wax2NICahI7ikB4ZAxZHAE=
X-Gm-Message-State: AOJu0YzIWEclXiHowl1FV2wmCxkKXdbrgM2msClQvqUaB8IBinlePtkx
	6h2cYiV992UZ6pE85E6TLqSDPu5V6XmXr/v2KzJudw73lJXkShJ0dPJFBUx4Wg==
X-Google-Smtp-Source: AGHT+IFj6YAOi9Pay0Z9dpIK8woAvsAmaEyk7nUtw6opE8f4fbFvvkst+s6I9bbdJZm/hjdTDOInWQ==
X-Received: by 2002:a05:6402:2226:b0:566:2e42:8c38 with SMTP id cr6-20020a056402222600b005662e428c38mr6810620edb.2.1709630577428;
        Tue, 05 Mar 2024 01:22:57 -0800 (PST)
Message-ID: <0f956920-48a1-4934-9ded-6aeda2a51867@suse.com>
Date: Tue, 5 Mar 2024 10:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86: switch to eager fpu save / restore
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304091307.2295344-1-fouad.hilly@cloud.com>
 <20240304091307.2295344-4-fouad.hilly@cloud.com>
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
In-Reply-To: <20240304091307.2295344-4-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 10:13, Fouad Hilly wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Previously FPU is lazily switched. Due to the fact that a malicious
> guest can speculatively read the not yet switched out register states,
> we need to eagerly switch FPU states when a domain is scheduled to
> run.

The speculation aspect is already covered as of XSA-267, and hence imo
cannot be used as a justification here.

> In the new world, Xen will eagerly switch FPU context in the
> scheduler. Xen itself won't set CR0.TS other than for the purpose of
> servicing a PV guest.
> 
> The following things are done:
> 
> 1. Xen will only set and clear CR0.TS on behalf of a PV guest. Any #NM
>    received in Xen should only be delivered to the running PV guest.
> 
> 2. Xen no longer causes vmexit for #NM for HVM guests when nested HVM
>    is not in use.
> 
> 3. When nested HVM is in use, Xen needs to trap #NM if specified by
>    the L1 hypervisor, but all #NM handling is left to L1 hypervisor
>    to deal with.
> 
> 4. Xen saves and restores FPU states wherever it needs to. The
>    following places are modified:
>    1. Scheduling in and out a guest;
>    2. Calling EFI runtime service;
>    3. ACPI reset;
>    4. x86 insn emulator fpu insn emulation.
> 
> 5. Treat FPU as always initialised. Adjust following components:
>    1. HVM vcpu context save / load code;
>    2. arch_{get,set}_info_guest;
>    3. VLAPIC code.
> 
> 6. Delete lazy FPU handling code.

This wants splitting up. I'm actually puzzled that step 6 does not include
purging of e.g. opt_eager_fpu. Converting that to "always true" would seem
to be the one first step with a functional change. All further steps would
be removal of then-dead code.

> Strip XCR0 and IA32_XSS manipulation from __context_switch. We need to
> be able to zero out previously used state components. Push everything
> into fpu_xrstor as that's the most suitable place.
> 
> Tested on AMD with PKU disabled and Intel, no performance degradation.

I dare to at least question whether this is going to hold once we support
one of the huge state components (AMX patches have been pending for years).

Jan

