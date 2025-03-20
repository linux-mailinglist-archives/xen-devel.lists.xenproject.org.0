Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD2A6A9C4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:25:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922584.1326490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHlx-0005Up-Fo; Thu, 20 Mar 2025 15:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922584.1326490; Thu, 20 Mar 2025 15:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHlx-0005S7-C9; Thu, 20 Mar 2025 15:25:29 +0000
Received: by outflank-mailman (input) for mailman id 922584;
 Thu, 20 Mar 2025 15:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvHlv-0005S1-Rv
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:25:27 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cb1cb66-059f-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:25:26 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so6035355e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:25:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df35ecsm24338997f8f.16.2025.03.20.08.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:25:25 -0700 (PDT)
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
X-Inumbo-ID: 8cb1cb66-059f-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742484326; x=1743089126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gEUbKZB/JD85H27F5br8Xv/lLIyta+vqe3JK1ggtQdE=;
        b=N0YvjIz7TYbjrpxMR4GH78BjuBYySRilmvag4GqSGxDnEqCJ+dd4oK9lswggkOkChe
         yZdiNWZZK5fx3IaVpVBM2v/YTUnwwYxLqy1odyiK887Xn9BJXXDWPnyoE8poVHU2nwSB
         85Yb1Oo0xwclTWaqlXWlhaEn7+HJwB4o1nLcR9moeZGXYAy9pKhNhzHjLbSZ4n6egBjz
         nWdQXX+s/SGjqGoqySk/URObTOl1rzIYjFa6BH2QBU+xdQc4IHWo6h4826dQD1pUtdbz
         j/Re8mSnLs521R+aon/V+Kr9ds3DisSLsp//TsBDYPJjt6XO0OcdF0infc05d7NF3F2y
         /j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484326; x=1743089126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEUbKZB/JD85H27F5br8Xv/lLIyta+vqe3JK1ggtQdE=;
        b=BD8O01qs48wx/e93yfFq+xclrtJkMCQ0FKE9HKOWfP5IAJSEJykmd3a9S9GRB8mjBF
         fFIJt5AeJ6y/ZmT1BPtpcx+V2n90Pc9L4eobfJ0GkzXEOttsD93Sp/bEzllg56xJZft4
         TYX2GNwxXFSIx5rSQtFjz5FymHWenOQzEI8BtCv1a+Hc4QBUAFFVzWl27q3saY4mbRWi
         1mx8WiTMuRVvE71LfBefn3L+XRd7A/93DUyhGd3tvGJmqZaYPnqq5S/VeXLmeplLtRSc
         8l647hnjXDrMoA0cm4SEXF7GpgTbJQdxtJ0iKttCqlCtsuIbPniCIXTVr/vKJmBp5KS0
         xVAg==
X-Forwarded-Encrypted: i=1; AJvYcCXcNuaI2L/MhRhG/1aeRdlO9JDXkAMrwvRy9/YhXVbBhHWnLukLlU2nNhc1LXvPh8B0MpePzkV4ZEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxGoHIKfFv0lYWC0TtZ1ev/5OroN02n0mODoj1BwcVJ9ZYVOMG
	+u3p2mdhnyhKoQr5W+5swB4yrFfD4fym6IfAX78eYrxUbk4WKJeBQD9rOHBUHQ==
X-Gm-Gg: ASbGncugNaENLNPC+7HPuYCTWoIn+Z0YKmLfXLPqGyGeSH/E0O29MZUS1seN1fVQ3gm
	0dXHwxTJiHkrofDMZ7V9rYdwSFz/Q+yonoAbIEXHxuCqCrzidxTcDYt9F/IAQrV95bxwxIRHDv9
	lsjsASB8UkSEmqner41vovh+i7F3XwibbzYrFm2C0vFQbthlLLOH4R04YitubRm53KNjjFvvPrj
	7giB57MkZnOkTZ7dKnx/6rBHqOXyIbj9gyMcwptRjSctWcG6vkC0AwT1atrlfzHcpwssIDa4X5X
	ksPfxEqVH2PR+LC6D8Kfp3jYLz/ZxQr4Gxh0zEQF894ZhacCtklCHsMpkP/bsOuFDCniynYIte2
	wYGO2ZampTbDW3ekIV+4PktoFFwmYfg==
X-Google-Smtp-Source: AGHT+IE7ntGlOn2a3s/zlWJkPapjdpwUbH2VitOJmdZoSQ/9B7gYht1DG/mpye+kHfiGVOpgV+OFLA==
X-Received: by 2002:a05:600c:3552:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43d491bfe15mr42946865e9.15.1742484326203;
        Thu, 20 Mar 2025 08:25:26 -0700 (PDT)
Message-ID: <92a378b3-c041-4573-8abd-4ab07a4338ae@suse.com>
Date: Thu, 20 Mar 2025 16:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/vga: fix mapping of the VGA text buffer
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250320151109.88228-1-roger.pau@citrix.com>
Content-Language: en-US
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
In-Reply-To: <20250320151109.88228-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 16:11, Roger Pau Monne wrote:
> The call to ioremap_wc() in video_init() will always fail, because
> video_init() is called ahead of vm_init_type(), and so the underlying
> __vmap() call will fail to allocate the linear address space.
> 
> Fix by reverting to the previous behavior and use __va() for the VGA text
> buffer, as it's below the 1MB boundary, and thus always mapped in the
> directmap.
> 
> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless a remark:

> --- a/xen/drivers/video/vga.c
> +++ b/xen/drivers/video/vga.c
> @@ -71,7 +71,7 @@ void __init video_init(void)
>      {
>      case XEN_VGATYPE_TEXT_MODE_3:
>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
> -             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
> +             ((video = __va(0xB8000)) == NULL) )

Without having a good suggestion, find such dependencies upon the low
1Mb always being mapped (in case we wanted to revisit this, for example)
is going to be moderately hard. It might be good to somehow mark them.

Jan

