Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9FBA55D13
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 02:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904485.1312367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMS3-0007d1-Nj; Fri, 07 Mar 2025 01:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904485.1312367; Fri, 07 Mar 2025 01:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMS3-0007aR-K3; Fri, 07 Mar 2025 01:24:35 +0000
Received: by outflank-mailman (input) for mailman id 904485;
 Fri, 07 Mar 2025 01:24:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqMS2-0007aL-40
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 01:24:34 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec466ccc-faf2-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 02:24:32 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-390eebcc371so880209f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 17:24:32 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e34fasm3666115f8f.75.2025.03.06.17.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 17:24:31 -0800 (PST)
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
X-Inumbo-ID: ec466ccc-faf2-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741310672; x=1741915472; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hrC+5qkjZzedLS6uTGqubrMg/QHu/h4HScLteiGQcc0=;
        b=Xgdr5pRuvMO/gEhOE63C3caE9wNjs7k8XnkSjxAARFvDPGlC2LuDJmkYiAbue4py5/
         dZuQZViLh5aoQ69X4sBNGClaqzJJMl0tKOOHYPLdKlR0gasdV5E6fqn1GZAY3eHg9OVZ
         sYwidJnYunL17f4xCgCyc1t7EzmZtHlcvxrdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741310672; x=1741915472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrC+5qkjZzedLS6uTGqubrMg/QHu/h4HScLteiGQcc0=;
        b=Ij+ti+RMv95XMbp713NeITjPk3AwOCYWEVNCH6VvJZHPYv/wgvHZy+9nuK6080zoHr
         ZS8F7u0F/Vs301y1xirOI4aN/9EFFU3/qHBqdglMmRtOXmTRvwl2+p8CLbw5XuN5EqQB
         ssUXf2bcGypmtlhrWLGYBSPReUYNsDILzaDfKEwk50gQoTzAi4mI7m+rIs87A/woeJnC
         LUpGQo/ZvyXiE2e2XRkXyxZKIESDikpRcVOLQi23LTWCikZ/4D1ifzzfblmfFYGYh/Wo
         lg2oKBreX/wthM56Qmk7fyRc2v5Fvw3m8E6X1M7SKYlc5pNdr11SIVJxNCGID8REIWTx
         9uMg==
X-Forwarded-Encrypted: i=1; AJvYcCUMJObRAhLaYD0V5WxsrvjJ3FOTN+5KW49mESguG2bDkH7DY4P8qhvmXFN8uCdopec5FJ7RluELSVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwysxbdPMLhfGYIdUL1WNA8vusMXjibk804sqmAUMjN7dx8S8uu
	C2gh9nm8uQsgNDSa/xI1c8XVgSmbukMsaxxjfa6s9bYS46KbyJNyR5WDeTdCtN8=
X-Gm-Gg: ASbGncvZxVHgJOfwgZLuGZvGMWGk+iLXHCiZcR0AqX1S2AQkMZ6BM/1fY+qMlnr6rU5
	wyuHp9VDOIbXiXppDNaxiXE2eWAzjut0dJ6nA1qcDgFPKAk6rtKeoyUD73NibJCuq9++kCqQUYX
	0PD8RI1o/hlw5Z6RiEYfx9xwGAPTdWxRMyD15+5/cqhi+o5fb8j6MrHxNpeJyAq7J4PLAyaj2Y+
	0dNgw1sHB/1c3ptcMbjbr8t6i1u7/SFQLv1u4KC38kars+vWxP8f/StudwrvzPs03cLzm80z9vw
	KF8PAUrp7LvoUojGmd4tLcWPTXKS/dyjJove4Zai1BHQ6P1wfb1VllWkognvkCZoVwREtnbug3g
	ivjxg+0TF
X-Google-Smtp-Source: AGHT+IELvgTHGkSCAJhFmzdMIio+Yt1T1zsAgSvw8Br0zF3Os3M26CfvZRn2s6FwbUQnuxiTbj55DQ==
X-Received: by 2002:a5d:59ae:0:b0:390:f5e3:e833 with SMTP id ffacd0b85a97d-39132d379e9mr827029f8f.23.1741310672057;
        Thu, 06 Mar 2025 17:24:32 -0800 (PST)
Message-ID: <8bc3c894-b3e1-4ca6-83a2-cbfd05456732@citrix.com>
Date: Fri, 7 Mar 2025 01:24:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/IDT: Generate bsp_idt[] at build time
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
 <20250305000247.2772029-4-andrew.cooper3@citrix.com>
 <3d183a5b-008a-4985-bc94-1fb5dd93af7c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3d183a5b-008a-4985-bc94-1fb5dd93af7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 2:09 pm, Jan Beulich wrote:
> On 05.03.2025 01:02, Andrew Cooper wrote:
>> ... rather than dynamically at boot time.  Aside from less runtime overhead,
>> this approach is less fragile than the preexisting autogen stubs mechanism.
>>
>> We can manage this with some linker calculations.  See patch comments for full
>> details.
>>
>> For simplicity, we create a new set of entry stubs here, and clean up the old
>> ones in the subsequent patch.  bsp_idt[] needs to move from .bss to .data.
>>
>> No functional change yet; the boot path still (re)writes bsp_idt[] at this
>> juncture.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> v2:
>>  * Shuffle semicolon position
>>  * Eclair magic comment for multi-include files
>>
>> There's something differnet about LLD vs LD.  Without the ABSOLUTE() in
>> gen-idt.lds.h, LD is fine but LLD puts out symbols in the form:
>>
>>   x86_IDT_entry_0xff_ADDR1|0000000000002fb0|   t  |            NOTYPE|                |     |.text
>>   x86_IDT_entry_0xff_ADDR2|0000000000004020|   a  |            NOTYPE|                |     |*ABS*
>>
>> which causes a slew of errors making symbols for xen-syms:
>>
>>   .xen-syms.0.S:20:8: error: out of range literal value
>>    .long 0x15a0 - (((((((261 >> 8) * 0xffff000000000000) | (261 << 39))) + ((1 << 39) / 2)) + (64 << 30)) + (1 << 30))
>>          ^
>>
>> owing to half the symbols being t rather than a.  Moreover, this is reliable
>> for the full FreeBSD builds, but interminttent on randconfig.  I haven't
>> figured out which other option is having an effect.
>>
>> Forcing them all to absolute works in both toolchains.
> Just to double-check: Making these symbols absolute does not collide with
> the .reloc section generation that we do for xen.efi, does it?

I don't know for sure.  I'd be lying if I said I understood how that
really worked.

But, the boot of a real xen.efi in GitlabCI is happy with the series,
including the recovery selftests.

> That is, the
> absence of relocations for the IDT merely means that we must not use the
> IDT or any of its entries prior to relocating Xen back to its linked
> addresses. Or, if e.g. we fetched an entry's address from the IDT earlier
> on, we'd need to be aware that it's the linked address we fetch, not the
> one matching where we execute.

Today, the IDT is a block of zeroes until we get into __start_xen() and
construct it by hand.

Safe use of the exception handlers also relies on the percpu areas, so
use of the IDT isn't viably moving any earlier.

Even with FRED, I haven't moved it earlier, because there's no point. 
We're only a handful of instructions ahead of being in 32bit mode, where
it would be useless to us.

For EFI boot, we run on the system IDT and are expected to keep it
intact (probably until EBS), so I don't see any point using it earlier
there either.

> If that's a correct understanding of mine
> and also matches your intentions:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.  I'm pretty confident we're not going to be inclined to use it
earlier than __start_xen().

~Andrew

