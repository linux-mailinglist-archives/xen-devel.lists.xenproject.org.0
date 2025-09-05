Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A738AB4510F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 10:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111492.1460180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuRbK-0000vT-6T; Fri, 05 Sep 2025 08:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111492.1460180; Fri, 05 Sep 2025 08:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuRbK-0000tR-3P; Fri, 05 Sep 2025 08:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1111492;
 Fri, 05 Sep 2025 08:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uuRbI-0000tL-KH
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 08:15:16 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73b74268-8a30-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 10:15:15 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61cebce2f78so1375738a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 01:15:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7dfesm16150230a12.7.2025.09.05.01.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 01:15:14 -0700 (PDT)
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
X-Inumbo-ID: 73b74268-8a30-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757060115; x=1757664915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2VsriFXGsBt9nqoCLaquLayjIb1I6ZvvllaP7w5kKmY=;
        b=dFlJUSZ4a9FN/p6jYaVskzVbuS9W+s1LoS8SY0rVoc16KpXCo9SqPoyIGp0/wZ6tIs
         FKIwdptu/ygMVxhzCyh3iK2l2Y/FcLyrjvOx6lKO+2+IJ3QbNpCVKftnPLen7fw1EwGn
         W4Z5Hk7MTEZ5Tet3it9yeC7ZlMlnGc+XAyqv4QTA143gP5F4bVcOSiQEMMdLPa5z76AT
         JjzKbrqgG9kXHeSmUAOfP6gQQksmAbimZn4s6tgZKoWdtDBtedoQp+SOA/L4ORTYG9R9
         NQm1O8VdnAAjy7nzZEufcV7Ol/qksYVLGplbLq+yrPXk1aeH/IM61qaRabLUdtfDiklj
         9vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060115; x=1757664915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VsriFXGsBt9nqoCLaquLayjIb1I6ZvvllaP7w5kKmY=;
        b=UxD+K/Gf1LzTyFbH25IuayqFQDNn1kn/DWn3sc0aWVCGW2nT+u4dATO/3GuiSVdaDA
         L60v9DQGN7ptE54Y1qiyq/t4141RtjfOJWLYuaaJ1NEjlbSJCl/ITbPEhFSXWvh0S6XR
         AwWUZse+rEvAtIvKW4HVPiQa80Z8jq0G/07zxXXPLy0WRzzt2ZkxSbSymo1O21fkJBZd
         qAY8dvFqtDZ3ZSmpd1pv9gvNkI8gUm+ezmH9IhQjfKu0PddgHn5J45dSJ20OzPaet6VI
         eGuU2flFb7Lkl9aVrTgf0X0EINJckoNkAQj4CNCpSl1sjHTfEFoxIhK5nalavAZfAXhx
         2Icg==
X-Forwarded-Encrypted: i=1; AJvYcCUgoGC9tihX84LyCqFjsw9XNOxqmeRmN276r1Z/a9DhbXO83w+t0kEZa78+qHlPBe103eZy/hoLaf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTsY3AI5UbjHGPNPs7AXncTnH9fro4YkRhSOCfBLR7D/sULT59
	/FQ0MVGmUJguRl521gK2ABZ8KAirDu0JxT2Z9Xih8a/msvF1bMrTVexRt509S/5e4Q==
X-Gm-Gg: ASbGncvlBjwNJW8ROzgZRCtorRnWEhz6uMGngyWEdjly5MR92hTMRIZc2fRcT3LaVmr
	jeUQqS0QgY4QbqtEXnwaeSvvO1PkZgqigtd3wx/CKWymkCXzSQNZQqjyFrJr+SEamzdsHIiRNZH
	O+27e6WG4AvHaEuEy6KKnG9hambl4aODYylPHK73ko7Zl0Pc8EwYWx0YAkOuDnmZyFpGyMj8PLf
	u+OXf/HH/EPqnY5rqH4mYBe9EqVjXSlClHHJtUSs5EPHDsJ1sYB6GdGZRc/bNfJ+54RYSMUJcPf
	rrSVmNj1cUHXSRO8hOPHHbc1tXVmi6B7L9ouZOxNpmIk2wflS49LD1F/ObsuCgM2MDqJpD+00n5
	tOsjtYJr+NcXQcJTCUs6FgsO1E0gGWc93qm398yHnYRKpHH79Fn6tDqjRLRstkH+wdHlISFIvrY
	1/JxCyn/+EVulwiUfQ7Q==
X-Google-Smtp-Source: AGHT+IHlyKTzV4EUsZfsWyXI7udscmyHy3ubo4wwqYDCMt5o9V1aM2EVFuwCR+GKUQsEgiKh/NkTpw==
X-Received: by 2002:a05:6402:2115:b0:61c:5b95:c8b2 with SMTP id 4fb4d7f45d1cf-61d26d8503fmr20631034a12.22.1757060114770;
        Fri, 05 Sep 2025 01:15:14 -0700 (PDT)
Message-ID: <d8d57a91-eaca-4896-ab59-72136c54a5e4@suse.com>
Date: Fri, 5 Sep 2025 10:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Strip build path directories in tools and hypervisor
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250904114202.2722478-1-marmarek@invisiblethingslab.com>
 <488408be-4728-4666-89a5-ac5b438bdbf5@suse.com> <aLmhz9P1c9wYjdwp@mail-itl>
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
In-Reply-To: <aLmhz9P1c9wYjdwp@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2025 16:27, Marek Marczykowski-Górecki wrote:
> On Thu, Sep 04, 2025 at 02:58:20PM +0200, Jan Beulich wrote:
>> On 04.09.2025 13:41, Marek Marczykowski-Górecki wrote:
>>> Use -fdebug-prefix-map in preference to -ffile-prefix-map, as it's
>>> available in earlier toolchain versions. But use it together with
>>> -fmacro-prefix-map (if available) for hypervisor build, otherwise it
>>> still contains some paths in out-of-tree builds.
>>
>> I consider it wrong not to use -ffile-prefix-map when available. That
>> already covers more than "debug" and "macro", and it may gain further
>> functionality.
> 
> I asked about that on v1 and got ambiguous answer suggesting the opposite:
> https://lore.kernel.org/xen-devel/0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com/T/#m74a8883835e30fb74a85b07a7b14507ee52e7c65

Ambiguous answer(s)? There's no reply to that mail of yours, and I don't
see how the conclusion drawn fits my earlier comment. That was more
towards what I did in v1 of my patch - fall back to the more widely
supported option when the less widely available one can't be used.

>>> --- a/tools/Makefile
>>> +++ b/tools/Makefile
>>> @@ -1,4 +1,4 @@
>>> -XEN_ROOT = $(CURDIR)/..
>>> +XEN_ROOT = $(realpath $(CURDIR)/..)
>>>  
>>>  export PKG_CONFIG_DIR = $(CURDIR)/pkg-config
>>>  
>>> diff --git a/tools/Rules.mk b/tools/Rules.mk
>>> index 725c3c32e9a2..428fce094819 100644
>>> --- a/tools/Rules.mk
>>> +++ b/tools/Rules.mk
>>> @@ -166,6 +166,8 @@ endif
>>>  CFLAGS-$(CONFIG_X86_32) += $(call cc-option,$(CC),-mno-tls-direct-seg-refs)
>>>  CFLAGS += $(CFLAGS-y)
>>>  
>>> +$(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(realpath $(XEN_ROOT))=.)
>>
>> Here and below - no need to use cc-option-add for -fdebug-prefix-map,
>> which all permissible compilers support.
> 
> Ok.
> 
>> Further, again as per reply to Andrew on the thread hanging off of my
>> patch - I don't view it as desirable to leave the tools/ prefix in
>> place, or e.g. for libraries, the entire tools/libs/<subdir>/ part.
>> Imo every binary should have only the path (if any) from its own source
>> root left. (And yes, how to deal with e.g. shared include files isn't
>> quite clear to me, yet. Maybe we actually need to pass two options.)
> 
> I don't think it's valid to strip arbitrary prefixes from debug symbols,
> especially in tools. This will break some automated tools that try to match
> coredumps (and similar) to source code and sometimes even debug symbols
> too. But even for manual usage, having to jump between directories (I'm
> not sure if gdb supports multiple source dirs at once?)

Pretty necessarily: When debugging you might easily cross project boundaries.

> just because you
> happen to debug a binary that use more of libraries isn't exactly
> desirable.
> I think the paths in debug symbols and similar should match the layout
> in the source repository, not a subset of it.

Well, okay, we disagree here. To me, xen.git really is an agglomeration of
too many things in a single repo. If things were properly split, you'd end
up with what I'm asking for anyway.

> Theoretically this doesn't apply to the hypervisor yet, as I'm not aware
> of any tool processing xen memory dumps automatically (and those for
> manual usage are quite unstable, to say the least...). But I don't think
> it's an excuse to have incomplete paths in there, just to save few
> bytes?
> The only case where I can see it would make some sense is out of tree
> build, where indeed it's about just the hypervisor, not the toolstack
> (IMO due to the build system limitation, but well...). But at the same
> time, having different path variant depending on it-tree/out-of-tree
> build feels weird.

Which is why I'm arguing for the dropping of the xen/ prefixes, as that's
how things come out in in-tree builds.

Jan

