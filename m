Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DE896587
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 09:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700326.1093292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruli-0007cn-Js; Wed, 03 Apr 2024 07:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700326.1093292; Wed, 03 Apr 2024 07:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruli-0007bZ-Gm; Wed, 03 Apr 2024 07:10:46 +0000
Received: by outflank-mailman (input) for mailman id 700326;
 Wed, 03 Apr 2024 07:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrulg-0007bR-JX
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 07:10:44 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4874c998-f189-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 09:10:42 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516ab4b3251so2736688e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 00:10:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t12-20020adfe10c000000b0033e9d9f891csm16304560wrz.58.2024.04.03.00.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 00:10:41 -0700 (PDT)
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
X-Inumbo-ID: 4874c998-f189-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712128242; x=1712733042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9OF+6JDhc7gnTEjSdyUQx3lEKPLQAuMUaXZrLAt6fY=;
        b=Ecti0A5Sd9WlyOe3jPZz50XEX2AonmzczLEMdlZA0ThEr6sEv7BoWezY/jaqwI4sTQ
         hlHTu0n3C24EaKgiyuk/TSLulvftIuwzsAAqpji0pNpqQUc1Yh3rcSEORVPIWMJFFSfR
         eYleQBrRzqxu54OMnblIdKsO9x/bdDcp9EhqEnW38aQEsxBhojaH/quPj7tbVqa4J+jh
         aK74fcWuAzyZZvR7/CTTWLb49zGc+3Q61hE55sZP97fROD2lcLEOTFNDsPKU1tWrEQps
         ul6oqCeubu6RmIQKLpIgwCZrkssE0Vu+CjXxXqQfCwW9C0fewoFflbHv111CncKA1jvT
         euNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128242; x=1712733042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9OF+6JDhc7gnTEjSdyUQx3lEKPLQAuMUaXZrLAt6fY=;
        b=AFyAdtvAL/rwO+nIuX36+hYqsFFD4BvVFbBlC+PYr4VT8Nzpzi/Jl6fYU6SiFT+vHv
         OGW/qMh1aoIsen3TaIEh6V0zfbO+OYD0pu1xC9fB2Ep5yQJJxUX5EW3SvFkAhPYUhPgf
         6jwYGGflEiKdST5yp8rgqJ7LOwgvMvhZRjWPZh+Oi1kq7m/FUtkJMIFoddkZsIxH9IlM
         hfYM67AKKv01xt4vW2X/Z7ElYHO2IV8p7svGzaeBLAsPW4qqVojytheIdETFhs/nNLeT
         Z6Lbg1F8m1E80L4dgRWG5AYSbRaimAX5ROaiaok+EN05/dahtvZb6uYs9kVzCQuHBtiI
         zuyA==
X-Forwarded-Encrypted: i=1; AJvYcCWUED5e1JbjDemiSuFAoigwqiBpH+gs3VVGNQgg9Rz6TJXQkOKDiMdqW/cK6qWpsntLtivwbhEIxEO0ZlUdqg/AAcrUyI6lxtikC+nXJtg=
X-Gm-Message-State: AOJu0Yxv63F2CJU+ez03PX0Jy+QUfnNFih0nqer5tYZeWC3n6OUkP+d1
	8DhCL8RkDGCjRtlY5KxXPVGJJGGxoFnJTGqGFiyhh+NQ7YJrtaLhDYcpV64eIoQarOmDANKp/R0
	=
X-Google-Smtp-Source: AGHT+IFCaJfHk/kRA1edlyH+Qao3PbsTLUxC+BmRUP/OvwPSJfx70dLeMBQ6aj5QZ+uSM+lg0IZsCg==
X-Received: by 2002:a19:4359:0:b0:513:b159:e711 with SMTP id m25-20020a194359000000b00513b159e711mr11159973lfj.4.1712128241881;
        Wed, 03 Apr 2024 00:10:41 -0700 (PDT)
Message-ID: <0d7daae5-97c3-4982-8301-7ed2fda24ff9@suse.com>
Date: Wed, 3 Apr 2024 09:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drivers/char: mark extra reserved device memory in
 memory map
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240327025454.514521-1-marmarek@invisiblethingslab.com>
 <20240327025454.514521-2-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240327025454.514521-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2024 03:53, Marek Marczykowski-Górecki wrote:
> The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
> map. This should be true for addresses coming from the firmware, but
> when extra pages used by Xen itself are included in the mapping, those
> are taken from usable RAM used. Mark those pages as reserved too.
> 
> Not marking the pages as reserved didn't caused issues before due to
> another a bug in IOMMU driver code, that was fixed in 83afa3135830
> ("amd-vi: fix IVMD memory type checks").
> 
> Failing to reserve memory will lead to panic in IOMMU setup code. And
> not including the page in IOMMU mapping will lead to broken console (due
> to IOMMU faults). The pages chosen by the XHCI console driver should
> still be usable by the CPU though, and the console code already can deal
> with too slow console by dropping characters (and console not printing
> anything is a special case of "slow"). When reserving fails print an error
> message showing which pages failed and who requested them. This should
> be enough hint to find why XHCI console doesn't work.
> 
> Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for the XHCI"
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



