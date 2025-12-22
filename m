Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07BFCD5538
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 10:30:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191991.1511362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXcE0-000290-9q; Mon, 22 Dec 2025 09:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191991.1511362; Mon, 22 Dec 2025 09:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXcE0-00026v-6i; Mon, 22 Dec 2025 09:29:08 +0000
Received: by outflank-mailman (input) for mailman id 1191991;
 Mon, 22 Dec 2025 09:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXcDz-00026o-0H
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 09:29:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b85f19-df18-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 10:29:05 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b8010b8f078so417282866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 01:29:05 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cea9sm1004585166b.50.2025.12.22.01.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:29:03 -0800 (PST)
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
X-Inumbo-ID: a8b85f19-df18-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766395745; x=1767000545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WyLPU9tbT4xZZUFu/tHiEIakHD60OzKB2/ADSRPhBcg=;
        b=dvOvIKgIsL4HlB3NEexzktsUZBNNln4CsE7JZtNNwDAM0r9iELX/j9q2TSa+hKJeXg
         grGCvv35/GGM60cw1aQiL9tEnyjiPGoo+1I0ydkTFPqtgWwgrGz46ezYNOABxouiqUm/
         eRmCTq26dfRWUDN8Te9nRBD0NDINdtiit7+LairvwKIgfr+DUzNo91uJ0XcCh/xI09wM
         9HOAX84S63VjzyfIvSIj+2rf6kYWQEQ6FDHi3crGRS9q/nOE2+/40HsZh5hp62loPSIv
         w48P8g+9Kfhs1zXstTlkh+HeCDUmYryTpcVQji+T9qhWV6fcBMVYIunDjQOFyPbrp4Zg
         pIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395745; x=1767000545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyLPU9tbT4xZZUFu/tHiEIakHD60OzKB2/ADSRPhBcg=;
        b=xPHq7ud+MvJJWOrkm9DULarKjMcXgDZT9VZ/xbQzxPegQE+nudfadKQ9gmWkAo0nme
         g+y3pz2uHANCi0psnf1QTsAzPgAY97xKW3/yeZ7v+vmuPnSDXC4WMtRa97PoPsDH7Fml
         pIdDnPl0lwPmkVzMvXEYUO2MSG5ZSlDXZcwPTfra3mjMK4vH8jjkI0URCQhrtg13NBb1
         2i7wljG+MK8TdNcKmNUm6uf044Pxyglx6GD0RGVslKfcjXPd/m3q7SQ4ylY9nGEFJYex
         Kmn/NE+yEVJhtqma1elW3Er0AmEV+kHZB2c9SdpA1mwtzLKnxgd5gj5o6uc7YlrL4vWQ
         RAJg==
X-Forwarded-Encrypted: i=1; AJvYcCWY7+sDysi4XGbTsrkv/U970WwN9K3LVxXSDzcIAKtVyg4WsbJ9byC8c4j+blJCVzjgLeb678gMTrM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywb33zNOlWOWX51uwrBZMTgKT+QlTioGjJaDMZOviVNuYbJ7F3c
	hQBpU8ovYstzImYtQoj9xCuYFZ109oOCvPj90sTbqWv+/+9tILlkv6Ld
X-Gm-Gg: AY/fxX4Hy7RNnyA/zWaXqZOi/W07bzgVc9+2kgIixlhjfPloRdydhy3FdJLXb15X6bi
	EGJ6Wsbcw0NYRK/0FsEK/ZfSy09NfXrFK8kyFYsGdkagEZG3qbI1ga7awYTE4MvVJK980QO8y0M
	1m2PkxEwWljDQQ7CVLNwHNJn8ars8F9dwZkVTjTLVHT4kFtz+wNZyDvkrxEQOVGWQAIXFg0LZDk
	RTfV97YmZOj/C4DBAY1QyELIHD6Vzm/5diNdxh1yGyHo11EGGRAsLIak6tdIxRVf+0w6RblRGBb
	LkgYzrMvzIc769938eox4OnOgYscHHMpW+GOn1ACjwjuGuw5M1Ug/Ic/BVx5UtXRhnJPK9jXI0i
	91Jjyeql7wcIYQkUsK+dKY0GAP3y3XJew6eOngcwd0ml82vfDfuuHh8R8PiTzkQm+B7y3o4EEWE
	xjwLmG9haEtOCJtj+v9R4uKEZe74pd6Gx/3Cx9cMKal2LwobW3G6VnW4w2I3E7MM5q
X-Google-Smtp-Source: AGHT+IFrWxgGHotCz5vwlquwEdm4+b1COzc5kxDrkHKeDo/hOYAHrPleBnMSL5kfpGpoG3DRm5UAnA==
X-Received: by 2002:a17:907:980a:b0:b76:d880:e70b with SMTP id a640c23a62f3a-b80371d5006mr1107911866b.55.1766395744214;
        Mon, 22 Dec 2025 01:29:04 -0800 (PST)
Message-ID: <46373e3b-51e7-4843-82c8-9c0c2d644b16@gmail.com>
Date: Mon, 22 Dec 2025 10:29:02 +0100
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
 <dddbd311-99a2-44b1-926e-f3859ff936dc@gmail.com>
 <d3f6189d-7a4b-4d7e-8b22-71c325ce109e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d3f6189d-7a4b-4d7e-8b22-71c325ce109e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/22/25 8:40 AM, Jan Beulich wrote:
> On 19.12.2025 21:04, Oleksii Kurochko wrote:
>> On 12/18/25 3:20 PM, Jan Beulich wrote:
>>> On 17.12.2025 17:54, Oleksii Kurochko wrote:
>>>> This commit adds support for legacy SBI extensions (version 0.1) in Xen
>>>> for guest domains.
>>>>
>>>> The changes include:
>>>> 1. Define all legacy SBI extension IDs (0x0 to 0x8) for better clarity and
>>>>      completeness.
>>>> 2. Implement handling of legacy SBI extensions, starting with support for
>>>>      SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR.
>>> I can't spot any actual support for GETCHAR.
>>>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/vsbi/legacy-extension.c
>>>> @@ -0,0 +1,65 @@
>>>> +
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#include <xen/console.h>
>>>> +#include <xen/lib.h>
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#include <asm/processor.h>
>>>> +#include <asm/vsbi.h>
>>>> +
>>>> +static void vsbi_print_line(char c)
>>> Misleading function name? The parameter doesn't fit the name, and ...
>> It was called only because of ...
>>
>>>> +{
>>>> +    struct domain *cd = current->domain;
>>> I guess you copied this code from somewhere, but a variable of this type and
>>> contents wants to be named "currd".
>>>
>>>> +    struct domain_console *cons = cd->console;
>>>> +
>>>> +    if ( !is_console_printable(c) )
>>>> +        return;
>>>> +
>>>> +    spin_lock(&cons->lock);
>>>> +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
>>>> +    if ( c != '\n' )
>>>> +        cons->buf[cons->idx++] = c;
>>>> +    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
>>>> +    {
>>>> +        cons->buf[cons->idx] = '\0';
>>>> +        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
>>> ... you also only print a line under certain conditions.
>> ... this. (for the same reason as hvm_print_line() which has an argument
>> 'uint32_t *val' but inside function working with chars because of
>> 'char c = *val;')
>>
>> I will change the name to vsbi_print_char().
>>
>>>> +        cons->idx = 0;
>>>> +    }
>>>> +    spin_unlock(&cons->lock);
>>>> +}
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
>>>> +        vsbi_print_line((char)regs->a0);
>>> The cast isn't really needed, is it?
>> No, I think it could be omitted.
>>
>>>    And just to double-check: The spec demands
>>> the upper bits to be ignored? (A link to the spec could have been useful, e.g.
>>> in the cover letter.)
>> It doesn't mention anything about upper bit for PUTCHAR:
>>     https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-legacy.adoc#extension-console-putchar-eid-0x01
>>     (I will add a link to the spec in the cover letter.)
>> So I assume that they don't care about it. (IIUC your question correctly).
> I fear such a conclusion cannot be easily drawn. The parameter there is even
> "int". Anything not ASCII will remain unclear how to handle until the spec is
> changed to actually say what is intended.

Then it makes sense to add "WARN_ON(regs->a0 >> __CHAR_BIT__);" in
SBI_EXT_0_1_CONSOLE_PUTCHAR case block.

>
>>>> +        break;
>>>> +
>>>> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
>>>> +        ret = SBI_ERR_NOT_SUPPORTED;
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        /*
>>>> +         * TODO: domain_crash() is acceptable here while things are still under
>>>> +         * development.
>>>> +         * It shouldn't stay like this in the end though: guests should not
>>>> +         * be punished like this for something Xen hasn't implemented.
>>>> +         */
>>> Question then is why SBI_EXT_0_1_CONSOLE_GETCHAR gets a separate case block.
>> Because we intentionally do not support|SBI_EXT_0_1_CONSOLE_GETCHAR|,|domain_crash()|
>> should not be called for it.
> That contradicts the patch description saying "starting with support for
> SBI_EXT_0_1_CONSOLE_{PUT,GET}CHAR." (Still in context at the top.)

I will update the patch description. I just thought that that returning of "not supported"
for *_GETCHAR() could count as an implementation.

Thanks.

~ Oleksii


