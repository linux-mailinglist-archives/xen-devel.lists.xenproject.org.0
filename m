Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3EBA1ADA0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876479.1286866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yb-0006zM-NT; Thu, 23 Jan 2025 23:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876479.1286866; Thu, 23 Jan 2025 23:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yb-0006w1-K6; Thu, 23 Jan 2025 23:51:09 +0000
Received: by outflank-mailman (input) for mailman id 876479;
 Thu, 23 Jan 2025 23:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6tZ-0007hN-9Y
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3041449e-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:45:55 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so16032555e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:55 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47f355sm7140915e9.4.2025.01.23.15.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 15:45:53 -0800 (PST)
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
X-Inumbo-ID: 3041449e-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675955; x=1738280755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIImxUuZ28chVlLL+vN1mb6UQluYe71i/J3SLXui4EM=;
        b=kAPNveCIXFEMkKGA1q4Ps84Wkn0js23LmfHkvmJWBelJ0ETeR4oFk2q2ZsHu2R5gTN
         OWG/WINmUUc+ev83A4A2V64C3ncICF+bceHMGliX8Rd0MKjbadhSn1tH3iuf3bBqaqxZ
         +AiLx+x0LR5DFWCHz8I9gXjb5oKRBIWsh32zvsVa/EAfQpfC0ELsa+0mSqBfXY0+naCd
         DmDQDtD6XHYe0gJIdQQUESXfK0/ZG0/yqygaz5QD+we5AtxspfjUoO/x0JZo06nxRlKH
         JdVdom//19VvXkcr/driW+xuXDzG94kwCHW6ME9dy0eaoe99rH9dL8XhLwic0oJ/8fcU
         gkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675955; x=1738280755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIImxUuZ28chVlLL+vN1mb6UQluYe71i/J3SLXui4EM=;
        b=AVzBi6Fujm26gE4T+Z/2HDRWUpEvkcwMWx09eb1WgO6nSjjkQexwUHTxnCiWYl7XvT
         dZX9PNXumlfE3vOIezwptJviiFzKqRsBPxMhFTntpTzauebq/UwlgJCOU/Z4GsvSXqc+
         rsMzfTWqq68RUV7MZNNoQXbjQa1mxzsdk8Yjy7yX8zeMc8IfsOJ0eA8dQ6NxxT/Cq1uw
         Zb38mB7jJW5sUtx7PiD8VWXGmc7PdqhzlpY8DXIX0V8uxO+PJfFi0746X+NdLsImNfGv
         i4BEcd0ETwpk1cFHT7PX1r7y5zvSlBQEhDOJkFCX90NJpUvFI8DGMm/0hfcDl/Nov9SO
         rn6w==
X-Forwarded-Encrypted: i=1; AJvYcCX8L+NzcXcTq2fGLhjZe1QG9xoF/9Y8RfoLleu8wF1fssPmjIF4SQvltaZcE6Hsjmtw0G5W+O5TVPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDUIBBwm3w7MbPpX957K/e/OsWvyEXnXjs6L1owQFhnUX547j4
	EOgqupgeJJcfCFebWaBB7Nr6Bp0hvRtO0gdmXjmF9ClLtvYMOgINoX+P0c842D0=
X-Gm-Gg: ASbGncv+shEOpmOZ4lravWKGPDbJffxlwYJa0zzKmJz3d9jJ/AdWH0aoSsP+6x9hU0H
	hGDLH4Th/nnYosWJxEitYuuKSFpjvHQT58gML1GndA874LBkI0ET5G3AE7FhSmVig5Ay2MiaOfi
	IaMinop4KQQp9HPcU1Vq7UJH9Da7/n9pboWcg6f0uhK4HzpMmR/KNWDUPdA2YqvhH9w3Q+Ocu8e
	sevUHNg+ilEd5Pe2lnYE70RCADOM7kIYC21uYGL4eP0ApMj2vq9D7RMN16Z9lNIOc3S0qfpa/8e
	OtIUEAm2vyvjlj7m+7QjIZj677WAQ+6ctkS3ey40ke6cnMWbnOLwk84rifI=
X-Google-Smtp-Source: AGHT+IGfBJfULhniARVxaeHND22dVQGvVM8jm6sNf2yido1MC4lasaduEx+qwJvir1julFx+bnHZjg==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-438913cf2e0mr264387845e9.8.1737675955349;
        Thu, 23 Jan 2025 15:45:55 -0800 (PST)
Message-ID: <3ef3ad0c-0f53-4588-aaf2-f6fd712ebd41@linaro.org>
Date: Fri, 24 Jan 2025 00:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] user: Extract common MMAP API to 'user/mmap.h'
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-3-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250123234415.59850-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/1/25 00:43, Philippe Mathieu-Daudé wrote:
> Keep common MMAP-related declarations in a single place.
> 
> Note, this disable ThreadSafetyAnalysis on Linux for:
> - mmap_fork_start()
> - mmap_fork_end().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I forgot to include:
Reviewed-by: Warner Losh <imp@bsdimp.com>

> ---
>   bsd-user/qemu.h        | 12 +-----------
>   include/user/mmap.h    | 32 ++++++++++++++++++++++++++++++++
>   linux-user/user-mmap.h | 19 ++-----------------
>   3 files changed, 35 insertions(+), 28 deletions(-)
>   create mode 100644 include/user/mmap.h


