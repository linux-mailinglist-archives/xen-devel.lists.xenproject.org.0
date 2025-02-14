Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A37A36052
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 15:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888858.1298142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiwcu-0000P3-6b; Fri, 14 Feb 2025 14:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888858.1298142; Fri, 14 Feb 2025 14:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiwcu-0000Ma-3t; Fri, 14 Feb 2025 14:25:08 +0000
Received: by outflank-mailman (input) for mailman id 888858;
 Fri, 14 Feb 2025 14:25:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vTB=VF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiwct-0000MU-4T
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 14:25:07 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bf2258b-eadf-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 15:25:05 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4396a82daf5so5320425e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 06:25:05 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f208sm76559295e9.6.2025.02.14.06.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 06:25:04 -0800 (PST)
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
X-Inumbo-ID: 7bf2258b-eadf-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739543104; x=1740147904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NQgD3D60ZisPIM4d1cACCq/0XM7+fhDehTgDmkTr4xk=;
        b=ca9NLYLLfJXEotWRgjz7n+MZXMAtDxlzPhp1N1kdPLwOV+uXogJbQ5ZIEj3kGYCeZS
         8XSkJtdpsbdUWnOCpjR05QTHT2QvjENyJrwUhWtTWniYHf6OfJUz9xY5YgOSNpTd3sND
         31Q4ghGrHvQY+pOVfuQZIvS6GklYETc8PIho0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543104; x=1740147904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQgD3D60ZisPIM4d1cACCq/0XM7+fhDehTgDmkTr4xk=;
        b=ue+aF13rnEQNnifdkGtbNofjkVcYxdPveiFpjb0+SCMPpHKiIBbKkAwL3zJJ5Beuay
         Z/qUsCQcHW++e0OyRxV4p3vTbwbs2Lai0ZzR25aJeprrOAHOJWQAriW6BB9AZVzg6v1A
         FipplIYYZbDGUNU3yVLTJtRY77xGLVeykbq/PZ3VRIZ3mM91myeFCuau2HqlPs+xFVuM
         cVLEsdOgRflfSAlFa/tkocZxEuRs9gHcayklYxfPsouQFQw9i7wW6pfcsOBlENeWVUgr
         SXfQJ/ef6WS8BP+Q/0pbwzV9TV6IYIWVYfDQdDd8NWtPOJDhnVTdKSIwQySB//7a12N/
         kDIg==
X-Forwarded-Encrypted: i=1; AJvYcCWJszdYCCFeU9AG0QEzSLOpm38HUtxhMKjAHI3cKtWDVdVrqiA7ryi+pF3mi+vmvmclDiff1sQbOfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtVG6plDstFt84YGn68SZ2FPAA2COa9iUqns8MnMPf2mEWl5Rz
	khO9jKCm//PcV/JMS1RahrT5naRI/r5Kw/UeHh3I5QCpbO0VP811KmhwGty/Wnzn1uYD1byDQLj
	O
X-Gm-Gg: ASbGncvcJ8z39Llf1XyQQ96FKXbs/aK0XQ3vFN4FfZmasBvBdiEEnRvoXRncjPMMgti
	XomA8rJuy35MXuNK6Xre4HzDtnVo9JeqZSQSHQrankjNcfxhWHoDhhio9BlUMXMNjLD6GWQOJ6W
	61eP9hyMbDsjRipASMYHtGxlUe/k/O9vuV4Y/EMUWL+Gk2AKYRpJgxpZQFpoiGfX8wavxKWW6lr
	NEnftTdHtw45sLG2/zt/LSFRXczZNVSg6BqaUGFEdGSeayXIY7Z1nQkZ3VEzci6UIjZ0TfG0mdx
	e1wjfvt6jtGJI5GorR9Dettw
X-Google-Smtp-Source: AGHT+IHFhP38TDCyTh1Dt4lXsUW+8o0t2KAZRxvH8rRbw7SIU4DhAB5alfx3EMMAKs2d7l1RD/CcPg==
X-Received: by 2002:a05:600c:3d99:b0:439:614b:1c15 with SMTP id 5b1f17b1804b1-439614b1f2emr92005795e9.13.1739543104573;
        Fri, 14 Feb 2025 06:25:04 -0800 (PST)
Message-ID: <a3e9f238-2a19-4015-8443-113f22ffbbf7@citrix.com>
Date: Fri, 14 Feb 2025 14:25:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix iomem_ranges cfg in map_range_to_domain()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Julien Grall <julien@xen.org>, Grygorii Strashko <gragst.linux@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250214125505.2862809-1-grygorii_strashko@epam.com>
 <deb84d7f-d335-4976-9f5f-6a5fa74b386e@xen.org>
 <e5c63216-d22f-429c-b6c3-082e0984a9a3@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e5c63216-d22f-429c-b6c3-082e0984a9a3@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2025 2:10 pm, Grygorii Strashko wrote:
>>>
>>> For example, requested range:
>>>    00e6140000 - 00e6141004 should set e6140:e6141 nr=2, but will
>>> configure
>>> e6140 e6142 nr=3 instead.
>>
>> I am not sure what 'nr' is referring to here.
>
> Sorry, will change to "num_pages"?

I agree Xen needs to be better (and by that, I mean consistent and
clear), but there are subtle bugs with most approaches like this.

Any exclusive bound, as well as counts like this need $n+1 bits of
arithmetic when you want to describe the boundaries of the space.

There is also a boundary condition for counts.  What map_foo(x, 0) mean?

Real hardware uses "last" for describing boundaries (x86 specifically
calls this "limit" in the ISA, but it's a trick used by other
architectures too).  Unlike "end", it's clearly an inclusive bound.

Personally, I'd like to see Xen switch to "start, last" pairs.  It's
unambiguous and has fewest boundary cases.

~Andrew

