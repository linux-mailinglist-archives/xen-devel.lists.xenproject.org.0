Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1551B9A6712
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823434.1237433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qyM-0006W8-L1; Mon, 21 Oct 2024 11:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823434.1237433; Mon, 21 Oct 2024 11:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qyM-0006Ty-HQ; Mon, 21 Oct 2024 11:53:18 +0000
Received: by outflank-mailman (input) for mailman id 823434;
 Mon, 21 Oct 2024 11:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2qyK-0006Tp-TF
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:53:16 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e9db00b-8fa3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 13:53:16 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso649787066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 04:53:16 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912f681bsm194149466b.84.2024.10.21.04.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 04:53:14 -0700 (PDT)
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
X-Inumbo-ID: 0e9db00b-8fa3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729511595; x=1730116395; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yUIBOu4+Z/u5NyqwnkYStQkT1+5Cq0yFoowVkIIhxhg=;
        b=gncoVzou6+aAmPmiFGwADFaSiJ32YDA+d+/RH7Ep8mUyHbJZcwLCjerKSmnvOO8JAg
         sgPY6+F6X+rn3G0dBaSmUsXlx410/4iHCPq3JtVfJOE6LpxQ+fE6ZWAS4FCk1e1k+PTs
         7I2uR2siholBWMWoqb7db5SP76LJn54tnJ9i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729511595; x=1730116395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUIBOu4+Z/u5NyqwnkYStQkT1+5Cq0yFoowVkIIhxhg=;
        b=nxYZTZHM1GXYDjVLS1K9/jhicgLNrLw2DWNr/yG5fMeBBDtCM8YgGFMYXXNpqrhB+5
         NY27j63GcKwHOjseusz9FsPT9s2vmy1pCGW4l+4i02ArJ1Zf11c5bRPhnFVjxiOzmXpj
         5oyN6LaT/8s1g6/QH30NqRZ57kArHhNucsPBK0AcGODMMQB1r+Xwkw8dCZKGzVmkkSIM
         ODY9Ih2NYn3bJa3t7XEBqJdDN1oT1Su5v9DSFnf2W8g2ynpeHFmsf9QtOTSt/tQlrZ7I
         D23JdMYisXQbhoEXP5WbnEARYiR0ulJ1YoUbulUS204CUn2n1673A9hz5yJYa/sn8dpE
         Cy2w==
X-Forwarded-Encrypted: i=1; AJvYcCUjR81GWBcZkqLRpYQF6IzS/ojLyDw4+0xZEMi+NTPNRcKOHhl3Uz0M2rI0ZN2hT7Z+4CKfvxIWQi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9ICyADcouOOVkWwRNaG6ZNQC/IsYwFkkBdhjPcjVgnoKzSIMm
	1Q/kFLoQEKXsQ+GHX3YJnZmqo0em7pElWzY/LsGE75kdrjnABsnfiY4wTxWLr9I=
X-Google-Smtp-Source: AGHT+IGmYpxSvf9LMEA7KWaNppcpOYVU1U3rEJ8pnVNykBUMq5HKwRvHtkuQmtLdvXW86pbOTSI8Lw==
X-Received: by 2002:a17:906:f58a:b0:a9a:67a9:dc45 with SMTP id a640c23a62f3a-a9a6995d6bfmr953263366b.3.1729511595384;
        Mon, 21 Oct 2024 04:53:15 -0700 (PDT)
Message-ID: <3a92bbe3-d58f-4a33-82db-ead6214ecc00@citrix.com>
Date: Mon, 21 Oct 2024 12:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [PATCH] x86/io-apic: fix directed EOI when using
 AMd-Vi interrupt remapping
To: David Woodhouse <dwmw2@infradead.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Willi Junga <xenproject@ymy.be>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
 <0f3a9c97-3903-414c-b076-5012e6bc9350@citrix.com>
 <f64650fb455c1d33d7ec3898eb5423a930624998.camel@infradead.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f64650fb455c1d33d7ec3898eb5423a930624998.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 12:49 pm, David Woodhouse wrote:
> On Mon, 2024-10-21 at 12:38 +0100, Andrew Cooper wrote:
>> On 21/10/2024 12:10 pm, Andrew Cooper wrote:
>>> On 18/10/2024 9:08 am, Roger Pau Monne wrote:
>>>
>>>> +/*
>>>> + * Store the EOI handle when using interrupt remapping.
>>>> + *
>>>> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
>>>> + * format repurposes the vector field to store the offset into the Interrupt
>>>> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
>>>> + * longer matches the contents of the RTE vector field.  Add a translation
>>>> + * table so that directed EOI uses the value in the RTE vector field when
>>>> + * interrupt remapping is enabled.
>>>> + *
>>>> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
>>>> + * when using the remapped format, but use the translation table uniformly in
>>>> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
>>>> + */
>>>> +static unsigned int **apic_pin_eoi;
>>> I think we can get away with this being uint8_t rather than unsigned
>>> int, especially as we're allocating memory when not strictly necessary.
>>>
>>> The only sentinel value we use is IRQ_VECTOR_UNASSIGNED which is -1.
>>>
>>> Vector 0xff is strictly SPIV and not allocated for anything else, so can
>>> be reused as a suitable sentinel here.
>> Actually, vectors 0 thru 0x0f are also strictly invalid, and could be
>> used as sentinels.  That's probably better than trying to play integer
>> promotion games between IRQ_VECTOR_UNASSIGNED and uint8_t.
> I don't quite follow how you need a sentinel value. How could you ever
> *not* know it, given that you have to write it to the RTE?
>
> (And you should *also* just use the pin# like Linux does, as I said).

Because Xen is insane and, for non-x2APIC cases, sets the system up
normally and the turns the IOMMU on late.

This really does need deleting, and everything merging into the early path.

~Andrew

