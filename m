Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043B831812
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 12:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668715.1041107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQBu-0000Qq-Su; Thu, 18 Jan 2024 11:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668715.1041107; Thu, 18 Jan 2024 11:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQBu-0000Nb-PX; Thu, 18 Jan 2024 11:04:10 +0000
Received: by outflank-mailman (input) for mailman id 668715;
 Thu, 18 Jan 2024 11:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bYS5=I4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rQQBs-0000JP-RM
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 11:04:08 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c647d38-b5f1-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 12:04:07 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e86a9fbd9so24247265e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 03:04:07 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ay39-20020a05600c1e2700b0040e92521b24sm1402425wmb.30.2024.01.18.03.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 03:04:06 -0800 (PST)
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
X-Inumbo-ID: 4c647d38-b5f1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705575846; x=1706180646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6UAEzkL/E2Z/k9IIwpRMEXPj2HqhFXpJLGjKeyieYE=;
        b=nohq1jJLScFP0dHFPbKbSbLOwr+GNiwwvLrkKoZmKpw9ABJgqO1LFXKW2kb0H2yXAu
         5ojEemzvfOmYJtvDeIWcT7u1M7tqeNwxIOfDDUtJp9o+PHznOoI5rqqVlpTMJlrOJWqi
         7LlsO0qq+xIXh0DZBRy9PAxIzIg3QeMfFsEzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705575846; x=1706180646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6UAEzkL/E2Z/k9IIwpRMEXPj2HqhFXpJLGjKeyieYE=;
        b=UoRd4x1bbAQ8YouCWQEp6aR7Wf6VyJMIzAz9X32fry8R+Is6CJr/hw5RfbbQzmGNZf
         XnYdlGvNPfmmwIib0zhN6AI/+pjZjBCFEn3EpaJSE8YJUqn8EK+zGjVk1f83ofBQYdY5
         3813QLi1ziVpWToKTWvU/d8G8EqIDaDCfDzwRiMfcQlajM1CwLlAfKjU8i9mFzkL99CD
         NEfkoTTDzl7nx4aUEHo+zeKjvhexmRXLT+4NGSE0wVdpj43wH8qbKa8L5jmjwZInfwGL
         UEOr81aUq4GKKTec6jI15NI3y+qE4LTFa0kkyFYo5PQQO7MF0/T5z1Hlwr5wWxxkht4r
         V3pg==
X-Gm-Message-State: AOJu0YxGwQ2jF+jIlLgjk094uZYgY0bOCj5tvc73Wh7Ma7DMhpXSPfUt
	JtVc36jIstTe/60np1yTXC+U7h1RgPYILXEopNm7f7vkkGDDu0uXJZFPXowM0X4=
X-Google-Smtp-Source: AGHT+IF83d5/JWaml7yU6UMNU/Dz9Xjmux3fVvBV/xVchRyUR8jnHp46wY0tls1hVhN/f47wZx+xew==
X-Received: by 2002:a05:600c:6556:b0:40e:485b:3ae7 with SMTP id dn22-20020a05600c655600b0040e485b3ae7mr342255wmb.27.1705575846371;
        Thu, 18 Jan 2024 03:04:06 -0800 (PST)
Message-ID: <9ea43cac-e1f2-4585-b1e0-a64ac6952df9@citrix.com>
Date: Thu, 18 Jan 2024 11:04:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/PV: avoid indirect call for I/O emulation quirk
 hook
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <28b46611-ff98-45cd-a2b0-ffe36b8f0ccf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <28b46611-ff98-45cd-a2b0-ffe36b8f0ccf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2024 9:37 am, Jan Beulich wrote:
> --- a/xen/arch/x86/ioport_emulate.c
> +++ b/xen/arch/x86/ioport_emulate.c
> @@ -8,11 +8,10 @@
>  #include <xen/sched.h>
>  #include <xen/dmi.h>
>  
> -unsigned int (*__read_mostly ioemul_handle_quirk)(
> -    uint8_t opcode, char *io_emul_stub, struct cpu_user_regs *regs);
> +bool __ro_after_init ioemul_handle_quirk;
>  
> -static unsigned int cf_check ioemul_handle_proliant_quirk(
> -    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs)
> +unsigned int ioemul_handle_proliant_quirk(
> +    uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs)
>  {
>      static const char stub[] = {
>          0x9c,       /*    pushf           */

Something occurred to me.

diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
index 23cba842b22e..70f94febe255 100644
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -13,7 +13,7 @@ bool __ro_after_init ioemul_handle_quirk;
 unsigned int ioemul_handle_proliant_quirk(
     uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs)
 {
-    static const char stub[] = {
+    const char stub[] = {
         0x9c,       /*    pushf           */
         0xfa,       /*    cli             */
         0xee,       /*    out %al, %dx    */

is an improvement, confirmed by bloat-o-meter:

add/remove: 0/1 grow/shrink: 1/0 up/down: 1/-9 (-8)
Function                                     old     new   delta
ioemul_handle_proliant_quirk                  58      59      +1
stub                                           9       -      -9

The reason is that we've got a 9 byte object that's decomposed into two
rip-relative accesses.  i.e. we've got more pointer than data in this case.

But this adjustment seems to tickle a GCC bug.  With that change in
place, GCC emits:

<ioemul_handle_proliant_quirk>:
       48 83 ec 10             sub    $0x10,%rsp
       ...
       48 83 c4 10             add    $0x10,%rsp
       c3                      retq

i.e. we get a stack frame (space at least, no initialisation) despite
the object having been converted entirely to instruction immediates.

Or in other words, there's a further 12 byte saving available when GCC
can be persuaded to not even emit the stack frame.

What is even more weird is that I see this GCC-10, and a build of gcc
master from last week, but not when I try to reproduce in
https://godbolt.org/z/PnachbznW so there's probably some other setting
used by Xen which tickles this bug.

~Andrew

