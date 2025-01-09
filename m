Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C01A073E7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:57:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868093.1279630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqDk-0002hq-6I; Thu, 09 Jan 2025 10:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868093.1279630; Thu, 09 Jan 2025 10:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqDk-0002f9-3L; Thu, 09 Jan 2025 10:57:00 +0000
Received: by outflank-mailman (input) for mailman id 868093;
 Thu, 09 Jan 2025 10:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rr8/=UB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVqDj-0002f1-2g
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:56:59 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71b4aa13-ce78-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 11:56:57 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso5835325e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 02:56:57 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d74sm16900385e9.29.2025.01.09.02.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:56:56 -0800 (PST)
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
X-Inumbo-ID: 71b4aa13-ce78-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736420216; x=1737025016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=djGHfkzCKFhqMpCfIe7TxlLMHasKymCERG8Gpo7WRKY=;
        b=UwTClgrE8Mh5xteeK8EEeocRusygNrWhYq9B+lHy4PQxZ8YDahrFV00AxUmPneiGDI
         x+HX0OMEtecXnm18sk+Cg+pX+6yR28KFon6HDlcb1FHXurmC0bq0uWWpjcOuwDl5K+Ie
         UqUqPKf2krX4KgNUneTOeiIGoNF3AT4EG3a5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736420216; x=1737025016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djGHfkzCKFhqMpCfIe7TxlLMHasKymCERG8Gpo7WRKY=;
        b=pZZUCML5mGtMTC+iZXhPTRXAK4vmCQn/LAUOyJ4SqBhkDdoABKCHyj9NJ+dIbY66Nv
         5lhzPS0zucuktSAWyd045BneQbk4O9QjNMxaUiZm2hsrfGBHNuP4J0YlGTwH/qYeRZSZ
         upOAST0j+AICInNAn/+kZgyLYliELjdwYcqPswPCwROVyf0H7HfbAawLqUAewrnWpuFI
         AuiY6L6RKSWbVk50ElVcuprRt1jLrSaBmvIdByzQlcugxV/6rGSlmqlOKlte1dkr3q4r
         KJ/NU+Z6zRuE080rNlCyMXsS8MKDWEd4ENqbLxR60CNXF7SJEe24QH3TR9UwFaJYK5TS
         JAYg==
X-Forwarded-Encrypted: i=1; AJvYcCUmiUr6BxuICcgzMp51SmodjRS3tWD7KfYDP0ubQbdMOVT447ddGYiOS4ZlY6YpnLh6UGvTEFAcNFA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS0N4vcnKpad3C1hdioCwcCEd1vJYX2MZ05dWQAy7Xsd/zSqKG
	yu8U5VdvSyIskN1FGeD1eFYiZ5pCog5/DRaJCyfgPttKFp+iHsXcVRKaX9nIRpk=
X-Gm-Gg: ASbGnctWu6WKYFERD8jhXsR4g4Q2UnAvS/gGwvhHSyehsRin4Q8JW+WFuOXhtJOt7T0
	2AJVeYGhO6VDddRSXtsZsu6b6tDWXU0n1pA2MIyLd5t9jd/he2wWEFnRbUg01+ZPamDnS/iA3Pm
	8sj/Ubempz/3Up+RsUtcdr6aEJTgPNqE4Sr8UsZ7f8hTnB2ne/u4pLH8LJt2xZyKLvvPgOdpljc
	/KlbGhxlU/s7kApL56B9HCoUmO8WIrUjGQk4U9Y/nF1I1XLxVXHCxmEoa7wOIY1/ss=
X-Google-Smtp-Source: AGHT+IFac6gDf45bd56Pa/++0zTwuL9VrnL4kn1j5hrj43cu7ZfLo+Ker0VejpYqvPkkrONm+sNjjQ==
X-Received: by 2002:a05:600c:4510:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-436e26ffb2cmr61925645e9.30.1736420216439;
        Thu, 09 Jan 2025 02:56:56 -0800 (PST)
Message-ID: <d1b55fc3-feac-47e8-beed-5905b67131e4@citrix.com>
Date: Thu, 9 Jan 2025 10:56:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Introduce per-arch pte_attr_t type for PTE flags
To: Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <47babd3f9ec00c15738a81aa57926e8a1f08cbe6.1735669493.git.sanastasio@raptorengineering.com>
 <a769ef28-5794-45a0-bb3f-e3dc3e3bcef3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a769ef28-5794-45a0-bb3f-e3dc3e3bcef3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2025 9:15 am, Jan Beulich wrote:
> On 31.12.2024 19:27, Shawn Anastasio wrote:
>> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
>> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
>> represent architecture-dependent page table entry flags. This assumption
>> does not work on PPC/radix where some flags go past 32-bits, so
>> introduce the pte_attr_t type to allow architectures to opt in to larger
>> types to store PTE flags.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> As iirc Andrew had indicated when suggesting this, what you say for PPC is
> true for x86 as well. Yet still we get around with unsigned int. Hence I
> think the change needs describing differently.

x86 is currently unsigned int, and with some reasonably expensive
packing/unpacking under the hood.

x86 ought to become unsigned long, now we don't have the 32bit build to
worry about.  (back of the envelope calculation says up/down: 400/-3868
(-3468) but I've not checked that this boots).

>
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -70,6 +70,10 @@
>>  #include <xen/perfc.h>
>>  #include <public/memory.h>
>>  
>> +#ifndef CONFIG_HAS_PTE_ATTR_T
>> +typedef unsigned int pte_attr_t;
>> +#endif
> This imo makes the Kconfig control a misnomer: We'll always have pte_attr_t.
> I wonder whether this actually needs a Kconfig setting in the first place:
> It's hardly the end of the world for all architectures to specify the type
> (later: the underlying type, for the real type to become type-safe)
> explicitly.

All architectures strictly need this.  It's not optional, so doesn't
warrant a Kconfig option.

Either, arch/mm.h is required to provide the typedef, or we could have a
common one as so:

#ifndef pte_attr_t
typedef unsigned int pte_attr_t;
#endif

which architectures can influence with:

typedef unsigned long pte_attr_t;
#define pte_attr_t pte_attr_t

in the usual way.


One thing however does occur to me.  ARM and RISC-V have systems with
MPU protections rather than MMU, with Xen already starting to support
this on ARM.

Therefore we might want to reconsider the name pte_attr_t to be
something slightly less pagetable specific.  Then again, I'm not sure
how much overlap there is between the map* functions and MPUs, where
mapping is of course not possible.


Finally, this wants to be at least 2 patches.  One introducing
pte_attr_t, and one changing PPC to be unsigned long.

~Andrew

