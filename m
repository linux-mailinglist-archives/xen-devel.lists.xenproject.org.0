Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CFBA38016
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890174.1299198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyLy-0002KL-Ut; Mon, 17 Feb 2025 10:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890174.1299198; Mon, 17 Feb 2025 10:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyLy-0002II-RL; Mon, 17 Feb 2025 10:27:54 +0000
Received: by outflank-mailman (input) for mailman id 890174;
 Mon, 17 Feb 2025 10:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjyLx-00021B-Oq
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:27:53 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8362aa6-ed19-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:27:53 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5dee07e51aaso5561145a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:27:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb77551c60sm448531466b.63.2025.02.17.02.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 02:27:52 -0800 (PST)
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
X-Inumbo-ID: d8362aa6-ed19-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739788072; x=1740392872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+1mXtA46UdaeOFftuIt7XSd/dXmdcHnoJ9nK/0JYwgU=;
        b=B4mzbK8N/KOm3K3aRDzml2lMo48UI/3tP+DXb7FoMXlNVTyzIxAXYRb/qSobN7h4OM
         u2la9P3lBCjd3f+K5QmDGMQjkQvFm4ywwRq0UmMMDx1PNJ7/s5DUh1tOi9D3qWWOFGGJ
         bbrV6af8OnwtXiek9Ozrr6NNNE4xJm4DVKIABZbMCBD4AMl8Nh5PaSoUcFOqJlKVOEGK
         575digiriZxb1OwK+vjMDPK/n85wvBpHNZa8iCcyHdMjaGY24IRp0sHRNNssg2WhLg/z
         lJ/jY84+1NjKzucwjdEtpFZ6HHFqs4mRHNYl5W78Ka69GR9vAiFvMQAhlBLPIVBw/FuU
         jMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788072; x=1740392872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1mXtA46UdaeOFftuIt7XSd/dXmdcHnoJ9nK/0JYwgU=;
        b=IrUNpJWE4rxOpcQXLaxzsQ/R0Tteqn+xUc8viXisgup8t2ruOCxBqK482hDiXr+L1M
         nGm/6433OXQw9IZpAL4rQbhgrl3Ws3eelwsqXLGm896WakSBMq8EYFN6LQ9aHlZVvhma
         gnG6NxF6UZlXbW0BX8iuBnxWjLgEagYuhoF9fMipbi6qhFZMcsIFpkokxa3VSNUu6Xzk
         z0TIasGutt+aZMN4cUzfDwNjVpqrtFLwLng03LCTrgmXldkZo4n0lN608AitkWk0/5Rt
         lmjn0twwuV7sdBJk8MmhDIMp7bvt28+Yb+M53r279vvREdtZgVZPqrK2eba6SRxfwMrH
         DzlA==
X-Forwarded-Encrypted: i=1; AJvYcCUmLozdkikL0ELidfT/vfNipGot2Npr8V0H7kjCHcF0W1BU90AyKFg3IH5eQkZ32Fi0W3TIYFw1oQU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5RQh1SXqA6n5elj2zDnrM+NMdSLJ0SlTUswsw0SiuF+4dCZSH
	Fpt3b7OBVQNVIV1xTQc0HAkhsg1QS/m7QDhWN05RGhYmcBM1jovWM4v8Vcvi/w==
X-Gm-Gg: ASbGncv0r+Ckeg9dEeuH3tDDcvEtvMf3+VpxwgeuzwbiRcK2k8yIN+tagbwga9fGF37
	3BczO1i6bhdu9BFg7ELYvg8r2MwwxbVxwTy5BYF/9T8elCyqysbzgaQk4IW4hpA9BpcTJ/QoTiD
	Jg3q1AeQIcnfQKBi6kSfuu5G0kpmzFQ8/4PMtGrnyCf7t4yd0jJ1RnNY8vn6kqBH7BhozioMi0B
	oW8eDPk6TWI6NpSwmO9tSPCaJxmK7MM/V7uv0KOy5yPs1hKI7ZJrRY9OP3zWbEuAafKID027nB/
	xWWj1FpWGNwhYk+yDAW/I394Sy563VpY60edQzprPIaub+QSdykc61zLfVZaoSKCj+vWdn04t0a
	V
X-Google-Smtp-Source: AGHT+IENa3wzKnl1HpqOp6mnAySDLdZd6iKUXbqGyKJi6XGmL3wFOQfH5AWw2Fd2VHvUCA44AlghOQ==
X-Received: by 2002:a17:906:2dd5:b0:abb:974a:8e3a with SMTP id a640c23a62f3a-abb974a9215mr342006966b.44.1739788072463;
        Mon, 17 Feb 2025 02:27:52 -0800 (PST)
Message-ID: <a8816d5e-dea5-4267-a6f4-d4d2aa9daad7@suse.com>
Date: Mon, 17 Feb 2025 11:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH
 dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250214092928.28932-1-roger.pau@citrix.com>
 <20250214092928.28932-3-roger.pau@citrix.com>
 <a5c763da-c38c-465d-afac-08785cd733ef@suse.com>
 <Z685StmNlL2d8iQT@macbook.local>
 <b1e87068-977d-45a6-b61f-e3c40876b947@suse.com>
 <Z7LyXcuTfuQpRPBd@macbook.local>
 <c5135f33-7e60-4195-80ad-cd6bc36b6321@suse.com>
 <Z7MNi7bBdyAdMtQ6@macbook.local>
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
In-Reply-To: <Z7MNi7bBdyAdMtQ6@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 11:20, Roger Pau Monné wrote:
> On Mon, Feb 17, 2025 at 09:44:28AM +0100, Jan Beulich wrote:
>> On 17.02.2025 09:25, Roger Pau Monné wrote:
>>> On Fri, Feb 14, 2025 at 02:07:05PM +0100, Jan Beulich wrote:
>>>> On 14.02.2025 13:38, Roger Pau Monné wrote:
>>>>> On Fri, Feb 14, 2025 at 12:53:01PM +0100, Jan Beulich wrote:
>>>>>> On 14.02.2025 10:29, Roger Pau Monne wrote:
>>>>>>> +{
>>>>>>> +    unsigned long gfn = paddr_to_pfn(addr);
>>>>>>> +    struct domain *currd = current->domain;
>>>>>>> +    p2m_type_t type;
>>>>>>> +    mfn_t mfn;
>>>>>>> +    int rc;
>>>>>>> +
>>>>>>> +    ASSERT(is_hardware_domain(currd));
>>>>>>> +    ASSERT(!altp2m_active(currd));
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Fixups are only applied for MMIO holes, and rely on the hardware domain
>>>>>>> +     * having identity mappings for non RAM regions (gfn == mfn).
>>>>>>> +     */
>>>>>>> +    if ( !iomem_access_permitted(currd, gfn, gfn) ||
>>>>>>> +         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
>>>>>>> +        return -EPERM;
>>>>>>> +
>>>>>>> +    mfn = get_gfn(currd, gfn, &type);
>>>>>>> +    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
>>>>>>> +        rc = mfn_eq(mfn, _mfn(gfn)) ? 0 : -EEXIST;
>>>>>>
>>>>>> I understand this is to cover the case where two vCPU-s access the same GFN
>>>>>> at about the same time. However, the "success" log message at the call site
>>>>>> being debug-only means we may be silently hiding bugs in release builds, if
>>>>>> e.g. we get here despite the GFN having had an identity mapping already for
>>>>>> ages.
>>>>>
>>>>> Possibly, but what would be your suggestion to fix this?  I will think
>>>>> about it, but I can't immediately see a solution that's not simply to
>>>>> make the message printed by the caller to be gprintk() instead of
>>>>> gdprintk() so catch such bugs.  Would you agree to that?
>>>>
>>>> My thinking was that it might be best to propagate a distinguishable error
>>>> code (perhaps -EEXIST, with its present use then replaced) out of the function,
>>>> and make the choice of gprintk() vs gdprintk() depend on that. Accompanied by a
>>>> comment explaining things a little.
>>>
>>> I think it would be easier if I just made those gprintk() instead of
>>> gdprintk(), all with severity XENLOG_DEBUG except for the one that
>>> reports the failure of the fixup function that is XENLOG_WARNING.
>>> Would you be OK with that?
>>
>> Hmm. Okay-ish at best. Even if debug+guest-level messages are suppressed by
>> default, I think it wouldn't be nice if many of them might appear in release
>> builds with guest_loglevel=all. What I find difficult is to predict how high
>> the chances are to see any of them (and then possibly multiple times).
> 
> I think getting those messages even in non-debug builds might be
> helpful for debugging purposes.  Sometimes it's difficult for users to
> switch to a debug build of Xen if not provided by their upstream.
> 
> FWIW, on my Intel NUC I see three of those:
> 
> (XEN) [    5.418855] arch/x86/hvm/emulate.c:391:d0v0 fixup p2m mapping for page fedc7 added
> (XEN) [    5.474574] arch/x86/hvm/emulate.c:391:d0v0 fixup p2m mapping for page fd6a0 added
> (XEN) [    8.712784] arch/x86/hvm/emulate.c:391:d0v2 fixup p2m mapping for page fe410 added

For my understanding: Did Xen with a PVH Dom0 not work on the NUC before? Or
else how come it survived without this fixing up of mappings?

> Would you be fine with this approach:
> 
> bool __ro_after_init opt_dom0_pf_fixup;
> static int hwdom_fixup_p2m(paddr_t addr)
> {
>     unsigned long gfn = paddr_to_pfn(addr);
>     struct domain *currd = current->domain;
>     p2m_type_t type;
>     mfn_t mfn;
>     int rc;
> 
>     ASSERT(is_hardware_domain(currd));
>     ASSERT(!altp2m_active(currd));
> 
>     /*
>      * Fixups are only applied for MMIO holes, and rely on the hardware domain
>      * having identity mappings for non RAM regions (gfn == mfn).
>      */
>     if ( !iomem_access_permitted(currd, gfn, gfn) ||
>          !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
>         return -EPERM;
> 
>     mfn = get_gfn(currd, gfn, &type);
>     if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
>         rc = mfn_eq(mfn, _mfn(gfn)) ? -EEXIST : -ENOTEMPTY;
>     else
>         rc = set_mmio_p2m_entry(currd, _gfn(gfn), _mfn(gfn), 0);
>     put_gfn(currd, gfn);
> 
>     return rc;
> }
> [...]
>                     int inner_rc = hwdom_fixup_p2m(addr);
> 
>                     if ( !inner_rc || inner_rc == -EEXIST )
>                     {
>                         gdprintk(XENLOG_DEBUG,
>                                  "fixup p2m mapping for page %lx %s\n",
>                                  paddr_to_pfn(addr),
>                                  !inner_rc ? "added" : "already present");

As before, I think the "already present" message wants to be present also in
release build logs. As opposed to the "added" one. Yet at the same time, if
e.g. you and Andrew agree on the shape above, I won't stand in the way.

Jan

