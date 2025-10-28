Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E5C1372C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 09:09:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151964.1482506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDelK-0000rM-W7; Tue, 28 Oct 2025 08:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151964.1482506; Tue, 28 Oct 2025 08:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDelK-0000pF-SY; Tue, 28 Oct 2025 08:09:02 +0000
Received: by outflank-mailman (input) for mailman id 1151964;
 Tue, 28 Oct 2025 08:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=alTg=5F=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vDelK-0000p9-4a
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 08:09:02 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55438b50-b3d5-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 09:08:49 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4711810948aso41288595e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 01:08:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6?
 ([2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952ca979sm19308604f8f.14.2025.10.28.01.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 01:08:48 -0700 (PDT)
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
X-Inumbo-ID: 55438b50-b3d5-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761638928; x=1762243728; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVWTljkXVCTmCGl9b8w5geYtD3dB6kSA80gd6yn4Cfw=;
        b=GOLIorxhL15QwQx/pCyK4YXt2lS1vtr9YVkIa6nIbQ8xyhMWiPCx9hFnjbwIBGF6FJ
         uNS8tUJEJMlkFxY2i2S1B/QjVJtOpDQ0drwviJrwr9dtJURNJQZ4DUhf8bBAonSyQuGq
         He+4t+6L6KaF3QtaIT2YDbKROZgU7YLqRnoK/eksqpGKrMC6BYnReHXaVecvVdn/K+GB
         DcGOsfEXB4LnXCDz8OeeqVp4PH/X5PE6MrKiLjJDoJR9/w1uLFEh26KjYWmhhbW/k9ly
         aiRddrp1s6/7XlvEoR427iGpYNrP/I3juczsPH41DfvQOe0+27aEeYdb4xTPBx+crBnk
         HqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761638928; x=1762243728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVWTljkXVCTmCGl9b8w5geYtD3dB6kSA80gd6yn4Cfw=;
        b=sYOKtR/5GDRf4E1wd0vMMLO88+QxpYvSXudzUx/8d5/wBzHhzILT26YyYB5bJ+hx4Q
         LESgB+I1PkRkB4zorT+eEPHECd+H4REZ4x6bRXqeKdgpnfweOGe6jmecsxOU0JhBPRgu
         rg7YZKwnbrSro/yh6xIMAYBRYNFoERy48a/g7P6przZAwDhSv5equwn4EnRMBSK7CKAq
         9BOtzEkpH0lVUrM8Ir6XmZBQA1n7d6J1G3rF2YUKembHgvr2Ck+5hMmNvq63+iQmtj0W
         xwKk5n24esBcWT4VmBL25mH4J0lhjvfHCNbimvUgEt3NA/PiGO39NpwSIDSpR1QhnNi5
         6zsw==
X-Forwarded-Encrypted: i=1; AJvYcCWEBu4S5szsisKaP1Tq9BHP7cdOon8GK2M36G7UZIna/DyXj1AzCky08nqbHruaDW8mCt8yctkxj6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9KD9mMk+vPkYlkSlOlcn1tCp1bJpWLfdNNt6lTbSQ1Qcmv3TU
	mZKssbyZ+DmwHddYhWtcQ/HxpT/uUaeCyuLi4YgAUMUI4BMrchhmhsPZDVGvIQ7o5mw=
X-Gm-Gg: ASbGncvaZ8wewyx4Nh8GjKxqkp7aUqlSWrtEljXRZQNmGECEkjEjqx9R4nfMcLJmNvM
	9+C7jnoAfHs8K3tYXNmg1uKfurqgE7bmTYZL9nVH5niiLn68N9v0TVNy92n5e40jGJGpEPadm6u
	91amu1Dl8bN+8lkz25tdOt0F3XB1D5ZHprPMu/Xws4eS+pc8193V/I4uUQW2yj3LVZNkTbxf4Al
	Wq3WdvdsYKvzGIgb6BmSyTCjxwtHIUfzI38/87IX+mM+VyFRYVqKojUyJpGVK12W/UuEdti6u/z
	izhkspPdl6H159zKFvmL1H5jo+abRJindRrW5OJZ9+evK9KiPQ4WL8P/zTM6oc1XWPbZut9Wntg
	BZBhfUFs9b9sRFu6K7gRK/LaqndUrj6o+ATHUV14AwqNXL49T/JKGgYWM2TmKUmA7PfC/kgv+kC
	aV4pZWJJWY8wcWT3XpxBzNerU1vIVziCrUa8WPNULeeYbO3rljsTse5j35ejxdZ7cN1g==
X-Google-Smtp-Source: AGHT+IGY5X9k/KotatrXHbgp+P90RfyZdcomc1ztZNfmPPso1qSeRiOhZLBaZ+Ip+tZXndK3csp0SQ==
X-Received: by 2002:a05:600c:5487:b0:475:de68:3c28 with SMTP id 5b1f17b1804b1-47717def760mr22830775e9.8.1761638928418;
        Tue, 28 Oct 2025 01:08:48 -0700 (PDT)
Message-ID: <e25cb599-807f-4e43-a96f-27cddbec6c0b@linaro.org>
Date: Tue, 28 Oct 2025 09:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/xen: Use BITS_PER_BYTE & MAKE_64BIT_MASK() in
 req_size_bits()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anton Johansson <anjo@rev.ng>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20251022140114.72372-1-philmd@linaro.org>
 <20251022140114.72372-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251022140114.72372-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-10-22 16:01, Philippe Mathieu-Daudé wrote:
> Replace magic 8 by BITS_PER_BYTE, use MAKE_64BIT_MASK()
> instead of open coding it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xen/xen-hvm-common.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


