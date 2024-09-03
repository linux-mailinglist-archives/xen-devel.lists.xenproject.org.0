Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C44969B5E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 13:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788975.1198497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRWZ-0001Ne-GJ; Tue, 03 Sep 2024 11:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788975.1198497; Tue, 03 Sep 2024 11:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRWZ-0001KW-DZ; Tue, 03 Sep 2024 11:16:39 +0000
Received: by outflank-mailman (input) for mailman id 788975;
 Tue, 03 Sep 2024 11:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slRWX-0001Fi-UJ
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 11:16:37 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbf16ba1-69e5-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 13:16:36 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a86b46c4831so572821466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 04:16:36 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221e15sm667863966b.193.2024.09.03.04.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 04:16:35 -0700 (PDT)
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
X-Inumbo-ID: fbf16ba1-69e5-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725362196; x=1725966996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GviZ1H8/mAVYeYpsaVybkSp2SfaCl25gcjdD/2+7Jgs=;
        b=FFn5BBixKPdCzp4At9QgJHBzjjBKUwYGwtkb4NQSXGQ/Szon9iQIXElY35+4s+XBQ7
         lV4+QqUakQ91Qiiv3RszRiLk6FjleX/QBEPBJGqDhMEoi5bfq78pRqb7fkmRHWGSK4yN
         T16O5PZTnCjytbNwfS9d2m5jr08JW90ofW5lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725362196; x=1725966996;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GviZ1H8/mAVYeYpsaVybkSp2SfaCl25gcjdD/2+7Jgs=;
        b=nxe5yi/T1dcq8jwcK1psZN9xTWXu5RnnVDEsSz7VIchVjq9LV/KoPSKvItkCZXy2NY
         /surrrHET3Vf+ewtnpsW+lRACFPobaljAfuajCHwBOSH/nCvD7inKVOHt9u4E/OiDPkQ
         qMXMN4FXllNTqRECYvOXzhokLFSBIxHvxAvarcILkEtR14QSqqJht66yBY2IhVkOmVUh
         sCoyT2aV+LvFaE3XYPVQwVidzG9wogX47SKOmLK++2Ju/1GZEmPcpNw+Ml03TFP8RRgk
         GpTlJP3eYG13dKkYsZlzmG0eeWufldC14XZ/WXTO99NuJ5Agpsk+Da6+hqaFP4xc+8eP
         fA8w==
X-Gm-Message-State: AOJu0YyOQOmZ6bu0jozPH7BbJYrxV3ft00E1Mp2WtXE+JR3M+OjlBrcj
	8xO/ekHbSv3lb22xudnu60XgFNoteNPn2kunMWN2Qsm6AAZ5OKD10rakhX9u/eA=
X-Google-Smtp-Source: AGHT+IGUdhLIiQWAFUldg4YuuSqY6fzIt0/BOlnav7ydKAnt8VgojAHlxaKb+H4wpQHbrxCJFU89cQ==
X-Received: by 2002:a17:907:3f9c:b0:a86:8b2f:49b3 with SMTP id a640c23a62f3a-a89d8848df0mr607276066b.46.1725362195624;
        Tue, 03 Sep 2024 04:16:35 -0700 (PDT)
Message-ID: <773ec15f-dd90-4b44-9c42-fc1609f25c44@citrix.com>
Date: Tue, 3 Sep 2024 12:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Reinstate -nostdinc for CFLAGS_x86_32
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <ZtbrAnF97EXZvr8t@macbook.local>
 <756335cc-f4e3-4664-82ea-cde0301b1784@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <756335cc-f4e3-4664-82ea-cde0301b1784@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 12:08 pm, Andrew Cooper wrote:
> On 03/09/2024 11:54 am, Roger Pau Monné wrote:
>> On Tue, Sep 03, 2024 at 11:49:40AM +0100, Andrew Cooper wrote:
>>> Most of Xen is build using -nostdinc and a fully specified include path.
>>> However, the makefile line:
>>>
>>>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>>>
>>> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
>>>
>>> Reinstate -nostdinc, and add the arch include path to the command line.  This
>>> is a latent bug for now, but it breaks properly with subsequent include
>>> changes.
>>>
>>> Fixes: d58a509e01c4 ("build,x86: remove the need for build32.mk")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> ---
>>>  xen/arch/x86/boot/Makefile | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
>>> index 03d8ce3a9e48..19eec01e176e 100644
>>> --- a/xen/arch/x86/boot/Makefile
>>> +++ b/xen/arch/x86/boot/Makefile
>>> @@ -13,11 +13,11 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
>>>  
>>>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>>>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>> -CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
>>> +CFLAGS_x86_32 += -Werror -nostdinc -fno-builtin -g0 -msoft-float
>>>  ifneq ($(abs_objtree),$(abs_srctree))
>>> -CFLAGS_x86_32 += -I$(objtree)/include
>>> +CFLAGS_x86_32 += -I$(objtree)/include -I$(objtree)/arch/$(SRCARCH)/include
>>>  endif
>>> -CFLAGS_x86_32 += -I$(srctree)/include
>>> +CFLAGS_x86_32 += -I$(srctree)/include -I$(srctree)/arch/$(SRCARCH)/include
>> I think it might be best to just filter out the include paths from
>> XEN_CFLAGS, iow:
>>
>> CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
>>
>> Instead of having to open-code the paths for the include search paths
>> here again.  Using the filter leads to the following CC command line:
>>
>> clang -MMD -MP -MF arch/x86/boot/.cmdline.o.d -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -fno-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -Werror -fno-builtin -g0 -msoft-float -mregparm=3 -I./include -I./arch/x86/include -I./arch/x86/include/generated -I./arch/x86/include/asm/mach-generic -I./arch/x86/include/asm/mach-default -fpic '-D__OBJECT_LABEL__=arch/x86/boot/cmdline.o'    -c arch/x86/boot/cmdline.c -o arch/x86/boot/.cmdline.o.tmp -MQ arch/x86/boot/cmdline.o
> FWIW, https://cirrus-ci.com/build/5930269490806784 shows a good build on
> FreeBSD with this patch in place.
>
> I'd be happy with that approach.  It's probably less fragile, although
> I'll probably go with:
>
> CFLAGS_x86_32 += -nostdinc $(filter -I%,$(XEN_CFLAGS))
>
> to handle all the include changes together.  Lemme spin a v2.

Actually, it's not quite that easy.  From a regular Xen object file, we
have:

 * -Wa,-I,./include (twice, for some reason).
 * -include ./include/xen/config.h

The former can be added to the filter reasonably easily, but the latter
cannot.  I guess we've gone this long without it...

~Andrew

