Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D6A55C8F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 02:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904456.1312338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqM6e-0000Se-Gh; Fri, 07 Mar 2025 01:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904456.1312338; Fri, 07 Mar 2025 01:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqM6e-0000PW-B9; Fri, 07 Mar 2025 01:02:28 +0000
Received: by outflank-mailman (input) for mailman id 904456;
 Fri, 07 Mar 2025 01:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqM6d-0000PQ-54
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 01:02:27 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ed604c-faef-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 02:02:25 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43bcfa6c57fso7547985e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 17:02:25 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8dbb2fsm34822325e9.20.2025.03.06.17.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 17:02:23 -0800 (PST)
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
X-Inumbo-ID: d4ed604c-faef-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741309344; x=1741914144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P4heuVWu5+Ldn39bDXgdzZt1Z0uKXplph1DqTILALFA=;
        b=hKvvmZBbu+oIE1c2GJ2OSbeU/UMErlchmEGQVGWprvihSxGfEB/R/a7kQUPriCh3FS
         mvS0egNfWmDnn0Le+V3ZbPkg+NEgdTEQ7iFQSymGaIFyoWMEHvMTsbQ19PMgi+cETb/T
         hWjRmwPlGSQNuEuGyvVCy+KGIvQK2HAWGiaDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741309344; x=1741914144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4heuVWu5+Ldn39bDXgdzZt1Z0uKXplph1DqTILALFA=;
        b=fkRUOwpjHx7la3q7b18rGA+djoJ4A+PvPONPdbmHI0ZxRpemMOPwkH6bWnLTJWSAUg
         1wCnfObROBCC8/3pZ5PJxEbwi73sYS40obMFiHPtdO4fdH4fp7ZTpcNdJHatOFprt1Go
         8oGaXsQhWlYW87ta513f8eFJnLQxE0Mry0StqbYjt3NaU3iHo7Lnf4mQJsi6g0QvHePK
         ma7VQcpYg+WWiAMEwZqThX0udXQ5iiOA6wO7RVOeWfqHitJLzzZy3Ci6iiuThGKSOk8E
         KGPtpn4iN0I2QzMX2fBJfPP7ZpsR6XZgtuCqGHVYDUDqrR7QR8J1DCfMqyHUsTq7M3dg
         vBkw==
X-Forwarded-Encrypted: i=1; AJvYcCWZqDjegS2dm4jhYRQr+3MhOd+3COZ4iOGi9sZzdmL6V90+bFvmn9hfIgfg2FPELMwQHGTyaEaG7J8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxVXfR3U/C9kzQtUB4XzCAXlcbazHaiHLJMEIj5/WKpSwIi1SA
	cFu/cmH4CyD2ZX5fhZRwpOiE1BaJErrI4IDwvPK6+L2skE0djtYoylX+raZ4vG0=
X-Gm-Gg: ASbGncvuZzXzMALRURIxYbzL6eIWNXUih+ZINgmwkJmXIXFdUwsd3n8GgVsWtqwB++U
	ile9kc7curLWXdxVLl8JLzMxo3Shgdh8MSJk489n6EKXCVmaFH3KCoUFJXAcmmxrqZDmzqQd0Ik
	4LmzeYQMZzwuD1Zb2A3TZhFkz7WnGRAyVyu/EGPYV6UkOohHzKXjQzUV04C4wtgdafLcoNcuZUC
	GYq53uctp9JOFcAlHsJ81ywouNVIZQIZvoiLLV5u7UWyX3ohIs87e2x8PD/29Fw2RH2RdBn6l4E
	P3EkIPgvoock5cF21vCr6XdlP8A0LInlcpYt+jwhHd1naOBAsyBrOrCggFTiIJ4PCm8KJ9uaP/z
	AcQA4xq/y
X-Google-Smtp-Source: AGHT+IFk07r5vmOiX4NGAdYBw6+Iw/dZo/cfISp9uAw6sMjZP1KqCJ2R5BmF5xNsSIEYN8PoiiH4LA==
X-Received: by 2002:a05:600c:3b04:b0:439:8a62:db42 with SMTP id 5b1f17b1804b1-43c5a6008e6mr8646395e9.8.1741309344252;
        Thu, 06 Mar 2025 17:02:24 -0800 (PST)
Message-ID: <9a66d9e6-80a7-457e-9012-780ed6f09548@citrix.com>
Date: Fri, 7 Mar 2025 01:02:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/vlapic: Drop vlapic->esr_lock
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250303185352.86499-1-andrew.cooper3@citrix.com>
 <20250303185352.86499-3-andrew.cooper3@citrix.com>
 <a3be52ef-77a9-46f3-9f9b-1f4e230d6c29@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a3be52ef-77a9-46f3-9f9b-1f4e230d6c29@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2025 1:56 pm, Jan Beulich wrote:
> On 03.03.2025 19:53, Andrew Cooper wrote:
>> The exact behaviour of LVTERR interrupt generation is implementation
>> specific.
>>
>>  * Newer Intel CPUs generate an interrupt when pending_esr becomes
>>    nonzero.
>>
>>  * Older Intel and all AMD CPUs generate an interrupt when any
>>    individual bit in pending_esr becomes nonzero.
>>
>> Neither vendor documents their behaviour very well.  Xen implements
>> the per-bit behaviour and has done since support was added.
>>
>> Importantly, the per-bit behaviour can be expressed using the atomic
>> operations available in the x86 architecture, whereas the
>> former (interrupt only on pending_esr becoming nonzero) cannot.
>>
>> With vlapic->hw.pending_esr held outside of the main regs page, it's
>> much easier to use atomic operations.
>>
>> Use xchg() in vlapic_reg_write(), and *set_bit() in vlapic_error().
>>
>> The only interesting change is that vlapic_error() now needs to take a
>> single bit only, rather than a mask, but this fine for all current
>> callers and forseable changes.
>>
>> No practical change.
> From a guest perspective that is.
>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> @@ -124,15 +126,12 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>>              if ( (lvterr & APIC_VECTOR_MASK) >= 16 )
>>                   inj = true;
> I wouldn't, btw, mind if you also corrected this indentation screw-up of
> mine along with you doing so ...
>
>>              else
>> -                 errmask |= APIC_ESR_RECVILL;
>> +                set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);
> ... here.

Both fixed.

~Andrew

