Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5EA969C79
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 13:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789018.1198558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slS4M-0003Rq-HT; Tue, 03 Sep 2024 11:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789018.1198558; Tue, 03 Sep 2024 11:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slS4M-0003Oi-Db; Tue, 03 Sep 2024 11:51:34 +0000
Received: by outflank-mailman (input) for mailman id 789018;
 Tue, 03 Sep 2024 11:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slS4K-0003OM-AC
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 11:51:32 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dca9e2de-69ea-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 13:51:31 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5353d0b7463so8833821e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 04:51:31 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196c88sm671417566b.102.2024.09.03.04.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 04:51:30 -0700 (PDT)
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
X-Inumbo-ID: dca9e2de-69ea-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725364291; x=1725969091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sJp+J1gT0Q1GZ+5PtwwwaI13J4JXTZC4aa5w2zC3J8s=;
        b=wCmHsXlshT9vn9VOAmOe4kR/IbSPYrOT/jgtLgJW4IueaYQZBOp2bObRcH3tK/3S2Q
         S0DTEEsMUo9GhvJrXa2qjTVzB/y8k5dwRF5KArH0sC8B/FmOW4cK7CYR9CVk3B03BEhs
         3ZOXJkE3XA2IbDDD2RVQl8AQQMkX8IdCSYDnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725364291; x=1725969091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJp+J1gT0Q1GZ+5PtwwwaI13J4JXTZC4aa5w2zC3J8s=;
        b=eswOiq3k2+gDE+s1hM0+jCntWTCc9nAjZ24RzGaVnSRlsQ7o5y7G5PXKMhTb+Bxfzx
         oamzQoYlHPdnv2wSmHAxRR4LyjAU3b6K4GiFD8JzWEFTD8b2BMriuritBqvcKBEf6XU+
         +tJHreE/xDRmyJPBoSiImQB52iw8o7TUEN6wzZNwBVsPoMTVgHS6IoOulGJt1DmM3aPJ
         z9alu2MO2ANhLj6tW9Q0G1/ykRUfw3uNZZ/jWL65ZGqV4lqb3Fw9edvpeVNJtL4I4/oF
         O0OJ+xWve+kHvoN7RSQyWKRkJJUJe5uqTKh24fNjCcIbqDnVTBMn+llkKI6Tf0ztNGTP
         NANg==
X-Gm-Message-State: AOJu0YxW9E0xH7Lltsn6JMv0kiSAsKnFEKoSuYA75xp1G4LZSRCU0i+1
	8MvesxzS8U1GXnmUzeeLgRH3tLxJ9k03vBJxzsOg/9zqwmgwoxMZWD0YUPikFVQ=
X-Google-Smtp-Source: AGHT+IGw9R3VpfGEYD+dUhY/mqNUNt7TXONe+7NMQNmItHjGKd94ExWaLcFgpxiaMeUMkUZ/I+BFUQ==
X-Received: by 2002:a05:6512:3c93:b0:52c:e10b:cb33 with SMTP id 2adb3069b0e04-53546bfbe9amr11711711e87.50.1725364290569;
        Tue, 03 Sep 2024 04:51:30 -0700 (PDT)
Message-ID: <7bd043c7-32b0-44d6-a6c4-f74695a0b355@citrix.com>
Date: Tue, 3 Sep 2024 12:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Reinstate -nostdinc for CFLAGS_x86_32
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <Ztbw/QwIvgQNcmoo@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Ztbw/QwIvgQNcmoo@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 12:20 pm, Anthony PERARD wrote:
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
> I disagree with this. I'm pretty sure I've check that no command line
> have changed.

Fine, I'll drop it.

>
> Also, this commit shows that CFLAGS was only coming from root's
> Config.mk:
>> diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot
>> deleted file mode 100644
>> index e90680cd9f..0000000000
>> --- a/xen/arch/x86/boot/build32.mk
>> +++ /dev/null
>> @@ -1,40 +0,0 @@
>> -override XEN_TARGET_ARCH=x86_32
>> -CFLAGS =
>> -include $(XEN_ROOT)/Config.mk
> So, I'm pretty sure, -nostdinc was never used before. But happy to be
> told that I've come to the wrong conclusion. (We would need to check by
> building with an old version without this commit to be sure.)

-nostdinc was added after the fact.  Which is fine.

But as a consequence of these being unlike the rest of Xen, somehow (and
only on FreeBSD it seems), the regular build of Xen is fine, but
tools/firmware/xen-dir for the shim is subject to -nostdinc in a way
that breaks cmdline.c

> "xen/arch/x86/boot" as it's own sets of CFLAGS, which is annoying and I
> haven't really tried to change that. This is also why XEN_CFLAGS is been
> discarded.

This is necessary.  We're swapping -m64 for -m32 to build these two
objects, and that invalidates a whole bunch of other CFLAGS.

~Andrew

