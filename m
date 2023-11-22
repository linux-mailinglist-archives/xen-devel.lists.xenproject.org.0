Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF57F4617
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 13:26:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638745.995612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5mIo-0005kK-5y; Wed, 22 Nov 2023 12:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638745.995612; Wed, 22 Nov 2023 12:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5mIo-0005hO-2n; Wed, 22 Nov 2023 12:25:58 +0000
Received: by outflank-mailman (input) for mailman id 638745;
 Wed, 22 Nov 2023 12:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5mIm-0005g1-8Z
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 12:25:56 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4881b976-8932-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 13:25:55 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c875207626so51536091fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 04:25:55 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c310f00b00401b242e2e6sm2031502wmo.47.2023.11.22.04.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 04:25:54 -0800 (PST)
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
X-Inumbo-ID: 4881b976-8932-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700655955; x=1701260755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0egr1bmaF/PMvEo2sAxdzaWRi6Uu7Blp4L2g1fV0jBw=;
        b=sVe36iex7y/nTM4Ae4RPtrkPwPU9/8Q0ArTP+Jlv5Spo2TBs1B4ANRTwsSLKsmoRrI
         BCbGYsiYo7eTeoD9LexEaDO8uRi9J5inZBYDHFISyySDyTG/0NGRViHliVS4eLe+KLtf
         Zs7ry/6MnUCanO1hyANM/f/2THp0I1ZP+XqG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700655955; x=1701260755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0egr1bmaF/PMvEo2sAxdzaWRi6Uu7Blp4L2g1fV0jBw=;
        b=gjTitEskrpu5bPPM3TELj8WMdo+1KDRHpVd7bITYjGStip4gNn36DaVQYbQ6uVLxU3
         Zs1xlHgUvyZexrs0DtBhbeNud9hDlDbvP+wQ1HtcWvaBdpPAsx68fUX31k9hg9au0MOl
         ruArIrj3mP8GYpPztqSARqOAl8owKbuJR0kcHBek7autAmoQKWTKtUL2RQ/aJxJCp0M9
         wnStKFlmDHkOa5cA5G5RGjCuhGT/Adl5J3ao26SOXiIgJJXd9w5IKsKNq3OF3hU56P2I
         rC9B++4DM07izp5YdtqkfMUxd71EEutj3jeXhWBw7J7EGQ5qInwLvAphVqupCTEuBl3Q
         Z6oQ==
X-Gm-Message-State: AOJu0YygIYFgVtAJcj4HuenqDGfp9lqkefHe9p284P7Yvap8e/n2A+WL
	xbgEP+D1Q6JahtYSNqCZNpsR5A==
X-Google-Smtp-Source: AGHT+IFBRR7D7uzmo35VO4YNdj27O7BiVnYWTOqu/ZRVD+/+6PSdEB0tVjZtXRLC+9eXLA7n7RiPIw==
X-Received: by 2002:a2e:9e87:0:b0:2c5:32b:28fa with SMTP id f7-20020a2e9e87000000b002c5032b28famr1898732ljk.30.1700655954875;
        Wed, 22 Nov 2023 04:25:54 -0800 (PST)
Message-ID: <a09c90f3-d720-41d7-8b21-42cab58bd0b8@citrix.com>
Date: Wed, 22 Nov 2023 12:25:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpuid: enumerate and expose PREFETCHIT{0,1}
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <2736e884-4b28-4ee9-b23e-24e763355d1f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2736e884-4b28-4ee9-b23e-24e763355d1f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2023 7:43 am, Jan Beulich wrote:
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -274,7 +274,7 @@ def crunch_numbers(state):
>          # superpages, PCID and PKU are only available in 4 level paging.
>          # NO_LMSL indicates the absense of Long Mode Segment Limits, which
>          # have been dropped in hardware.
> -        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL],
> +        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, PREFETCHI],

I know this is what the ISE says, but I'm not sure it's a legitimate
dependency.

It is an implementation detail that Intel depend on a RIP-relative
address, but there are no architectural reason why other implementations
couldn't make this work in 32bit too.

The worst that happens without this dependency is that 32bit-only VMs
see a hint bit about certain NOPs having uarch side effects, which
they'll ignore for other reasons.

So I recommend dropping the dependency.  If you're happy, then
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

