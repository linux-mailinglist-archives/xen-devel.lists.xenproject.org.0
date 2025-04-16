Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB090A907FB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 17:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956431.1349853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5502-000084-VK; Wed, 16 Apr 2025 15:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956431.1349853; Wed, 16 Apr 2025 15:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5502-00005o-SX; Wed, 16 Apr 2025 15:48:30 +0000
Received: by outflank-mailman (input) for mailman id 956431;
 Wed, 16 Apr 2025 15:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5501-00005i-Cd
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 15:48:29 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bc98ff8-1ada-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 17:48:28 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso54878815e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 08:48:25 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405cd19213sm19415275e9.18.2025.04.16.08.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 08:48:24 -0700 (PDT)
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
X-Inumbo-ID: 3bc98ff8-1ada-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744818505; x=1745423305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JA/iiYvuE4MhjOEFEin68hG7JsxOohtHQMotwB2lQUI=;
        b=VQ+fNtzd+1EKW1cBzIEqEGFa0I/G46VrDZSt4ZJ1sODALIMRB3JZiUExUU8PvcgMHP
         CUE8T39P6xzoHkf+CYL3VbRJ0nNsoIcaD0xKkZoQRXMbkaDY6PEK6yyqPEoe5nZfzMpr
         g73qIfponYbrKjnLSWI4ds4ljdLRg7NfOm6gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818505; x=1745423305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA/iiYvuE4MhjOEFEin68hG7JsxOohtHQMotwB2lQUI=;
        b=mE4gnQBcrDYW/5YnLJ3VApZ/bOJ7nzSOcrzxotJ/6NxPrltjpW7Md9QpXE9Dxn58e0
         lNsivoQjVK+OO9NdvTRxBGUtu+UVZYcIV3Mr3HCrMKuhJNDUkruPqauwrPo8dVA6zqgO
         pVDG4o9GFyYrBnl8UDzgCMzO0IlBzqVjEo0VQIzjtiYSwa1WFqE/YLlVvT7Ru6Q1DGJX
         wVFEnfiTr0Husc7bx2BnhMLL5wrIhodKPzjGKV47h2wh4DSqD14qPIV85BV2J7oRQpqT
         gamkylO+BURwj4ANMgX0nn9IXatvV3pEaigddbeJT/rJYWplb/kTbbvDHp63CyqFMVf2
         F68Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcErB28NkEhjbHzCG9Ek1liX0Tgn3Y3w/J4FuXQzJdXwzpg6GYKaTcfbj6x/aNV2J/EYG380+xhE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4KL/kKRznceZC6OZRmioQL4xeb53O4YMRf4qYZWlw8H9WvfP2
	FKcnzh4jQIlZmXJgrbuXqA9BsQL8SVPc0iPjV/uor+1uKa+tXuDARWdKzvDbUy0=
X-Gm-Gg: ASbGncviZ38UyYr+sskc9UH9qyMCxtlzNJu0fOWnMhW9OFbde/Ams39SW/wOwWBqd8H
	B4SL3pIaewywdkWFJscJloPXnVp2LKHUm6DOChgh0CC3763uq+IZGHiBfNq/oiuknm1NjZ0V62V
	K6Ihaz5zueZRp0yOW01MTuGXi6F0VFGNGS6DMknQ8Y4ytTMJiOEPu34G+wh8y5iRKW8v8eeOLFp
	U2BxnhrJh7Tf6HNzF5xhqUYy3XqnygDfWgtls3U83oHsteDQx2O4s4piVOxtB2BSPwRzDVkY2yd
	cevdrQfbvO+QFQk4/LT3as2SqSuWpFCD81rB9OyouCBdze0akkaCnEkOTiR7ohiIXGdGu8vEtwt
	mqaxS+A==
X-Google-Smtp-Source: AGHT+IEfs5mzue5cxlA/tYZQGdPYsZnrAeuI9wspIDpkJ5xpGDv+tQ0W9QYI49D8oVi9fGz+UnlbXA==
X-Received: by 2002:a05:600c:5012:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-4405d5fd401mr26798405e9.7.1744818505283;
        Wed, 16 Apr 2025 08:48:25 -0700 (PDT)
Message-ID: <f932fc96-3fb3-4247-b02e-ab35bd15baef@citrix.com>
Date: Wed, 16 Apr 2025 16:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: update repeat count upon nested lin->phys
 failure
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>
References: <793580d3-3fd8-4715-8a34-bf9965dd5938@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <793580d3-3fd8-4715-8a34-bf9965dd5938@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2025 2:44 pm, Jan Beulich wrote:
> For the X86EMUL_EXCEPTION case the repeat count must be correctly
> propagated back. Since for the recursive invocation we use a local
> helper variable, its value needs copying to the caller's one.
>
> While there also correct the off-by-1 range in the comment ahead of the
> function (strictly speaking for the "DF set" case we'd need to put
> another, different range there as well).
>
> Fixes: 53f87c03b4ea ("x86emul: generalize exception handling for rep_* hooks")
> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I really do hate everything about how *reps is handled in the emulator,
but this will have to do in the short term.

