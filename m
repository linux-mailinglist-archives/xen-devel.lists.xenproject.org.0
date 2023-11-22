Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3A7F3B46
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638353.994846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c0Q-0007YU-Mq; Wed, 22 Nov 2023 01:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638353.994846; Wed, 22 Nov 2023 01:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c0Q-0007Wn-IZ; Wed, 22 Nov 2023 01:26:18 +0000
Received: by outflank-mailman (input) for mailman id 638353;
 Wed, 22 Nov 2023 01:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5c0P-0007Vb-8u
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:26:17 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21753feb-88d6-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 02:26:16 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083f613275so30391405e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 17:26:16 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a5d61c1000000b00332cb8fd5b7sm5477168wrv.67.2023.11.21.17.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 17:26:15 -0800 (PST)
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
X-Inumbo-ID: 21753feb-88d6-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700616376; x=1701221176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=houFHBNzhX5fo5r9OcCkSwEG6ICg6TON+t4NlDtgrtc=;
        b=XG0nWECdsY8YlZeOiKI9suITYJE8cHXq1RM6PEQMiDIyICtt2bITXPAwbdVpeWd6xL
         hOzqWYxjTraH/wHCg/FrltS+JIWtccTiBqI2CpPqkgyavmo6vFdHWKPwruCKNzTwA3Fx
         6CUtumfhh/xHV5Wtb1oYGc8LY9DUmaOuVa5IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700616376; x=1701221176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=houFHBNzhX5fo5r9OcCkSwEG6ICg6TON+t4NlDtgrtc=;
        b=WCLLMDnTEkJCziN6IdxFy8YKeP0U36wAfs3/sH4QVCHcpMeRhbD+x40G4fG4nmXzsb
         0Pu+xZKd5L5RlXfY+Yc+45FpNiEPlwxcZL+a8gopVDXLqp3egZaOasWRTX49HUpl3Te4
         y4GBFrsg2tzBZD3RD2oJBx+Ta7Fof9JjeLJofuq7EKNlgq6YqXeVWMhu/BNHU6Dyuh4B
         VAswgyWAN/VhenX+tQvh0ZzCFlaRKIRpjBjAN1OLgSc576knzN1tS+8o25VYWeclI9My
         yYaiHxDkJsZLJWGAfoiwQvZ6iQSe0kymhqRe1qaWlSxQKNYj23tBv/pvrksCS2uYD1yU
         rnuw==
X-Gm-Message-State: AOJu0YxuHxH/HK2Vj8Ih5DuTH85fcwO7gZlgtpSgxFRjpX/29vkIwHwC
	XOYR9l3o6C+/5aHcM3+68/DdMg==
X-Google-Smtp-Source: AGHT+IG6rnYZEhQeteDmusyc5gajgo3P6dfQbhR8ifcAD4xujwIEJXkRAy/7BHDMm4y3+N6R18kr6w==
X-Received: by 2002:a05:600c:4ed0:b0:405:95ae:4a94 with SMTP id g16-20020a05600c4ed000b0040595ae4a94mr359016wmq.5.1700616375581;
        Tue, 21 Nov 2023 17:26:15 -0800 (PST)
Message-ID: <52ec938a-053f-4f73-b4d9-984547497e16@citrix.com>
Date: Wed, 22 Nov 2023 01:26:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/vPIC: check values loaded from state save
 record
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
 <976532e6-9514-4a46-8ca1-edf66f22659b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <976532e6-9514-4a46-8ca1-edf66f22659b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2023 1:48 pm, Jan Beulich wrote:
> Loading is_master from the state save record can lead to out-of-bounds
> accesses via at least the two container_of() uses by vpic_domain() and
> __vpic_lock(). Make sure the value is consistent with the instance being
> loaded.
>
> For ->int_output (which for whatever reason isn't a 1-bit bitfield),
> besides bounds checking also take ->init_state into account.
>
> For ELCR follow what vpic_intercept_elcr_io()'s write path and
> vpic_reset() do, i.e. don't insist on the internal view of the value to
> be saved. Adjust vpic_elcr_mask() to allow using it easily for the new
> case, but still also especially in the 2nd of the uses by
> vpic_intercept_elcr_io()).

I'm afraid I'm totally lost trying to follow this change.

What is mb2 and why is it variable?

This does look like a logically unrelated change (the only overlap is
using the new vpic_elcr_mask() form to audit the incoming data), so I
think it needs breaking out simply for review-ability.

>
> Move the instance range check as well, leaving just an assertion in the
> load handler.
>
> While there also correct vpic_domain() itself, to use its parameter in
> both places.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Introduce separate checking function; switch to refusing to load
>     bogus values. Re-base.
>
> --- a/xen/arch/x86/hvm/vpic.c
> +++ b/xen/arch/x86/hvm/vpic.c
> @@ -35,13 +35,13 @@
>  #include <asm/hvm/save.h>
>  
>  #define vpic_domain(v) (container_of((v), struct domain, \
> -                        arch.hvm.vpic[!vpic->is_master]))
> +                                     arch.hvm.vpic[!(v)->is_master]))

This appears to have only compiled before because both callers have vpic
as their parameter.

I think this is worthy of breaking out into a separate change, because
it wants backporting further than I expect you're likely to want to
backport this patch in general.

~Andrew

