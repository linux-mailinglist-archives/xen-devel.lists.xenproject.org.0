Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EADA7BA65
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 12:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938043.1338861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0dwO-000370-Ex; Fri, 04 Apr 2025 10:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938043.1338861; Fri, 04 Apr 2025 10:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0dwO-00034q-C4; Fri, 04 Apr 2025 10:06:24 +0000
Received: by outflank-mailman (input) for mailman id 938043;
 Fri, 04 Apr 2025 10:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9O5F=WW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0dwN-00034k-22
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 10:06:23 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75244328-113c-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 12:06:21 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso12719685e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 03:06:21 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b7933sm4083495f8f.54.2025.04.04.03.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 03:06:20 -0700 (PDT)
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
X-Inumbo-ID: 75244328-113c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743761180; x=1744365980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8RhPQpjYoGfPs+WAkhFQNvq8PQFMGXsAZW6uX9T6AzM=;
        b=LZa8VSr8uTogB0ENtGyPkIYlL07xnccTRZSfLlrcDh0LTtmmGURA/xLn35NB/U0xuk
         DGRxk2KV4j8DWunXKdOt4YciuP62qvJoYnAVXzg+SLL0qgG/g0I/nA/qS/SdtsEHq/MR
         3c9dTYqptaND1Kp6SCRy9RfLjXAj6MmeRgSS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761180; x=1744365980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RhPQpjYoGfPs+WAkhFQNvq8PQFMGXsAZW6uX9T6AzM=;
        b=TNNdoXzc7cCkFZoBRsmE8fDBvoVYCD3VCzL3BVneRJMjUoziOwScg7gIwQsS5BPS+D
         dC3KFO3xE2xyeinf6D/pThAGP2K0KoQWjWIpHGZuKUaN4qk7/1fGlTgqsVTi8oS0ePhb
         hwMux9QR40YU7BDohRe0q5GaZW2VC7iQMniVIlbrbDNZ92MWC0YeEmpYtkEk5JRgLaGt
         o+W3zZRePL99cb0prctbiuX5Ti/D0QamBqnqrqSJszRpDQzEp8KpeEXXLAvaEwTdFGOg
         WgU0VR0WEKug1QzLDwZgMFS41vDcIuXH7O35MRPvREZ9qqJD2sNHqw+PP+8eNwQZgFGJ
         jgsA==
X-Forwarded-Encrypted: i=1; AJvYcCXUYpdbR9JKoFm8Cp8vimcGPFkLCripNGpHDhQ0cztEGW7UsGDnbVAyJO7VUUM2EXO25SM5geF96Ig=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZVD37u2TZuW77Llfh4dyUJM1w9IrKmyosCS8F+8V6k7idmyPX
	/GkRZarBTGohMqF7mxVPwHP0/kLNcDvdoZwv0fDnxLUwesMHTBE66Q2ZS35rKt4=
X-Gm-Gg: ASbGncu84/RogyFyxYXcHno6/FUkLCo7ayDMeiSpvYkwESO6OZ16y8tGrV1jKZxlgz4
	24IY1z0Y1nvw9QxvPJiqUBHFQwqlyXhRi4OhmAsLbvQUHhZs7jo2C0WQsCCbhL+Vcj0iDVTGmwA
	n8WzzEHZNubJnoerdc9qN0EcuerOh1jUfposQqD9pCzd75FMUsyoH04rS+WsqiwfkT2zu0f410C
	JDYz8lwrIBFYuwkvKYN3rENNSM+RWaBgOGD70GU8RtTv7GPY6R4MBBSO4Ir0cekNza52GdvOcbv
	0icuslBID+MaL3c5gG6kkjKJirsHhrSOopjylig2RG+jmACkVTb0wWNczSIPK2+0qOpD4LNRrDd
	T1VPgpGco30SvNOZmS1p+
X-Google-Smtp-Source: AGHT+IEOrQJ20Leo4SS1v4ZJPu6c/xGW1K8/PijrsYo/y4geG035agBTAAFz8BCkszkrkk1u3T/PzQ==
X-Received: by 2002:a05:600c:1f17:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43eced66978mr25434275e9.1.1743761180566;
        Fri, 04 Apr 2025 03:06:20 -0700 (PDT)
Message-ID: <2bf7f3f0-52d8-4187-ad47-7b5bbad8d974@citrix.com>
Date: Fri, 4 Apr 2025 11:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/vmx: rework VMX wrappers to use `asm goto()`
To: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me
Cc: anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250403182250.3329498-1-dmukhin@ford.com>
 <20250403182250.3329498-7-dmukhin@ford.com>
 <c452a1d7-4a57-4c5f-8a83-36a74ff228ec@citrix.com>
 <05063353-93c6-4ca6-8155-bf42bd23bacd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <05063353-93c6-4ca6-8155-bf42bd23bacd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2025 8:14 am, Jan Beulich wrote:
> On 03.04.2025 22:10, Andrew Cooper wrote:
>> On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> @@ -294,54 +294,57 @@ extern uint8_t posted_intr_vector;
>>>  
>>>  static always_inline void __vmptrld(u64 addr)
>>>  {
>>> -    asm volatile ( "vmptrld %0\n"
>>> -                   /* CF==1 or ZF==1 --> BUG() */
>>> -                   UNLIKELY_START(be, vmptrld)
>>> -                   _ASM_BUGFRAME_TEXT(0)
>>> -                   UNLIKELY_END_SECTION
>>> -                   :
>>> -                   : "m" (addr),
>>> -                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
>>> -                   : "memory" );
>>> +    asm goto ( "vmptrld %[addr]\n"
>>> +               "jbe %l[vmfail]\n\t"
>> Also cosmetic, but the very final line in the asm block ideally doesn't
>> want the \n\t.
> And to clarify (Andrew gave a similar comment elsewhere) the \t instead
> wants to appear on the first of these two lines.

Indeed.  This particular example got adjusted in patch 1, where I made
said observation.

~Andrew

