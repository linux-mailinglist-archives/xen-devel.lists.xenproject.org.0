Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A9BA845B1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945786.1343903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2saH-00075z-4E; Thu, 10 Apr 2025 14:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945786.1343903; Thu, 10 Apr 2025 14:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2saH-00073o-0z; Thu, 10 Apr 2025 14:08:49 +0000
Received: by outflank-mailman (input) for mailman id 945786;
 Thu, 10 Apr 2025 14:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2saF-00073i-Hm
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:08:47 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51545e95-1615-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 16:08:46 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso9524385e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 07:08:46 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89362fbfsm4926313f8f.13.2025.04.10.07.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 07:08:45 -0700 (PDT)
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
X-Inumbo-ID: 51545e95-1615-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744294126; x=1744898926; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1B2rTcsqbJUEx/iaz1+4u5YFUAEGz3332gbrapUb5PA=;
        b=l1f43SB0vh1CIqLM6O8bVJkjb87Tof8kaEOik4phwMJfJKroRKQ7v0xGGXLHWjMSFK
         DnjKokkvaDHbl62oCuHWoNodgV8fPintPIDCnKufI+EtpJmwVyzCGsYGFj2HaVAqStix
         xKnWEOTzejaKoLFuo6Q2ARR/8TI2lyQbk4QKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294126; x=1744898926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B2rTcsqbJUEx/iaz1+4u5YFUAEGz3332gbrapUb5PA=;
        b=bRUFtoLjldRA5p5EUV+TZhihlWL5ReGxg83oYLO0PtMohUtM4mnGV4si1OW5ojX6OK
         TAawsLlJHYOynS3Uu1H6vo5w3Rje6EX8GmEWPgzMbZEXvwH/936C0gk5g1fPspndNJLI
         JSYmhtlJHMqS2wtyyMNg8bjNwo02JaoMP1V+utTzpgBm+FWzrIPKNqDvszWsCKA8KMxi
         pEEGzNjv6pf4Z74MgSsagnqW48WyRcAa3SGJevcpACCikkkj0AucRq6l8urgWATTM56U
         hDKTs9L3UZZPG7tBSGZBkAdHb9/fA7SmKIapeq7ddxBPYNZFAZEJbLQd5vaeZz9hXaV6
         9/aQ==
X-Gm-Message-State: AOJu0YzR2PtveIekrtl4EqpHzZE/CQaUlD0JrxPkWJTu7oo4XxhC1Br5
	S2tA2HgIFt3bAqysNtk75LqVzUlQ2J7ZwKizBkPyB5YGabZQ9xZRkaPJ+PLvejc=
X-Gm-Gg: ASbGncswz5M9XsmUoYlgoqoPD9PAKkm5SG/eAhrK+kWh83mJJ/LUsppz9LOa7wEpi6y
	DTJtmvWbvU6OShmDYfUcOe8FjZMLrCXGKAm11OWXMQlyJHgFVjEAgb6mtFJzhlP6C344FO39TkC
	P16n/gcdDTPqIhShkSHsgRYrg+5IhLMpbDDLCrE4lYS7eu9m0m1yhBr1zEnyI4KjNUJrWboXiTl
	qoXxAPsqtUpWEgaVMZ0M6n/rAK6/6XW09UL+G6QNVF9DNSwrU9P16wVA+Y+KBYWnni5/PYolblF
	RUBJulrq4UyQxcznmsXNwmB66VxbeKgBAQ/6tU7oTjAzj0S3uL4lEZcrTSeVQMGLtWhDTUkRv1Z
	DWOTSyiYuiPxqpC3P
X-Google-Smtp-Source: AGHT+IGOroAaR9Qg585JcAXkA6m60IqRpM0BlZ++V8a0YKEBStYmJTlIJJs2fWrkp3bsJV3TkxzKEg==
X-Received: by 2002:a05:6000:1ac7:b0:39a:c6c4:f877 with SMTP id ffacd0b85a97d-39d8f469231mr2345675f8f.20.1744294125745;
        Thu, 10 Apr 2025 07:08:45 -0700 (PDT)
Message-ID: <77f3421f-cc14-4f35-a8bc-f837c17dc2d7@citrix.com>
Date: Thu, 10 Apr 2025 15:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] Infrastructure for arm64 linux builds
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
 <20250410114628.2060072-6-andrew.cooper3@citrix.com> <Z_fM44HXEnpwa8q6@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_fM44HXEnpwa8q6@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 2:51 pm, Anthony PERARD wrote:
> On Thu, Apr 10, 2025 at 12:46:27PM +0100, Andrew Cooper wrote:
>> diff --git a/images/alpine/3.18-arm64-build.dockerfile b/images/alpine/3.18-arm64-build.dockerfile
>> new file mode 100644
>> index 000000000000..b6d9bd1af531
>> --- /dev/null
>> +++ b/images/alpine/3.18-arm64-build.dockerfile
>> @@ -0,0 +1,27 @@
>> +# syntax=docker/dockerfile:1
>> +FROM --platform=linux/arm64/v8 alpine:3.18
>> +LABEL maintainer.name="The Xen Project" \
>> +      maintainer.email="xen-devel@lists.xenproject.org"
> I though we were repeating the "LABEL" on each line these days, to avoid
> the backslash at the end of the line. ;-)

Oh right.  I'll fix.

>
>> +
>> +RUN apk --no-cache add bash
>> +
>> +RUN bash -ex <<EOF
>> +      adduser -D user --shell bash
>> +
>> +      DEPS=(# Base environment
>> +            build-base
>> +            curl
>> +
>> +            # Linux build deps
>> +            bison
>> +            findutils
>> +            flex
>> +            openssl-dev
>> +            perl
>> +      )
>> +
>> +      apk add --no-cache "\${DEPS[@]}"
> If I take one example from xen.git, we don't escape the $ and it's just
> "${DEPS[@]}", is it because the script is run with:
>
>     RUN bash -ex <<EOF
>
> instead of
>
>     RUN <<EOF
>     #!/usr/bin/bash
>
> ?
>
>
> As for the rest of the patch, it looks fine to me. I don't know if the
> change to the build config are necessary but they looks fine.

Ah, I meant to look at that and forgot.  This was started from the x86
container already in test-artefacts.

But yes, we want to do this the way xen.git does, with a set -eu too.

>
> With the LABEL repeated on each line:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

~Andrew

