Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38185CB584A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 11:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183824.1506417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdvf-0000zv-Ih; Thu, 11 Dec 2025 10:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183824.1506417; Thu, 11 Dec 2025 10:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdvf-0000uz-FJ; Thu, 11 Dec 2025 10:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1183824;
 Thu, 11 Dec 2025 10:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhd1=6R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTdve-0000sD-7L
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 10:29:46 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d7e50b4-d67c-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 11:29:41 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b735e278fa1so153121166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 02:29:41 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64982040d14sm2134346a12.5.2025.12.11.02.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 02:29:40 -0800 (PST)
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
X-Inumbo-ID: 4d7e50b4-d67c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765448981; x=1766053781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0dFtbPgS018TneGvw6TmMwgYf3+nEk6sgqMPx24LyAA=;
        b=TzpO7LasZFN/QRvYjrkNDvpEpIra9IfkeL2RVhhjKicbgwwba5olJhJLdACrcsnoNT
         7POn0XsTe8aAZ787HOGj9LUHjhSpeikViwEpC/kz3tx8dwawvJhbZjdp6/Z5yBTtBnu6
         3ZRnGTPkodm8N2UuVfL+LFPPLuGl1kWvwK7O9klv6KkYpcICS248/1O2TLAbXYjUl8Gm
         tQ0I0PqOkSwtNNok8MyO9IJ3qTno4UKJOKxvVsc2Tytl985ofgZIxb4Dy6iLMKCsjrje
         trbP41ovoAF3RKqXHGkUmCmLNqG8vfRluFRs1rP2pTrxP9Nhyponk7+Xv/CDalXfrC+o
         OqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765448981; x=1766053781;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dFtbPgS018TneGvw6TmMwgYf3+nEk6sgqMPx24LyAA=;
        b=PndZh1tSoBm0MU1HZ7+Q7mcPUSZd25zwde9JXjgpKg/IGRRbwcOuKNoOPpMTtCXjtQ
         lEiSIx+e0E/KtZbZlLMUC5YOA62gpi0V83Ht3LXc7SZDqD/bV0/Zt1I6oxk3HUdeP3tq
         ie6HOI67gQSRk2njtaiBrS3/kf0dfBthVz1ARXzRMMOQBkJtP/0YZuTZaJ67JnSlr6p9
         6XT56RG8B1Rj3YEZNgtrQRa2FYDsZ5abcvWRn1DHciX8mQLtYTRVzXnJ8c8F9qYFckYt
         ViJabzTJ6f4sVY8R/xztQic1/kmJTbkrieDw/S4JPQDCFYF3eoYjZtjWhavYFSu6CHov
         xL1g==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZxlBVNCee3reiPaiIgTOsCLd1GT8+O0BRBk34DFEOTJBoVzhMQRiAY8EB6+aHHJPxT7NTTQbE9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTvX4oQP7V5pmD9D69znysP5iS+LaRp8tCgfXBIUC63CnMTfZh
	hQSEiRyzmqOz8w7vRYY8YbaAQx+JbUWb+GcsvLlb+wESWr0ex6XyXEsl
X-Gm-Gg: ASbGncu1Img4JZk+JrINA3QuPnyycL94eJWxq3m+K1a1C9nJEyGZKFR2zQ3NecZyzmd
	RdX5utmA7AsHmJBHeDLefgaxpCVVbvhQ26JzMQuIwnZiSE8X+hYVTO7yKgmbSLL9gGYhYbRt0ug
	zBClsqyCgmjsbs3VAXjvEBnMXTTfkWFtw28fUdvN+1zFYunnfHtn2w67EV8Cw2JUT3Xe3hTGytE
	u4D8uLAXKttVwUhNUkJcRxefHQR5WpLy62JqlKunEiSt3P9x5qn0bzaPkTGkooqh4QNvYfyk4a9
	ojaGfqKJ6zZp33RFiQbu+2MhgFSQQIbFUCaxwTTALD4UPsP2RpzQtKYaFcc1v2t7HmagpTclmAv
	zONZuU5wMFEW66smwhiOlAzPcZH+VmTq2Q5ED3OLAeA5FEa4D3liFVOUfIATUzLN+2vXYiYj5N+
	k43EGNHJfZqX8PD5ywEOmqiZd5thlja5sBmzl734HKlc2JpNwO6OsP1f3c1kKt
X-Google-Smtp-Source: AGHT+IGyDJ/V5v0DHgjHWU81DAHpLw4A9MDBZx0ADNMylxL8iTs0DNAdPLV8mfYTXfpFhD+zVOq4BQ==
X-Received: by 2002:a17:906:c151:b0:b73:5936:77fc with SMTP id a640c23a62f3a-b7ce8234ee8mr603939866b.13.1765448980446;
        Thu, 11 Dec 2025 02:29:40 -0800 (PST)
Message-ID: <c1ca8efb-3e17-45e2-ba90-a6f49616bb51@gmail.com>
Date: Thu, 11 Dec 2025 11:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <c3d2a4c4-f591-4bff-b978-18b8c09cf512@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/8/25 4:05 PM, Jan Beulich wrote:
> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/sbi.h
>> +++ b/xen/arch/riscv/include/asm/sbi.h
>> @@ -14,8 +14,15 @@
>>   
>>   #include <xen/cpumask.h>
>>   
>> -#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
>> -#define SBI_EXT_0_1_SHUTDOWN			0x8
>> +#define SBI_EXT_0_1_SET_TIMER           0x0
>> +#define SBI_EXT_0_1_CONSOLE_PUTCHAR     0x1
> Why the padding adjustment when ...
>
>> +#define SBI_EXT_0_1_CONSOLE_GETCHAR     0x2
>> +#define SBI_EXT_0_1_CLEAR_IPI           0x3
>> +#define SBI_EXT_0_1_SEND_IPI            0x4
>> +#define SBI_EXT_0_1_REMOTE_FENCE_I      0x5
>> +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA   0x6
>> +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID  0x7
> ... you immediately have one that doesn't fit?

IDK, the padding adjustment shouldn't be done in this way.
I will correct it.

>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/vsbi-legacy-extension.c
>> @@ -0,0 +1,37 @@
>> +
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/vsbi.h>
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
>> +        printk("%c", (char)regs->a0);
> This is guest output, so shouldn't use plain printk().

I think that I don't know what should be used instead. Could you suggest me something
or point to the code in other arch-s?

Or do you mean that guest_printk() should be used?

>> +        break;
>> +
>> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
>> +        regs->a0 = SBI_ERR_NOT_SUPPORTED;
> This will be overwritten with the return value you pass to the caller (i.e. 0),
> by that caller (i.e. vsbi_handle_ecall()).

Oh, thanks. It should be "ret = SBI_ERR_NOT_SUPPORTED;" here.


>
>> +        break;
>> +
>> +    default:
>> +        panic("%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
>> +              __func__, fid, eid);
> Please don't. domain_crash() may be okay to use here, but crashing the hypervisor
> because of unexpected guest input isn't okay.

|domain_crash()| is better. I also considered just returning|SBI_ERR_NOT_SUPPORTED|,
but it wasn’t too convenient for debugging which FID/EID the guest was called,
so I started using|panic()| instead.

Thanks.

~ Oleksii


