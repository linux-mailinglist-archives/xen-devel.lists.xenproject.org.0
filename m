Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5BAB26A79
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 17:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081902.1441859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZYA-0005BE-2L; Thu, 14 Aug 2025 15:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081902.1441859; Thu, 14 Aug 2025 15:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZY9-00059o-Vt; Thu, 14 Aug 2025 15:07:29 +0000
Received: by outflank-mailman (input) for mailman id 1081902;
 Thu, 14 Aug 2025 15:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umZY8-00059i-TT
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 15:07:28 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64772b37-7920-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 17:07:28 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b9e411c820so581158f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 08:07:28 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c70acc7sm23504985e9.25.2025.08.14.08.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:07:26 -0700 (PDT)
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
X-Inumbo-ID: 64772b37-7920-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755184047; x=1755788847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=glQsaVf9scz2VamTIi4C1sfUDYBDnqBkHaUjLqmdzBY=;
        b=j0dI5dDw4PAE7YB6lkmj/hbXHF2kV5705aVTGAISwjs9ACHoQp1YYJQJne2zr5DkHE
         vkmQEdWIb2mEteuTwgDlD88La6ww8R5f1bGHoPX6rRhAcIUlO5DJ5hBC808hbd706T5F
         SAXPKluPc4mhNaeB52drci932z5hfr75yIlxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184047; x=1755788847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glQsaVf9scz2VamTIi4C1sfUDYBDnqBkHaUjLqmdzBY=;
        b=XK3is0GzeEz8gwdzL2Dqeov/vQLuIyaqyfn1qGd3HqghzJlYhbp4CJZeqb+UwV5lKr
         FEw1/d3CFyhyDT2snb30fMU+56A/w4gMmKQXWDW531Coo9ztIVzYZY1rXhtp15KGGKvB
         QaAN9Y3z7OVcbE4JyPJZuJNg56ILW2lgpw/Xwxg52ukfbiQRP/wZSRWjspvJTN55GedY
         ZAVt8McIYk4DdkqRSC+0YpSXZztypz0Gn0YZ7Hx7lQYRF7RdLSlYwzA3pqmjvC5NS+p2
         Z42KnZl/0xjlO0GqxzjZLvLGSEEOgJ8Veu6CMjrMoG9YscK5/h81dmmMw8O8CwgbWSEg
         CfHA==
X-Forwarded-Encrypted: i=1; AJvYcCVWASmLUPNnZcShkzrp82uUaqlm4pLRceatUdEPSlQYEseyYb9BlEMzAQ81eTDwpHRS0BWgpAbiZeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/Uj/2LzBSRmhubfFpP/g7un/H9X6QQAFAc8Xp2fE6Fh20z42V
	KWQqVaBZlPds2CL9dkONOS6R3ThBsJvQ7Zaz8z8OgyAyUN+vl+9GayzXZ9nbg3ZgglC6dX35n7r
	j5BvI
X-Gm-Gg: ASbGncvqG2ZJ+Ugt8AI3TKB4cuZwl+Rbh8Ssba9nnwS8Uf7lwWt1WvCbskhkX1gnX6h
	IsPJ+aih9ojDN7jsTR9qkoWCEfZ7VtT7Uf3c/OZLA+048ENsuLrpFm+CsJdCJBee7dD+F9I+O+q
	ucO5SkTyy+flCu4t6boBxNwZIFaX9xBC/mRRfN9ycSbwqyY5MqoMwyQY/qax73IRBjqOZjEKyWD
	OqYJhMSG7uMGA5bUaHtapn+G8ZCFrFI3pMN4qPaXZfWiAmGh0Lkmu3fLha7eeYgxlK7x5cSmpaP
	IUTu3p5CtfChYMwGcPiw10LJeX4nBMYzt9Wb4Qa1xkMUwgCgBkBX+3E7DF3c913EPK0TPzpzhjd
	ROrdILZ2X9Gvm2C08PjG+sLCu2SiCUMoK6K9QaC+kW2PWTbAPDeYVOvoYHgbjptx2n2BQ
X-Google-Smtp-Source: AGHT+IEWTLw1FTg/+JSj2xzXgox6u+cQyiG5JLZBMUvvp6yJFEuEdu+DdXgBlk5esabg+11kzWu4XA==
X-Received: by 2002:a05:6000:240d:b0:3b5:f93a:bcc with SMTP id ffacd0b85a97d-3ba50d528a2mr2992960f8f.35.1755184047385;
        Thu, 14 Aug 2025 08:07:27 -0700 (PDT)
Message-ID: <12b05941-2246-4f30-bc94-d77ebd915d5c@citrix.com>
Date: Thu, 14 Aug 2025 16:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] x86/traps: Extend struct cpu_user_regs/cpu_info
 with FRED fields
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-15-andrew.cooper3@citrix.com>
 <a16deee1-de3b-4850-852a-f45aeaa982f2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a16deee1-de3b-4850-852a-f45aeaa982f2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 2:12 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> @@ -42,17 +46,76 @@ struct cpu_user_regs
>>       */
>>  
>>      union { uint64_t rip;    uint32_t eip;    uint16_t ip; };
>> -    uint16_t cs, _pad0[1];
>> -    uint8_t  saved_upcall_mask; /* PV (v)rflags.IF == !saved_upcall_mask */
>> -    uint8_t  _pad1[3];
>> +    union {
>> +        struct {
>> +            uint16_t      cs;
>> +            unsigned long :16;
>> +            uint8_t       saved_upcall_mask; /* PV (v)rflags.IF == !saved_upcall_mask */
> Would this better be reproduced ...
>
>> +        };
>> +        unsigned long     csx;
>> +        struct {
>> +            /*
>> +             * Bits 0 thru 31 control ERET{U,S} behaviour, and is state of the
>> +             * interrupted context.
>> +             */
>> +            uint16_t      cs;
>> +            unsigned int  sl:2;      /* Stack Level */
>> +            bool          wfe:1;     /* Wait-for-ENDBRANCH state */
> ... here as well, just like you reproduce "cs"?

saved_upcall_mask is a property of an in-guest IRET frame only.  It is
only produced in create_bounce_frame, and never consumed by Xen.

It needs to exist in this structure so asm-offsets.c can generate a
constant.

Also, be aware that there are new features being planned which rely on FRED.

>
>> +        } fred_cs;
>> +    };
>>      union { uint64_t rflags; uint32_t eflags; uint16_t flags; };
>>      union { uint64_t rsp;    uint32_t esp;    uint16_t sp;    uint8_t spl; };
>> -    uint16_t ss, _pad2[3];
>> +    union {
>> +        uint16_t          ss;
>> +        unsigned long     ssx;
> What use do you foresee for this and "csx"?

That also came from Linux.  I'm using it to zero the control metadata so
ERETU behaves more like IRET.

>
>> +        struct {
>> +            /*
>> +             * Bits 0 thru 31 control ERET{U,S} behaviour, and is state about
>> +             * the event which occured.
>> +             */
>> +            uint16_t      ss;
>> +            bool          sti:1;     /* Was blocked-by-STI, and not cancelled */
>> +            bool          swint:1;   /* Was a SYSCALL/SYSENTER/INT $N */
>> +            bool          nmi:1;     /* Was an NMI. */
>> +            unsigned long :13;
>> +
>> +            /*
>> +             * Bits 32 thru 63 are ignored by ERET{U,S} and are informative
>> +             * only.
>> +             */
>> +            uint8_t       vector;
>> +            unsigned long :8;
>> +            unsigned int  type:4;    /* X86_ET_* */
>> +            unsigned long :4;
>> +            bool          enclave:1; /* Event taken in SGX mode */
>> +            bool          lm:1;      /* Was in Long Mode */
> The bit indicates 64-bit mode aiui, not long mode (without which FRED isn't even
> available).

Oh, yes.  This is something that changed across revisions, and I wrote
this patch to an older spec.

It's %cs.l of the interrupted context, so I probably should just drop the m.

>
>> --- a/xen/arch/x86/include/asm/current.h
>> +++ b/xen/arch/x86/include/asm/current.h
>> @@ -38,6 +38,8 @@ struct vcpu;
>>  
>>  struct cpu_info {
>>      struct cpu_user_regs guest_cpu_user_regs;
>> +    struct fred_info _fred; /* Only used when FRED is active. */
> Any particular need for the leading underscore?

Somewhat, yes.  It's not safe to reference this field, except for
loading MSR_PL0_RSP.

Everyone else should use cpu_regs_fred_info() to get the fred_info,
which has a safety ASSERT().

~Andrew

