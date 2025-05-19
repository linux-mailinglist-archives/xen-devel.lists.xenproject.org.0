Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C5ABC79B
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990146.1374084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5sz-00051J-2m; Mon, 19 May 2025 19:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990146.1374084; Mon, 19 May 2025 19:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5sy-0004yp-VK; Mon, 19 May 2025 19:10:52 +0000
Received: by outflank-mailman (input) for mailman id 990146;
 Mon, 19 May 2025 19:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH5sy-0004yj-0n
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:10:52 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7eb413-34e4-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 21:10:50 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad53cd163d9so551487266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 12:10:50 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d490789sm628733566b.130.2025.05.19.12.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 12:10:49 -0700 (PDT)
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
X-Inumbo-ID: fa7eb413-34e4-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747681850; x=1748286650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/wD01PMybT2LQnhKga9JH5u3GQCYLAHtw5OWeAnBH4=;
        b=LQu7lI1aJcLYCg5mgeZ8iYzjRI+WseYirJtIf+ln1cuhxAE+wlrnRePYQZF+cnvp0I
         btNIKl91cQesTAz/Kv5qPWIVGTmgm+x9Oy4NkFkuN+s+0Kvzdwm+eMpWM8tsHYQf89fW
         rd+ShDVhbO5PReuSJQmbELonBaxQUQcB2EfK8dbLpq7Cootj7qPh1hxTizFOF7xZzrNk
         WrMF4zfg6WYZLr+wdlTXkqmleO85BijgSHa6297pF9ueVqA7zqnQxsAOEzJCa9MrdMCu
         y4l1EKhOQr54EmGhjg7NdKTT9gotOBYjslWy0Caeyu9+nkXXQFa1c6kItLjoFjrg6zfU
         oOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747681850; x=1748286650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/wD01PMybT2LQnhKga9JH5u3GQCYLAHtw5OWeAnBH4=;
        b=N2Tc1AoYjoPjiQowEnvym8oMbveD+VnUTVB5hfwairZ7RuJSk7OPSHYHCpkc77ulnT
         3ooerzKzlHq+i4k6Wwujzuvwmu0lHUXczBAXPVEvCGMIfmNv4DaA0maNP2SozbfpkTeo
         MsOm1y+qkSl9yzYnQN/Y3hS2O1HTZBX1M1Yy0m2l2flh9j3EoJdGezDDMrAnc1HY0xZY
         s2DrE1t5aircN6jqFKC8iBOzfaxc+k3EPwJMufDQr+eIeISc7GNZ48VQqBBpxYQb9/by
         /hp2WHOzkMyvqXC+lVVkGoLLs5iRCd0QpuJzBoi1+SX5UoTSHRCOAXSwENgo8qaMbvih
         O1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUiUBdnx0sEtIrKLyyswa+HphjFaW11LbhziMTjYTVYdiGYYjSgmVcQHyoVVk1FAokoeQwO8eYAhSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3aGom9ZjiaPpPD0sy6MeOfS3frIajFOtJjT6jzv0yuetJkOBm
	9LluIRU17v5f9Nhm7JI4acP/nAStEF0+i3l0jDFjAteWjRgbcZTcQWCdfPbsbpeNrg==
X-Gm-Gg: ASbGncvuPnjpUXiq4yFFCpAvCeXP38EhDlGkwsPGh3F+wJCzDrJlzOd5bPz248RdfRx
	lU7t6s4tlwCuKk0WvONC+tBPZfrPt9SGQGDWurCkM6uPhyA+voihTkl3THc8TaTCMnyROAxmUEv
	e2wLBIIqIRxVhoS63dfUGaM+ltp35Qy8aabnkGD7QlmttWofVg8FAcNVfAXapLHM671Vym+l51h
	qW/TQ6zGkc1C/M7cKFj7zWdnu9X2xDF9l3rarjcYH8+vQJaenp5uJOE1Salha7P9L4xlrbw2C2D
	DGqEscLpo2u+8K7ew85lX0d67pzMeERM1jnGkuPqxMmeiNyOqek2qq6o4TfsVw==
X-Google-Smtp-Source: AGHT+IFPNcA5rBMSQP1zWY2N+HkTWpXl/YTmKwrOvnW7ZGrZkvs1h6LeQwVibg/pOTPxJrFVuYK6xQ==
X-Received: by 2002:a17:907:980d:b0:ad2:4736:9c07 with SMTP id a640c23a62f3a-ad52d42bf01mr1342163066b.2.1747681850436;
        Mon, 19 May 2025 12:10:50 -0700 (PDT)
Message-ID: <a967e60c-0474-46ac-87c0-d1d6ce5ce289@suse.com>
Date: Mon, 19 May 2025 21:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Give compile.h header guards
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250519135227.27386-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250519135227.27386-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 15:52, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Is this to please Misra in some way?

> --- a/xen/include/xen/compile.h.in
> +++ b/xen/include/xen/compile.h.in
> @@ -1,3 +1,6 @@
> +#ifndef XEN_COMPILE_H
> +#define XEN_COMPILE_H
> +
>  #define XEN_COMPILE_DATE	"@@date@@"
>  #define XEN_COMPILE_TIME	"@@time@@"
>  #define XEN_COMPILE_BY		"@@whoami@@"
> --- a/xen/tools/process-banner.sed
> +++ b/xen/tools/process-banner.sed
> @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
>  
>  # Trailing \ on all but the final line.
>  $!s_$_ \\_
> +
> +# Append closing header guard
> +$a\
> +\
> +#endif /* XEN_COMPILE_H */

This split of #ifndef and #endif is ugly. Can't we switch to something
more conventional, like

#define XEN_BANNER		"@@banner@@"

with the first sed invocation then replacing this by the result of
a nested sed invocation using process-banner.sed (which of course would
need adjusting some)? (Maybe the double quotes would need omitting here,
for process-banner.sed to uniformly apply them.)

Jan

