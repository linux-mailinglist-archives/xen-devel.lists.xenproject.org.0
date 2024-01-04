Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B344C8243E2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 15:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661825.1031555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLOnO-0005PL-Hx; Thu, 04 Jan 2024 14:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661825.1031555; Thu, 04 Jan 2024 14:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLOnO-0005MT-Er; Thu, 04 Jan 2024 14:34:06 +0000
Received: by outflank-mailman (input) for mailman id 661825;
 Thu, 04 Jan 2024 14:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSyo=IO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rLOnN-0005MJ-EY
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 14:34:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3451d3ff-ab0e-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 15:33:19 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso473319f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 06:33:19 -0800 (PST)
Received: from [192.168.86.29] ([90.242.36.164])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d400f000000b0033662fb321esm33068774wrp.33.2024.01.04.06.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 06:33:18 -0800 (PST)
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
X-Inumbo-ID: 3451d3ff-ab0e-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704378798; x=1704983598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdLWVidecd4pqMf0ialDaWCHom88oN+zLUYeachWikY=;
        b=c1GO43n8fyAZanMUdeS3CzUdD9KiewOHOJnpwChBWrAXiSzMG+eEkrYlxnfHzkxlQy
         23GjjWQcBPqF6tCo5nps5At/eH0IM54sTcozxLv4JIhsAdpi6q0cGPEHKox+or4au4Cb
         J33S5poCUDgUDAcaQMRXQK6JX0ckR+l7+3+p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704378798; x=1704983598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdLWVidecd4pqMf0ialDaWCHom88oN+zLUYeachWikY=;
        b=bDC5qcsCeeXN5ltqqk85j1qfXV7tDYtdPp/3XfATXdlRC89W0U2CdrFtda4wb9DULy
         ptPJKzoMTZDTdu7woIkOXG/pqZs5Ne8JcvoCC2s7aMSWiI+FYxJ8zUa3sUX4wJKstwdf
         qOcjLPVXF8he/NDgKXccsAVBWzdwDApH44is6Ttu/ffnMV/0RgVVTW1gBJGNZbbFdnfw
         AIxaKUsydqTOXlBYpVNCP4Bbc8nZBJ4B5Cdw0wKzsgrZ8vtmRcC5agEYDiJnSbDOeRvR
         04P//YgDoTMLajJ0XFk4Pbcj9euWsKZZlzqucNW2/mQJmEHPkvaIAUodj0v4cq8l4Bj6
         6IWQ==
X-Gm-Message-State: AOJu0YylU2UI2HovJlSQWARY3fSmLdre3BFqhomqqriXwPDiv9Kv2WZj
	XfIu1adWLoUq+fEvU0qgDeYiWjdY3l5xrw==
X-Google-Smtp-Source: AGHT+IFYEzXB/bjpfy6TJUyBflrImP8LFKWzGO+44MEIddFFbjJsV8GngFEa1IWvzdZrSu0xk0NLQw==
X-Received: by 2002:adf:ed8c:0:b0:336:d9ca:5c6c with SMTP id c12-20020adfed8c000000b00336d9ca5c6cmr411705wro.137.1704378798676;
        Thu, 04 Jan 2024 06:33:18 -0800 (PST)
Message-ID: <7d35a648-a69b-4dfb-bf4f-d30272df5e9b@citrix.com>
Date: Thu, 4 Jan 2024 14:33:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
 <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/01/2024 1:41 pm, Jan Beulich wrote:
> On 28.12.2023 20:39, Andrew Cooper wrote:
>> The use of uninitialised data is undefined behaviour.  At -O2 with trivial
>> examples, both Clang and GCC delete the variable, and in the case of a
>> function return, the caller gets whatever was stale in %rax prior to the call.
>>
>> Clang includes -Wuninitialized within -Wall, but GCC only includes it in
>> -Wextra, which is not used by Xen at this time.
>>
>> Furthermore, the specific pattern of assigning a variable to itself in its
>> declaration is only diagnosed by GCC with -Winit-self.  Clang does diagnoise
>> simple forms of this pattern with a plain -Wuninitialized, but it fails to
>> diagnose the instances in Xen that GCC manages to find.
>>
>> GCC, with -Wuninitialized and -Winit-self notices:
>>
>>   arch/x86/time.c: In function ‘read_pt_and_tsc’:
>>   arch/x86/time.c:297:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>>     297 |     uint32_t best = best;
>>         |              ^~~~
>>   arch/x86/time.c: In function ‘read_pt_and_tmcct’:
>>   arch/x86/time.c:1022:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>>    1022 |     uint64_t best = best;
>>         |              ^~~~
>>
>> and both have logic paths where best can be returned while uninitalised.
> I disagree. In both cases the variables are reliably set during the first
> loop iteration.

I suggest you pay attention to the precision of the integers.

It is hard (likely prohibitively hard) to avoid entering the if(), but
it is not impossible.

The compiler really has emitted logic paths where stack rubble is returned.

> Furthermore this initialize-to-self is a well known pattern to suppress the
> -Wuninitialized induced warnings, originally used by Linux'es
> uninitialized_var().

I'm glad you cited this, because it proves my point.

Notice how it was purged from Linux slowly over the course of 8 years
because it had been shown to create real bugs, by hiding real uses of
uninitialised variables.

I'm honestly surprised that it hasn't come up yet in the MISRA work.

>  If we really want to use -Winit-self (and hence disallow
> use of this pattern even in cases like the ones here, where they're used to
> suppress false positive warnings), this should imo be done separately from
> adding -Wuninitialized, and only after proper weighing of the pros and cons
> (a wider Cc list would be required anyway for the xen/Makefile change).

There are exactly two uses of this antipattern in the entirety of Xen. 
They are both in x86 init code.

Do you honestly think trying to block a patch this clear and obvious is
going to be a good use of anyone's time.

>
>>  In
>> both cases, initialise to ~0 like the associated *_min variable which also
>> gates updating best.
> Considering the affected functions are both __init, this change isn't a big
> problem. But if you were truly concerned of the one theoretical case, you
> can't get away with this either: If the variables really remained unwritten,
> by returning ~0 you'd end up confusing the caller.

The fact this is a crap API design doesn't make it ok to use undefined
behaviour.

Getting ~0 back is strictly less bad than getting stack rubble because
at least it's obviously wrong.

~Andrew

