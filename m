Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63954AC5D6C
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 00:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998810.1379515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK3Dw-0007my-VG; Tue, 27 May 2025 22:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998810.1379515; Tue, 27 May 2025 22:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK3Dw-0007kJ-SK; Tue, 27 May 2025 22:56:44 +0000
Received: by outflank-mailman (input) for mailman id 998810;
 Tue, 27 May 2025 22:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uK3Dv-0007k9-07
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 22:56:43 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da3a5a87-3b4d-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 00:56:41 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad1f6aa2f84so71744566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 15:56:41 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad89f288de2sm22160566b.182.2025.05.27.15.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 15:56:40 -0700 (PDT)
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
X-Inumbo-ID: da3a5a87-3b4d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748386600; x=1748991400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b+8YzaJoOBsvDEn/qHxo5/cmfOi88AtNOe7OBfbl31o=;
        b=s+Cx9zRxGPuDknd0MhY6BR0boGR+VffLcZA0whd6TPUEkoHll6CiDnRiFGarqufTdn
         xqXIRJHuyNsTajkA2qjlH4Xz2I8wfL/bQyrk4wBvP6NFKhVBBSS3fsorwuftoHUL+uJr
         DD9mYM+XNKANyppyQDj/OfCdzc2hRCIeePBJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748386600; x=1748991400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+8YzaJoOBsvDEn/qHxo5/cmfOi88AtNOe7OBfbl31o=;
        b=KWey11ezlWUCSFteNJdTwJpadNdNoAMNXQfR5GiDjyc2QXM4qnC/t1pPL1IEMv40Bw
         Yr5+Xt6PSk1tpeqDHRp6e5tV626KX1MPr8tgAt8oN6Y6h067LMdeKhAmT8CCm/Vck3Of
         toLbD9Kf0Jtc57+tG/f8lPOYkiF7bxAZ7da/2vkQJXnZyX28E2Y9Uqj2hMz7TFcLF+g6
         5NMvcelCUGDE9V1CRHekN9EnEMrI+G+EZ3X6t/ksA/NJ8eWZm9OVUM5rkcZHF795oDIL
         1MnJ65a3HBKdu5AUaP/QQVE14ts0O9/uuUMHNuYm4aCPDrSVier+e3NqHbK1p6LDagQq
         OFcg==
X-Forwarded-Encrypted: i=1; AJvYcCWNHF+v7cEU9DC3KUOX/2GBkwF24NX/xT6LvMWQyfwirKQAnqbGt9DN10iNkjp+Havzy/ecGUAQQtc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbUgyBYJRaaAXt+2QBsexpz2lELU14mp6faQYPtMwGxTl8thEb
	Ya9CjMkSYMopChlbkyTg01dQ/P8FT9ET0PVQxygDZB+wFbjgv8ShA+xKAlLYHN1KD/k=
X-Gm-Gg: ASbGncupEM4YCzHwn8sipGKn7Gu0KntDJv6qzrUpScCOAiHNSZh4+tHwsiGFhqvGrs+
	0yFlz4oWZIOi6cpW3kVDdXyXA9+yLYBAJSERxzZtjD1cHc/ly3uUjyu+QW9L9qRIWUE2443/4c0
	smjD/6Mw5FrsGS37P6YOngB4B3jD1hep2lu19eeIDa/ejETyWDC+zjaAenaxDGQOhG2P3v2pl+v
	/6auhnhXiAVey9lvMsDVPWxV7gnkjroOUCm7hg3rkrzeYZ2ZZ82BM/+W9M2mcPI2ef/hlD4gY4Y
	rSaEM4Q5UufBy4ON8taY5k9df2QHedYa91ZfeNHp7N2k5uHtZ+WPC+K/G0tffyomKhPf/zfJ1ND
	bZnjqbCjoauHsBBCn
X-Google-Smtp-Source: AGHT+IH+bn6Q19H9YlsViR7T71cbSOgHe6jOJAbxmcdsx/V8zD5+BFrUyZWHoTe3w9T1VxQsGmb35w==
X-Received: by 2002:a17:907:94d0:b0:ad5:6e40:9830 with SMTP id a640c23a62f3a-ad8989f83b2mr224562766b.20.1748386600334;
        Tue, 27 May 2025 15:56:40 -0700 (PDT)
Message-ID: <b91dd818-306a-4b39-9169-654bdecfa37e@citrix.com>
Date: Tue, 27 May 2025 23:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Remove is_periodic_irq() prototype
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250527223753.47055-1-jason.andryuk@amd.com>
 <1c850e02-0d87-4fd1-8504-0aee53949136@citrix.com>
 <50b2500d-f732-471c-ab0d-cd2e4d0136e5@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <50b2500d-f732-471c-ab0d-cd2e4d0136e5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2025 11:54 pm, Jason Andryuk wrote:
> On 2025-05-27 18:39, Andrew Cooper wrote:
>> On 27/05/2025 11:37 pm, Jason Andryuk wrote:
>>> is_periodic_irq() was removed in the Fixes commit, but the prototype
>>> remained.  Drop it now.
>>>
>>> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer...")
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Thanks!
>
>>> ---
>>> The full Fixes line is:
>>> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer
>>> (PIT/RTC/HPET) programmed as periodic timer and adds them to
>>> abstract layer, which keeps track of pending_intr_nr to avoid time
>>> interrupt lost and sync'ed timer with TSC.")
>>
>> Yeah, the older commit messages weren't as well structured as we insist
>> on them being these days.
>>
>> How did you find this?  inspection, or a tool?
>
> grep after looking at your vpic.h patch :)

I grepped all prototypes in one go, which is why I missed it...

I had a more extreme version of this patch moving vpic.h into hvm/, but
that's the only header of the set you can do this with.  All others have
a contributing part of struct domain or struct vcpu, and I don't have
time to untangle sched.h today.

~Andrew

