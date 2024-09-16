Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C781797A09D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 13:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799447.1209439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqANa-0002Zj-4e; Mon, 16 Sep 2024 11:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799447.1209439; Mon, 16 Sep 2024 11:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqANa-0002XG-1W; Mon, 16 Sep 2024 11:58:54 +0000
Received: by outflank-mailman (input) for mailman id 799447;
 Mon, 16 Sep 2024 11:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sqANY-0002Vq-Py
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 11:58:52 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a4c8641-7423-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 13:58:51 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so4835629a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 04:58:51 -0700 (PDT)
Received: from [10.9.6.216] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f4421sm305341366b.69.2024.09.16.04.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 04:58:50 -0700 (PDT)
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
X-Inumbo-ID: 0a4c8641-7423-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726487931; x=1727092731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oeud/Ps0+F6xozcQ6OcNIrR1NOVKe3fOB7SWo5CVx+c=;
        b=EecjHx2Yyn+eGgD1JV1LIaEaf4oCNJuVcLobWLBy1q3Iq0EE7Xy1qnwOaSrf8T8FRy
         k66IXDqnH72HVN8QHQCNatYV28esflyQs5wLiQKOBc+X3qZF7KYY02H2qQZ2geiqDurp
         uG1Vol8pqVoKTXJIugN17aRKbDFSSm8tTCwh11ljFGAijSKQFl21pL6BZviGC7Q/sE4p
         YotGMlCYYe1ZEOxxeA50WjMhPERg0RtxB4TbHd4ercDteaVyKr7rc5lCRw6NAR0eLJEp
         G7BMFYrUUrZN7gGWXtSrBJ8LKl8s/LeZIRxRmgw5pj6Xzz0J1swDxcwbPOsqEMvT0b4l
         BmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726487931; x=1727092731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oeud/Ps0+F6xozcQ6OcNIrR1NOVKe3fOB7SWo5CVx+c=;
        b=gUE/24Rq8+OuIkttCBhNIcnAN2W23EAuARj0vjfVtD2yWfNUHO2kvcP9SKfd0Y9A8/
         TTDiwQmTbZFgbTeRdlvdjXYtQhrZSv4/nNLsZJvTRXyyPDzHZdg5uhqW0sIgvIxrj2At
         /SXiQK6G9rStjDOJZ8O8SiPdP5mIR2WixYyS45MM0vNs02QH8NN9VmI1TSWevdyFhqH2
         MdIVoFBHRl1GE3RSycUW0azqf0r+r/DyXmy7lgl+6GGfhbeEq6ImEsVU3u1pcSTOtjjn
         hwVcAkS6vcSGsgGzMQTTwccwjnYxA8/Tx2L6fYtYvylkWQ0FPVZ4X61yGyxzmUx4PV6k
         WAnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgk8Tk+AlPYGVIf4H0zmIL2ctcZH2gzdiwa/HNjCwifibIohgv6VbSoL+Sves8FevM7hZNE1X3DJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJtaiivLTIZUpWcx7OQv7mJ5YilFOtEDjsETkZ33Hhey7k6Zp9
	oEPD2itPHIAZOLo/GWN4aHlhpTHHlY3YCHpodu7G1x7IXBoTTSDjxpV6uouyCA==
X-Google-Smtp-Source: AGHT+IG+JUbQR2F7NECA8pezZTEzZ25Gv5hLjCaipkMhX2h8zfZImVFiQgt93UoUoxm6mrN84cxBVQ==
X-Received: by 2002:a17:907:3e92:b0:a90:344a:7db6 with SMTP id a640c23a62f3a-a90344b25e1mr1550843366b.62.1726487931050;
        Mon, 16 Sep 2024 04:58:51 -0700 (PDT)
Message-ID: <be9cbe77-9bde-4766-9866-b69c667a76e4@suse.com>
Date: Mon, 16 Sep 2024 13:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Refactor BIOS/PVH start
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-3-frediano.ziglio@cloud.com>
 <cb1e0f12-57ee-41a8-acc1-0db36ed14c4c@suse.com>
 <CACHz=ZjTzg8X_oxgb67Br+pP-2QKM4m04te9LXAt4QKdWUqzaA@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CACHz=ZjTzg8X_oxgb67Br+pP-2QKM4m04te9LXAt4QKdWUqzaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 10:02, Frediano Ziglio wrote:
> On Sun, Sep 15, 2024 at 7:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.09.2024 18:16, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/boot/head.S
>>> +++ b/xen/arch/x86/boot/head.S
>>> @@ -25,6 +25,9 @@
>>>  #define MB2_HT(name)      (MULTIBOOT2_HEADER_TAG_##name)
>>>  #define MB2_TT(name)      (MULTIBOOT2_TAG_TYPE_##name)
>>>
>>> +#define BOOT_TYPE_BIOS 1
>>> +#define BOOT_TYPE_PVH 2
>>
>> Did you consider using 0 and 1, to be able to use XOR on the BIOS
>> path and TEST for checking?
>>
> 
> Not clear what you are trying to achieve. Fewer bytes using the XOR? I
> think the TEST in this case is only reducing readability, it's an
> enumeration.

Except that in practice we don't really need an enum here; a boolean
would suffice.

> If you are concerns about code size I would use an 8 bit register (I
> would say DL) and use EBP register to temporary save EAX, 8 bit
> registers have usually tiny instructions, MOV has same size as XOR you
> mentioned not loosing any readability or forcing to change values.

No, it's not code size alone. It's larger code size for no good reason.
Using 8-bit ops is an option when you're truly code size constrained,
yet that's not the case here. Hence my take is - use the cheapest insns
possible.

>>> +        cld
>>
>> So you fold the STDs but not the STIs, despite that not even having
>> been first on the PVH path. This decision wants explaining in the
>> description, even if just briefly.
> 
> Just in case, I disable interrupts ASAP. Not that this should change
> much the result.
> Would you prefer to fold it too?

That or explain the difference.

> By "description" do you mean having an additional comment in the code
> or something in the commit message?

Sorry, I use "description" as a common synonym for "commit message".

>>> @@ -433,14 +451,9 @@ __pvh_start:
>>>          /* Set up stack. */
>>>          lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
>>>
>>> -        call    initialise_bss
>>
>> I'm little puzzled: The previous patch moved it "as early as possible"
>> just for it to be moved to a later point again here?
>>
> 
> The rationale is being able to use C, for that you need a stack,
> correct segments and BSS.
> Are you suggesting any change?

I'm trying to understand the sum effect of both changes, which appear
to be moving in opposite direction.

Jan

