Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B39B75EB
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 08:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828465.1243351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Q47-0003WR-DW; Thu, 31 Oct 2024 07:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828465.1243351; Thu, 31 Oct 2024 07:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Q47-0003TR-Ac; Thu, 31 Oct 2024 07:57:59 +0000
Received: by outflank-mailman (input) for mailman id 828465;
 Thu, 31 Oct 2024 07:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6Q45-0003TL-Pv
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 07:57:57 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3d67fc3-975d-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 08:57:51 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso567457f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 00:57:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10d414csm1310391f8f.26.2024.10.31.00.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 00:57:50 -0700 (PDT)
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
X-Inumbo-ID: d3d67fc3-975d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzIiLCJoZWxvIjoibWFpbC13cjEteDQzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQzZDY3ZmMzLTk3NWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzYxNDcxLjU5MjkzLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730361471; x=1730966271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g8LurPKQp5zGBpHmwHjAhja8F8uIzUPnbeGeIdUEaTI=;
        b=PDOZDWbis1V2a6dOK4cQf25R7cLoxfaKMVIvK/Ezmd7+4puOXd6O7FyxTPSegQM4ed
         ibs/JqI5bGQO9WKNvrG2LdrygqAIMj4COqHkoxcnxuF0EZoLYYBmzoHlBIHiiC3rsVFQ
         K+70A4Fc7xqjTkyk8zO7JFwPC+wAtcyg/yb1wNZxEdQ/T2y9dJ2PD+BR0bxvQtffA/Xo
         hvs6b67cyZkCve9KXqwC2NU993YaVljOcX/l+nk/CBBz8QMBK4LL4nkhAl3IzLvxqUuy
         cp4TuBlYeyImE6k82v4KGyji9Eh3fT4NfIZLhwpmo2hgZ8LykwxpWAh1VEsUbc3TkwWR
         y+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730361471; x=1730966271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8LurPKQp5zGBpHmwHjAhja8F8uIzUPnbeGeIdUEaTI=;
        b=cjRdH44reAoZOvEnkS2fI4HB0U72BcezNtfB3gZekrGfWx0lnj6SVuYRios/jLIwW6
         ga6i31NSkp+uaRtXtaqBI1WoJ9r7UtkgnGimxhbZuKxoOJE3BvI95hxjNFm0fPUUlBdD
         gorRG/3NYurVX7Ql3zRBXUsIoxCT5AwkhFC7fFnYqp8dQw1Z3pXMC/4R2mNgBsMdGsP9
         rk+dT0wZsMmrCjYW7YXBEQzDOvZ1+0n5QvYmLrhgs/GNe0bo70AuRD5Bnef5iNp2td5x
         qaOUhsUorkTjWmxdb2kTMe/ZVlXUJ/cHIJfQnS3RX1tLhO95xEe5cDL5fX+rY9s7s77j
         YBhA==
X-Forwarded-Encrypted: i=1; AJvYcCWClkJ/2U6VceusY3FiPL/gSu+nJZGedaf/UkdVn1fiW8DhujrVEPWvqXdLHWzEHFcHWHd62GPX+KM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzI6Bv/475xzxj5eg5R91R3mFo8urBN/o6T8hRzklgtAzjYCPD+
	SrXj0izaY+P4tD5ouIIZwP/2giHIoY7uMVJ3syX4MLfZCU2B/N/lUhGCptbtnw==
X-Google-Smtp-Source: AGHT+IEXb74iUv83Sx2QCFIUFKu/OTG9k9HPuj36tYd8R3BIVWhBlUMGvuwxPUntU6YJUTKhg/+XmQ==
X-Received: by 2002:a05:6000:2805:b0:37d:4657:ea7d with SMTP id ffacd0b85a97d-381bea26687mr1303924f8f.49.1730361470757;
        Thu, 31 Oct 2024 00:57:50 -0700 (PDT)
Message-ID: <dbc778eb-0c5f-4b99-ab04-020f8b69738b@suse.com>
Date: Thu, 31 Oct 2024 08:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] xen/abi: On wide bitfields inside primitive types
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
 <3bf067c7-617c-42c0-bf6d-4387d97658ae@suse.com>
 <D598HGJY330K.3NA7GQLUSJJ9K@cloud.com>
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
In-Reply-To: <D598HGJY330K.3NA7GQLUSJJ9K@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2024 16:08, Alejandro Vallejo wrote:
> 
> In the course of preparing this answer I just noticed that altp2m_opts suffers
> from the exact same annoyance, with the exact same fix. I just noticed while
> rebasing my Rust branch.

Hardly the only other one. See GTF_type_mask or XEN_DOMCTL_PFINFO_LTAB_MASK.

> On Wed Oct 30, 2024 at 9:14 AM GMT, Jan Beulich wrote:
>> On 29.10.2024 19:16, Alejandro Vallejo wrote:
>>> Non-boolean bitfields in the hypercall ABI make it fairly inconvenient to
>>> create bindings for any language because (a) they are always ad-hoc and are
>>> subject to restrictions regular fields are not (b) require boilerplate that
>>> regular fields do not and (c) might not even be part of the core language,
>>> forcing avoidable external libraries into any sort of generic library.
>>>
>>> This patch (it's a series merely to split roughly by maintainer) is one such
>>> case that I happened to spot while playing around. It's the grant_version
>>> field, buried under an otherwise empty grant_opts.
>>>
>>> The invariant I'd like to (slowly) introduce and discuss is that fields may
>>> have bitflags (e.g: a packed array of booleans indexed by some enumerated
>>> type), but not be mixed with wider fields in the same primitive type. This
>>> ensures any field containing an integer of any kind can be referred by pointer
>>> and treated the same way as any other with regards to sizeof() and the like.
>>
>> While I don't strictly mind, I'm also not really seeing why taking addresses
>> or applying sizeof() would be commonly necessary. Can you perhaps provide a
>> concrete example of where the present way of dealing with grant max version
>> is getting in the way? After all your use of the term "bitfield" doesn't
>> really mean C's understanding of it, so especially (c) above escapes me to a
>> fair degree.
> 
> Wall of text ahead, but I'll try to stay on point. The rationale should become
> a lot clearer after I send an RFC series with initial code to autogenerate some
> hypercall payloads from markup. The biggest question is: Can I create a
> definition language such that (a) it precisely represents the Xen ABI and (b)
> is fully type-safe under modern strongly-typed languages?
> 
> I already have a backbone I can define the ABI in, so my options when I hit
> some impedance mismatch are:
> 
>   1. Change the ABI so it matches better my means of defining it.
>   2. Change the means to define so it captures the existing ABI better.
> 
> Most of the work I've done has moved in the (2) direction so far, but I found a
> number of pain points when mapping the existing ABI to Rust that, while not
> impossible to work around, are quite annoying for no clear benefit. If
> possible, I'd like to simplify the cognitive load involved in defining, using
> and updating hypercalls rather than bending over backwards to support a
> construct that provides no real benefit. IOW: If I can define an ABI that is
> _simpler_, it follows that it's also easier to not make mistakes and it's
> easier to generate code for it.
> 
> The use of packed fields is one such case. Even in C, we create extra macros
> for creating a field, modifying it, fetching it, etc. Patches 2-6 are strict
> code removals. And even in the most extreme cases the space savings are largely
> irrelevant because the hypercall has a fixed size. We do want to pack _flags_
> as otherwise the payload size would explode pretty quickly on hypercalls with
> tons of boolean options, but I'm not aware of that being problematic for wider
> subfields (like the grant max version).
> 
> Now, being more concrete...
> 
> ##################################################################
> # IDL is simpler if the size is a property of the type
> ##################################################################
> 
> Consider the definition of the (new) max_grant_version type under the IDL I'm
> working on (it's TOML, but I don't particularly care about which markup we end
> up using).
> 
>   [[enums]]
>   name = "xen_domaincreate_max_grant_version"
>   description = "Content of the `max_grant_version` field of the domain creation hypercall."
>   typ = { tag = "u8" }
> 
>   [[enums.variants]]
>   name = "off"
>   description = "Must be used with gnttab support compiled out"
>   value = 0
> 
>   [[enums.variants]]
>   name = "v1"
>   description = "Allow the domain to use up to gnttab_v1"
>   value = 1
> 
>   [[enums.variants]]
>   name = "v2"
>   description = "Allow the domain to use up to gnttab_v2"
>   value = 2
> 
> Note that I can define a type being enumerated, can choose its specific
> variants and its width is a property of the type itself. With bitfields you're
> always in a weird position of the width not being part of the type that goes
> into it.
> 
> Should I need it as a field somewhere, then...
> 
>   [[structs.fields]]
>   name = "max_grant_version"
>   description = "Maximum grant table version the domain may be bumped to"
>   typ = { tag = "enum", args = "xen_domaincreate_max_grant_version" }
> 
> ... at which point the size of the field is given by an intrinsic property of
> the type (the typ property on the enums table) I previously defined. It's
> extensible, composable and allows me to generate readable code in both C and
> Rust.
> 
> Should I need to support full bitfields I would require a means of stating the
> start and end bits of every field, which is very bad for the sanity of whoever
> wants to maintain coherency in the ABI.
> 
> ##################################################################
> # Rust and Go don't like bitfields...
> ##################################################################
> 
> ... and neither does C, even if for historic reasons they do exist in the
> standard.

I don't think that's just for historic reasons. To interface with hardware,
alternative approaches are often more cumbersome. See how we're (slowly)
moving to using bitfields more in Xen, in favor of tons of #define-s and
more or less open-coded masking operations.

> On a slight tangent, neither Rust nor Go support bitfields in the
> core language. This was a deliberate design decision of their respective
> designers. I can't speak for Go as I'm not a Go developer, but Rust does have a
> very well-known, well-supported and very common external crate ("bitflags")
> that allows very ergonomic semantics for definition of packed booleans. As an
> example here's the flags for domain create, as spitted out by the generator I
> have.
> 
> (comments removed for brevity). This defines a bitmap indexed by the flags
> type, represented by a 32bit primitive. It's type-safe from the PoV that I
> can't just write 1 << 15 to a variable of this type and expect anything but
> screams from the compiler.
> 
>   bitflags! {
>       #[repr(C)]
>       #[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]
>       pub struct XenDomaincreateFlags: u32 {
>           const Hvm = 1 << 0;
>           const Hap = 1 << 1;
>           const S3Integrity = 1 << 2;
>           const OosOff = 1 << 3;
>           const XsDomain = 1 << 4;
>           const Iommu = 1 << 5;
>           const NestedVirt = 1 << 6;
>           const Vpmu = 1 << 7;
>       }
>   }
> 
> This enables callers to have type-safe variables in a pretty ergonomic fashion:
> 
>   let flags = XenDomainCreateFlags::Hvm |
>               XenDomainCreateFlags::Hap |
>               XenDomainCreateFlags::Iommu;
> 
> and assignments to its related struct would follow regular assignment rules.
> 
> ##################################################################
> # IOW
> ##################################################################
> 
> Supporting general bitfields is annoying, even in C. Adding support in IDL for
> them is a headache if we want the descriptions to help us catch mistakes and
> language support is poor using this constructs (at best).
> 
> Can we please get rid of them?

I remain undecided. If we set forth as a goal to avoid such in the new ABI
that has been mentioned for many years, that would be a more clear cut.

Just taking the example of the gnttab max version: By switching to

    uint8_t max_grant_version;
    uint8_t rsvd0[3];

you actively make it more cumbersome to re-use the rest of the 32-bit field
as (boolean) flags. It may reasonably work for the first 8, with early
provisions it may also work for 16, yet it'll be harder / uglier for more
than that. Allowing such is, after all, the idea behind the present
"packing". (The issue would similarly exist in the new ABI, yet we could
simply decide up front that we're willing to pay that price, perhaps even
outlining up front how to best limit undesirable effects when doing so.)

Just to mention it - you didn't really answer the sizeof() / address-taking
question I raised. You provided a lot of other _useful_ background though.

Jan

