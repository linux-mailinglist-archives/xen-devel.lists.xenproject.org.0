Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098358178B7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656315.1024431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHQg-0002iA-B3; Mon, 18 Dec 2023 17:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656315.1024431; Mon, 18 Dec 2023 17:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHQg-0002fR-8M; Mon, 18 Dec 2023 17:29:22 +0000
Received: by outflank-mailman (input) for mailman id 656315;
 Mon, 18 Dec 2023 17:29:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=De97=H5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFHQe-0002AT-SH
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:29:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa2e7745-9dca-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 18:29:20 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c3f68b69aso33799255e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 09:29:20 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b0040b2c195523sm44904363wmo.31.2023.12.18.09.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 09:29:19 -0800 (PST)
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
X-Inumbo-ID: fa2e7745-9dca-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702920560; x=1703525360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7X55kAfAxUQZhLkX+Yt6U3I8G1i8tlJBLVgXYGEuugE=;
        b=L20bFQy0hmePNAef4IGkaQklLf83HBAUBUa3YCncfflAoUWpSR0NuORu5mZzVsr+EP
         i3MTysVNbktWYRXfJMa3k+RRhfXovUJGmN87SdoaOeSpWIE04S5WtS5kuOx4XNZbJNP2
         la/FhQsFUU4X+L6N1jAkHBfz96mOluQF6I1hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702920560; x=1703525360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7X55kAfAxUQZhLkX+Yt6U3I8G1i8tlJBLVgXYGEuugE=;
        b=lxDirfRWn1550IUKOhROMFGfWtsnYH4AL0NulMZdYWe4xZ2I28qhJUdoFljHJKfP8v
         DZVOD3CCpvH6uX4c2T8gnB2ixwjnZLbU+oNsvtQIF5omHdyOag8c4soBsL3mzSqJ2iQg
         JmSGKlqzRuN+m9YQ94YWZPRSMox1zHHW/mDCKga9JlscTPyRXhr/OKuDJ4RjrB89F/9B
         Bkl1hMIDxlR813YeX6CpHPhai788f8br2dK/JsbscOAFGpv43wgOtAw90goxPdB/8mJe
         J3mElPyAUDyz5QaBDdA0+vpUUHvDBKv2m6sHcHB94AMDKCe6Yu0XFC1HSwnWXfBLAtEE
         8mFA==
X-Gm-Message-State: AOJu0YwL1Mxb6wftaftS+I9w2kJshl7ESbQ3fAkHj05HTMhsZpjiGepo
	xC4jokF8rAYlJ1+anbfEKO8COw==
X-Google-Smtp-Source: AGHT+IEZIrdrFX/NSpfcbob4nBJeGXgNA1uTndBiAREw1lGHhQAMwuvj88P8Y3mlC9PzptF4z7gzZA==
X-Received: by 2002:a05:600c:4754:b0:40c:655a:29b1 with SMTP id w20-20020a05600c475400b0040c655a29b1mr4828857wmo.92.1702920559752;
        Mon, 18 Dec 2023 09:29:19 -0800 (PST)
Message-ID: <04992603-cb10-43ff-9eb3-b8f8f1dc765c@citrix.com>
Date: Mon, 18 Dec 2023 17:29:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] VMX: convert vmx_basic_msr
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <d07fb86f-ef9c-4c2b-ba9a-f1e5c813d45d@suse.com>
 <e17d6e45-b03c-4906-9fb3-af4770aa3cf0@citrix.com>
 <beac1f7c-51cb-47a9-8e96-d09cb3ea6ab7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <beac1f7c-51cb-47a9-8e96-d09cb3ea6ab7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/11/2023 12:44 pm, Jan Beulich wrote:
> On 24.11.2023 23:41, Andrew Cooper wrote:
>> On 24/11/2023 8:41 am, Jan Beulich wrote:
>>> ... to a struct field, which is then going to be accompanied by other
>>> capability/control data presently living in individual variables. As
>>> this structure isn't supposed to be altered post-boot, put it in
>>> .data.ro_after_init right away.
>>>
>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> For (usable) nested virt, we're going to need the VMX MSRs, in their
>> architectural form, in struct cpu_policy.  And just like CPUID features,
>> I want it to end up with nice bitfields to use.
>>
>> Looking through the rest of this series, vmx_caps ends up almost in
>> architectural form.
>>
>> Could I talk you into having a "struct vmx_msrs" (or similar - 'caps'
>> doesn't feel quite right here) in the policy object, and also
>> instantiating one instance of it for this purpose here?
> I was actually wondering while doing the conversion. The main reason I
> didn't go that route right away was that I wasn't really certain whether
> what I'd put there would the really be the (largely) final shape it
> wants to take there. (One thing you've likely noticed I didn't convert
> is _vmx_misc_cap, which right now only exists as a local variable in
> vmx_init_vmcs_config().)
>
>> AFAICT, it would only be a minor deviation to the latter half of this
>> series, but it would be an excellent start to fixing nested virt - and
>> getting this data in the policy really is the first task in getting the
>> ball rolling on nested virt.
> How much of a further change it would end up being (or where that change
> would occur) depends on another aspect: When put in cpu-policy.h (and I
> take it you mean the lib/ instance, not the asm/ one), it would seem
> natural and perhaps even necessary to properly introduce bitfields for
> each of the MSRs right away. That'll lead to a "raw" field as well. In
> VMX code (mostly its cpu_has_* #define-s), I'd then either need to use
> .raw (perhaps a little ugly here and there) or go with using the
> individual bitfields right away (likely eliminating the need for many of
> the constant #define-s), which increases the risk of inadvertent mistakes
> (and their overlooking during review).
>
>> I don't mind about serialising/de-serialsing it - that still has a bit
>> of userspace complexity to work out, and depends on some of the cleanup
>> still needing a repost.
>>
>> If you don't want to take the added space in cpu_policy yet, how about
>> having the declaration there and just forgo instantiating the subobject
>> in the short term?
> There's quite a bit of effectively dead space in the struct already; I
> think I wouldn't mind instantiating the struct there right away. So long
> as you're convinced it's going to be used there in not too distant a
> future.
>
> But: If I go as far, why would I introduce a global instance of the new
> struct? Wouldn't it then make more sense to use host_cpu_policy right
> away? I probably would keep populating it in vmx_init_vmcs_config() to
> limit churn for now, but consumers of the flags could then right away
> use the host policy.

George has stated an intent to pick nested virt up imminently.  I'll
have to defer to him on when this will actually start.

But, sorting out this data in the policies is the next step, whenever
that occurs.


If you fancy going all the way to use the raw/host policy then great,
but I expect that would be a large amount of extra work, hence the
suggestion to just use the "inner" struct in the short term.

Conversion to bitfields would want to be separate patch anyway, at which
point an A/B compile can confirm whether there was no resulting change.

I'm happy if you want to do all of this, but it's a lot of work, and
simply having the data in plain architectural uint64_t in the host
policy is something that I thought would be a very minor change to your
current series, but with a useful step towards nested virt.

One open question, before we get too far into this, is still whether to
express half of these as MSR-features like ARCH_CAPS.  Linux does, and
there is a very complex set of dependencies between certain properties,
although I have a sneaking suspicion that the dependency logic will
needed at runtime as the L1 hypervisor changes the various controls.

~Andrew

