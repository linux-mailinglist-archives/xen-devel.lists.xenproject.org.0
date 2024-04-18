Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EC68A9DEF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708457.1107390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTJQ-0005QR-UJ; Thu, 18 Apr 2024 15:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708457.1107390; Thu, 18 Apr 2024 15:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTJQ-0005Ou-R9; Thu, 18 Apr 2024 15:04:32 +0000
Received: by outflank-mailman (input) for mailman id 708457;
 Thu, 18 Apr 2024 15:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxTJP-0005Oh-7H
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:04:31 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4d28217-fd94-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 17:04:30 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34a32ba1962so305864f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:04:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b0033e9d9f891csm2069683wrb.58.2024.04.18.08.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 08:04:29 -0700 (PDT)
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
X-Inumbo-ID: f4d28217-fd94-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713452669; x=1714057469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rpoSszH3udoIn3xJc7bXtmO/UoT9xxfKDgWMe3Fvx8=;
        b=NFvRDMrMkxJ6fvWNO9i59yWJo4aebUEb6Txj1dde4/IV79/VEfiXDC9xcYea0TSQ3F
         svLptIAgnyyjdAblbh/NSg5bmLUbla3dCfywgxME8nvzjOEBwi/61WFpev0hSikFBo+0
         D/y01RQ8rV+ZXMCq5WcQR9l4qk0+m+2e3/8u/B8dPwXk45KoWRSBt+zhFVZCJEB/EWy4
         lg5FbxsINxmTHTWPGegJEncMsucpjHSu5VKPpnrNND4wSuCiI7Abl6LW72GL9Tno+yi9
         6/JYJdMVwD8KZqp+9uVUJwlnxOWaVVZEsJ2O5gX+2y1faZc8P1MstpbT9rEkR0FxzvFO
         vuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713452669; x=1714057469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rpoSszH3udoIn3xJc7bXtmO/UoT9xxfKDgWMe3Fvx8=;
        b=dcNXeqg36kjPHO88WUs6urfyp4dEa0BQsz0OZl7NHaqzTbueES+yRY7sWA2q9LsFz9
         Q1NqpQ7JyZpOdnuxl0tCbXrmGvt+4gO9lra/3vGXG09j7fRvuh2FsmwmUVpuQ3REEZmf
         TzdCypwNoJuQl1DmRBjxG87zYOLot/1XOdlSqKFlgFcBF2P87+CbhdqimwuMScmzS+U2
         SSwiHQatX8OTzGoBeryZN1JO7xOHBrXSnBc5FGMv27PrNtdTPbpmx08rc+00wefoXjOX
         AMTx18zbblsxyV8bycS3PoUgSjiVJuajep/5C7vnlFxmGxwH8a9yWCASZJTYHO+pl328
         2Exg==
X-Forwarded-Encrypted: i=1; AJvYcCVoWOmOcsXsfoM4VdxCHpLU1jEUEBt6KMEx/8hPSDad/Wbg/hS/j1LFiaw/ryLl/KI72qrBXSSbkB8v0mmGFrUyMvLwDOieMCXMw0zBNLg=
X-Gm-Message-State: AOJu0Yx+cxJcFuO3oEznOEuxhMgXoFuqEN0YRSC+9sGMMya2ok4oBJAG
	tPqWlGZXP06MyYfxacmJiYvwFXfINPTpxahFzq/iHbA71OC5NkomReFIDYLCCA==
X-Google-Smtp-Source: AGHT+IHKpl9SKp2Fimftc3C6ECMd9rQ23jomxLOCGWdEG8bWAOm8Dv013pb34Y3eQTZKpNNjkNcEwA==
X-Received: by 2002:adf:ab1a:0:b0:343:f335:58b with SMTP id q26-20020adfab1a000000b00343f335058bmr2220391wrc.62.1713452669455;
        Thu, 18 Apr 2024 08:04:29 -0700 (PDT)
Message-ID: <5ebbdcb8-de53-4bf8-bc43-d9296879616d@suse.com>
Date: Thu, 18 Apr 2024 17:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
 <451705505ff7f80ec66c78cc2830196fa6e4090c.1712893887.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <451705505ff7f80ec66c78cc2830196fa6e4090c.1712893887.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.04.2024 05:55, Shawn Anastasio wrote:
> Arm's setup.c contains a collection of functions for parsing memory map
> and other boot information from a device tree. Since these routines are
> generally useful on any architecture that supports device tree booting,
> move them into xen/common/device-tree.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> Changes in v4:
>   - create new xen/include/bootinfo.h rather than relying on arch's
>     asm/setup.h to provide required definitions for bootinfo.c
>   - build bootinfo.c as .init.o
>   - clean up and sort bootinfo.c's #includes
>   - use CONFIG_SEPARATE_XENHEAP rather than CONFIG_ARM_32 to guard
>     xenheap-specific behavior of populate_boot_allocator
>   - (MAINTAINERS) include all of common/device-tree rather than just
>     bootinfo.c
> 
>  MAINTAINERS                       |   1 +
>  xen/arch/arm/include/asm/setup.h  | 109 +-------
>  xen/arch/arm/setup.c              | 419 ----------------------------
>  xen/common/Makefile               |   1 +
>  xen/common/device-tree/Makefile   |   1 +
>  xen/common/device-tree/bootinfo.c | 446 ++++++++++++++++++++++++++++++
>  xen/include/xen/bootfdt.h         | 116 ++++++++
>  7 files changed, 566 insertions(+), 527 deletions(-)
>  create mode 100644 xen/common/device-tree/Makefile
>  create mode 100644 xen/common/device-tree/bootinfo.c
>  create mode 100644 xen/include/xen/bootfdt.h

Should this further new file ...

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -295,6 +295,7 @@ M:	Stefano Stabellini <sstjabellini@kernel.org>
>  M:	Julien Grall <julien@xen.org>
>  S:	Supported
>  F:	xen/common/libfdt/
> +F:	xen/common/device-tree/
>  F:	xen/common/device_tree.c
>  F:	xen/common/dt-overlay.c
>  F:	xen/include/xen/libfdt/

... perhaps also be added here?

Jan

