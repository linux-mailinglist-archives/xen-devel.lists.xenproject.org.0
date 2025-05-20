Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6AABCEB8
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 07:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990416.1374359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHFme-000711-1X; Tue, 20 May 2025 05:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990416.1374359; Tue, 20 May 2025 05:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHFmd-0006xu-Sf; Tue, 20 May 2025 05:44:59 +0000
Received: by outflank-mailman (input) for mailman id 990416;
 Tue, 20 May 2025 05:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHFmb-0006xn-Nh
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 05:44:57 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f3d1832-353d-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 07:44:56 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so896766166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 22:44:56 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d497a0fsm694134866b.140.2025.05.19.22.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 22:44:55 -0700 (PDT)
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
X-Inumbo-ID: 8f3d1832-353d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747719896; x=1748324696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lplm/kvflBzm80700I6ugxByOv4loEqZk1jZby8oAYc=;
        b=HtdlHf2m+GXtXtAic/0nZ7Dd6KsPqrh7N0IL4u2MrBx43l1BaD1wj/Is6y1yN3hHl8
         qmBC8nHkwFZqIrQOALu6Uf+JHfxbvHgBj8DOzzzLFocachChWLLwnxB9g6SLmogBlJQR
         Lh/vqLIRamsMcTMmMEK1BifBSlznyI35fEXNQDfoE8/L32mA45iPjRev7hejoxscfCAN
         74vB93lx94hzGRahSI8+bqXZpAlEB0xOIsUa38hDTGfKLgcu+XsdYpNMixWw7E2Kt0fy
         ySqJWdnvCwvSEEcUUx0J8Ae3zbLSbKJxdBExp6x8lchvsOFUW1xGwK75BOuvq6ZM+bHt
         eT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747719896; x=1748324696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lplm/kvflBzm80700I6ugxByOv4loEqZk1jZby8oAYc=;
        b=weH/rvRJ6820RRDFahd/ZHgYYu31xa7d71jCclGrVRDjVVylRrByD7J+DzfMJg3uq+
         kO0d3fwpr9eQ04FyFLxrd22G3N26RJh2+Ri5DQbTM8/vFuFSTxvmhoKYPOwmQjNWQ8b1
         rQRYliiG44wqa6ASm6IsDvRTGoXpLsYjVFPoFbwh5qOcGsBms3qnbGkCl2MR+Zdw6Y2j
         x+n3EqqJfcZuJ2KywxHXsMTF96s97NXKj/ZUEiMZdVShbEDMLEug/P/RcxSlt+AyrVc2
         GZANQ06vi0oGl0xMpE0kcmmf5lR0nvgm1xg0TBDJtZfGtbxxzBCU6NCB8NTdYKTK81CV
         nzPA==
X-Forwarded-Encrypted: i=1; AJvYcCX5JleMpYfu15GaBaUKGRcA8NCFp9KpdtU57W/wAVBuDjYtSp7fK077Kz+qjAU+A1+m0OdM9PpUc/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXCaM+pWwbxNoLZLIjxNr9QPNP18Ahr4tCJFwxBFgNgCaLsafN
	RGXaROyeye88uZ1DL1NcnXfbCH37ENzJ74pYoN71RoIw9KS5dxEyJoLkIJigDDHhzQ==
X-Gm-Gg: ASbGncvEIY59LuweH2AvGj8v/oK1al3ys0i2ySNiF9nlu2bhYqpN0ZmdcWXfllUdK1R
	6gBXHJ5p7Jpnob6VB8bdfFnP7MHDpPS2PbfNUHTKw06OuIvnwtTdIxp3vZynJDj3JYOZ0dI8yYB
	6moyEzAGlu903ntzi7qKNW/Y/Xp7FDYwDW1WcFx73ToSXed69hkIFYsFL0XP69yPoD/AQKS2Eso
	9X+symeeBrTvNntYH2jU+s8ahRwPqHo8LETy2nrkk6iwbFpPaFQlwGjrOkMxxG9p1+Lgos+LlS+
	fnNP/lZQv9tWkJ2OvnmDqo+I5ayiw9vAbYr0JyHmKoEIPtlDck/dBjOo0hCOwQ==
X-Google-Smtp-Source: AGHT+IFDrDn6+xrMicgtTOYGGIWeBTzMYLZv1ytU3zEXjueNgq6u0EHrZQh+U7xBkQXFClA4EL9qmw==
X-Received: by 2002:a17:907:1b1f:b0:ad5:1fe2:d392 with SMTP id a640c23a62f3a-ad52d50f9c1mr1346190166b.29.1747719895810;
        Mon, 19 May 2025 22:44:55 -0700 (PDT)
Message-ID: <4b580922-4aac-44bc-ad14-75a250ac7962@suse.com>
Date: Tue, 20 May 2025 07:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Give compile.h header guards
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250519135227.27386-1-andrew.cooper3@citrix.com>
 <a967e60c-0474-46ac-87c0-d1d6ce5ce289@suse.com>
 <alpine.DEB.2.22.394.2505191431140.145034@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2505191431140.145034@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 23:34, Stefano Stabellini wrote:
> On Mon, 19 May 2025, Jan Beulich wrote:
>> On 19.05.2025 15:52, Andrew Cooper wrote:
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Is this to please Misra in some way?
>>
>>> --- a/xen/include/xen/compile.h.in
>>> +++ b/xen/include/xen/compile.h.in
>>> @@ -1,3 +1,6 @@
>>> +#ifndef XEN_COMPILE_H
>>> +#define XEN_COMPILE_H
>>> +
>>>  #define XEN_COMPILE_DATE	"@@date@@"
>>>  #define XEN_COMPILE_TIME	"@@time@@"
>>>  #define XEN_COMPILE_BY		"@@whoami@@"
>>> --- a/xen/tools/process-banner.sed
>>> +++ b/xen/tools/process-banner.sed
>>> @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
>>>  
>>>  # Trailing \ on all but the final line.
>>>  $!s_$_ \\_
>>> +
>>> +# Append closing header guard
>>> +$a\
>>> +\
>>> +#endif /* XEN_COMPILE_H */
>>
>> This split of #ifndef and #endif is ugly. Can't we switch to something
>> more conventional, like
>>
>> #define XEN_BANNER		"@@banner@@"
>>
>> with the first sed invocation then replacing this by the result of
>> a nested sed invocation using process-banner.sed (which of course would
>> need adjusting some)? (Maybe the double quotes would need omitting here,
>> for process-banner.sed to uniformly apply them.)
> 
> While I agree with Jan that this is kind of ugly, it is a unique case
> and I would prefer an ugly but simple solution than a more complex
> solution. This would be different if we were talking about a widespread
> pattern, in which case the price for complexity would be worth it.
> 
> My 2 cents in this case are in favor of the simplest approach. I would
> ack this patch.

Feel free to do so; my comment was not meant as a plain objection, but more
as a suggestion. The one thing I would ask for is a non-empty description,
though.

Jan

