Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A481B389
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658780.1028142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGHz-0006SY-4K; Thu, 21 Dec 2023 10:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658780.1028142; Thu, 21 Dec 2023 10:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGHz-0006Q7-16; Thu, 21 Dec 2023 10:28:27 +0000
Received: by outflank-mailman (input) for mailman id 658780;
 Thu, 21 Dec 2023 10:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxSo=IA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rGGHx-0006Q1-BH
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:28:25 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab215ac5-9feb-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 11:28:23 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cc8fd5d54bso6662571fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 02:28:23 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c4fd400b004094d4292aesm2753820wmq.18.2023.12.21.02.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 02:28:22 -0800 (PST)
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
X-Inumbo-ID: ab215ac5-9feb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703154503; x=1703759303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpZpNXw9N6hDkx+/uTJfWExFLw7rUF2tLqSwFz8pVuw=;
        b=OfPqcNrkvcYqzK2HKA13NeLF3PmotyCKy6pY6Lsgij8ceJ5Qrq9GJDxoqg3br9z0rU
         hHpbn+fSC2PLq3GT9+JOdDcgSuBkqvkkDSmI4kGqazqadcL3GUF3xh8nyi/qxJxDliDA
         SmrBDwNriH6tjFs29tMFmV+4vSso1wl71lIww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703154503; x=1703759303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpZpNXw9N6hDkx+/uTJfWExFLw7rUF2tLqSwFz8pVuw=;
        b=KIDmteEdhRql9pzrq27/S1COVFXIBP11TVj3mcH5WJL/rIRcFZpRZeb1rEPU/g/iWW
         qK2Glq3o65HXNon0N2exsqKnGJMCkxHjBU7ElTCKOGZHcIpmR+iflaRZB1BXFj2wfc/1
         UzZHS7ZV6ZIoSBvoHtp/5Wf45qTGW3KeWc+S9juCyw17wgqIrgO4tJny9/pb8xiBt/TV
         hwuSaRm8il1+Gyhs+jaCvYrQAPLUDK3lHaCvwqYqaNDft1lCI/AI6vxirBWMXmNmwJeL
         8CGHda1umpdIoy/mXP9FpjCL2AvTAGsbP+CwzbsCY3LCCqBY9K8nvXG/gtYp+7RYv66L
         IC0w==
X-Gm-Message-State: AOJu0YxO9yuO99pXtUr1pmJ8MPhvpzok+YELJ2Y7Stx2oY4yAVFYScPx
	I1Xs3bDeE782wQwRuYpsDifXaA==
X-Google-Smtp-Source: AGHT+IHQIaDxIdrul9O5W278h+bP/b+aA73QZj6kkpIbcwb+8bAfnI5e9hdPjDjk9aSNc4J9AwuxWA==
X-Received: by 2002:a05:6512:ac8:b0:50e:2a3a:19e9 with SMTP id n8-20020a0565120ac800b0050e2a3a19e9mr6105234lfu.60.1703154502904;
        Thu, 21 Dec 2023 02:28:22 -0800 (PST)
Message-ID: <71f638d1-1037-4170-a345-0ea0a0573fc3@citrix.com>
Date: Thu, 21 Dec 2023 10:28:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xmalloc: XMEM_POOL_POISON improvements
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231220214716.2510402-1-andrew.cooper3@citrix.com>
 <38dfe5ac-790e-4479-b7a8-ab3d5d0d0db2@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <38dfe5ac-790e-4479-b7a8-ab3d5d0d0db2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2023 9:51 pm, Julien Grall wrote:
> Hi Andrew,
>
> On 20/12/2023 21:47, Andrew Cooper wrote:
>> When in use, the spew:
>>
>>    (XEN) Assertion '!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE,
>> POISON_BYTE, (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE)' failed at
>> common/xmalloc_tlsf.c:246
>>
>> is unweidly and likely meaningless to non-Xen developers.  Therefore:
>>
>>   * Switch to IS_ENABLED().  There's no need for full #ifdef-ary.
>>   * Pull memchr_inv() out into the if(), and provide an error message
>> which
>>     clearly states that corruption has been found.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> With one remark:
>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.  Will fix.

~Andrew

