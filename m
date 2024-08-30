Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ECF966797
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 19:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786538.1196111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk54e-00006H-Eh; Fri, 30 Aug 2024 17:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786538.1196111; Fri, 30 Aug 2024 17:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk54e-0008RU-BU; Fri, 30 Aug 2024 17:06:12 +0000
Received: by outflank-mailman (input) for mailman id 786538;
 Fri, 30 Aug 2024 17:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGfl=P5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sk54c-0008Pz-Ap
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 17:06:10 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25ffe94b-66f2-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 19:06:07 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5334879ba28so2873513e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 10:06:07 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989230a9dsm232725966b.224.2024.08.30.10.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 10:06:06 -0700 (PDT)
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
X-Inumbo-ID: 25ffe94b-66f2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725037567; x=1725642367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+/BOiHGSYumqVQLot/pndyPGdTJkwe1yspWUo6nf1OY=;
        b=XHWHqFJT9EyDhEnnVv/DImD+KdZaRmyL1f6GKwM17qY89UdgKS3y4DwkQQO36C5lEE
         MzwqG/+qzb2r0zEICs4qBkl5JKr8QO4uIQ1FDNwK9YxVvoqegFDDJQ9K0mLKe4s8ZSxK
         T5ejqvArop5QWEgQtAVex6lAELwSB9IiE/8dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725037567; x=1725642367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/BOiHGSYumqVQLot/pndyPGdTJkwe1yspWUo6nf1OY=;
        b=jv+LWiVdWcIlHZUbWEzuz+r2dNxp+sxLujVf3VtEgSoXtqAWuLWubgxweYxo2NxL9n
         Mm5zlUjhYcwZZ0dgQL4wUxfQgjPuwZkomfbQXv9baCbk81C6FMybDKMYcxdjpifR5e7s
         Z4vWFgQq3XGYEwwXegP/qmrB/mwTg/vGwuLIRVBBRQopNvMm+TiwQb+0YvPi/eB03vFd
         s6fRbUjnLw5cyWjCJIA/0w6vbPTKZzM5c2cjEz1IgI2X+jfcu6NqpvwxiglcTVogvIuN
         lWpYBdu2A8o8UK1aNvjK00V9N4lDCsXHhttlw4U/w9pYBP7IHfaijrI4CbinHq9RgCOd
         0y6Q==
X-Gm-Message-State: AOJu0YwRxi8Mx0nACoJWflLSl+jNw2I0ScyzJwbWjeKd3J4NxC/J5ZVu
	9HU1+GbMdsXo+Ps9Kc+qIMUpWYXWDQxrSXdSThBUmqsw6Niko4NxgL5TreaQyYg=
X-Google-Smtp-Source: AGHT+IHB5eX4GFz0tjwjZfMa13jBVvoLExGQOFHf30KYF/d2nNCjUxLEQbIHI0HatiPDBR1YS4f+3w==
X-Received: by 2002:a05:6512:6d2:b0:52f:cffd:39f9 with SMTP id 2adb3069b0e04-53546b2c596mr1964005e87.24.1725037566568;
        Fri, 30 Aug 2024 10:06:06 -0700 (PDT)
Message-ID: <49ab67ae-1e1a-457a-a759-8517711ab5f8@citrix.com>
Date: Fri, 30 Aug 2024 18:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Make cr4_pv32_mask be PV32-only
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20240829183817.2807665-1-andrew.cooper3@citrix.com>
 <77e852b6-1336-4289-87f2-9cefe2e6fd04@suse.com>
 <ZtGOnQVY4SiEK63o@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZtGOnQVY4SiEK63o@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/08/2024 10:19 am, Roger Pau Monné wrote:
> On Fri, Aug 30, 2024 at 09:55:12AM +0200, Jan Beulich wrote:
>> On 29.08.2024 20:38, Andrew Cooper wrote:
>>> The user of cr4_pv32_mask (the cr4_pv32_restore() function) only exists in a
>>> CONFIG_PV32 build, but right now the variable is unconditionally set up.
>>>
>>> To start with, move the setup into set_in_cr4() and remove it from it's
>>> somewhat ad-hoc position in __start_xen().  This means the variable will be
>>> set up in two steps for a CONFIG_PV32=y build, but it's cleaner and more
>>> robust logic overall.
>>>
>>> With that, there's no good reason for the variable to stay in setup.c.  Move
>>> it to x86/pv/traps.c (for want of any better place to live), and move the
>>> declaration to beside set_in_cr4() and mmu_cr4_features which is a better
>>> position than setup.h.
>>>
>>> Guard the reference with CONFIG_PV32, and fix up a recent typo in an adjacent
>>> comment while at it.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with a suggestion:
>>
>>> --- a/xen/arch/x86/pv/traps.c
>>> +++ b/xen/arch/x86/pv/traps.c
>>> @@ -18,6 +18,10 @@
>>>  #include <asm/traps.h>
>>>  #include <irq_vectors.h>
>>>  
>>> +#ifdef CONFIG_PV32
>>> +unsigned long __ro_after_init cr4_pv32_mask;
>>> +#endif
>> To save on the number of such #ifdef-s, how about moving this into an existing
>> one. pv/mm.c has one, albeit near the bottom of the file (which I'd be fine
>> with, but I could imagine you or others not liking such placement), and
>> pv/domain.c has one near the top which seems pretty well suited.
> I'm fine either way:
>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
> Thanks, Roger.

Thanks.  I'll put it alongside opt_pv32 in pv/domain.c which is indeed
pretty well suited.

~Andrew

