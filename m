Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FBCB5F23
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 13:52:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184037.1506583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTg9O-000452-Ot; Thu, 11 Dec 2025 12:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184037.1506583; Thu, 11 Dec 2025 12:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTg9O-00043b-ME; Thu, 11 Dec 2025 12:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1184037;
 Thu, 11 Dec 2025 12:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhd1=6R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTg9N-00043T-1r
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 12:52:05 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3084ef9a-d690-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 13:52:03 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-64951939e1eso87643a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 04:52:02 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa2e6dc1sm261121066b.17.2025.12.11.04.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 04:52:01 -0800 (PST)
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
X-Inumbo-ID: 3084ef9a-d690-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765457522; x=1766062322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjHKG9zHoHi2T4haNYd1lNI7CXkznaRBQj6DUEU14rQ=;
        b=SiR60E7m3EIdK0ibBl95mscqPeSmeU2giQ34N/sIcNI/RnMw9BpXSe17qREe1DXxQj
         LGRG2+TcVyOzBRZrkRvbzZvU+UkKTqzjYd/unWSmxcWaZHOWXbV++93cl8ySwc3MYr1X
         melgHdfkqNI7HPPeg+DA4YIc7RtjRC04zqXWZoelZDLyvdfPtk3SDt2aZSYVIP0/+LOq
         5ayI1Cat/c/AZbM5WjQHPro7eKs8LZHb0glbcaB+9hPpUVrpNXJPW1ewA+FTmwDxcetC
         V4WcWmyYtfqj+8ltHozHmxCP17EvzRDfo3P2X6SMjEdMfV56Wt/69O5lJHq6daqY/Xj7
         A8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457522; x=1766062322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjHKG9zHoHi2T4haNYd1lNI7CXkznaRBQj6DUEU14rQ=;
        b=B/sKamnN2DEoETENg4ix4sb0rRieA6oSk6Cyzvzb8TynvM03qlvdJ6LL4MIReU6zsS
         PvkH9uoK5XiLmovMXVUvrzCcVnvfXQ0PiQr4wnDfAe36TcHjlA/hNyTCMrqg2b+VGiyp
         PeO6pkR9XwOBmv/GVjE/dRxyq4jRp5HQrT+EnVfYyysNNpNsOagtGUxU98fTpBiFx8Ey
         L6+xUlwBGnlcdHerCkaOy2im9SkdKwWCSRC7WS32rPyLI0mTuBGNUD0yr6dMX2UkFltt
         Cy3euloHAG5kloaeiRE6EwOtXxedlGyZHeZhKYP+kSmJY9lJ0NalhpZwVaQmIh1Ib0v9
         Zhqg==
X-Forwarded-Encrypted: i=1; AJvYcCVyZIzGBTMb+YYiLSNQWBC55Epys6ZncLPdNCvaPoHi/6ISq3AsnnQgYC3ui9jRXobW7ktnRzzxxyU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXez+uwcalsZBprsabTUO87Kswjdm4xf8hATwf73Wpxb2cNwms
	M3PoRQGVeCzRO2It66DMg483N+V9Wm8kV8VB+mAWYTNI59BkVnZFMepV
X-Gm-Gg: AY/fxX7HHRijns+MlYD8cCFSP3GMvxR2zOMMvLNLu3zIbF7PVvvOBP2zNTWbsmjcOcQ
	U12sJWqYcG40W+9KPGfU9rV4kxvzSO/fYdNGw5bcwngD5lthKoNDRsCIVAeHpsHrZdC027gyKWP
	iW9Hq264DQl8pbJpCfW2pff13hN2cZBd8SoqcNWbyI3H0/Fn5fdHr+9gHNfp8KuvizG9KmIc9PJ
	art5Z+TcMdQ5x07F1jPtLPYHMk66cMAEu52+uHUcrINU96Rtmm0ZOFaT6RdiVZ4ejzzeQ3J8WCL
	BWHtk9lV4kTgQzUnlYWnUmi13xgxNV5HzWByPHY6f6UvIvvadJECmTVUN9+cAuiL9V+ChQPuWWb
	nelASmWFVD1QZ6MqQtph/dzPGTY4/gD3PuOYnSRUpalIx74YTxTqiXD0pj8oUNODdSX/Fj7RFG2
	GxxW92CmRf49QRnAIW7pF2pXWpQFFxpIXheSuKiUKav3bxX0NsXbXK/WsFAgLP
X-Google-Smtp-Source: AGHT+IH4Qx1hKOzoBZXyN5X3aBiQyqgoGQc2gf6Ni8y5zg8VdZmwAJ7TaV6EO1Ec0cVTzXzPMiRM2Q==
X-Received: by 2002:a17:907:75e1:b0:b7d:11ae:4006 with SMTP id a640c23a62f3a-b7d11ae4373mr20001966b.52.1765457521866;
        Thu, 11 Dec 2025 04:52:01 -0800 (PST)
Message-ID: <60e200ad-96d3-4384-b9a6-458256f87256@gmail.com>
Date: Thu, 11 Dec 2025 13:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <f4e4dc9beef4618ffaabe1c6caec3e10cf78fd5d.1764582112.git.oleksii.kurochko@gmail.com>
 <c3d2a4c4-f591-4bff-b978-18b8c09cf512@suse.com>
 <c1ca8efb-3e17-45e2-ba90-a6f49616bb51@gmail.com>
 <2c84660b-4333-42f9-b178-aab72be9a40d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2c84660b-4333-42f9-b178-aab72be9a40d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/11/25 12:02 PM, Jan Beulich wrote:
> On 11.12.2025 11:29, Oleksii Kurochko wrote:
>> On 12/8/25 4:05 PM, Jan Beulich wrote:
>>> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/vsbi/vsbi-legacy-extension.c
>>>> @@ -0,0 +1,37 @@
>>>> +
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#include <xen/lib.h>
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#include <asm/processor.h>
>>>> +#include <asm/vsbi.h>
>>>> +
>>>> +static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>>>> +                                     unsigned long fid,
>>>> +                                     struct cpu_user_regs *regs)
>>>> +{
>>>> +    int ret = 0;
>>>> +
>>>> +    switch ( eid )
>>>> +    {
>>>> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
>>>> +        printk("%c", (char)regs->a0);
>>> This is guest output, so shouldn't use plain printk().
>> I think that I don't know what should be used instead. Could you suggest me something
>> or point to the code in other arch-s?
>>
>> Or do you mean that guest_printk() should be used?
> No direct replacement will do what you want, as they all prefix something to the
> string passed (which isn't what you want). You may need to buffer characters and
> emit them in batches (full lines unless overly long). For x86 see hvm_print_line(),
> but I think Arm also has something like this.

I don’t recall anything like that for ARM. The only thing related to character
buffering that I remember is in vpl011_write_data_xen()
(https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/vpl011.c#L76), but it
does not use the buf declared in struct domain_console. Instead, it provides a
separate structure for vpl011:
     struct vpl011_xen_backend {
         char in[SBSA_UART_FIFO_SIZE];
         char out[SBSA_UART_OUT_BUF_SIZE];
         XENCONS_RING_IDX in_cons, in_prod;
         XENCONS_RING_IDX out_prod;
     };

I don’t see that ARM uses struct domain_console.

By the way, I can’t find a counterpart of hvm_print_line() for reading a character(s).
Is domain_console->buf intended to be used only for writing characters?


>
>>>> +    default:
>>>> +        panic("%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
>>>> +              __func__, fid, eid);
>>> Please don't. domain_crash() may be okay to use here, but crashing the hypervisor
>>> because of unexpected guest input isn't okay.
>> |domain_crash()| is better. I also considered just returning|SBI_ERR_NOT_SUPPORTED|,
>> but it wasn’t too convenient for debugging which FID/EID the guest was called,
>> so I started using|panic()| instead.
> FTAOD - domain_crash() is acceptable here while things are still under development.
> It shouldn't stay like this in the end though: Guests should not be punished like
> this for something Xen hasn't implemented.

Agree, I will create a task in my Xen's repo to not forget to drop panic()/domain_crash().

~ Oleksii


