Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A212A1CE51
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877250.1287383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8oZ-000584-Nc; Sun, 26 Jan 2025 20:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877250.1287383; Sun, 26 Jan 2025 20:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8oZ-00055j-Kc; Sun, 26 Jan 2025 20:01:03 +0000
Received: by outflank-mailman (input) for mailman id 877250;
 Sun, 26 Jan 2025 20:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc8oY-0004Vi-Iw
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:01:02 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4385e561-dc20-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 21:01:01 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21669fd5c7cso64755355ad.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:01:01 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac495983698sm4974713a12.55.2025.01.26.12.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:00:59 -0800 (PST)
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
X-Inumbo-ID: 4385e561-dc20-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921659; x=1738526459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UTEeD0XMSKGDjb4UjeehXNP6i1pjJAUAQz3ZrUzV6BY=;
        b=EhQFKSC38jPJ3XFBGzgNBW2enCPrmxuaAf/dp8JA+U5oG0RnIk5i6JSiAf0gXsSTuQ
         LP9qRypyEks1wiBF/YS6nXd9rxJR3iv/VYeJc6ssKPKugNDOWxbv1faM5UXutzTjPiZE
         VMfa1gTPThEDRRTYVxVGefOF5+ejy4yLNVFySlC90kjNsM972l0HuvXM8hzy+KpTv42I
         0Pru+Yuv0i3wb0IqHTGVvWPtRFtwj3hLbgYolaQKBYRNhV7cLRVCfZpUYPRKmR9nEryS
         XRj+3rrjSwpiDG4T/tW/82TdxVqnEmM1VazJsT3N9PEyW1Gv7dB/arQTPzFoVwTNfkcp
         3yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921659; x=1738526459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UTEeD0XMSKGDjb4UjeehXNP6i1pjJAUAQz3ZrUzV6BY=;
        b=tTyYKFUxi+IXEsISvqxr/k+JQZIb5t72zN3RBfDsrhBiCkWrYOFaDJ2ys/AS0fd0e5
         BCCkbkFWn8HALpjf9LweOrtk7sbn8CjwNca90QtbTa34XCxU+hBRVrOabBxYqRQJJIk2
         v7c5k1fPKywdMMqf4EMyBiczXZo/hxfoCabICAJVLQ3ttYj4zrYlx5/T0z8ENZ8G7/ic
         5Z2psnc/Fg1Sp8X8G06yP7WukctbAr1OmIOPvh4KjcoQRNq6t7pPuFsCUHEJZ8BbCNU7
         aaEoURnYfgX21DxKOUvxoQFG20t0iPvy/IsOP+w3nEZ8X4pae2sbQ+2EK8dvOukt0J8E
         4Qng==
X-Forwarded-Encrypted: i=1; AJvYcCWdmDW2JXvfQbFnRZZFqqiXMNGJy83ro1gsCIo8QQnH+3m0nh6RzkCx/WJiEhPPaQ04LZ4fiCVejHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhvtRta5Y+iMLhjCGlSQkwHgiBqXKEoItS2M1ttmezLoDGUNhx
	hb8zgO5CAmigSDzgoKbTp+MRltKeFmHi3ZZ1Z0apx88pgMDH3yVK+h7ptgM15QA=
X-Gm-Gg: ASbGncuc/61o3S2DiXX+/rXznB7hJeyjeKlYMjCau7EB/Nqy1FuQ4BBkxaKYFXruLQm
	/5C3Ph8f4UUAd41qNfwIZoSWCsmCiDJ4dQ0YO3q6e32vjdBLfK82fyWfz8iY85agAf/hkpjwYoG
	Teho8ghqnF4rM2acOM85q5KHyDuXftbKF1MJQauMw0jpcwBdPmzYl3sQEruEE6ayS+aUYSPn6KT
	EIBMo2cw1iyUHtylgZE1K9yncJohndU3+mAYiRJ519bRuY2HIfxHzeGz5+QNLr7BmyWkw9fZhpl
	UNzOyJ1A9TBzxf4wq0xY0yrh0gqlOaPVSgV6JKX7v+npPRM=
X-Google-Smtp-Source: AGHT+IHk4oCZBkQ3EpN55L01I/3BlN88uO4hEsi17nz9LIDtFF+nfMo3swxHhoOsy6uzlknivzwr8w==
X-Received: by 2002:a05:6a21:99aa:b0:1e0:d89e:f5cc with SMTP id adf61e73a8af0-1eb21485c9bmr55831284637.11.1737921659596;
        Sun, 26 Jan 2025 12:00:59 -0800 (PST)
Message-ID: <aa1564ba-b51d-4278-9368-2849266f8685@linaro.org>
Date: Sun, 26 Jan 2025 12:00:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] accel/tcg: Build tcg_flags helpers as common code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> While cpu-exec.c is build for each target,tcg_flags helpers
> aren't target specific. Move them to cpu-exec-common.c to
> build them once.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/cpu-exec-common.c | 33 +++++++++++++++++++++++++++++++++
>   accel/tcg/cpu-exec.c        | 32 --------------------------------
>   2 files changed, 33 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

