Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7787B51A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 00:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692814.1080310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkXgT-00082P-3W; Wed, 13 Mar 2024 23:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692814.1080310; Wed, 13 Mar 2024 23:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkXgT-000809-0k; Wed, 13 Mar 2024 23:06:53 +0000
Received: by outflank-mailman (input) for mailman id 692814;
 Wed, 13 Mar 2024 23:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkXgR-000801-03
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 23:06:51 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f8d0900-e18e-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 00:06:50 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-413ef8f77e1so2189035e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 16:06:50 -0700 (PDT)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b004133825e6cfsm3649265wms.24.2024.03.13.16.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 16:06:48 -0700 (PDT)
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
X-Inumbo-ID: 5f8d0900-e18e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710371208; x=1710976008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E026i1YNwPtDgfbtcRd9t2FJoQKmQLatozjbsG664Qo=;
        b=P3KRw+yCnbhGslz+5tIeORLPJjJfF+KrtOqSql8PFgZ57O84n0FC5p9nM860Q9kfI1
         L0AsjUJbhmRqUlzez+sl0AcxExi9mZGdBvkGXRYmGfOk0c75EIAhW8sr8OSThZgLMFxR
         nna9ngLE35IgPQ9LtLhNg7qIP2zGLmXaRmM5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710371208; x=1710976008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E026i1YNwPtDgfbtcRd9t2FJoQKmQLatozjbsG664Qo=;
        b=fyDySyDLklhY/GYwvzkKJ5YxK0MipAyGuxTWJId+ETcN6vO88ov2WbS13sLiIE6nUv
         0rbQ26wLsipze0pWye/fIlxTyI5FBhIcSMTneR8MR9mg20I5bH7U/9xodddg2VuLVuGt
         pqekMU/MsBG5F8qudSwHzPfwbuWhSWkdYIcNCLy65eM00tMFgq951WQwIFcrc51CvMBA
         JFBEWjHnNI5MaGkYYPRZffYVhf/Xw29MBdLv8UHksLpma2/a79g/QBVtOwZTpRM2iI+b
         0bpdlcX/kCVH2fFeLKkSV9veVLkiZ/TfBoA3DDJIglZeIJlREzbZL7sjwJ0UbnkGlEWX
         fuZQ==
X-Gm-Message-State: AOJu0Yz+vNyJ9TyQneBD753OFP00C8nzCkKwBVDXtfteDLr1MmIlCUif
	P52VBNEZ4/lbuU1DSPdtB0W+vnn3s36IGoEKARAYDjpQyQiclgaNIf+7aBc+fR3GniO09IVaroR
	5
X-Google-Smtp-Source: AGHT+IG2SrORB9mvpQQ13XoPojCmlv6ozokP/mP8VVt5ib5WA/+zFzN9Z3X1O8TriHdAThNkypkwkQ==
X-Received: by 2002:a05:600c:500a:b0:412:d149:254c with SMTP id n10-20020a05600c500a00b00412d149254cmr144443wmr.17.1710371208491;
        Wed, 13 Mar 2024 16:06:48 -0700 (PDT)
Message-ID: <4a190351-1ab2-4a5c-ad5c-6d45095a1595@citrix.com>
Date: Wed, 13 Mar 2024 23:06:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] xen/bitops: Cleanup ahead of rearrangements
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-2-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240313172716.2325427-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2024 5:27 pm, Andrew Cooper wrote:
> diff --git a/xen/common/bitops.c b/xen/common/bitops.c
> new file mode 100644
> index 000000000000..4c07191b4030
> --- /dev/null
> +++ b/xen/common/bitops.c
> @@ -0,0 +1,41 @@
> +#include <xen/bitops.h>
> +#include <xen/bug.h>
> +#include <xen/init.h>
> +
> +/* Hide a value from the optimiser. */
> +#define HIDE(x) ({ typeof(x) _x = x; asm volatile ( "" : "+r" (_x) ); _x; })
> +
> +/*
> + * Check that fn(val) can be calcuated by the compiler, and that it gives the
> + * expected answer.
> + */
> +#define COMPILE_CHECK(fn, val, res)                                     \
> +    do {                                                                \
> +        if ( fn(val) != res )                                           \
> +            asm (".error \"Compile time check '" STR(fn(val) == res) "' failed\""); \
> +    } while ( 0 )

It turns out that Clang doesn't like this

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/6387413632

despite it being capable of reducing the expression to a constant.

This also calls into question whether it's a viable replacement for
__bad_bitop_size() et al.

~Andrew

