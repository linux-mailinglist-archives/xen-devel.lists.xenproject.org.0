Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB9F7FEE7E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 13:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644592.1005781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8flX-0004E4-1t; Thu, 30 Nov 2023 12:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644592.1005781; Thu, 30 Nov 2023 12:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8flW-0004CK-U4; Thu, 30 Nov 2023 12:03:34 +0000
Received: by outflank-mailman (input) for mailman id 644592;
 Thu, 30 Nov 2023 12:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Ek5=HL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r8flV-0004C9-65
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 12:03:33 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a2ca300-8f78-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 13:03:30 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-332e56363adso566292f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 04:03:31 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r4-20020adff104000000b003313e4dddecsm1357473wro.108.2023.11.30.04.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 04:03:30 -0800 (PST)
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
X-Inumbo-ID: 7a2ca300-8f78-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701345810; x=1701950610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E83uc5LUEmAXslUDI82DfKLoZovORzP7/GpfLnQtcEM=;
        b=UzqNWFSwYJxGAfAURJiXHsHeFzXLAuX8VU7cHcr2fq5JXGq1a+NcpKEABynrh/HMzA
         niQzILlRCbLN2TWP7vWt4wnIVRm0vHFoID7McVCuNFUtUa/IqIGJvtypdnvO1nshxs0n
         kDoALl0xWOZpmQ+lc3gVt+JmBYFcE0L2/gjqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701345810; x=1701950610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E83uc5LUEmAXslUDI82DfKLoZovORzP7/GpfLnQtcEM=;
        b=Ck8plZrjv0oPPdJS1m8BXpbl3azEQBnjIiw0onyiHIJLKHKvqHJkpH4tPQn475N1Wi
         3ZC667TFOlsVsFn+5oGU4/Qa6nmSXNrDLg1YR9TnS4e0wLhDKJyOjcXW6HpMqruaZDwP
         EzX46AtFz8ma3XqLT8t+fsIamO+06FIJ1USYOHBCNFUyGWUC3bknN/kSHTDLoOtmi4eW
         FASM5vXC6kgLuv50cdMrEIHJGjSerCjWg/Ci9M8iiEwyQ4qlbkp1O+Jxq2gqIXufmqKW
         2RVfZu0tH7UBlYlOctdlvxy0Kp4ejtUw9kvqXCLiKYyDJJrnhWTLzKu7Bm7A7Qza4jsV
         44aw==
X-Gm-Message-State: AOJu0YzD0TziA3F7hO3byH1WE/b0XDUhrWnzU5YjBABshjEqcb2l4STd
	3cFABhPx9794v70shbJFPPipsQ==
X-Google-Smtp-Source: AGHT+IHVJvb7c5NkdTyeSAo44EUttp3Pou1wuk4kxj6LvwByGEhYxOGvrVv07Nvu2SZ29sXAKFEJ6g==
X-Received: by 2002:a5d:46c8:0:b0:332:f578:8763 with SMTP id g8-20020a5d46c8000000b00332f5788763mr12436723wrs.58.1701345810609;
        Thu, 30 Nov 2023 04:03:30 -0800 (PST)
Message-ID: <62cf8ca8-e395-44b4-8fa9-8909393e1795@citrix.com>
Date: Thu, 30 Nov 2023 12:03:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/DMI: adjustments to comply with Misra C:2012 Rule 9.3
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
 <533b6aadb95ab767c9060d5a5ed7505f@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <533b6aadb95ab767c9060d5a5ed7505f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2023 12:00 pm, Nicola Vetrini wrote:
> On 2023-11-30 08:55, Jan Beulich wrote:
>> The rule demands that all array elements be initialized (or dedicated
>> initializers be used). Introduce a small set of macros to allow doing so
>> without unduly affecting use sites (in particular in terms of how many
>> elements .matches[] actually has; right now there's no use of
>> DMI_MATCH4(), so we could even consider reducing the array size to 3).
>>
>> Note that DMI_MATCH() needs adjustment because of the comma included in
>> its expansion, which - due to being unparenthesized - would otherwise
>> cause macro arguments in the "further replacement" step to be wrong.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course a question is how many of these DMI table entries are in fact
>> no longer applicable (e.g. because of naming 32-bit-only systems).
>> Subsequently the table in dmi_scan.c itself may want cleaning up as
>> well, yet I guess the question of stale entries is even more relevant
>> there.
>>
>> An alternative to using the compound literal approach might be to go
>> along the lines of
>>
>> #define DMI_MATCH4(m1, m2, m3, m4) .matches = { [0] = m1, [1] = m2,
>> [2] = m3, [3] = m4 }
>>
>> I've chosen the other approach mainly because of being slightly shorter.
>>
>
> From a MISRA perspective this resolves all but one violation: the
> initialization of static array
>
> ns16550_com[2] = { { 0 } };
>
> in drivers/char/ns16550.c. This is a case where the explicit
> initializer looks unnecessary.
>


Yeah.  That should just be ={}; which ought to resolve the violation?

~Andrew

