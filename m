Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D898B8DB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807934.1219679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZi7-0002ri-AM; Tue, 01 Oct 2024 10:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807934.1219679; Tue, 01 Oct 2024 10:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZi7-0002qD-7Z; Tue, 01 Oct 2024 10:02:27 +0000
Received: by outflank-mailman (input) for mailman id 807934;
 Tue, 01 Oct 2024 10:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oTF=Q5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svZi5-0002lV-BH
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:02:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413b715c-7fdc-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 12:02:23 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d0d82e76aso869104266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:02:23 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93e9f9aed3sm420370566b.31.2024.10.01.03.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 03:02:22 -0700 (PDT)
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
X-Inumbo-ID: 413b715c-7fdc-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727776943; x=1728381743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RadLtHikHNn96wg7EEGjuSokSf70lW0ugmYKF3APxmY=;
        b=kqPoC8aeKt9sB+8qLB3VCWkLkywFC1N0hNTxylq5Hwo/SEkGLG6dlhN/OFvY3P0omN
         vCMxALbJ9dydVuVvanWRL20l2Qo1gLNPLx478kQkIo+4A8yXZuXWVodN8Fgz5UAI8ErI
         mzMNaER/dhaWEwS/3CdhlMoEkPlq8Wgp9JPxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727776943; x=1728381743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RadLtHikHNn96wg7EEGjuSokSf70lW0ugmYKF3APxmY=;
        b=MztsUbq7NfEFygA86kNwSvnsyhL6mmbD2NtUoMpxggL3NJnPL25VUsBl0c+Un5/DRZ
         Ob+zSDyOkJGKX0l9QF9MsBYqwpeN5l72Xky+Y9RXMyX7+lS4sIor722pjxplW3wwoXeP
         mbuuALFlV1LREbftKqnhEEj1MHTnxTJ+1JgK8URr0Oii4MmWMomqlCf6oReBHcOWk97Q
         DrKPDSoePYQ19QnyFq4YQ+F/lZkcr/om6xqqQbHQ3DPCsVRDi2yPJXhl3lVUac8c52Rv
         bcWR52oYmputHYyy/hMEyfA0sMcBAXH7/s8HzRh/wrHfdvcRPNN6addXVr+ISoV/KaYN
         xQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCVAlKnfM4JCVD4KxQL6Fo4CIo/23m/8dYM2YP0ShSLjFcliUMJy893BghPUkCefNhonAuehGLZXq84=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQP/tX8Q8ORXFVepkm5SXESHx4874o3uwKjHMbOfJGhYukaKUO
	bGNu26WaXkLdcixYJnHwH62hu7pfErAy7f259dPEjZ7SORO16uaq1A0jwu4nYFs=
X-Google-Smtp-Source: AGHT+IGFXKSHILTNi1sDC2l2GPFS5UjbMT5ufHXyt6rObGvwCcCkHRZ9XPaAUvijISaRWg24Vz5ecA==
X-Received: by 2002:a17:907:7fa5:b0:a86:820e:2ac6 with SMTP id a640c23a62f3a-a93c49087ffmr1843767666b.22.1727776943014;
        Tue, 01 Oct 2024 03:02:23 -0700 (PDT)
Message-ID: <e31a6eaa-2f19-479b-8e1f-ae7d7743d27f@citrix.com>
Date: Tue, 1 Oct 2024 11:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/pv: Rework guest_io_okay() to return X86EMUL_*
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
 <20240930161837.1248144-2-andrew.cooper3@citrix.com>
 <76819790-abde-4b61-8dd7-68dd9db8cfd1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <76819790-abde-4b61-8dd7-68dd9db8cfd1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 8:11 am, Jan Beulich wrote:
> On 30.09.2024 18:18, Andrew Cooper wrote:
>> @@ -190,10 +192,12 @@ static bool guest_io_okay(unsigned int port, unsigned int bytes,
>>              toggle_guest_pt(v);
>>  
>>          if ( (x.mask & (((1 << bytes) - 1) << (port & 7))) == 0 )
>> -            return true;
>> +            return X86EMUL_OKAY;
>>      }
>>  
>> -    return false;
>> +    x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
> do_general_protection() has
>
>     /* Pass on GPF as is. */
>     pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
>
> which may make a difference in case the insn changes under our feet.

It would make a difference if we chose to raise #GP[non-0].

But, see how the call to pv_emulate_privileged_op() is guarded on
error_code == 0.

Prior X86EMUL_UNHANDLEABLE can't ever have raised anything other than
#GP[0], (excusing cases of memory corruption in regs->error_code).

So, there is not a change in behaviour, even if the reason why is
less-than-obvious.

~Andrew

