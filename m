Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D34A9D50C0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 17:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841611.1257102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEA6S-0007h3-Ma; Thu, 21 Nov 2024 16:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841611.1257102; Thu, 21 Nov 2024 16:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEA6S-0007eD-Jh; Thu, 21 Nov 2024 16:32:24 +0000
Received: by outflank-mailman (input) for mailman id 841611;
 Thu, 21 Nov 2024 16:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tEA6R-0007e7-Pq
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 16:32:23 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d9063c9-a826-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 17:32:20 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5cfddb70965so1425291a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 08:32:19 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4181356sm97750866b.77.2024.11.21.08.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:32:19 -0800 (PST)
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
X-Inumbo-ID: 2d9063c9-a826-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MjkiLCJoZWxvIjoibWFpbC1lZDEteDUyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJkOTA2M2M5LWE4MjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjA2NzQwLjAxMDc1Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732206739; x=1732811539; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHKWbJiJFqtT9wBmn+jqWFMHxa0tn4fA09CBCKuj4e8=;
        b=sntC8xd4SlKCjMVrVyk98iI9GBUxbOEfWp9+OpUAx+k8LGgBNKiwQlTid+zuFiK9/Q
         56VQFzS3Cx+ncrB5Da5/ZEBR22Si55XD0VD/eM/sVOXvCJc7/xlVbVwZIBtphUdEYXG5
         5SSip0Cc01nEtGeU49bRskHNAUr3h1CptS2kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732206739; x=1732811539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHKWbJiJFqtT9wBmn+jqWFMHxa0tn4fA09CBCKuj4e8=;
        b=eCXhXYkX53Fs1u/sCajYWCDFJESEB58VPqzGguW2SzJUC2V9Hl39xx7lN5Wrxe/8+7
         pao9ZOm3Baff9ECGLqz39fkPpDiOo9WzRKtfL+uCCxr4EKj+bpcFXaCUVeRbd+/M9VGC
         6NSnmT/70YNtBsuGpZhkylQYYbYVd8d1fOe+fnLMKzVYWJGfCfhvCKRIsu8pM+UYea7I
         7K4QHzp7wI1QIRFpvgXfDOkQ+SgRq88v4Bgyy7YWsmYb4gURzMu1NF6mRHa13xPhACJC
         yTZslMv1Xd8JOMOyO7un3llJ+eKOQj43s4YqizyGYazIlRwYbqOrJcrOFkKaUdmtjcR5
         ApqQ==
X-Gm-Message-State: AOJu0YyGmJob9JIVGDfaBL/HniT3Pv1DRSZQh1VR3hzJMu2JDDWngqJY
	5KRTKeEs6kAUA9yhh7tOfd9u6mEwMYISTn5+YkMXcBz3ECK54kef0OzmjU7GuRk9PLSwVToT0+d
	N
X-Gm-Gg: ASbGncvHIXe3xg+FIrPHY1s9sFZEJXF2VeURJnHnKzIlslR7OYK5MAd8GyKLS03qAEz
	n1t/01D0Ei2RiASN60W1UxY5E+YZW6uuxaH8KWNqV2PiRsQpZvMOnNuzV6n7R5rXE9jPiA3M9kj
	YbXIHKo7mBKLmAoRhrmBVdM6NXZTcaF9OxSGfy0Ix96wPcP0jqYhjMc5s4W1NFq0sr23+oqIgdU
	WJJkgN2wrBNEHTmH8nYF4AymOced8yjG8l+8Cqxe+Zbu7Mjb2XNrdvAx0s=
X-Google-Smtp-Source: AGHT+IFGejFU/mssoKX8A3e0Zt9KewwePmPt2HQaEhwFN1sWc6QsvfXGYqXfGgTi3RCE+RJmUIqNXQ==
X-Received: by 2002:a17:906:da85:b0:aa3:1ee3:2ac8 with SMTP id a640c23a62f3a-aa4dd56e59amr708662766b.25.1732206739441;
        Thu, 21 Nov 2024 08:32:19 -0800 (PST)
Date: Thu, 21 Nov 2024 17:32:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/bitops: Fix break with in a for_each_set_bit() loop
Message-ID: <Zz9gkhQgsOtJUA0I@macbook>
References: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121145000.3107723-1-andrew.cooper3@citrix.com>

On Thu, Nov 21, 2024 at 02:50:00PM +0000, Andrew Cooper wrote:
> for_each_set_bit()'s use of a double for loop had an accidental bug with a
> break in the inner loop leading to an infinite outer loop.
> 
> Adjust for_each_set_bit() to avoid this behaviour, and add extend
> test_for_each_set_bit() with a test case for this.
> 
> Fixes: ed26376f20bf ("xen/bitops: Introduce for_each_set_bit()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I have to admit it took me a while to understand what was going on.

Subject should likely be "Fix break usage in for_each_set_bit() loop"

Or similar?

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> 
> Both GCC and Clang seem happy with this, even at -O1:
> 
>   https://godbolt.org/z/o6ohjrzsY
> ---
>  xen/common/bitops.c      | 16 ++++++++++++++++
>  xen/include/xen/bitops.h |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/bitops.c b/xen/common/bitops.c
> index 91ae961440af..0edd62d25c28 100644
> --- a/xen/common/bitops.c
> +++ b/xen/common/bitops.c
> @@ -110,6 +110,22 @@ static void __init test_for_each_set_bit(void)
>  
>      if ( ull != ull_res )
>          panic("for_each_set_bit(uint64) expected %#"PRIx64", got %#"PRIx64"\n", ull, ull_res);
> +
> +    /* Check that we break from the middle of the loop */
> +    ui = HIDE(0x80001008U);
> +    ui_res = 0;
> +    for_each_set_bit ( i, ui )
> +    {
> +        static __initdata unsigned int count;

Preferably as you suggested without the static variable, I may suggest
that you use ui_tmp instead of plain tmp as the variable name?

Thanks, Roger.

