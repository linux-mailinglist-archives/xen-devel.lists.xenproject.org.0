Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41C8A7A24F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 14:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936726.1337903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0JHB-0006Jx-OF; Thu, 03 Apr 2025 12:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936726.1337903; Thu, 03 Apr 2025 12:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0JHB-0006Gs-La; Thu, 03 Apr 2025 12:02:29 +0000
Received: by outflank-mailman (input) for mailman id 936726;
 Thu, 03 Apr 2025 12:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0JHA-0006Gl-4o
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 12:02:28 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8283cfbb-1083-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 14:02:26 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso5315275e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 05:02:26 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a6ae5sm1649257f8f.32.2025.04.03.05.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 05:02:25 -0700 (PDT)
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
X-Inumbo-ID: 8283cfbb-1083-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743681746; x=1744286546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XH0JeYAt408M7KR9d9UEq3IEkO53yY1KEgdqn7A9GBw=;
        b=NhykE5Z2oTmWgcwxWxrcksgI6TjQVKZ58JbLjxSJ2lJMd+XSq2oE0KvMNvQbuQ2bu4
         a+OuLo0G5WU7kcIlwB4s9OnV1rRLXfioXcEU1C5VMRbB4uNfezLK6bUmrV/7VHxedCye
         C+8e7abyuzEexMIf3vyIlm75ngaLtyK7Y0FjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681746; x=1744286546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH0JeYAt408M7KR9d9UEq3IEkO53yY1KEgdqn7A9GBw=;
        b=q69+kbUZ56m6F2ZKlk7R9x0BiMR+ewesRsFSXtkn47TsTeyBNNfspoh2aSY18OQ6xG
         7zgPaq0s6A+omz+wcVNuhk4DMN8smanKGT0CGol3nwAYIcgJvF5PDkmMctztV8vcxqXX
         IasWh7X202AI82e3ivW9aD6S1DIqiUeGFBfNq9Qgl9cpSUDp/rNooQyp21YUf/3cs4MA
         4DdWn7HJWaY4m3rxqOPeOkPN+Jtd6pENgm7uYIFrdZpXUJN9VtfO9Bk4ym349tJFqPse
         lPAcdYgicwPLMCUHuUwomfCoMWkqU/40EtenUTxBsLlQqWjUDzHLSlbq4ToeHmLz+Xy3
         AXPA==
X-Forwarded-Encrypted: i=1; AJvYcCWUS+mbXXhpdMGqWIFEq04iOCGCnOYGNDj6/217h+ceCFAt4MKJcRnLYo1Cot9aGCCAiJ9H7c22v88=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYf9ssDImxUOm/5uYLDE3oH5NyH/PlLJ/DqaVM8LVqHrunliOr
	z+laLrEnmvMY14oY02TcWs5aEsJ4kHdMXBSSZaz8JU5g31gkuJeY2vQ3UEQugKU=
X-Gm-Gg: ASbGncvOXMDvar3/NaB/tkdzPVLSH9+a0ANPwF+sMj4M9FROyGhey5i8v0bWgo5zOUP
	W37uZkDGyJTpMKge6Z0yO6Ssl4dec6wXGTBKcftU27w3jzvLjHE0vaN9AK24NbZNlGfkxKSuaGa
	GLOpIxMfVfETmhHiDh1NrL20EXCjVo6lS9AdDIdBwU6d2pvyKSCcHaXrtWYAUty3J6l7bGhwZqZ
	dpkhvSjhS1tctx5XWypKA3el0JaGlYXzi9hqCfQ6ifShPlOM5EY1ekkeGcEphl/47Wmt2tF9s6K
	CR9K2QpWNXaAKI0lBIbWO+K1TUZd6Jz2gx6f6Y6cgzEuK9IhJlhVBNWhBWoaDDirNHic062S+Io
	8VymzI+N0Ig==
X-Google-Smtp-Source: AGHT+IHJLS4DCDlaws9WDiSZYdYjhFMnrLTDL0HvD10KLRcHGdlGST1clDJTPVoM5HhsKbrwva1OpQ==
X-Received: by 2002:a05:6000:42c6:b0:391:2e97:5788 with SMTP id ffacd0b85a97d-39c1211ca8amr13938983f8f.55.1743681745886;
        Thu, 03 Apr 2025 05:02:25 -0700 (PDT)
Message-ID: <b8200dc3-35a9-4ae5-a345-45f4c6143e55@citrix.com>
Date: Thu, 3 Apr 2025 13:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: re-order .init.data contributions
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b0266c19-d0e5-4de7-b2fb-a50e2766168c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b0266c19-d0e5-4de7-b2fb-a50e2766168c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 6:56 am, Jan Beulich wrote:
> Putting a few bytes ahead of page tables isn't very efficient; there's
> a gap almost worth a full page. To avoid re-ordering of items in the
> source file, simply put the few small items in sub-section 1, for them
> to end up after the page tables, followed (in the final binary) by non-
> page-aligned items from other CUs.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -136,6 +136,7 @@ multiboot2_header:
>  .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
>  
>          .section .init.data, "aw", @progbits
> +        .subsection 1 /* Put data here after the page tables (in x86_64.S). */
>          .align 4
>  
>          .word   0

Just as a note, this depends on the toolchain baseline bump, so can't be
backported.

Clang-11 does now like subsection, so we can remove the !__clang__
specialisation for UNLIKELY_{START,END}_SECTION.

~Andrew

