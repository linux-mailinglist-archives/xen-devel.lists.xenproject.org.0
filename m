Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1071969B37
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 13:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788969.1198487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slROf-0007e4-NH; Tue, 03 Sep 2024 11:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788969.1198487; Tue, 03 Sep 2024 11:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slROf-0007bp-Jm; Tue, 03 Sep 2024 11:08:29 +0000
Received: by outflank-mailman (input) for mailman id 788969;
 Tue, 03 Sep 2024 11:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slROe-0007bh-RI
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 11:08:28 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d86895a2-69e4-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 13:08:27 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5bede548f7cso5278701a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 04:08:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24372d393sm4241387a12.23.2024.09.03.04.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 04:08:26 -0700 (PDT)
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
X-Inumbo-ID: d86895a2-69e4-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725361707; x=1725966507; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2sDw1XuqHAeugrkSi2fQ785aLy4zqMu6xrXfTULmG9k=;
        b=Hhb+nuxmU7ZnviTU/t+oHmEwIWyT0dq2QKNSNkxA3Dx1aV5S64HS3PO3JU7TrCwe2x
         mgv/Z9TdrIWj2qCWphIWbyUz53q2MLmtZSeATXVcuk+gugHb0vr2PurgsFUYMGbP8aS/
         AEfMFj0L7JezbMzapbwctKEo/LJaJirwj8a/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361707; x=1725966507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sDw1XuqHAeugrkSi2fQ785aLy4zqMu6xrXfTULmG9k=;
        b=TtqKjziCDkhMqjmgWNpa0n5K69gZsM5y9YfFRuiagwJ5NPBQ1TnxPlTLsWY7mbis/9
         RXOdO6mV9v1hOx0rJSSGtuB/bBl8+tvzKL7gV7TaK/qZ3JmZByz36Ju1hhGPCFIz3br7
         inJPL2E+kjNy/SM+wH1974TORt1Yeuu6RLD3AR1b5jUb9ydmlCrC1+jvVtn+zwevm7Vg
         yIsY+xq60N4hSr6uP5UoHQhlblyJGYlAH/3zEm8sTpwPIaNCUbGaSkHOwimTJ2rML5PK
         rRcOQJ7lVyvIwh69vw7cK1R3DH1jftAYFX60w99rRkn7haauVRbIoq4s6J14DJ4lT7OQ
         EUXA==
X-Gm-Message-State: AOJu0Yxb3kA/4jB6bpJRS6zOhYPOj4XRML2G8Rp725lKW+EsjduPPwU2
	gjpGLY2QQYmEcNy47ykXFzvnVivxY8aPufDNqNBItd/Eu3z072eAzKwBF2jpCXAP44DN1UiRG1B
	D
X-Google-Smtp-Source: AGHT+IEv+32vXLD3fovTa5YZAvk5yrQ/ggp+sjZWXzhZlNmOY7Xh0aoHPLJX7V+Dx0acmv0FGfWItQ==
X-Received: by 2002:a05:6402:270c:b0:5c2:53a1:c209 with SMTP id 4fb4d7f45d1cf-5c253a1c259mr4543408a12.25.1725361706687;
        Tue, 03 Sep 2024 04:08:26 -0700 (PDT)
Message-ID: <756335cc-f4e3-4664-82ea-cde0301b1784@citrix.com>
Date: Tue, 3 Sep 2024 12:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Reinstate -nostdinc for CFLAGS_x86_32
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <ZtbrAnF97EXZvr8t@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZtbrAnF97EXZvr8t@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 11:54 am, Roger Pau Monné wrote:
> On Tue, Sep 03, 2024 at 11:49:40AM +0100, Andrew Cooper wrote:
>> Most of Xen is build using -nostdinc and a fully specified include path.
>> However, the makefile line:
>>
>>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>>
>> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
>>
>> Reinstate -nostdinc, and add the arch include path to the command line.  This
>> is a latent bug for now, but it breaks properly with subsequent include
>> changes.
>>
>> Fixes: d58a509e01c4 ("build,x86: remove the need for build32.mk")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> ---
>>  xen/arch/x86/boot/Makefile | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
>> index 03d8ce3a9e48..19eec01e176e 100644
>> --- a/xen/arch/x86/boot/Makefile
>> +++ b/xen/arch/x86/boot/Makefile
>> @@ -13,11 +13,11 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
>>  
>>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>> -CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
>> +CFLAGS_x86_32 += -Werror -nostdinc -fno-builtin -g0 -msoft-float
>>  ifneq ($(abs_objtree),$(abs_srctree))
>> -CFLAGS_x86_32 += -I$(objtree)/include
>> +CFLAGS_x86_32 += -I$(objtree)/include -I$(objtree)/arch/$(SRCARCH)/include
>>  endif
>> -CFLAGS_x86_32 += -I$(srctree)/include
>> +CFLAGS_x86_32 += -I$(srctree)/include -I$(srctree)/arch/$(SRCARCH)/include
> I think it might be best to just filter out the include paths from
> XEN_CFLAGS, iow:
>
> CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
>
> Instead of having to open-code the paths for the include search paths
> here again.  Using the filter leads to the following CC command line:
>
> clang -MMD -MP -MF arch/x86/boot/.cmdline.o.d -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -fno-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -Werror -fno-builtin -g0 -msoft-float -mregparm=3 -I./include -I./arch/x86/include -I./arch/x86/include/generated -I./arch/x86/include/asm/mach-generic -I./arch/x86/include/asm/mach-default -fpic '-D__OBJECT_LABEL__=arch/x86/boot/cmdline.o'    -c arch/x86/boot/cmdline.c -o arch/x86/boot/.cmdline.o.tmp -MQ arch/x86/boot/cmdline.o

FWIW, https://cirrus-ci.com/build/5930269490806784 shows a good build on
FreeBSD with this patch in place.

I'd be happy with that approach.  It's probably less fragile, although
I'll probably go with:

CFLAGS_x86_32 += -nostdinc $(filter -I%,$(XEN_CFLAGS))

to handle all the include changes together.  Lemme spin a v2.

~Andrew

