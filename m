Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91CA6BDFD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 16:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924175.1327499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tve1b-0004Pa-NF; Fri, 21 Mar 2025 15:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924175.1327499; Fri, 21 Mar 2025 15:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tve1b-0004NH-Jy; Fri, 21 Mar 2025 15:11:07 +0000
Received: by outflank-mailman (input) for mailman id 924175;
 Fri, 21 Mar 2025 15:11:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tcq=WI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tve1Z-0004Gn-VR
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 15:11:06 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b56624bc-0666-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 16:11:05 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so1146997f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 08:11:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9eff79sm2610955f8f.95.2025.03.21.08.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 08:11:03 -0700 (PDT)
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
X-Inumbo-ID: b56624bc-0666-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742569864; x=1743174664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tofR+EzlLBERbXMDgebHl5oSm5e1SaQKVDubItKsMck=;
        b=tg6HBsnW65F4OfHPNuJ19VDrMWJnTNoSn3sSEUMEUgaaT3CjqInAOxqHFFDD16FojX
         S0sBeYrlZQ9qG3JBDip+MAu4CdcF+R8h4sEuQc145Ib5AqAKpcuDrT7GvsH+tCjm6KrQ
         UHhScDeqRu/GZULU5848pxAPVIWScJrwnbgTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569864; x=1743174664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tofR+EzlLBERbXMDgebHl5oSm5e1SaQKVDubItKsMck=;
        b=rBPuZyxLyCsj+AbkdZxgid8OQQiiEKLstLjiw+pPO3aWUVHPIND90RNj/BbRq46hZ3
         SnMinPS+vSAGOoAmjXSjpVq6suCFq/UB5q1VitdQImhtu/lWS864p5/tRYoRZNQnP3IS
         XBrwfW1IvkFX6mIcQg7bmWik2ZmWFwqP1aiJHwEmA3mfwUvKNjSzR2Aa7hNDkiqzeZ+v
         pEZXsxGnCwlEAJzstcEKMKrV3l8dZXLcMUcE9kVAmQifKJ7NRX0JW1lGQwXPlfVL5TFH
         Sgoc7ZuJ14IVdUI0jGmFgMhy5/pPbGa6NPFGYh6HWglheRACYs3mIUdLhzgBEuf2ufgN
         FJmw==
X-Forwarded-Encrypted: i=1; AJvYcCUqa2MYseAktrEIractwuhQlrXNGVVilw2RZYB4gki0DeoijafiV9jyF9BYuc48CZ83SG3jJUMrFZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJJjgp1BvFdE31vm4zbE2jmmMkXGD+nORE9lNzs7eArtbqg4Bx
	t/vlbtcp3OBxfn3yXMX/b9SzfaP3K9+bYzYLDwgiQKD1IlCwDoidxeqsFzeRdCM=
X-Gm-Gg: ASbGncsbrcyXHxJxFkN2xXqJTPHj0vKHPoTYNAr1NArp3DFkWOJmYjHA52bDb9eKQFu
	vSlVdq1Yl92wyHZs8FexPeujXUa2fvHh8ksC6/FdJL5RR9TQeZXW9qU7kWQcj44OeCSMpjGvCxl
	mEGDIBmLzvsH459Y0lDPisHYlCDrMW1/LDJG7IXykDOz8SV8wZc9GDfX0T8zPMytmFo9CcwK0nt
	hqzm6l9RCD2X+yIJooEtw5px1Q9+yQDCo/jTk4aDvMLoWTEjif2MNfeBTUI3OttWFKbXqQlEkBW
	+9TTTF/OTxdIcApBCBOyAA/vjLaybnCp3T/QG3IjUcJtuMZDyXMop6RnJuMvpJEefzqh/cdK9my
	ulcBb0ZiF+A==
X-Google-Smtp-Source: AGHT+IFtz85B20a+gxf2q1l3Dkt+gnZevaCv0a93wZ/JaK9txY7RQYFa+R/2AMboFwN5V2rpnsoJJw==
X-Received: by 2002:a05:6000:4012:b0:391:4674:b10f with SMTP id ffacd0b85a97d-3997f92d312mr3503752f8f.36.1742569863970;
        Fri, 21 Mar 2025 08:11:03 -0700 (PDT)
Message-ID: <eaaf2aef-129a-45ce-b5e7-ae884c2385f3@citrix.com>
Date: Fri, 21 Mar 2025 15:11:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/public: Split the struct cpu_user_regs type
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-8-andrew.cooper3@citrix.com>
 <8edba542-9844-409e-bbf0-5ff1c9287a10@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8edba542-9844-409e-bbf0-5ff1c9287a10@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 12:15 pm, Jan Beulich wrote:
> On 11.03.2025 22:10, Andrew Cooper wrote:
>> In order to support FRED, we're going to have to remove the {ds..gs} fields
>> from struct cpu_user_regs, meaning that it is going to have to become a
>> different type to the structure embedded in vcpu_guest_context_u.
>>
>> struct cpu_user_regs is a name used in common Xen code (i.e. needs to stay
>> using this name), so renaming the public struct to be guest_user_regs in Xen's
>> view only.
>>
>> Introduce a brand hew cpu-user-regs.h, currently containing a duplicate
>> structure.  This removes the need for current.h to include public/xen.h, and
>> highlights a case where the emulator was picking up cpu_user_regs
>> transitively.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>> cpu_user_regs_t and the guest handle don't seem to be used anywhere.  I'm
>> tempted to exclude them from Xen builds.
> I concur. We can always re-expose them should they be needed somewhere.

It's actually a little ugly to do.

#ifdef __XEN__
#undef cpu_user_regs
#else
typedef struct cpu_user_regs cpu_user_regs_t;
DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
#endif

and I don't particularly like it, given the complexity of #ifdef-ary
around it.  Thoughts?

>
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/cpu-user-regs.h
>> @@ -0,0 +1,69 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef X86_CPU_USER_REGS_H
>> +#define X86_CPU_USER_REGS_H
>> +
>> +#define DECL_REG_LOHI(which) union { \
>> +    uint64_t r ## which ## x; \
>> +    uint32_t e ## which ## x; \
>> +    uint16_t which ## x; \
>> +    struct { \
>> +        uint8_t which ## l; \
>> +        uint8_t which ## h; \
>> +    }; \
>> +}
>> +#define DECL_REG_LO8(name) union { \
>> +    uint64_t r ## name; \
>> +    uint32_t e ## name; \
>> +    uint16_t name; \
>> +    uint8_t name ## l; \
>> +}
>> +#define DECL_REG_LO16(name) union { \
>> +    uint64_t r ## name; \
>> +    uint32_t e ## name; \
>> +    uint16_t name; \
>> +}
>> +#define DECL_REG_HI(num) union { \
>> +    uint64_t r ## num; \
>> +    uint32_t r ## num ## d; \
>> +    uint16_t r ## num ## w; \
>> +    uint8_t r ## num ## b; \
>> +}
> Can we try to avoid repeating these here? The #undef-s in the public header are
> to keep external consumers' namespaces reasonably tidy. In Xen, since we don't
> otherwise use identifiers of these names, can't we simply #ifdef-out those
> #undef-s, and then not re-introduce the same (less the two underscores) here?
> Granted we then need to include the public header here, but I think that's a
> fair price to pay to avoid the redundancy.

Breaking the connection between asm/current.h and public/xen.h is very
important IMO.  Right now, the public interface/types/defines are in
every TU, and they absolutely shouldn't be.

Sadly, the compiler isn't happy when including public/xen.h after
asm/current.h, hence the dropping of the underscores.

I did have half a mind to expand them fully.  I find them unintuitive,
but I also didn't think I'd successfully argue that change in.

I'm not terribly fussed how we do this, but I really do want to reduce
the header tangle.

>
>> +struct cpu_user_regs
>> +{
>> +    DECL_REG_HI(15);
>> +    DECL_REG_HI(14);
>> +    DECL_REG_HI(13);
>> +    DECL_REG_HI(12);
>> +    DECL_REG_LO8(bp);
>> +    DECL_REG_LOHI(b);
>> +    DECL_REG_HI(11);
>> +    DECL_REG_HI(10);
>> +    DECL_REG_HI(9);
>> +    DECL_REG_HI(8);
>> +    DECL_REG_LOHI(a);
>> +    DECL_REG_LOHI(c);
>> +    DECL_REG_LOHI(d);
>> +    DECL_REG_LO8(si);
>> +    DECL_REG_LO8(di);
>> +    uint32_t error_code;
>> +    uint32_t entry_vector;
>> +    DECL_REG_LO16(ip);
>> +    uint16_t cs, _pad0[1];
>> +    uint8_t  saved_upcall_mask;
>> +    uint8_t  _pad1[3];
>> +    DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
>> +    DECL_REG_LO8(sp);
>> +    uint16_t ss, _pad2[3];
>> +    uint16_t es, _pad3[3];
>> +    uint16_t ds, _pad4[3];
>> +    uint16_t fs, _pad5[3];
>> +    uint16_t gs, _pad6[3];
> I had to peek ahead at the last patch to figure why you introduce these 4 fields
> (plus their padding) here, just to remove them again. Personally I think it would
> be neater if both were folded; nevertheless I'd like to leave this entirely to
> you.

While both patches are reasonably small, I think it's important for
bisection to keep them separate.  They're both complex in separate ways.

~Andrew

