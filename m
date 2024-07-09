Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350CD92BC08
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 15:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756303.1164865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRBHq-0006az-9V; Tue, 09 Jul 2024 13:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756303.1164865; Tue, 09 Jul 2024 13:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRBHq-0006ZU-5o; Tue, 09 Jul 2024 13:53:42 +0000
Received: by outflank-mailman (input) for mailman id 756303;
 Tue, 09 Jul 2024 13:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUMd=OJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRBHp-0006ZO-91
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 13:53:41 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5ba6548-3dfa-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 15:53:40 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77d85f7fa3so593597666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 06:53:40 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a871f2fsm78517966b.202.2024.07.09.06.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 06:53:36 -0700 (PDT)
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
X-Inumbo-ID: a5ba6548-3dfa-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720533218; x=1721138018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7dwwlRXl0cvTZL1YuMHfrHnXplLvHYfBLjFy+BKMfGE=;
        b=vWGGzWvP94dRjGZdHzpWuboICPbsc+9jcf18ZiBZ6hSPEKX5Xrx1jSiob7eAgnto1+
         veIwXZKfSuhdZvwdAO/HY5YrM2WAH4nl/otd8z+FmeXA5oDNxmeIrX6w0Xyr8Iy+whuV
         s6U3qeWh5tJaJx7n/hkSoZYdfbhr+Pl13+d44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720533218; x=1721138018;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dwwlRXl0cvTZL1YuMHfrHnXplLvHYfBLjFy+BKMfGE=;
        b=ChD86NBlek0tzip4Fvsa5RNPBpAjXsEDDzsKBQ/w3z8c1XWMpvLskynPKei6c1qmRx
         g1EWx8ugxGFzXuj2CNxTL9arcsej3EyO4AyfxRjrnNsWPgFpF4rUC1M35+ZSa4VymNGT
         l6Tur1ZjrNeARNTX+8ArehO6g2JhinG4hgIhfq/Vsegub6msc2Ffb2Yequj+0OtRFp4+
         Wn98tEkV+4/mv1Ih5A6FlTaM7bwlGoffZpVeO/Df+sE7C4W8KQnetZhSxyhl06xpGQYB
         eIL603QoHFSFHmtk4FbWvBybiXXzG4PmdrH/LIOL4R1bAwwk1KiiJGfkTHRD2DTD/e1c
         TEUg==
X-Gm-Message-State: AOJu0Yx6CLUir4V3cdtgak0li1DONkp899QdMuEiaT6R9dAd605cEWF2
	6m/yurXOs87wgPhyKINdobdrXxAABjChHtChbgAMrgWUkkrTvFioK3CZe4DIdyJA4P6luMDPlcs
	E
X-Google-Smtp-Source: AGHT+IFHsVuIAjNQqVJGue3GE09l8z/EPmOE/RAy+8A1lBkRKR6UUVNs1gw1zDTm2s38a1AMteOboA==
X-Received: by 2002:a17:907:d94:b0:a77:e6dd:7f35 with SMTP id a640c23a62f3a-a780d22e38bmr228179966b.13.1720533218114;
        Tue, 09 Jul 2024 06:53:38 -0700 (PDT)
Message-ID: <594eaeab-20d4-4531-a0e2-3e5b317dc21d@citrix.com>
Date: Tue, 9 Jul 2024 14:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build system mess in stubdom
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Correct Anthony's email]

~Andrew

On 09/07/2024 2:49 pm, Andrew Cooper wrote:
> Hello,
>
> I'm trying to investigate why stubdom/ is fatally failing now with a
> rebuilt ArchLinux container (GCC 14).
>
> It is ultimately:
>
>> ../../../../../newlib-1.16.0/newlib/libc/reent/signalr.c:61:14: error:
>> implicit declaration of function ‘kill’; did you mean ‘_kill’?
>> [-Wimplicit-function-declaration]
>>    61 |   if ((ret = _kill (pid, sig)) == -1 && errno != 0)
>>       |              ^~~~~
>> make[7]: *** [Makefile:483: lib_a-signalr.o] Error 1
> which doesn't make sense, but is a consequence of the ifdefary in
> newlib/libc/include/_syslist.h
>
> However, we've got problems ahead of that.
>
> First of all, with:
>
> [user@89aef714763e build]$ ./configure --disable-xen --disable-tools
> --disable-docs
> <snip>
> Will build the following stub domains:
>   xenstore-stubdom
>   xenstorepvh-stubdom
> configure: creating ./config.status
> config.status: creating ../config/Stubdom.mk
>
> both a top level `make` and `make stubdom` end up building all of tools,
> contrary to comments in the makefile.
>
> `make build-stubdom` does (AFAICT) only build stubdom.
>
> However, building just the xenstore stubdoms recursively builds all of
> tools/libs/ even though only some are needed.  This includes libxl which
> then recurses further to get tools/libacpi, and libxenguest which
> recurses further to get libelf from Xen.
>
> What I can't figure out is why xenstore ends up pulling in all of newlib.
>
> Semi-irrespective, there's no way we can keep on bodging newlib to
> compile with newer compilers.  There's a whole bunch of other warnings
> (strict-prototypes, dangling-else, maybe-uninitialized, unused-function,
> pointer-sign, unused-variable) primed ready to cause breakage in any
> environment which makes these error by default.
>
> I'm going to be making ArchLinux non-blocking because it is a rolling
> distro, but we also can't do nothing here.
>
> ~Andrew


