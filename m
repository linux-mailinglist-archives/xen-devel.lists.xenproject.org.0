Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C4B7A20F9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 16:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603196.940115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9pY-00039D-N7; Fri, 15 Sep 2023 14:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603196.940115; Fri, 15 Sep 2023 14:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9pY-00036g-KM; Fri, 15 Sep 2023 14:30:00 +0000
Received: by outflank-mailman (input) for mailman id 603196;
 Fri, 15 Sep 2023 14:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upey=E7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qh9pX-0002yz-CE
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 14:29:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5860c2ee-53d4-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 16:29:57 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-403012f276dso24117195e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 07:29:57 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p14-20020a1c740e000000b003fe407ca05bsm7709831wmc.37.2023.09.15.07.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 07:29:56 -0700 (PDT)
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
X-Inumbo-ID: 5860c2ee-53d4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694788197; x=1695392997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2xcff1kcxhoz3KcUS9Eu7Vmqb5cn75vy1j5tZzB6S98=;
        b=l3pwbapNl2NQ+ETKlix2NXi6ExyEO29XGnovort2C3mUiy/dvMZd0lmLRvNX/PZRwl
         649Ufni0HaiJdRgwRVX5sZiJabQXwo7PWaFy02UoO/Fu6euho+dDNSfrn7fb5jbsUPAm
         xE99f8KMrld9sKu+TtCSZvgb+Wb6HPRVJNJaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694788197; x=1695392997;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xcff1kcxhoz3KcUS9Eu7Vmqb5cn75vy1j5tZzB6S98=;
        b=S76ZelayDwrIemkQ8DEVViFWAX2kbAmUptjIxho7v5V2nFndMSXFY0xnoJJ5xNw1CX
         hP3xnRa+vIL0aQuqxYIwFEXItyfVNGTIj9a/3o78oV7Ir1oPuscQjk4NxhhCiaq0df38
         RJ8jaBsv9SBCK8ZepT8MDpto6av2rRhER/ZRQ4ySsVvPIrXmCVKgYbxle1Rgom+YBCda
         vp+jmta9J38zVr+wagTcBTvhK5rUCPcAtzFfmlpItAJHpBfcpzpa3sDbqqT6SFDtp8/x
         bdFQuZxQDYzJ2iDOEVV2kHyTn8F1ARocz45RHzF3oGUWhYTqRO+1bRYrvmLpZwvhxuj4
         fUXQ==
X-Gm-Message-State: AOJu0YzCe7/z3O8Wj+ZO2rthycwIfkuT47bjePstuccacQpHOFnffzEn
	GzkUmnRDxot4Ii723pqS5+XGPQ==
X-Google-Smtp-Source: AGHT+IEUFtnp2b6gDLlglWzNcbzFk7OFojOT3v9/f7IOLfsVNqyHECW6lE28HQ3G/VCn7a+ry20PjQ==
X-Received: by 2002:a05:600c:3645:b0:402:ea83:45cf with SMTP id y5-20020a05600c364500b00402ea8345cfmr1909619wmq.2.1694788197138;
        Fri, 15 Sep 2023 07:29:57 -0700 (PDT)
Message-ID: <eacdd0ca-2898-bc50-5982-8620a68a6783@citrix.com>
Date: Fri, 15 Sep 2023 15:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/emul: Add a pending_dbg field to
 x86_emulate_ctxt.retire
Content-Language: en-GB
To: Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-4-andrew.cooper3@citrix.com>
 <e17dd8a7-91d0-fc30-203e-09058ee5e61d@gmail.com>
 <d4073297-4095-20b2-13f2-e1d6e8bd9c17@gmail.com>
In-Reply-To: <d4073297-4095-20b2-13f2-e1d6e8bd9c17@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/09/2023 3:24 pm, Jinoh Kang wrote:
> On 9/15/23 21:20, Jinoh Kang wrote:
>> On 9/13/23 08:21, Andrew Cooper wrote:
>>> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
>>> index 698750267a90..f0e74d23c378 100644
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>>> @@ -588,15 +588,26 @@ struct x86_emulate_ctxt
>>>      /* Canonical opcode (see below) (valid only on X86EMUL_OKAY). */
>>>      unsigned int opcode;
>>>  
>>> -    /* Retirement state, set by the emulator (valid only on X86EMUL_OKAY). */
>>> +    /*
>>> +     * Retirement state, set by the emulator (valid only on X86EMUL_OKAY/DONE).
>>> +     *
>>> +     * TODO: all this state should be input/output from the VMCS PENDING_DBG,
>>> +     * INTERRUPTIBILITY and ACTIVITIY fields.
>>> +     */
>>>      union {
>>> -        uint8_t raw;
>>> +        unsigned long raw;
>> Minor nit: this should be uint64_t for clarity.  Otherwise, it's not at all
>> clear that the raw field covers the entire union, unless you remind myself
>> that Xen does not support 32-bit host.
> you remind yourself*.  What a weird typo to make :-(

For better or worse, this is form preferred by the Xen coding style.

We deleted the 32bit build of the Xen more than a decade ago, and have
been 64bit-only ever since.

~Andrew

