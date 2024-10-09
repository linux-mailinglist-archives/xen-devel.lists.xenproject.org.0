Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97D996D5E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814593.1228180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXQU-00012X-O0; Wed, 09 Oct 2024 14:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814593.1228180; Wed, 09 Oct 2024 14:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXQU-00010b-LI; Wed, 09 Oct 2024 14:12:30 +0000
Received: by outflank-mailman (input) for mailman id 814593;
 Wed, 09 Oct 2024 14:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XgrK=RF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1syXQT-00010V-IF
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:12:29 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8412915f-8648-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:12:28 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9977360f9fso241909666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:12:28 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9957d955f8sm399053866b.74.2024.10.09.07.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 07:12:27 -0700 (PDT)
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
X-Inumbo-ID: 8412915f-8648-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728483148; x=1729087948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ivqGq4ZbsDUPBOpiZRVNGy20gXTLQG1ggg18TyuLccg=;
        b=nRu7p6VBxPkenTfLiL+zr/hUGL5mSYT6MXxb0Wj6mYhClkxvl+YrJ5lvqRlSnf4UZ2
         M5HOEWQ7aS8zGyp6yye3T9sN5Z0kI8EbnJ+C7bN5iw1wIpCNte9qC0MjPOetSttT0XpI
         UfFpQan3Ouh4KXMf5d8A7C2G5RPKNm7DCLwYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728483148; x=1729087948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivqGq4ZbsDUPBOpiZRVNGy20gXTLQG1ggg18TyuLccg=;
        b=OpI8QcT+Q3/nVTht6ca0DT9sNrSdzvCIxLqmdnpoMIc9X4kJOxx9KcB2CIfhOPeUHT
         9fFtd+HvcQ33cVdgqQ7AnAD3qnHzzpd9KE9F6O0YAh4R6LnXoCPbkDdg1sAFFJjKE3XQ
         wFMnS35ZfTH5BYtwTnlciaSxU6QOPT7B0yrGldNOiKmSiQwa62bIHqydGZ/EG4vjTN/d
         OWWSC5DxD7zQ4oRs/oQIFAj3lN6mcFvslLPmK6HSVRm/NU1bEMQQuCFoapyUDYVlhJT0
         N+4LbPBnc9NtMsvOQNe3IABi3eM5bVcSYJiDYvoCJoRKJAy9kIhqXyK1JSiWEp9scE4B
         uWuw==
X-Forwarded-Encrypted: i=1; AJvYcCX3rLi0DMtpamxdJII7DZAXWtbgfe+pe3InYewn2wzWcsOcZf+/nWM0rPIUnIQlkX3IIQf6Kafzsd4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzr20WWJYIZ1Uz5CZoW3Cd2jItOwo+U/9D4bNui5E/HtURII/eV
	d2C0ME+qFahlUS0df3+E38mAUaZIhS0q8iZgFBn5C5bChVCpGkzxCFAXqcESrWGpOAOnU+HvRxQ
	9Lvo=
X-Google-Smtp-Source: AGHT+IGe93FJOqQNUFCsHjVoG5ZisCvqFp4EVGWIPTqIIIJsXTv0KglGYG0kkf3tcxbiYv8SFAo9GA==
X-Received: by 2002:a17:907:efe4:b0:a99:5cd5:5b9c with SMTP id a640c23a62f3a-a998d208d97mr239537666b.36.1728483147733;
        Wed, 09 Oct 2024 07:12:27 -0700 (PDT)
Message-ID: <2019d667-bd5f-45f5-9a1d-ed170f25fee5@citrix.com>
Date: Wed, 9 Oct 2024 15:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: restore semicolon after explicit DS prefix
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cdf93d64-dcc0-4e01-88fe-71145ffff1ff@suse.com>
 <8f85c4d2-805b-43ed-926e-732382b7e6b9@citrix.com>
 <7f3229e9-43c1-48f7-9921-ce826c7c19c0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7f3229e9-43c1-48f7-9921-ce826c7c19c0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/10/2024 7:04 am, Jan Beulich wrote:
> On 08.10.2024 18:37, Andrew Cooper wrote:
>> On 08/10/2024 5:00 pm, Jan Beulich wrote:
>>> It's not unnecessary (as the earlier commit claimed): The integrated
>>> assembler of Clang up to 11 complains about an "invalid operand for
>>> instruction".
>>>
>>> Fixes: b42cf31d1165 ("x86: use alternative_input() in cache_flush()")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/flushtlb.c
>>> +++ b/xen/arch/x86/flushtlb.c
>>> @@ -286,7 +286,7 @@ void cache_flush(const void *addr, unsig
>>>           * + prefix than a clflush + nop, and hence the prefix is added instead
>>>           * of letting the alternative framework fill the gap by appending nops.
>>>           */
>>> -        alternative_input("ds clflush %[p]",
>>> +        alternative_input("ds; clflush %[p]",
>> /* Clang-IAS < 12 needs the semicolon */  which can probably fit on the
>> end of the line.
> I've made it "Semicolon for Clang-IAS < 12" to actually fit on the line.
>
> I wonder whether I can take the reply as "ack with that change"?

Yeah, that's good enough.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
>> Or we stop supporting such old versions of Clang/LLVM.
> As indicated in reply to Roger's proposal, that would leave me without
> any way to test with at least some Clang versions (unless I got into the
> business of also building my own Clang binaries).

Or using the upstream provided builds.  (Seriously - this is something
the LLVM community completely outshine the GCC/Binutils community.)

Or using Gitlab CI.

~Andrew

