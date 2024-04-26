Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873B8B3FE4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 21:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713078.1114070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Quq-0000wV-MY; Fri, 26 Apr 2024 19:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713078.1114070; Fri, 26 Apr 2024 19:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Quq-0000uG-J0; Fri, 26 Apr 2024 19:07:24 +0000
Received: by outflank-mailman (input) for mailman id 713078;
 Fri, 26 Apr 2024 19:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0Qup-0000tj-6a
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 19:07:23 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 355ec681-0400-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 21:07:21 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34b64b7728cso1981129f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 12:07:21 -0700 (PDT)
Received: from [192.168.1.10] (host-92-29-231-118.as13285.net. [92.29.231.118])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a5d6207000000b00346f9071405sm23035799wru.21.2024.04.26.12.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 12:07:20 -0700 (PDT)
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
X-Inumbo-ID: 355ec681-0400-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714158441; x=1714763241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=stNgvLr/ix8cWZ6LEfp9OdTkKt2zUlrkE0YoiPl0Tno=;
        b=Ojb9+b3+EEQVi3bHxP9nJ/rLmH1mm3nJuAPXL1+HV5uo0JO9XZ2aW9WsB0bmhDZvUV
         l3qJ2xl8ZAC3ZZt1goJNgEDkwzOiBviCd7Im6rdyTqOSNLztqYuoneS2vzeJs1yKj7rk
         y8BL94aSWvQdEo3WRVxGZM9oq2/Xwl9WM32xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714158441; x=1714763241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stNgvLr/ix8cWZ6LEfp9OdTkKt2zUlrkE0YoiPl0Tno=;
        b=u8qhVdnlvGfky1e7OnuL6yhX+MstUD59JJuKRsQR5JpkgB5kY4RUfQ4STp1H+ofSEl
         pqhm/FA3vfkqSFO2DUChrhUZWyrg12qsw07vHP3L7QUjGz//PDsjhdNfD1vZryJWKQJY
         HuvYi7xB1KRDY07IZMAPmVPKXbKlmrE1rXghHQZNf5L0ialZ6s0JqIxV6rs6OLMTbOeb
         xYO1yZjeh41oGRHebHIcUTV9gL2aSYUltHIPfLZHl20dAl+V4kMdTvcQLSAs2SUq6Sq6
         FMc9Z52+HNQtvLlnWy+GmoI4aURs7x7PGXVZ4y7rM3+7ckcGach0cEQSEZYZi6VTV/7C
         VlPw==
X-Forwarded-Encrypted: i=1; AJvYcCU9mIoKqTFWTrIGxSabyaI6D9KVw0Stgtr3sEmVBsERkyks44qTr/Q61oyRE+4jAkfiDQrgnetKa0M8vbgudlifupvUVWrGcBytxyqbI3A=
X-Gm-Message-State: AOJu0YywY9GccCV8SwROtCp89oWZP3XVm9wEuAt7CioKLV3PXrJgkgAh
	ARVoE8vPI+LPY/ZZgXeb/vwDUIBNiMpLR9HI5XOj5c+K/S3/SV6y6EpPvVjLoaU=
X-Google-Smtp-Source: AGHT+IEuZnd9Kd/zw19pOa/L0A5nbA7VQqhXe4I717NEBld5QPzHIaJmhW3WdgqM/cQfPc/jPLfHhQ==
X-Received: by 2002:a5d:45cf:0:b0:347:3419:333f with SMTP id b15-20020a5d45cf000000b003473419333fmr2462457wrs.33.1714158440963;
        Fri, 26 Apr 2024 12:07:20 -0700 (PDT)
Message-ID: <31022a35-685b-429f-b544-7ea221903ed1@citrix.com>
Date: Fri, 26 Apr 2024 20:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Fix Syntax warning in gen-cpuid.py
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240426040716.52126-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240426040716.52126-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2024 5:07 am, Jason Andryuk wrote:
> Python 3.12.2 warns:
>
> xen/tools/gen-cpuid.py:50: SyntaxWarning: invalid escape sequence '\s'
>   "\s+([\s\d]+\*[\s\d]+\+[\s\d]+)\)"
> xen/tools/gen-cpuid.py:51: SyntaxWarning: invalid escape sequence '\s'
>   "\s+/\*([\w!]*) .*$")
>
> Specify the strings as raw strings so '\s' is read as literal '\' + 's'.
> This avoids escaping all the '\'s in the strings.
>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

That's something I didn't know about how python does string
concatenation.  I was expecting the whole string to be considered raw,
not just the first line.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll rebase my pending change altering the regex over this.

