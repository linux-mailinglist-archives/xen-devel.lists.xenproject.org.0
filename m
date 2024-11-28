Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E2B9DB626
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 12:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845300.1260748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcH8-0005bu-5w; Thu, 28 Nov 2024 11:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845300.1260748; Thu, 28 Nov 2024 11:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcH8-0005aR-2s; Thu, 28 Nov 2024 11:01:34 +0000
Received: by outflank-mailman (input) for mailman id 845300;
 Thu, 28 Nov 2024 11:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGcH6-0005aL-N9
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 11:01:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d350c2e-ad78-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 12:01:27 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso97649366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 03:01:27 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c19fasm54397066b.34.2024.11.28.03.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:01:25 -0800 (PST)
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
X-Inumbo-ID: 1d350c2e-ad78-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFkMzUwYzJlLWFkNzgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzkxNjg3LjE1NTg3NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732791686; x=1733396486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NdisanXihBrK8URDLQd6ISVpgLHh90er2ZExBULLirs=;
        b=lN8zePPzsgCWLVaqFnzGGkmLauzbbDIDUfPVqMZlZ1RUKBp7ZPGGTEhMjSeGbnZPom
         KFBK7LBBnoDdzL7ypMEIqtspiKtPhnC/xtPaFd2Gom2pCub3GcRaVtush+MusOcXWCKn
         BhWD6qBbY1rCmDp8pk1Ost7C0/LOwo4AjUKHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791686; x=1733396486;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdisanXihBrK8URDLQd6ISVpgLHh90er2ZExBULLirs=;
        b=tqTLE9OnXr1wdbxp2UvvlKsmjnjWydvJ7oSrNKIsT/pvGsIJ/OI2/7SjFuNnZRnsCN
         yC/umM5qPc1ga17YlF+EjJo7plvAXZELFv3OvAKXx2E7n2Y0BXVFWGs8rI6Dme+yTpLS
         s7o62W16yEdgVdA9k+HOncj9nQeaMnEyU19nkHUmLxM1W5rwVUmJD+xvbYUpm2xrqwNL
         paK7r64fcaQXFZoZlfijkfqv0Hwu8QkRhQ14VhTx7xy9o7eKJH9JuRSIbg7F9jE41gAm
         tj+AtGst8aa9SWUgpZ4Y1SX+dLNviHmnjSPuU2bF3SxjbomMVv+QqQZpfzp36zhGPWxq
         rJdw==
X-Gm-Message-State: AOJu0Yw62jMUh6jVBJrnck71zVfYH7w+Y9umPdrkkG1p0rZCcw//gI57
	j6mw30Ea8utwgfI0hjpYU2zSz0jajNpl/1SiQpSfTLNyhrgA2CRhDKc0Bw8x7vSURSJJuRiQmwN
	T
X-Gm-Gg: ASbGncszV5UJj0bPPdZmoUrnrf1CRckJMbTo8bmNianZqaHDfPA9da4nPD/p6jnH9+Y
	XuH32AunTRs7HdPe41cNXjw4LOWA8GJYvQC3SoENWxatrYXU50O0OLb01BZfqeFEgJi4FJYkPFK
	aHCM1b8l3PbG/R00IWy9dkVauIjeSlrfR0zrlbBujQ0z6gLOci3Z6CPHfbGGWkgxPYqymPmqCzC
	9mz+/9kGkPAjOL/w9RsiZar+cw+w/4wrvxFR8te5USE9gb2iOOpKFaD/dUq/bU=
X-Google-Smtp-Source: AGHT+IGr7FTk8DMyNMgmQkGUkn/BKNDivAF1zFC+ysXhG3JL00WajLrbqlNBGGWGni+U1G5vbZuKVw==
X-Received: by 2002:a17:906:328d:b0:aa5:1d08:dad0 with SMTP id a640c23a62f3a-aa580ede47cmr501873866b.1.1732791686424;
        Thu, 28 Nov 2024 03:01:26 -0800 (PST)
Message-ID: <4b8656ad-5a52-4c62-a7b4-bbc16226653d@citrix.com>
Date: Thu, 28 Nov 2024 11:01:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-2-andrew.cooper3@citrix.com>
 <Z0gx5EdqcPiEUt3z@macbook>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z0gx5EdqcPiEUt3z@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2024 9:03 am, Roger Pau Monné wrote:
> On Thu, Nov 28, 2024 at 12:47:36AM +0000, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index 3363926b487b..98394ed26a52 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -108,7 +108,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>>      uint32_t esr;
>>  
>>      spin_lock_irqsave(&vlapic->esr_lock, flags);
>> -    esr = vlapic_get_reg(vlapic, APIC_ESR);
>> +    esr = vlapic->hw.pending_esr;
>>      if ( (esr & errmask) != errmask )
>>      {
>>          uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
>> @@ -127,7 +127,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>>                   errmask |= APIC_ESR_RECVILL;
>>          }
>>  
>> -        vlapic_set_reg(vlapic, APIC_ESR, esr | errmask);
>> +        vlapic->hw.pending_esr |= errmask;
>>  
>>          if ( inj )
>>              vlapic_set_irq(vlapic, lvterr & APIC_VECTOR_MASK, 0);
> The SDM also contains:
>
> "This write also rearms the APIC error interrupt triggering
> mechanism."
>
> Where "this write" is a write to the ESR register.

Correct.

> My understanding
> is that the error vector will only be injected for the first reported
> error. I think the logic regarding whether to inject the lvterr vector
> needs to additionally be gated on whether vlapic->hw.pending_esr ==
> 0.

I think it's clumsy wording.

Bits being set mask subsequent LVTERR's of the same type.  That's what
the "if ( (esr & errmask) != errmask )" guard is doing above.

What I think it's referring to is that writing APIC_ESR will zero
pending_esr and thus any subsequent error will cause LVTERR to deliver.


Having said all that, I can't find anything in the current SDM/APM which
states this.  I think I need to go back to the older manuals.

~Andrew

