Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A951F7FD7D0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 14:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643914.1004482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8KUO-0006cg-K0; Wed, 29 Nov 2023 13:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643914.1004482; Wed, 29 Nov 2023 13:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8KUO-0006aG-GA; Wed, 29 Nov 2023 13:20:28 +0000
Received: by outflank-mailman (input) for mailman id 643914;
 Wed, 29 Nov 2023 13:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4CTn=HK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r8KUM-0006a8-Vm
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 13:20:27 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dd65bb3-8eba-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 14:20:24 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b54261442so4241285e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 05:20:25 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d56c5000000b0033172f984eesm17848719wrw.50.2023.11.29.05.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 05:20:24 -0800 (PST)
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
X-Inumbo-ID: 0dd65bb3-8eba-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1701264024; x=1701868824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+J0x7a0PD9p/VqLGjkyGZvLQjOrtRWY5Ac+AxcGQlA4=;
        b=QV341FabIy3tMsmuMzPJVbnBBYF/kBOEvUTqX6RScAb9lgY8H3dS7Y/eMMyF4lVkTI
         HeOFR2MZhstbUsCzgZjhZDeUhCvqKwTZX7AQ9xZWHjmhU1NvAOxew+39eFRyTUqwhaca
         GG5tQ6RtqRUAh9BfpoLtIJX7FjbtIHOBVaU+lMkCVo//aY7UW4jCcYgI6NI/xPLAIAef
         5LQPwWAxdLzXLfPRvAOjJmRKS4L9/GCF4YVYW9nCgB3LRtANlPpFcR10CVI6YGURRrRR
         F2xLy1Mbns9RirRTlBjd0t2FNLmubYcjqpRGZxYPfRx9kEtEzRrcOSDOif5de/LEWAvx
         /0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701264024; x=1701868824;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+J0x7a0PD9p/VqLGjkyGZvLQjOrtRWY5Ac+AxcGQlA4=;
        b=lCR7UAgk8UKPich77p+eAHKyP1wWi0rUdYp3AXRp/JwIvK/s4HiXqpnOIVip76Fbwa
         z5HQyRB3NkzVZcBA0/UXJ+Ui+BkkCNviWcnVwMnZzhQBeAA0dr4nSvC7DP7pAQtxTN+b
         aHYJ9RxoAvHOtJ6aWKImujUkM3zKgBaR8JlZTkCByKry6no6KT08SjvbH9qJ/XCVnMtI
         jcKhzOCbPXGP1LVreYpcCClR9CGXsU+REHXRHA7egE8bQMSSYiI7ls02Y4dQTA3i6Qlx
         QbNRROvC4NJnrCoApHXynqA1P9lcyuRcMV5TlNGM6vEaF5y8JQhnYHMp108uJZk2Ie9e
         pAdw==
X-Gm-Message-State: AOJu0Ywfhk0mq3+e9QhDIORsCWbNpCcVYTl4DaH2qUgamBgLwalfCHaY
	rz/qDjbUybq0wojaH5pmRGzghA==
X-Google-Smtp-Source: AGHT+IGnCTDn/ocF0tMbS4LipIfjyh3BMG5LBCWajW8mp0972XdvdgNouolyFX+JonfjbzSGJjCP+Q==
X-Received: by 2002:a05:600c:1c81:b0:40a:3e13:22aa with SMTP id k1-20020a05600c1c8100b0040a3e1322aamr13246196wms.7.1701264024514;
        Wed, 29 Nov 2023 05:20:24 -0800 (PST)
Message-ID: <291fd6bd-9ea7-45c4-96dd-5a76cdc7342e@tibco.com>
Date: Wed, 29 Nov 2023 13:20:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: fix flexible array definitions
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230725135557.20518-1-jgross@suse.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <20230725135557.20518-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/07/2023 2:55 pm, Juergen Gross wrote:
> Flexible arrays in public headers can be problematic with some
> compilers.
>
> Replace them with arr[XEN_FLEX_ARRAY_DIM] in order to avoid compilation
> errors.
>
> This includes arrays defined as "arr[1]", as seen with a recent Linux
> kernel [1].
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I know this is a change in the public headers, and I know it will cause
changes in the behaviour of sizeof() against these, but

1) We expect people to copy these files, so the change here isn't
breaking others, and
2) The use of sizeof() on these structs is buggy in the first place, and
3) The use of sizeof() with these structs is unlikely because they're
variadic
4) It really genuinely is UB as reported by toolchains

It may not be great, but it's the least bad of a lot of bad options.

This definitely needs a note in CHANGELOG.  Subject to something
suitable there, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

