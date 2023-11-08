Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC37E5D70
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 19:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629409.981656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0nYX-0002wI-VL; Wed, 08 Nov 2023 18:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629409.981656; Wed, 08 Nov 2023 18:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0nYX-0002ud-Rl; Wed, 08 Nov 2023 18:45:37 +0000
Received: by outflank-mailman (input) for mailman id 629409;
 Wed, 08 Nov 2023 18:45:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHnU=GV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r0nYW-0002uX-LC
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 18:45:36 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 001f7109-7e67-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 19:45:34 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c4fdf94666so95340101fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Nov 2023 10:45:34 -0800 (PST)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c510800b00407752f5ab6sm20464357wms.6.2023.11.08.10.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 10:45:32 -0800 (PST)
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
X-Inumbo-ID: 001f7109-7e67-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699469133; x=1700073933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXtXCxod3n2wpFuGzw6gVxbKjKmf8DysxDZDSlRb/3g=;
        b=oelDGlnyZod53m/PSFrPZlhoXf20ATLk/aaDlOrvXF5dV/D94XHjahFDMa1EeAcVa5
         F4xfXnw2HOFz7UJp9K/lKXAKS9UPjhLupI2seIXX/d+hSWQaAEE7SmumDsvim3VeMz4v
         6SmSeymQc7AQRUcK+Diw5cYGeKfzaY4omi+aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699469133; x=1700073933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXtXCxod3n2wpFuGzw6gVxbKjKmf8DysxDZDSlRb/3g=;
        b=ezEhoyXwV+eYGJhtw1BujU7z3e287bksUePHIL1bbx7+TSz7h5qFe/XfKSfgZq7YRY
         xXjKcFp6bfbQ+jM1IpSudvYK1SIoxzvVAdFldeyZIJD2tG7scg7sfB3qjcBphTFVCwmK
         vR/+/Yg8EMfBk92BCKSvT1OMITKjDrcnqD2COvYWLEZWoNmwELaVwYDcylAY4L6psp0x
         G87wikaiZWbu9Is5oxgWBRgGz289plDBur/eyEEKIwdfUZffkzXZhZVjk4Xo1Kh8Pdwv
         msS0wDKf7Im3aTUuTMLxZHLVSvqxUQ7KLskGUGVF08mwJmSq66a6oxY+Zis0fQNYJ/tA
         mbrQ==
X-Gm-Message-State: AOJu0Yy/BtbHnjnAgCFVZ/21y/7nJfsKZLHGNAudoHbsAw9JPK9vvhr3
	xB1K46Iq4tkYnvoEhjc2u+759A==
X-Google-Smtp-Source: AGHT+IE1Qwces+o1fNsXFg2vYqaZ3u97PSWgVEXKUr0q7piWfIzuW7nA4jP+E58KuN9EV6bo7kxqWQ==
X-Received: by 2002:a05:651c:154c:b0:2c5:1eb6:bd1e with SMTP id y12-20020a05651c154c00b002c51eb6bd1emr3568392ljp.43.1699469132907;
        Wed, 08 Nov 2023 10:45:32 -0800 (PST)
Message-ID: <bdb7efb1-b8b2-4426-a46d-e8f5afdba0f6@citrix.com>
Date: Wed, 8 Nov 2023 18:45:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Remaining violations of MISRA Rule 7.4
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Jbeulich <jbeulich@suse.com>,
 Roger Pau <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Consulting <consulting@bugseng.com>
References: <21761f2a6633a08ceb2b70a46013486a@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <21761f2a6633a08ceb2b70a46013486a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/11/2023 4:24 pm, Nicola Vetrini wrote:
> Hi everyone,
>
> I was looking at leftover violations for MISRA Rule 7.4:
> 'A string literal shall not be assigned to an object unless the
> object's type
> is "pointer to const-qualified char" '
>
> You can see the referenced violations at [1] and [2].
>
> I think the ones in x86/setup.c can be taken care of either by making
> an early return
> from cmdline_cook, given that one caller never supplies a NULL
> cmdline, while the other
> properly takes care of the possibility of returning NULL, afaict.
>
>  static char * __init cmdline_cook(char *p, const char *loader_name)
>  {
> -    p = p ? : "";
> +    if ( p == NULL )
> +        return NULL;
>
> or changing the type of "loader" to const char*
>
>  void __init noreturn __start_xen(unsigned long mbi_p)
>  {
> -    const char *memmap_type = NULL;
> -    char *cmdline, *kextra, *loader;
> +    const char *memmap_type = NULL, *loader = NULL;
> +    char *cmdline, *kextra;;
>
> as, as far as I can tell, it's never changed after
>
>     loader = (mbi->flags & MBI_LOADERNAME)
>         ? (char *)__va(mbi->boot_loader_name) : "unknown";
>
> However, the one in xen/arch/arm/efi/efi-boot.h
>
> name.s = "xen";
>
> does not look to have a clear resolution
> path, therefore I propose to deviate this with a SAF textual
> deviation, whose justification
> relies on the fact that the string is never modified afterwards.
>
> For the one in arm-uart.c from the discussion, I'm testing possible
> solution with no code
> changes, but if that doesn't work out, then I'm inclined towards a
> deviation, as options
> is never modified afterwards.
>
> What do you think?

I've just rebased and pushed the residual from the past work (although I
missed the ARM EFI fix.)

https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=0f06bab762f5201f3e00aaaee704c3c01f516b51
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1065699873

I'm going to make a firm request that we fix this by activating
-Wwrite-strings Xen wide, because that's by far and away the best way to
stop regressions creeping back in.

In start_xen(), basically whatever goes.  All that's doing is processing
of one command line into another, and your version looks a bit neater
than mine.

The name.s cases (it's duplicated in x86 and ARM) are more tricky.  The
compiler warning can be silenced by swapping name.s for name.cs but I
have no idea whether Eclair can see through that piece of blatent lying.

~Andrew

