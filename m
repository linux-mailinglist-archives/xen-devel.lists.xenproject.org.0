Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6AAF6413
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 23:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031571.1405392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX57T-0002gl-8Q; Wed, 02 Jul 2025 21:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031571.1405392; Wed, 02 Jul 2025 21:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX57T-0002fJ-5U; Wed, 02 Jul 2025 21:35:55 +0000
Received: by outflank-mailman (input) for mailman id 1031571;
 Wed, 02 Jul 2025 21:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFEm=ZP=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1uX57R-0002fD-Jp
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 21:35:53 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 862badec-578c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 23:35:51 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-235ef62066eso93470695ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 14:35:51 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39b93fsm136116685ad.119.2025.07.02.14.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 14:35:49 -0700 (PDT)
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
X-Inumbo-ID: 862badec-578c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751492150; x=1752096950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hg0qj/WAsIhSzKk50qSOHcs9sPB5yADg/xMC/cighLg=;
        b=UMt+bxLkcimMwkZly1Rvd8ydGn1CqYevqgDo6f6rArhELhUJVxTT/R5dfSYHC9DAdy
         01T9YgfSCGUyl4rIfRm57zQo0U8+ARVMFTlTKHJkQQ8b1udFTwAdR80sNcFRrx4cB74X
         h7wI7+XBpRRiuWNZs5NunEma/vVOJiVJG2zSOiDjOmQG8yYdRyGaU5QSgw+BUfOLG1ko
         WLKsnilxG2ppwrq/bpx+3eyelw5ldjOWmQXd6w6S1Qt41QfarqEWfW44C/rTlqGJNqwa
         0a0ecqScRWf+N9gsktw2RKMM4cjQ/DY2n5lmlzCWg3ZIo05zV2kTaTpxUnirKGrxNdDE
         JJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492150; x=1752096950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg0qj/WAsIhSzKk50qSOHcs9sPB5yADg/xMC/cighLg=;
        b=VYh6yUdelPsoCKYgT7yfZWHdMg92cAnsu/93sLHM+2+jtcCnexhPFh+UgbuqkVPo+b
         P/GPsmd2HU+CSOAwMWUp4ByMh0qVMLUnrtp8wyZ/6Z4xBdzsoB48YgE6ecFo1XwrJqKz
         rBi8rKhH5xBzD0xURMNKMe7dM7ml+FSmGkCoi1v19X3RDom6tQQWfcucvwvy0pdC/QMG
         Z5vcDbX5Yb1fqnTqwd/v1hC5szgdU8/dCH1NpbKcSaM3LglWUuw/ukt2MXRv3uf5xpYB
         twjPkJl/2fZsg0lob8AgUzun7SgtccyVXYesSkyRwRFbtul+g7BPOh0pDJNrQHbo8XUG
         uCUg==
X-Forwarded-Encrypted: i=1; AJvYcCX3rDFEnI8wKfA77QTUEJXvUtjezC9HhtHrZhqdHLAGeDcyP2DR7V7EjW5aEvObTSjTxvgjwojpgyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCJtTb3jnTHBYZTU0bwtmIOKM7biSuabKh5CMSO8poR3r+nzE7
	y9P/inqcjIa9EEps3TB7y7Qw8HxIUk8BCMKPJFudKV/MJyBWdgBAqM9F1zSIzvjHO4k=
X-Gm-Gg: ASbGncs0mJ5FjovHcWzlkWFCVNoXlZdLFDOlk/7NV/GHj+4CGf7xNr6+1Cu4jyfj8Yw
	LXbdPzWfb+/f9IR2K577wg+Pxv5ZPUCarT6dxkZL7ngN/93rMaHZ2QEBHAVCOEP8mFTfx/DFcq4
	L1+hdUddSHEpQrHhmuJ1vnPhsY4XUFJxTl8l10Kjjr+UshTjxgoHVVSvoNcD/Ha6UFHO6B7fYR4
	/rw2SDGefXT2SwFFbiHczoYfbuGHfQiYImCAv1rEXFwzYJjkc0zRbDK5zvBhBZheYvMsgzwDC2S
	VfKyFumTs5qdwaqVaZDly9jqWzMsxuOW/XWIQAz86/3MBjn+BqvcHzIPsQOWcOb61JHE8wBB/1I
	=
X-Google-Smtp-Source: AGHT+IGpscWHzvkBGYWVvFV40B4JDIxA1z+rgMXJn4WUCElOgiG44deUfbMutc97UiUsHwDJJULrfg==
X-Received: by 2002:a17:903:b8d:b0:233:ab04:27a with SMTP id d9443c01a7336-23c6e5f389emr81341945ad.53.1751492150010;
        Wed, 02 Jul 2025 14:35:50 -0700 (PDT)
Message-ID: <0ab88797-7466-4b83-95d8-efdb04369664@linaro.org>
Date: Wed, 2 Jul 2025 14:35:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 59/65] accel: Always register
 AccelOpsClass::get_virtual_clock() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-60-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250702185332.43650-60-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/2/25 11:53 AM, Philippe Mathieu-Daudé wrote:
> In order to dispatch over AccelOpsClass::get_virtual_clock(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::get_virtual_clock() mandatory.
> Register the default cpus_kick_thread() for each accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/accel-ops.h        | 2 ++
>   accel/hvf/hvf-accel-ops.c         | 1 +
>   accel/kvm/kvm-accel-ops.c         | 1 +
>   accel/tcg/tcg-accel-ops.c         | 2 ++
>   accel/xen/xen-all.c               | 1 +
>   system/cpus.c                     | 7 ++++---
>   target/i386/nvmm/nvmm-accel-ops.c | 1 +
>   target/i386/whpx/whpx-accel-ops.c | 1 +
>   8 files changed, 13 insertions(+), 3 deletions(-)

Seeing the pattern in last 3 commits, I have a question regarding QOM.
Is that possible to get a constructor called for parent type 
(TYPE_ACCEL_OPS), where all default values would be set, and so every 
child class (specialized accelerator) would just need to override the 
field they want with their own method?

It would be more easy than explicitely setting default values in all sub 
classes, but maybe QOM design is limited to that.

