Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4056A1CE6B
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877260.1287393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Ja-0001mA-1a; Sun, 26 Jan 2025 20:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877260.1287393; Sun, 26 Jan 2025 20:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9JZ-0001kV-UY; Sun, 26 Jan 2025 20:33:05 +0000
Received: by outflank-mailman (input) for mailman id 877260;
 Sun, 26 Jan 2025 20:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9JY-0001kP-Dj
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:33:04 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcee7df1-dc24-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 21:33:02 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2efd81c7ca4so4947872a91.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:33:02 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa8122fsm5509332a91.41.2025.01.26.12.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:33:00 -0800 (PST)
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
X-Inumbo-ID: bcee7df1-dc24-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923581; x=1738528381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GarlRROndxCjTPZHSIwatKna1U0gu9y5c+dSUp9779s=;
        b=IWizSva2vHJJsalbX6EfDYbGFwIJ08e/RAaEh4kQhwO3ai0j1APHCnT5PMWaiHnyl3
         j/JSq4kO6w6p3O94PxOqOE2Gu4lRPlOHjJ/GWGcSD07DPtTv6xwnbRfdkWgH3Y9rQIMc
         GPg/Mf1MnMXmSZvnZHqpYJT1YRAeODsnnCaKgf+1MRC8WTHka6FsCt92fkFK6CXZRpHO
         AD8Sbc6FoC8SNJ69KBGmlp4DGJBP04Cb7DvaV15ar/X2YEZ3bN9WyG+P68LKUGgbP9G3
         gXvdN2mAaB5YykyB0O44lv+IZfwtpuDrkQCkTfUgIG8i2okpiJC6Oe/ULEZany3O0sle
         74yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923581; x=1738528381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GarlRROndxCjTPZHSIwatKna1U0gu9y5c+dSUp9779s=;
        b=f5997u9DZ/EnQX76uLJN3AxUi4WbhyGqgtC+vdtlk4kuqVRN33GhVovXfOaT3TPU/Z
         G7E/WRvj7iakf1YDprbx1LxNPI8DKXLawHyg6cPHjzHl+vddIItgW1CRG2Qx/IWwa9QO
         JM8s0hhPoJF27arslPJh9LsGDVCJymMkTrV30d/tfcG7nsrsXqs3VBC0X+lJqhHLRSKS
         Prc1NLelFtrDSqXHc22+5ij+G6Tl9Id5dL6A2UaNKhzr1hgUIP3+hUZgapIJsv+s92+V
         0IuE5wXiAdr13rKqOoABliiFOYZnUSmbqsov4BpBheLz6noG+RKTomUYzxRf8lyn1TML
         5gIA==
X-Forwarded-Encrypted: i=1; AJvYcCW7f59E+MYxMo7DnCNXQAnPymf6v+Jp9moq1wBEDnpZ5FyDLaQ6YpXCtwjmYEPcmjj5ULQNgncM53Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg6eZ2BvO72V+hxgKNasDpELBNKqJva5Vk6p9NR6D465ktGMvu
	hLOLSPVb2v5Mdy8mLFqf19gPylIGFsc5/rn8x3myarWuEFegosriOawZqemV4KY=
X-Gm-Gg: ASbGnctPKQUNg6X/9/ND+foM6xGJ3rSUcuU9cx9hBSrku+mTu5s6kDtMxlzw9jnm1zh
	2HxADMrnhda1kcR9kNAO//j5U3RhaMf0t0Ogvjhcsif4Cuhxs2qsrFkOMob+/w06wye6MQobxIA
	rKTWK31U7DP7vkXxQw3wN/Xdgqlyp/8JBWCnLEvEckK2PG/rcefTlGLddePPe19Ec7wxox2SXzT
	zZWmOS8/gwrT776DxeQ/6/SClr0qfyVlX74ROho7KtLgfVBQWLTFHbvdwkb5aapiLyVn5cQXJXD
	hz3R0cM7tVE7M41+sxquJV1zg9yXBiT9sW57rRuuJ1VmLUA=
X-Google-Smtp-Source: AGHT+IGrTF0ua3JOvhdmIhcZ60si5thXhjyK00MEnuyxWBq+ow6bXi0deca44yvyI2f3m7/CVHkiOg==
X-Received: by 2002:a17:90b:3a0e:b0:2f7:7680:51a6 with SMTP id 98e67ed59e1d1-2f782c55be4mr50581605a91.6.1737923581153;
        Sun, 26 Jan 2025 12:33:01 -0800 (PST)
Message-ID: <525918e8-b114-49de-bf4f-5b6e1c04d29c@linaro.org>
Date: Sun, 26 Jan 2025 12:32:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] accel/tcg: Restrict tlb_init() / destroy() to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to accel/tcg/ scope,
> in "internal-common.h".
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/internal-common.h | 11 +++++++++++
>   include/exec/exec-all.h     | 16 ----------------
>   accel/tcg/user-exec-stub.c  | 11 +++++++++++
>   3 files changed, 22 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

