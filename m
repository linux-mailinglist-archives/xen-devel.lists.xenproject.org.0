Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68817A0CA8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 20:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602628.939308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgqyj-0006xT-CM; Thu, 14 Sep 2023 18:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602628.939308; Thu, 14 Sep 2023 18:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgqyj-0006uz-9O; Thu, 14 Sep 2023 18:22:13 +0000
Received: by outflank-mailman (input) for mailman id 602628;
 Thu, 14 Sep 2023 18:22:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgqyh-0006uq-Ru
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 18:22:11 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e022272-532b-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 20:22:09 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-402cc6b8bedso14586185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 11:22:09 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c280700b003fed630f560sm2607989wmb.36.2023.09.14.11.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 11:22:08 -0700 (PDT)
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
X-Inumbo-ID: 9e022272-532b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694715729; x=1695320529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FllqSI5+xIUVUowtc5PxyKDUO8P+Ic0Lz0FkQ0j7WnU=;
        b=aV53yhGfTrYwA6ZY37Xm4j1aW0RZO7PX8oLvNOUUwOAks2XdBUg8K1brQY9Z2caYtf
         cCb/K3EI1ueK80rrkweEtxNXfdj8EGIyQCa8q5Ju7BPBBQu0KVwK/7h7fAJvo9LZAO5Z
         z8Fsrq2VOyZi6pt0hgBkY7p28A8J6g3qY7X6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694715729; x=1695320529;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FllqSI5+xIUVUowtc5PxyKDUO8P+Ic0Lz0FkQ0j7WnU=;
        b=SEDFoPObkyB5uIP/TzeVGxmW2Iv1kzFQ+c0/Xsj8K4s4ICwnM585LzEvgo4iC2KVy3
         FrchwY1lIIjOSrPRaRQqT/SZ3H1F3fMhJCJkpn+mvkWGATf8tjVxsT4BesHuEMhTOSaq
         qTZqGUzR+UrBw6FylSiel2V6ivF1+O4opUsd8uDkpEoSR+i3I1aMje1Xkq+8LF8ic8on
         iITXwPA8HwNEWkfbeyW1UMPjFCOYAJplOWgNgfUAJF8CnT9xkDHor2GT+xo52BRbHDIz
         EHVNQbqEq0H96qDkuBzKR2l5WRNBMWYVZObMNsCkL55vQTDqe3Y2irVDyKui9KRENDbu
         1skw==
X-Gm-Message-State: AOJu0YydqeqvjPjdyJE/zVT3BVGs1EyUNiY9tRQVymicYJ2TnhYQeQUZ
	IyW6uZfcVdXDwk2335KSZXJvXw==
X-Google-Smtp-Source: AGHT+IHkDkbjDiyKuf+xCnhRLgZ4z3TV/HnKjxMMvziNUx8wrMHH0mm3peNhamHB+sjZ+JVZolfpJA==
X-Received: by 2002:a05:600c:219:b0:3fb:e189:3532 with SMTP id 25-20020a05600c021900b003fbe1893532mr5612218wmi.20.1694715729072;
        Thu, 14 Sep 2023 11:22:09 -0700 (PDT)
Message-ID: <b884335b-0d91-922e-5e83-2c0cedbba8f5@citrix.com>
Date: Thu, 14 Sep 2023 19:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/emul: Add a pending_dbg field to
 x86_emulate_ctxt.retire
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-4-andrew.cooper3@citrix.com>
 <1e71b915-bec5-2430-3304-f6f46842359d@suse.com>
In-Reply-To: <1e71b915-bec5-2430-3304-f6f46842359d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 4:04 pm, Jan Beulich wrote:
> On 13.09.2023 01:21, Andrew Cooper wrote:
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -8379,7 +8379,10 @@ x86_emulate(
>>      if ( !mode_64bit() )
>>          _regs.r(ip) = (uint32_t)_regs.r(ip);
>>  
>> -    /* Should a singlestep #DB be raised? */
>> +    if ( singlestep )
>> +        ctxt->retire.pending_dbg |= X86_DR6_BS;
> We set "singlestep" about first thing in the function. Is it really correct
> to latch that into pending_dbg without regard to rc? (Perhaps yes, seeing
> the comment next to the field declaration.)

Honestly, without seeing some real RTL, I'm not sure.

The thing that is definitely buggy in this retire logic is saying "don't
set singlestep if MovSS is pending".  The correct behaviour is to set
both PENDING_DBG.BS and INTERRUPTIBILITY.MOVSS, the latter of which
causes #DB to be skipped on this instruction boundary.

That's why we get the XSA-260 behaviour - when the SYSCALL/INT/etc
completes and we hit the subsequent instruction boundary, PENDING_DBG
still has values latched in it.

With the DONE path being removed, and with the plan to wire in the VMCS
register for emulations that occur when something is already pending,
then it probably does want to be restricted back to the OKAY case.

e.g. We shouldn't latch BS in EXCEPTION Case, or we'd create more
XSA-260-like behaviour.

I'll adjust in light of this.

~Andrew

