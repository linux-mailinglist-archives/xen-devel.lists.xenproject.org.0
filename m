Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A17298F332
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809611.1222030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swO5d-0006Ej-TZ; Thu, 03 Oct 2024 15:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809611.1222030; Thu, 03 Oct 2024 15:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swO5d-0006DA-Qg; Thu, 03 Oct 2024 15:50:05 +0000
Received: by outflank-mailman (input) for mailman id 809611;
 Thu, 03 Oct 2024 15:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNe7=Q7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swO5c-0005yS-K2
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:50:04 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 269fcf9d-819f-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 17:50:02 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso180612566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 08:50:02 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b32c1sm100788166b.133.2024.10.03.08.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 08:50:01 -0700 (PDT)
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
X-Inumbo-ID: 269fcf9d-819f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727970601; x=1728575401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LiZhG8myK6zhll5rKFd+aK+8En+t5qp2DgVt1qXZGGg=;
        b=a0sJLzE1JsM90/WREq3a9y2T2EjsgbWwp/E8rpmX02u9HxWcbVKQH9PDMDGa1V0TrF
         FdQRCoruKiJFwo0GUUqeJCkgGoD33LqLPGU04xWH/hvQf2zf3I8czkWOH9pRlNMUC/mx
         Iva/eeQ1lIIRi3+GdsgOTn0ZxACZ8ejhmnCNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970601; x=1728575401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiZhG8myK6zhll5rKFd+aK+8En+t5qp2DgVt1qXZGGg=;
        b=pxWkVRLSJ5YbrZ/+4QYuZ5/9sSFdFRvOPGkWkFZxydkWVp2Cjs1dqD4iFON7H3dj5O
         YoPM+r5Te4ivrVtrFWsAlOkoVoE1VOdx568TAxBVaVNZmXxax2qL2zNECz88BvD5ggoD
         aS4E7DyO4GGnKmpvZ/s6iv1SUohmvAf6tnL/vyYTcOJ367Y9zZrJ2RSK2ZF7UmxVdqi1
         UI2pC7aDm6omfZK0phbyD3T8qucqGnBD7P/oTlfzZSPL47VJQVFj7nqJFV9e3qjhuT5c
         DgjILrGjjBJ1/z3zWPQSMhH3TEOM1KIJdlVR84scl1mzWA8AkJkG/VTunV8x93WkUDF+
         3trA==
X-Gm-Message-State: AOJu0YyTzapv11lHwB7QUnJUkChVvMhmRubeOweu/4kDVbOCUX9k8frD
	tQGauTbTI5v4psKCNw+gl2fYp3ib884WqFgE2kuWOk0dsSbE72/XjOKBJY/E2oEJhmZLlGFDa2t
	KLY8=
X-Google-Smtp-Source: AGHT+IHsZtmcLNNNErhUByPuKqrCvAfwFjcz9yNq6cYVEI/+B2HdcGSo//JB6v3HWT5MzNNoY9C+hg==
X-Received: by 2002:a17:907:9304:b0:a77:f2c5:84a9 with SMTP id a640c23a62f3a-a98f821de96mr839360366b.18.1727970601473;
        Thu, 03 Oct 2024 08:50:01 -0700 (PDT)
Message-ID: <eed00d56-2a96-419d-88c6-0704a8843b63@citrix.com>
Date: Thu, 3 Oct 2024 16:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Don't use INC to set defaults
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20241003145810.2217075-1-andrew.cooper3@citrix.com>
 <CACHz=ZhDuQd5CGY+05dCciu7K1xFKwpN1NORbqHdG4wijivzMQ@mail.gmail.com>
 <Zv681_sK3WQ4xYy9@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zv681_sK3WQ4xYy9@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/10/2024 4:48 pm, Roger Pau Monné wrote:
> On Thu, Oct 03, 2024 at 04:42:23PM +0100, Frediano Ziglio wrote:
>> On Thu, Oct 3, 2024 at 3:58 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> __efi64_mb2_start() makes some bold assumptions about the efi_platform and
>>> skip_realmode booleans.  Set them to 1 explicitly, which is more robust.
>>>
>>> Make the comment a little more consice.
>>>
>>> No practical change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>>> ---
>>>  xen/arch/x86/boot/head.S | 10 ++++------
>>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
>>> index d1856d8012c9..af776c201a15 100644
>>> --- a/xen/arch/x86/boot/head.S
>>> +++ b/xen/arch/x86/boot/head.S
>>> @@ -279,14 +279,12 @@ __efi64_mb2_start:
>>>          pop     %rbx
>>>          pop     %rax
>>>
>>> -        /* We are on EFI platform and EFI boot services are available. */
>>> -        incb    efi_platform(%rip)
>>> -
>>>          /*
>>> -         * Disable real mode and other legacy stuff which should not
>>> -         * be run on EFI platforms.
>>> +         * efi_multiboot2_prelude() is happy that we're on EFI platform.  Skip
>>> +         * the BIOS initialisation path.
>>>           */
>>> -        incb    skip_realmode(%rip)
>>> +        movb    $1, efi_platform(%rip)
>>> +        movb    $1, skip_realmode(%rip)
>>>
>>>          /* Jump to trampoline_setup after switching CPU to x86_32 mode. */
>>>          lea     trampoline_setup(%rip),%r15
>>>
>>> base-commit: eb21ce14d709ef0c0030d0625028a4868c81126f
>> Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>


Thanks both.

I further note that efi_platform is used exclusively to skip early
cmdline parsing, and I'm sure there's probably a better way of doing
this, but nothing obvious jumps out to me.

I suspect that getting rid of it will be easier when we've moved more
logic to be in C.

~Andrew

