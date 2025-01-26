Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55DDA1CE43
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 20:56:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877226.1287353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8jz-0002Gj-Pe; Sun, 26 Jan 2025 19:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877226.1287353; Sun, 26 Jan 2025 19:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8jz-0002EF-Mb; Sun, 26 Jan 2025 19:56:19 +0000
Received: by outflank-mailman (input) for mailman id 877226;
 Sun, 26 Jan 2025 19:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc8jy-00029Z-Dr
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 19:56:18 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a18b7b1-dc1f-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 20:56:17 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2166f1e589cso96630705ad.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 11:56:17 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da424ef28sm48976545ad.258.2025.01.26.11.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 11:56:14 -0800 (PST)
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
X-Inumbo-ID: 9a18b7b1-dc1f-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921375; x=1738526175; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZaiNxyRumKDQ6iU0NUlyhjPpWDJhbWYeJfxDmaXxDo=;
        b=z4qHA5gf9PWTl8eBiP9fikCLJJl+njIkfPxMHp9AH/Bkvbs/RLHifmTfzMA8y55CAq
         +DGWL/ksEgs/9hS2QEtyIxPrOGR2o6ET5mD5uyBN6udCaGY4HX7BeRuas1rUUIBcm1Lr
         CWo4lI0zV7liP3o9PboB4eAzAOzTxfHwf27O8MM7H0HtNIOJS8oV8l/6YnHCnt6RzGgl
         XYgs474X7pMDPcO49LrZRA2EtnR5rRkeLzHrAcgF00JpSQawBGYEOvsvFA9onqgpngPY
         vFOdtE4n3bdzCH/KfLDf/P6JWTKkt2TNI8ROqjrppkV4qIH2r5JJvlsBxu9BNdM4/XXY
         bdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921375; x=1738526175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZaiNxyRumKDQ6iU0NUlyhjPpWDJhbWYeJfxDmaXxDo=;
        b=xUevOntV88FTWjGCJDV+K3oRshgV0h3nFr8r4pC9zyU4kO3suNppE5PzCqreWORW9/
         3q6/i1CpO8TO0sjgAAIbG2Y7F2dBg0cRcnTO5bk3F1OT1lyszRfshRgXFuOG8Uf5qO9P
         JR3S8Kq1HVqLOZ/HVFxgRW4B8jxn2iuRt76XaPA+VrAetnPSEFhRxyP7E5YCnYGMWeyi
         rNOOCmQGV6344WlHs2/nkzFwLpjAZg1q+qgBQK6Bvk2wxZK9wkXkxMwHPlbKHBidcXiM
         aoUccNr6cVqFWu4lxI8DPrRLDjB0pGckjLyK1/FG4eHG1S7PfGmgXUiLFrnlTgsabSmf
         nBdg==
X-Forwarded-Encrypted: i=1; AJvYcCWNCrbzplvL0I4F7D2V4GazIPjdbV545tsGpXcPtfJklML7SOnQk5qdbaHq0VfX3jnw3w9GKoWHmfc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgGir+PgPpTdtu0DGbrzclM7ZGkjhh9v5c5aPCaeLkDIRQwKmm
	TtjHdh9YWBRNYul1jBWFOGRbLcC8lsMlPXY2X+F9UxE4E5g+GNhMn8tlYOOxIFE=
X-Gm-Gg: ASbGncswXQq5RfRksG9dWtji1RBYYmLuI8DcunabHBpHnb+tAiOUWJNfQ/ibVfmjFXm
	v47acqrWughSlwkAiY6KbWD9Iido9qC+buCtnhrsh3Wigi4AAAu9aVMmDM8/pFz3la1MWKJRaBI
	OVolHNje32qQhhBMMqjt6llu2UiK12HMFiCE5Ciay1mJfFfS0l4SCU15ElRzZccKdd1WYSMQQ7t
	l+TYnpUfKbVVsAsQK7Mtagl94gL7/sXdO2pQcCWv4M8IqyS+JbOtPqd7vbmKLxzQjHZ4ki9VTjZ
	6iqebkf6j3JBMNlFxJyHZlazbwXaK9X/ZmFi7JRaQesqznI=
X-Google-Smtp-Source: AGHT+IHO4WMUbjm+0GYB5uvcZM2pATyJHyNJ2uKrCdmerCTV19qq9YWTnaUhr9U9sZ/t561e+9mUEA==
X-Received: by 2002:a17:902:e746:b0:215:97c5:52b4 with SMTP id d9443c01a7336-21c35631dd4mr526655615ad.39.1737921375406;
        Sun, 26 Jan 2025 11:56:15 -0800 (PST)
Message-ID: <51770df2-ecbb-47b9-b5c5-a60decf0f751@linaro.org>
Date: Sun, 26 Jan 2025 11:56:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] gdbstub: Check for TCG before calling tb_flush()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:43, Philippe Mathieu-Daudé wrote:
> Use the tcg_enabled() check so the compiler can elide
> the call when TCG isn't available, allowing to remove
> the tb_flush() stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/stubs/tcg-stub.c | 4 ----
>   gdbstub/system.c       | 5 ++++-
>   2 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

