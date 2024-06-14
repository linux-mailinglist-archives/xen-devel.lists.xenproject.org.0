Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E49083BE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 08:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740409.1147493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0aP-00034W-00; Fri, 14 Jun 2024 06:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740409.1147493; Fri, 14 Jun 2024 06:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0aO-00032E-TW; Fri, 14 Jun 2024 06:38:56 +0000
Received: by outflank-mailman (input) for mailman id 740409;
 Fri, 14 Jun 2024 06:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sI0aN-000328-06
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 06:38:55 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c45cec3d-2a18-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 08:38:53 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so207322766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 23:38:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db5bafsm149950166b.50.2024.06.13.23.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 23:38:53 -0700 (PDT)
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
X-Inumbo-ID: c45cec3d-2a18-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718347133; x=1718951933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LueDS0Sam1tzVyoa6y3TzgSgb4R1TaIjJXTdw5fwPjA=;
        b=Dc6F1M9TQLzEHHIrweP8qo/qff439XNDsHGXrJdEoetOs3fSmB2pvjPw9u1qWbeEcv
         UX2dCD43O65O31e1QR83igJQQ/v91wdM3T0jG30wukb9f/SZULmXQqAdvpa5HDBTnssf
         qQIJW9bD9g6lbEkio0+o7tyXNUpC8NIRa7JluXaNiOhnDECPdeyTznaHyR0Cz5Qjsl5R
         I/M6CqXxqkzRnEAMHY/CVWz4jl74mWb5y16GjOkUM5Sr7yNO+Q6sKCfIjTmXxSxlTwkl
         9dkPsap+cLPovJWzv3QXFKOUOv9qnh4UX9MBc6ke5vACiGksO2YhEUYG5mh/ujuxLA4s
         1w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718347133; x=1718951933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LueDS0Sam1tzVyoa6y3TzgSgb4R1TaIjJXTdw5fwPjA=;
        b=DZGaGMGKQ/rkQZYX3o+vy3zWM0LEge5kvHzrDgAYM1Rs3qXWmN1hOYOy+nvRMF0Zdy
         Y/pIh2iYUQhRQh+3i1XiBXCUbCPcVWI7XZYrRz+Hbn4ArLzW3wKUHxRe3+N19zU6gCUn
         J5whTK+SGAXXJIajWO1+CXyWp1EqB5idId34i7q4kuA+geXypUu9c4GltQuKtZPbWfLr
         Wgtin9L7bl1ekMKINM+j/aoVRBON7LLfqqbvWtjDtKOCEmYoBrvD6BMZ6mCNnKNByk9x
         Cu0xLF4oSoQ4Z8mH7N6HE+Vsyshsq9r6q9+2dh5VFTTG5gWzceu037Ii7Nizs7cMtNku
         sLSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMBhYgQp8aZ5Mtr7gsV3y1CzlbD7TZTVD7RQ7W26FIXmDF53hQFPDj8//d1gObsO84C0IiqhE/CdWU8a5uBbwb5aOeufjCZX9gXEd5p94=
X-Gm-Message-State: AOJu0YwO8A7mXJkNYUNQTrXaKSkXf+DZLRAYBPE9l/wYHYNycBcdql0F
	WkySzdTCtANsdnkfvB3V3y+cst2eFjKdnfa9R+TcKph1UT9G6mhs4ezRkK1AZw==
X-Google-Smtp-Source: AGHT+IGAb3o1NZEqsL7bUEt8CMjfPNLENDrWdc7Un+HOKJugXowepRoGNhYMf11blZTz2oMnBTh5Pw==
X-Received: by 2002:a17:906:57c2:b0:a6f:eb8:801a with SMTP id a640c23a62f3a-a6f60dc51c7mr101285166b.56.1718347133292;
        Thu, 13 Jun 2024 23:38:53 -0700 (PDT)
Message-ID: <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
Date: Fri, 14 Jun 2024 08:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Design session notes: GPU acceleration in Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <Zms9tjtg06kKtI_8@itl-email>
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
In-Reply-To: <Zms9tjtg06kKtI_8@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2024 20:43, Demi Marie Obenour wrote:
> GPU acceleration requires that pageable host memory be able to be mapped
> into a guest.

I'm sure it was explained in the session, which sadly I couldn't attend.
I've been asking Ray and Xenia the same before, but I'm afraid it still
hasn't become clear to me why this is a _requirement_. After all that's
against what we're doing elsewhere (i.e. so far it has always been
guest memory that's mapped in the host). I can appreciate that it might
be more difficult to implement, but avoiding to violate this fundamental
(kind of) rule might be worth the price (and would avoid other
complexities, of which there may be lurking more than what you enumerate
below).

>  This requires changes to all of the Xen hypervisor, Linux
> kernel, and userspace device model.
> 
> ### Goals
> 
>  - Allow any userspace pages to be mapped into a guest.
>  - Support deprivileged operation: this API must not be usable for privilege escalation.
>  - Use MMU notifiers to ensure safety with respect to use-after-free.
> 
> ### Hypervisor changes
> 
> There are at least two Xen changes required:
> 
> 1. Add a new flag to IOREQ that means "retry this instruction".
> 
>    An IOREQ server can set this flag after having successfully handled a
>    page fault.  It is expected that the IOREQ server has successfully
>    mapped a page into the guest at the location of the fault.
>    Otherwise, the same fault will likely happen again.

Were there any thoughts on how to prevent this becoming an infinite loop?
I.e. how to (a) guarantee forward progress in the guest and (b) deal with
misbehaving IOREQ servers?

> 2. Add support for `XEN_DOMCTL_memory_mapping` to use system RAM, not
>    just IOMEM.  Mappings made with `XEN_DOMCTL_memory_mapping` are
>    guaranteed to be able to be successfully revoked with
>    `XEN_DOMCTL_memory_mapping`, so all operations that would create
>    extra references to the mapped memory must be forbidden.  These
>    include, but may not be limited to:
> 
>    1. Granting the pages to the same or other domains.
>    2. Mapping into another domain using `XEN_DOMCTL_memory_mapping`.
>    3. Another domain accessing the pages using the foreign memory APIs,
>       unless it is privileged over the domain that owns the pages.

All of which may call for actually converting the memory to kind-of-MMIO,
with a means to later convert it back.

Jan

>    Open question: what if the other domain goes away?  Ideally,
>    unmapping would (vacuously) succeed in this case.  Qubes OS doesn't
>    care about domid reuse but others might.
> 
> ### Kernel changes
> 
> Linux will add support for mapping userspace memory into an emulated PCI
> BAR.  This requires Linux to automatically revoke access when needed.
> 
> There will be an IOREQ server that handles page faults.  The discussion
> assumed that this handling will happen in kernel mode, but if handling
> in user mode is simpler that is also an option.
> 
> There is no async #PF in Xen (yet), so the entire vCPU will be blocked
> while the fault is handled.  This is not great for performance, but
> correctness comes first.
> 
> There will be a new kernel ioctl to perform the mapping.  A possible C
> prototype (presented at design session, but not discussed there):
> 
>     struct xen_linux_register_memory {
>         uint64_t pointer;
>         uint64_t size;
>         uint64_t gpa;
>         uint32_t id;
>         uint32_t guest_domid;
>     };


