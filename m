Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9225CA436FD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 09:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895472.1304096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmq0f-0007EF-UB; Tue, 25 Feb 2025 08:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895472.1304096; Tue, 25 Feb 2025 08:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmq0f-0007BF-QZ; Tue, 25 Feb 2025 08:09:45 +0000
Received: by outflank-mailman (input) for mailman id 895472;
 Tue, 25 Feb 2025 08:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmq0e-0007B9-Ej
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 08:09:44 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dde3754b-f34f-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 09:09:42 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f31f7732dso3188406f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 00:09:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd883934sm1453433f8f.59.2025.02.25.00.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 00:09:41 -0800 (PST)
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
X-Inumbo-ID: dde3754b-f34f-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740470982; x=1741075782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yi0cN2INj1fQJVh2SYrayNgPNUBLs6318WF7Roxvjlk=;
        b=Wl8yxlSbxKDBPqfSvhVYkRhF9JqlreBvey3Fzs2QMu2MiJQrcYynh51bDT18qKNCuf
         00+3OsBv/G8G5YhzqE7qoJw1rRJMaSqh2biXlt2M/55eimIibwZB1Tjzawpir1jYF6dm
         BHNebLhgGotmxK902sd9zn4SAOE3blIraeYTKzntMyqKK+QmWQb8Q3r57xoJPz38szEi
         O4uMXyeogIVSSqAt1K76QgXL7nYTVsKbLGj0xgwRd+WPurdeTf/Zeddvc/SvOUe6tu5O
         X2IMFzdsFQJLBYDfUoCXAdTlKDuUne+QFe8WDRH18DZUFWM1TG7HWi/71aAVuUMCDZ+1
         EQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470982; x=1741075782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi0cN2INj1fQJVh2SYrayNgPNUBLs6318WF7Roxvjlk=;
        b=JavBunVbLCLVVE5/bAk0oe//BAbDxPAejy/pcEsmyIKAXSvH0NvRBfVrGu1DKeK1hQ
         KlBEfkO5SCuJYty6RRDDLpm6lGVvn/MgRN2/Ob24FXBvvMVqDs5OaMGLYQiaYPYDmjUY
         dRU5+0kTxTVKY1n8klC+YlhS6T1u2Hbr0uviTbhzTVqvrGA94zJVYpBhQ9y8kyTcimlF
         g+cf5qbXUJHsO1mBRTF5PS0VMt3wsD44hA1iWZBy0sJ8jj0bh3FBNWKndeXOUMpcaQGg
         PN1KXTw2V25ypHVXDqqtJPOJCSX5iDuqtBMmDGAuUv+VrVZfpoGXZLPpz9KglM84xk9c
         PV+A==
X-Forwarded-Encrypted: i=1; AJvYcCU7GY6GizLYtpAuL8Ek32uTVf8XvfM3JkIIXhTTlSjbv8ZZT9DS2An8h5Q0fx2c9ISs/f0nq1hWPCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8GfSOLniNQUWJjSeIy2nJj22NVCS74+S5L/2k5xJMpRq7VEnX
	94dXqPNFIQLofwCfx5KuAp9CRM5T/lmykGvu0XK08bop6NeDtdWg1Zb020v3lA==
X-Gm-Gg: ASbGncuLKur0hCr96RGkrH80G14b3+rQFmJ44ksq3h2RfBN0UN/vYgEnDuFpY9WXd4q
	R44usKGAWDrf36+m0wX7RN7b82cTJVdPtITcf4RcpWa7mXAPSkZbC4mqiG3tiv2INbJLAvHEE5j
	Nz16isnXTinpHjJ/Yi5H9sqjwF7ZfEQdlHwFs8hUqmrQHAmZjrgZNA+bXUtMwcHqw5FQ0kp12u/
	Nte92h0UKanYvRx6rkqyDYr2wtxGoRpEb4cl7JBLsCTf5xW5PY70YEgnJ3OO6ZnRYHsPJ7zcb7C
	oc+CRJ6/JBFCcnNr2uwB22QycGUSITiMMxqo0dsA37uWukv4u8bC1WLk93IyilG46DHCrHhjwBO
	H3ugJ8vsnnsY=
X-Google-Smtp-Source: AGHT+IHUoFFLPeUFu+UU355uZPXSqKbe04M90Zq6iAnWoHkRiKSuQHJcCy3YfTfAC5taWSt2lmevmw==
X-Received: by 2002:a05:6000:2a5:b0:38d:d533:d9a2 with SMTP id ffacd0b85a97d-38f615be1bamr16181576f8f.13.1740470981876;
        Tue, 25 Feb 2025 00:09:41 -0800 (PST)
Message-ID: <346374d3-9bc0-47d5-b8e2-af41644c6f50@suse.com>
Date: Tue, 25 Feb 2025 09:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/consoled: clean up console handling for PV shim
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250222235748.103599-1-dmkhn@proton.me>
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
In-Reply-To: <20250222235748.103599-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2025 00:58, dmkhn@proton.me wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -46,6 +46,7 @@
>  
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
> +#include <asm/pv/shim.h>
>  #endif

This change isn't needed. It's the purpose of asm/guest.h to
include, among other headers, asm/pv/shim.h.

> @@ -562,13 +560,12 @@ static void __serial_rx(char c)
>          rc = vpl011_rx_char_xen(d, c);
>  #endif
>  
> -#ifdef CONFIG_X86
> -    if ( pv_shim && pv_console )
> -        consoled_guest_tx(c);
> -#endif
> +    if ( consoled_is_enabled() )
> +        /* Deliver input to the PV shim console. */
> +        rc = consoled_guest_tx(c);
>  
>      if ( rc )
> -        guest_printk(d, XENLOG_G_WARNING
> +        guest_printk(d, XENLOG_WARNING
>                          "failed to process console input: %d\n", rc);

This change looks wrong to me. If there's a need to do so, I think this
needs mentioning in the description or even splitting into a separate
patch.

> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -1,14 +1,36 @@
> -#ifndef __XEN_CONSOLED_H__
> -#define __XEN_CONSOLED_H__
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN__CONSOLED_H
> +#define XEN__CONSOLED_H

This also isn't mentioned anywhere, not even in passing. I'd actually
suggest to leave header guards alone until we have settled on a final
naming scheme. The one that was put in place is under debate again.

Jan

