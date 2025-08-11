Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46BB20506
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077241.1438311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPZw-0006tW-BT; Mon, 11 Aug 2025 10:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077241.1438311; Mon, 11 Aug 2025 10:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPZw-0006r6-8n; Mon, 11 Aug 2025 10:16:32 +0000
Received: by outflank-mailman (input) for mailman id 1077241;
 Mon, 11 Aug 2025 10:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulPZu-0006r0-Qa
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:16:30 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f62b38b-769c-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 12:16:30 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so35622485e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:16:30 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58400f5sm244405935e9.2.2025.08.11.03.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:16:28 -0700 (PDT)
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
X-Inumbo-ID: 3f62b38b-769c-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754907389; x=1755512189; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wqEDJMYm3BxFPQ6vTPSnNYFpQUMJHB6Lb7Dl7wc0nmU=;
        b=wHvztIFBUjZ9KC+5jT2Yh1CNGPF0joS2WSfD5ItaGClSzzMOibWFEG26yMDK/KVkBu
         tpsF4EWNPgYgb3DqAni2epduUE1spvZWSSytAMhirkoj6Bl3jhzaoZUMqXJZ3c9dXpbP
         iu0YPr9My641PWTs4PV28VEvfgplZSk3yCAIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907389; x=1755512189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqEDJMYm3BxFPQ6vTPSnNYFpQUMJHB6Lb7Dl7wc0nmU=;
        b=UN9DY1nriVkmqisGF6L/BdU6U2XJ+nEEWShDaB3eqR3unrr2Xomo0yreH9mLMl6JgV
         0+uEkIgDl6Bo2Lr44+N8ZwQTgdm0NkZ75Gn+faUlKCH8iX/tz/2LTMPNFKUyPQrgeOnj
         kYCr5hOTjdRbQ7GqsMo0DeaYfuFFIxLSX0oV1zyg7A7V6GiP0v8PQf2I2nbYU0i237cS
         ghR+ne2x/JoFGLmiUa34UMm0/ifO0bUVIx3WZv1rm+UHFb37anxlWNw+fjIBQ2LTvPYM
         Jw37+3l+8STV2BCvq9ZEMXm0HlOc0xfqIu6/6vmlE2Ivvk8hmjQ9fDK54gxvdcI2I38k
         L65A==
X-Forwarded-Encrypted: i=1; AJvYcCWcMQCKxW2MA0/r+v6vf0qUR8Xoz50GWusN2mD+eHx8wZ5EgQMDIPjwyBA9GLnirobZbRWYLPPMPss=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxaf8/co/9OuhxyhJTzca88875hSTpgcVU/zUOYnQ+WB+tLjg8S
	+ONlXzyD90yMGR8Kjs2c0AlOzjeJSPZ5e/M1KIlCFpcz1nuaCQWeRk6zBD/3tJr7cpI=
X-Gm-Gg: ASbGncvzdlUBFZAyDCQPgAj1KyeMjftN6oGK13ewSVi9ePogi69Etyufgt4ufm1elln
	3BLCMjqMpl02lUPC87+YnkWKw0qvcjV76475msUdYyMw+SoC1Mg6otq989K28NwnLcMe0D/yjno
	GfRToAZJC0+BZr4wJzKF2bAOn9NFnBFiefjQsuTu/T0RdkOk09A/GSWhCa3hOGQkRCdK5BbG73g
	8jN8rDgg0jRxU9GD5KA0PqzsG/gK1nwwKdMmZ8RZtTPEPr33lMgo/aLXINbIQ+stbJKVAVTxZvt
	K3ZqiU4SyHrEnYt33g8xpd3AjclcywgjNtQpufb1Hgqux6CEqBTlLRnsf9leJUr2Xfc/HL2cUbR
	5YCzydpdikfxIswEG5BjZkUFg/CckaDq7P1lLKr8Tanfl24gisgBMREg2RgisYUTt9uBT
X-Google-Smtp-Source: AGHT+IGf086o9zT+fwKdarpuHUYTKJzzqTvlsEkez6k3hFaa6vdZPJ8cqTZwujRUfGM6XIJYLtHSmA==
X-Received: by 2002:a05:600c:1d09:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-459f4f04237mr112730105e9.16.1754907389334;
        Mon, 11 Aug 2025 03:16:29 -0700 (PDT)
Message-ID: <a8cf2ecc-ec39-4e6e-8279-e49cdd2c6d38@citrix.com>
Date: Mon, 11 Aug 2025 11:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC x86/msr: Use WRMSRNS $imm when available
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808222013.1071291-1-andrew.cooper3@citrix.com>
 <e81bc459-347c-4eb9-8f8e-ada25fe8966f@suse.com>
 <0d78dd8e-af92-4b29-9706-e08c2c06ee89@citrix.com>
 <d6b13991-e158-4232-8850-44c0b027edbb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d6b13991-e158-4232-8850-44c0b027edbb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2025 11:06 am, Jan Beulich wrote:
> On 11.08.2025 11:50, Andrew Cooper wrote:
>> On 11/08/2025 9:16 am, Jan Beulich wrote:
>>> On 09.08.2025 00:20, Andrew Cooper wrote:
>>>> +        "mov %%rax, %%rdx\n\t"
>>>> +        "shr $32, %%rdx\n\t"
>>>> +        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
>>>> +
>>>> +        [msr] "i" (msr), "a" (val) : "rcx", "rdx");
>>>         [msr] "i" (msr), "a" (val), "c" (msr) : "rdx");
>>>
>>> allowing the compiler to actually know what's put in %ecx? That'll make
>>> original and 2nd replacement code 10 bytes, better balancing with the 9
>>> bytes of the 1st replacement. And I'd guess that the potentially dead
>>> MOV to %ecx would be hidden in the noise as well.
>> I considered that, but what can the compiler do as a result of knowing %ecx?
> For example ...
>
>> That said, we do need an RDMSR form (which I desperately want to make
>> foo = rdmsr(MSR_BAR) but my cleanup series from 2019 got nowhere), and
>> in a read+write case I suppose the compiler could deduplicate the setup
>> of %ecx.
> ... this. But also simply to use a good pattern (exposing as much as possible
> to the compiler), so there are more good instances of code for future cloning
> from. (In size-optimizing builds, the compiler could further favor ADD/SUB
> over MOV when the two MSRs accessed are relatively close together.)

I have seen the compiler do this in the past, but couldn't reproduce it
for this work.

We specifically do not want any conversion to ADD/SUB, because that
takes our "close to a nop" and makes it no so.

~Andrew

