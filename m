Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B991FA6763A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 15:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919167.1323677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuXp6-00067H-Ug; Tue, 18 Mar 2025 14:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919167.1323677; Tue, 18 Mar 2025 14:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuXp6-000649-RX; Tue, 18 Mar 2025 14:21:40 +0000
Received: by outflank-mailman (input) for mailman id 919167;
 Tue, 18 Mar 2025 14:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuXp5-000643-8n
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 14:21:39 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a4258e7-0404-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 15:21:32 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39127512371so3439588f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 07:21:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975bdfsm17992490f8f.49.2025.03.18.07.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 07:21:31 -0700 (PDT)
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
X-Inumbo-ID: 4a4258e7-0404-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742307691; x=1742912491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zzy1FTbxBz94Wx5+6wRzG+gEp+9i76NG/JOQz/eqDiI=;
        b=aUtOPcJBc1VEJ5u5MydH5bfoQTjKq0VlJgP2QKh6z7gDPNo+K4JR3cCBBD9YuqDnTT
         5ZgMQptoEVI270J6tulfell06iFrxFeuR+1yL+O0+q57I62vNR84eS3ldo0g3JPsxVW0
         6xJktvwA/VzGmzNqhe42seawQ4Q/WsCKaf1CfWNrhZjTMQ3iZ8aoV463nCSatyl0LCcf
         NEMDZ22HUMnLoJGqw+pre0xHzy+jO+or/Xk9yEGV8v4Q2UnrXWb4vy6G98Ez0dwKE9sw
         VpTS0JXnEgc8m7O9rDXjJnmFo9QhXoiI8plebuGwFoZanuFA1FEpA3M95BrInWw1CJqQ
         iVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742307692; x=1742912492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzy1FTbxBz94Wx5+6wRzG+gEp+9i76NG/JOQz/eqDiI=;
        b=DSDBYUar1Ii351VET2vNQqc8yPRUA5EO3Odv/002XzCR+BsBTbOf9hQoblNDHpT/m+
         FJKA1SXlMXvCVT0djf+EwyK5zdEOHKH7VtQhPnua8qgs7tR0ZOv+g1tBZR/ONxcgos8Y
         QXPBuD1GJTVbHt0nDEWEtHzzdkaDyz9yL9jgTHjlVhQ9AewmwhUxQt/T3STEJt4LhU69
         b1ethV4Vp4elt0Kr/gIQ9MIyN0GGmskMdChI7NC/3U196A0PFGtqpj2+iBv6eG0HyRfr
         fKWZ3oudp9omHOLNrIKPmkb5Eq80pv/ZcCbUXof9rT5EyTDqbzk3JY6J+EnxDyegRLeJ
         DY8w==
X-Forwarded-Encrypted: i=1; AJvYcCX0dRaHamLTF1SbQR7nysaFgOmkZ3UbpzbVYQSMyQ81FGCgSUazK47QutogrgP8U1ijfzF8NQHKxeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuzwXH4Tjmvvfqw/WkgPyQhVFPVqeGrDfUPBm5FI+amK5AH9r7
	lks1B7PifjWyhN8OY3vq9D0SgpCVZqZoUs5WNeCddhD/1Nu6F7xaq2qry1M+nQ==
X-Gm-Gg: ASbGnctGQ6iyuyJYtYZ59+lSBZqx3OmsfD+TaB/P0vdQVVsdpdiSS7HzeI6n0C37ekk
	FmQYiQMw1ShlP9cT6U20xmtj/E9RttP/FFCvpQKBcBwNFfLT+B4CMY8WijYOaHCr9QbtFwChl8E
	kz++5V2SEM1Xf3TtSOgscCk3rBj1u9Ge8F+ZvGZzID6q9Tfu41Xl///3f5UIUkk/y/CC2/6BgI+
	u10MrmM+tR/adeOY9mmtKFSBPzDb3HqmznSdKrHiFr8P7vNSOLQp8rAXYOdRsmHDzDRuZ8ZhaG+
	P6dXbZlpYMqY/9v8fA+/r2sy6ob3OLf3Uc+erIFoV6C7YmxdcNXAb4KaA0/waFs6okBXGKWRmib
	KyW5fKkjANo0hSBz5WXkyNnEbASSXzw==
X-Google-Smtp-Source: AGHT+IFKklDr5vtbddJU1L+D5iRc+6UYjrxbIW42trSA+bYAyy8ZzmrxzYr7ByHKh/GPrabe8oiDSw==
X-Received: by 2002:a05:6000:400d:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-3971f5114b2mr15789241f8f.47.1742307691567;
        Tue, 18 Mar 2025 07:21:31 -0700 (PDT)
Message-ID: <57a8847f-121f-4a8c-922f-7abd8dc6b9e5@suse.com>
Date: Tue, 18 Mar 2025 15:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/compiler: Fix the position of the visibility pragma
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250318133947.607492-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250318133947.607492-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 14:39, Andrew Cooper wrote:
> This needs to be ahead of everything.  Right now, it is after xen/init.h being
> included for -DINIT_SECTIONS_ONLY
> 
>   # 1 "./include/xen/compiler.h" 1
>   # 83 "./include/xen/compiler.h"
>   # 1 "./include/xen/init.h" 1
>   # 62 "./include/xen/init.h"
>   typedef int (*initcall_t)(void);
>   typedef void (*exitcall_t)(void);
>   # 72 "./include/xen/init.h"
>   void do_presmp_initcalls(void);
>   void do_initcalls(void);
>   # 84 "./include/xen/compiler.h" 2
>   # 122 "./include/xen/compiler.h"
>   #pragma GCC visibility push(hidden)
> 
> Fixes: 84c4461b7d3a ("Force out-of-line instances of inline functions into .init.text in init-only code")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



