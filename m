Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081058ACB7C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 12:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709895.1108931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryrN3-0007dM-2s; Mon, 22 Apr 2024 10:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709895.1108931; Mon, 22 Apr 2024 10:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryrN3-0007ak-00; Mon, 22 Apr 2024 10:58:01 +0000
Received: by outflank-mailman (input) for mailman id 709895;
 Mon, 22 Apr 2024 10:57:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ryrN1-0007ZG-LU
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 10:57:59 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d57a13f-0097-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 12:57:57 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so6348525e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 03:57:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b0041a7aa23dbfsm1563440wmb.48.2024.04.22.03.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 03:57:56 -0700 (PDT)
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
X-Inumbo-ID: 2d57a13f-0097-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713783477; x=1714388277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFPA+xLiVjGbSZJp/fDcuw2eMSQ35Y/HGcPKt41e5Ys=;
        b=PHZiOHJ1kwi7/fDMLqf1z2czc8nM4h3bjzslErVGV08T15ETwp0k7YROx2i9VOeEcs
         fQHKXcvptSPNBwvBvtjFisOQprgwPVHXz+8smBcyimk+cUtfkf0o8vA0Q1GwOe3EDIEt
         1YZSGesTWreYAXMFIy3vf3Wl0sM3GmCa9j0N5WFDzs2cROjjZXRdqYW5AFw8K7+Wv9T+
         M+GHPSLCXFIDKrJoktkltMzw68Xj/XF1ikBL64lt868GADSzhSAPk6d4gOV3VzPIVbjT
         ppRBH9XRtUHkyHmkbbR0BgcclDYWSacORO4r/0aVmteBIy6aRdgfvKB0FfeGr4quOqPh
         k81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713783477; x=1714388277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFPA+xLiVjGbSZJp/fDcuw2eMSQ35Y/HGcPKt41e5Ys=;
        b=vqnFMVykIuha0o18K6AUBlMKLAyk+2PfXFA1R0HcRlj/fk/rAW/3I+aT5Y4l/Lg3op
         8FEGPY2T1BgttXUsBgHvvdE84oxWpspM3/4H5SdyUfqOuxkD/b0GAqo/jW3k7VH7/jlu
         kELboDXRznY4e82lZIk3UOxOxgxH/sl8e/xAez/PHwBPsQbZAxIZBMnuu7Su5RJAyFHb
         gpHGCCviDjC6/QKq5kIT99/4hJMaVHeJMqSfiKD8a4VzaoY/48o7Nr5+wrMrEKOH1c5K
         +CmfahSx87WAAbhM5Yc8w3b3TtIRAFx3pToid63g1YOTvgG4s+9JXdgJFpbdSipHWS+T
         dF1w==
X-Forwarded-Encrypted: i=1; AJvYcCWpVWy/tt9nY1sIfEbCPQql3rEa9ni4sgR2H2VchXWsg8AA5QiPjN8phUZrh5E9PW53QQehmgjUhVGvJiuQbiXEm1KyQA8o+Yf6Pxqmsf4=
X-Gm-Message-State: AOJu0YxIOnxi5LNWZzvJNBqiUrVxxgV0RhZ81tDDwIzDXWdoER1gal9Q
	OCY0nwkaZxpCTIf1EVG3DOrNpOgUBrbrw+Q/3yNR4bxW2uFrGhkB6Fj/hMvpNA==
X-Google-Smtp-Source: AGHT+IF7caF5slc/OsRIW86KiLYrytXhCYvVyuy067kLcSnCH8D62cxT/0330SLOs5oXmXML/ix+8w==
X-Received: by 2002:a05:600c:4c17:b0:418:f6e7:3599 with SMTP id d23-20020a05600c4c1700b00418f6e73599mr8343345wmp.3.1713783476803;
        Mon, 22 Apr 2024 03:57:56 -0700 (PDT)
Message-ID: <e5763200-fa87-46ec-8746-c7b4215a28ff@suse.com>
Date: Mon, 22 Apr 2024 12:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
 <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com> <ZiJMj00By3X8FskL@macbook>
 <002fac06-d867-46cc-89c4-9ebe2d68eaf2@suse.com> <ZiYXtJcefv-iMpAj@macbook>
 <f00e0b8b-0e45-45b1-9151-6c16c5a70d76@suse.com> <ZiZA0-n6vbOgu-_1@macbook>
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
In-Reply-To: <ZiZA0-n6vbOgu-_1@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.04.2024 12:49, Roger Pau Monné wrote:
> On Mon, Apr 22, 2024 at 10:25:40AM +0200, Jan Beulich wrote:
>> On 22.04.2024 09:54, Roger Pau Monné wrote:
>>> On Fri, Apr 19, 2024 at 04:34:41PM +0200, Jan Beulich wrote:
>>>> On 19.04.2024 12:50, Roger Pau Monné wrote:
>>>>> On Fri, Apr 19, 2024 at 12:15:19PM +0200, Jan Beulich wrote:
>>>>>> On 19.04.2024 12:02, Roger Pau Monne wrote:
>>>>>>> Livepatch payloads containing symbols that belong to init sections can only
>>>>>>> lead to page faults later on, as by the time the livepatch is loaded init
>>>>>>> sections have already been freed.
>>>>>>>
>>>>>>> Refuse to resolve such symbols and return an error instead.
>>>>>>>
>>>>>>> Note such resolutions are only relevant for symbols that point to undefined
>>>>>>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
>>>>>>> and hence must either be a Xen or a different livepatch payload symbol.
>>>>>>>
>>>>>>> Do not allow to resolve symbols that point to __init_begin, as that address is
>>>>>>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
>>>>>>> resolutions against it.
>>>>>>>
>>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>> ---
>>>>>>> Changes since v1:
>>>>>>>  - Fix off-by-one in range checking.
>>>>>>
>>>>>> Which means you addressed Andrew's comment while at the same time extending
>>>>>> the scope of ...
>>>>>>
>>>>>>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>>>>>>                      break;
>>>>>>>                  }
>>>>>>>              }
>>>>>>> +
>>>>>>> +            /*
>>>>>>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
>>>>>>> +             * livepatch payloads don't have init sections or equivalent.
>>>>>>> +             */
>>>>>>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
>>>>>>> +                      st_value < (uintptr_t)&__init_end )
>>>>>>> +            {
>>>>>>> +                printk(XENLOG_ERR LIVEPATCH
>>>>>>> +                       "%s: symbol %s is in init section, not resolving\n",
>>>>>>> +                       elf->name, elf->sym[i].name);
>>>>>>
>>>>>> ... what I raised concern about (and I had not seen any verbal reply to that,
>>>>>> I don't think).
>>>>>
>>>>> I've extended the commit message to explicitly mention the handling of
>>>>> bounds for __init_{begin,end} checks.  Let me know if you are not fine
>>>>> with it (or maybe you expected something else?).
>>>>
>>>> Well, you mention the two symbols you care about, but you don't mention
>>>> at all that these two may alias other symbols which might be legal to
>>>> reference from a livepatch.
>>>
>>> I'm having a hard time understanding why a livepatch would want to
>>> reference those, or any symbol in the .init sections for that matter.
>>> __init_{begin,end} are exclusively used to unmap the init region after
>>> boot.  What's the point in livepatch referencing data that's no
>>> longer there?  The only application I would think of is to calculate
>>> some kind of offsets, but that would better be done using other
>>> symbols instead.
>>>
>>> Please bear with me, it would be easier for me to understand if you
>>> could provide a concrete example.
>>
>> The issue is that you do comparison by address, not by name. Let's assume
>> that .rodata ends exactly where .init.* starts. Then &__init_begin ==
>> &_erodata == &__2M_rodata_end. Access to the latter two symbols wants to
>> be permitted; only __init_begin and whatever ends up being the very first
>> symbol in .init.* ought to not be referenced.
> 
> Hm, I guess I could add comparison by name additionally, but it looks
> fragile to me.

It looks fragile, yes. Thing is that you're trying to deal with this when
crucial information was lost already. Or wait - isn't the section number
still available in ->st_shndx?

> So when st_value == __init_begin check if the name matches
> "__init_begin" or "__2M_init_start" or "_sinittext", and fail
> resolution, otherwise allow it?

Kind of, but that's not enough. For one, as said, the first symbol in
the first .init.* section would also have this same address, and would
also want rejecting. And then the same would be needed for __init_end.

>> Worse (but contrived) would be cases of "constructed" symbols derived from
>> ones ahead of __init_begin, with an offset large enough to actually point
>> into .init.*. Such are _still_ valid to be used in calculations, as long
>> as no deref occurs for anything at or past __init_begin.
> 
> But one would have to craft such a symbol specifically, at which point
> I consider this out of the scope of what this patch is attempting to
> protect against.  The aim is not to prevent malicious livepatches, and
> there are far easier ways to trigger a page-fault from a livepatch.

I understand the latter is the case, but I'm afraid I then don't see what
the goal of this change is.

Jan

