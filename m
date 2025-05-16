Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6EAB972F
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986475.1372039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq7V-0006jh-F5; Fri, 16 May 2025 08:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986475.1372039; Fri, 16 May 2025 08:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq7V-0006hv-CP; Fri, 16 May 2025 08:08:41 +0000
Received: by outflank-mailman (input) for mailman id 986475;
 Fri, 16 May 2025 08:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFq7T-0006hd-3X
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:08:39 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f819cb3a-322c-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 10:08:37 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5feb22e7d84so3526643a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:08:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac33a88sm992816a12.51.2025.05.16.01.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:08:36 -0700 (PDT)
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
X-Inumbo-ID: f819cb3a-322c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747382917; x=1747987717; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NJsIoKxiTjIz4FhDz01fgfOhfoDdugxfkkq8ViNnKhg=;
        b=TQ9CWq8xz6RPiG+FXf81/8TPGsi7dPrUKPNssKasRMccuWXjM2LshMPh0MRzXA359K
         zR1cHXRaJ+a9eHf6bCnvtrdlVQHbjm33O+FeMERCcLMkGWWXnKGnHGRTqqvf2SLaP4xE
         F973v9fQ18PSldp58s4g8IdRw4Rg7n/xCsda51Fp2TGV/rc3ouqeUE/sIxAr+zryOflg
         HNqRxJy5nLbBR/CNzc23nD3tGRoc2eBB3SmFtSxMrn96zFZ5bvOeQF29ZPmi/puICe+h
         ym1tkM24cFtiCnhtGcnzVjUf5BsL9bUz6ZRT99LRj3D2QK0CRy1DLBgoyK65Qa4M5W7W
         FGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382917; x=1747987717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJsIoKxiTjIz4FhDz01fgfOhfoDdugxfkkq8ViNnKhg=;
        b=KwrHhSHLVRXDOOPizi0LcZfSdsfyaFAIiVrkZFDT/Fl7EIlDVMkuviHSIAnmmAGwEV
         taNS+rVu2EU9j1nCjM4pMe41fvx6qMWjzj5RSbgH97zH7BPLgCMMV0lzekeTXaflF9QB
         qmnu/bjOMieYlh3BNpV9PALBramnmO2gYJO2ZJsFJ/RdSt40/VDZgnyZRAf635co188w
         qVoGKHkLz0xnrbu8ZTFzoCIxtVorv2DUaNshdgAsBrUIBXQKNqszSPQEoOg4Tpy+nmaa
         knuHU6y8Ipnynzqqzlbaf9kevLe6xB8AbC1k7vtKVNUUSgXBQqHGF2BIr5lpkNuX0v3m
         BmWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlrqoqwXUy44or7FfUHi/dM3CGKuBAvyYEXkbuuAOHcS3mbvcTFO0UVwXz+oWWJqHwzSa9DbY2RBA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6Qu8XH1uGdyxqSipdN+SesUSe9iM2VP3uGeWRsdLU9FV5Ax7V
	Rwam9g6ClkeWIQNEZ84Zc1sH+nrxmV6trOhIc7utTsaxruXje3c8MPlvtkHyBg6NJA==
X-Gm-Gg: ASbGncuGzrKqu4Dajr3BWjkMMqGIclOO5nVTBn5OUCwwRTSZLJR/5XtqCIS8+5hf66/
	rmGjvRwrc8j5ULOLQdrUuLA3gGOLhbmJThT5ZRHjSD8U0p/MjJ9gTy8rOiofFAWTkrjlZrQYvTW
	J59y2dttud5IkJBdPrfMwHru0iDJH6hND4bpZ3mk9tFfAa2+XNO2jd9Cv60DFJppOR2yQo0fVbI
	CLvGmSpEOvS92clvRH2WqW1yGhR5WVU/wL2By5LuuEeUEheZl6aQc7kACw33QRtYJf40/ufQ/Po
	Vf2T3iKYVM/eTeWq+6BII8r+AOWmWybaPGXyekwRaPj1LRiqWPy3LWR9MMXdo1P0xQCOEWwWJrh
	xfoa5j2XGgfbZFtFNQTQ3SZglYAnLaEzhNQs9
X-Google-Smtp-Source: AGHT+IG5p3D//ONcxCWjkT7EvOWt3wlC8dHuoCQSn/fyEuL6zs/LISp1yoWmjuZqSGaxMXBJN7TSMQ==
X-Received: by 2002:a05:6402:42d4:b0:5ff:f524:90e0 with SMTP id 4fb4d7f45d1cf-6008a5a10c5mr1953482a12.11.1747382916628;
        Fri, 16 May 2025 01:08:36 -0700 (PDT)
Message-ID: <9db4a2ce-ba06-42a1-b6e6-7d0c2b59c0c3@suse.com>
Date: Fri, 16 May 2025 10:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-8-roger.pau@citrix.com>
 <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>
 <aCXB5zpqGfBrPTZy@macbook.lan>
 <205a65d3-92bd-4281-8605-758ca03fcac5@suse.com>
 <aCbxMF9Uj4eBPMAf@macbook.lan>
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
In-Reply-To: <aCbxMF9Uj4eBPMAf@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 10:02, Roger Pau Monné wrote:
> On Fri, May 16, 2025 at 09:07:43AM +0200, Jan Beulich wrote:
>> On 15.05.2025 12:28, Roger Pau Monné wrote:
>>> On Mon, May 12, 2025 at 05:16:02PM +0200, Jan Beulich wrote:
>>>> On 06.05.2025 10:31, Roger Pau Monne wrote:
>>>>> To better describe the underlying implementation.  Define
>>>>> cache_flush_permitted() as an alias of has_arch_io_resources(), so that
>>>>> current users of cache_flush_permitted() are not effectively modified.
>>>>>
>>>>> With the introduction of the new handler, change some of the call sites of
>>>>> cache_flush_permitted() to instead use has_arch_io_resources() as such
>>>>> callers are not after whether cache flush is enabled, but rather whether
>>>>> the domain has any IO resources assigned.
>>>>>
>>>>> Take the opportunity to adjust l1_disallow_mask() to use the newly
>>>>> introduced has_arch_io_resources() macro.
>>>>
>>>> While I'm happy with everything else here, to me it's at least on the
>>>> edge whether cache_flush_permitted() wouldn't be the better predicate
>>>> to use there, for this being about ...
>>>>
>>>>> --- a/xen/arch/x86/mm.c
>>>>> +++ b/xen/arch/x86/mm.c
>>>>> @@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
>>>>>  
>>>>>  #define l1_disallow_mask(d)                                     \
>>>>>      (((d) != dom_io) &&                                         \
>>>>> -     (rangeset_is_empty((d)->iomem_caps) &&                     \
>>>>> -      rangeset_is_empty((d)->arch.ioport_caps) &&               \
>>>>> +     (!has_arch_io_resources(d) &&                              \
>>>>>        !has_arch_pdevs(d) &&                                     \
>>>>>        is_pv_domain(d)) ?                                        \
>>>>>       L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
>>>>
>>>> ... cachability, which goes hand in hand with the ability to also
>>>> flush cache contents.
>>>
>>> Hm, I was on the edge here, in fact I've previously coded this using
>>> cache_flush_permitted(), just to the change back to
>>> has_arch_io_resources().  If you think cache_flush_permitted() is
>>> better I'm fine with that.
>>
>> I think that would be better here, yet as you say - it's not entirely
>> clear cut either way.
> 
> I've reverted this chunk of the change and left the code as-is for the
> time being.

Didn't we agree to use cache_flush_permitted() here instead?

>>>> Tangentially - is it plausible for has_arch_io_resources() to return
>>>> false when has_arch_pdevs() returns true? Perhaps there are exotic
>>>> PCI devices (but non-bridges) which work with no BARs at all ...
>>>
>>> I guess it's technically possible, albeit very unlikely?  How would
>>> the OS interact with such device then, exclusively with PCI config
>>> space accesses?
>>
>> Yes, that's what I'd expect for such devices. Looking around, there
>> are numerous such devices (leaving aside bridges). Just that it looks
>> implausible to me that one would want to pass those through to a guest.
> 
> Well, we also need to consider dom0 here (either PV or PVH), which
> will get those devices passed through.  I assume those are mostly
> system devices, and hence there's usually no interaction of the OS
> with them.
> 
> I'm thinking that our definition of cache_flush_permitted() is not
> fully accurate then, we would need to also account for any PCI devices
> being assigned to the guest, even if those have no IO resources?

I think so, yes.

Jan

