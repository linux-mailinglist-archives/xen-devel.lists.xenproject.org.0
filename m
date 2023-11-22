Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D77F534E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639222.996276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vaU-0002lM-A0; Wed, 22 Nov 2023 22:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639222.996276; Wed, 22 Nov 2023 22:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vaU-0002ib-66; Wed, 22 Nov 2023 22:20:50 +0000
Received: by outflank-mailman (input) for mailman id 639222;
 Wed, 22 Nov 2023 22:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5vaS-0002Py-Bn
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:20:48 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62bead5e-8985-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 23:20:47 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso1648995e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 14:20:47 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c3b8600b0040b2ab2b352sm3196123wms.1.2023.11.22.14.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 14:20:46 -0800 (PST)
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
X-Inumbo-ID: 62bead5e-8985-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700691647; x=1701296447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9raULir2dgben/YcbJbK6kGZC9HhCFlRoGO7hdozqU=;
        b=IlcoBQ0mum4KXsKNJFaJZbQen3aR+BL5Y+ycHGf3u1wMbY9Nkc12ZSFH/G5vPDmJmr
         qiq/MQZfqe9ETlTShuQD5bfNFkDb0mvxkOmhxmxw7zQSIBBVNrPC9qGqWmP95W2AW1PR
         Sp03m1ertmuVDESzLjoR5WTZDbY6WLlrt0fhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691647; x=1701296447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9raULir2dgben/YcbJbK6kGZC9HhCFlRoGO7hdozqU=;
        b=Q3xcSM88LMuBUhT62PblriXlENCj4M/PSgD/cwhNuBmm7D8qOzoASco0/jQZ7wEyW1
         iPr+qFxylYhP0gopbTrnXIuV9MzQgZkYOjGMRQZUdI2PrGu2+XfBkmzlNs/kUeGsfKPO
         HQjesUJIJadxgFj9JYGuaLLmzLkCac3cOtlKswnIoNJuE1yDhu1Bg0ZepzHZri+zEmyk
         NYFwFaxtvlLyGGSW4YbF5I50NIjoTOFABn0KoDVSpwXdRkKDHIxbVxt4Pos0U/M2cQzW
         cUQzN0//8Z98kDf4kbymmhG4NBcGm64HEOn5QKZLPLTY+H10Zt3o70FNhqbEJfN5YFni
         BU9w==
X-Gm-Message-State: AOJu0YzhQZOpD2iva2oi9HltfBluSAJCS3AqbvUqP42ZkJ1yRS5PcFvk
	wlV2z6G9jsGUA4rzfhI3BErP1w==
X-Google-Smtp-Source: AGHT+IEIDzfYZyvLRJngoDKTg72mL5JQ8tMRHSxsJWqNelaYyFSx5p/Hi34kJLdeh24dUTiSRo8lPw==
X-Received: by 2002:a05:600c:1550:b0:405:3a3b:2aa2 with SMTP id f16-20020a05600c155000b004053a3b2aa2mr2707033wmg.37.1700691647126;
        Wed, 22 Nov 2023 14:20:47 -0800 (PST)
Message-ID: <2c7d33e8-9605-4ff6-ac23-fda43ae69199@citrix.com>
Date: Wed, 22 Nov 2023 22:20:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/MISRA: Remove nonstandard inline keywords
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
 <20231122142733.1818331-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2311221410400.2053963@ubuntu-linux-20-04-desktop>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2311221410400.2053963@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/11/2023 10:13 pm, Stefano Stabellini wrote:
> On Wed, 22 Nov 2023, Andrew Cooper wrote:
>> The differences between inline, __inline and __inline__ keywords are a
>> vestigial remnant of older C standards, and in Xen we use inline almost
>> exclusively.
>>
>> Replace __inline and __inline__ with regular inline, and remove their
>> exceptions from the MISRA configuration.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
>> index 2866cb191b1a..b7c2000992ac 100644
>> --- a/docs/misra/C-language-toolchain.rst
>> +++ b/docs/misra/C-language-toolchain.rst
>> @@ -84,7 +84,7 @@ The table columns are as follows:
>>            see Sections "6.48 Alternate Keywords" and "6.47 How to Use Inline Assembly Language in C Code" of GCC_MANUAL.
>>         __volatile__:
>>            see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
>> -       __const__, __inline__, __inline:
>> +       __const__:
>>            see Section "6.48 Alternate Keywords" of GCC_MANUAL.
>>         typeof, __typeof__:
>>            see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
> Asking the Bugseng guys as well, do we need to add to
> C-language-toolchain.rst:
> inline __attribute__((__always_inline__))
> inline __attribute__((__gnu_inline__))

__attribute__ itself is in the list of permitted non-standard tokens, in
both files.

However, neither file has anything concerning the parameter(s) to the
__attribute__, and we do use an awful lot of them.

If they want discussing, then that's going to be a lot of work.

> Given that the problem was also present before this patch:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

