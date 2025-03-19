Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD15A68CAD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920547.1324689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusR7-0008Nk-VD; Wed, 19 Mar 2025 12:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920547.1324689; Wed, 19 Mar 2025 12:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusR7-0008Kz-S3; Wed, 19 Mar 2025 12:22:17 +0000
Received: by outflank-mailman (input) for mailman id 920547;
 Wed, 19 Mar 2025 12:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx04=WG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tusR6-0006ox-M7
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:22:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caad9c73-04bc-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:22:15 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso23687515e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:22:15 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c82c23ffsm20452405f8f.22.2025.03.19.05.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:22:14 -0700 (PDT)
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
X-Inumbo-ID: caad9c73-04bc-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742386934; x=1742991734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0J11sJvFbaWHNe5xLYgH7oBAsgiixgco7MeN0DPPovc=;
        b=cu283BxioVZVKW/NWqpQS6CIxvpQXUPDQ+MEjBTMkgdVCEDxIBU9U9LSlsuBZKeCzY
         45yXYdKPdky+D/xTZliN6KvIGEjHKlDqL3pXhSVIlJ2YI0z0a7YGMg2O6zVrSwePsowr
         0W8dwe996og6kg5PkCb0YIKslpZ5QKqRlVQSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386934; x=1742991734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J11sJvFbaWHNe5xLYgH7oBAsgiixgco7MeN0DPPovc=;
        b=sqyWY0Kj70F+nwDXnmbRM+BYsmHVVKT9IEZTN8VnLbidYizy6yAKdcs8sJ8KeL5oSK
         vMhp0LrAy1VXsxRjg7i8aQdfBjLT5nX7dDYA9NN8x5dv2Yo5TQyH7PRhqvuxgwcqkttC
         +ARSXfxP0VfCVlW/ABviDGMwLG6t0i5mlkzNZNitAuM0RUAseY3K6ft5XPBhxpm9UgDk
         pApE0RQ4bbRLeW4PbfbYGUWwN9MUggJqHZSm0zeyWLmXhLvZD9b3efKiPibVINri0ZOs
         wUoB0+FfIB1k1fjHcU6RL2sOmsw1vMS0fXVf2hPW8iLtGsKn4R/T1Myw80dXj5RT/hhp
         +hHg==
X-Gm-Message-State: AOJu0YwJ8nKttUe2z/gjE+cUk6D6uIgU5aUkpBJhan18U6nknD8LxvnV
	cKVg+L+96jTsCnZ/mSG6yhTPiwynYaVOL8Uv863Y1SbGreEpM2IElQ3tY/59Wer4QTXt/ZhG6ws
	0
X-Gm-Gg: ASbGnctS/VJnWHS3gp97gRzj923jIZGzerrfQ7swfpVusB/eJEUF6WGjrFy4NH3nZ64
	ZqKaWrJqlXPpnCgrmOh9YCkskgbn24jUiRiYnHMtTfTLaHfnya3sEk1qtGwqbZpBwWieKkVy2Bx
	+Ih1LaYT+r8A0UPOSm1OyTvZDN3kHly1xl8xvZw7D+BtbX+4767iXygZ0vkYYZVxDs4rBaRMOSA
	8XPZfHzDr0/8/4FZA/dZcdARvL4lsJoRX41xFEaE0g0/eUiRsnNAmp6+qNEJuc2QDMBAgZZiN95
	5pbmG/xGk9ekP7ppnDWNEek86za7TSluadzpHaU4+omT2003yPq/BKK3k3KwM3R7N+wsnVO92Xq
	A9zsnWbtHAeVfcQh+W5g=
X-Google-Smtp-Source: AGHT+IG1ZeJJD6MkviQ8sgMk50aCw6+fOQRYkz+edoBYNCFz87VhYwa+qljlSJT0kHiY+msHNlJWCQ==
X-Received: by 2002:a05:6000:186b:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39973b028a9mr1693507f8f.36.1742386934369;
        Wed, 19 Mar 2025 05:22:14 -0700 (PDT)
Message-ID: <063234be-9a09-411e-8a53-ca19f13ef638@citrix.com>
Date: Wed, 19 Mar 2025 12:22:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/boot: clarify comment about trampoline_setup
 usage
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-2-roger.pau@citrix.com>
 <720af946-5c2a-43b4-a9fb-163e41bfdeb7@citrix.com>
 <Z9qESYLU3wMjwS-c@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z9qESYLU3wMjwS-c@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2025 8:46 am, Roger Pau Monné wrote:
> On Tue, Mar 18, 2025 at 05:45:09PM +0000, Andrew Cooper wrote:
>> On 18/03/2025 5:35 pm, Roger Pau Monne wrote:
>>> Clarify that trampoline_setup is only used for EFI when booted using the
>>> multiboot2 entry point.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/boot/head.S | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
>>> index 1b3bd16fe575..59a2b5005cf6 100644
>>> --- a/xen/arch/x86/boot/head.S
>>> +++ b/xen/arch/x86/boot/head.S
>>> @@ -505,7 +505,8 @@ trampoline_bios_setup:
>>>  
>>>  trampoline_setup:
>>>          /*
>>> -         * Called on legacy BIOS and EFI platforms.
>>> +         * Called on legacy BIOS and EFI platforms when using multiboot (either
>>> +         * 1 or 2).
>>>           */
>> /* Called for Mutiboot entry, including MB2+EFI. */
>>
>> is a little more concise?
> That's fine.  Would you like me to resend the adjusted version?

Fix on commit.  No point sending this one around for another revision.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

