Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B5CD1B4D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 21:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191087.1511180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWgiO-00034S-4M; Fri, 19 Dec 2025 20:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191087.1511180; Fri, 19 Dec 2025 20:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWgiO-00031L-0s; Fri, 19 Dec 2025 20:04:40 +0000
Received: by outflank-mailman (input) for mailman id 1191087;
 Fri, 19 Dec 2025 20:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWgiL-00031F-Mq
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 20:04:37 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0d60e7f-dd15-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 21:04:35 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so3515198a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 12:04:35 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f86sm305671666b.17.2025.12.19.12.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 12:04:34 -0800 (PST)
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
X-Inumbo-ID: f0d60e7f-dd15-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766174675; x=1766779475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYW+bBsR1n39OCWKbHPKkqUI5UNiMDXmK2/vyB4Gs8s=;
        b=ADevKGgnZ54Np0dL7bgJ1M+tDE1jLTsrQ+RzrW7RuFLgh9FpbCfppBaF1n55/BrgGc
         fH957FkgYyflOj9Rof4WHIanfuaDJ3I2VtOSZTF0Ng5j6Ej7Hh6g0llZafRzX+QAtQvG
         vFQIvyC2fQrdT7WY4DjpLOvl7vYln9OGVz6nPcMATAlDzMpqGs8hOtGBgWQorD0lJAc6
         TB+4J+LAhUozgWRenxHakaHltX3fL/+oeAyiMdlVxfbdrPtFWw0SmqTs/+twdmcaj9iY
         eR7q9xwmTicHH/FxJptNXKku7IDGeUiIp8AY+rsNU98QYYJ3Gg6CsJuuX4cdqATeYOn5
         KiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766174675; x=1766779475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYW+bBsR1n39OCWKbHPKkqUI5UNiMDXmK2/vyB4Gs8s=;
        b=t8G3rhzjrx5Go2XKMvQeqYstO+noJr7ukT3OkDjCze6VnrxN5bJmcQKGqRJ0yW3dpF
         LmN2H+I+Kz2RJqlbAkcUOcvuxuZJ4laGifIg7Pi6LKz91DeWe78p1eY1Xq1VrVZF+C6W
         dobwYDoyJ88bI/ykQ97iKpz6VyDwjpCD2mhuiOuqw0htS29I2fgSie8Wzu9bbnLELaDZ
         TP+OHud80jsS7/I58lgc6IJajcx6YRqHRmBRbYcgcrFKAkQVVM2ubmagRrdAwZbMzDGv
         RDjOVWJOdAqLRevtieUk1SoS9FL9tpxQJNAK0W1dsNfSgjr3H8rMKC7so7YeD7XIlag0
         TEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcMdgKeflSF28oHWJpiDBKqRWqAsptei37lYW8IsAXzn4UVPx07Hy9tSBk2yUN7kwt+w7O1DUXaD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywjj6oNR1rNoVdeHhgl0YkHkw9gLieldteOQM3e6iNU8E0/Mchi
	OzwPPbpPVOoMyDQ02TZci4mVXZqo+x/GQtDCJF18WGnccP+fM9s2QnkU
X-Gm-Gg: AY/fxX55KG5QRmvRYqd/71ManbmGYPqBZM6sgBYMp/mc7kp6rtY7oUdaWD1bfVx0pNn
	gstyFtG4+1PqrJz+ZZNnO6i4SXeMootMeyFeAIQJZCmLExXyWcfWKLZ4inRwacSxk2+TkVHRLRW
	kxhw8x1XPzyknlCs7JWE/8bsfqS20LWk2gLLmcSDrqVpqvIb/GAMTaZDKz/82DT8OyE/umXX/Dl
	iWfpSrYc4+UPWDM8GfZ8ee3kHpNMDVuHSYCeiGZFIRNcGjY3QOatrJgUkYQoywUhd0PUrvwUv1Z
	PGdGeo1KslpNdT/E3Nh7McHj9vyG//X1gFlN+bsdjjUiR7qmoU53EPNQS8AD1zzI7rVtN2CR95w
	t3E7CevTZv9G3XLMvbK6YNU52NhbKa5dH2weZign55SqTs3lBU2gL+dgIacDvY2CFk3kZJjIwpJ
	HHiHpuiPJn8fo3MBV0XKdD00aKWDYHPuwk4QClOuVLloyNtLn7CmN+yeBfDmtUfeAV
X-Google-Smtp-Source: AGHT+IE6da0/jNBD8ZZsMrHwNXWArM2Wk1tisBL0gYcaqxT3ipIXDUBKme5m0H4LspeiW4uH1UKv+w==
X-Received: by 2002:a17:907:c994:b0:b80:40d2:9652 with SMTP id a640c23a62f3a-b8040d296a2mr144864266b.65.1766174674572;
        Fri, 19 Dec 2025 12:04:34 -0800 (PST)
Message-ID: <dddbd311-99a2-44b1-926e-f3859ff936dc@gmail.com>
Date: Fri, 19 Dec 2025 21:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
 <df7a7e94fba79265138d6cc8d23b1f6b958f5bd5.1765888425.git.oleksii.kurochko@gmail.com>
 <08105722-0920-462a-aeba-a36f8044a5dc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <08105722-0920-462a-aeba-a36f8044a5dc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/18/25 3:20 PM, Jan Beulich wrote:
> On 17.12.2025 17:54, Oleksii Kurochko wrote:
>> This commit adds support for legacy SBI extensions (version 0.1) in Xen
>> for guest domains.
>>
>> The changes include:
>> 1. Define all legacy SBI extension IDs (0x0 to 0x8) for better clarity and
>>     completeness.
>> 2. Implement handling of legacy SBI extensions, starting with support for
>>     SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR.
> I can't spot any actual support for GETCHAR.
>
>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/legacy-extension.c
>> @@ -0,0 +1,65 @@
>> +
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/console.h>
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/vsbi.h>
>> +
>> +static void vsbi_print_line(char c)
> Misleading function name? The parameter doesn't fit the name, and ...

It was called only because of ...

>
>> +{
>> +    struct domain *cd = current->domain;
> I guess you copied this code from somewhere, but a variable of this type and
> contents wants to be named "currd".
>
>> +    struct domain_console *cons = cd->console;
>> +
>> +    if ( !is_console_printable(c) )
>> +        return;
>> +
>> +    spin_lock(&cons->lock);
>> +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
>> +    if ( c != '\n' )
>> +        cons->buf[cons->idx++] = c;
>> +    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
>> +    {
>> +        cons->buf[cons->idx] = '\0';
>> +        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
> ... you also only print a line under certain conditions.

... this. (for the same reason as hvm_print_line() which has an argument
'uint32_t *val' but inside function working with chars because of
'char c = *val;')

I will change the name to vsbi_print_char().

>
>> +        cons->idx = 0;
>> +    }
>> +    spin_unlock(&cons->lock);
>> +}
>> +
>> +static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>> +                                     unsigned long fid,
>> +                                     struct cpu_user_regs *regs)
>> +{
>> +    int ret = 0;
>> +
>> +    switch ( eid )
>> +    {
>> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
>> +        vsbi_print_line((char)regs->a0);
> The cast isn't really needed, is it?

No, I think it could be omitted.

>   And just to double-check: The spec demands
> the upper bits to be ignored? (A link to the spec could have been useful, e.g.
> in the cover letter.)

It doesn't mention anything about upper bit for PUTCHAR:
   https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-legacy.adoc#extension-console-putchar-eid-0x01
   (I will add a link to the spec in the cover letter.)
So I assume that they don't care about it. (IIUC your question correctly).

I also checked what OpenSBI does and it just call the following function:
   void sbi_putc(char ch)
   {
	nputs_all(&ch, 1);
   }
in the following way: sbi_putc(regs->a0);


>> +        break;
>> +
>> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
>> +        ret = SBI_ERR_NOT_SUPPORTED;
>> +        break;
>> +
>> +    default:
>> +        /*
>> +         * TODO: domain_crash() is acceptable here while things are still under
>> +         * development.
>> +         * It shouldn't stay like this in the end though: guests should not
>> +         * be punished like this for something Xen hasn't implemented.
>> +         */
> Question then is why SBI_EXT_0_1_CONSOLE_GETCHAR gets a separate case block.

Because we intentionally do not support|SBI_EXT_0_1_CONSOLE_GETCHAR|,|domain_crash()|
should not be called for it. Currently,|domain_crash()| is used only for debugging
purposes while Xen for RISC-V is still under development. In the future, the
default case should simply return|SBI_ERR_NOT_SUPPORTED|, and
the|SBI_EXT_0_1_CONSOLE_GETCHAR| case block will be removed.

Thanks.

~ Oleksii


