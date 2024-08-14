Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5818951B26
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 14:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777136.1187323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDRj-0006Zv-KN; Wed, 14 Aug 2024 12:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777136.1187323; Wed, 14 Aug 2024 12:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDRj-0006Xe-Gj; Wed, 14 Aug 2024 12:49:47 +0000
Received: by outflank-mailman (input) for mailman id 777136;
 Wed, 14 Aug 2024 12:49:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2uER=PN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seDRh-0006XY-Gb
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 12:49:45 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad8181ae-5a3b-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 14:49:43 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so10797457e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 05:49:43 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411af30sm168575866b.131.2024.08.14.05.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 05:49:42 -0700 (PDT)
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
X-Inumbo-ID: ad8181ae-5a3b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723639783; x=1724244583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ihh9xfJPtNhFhVgEd6wT1qY+qAbVQWArqaQag1gA9g=;
        b=KBKPXjk/gPRgmu1ppBo7w+Xd/vw9cJKsoZuSz/W+Zn21v0cvFrvhfRr1DR+1KKtuJq
         GFBC7Y0d7F7Rs5RB/0uiiTcV5uo4vkRP5a4hbf1556dy9aBYvG3FGW3l1dQrG3gDwNwb
         MmjN8VMAmMi89GbJZwh4hJz+S2oR+FGfCI1yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723639783; x=1724244583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ihh9xfJPtNhFhVgEd6wT1qY+qAbVQWArqaQag1gA9g=;
        b=epotqNZQLDUaQRSCGVJwhzvbZZjlXZ6UBJidjwRfrHqFJ8GPCbGfKZizzr9c9+3jnV
         G7ta5Wj6TYJjKpHVSYgkPjTLLrN3GTkLf7whjp1msDqV+CsKr+Wv8d5/+5TVTN5V6VT7
         gD4ltGmcn+lHMo9A+4JoPc6d5ZDmRBCqrkFdXfQzSNBa7+XrOrLu0L0cSKF+hb1aO3Fk
         /7H5VrjucV+Ar5E91FXObdT2jpvr7rsqyynVlL0E98ENdWIRXP5EccK9Mj+IHQ0mv918
         OYEDyDlHMLse3VEtLV7TEUJ3qVYyIPBxoxfuGMv8ScsoMQHk0gJNBXBplG8+7WJb4CFQ
         08aA==
X-Forwarded-Encrypted: i=1; AJvYcCWccd73H4/t1W5OfuvdKHS5zIaGxTFHqtMIyBo+LqFxROW0W8VWPaWwVrU1esII5XmrIvv2JZACAbqlzB6C5agfNJ9ijJiwkjvzAc72KgI=
X-Gm-Message-State: AOJu0YzgHDs0Vr8HIEKogpCBCi3hIMt//K5yrAmtA8uJ2Oy8WS+HsKr7
	oxcahZu9pNg08dkeThEs+TElpyio0Heg4Tu0SjvnbSbPHJt6ApHQdn4me5cB/Ug=
X-Google-Smtp-Source: AGHT+IGzNqm67ZjgSW6Z8Ai9vIW9UaZkOT+hZnU3FyM73+FBo6tPy9wdv+xNSDySJZaU++dp6ziaMQ==
X-Received: by 2002:a05:6512:3f24:b0:52e:9808:3f48 with SMTP id 2adb3069b0e04-532eda7a549mr2139574e87.21.1723639782460;
        Wed, 14 Aug 2024 05:49:42 -0700 (PDT)
Message-ID: <3cc3f16b-bdc2-45e7-9a6b-fd6270e952c2@citrix.com>
Date: Wed, 14 Aug 2024 13:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
 <a7d15429-ce49-43b1-9bbd-7b0129094388@citrix.com>
 <e0081fc2-c631-45a0-a847-edc8dcc3988e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e0081fc2-c631-45a0-a847-edc8dcc3988e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2024 3:05 pm, Jan Beulich wrote:
> On 12.08.2024 15:04, Andrew Cooper wrote:
>> On 05/08/2024 2:26 pm, Jan Beulich wrote:
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -839,7 +839,8 @@ protmode_load_seg(
>>>          case x86_seg_tr:
>>>              goto raise_exn;
>>>          }
>>> -        if ( !_amd_like(cp) || vcpu_has_nscb() || !ops->read_segment ||
>>> +        if ( seg == x86_seg_none || !_amd_like(cp) || vcpu_has_nscb() ||
>>> +             !ops->read_segment ||
>>>               ops->read_segment(seg, sreg, ctxt) != X86EMUL_OKAY )
>>>              memset(sreg, 0, sizeof(*sreg));
>>>          else
>> While this fixes the crash, I'm not sure it will behave correctly for
>> VERR/VERW.
>>
>> protmode_load_seg() is unconditionally X86EMUL_OKAY for a NULL selector,
>> and VERW checks for type != 0x8 which an empty attr will pass.
> That's past an sreg.s check, which will have failed (for sreg coming back
> all clear).

Oh, so it is.

Any chance I could talk you into folding this hunk in too?

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c
b/xen/arch/x86/x86_emulate/x86_emulate.c
index 902538267051..d4d02c3e2eb3 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2852,7 +2852,7 @@ x86_emulate(
                                             &sreg, ctxt, ops) )
             {
             case X86EMUL_OKAY:
-                if ( sreg.s &&
+                if ( sreg.s /* Excludes NULL selector too */ &&
                      ((modrm_reg & 1) ? ((sreg.type & 0xa) == 0x2)
                                       : ((sreg.type & 0xa) != 0x8)) )
                     _regs.eflags |= X86_EFLAGS_ZF;


because it is relevant to judging whether the subsequent logic is
correct or not.

>
> Also if there was a concern here, it would be orthogonal to the adding of
> the seg_none check: It would then have been similarly an issue for all
> possibilities of taking the memset() path.
>
>> Interestingly, both Intel and AMD state that the NULL selector is
>> neither readable nor writeable.
> Which makes sense, doesn't it? A nul selector is really more like a
> system segment in this regard (for VERR/VERW).

In the 32bit days, yes, the NULL selector was entirely unusable, but
that changed in 64bit.

So IMO it really depends on whether VERR/VERW means "can I use this
selector for $X", or "what does the GDT/LDT say about $X".

AMD say "Verifies whether a code or data segment specified by the
segment selector in the 16-bit register or memory operand is readable
from the current privilege level."

Intel say "Verifies whether the code or data segment specified with the
source operand is readable (VERR) or writable[sic] (VERW) from the
current privilege level (CPL)."

So that's clearly the former meaning rather than the latter meaning.

Nevertheless, AMD clearly decided it wasn't worth changing the behaviour
of the instruction in a 64bit mode, probably for the same reason that
Intel reused VERW for scrubbing; that no-one had really bought into
x86's segmented memory model since the 386 replaced the 286.

I just found it odd, that was all.

>
>> Also, looking at the emulator logic, we're missing the DPL vs
>> CPL/RPL/Conforming checks.
> There's surely nothing "conforming" for a nul selector. Hence perhaps you
> refer to something entirely unrelated?

Sorry, yes.  I think this is a general bug in how we emulate VERW/VERR,
unrelated to this specific OSS-fuzz report.

~Andrew

