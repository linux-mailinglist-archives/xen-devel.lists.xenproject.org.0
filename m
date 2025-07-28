Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404D4B13968
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061320.1426840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLZw-0000d8-Lx; Mon, 28 Jul 2025 10:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061320.1426840; Mon, 28 Jul 2025 10:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLZw-0000bF-IE; Mon, 28 Jul 2025 10:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1061320;
 Mon, 28 Jul 2025 10:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugLZu-0000b9-U9
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:59:34 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1bed85f-6ba1-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:59:34 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso43557355e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:59:34 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458704aaf20sm156627615e9.0.2025.07.28.03.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:59:32 -0700 (PDT)
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
X-Inumbo-ID: f1bed85f-6ba1-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753700373; x=1754305173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bzRaFDxp2e7LoSXr8tAl6aPvcEDWA53IY13XM47+x68=;
        b=l84G1G3rh0+buJlQ5TgEDhttA5pXW+kaEHeolJL3nC9E7pbbagWkSx39uFtDvIV9VM
         9QZKgFg7GxT6o7DpAB/PxyOPA5Q36CQv4QHJTkNcF5+K5vG8GSa5l6YshyHIfMz3LZUq
         7okfNoEMe5eJpYeJPM4jIgAyA14pESkQGjBfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753700373; x=1754305173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzRaFDxp2e7LoSXr8tAl6aPvcEDWA53IY13XM47+x68=;
        b=JbmBrmLNDoyLFXYAlvpbRI7U5yL03qfOnxVEMGHNbIKj3BKXlPfXey7KX8Jp1d8fcz
         JFpCnMPvILMojMfDhJg2fJCvc1/znFI1kAKa+/5bJ7sQ0nMlJ88o68DbO35mCqv8LMoW
         E0Nv04M9UQQZpoP33ztPWWYf6539+WoIAM23Ov6UafMth6nXNvMHAd1QA2+EYnJlPGqN
         HYo8Q1ry1yrBw8f2osNCYGiHJMMcLXxB2fqeJFpMJ8DwGIhjU1o1uTP4L/fH9F2nF/ET
         q/WPEmSK8h84WSUSkrljrz4IAah2GGOT1WP6VZWJxV7WZGaS3ajiWDRcwBLUh0mpXQep
         c09w==
X-Forwarded-Encrypted: i=1; AJvYcCVJaLIYfHyhsTobQrCu4h3YCHyp95EYpbaB5LIfrOvZnN6OzA3k36YlrfgZ4FShtPIrwNdnbsEUGHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsSK7f/39jxYR0H1mH+CgRwtuBO41zTzV1GbQJ0fZ56ha7ah6u
	7ssYeyHwxsdWEfCLNlLbHx7sKrTPV5PMgO8YPDh8g8dANaRL5lWM5lBHSQeMjEkzdMw=
X-Gm-Gg: ASbGnctcqB8f77jHz8jRg1E663GOpYlVWS7o1ran8iGPEjNFYHp+9z4qc91JQ31TP/O
	sGJnUlHPQlEznMjMBBXEeJO7AMPhyHiy+oD4djQ2tUrZO4Fnu47OojLMYwTo87lZN5yxOmZ4ecK
	pnXX7iQ8G7ikyf+qHerj/f3cmXsAlIYl8xarenqQRCcFAt8fLCTv1rU1RX2caj6oJQo5uOUF3ZX
	+oB8O87pkxymsbh/VnATCJ7FdihuoEp5IMDemIOjQAipHO2G2EqYTdwAfMExHZZ67wDBa0usGz7
	w2ki2NFChKD8ZPUpMWR3ZPnonf56LYcfJZKKpJIkXwT+w8eqFR11aR0Q6HjrydaWlzfVKR+ReQo
	ECgFt15aZnDAZjqMYsKu3qfIwYwLen7cawid5RwIEK6Uxp4NeqpCbeSrXV7UynHboxkwe09oVxI
	ar6ms=
X-Google-Smtp-Source: AGHT+IEVrznbeJtBPFWO4oBk9BI0Qnvy9xwwWOQY7plV/oUNXtB7/d8wkT76y+gCPpV3j5OsPET8Jg==
X-Received: by 2002:a05:600c:c04b:10b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-458769ccbaemr65773975e9.30.1753700373265;
        Mon, 28 Jul 2025 03:59:33 -0700 (PDT)
Message-ID: <5b4106be-bca9-4c82-bd55-41ada84c3b1f@citrix.com>
Date: Mon, 28 Jul 2025 11:59:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Jbeulich <jbeulich@suse.com>
References: <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
 <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
 <4db06b93173be64963d8fca547f1f0e6@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4db06b93173be64963d8fca547f1f0e6@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2025 11:38 am, Nicola Vetrini wrote:
> On 2025-07-28 11:36, Jan Beulich wrote:
>> On 25.07.2025 18:24, Dmytro Prokopchuk1 wrote:
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -142,6 +142,31 @@ Deviations related to MISRA C:2012 Rules:
>>>         memmove.
>>>       - Tagged as `deliberate` for ECLAIR.
>>>
>>> +   * - R5.5
>>> +     - Clashes between bitops functions and macros names are
>>> deliberate and are
>>> +       needed for input validation and error handling, ensures that
>>> the size of
>>> +       the object being pointed to by 'addr' meets the minimum
>>> requirements for
>>> +       the bit operation, preventing unsafe operations on
>>> improperly sized data
>>> +       types that could lead to undefined behavior or memory
>>> corruption.
>>> +       The macros encapsulate this conditional logic into a single,
>>> reusable form;
>>> +       which simplifies the code, avoids redundant function call.
>>> +     - Specified macros should be ignored.
>>
>> At the risk of going too far with nitpicking: Who are "specified
>> macros" here? The
>> text doesn't mention any names. In fact, the way it's written it
>> could be taken to
>> mean all macros there, including any that are yet to be added. I
>> don't think such
>> is appropriate for a deviation.
>>
>
> I agree with Jan here. Either you make a single deviation record
> encompassing all deviated macros or you have one per deviation (e.g.,
> one for irq.h, one for grant_table.h and one for bitops.h) listing the
> macros that are considered. For bitops it might be a concern the
> actual functions going out of sync, but in that case you could just
> spell out the deviation and say "all pairs functions/macros in file
> <file> that are defined using the same identifier" or something similar.

Honestly, while these examples might be deliberate, they're also bad code.

I do not intent to let the bitops aliases survive the cleanup/fixes I
have planned, but I also don't have any idea when I'll get to that work.

What we really want to express is "these are begrudgingly accepted in
the short term.  don't copy this pattern, and if you can fix it, please do".

~Andrew

