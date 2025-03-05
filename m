Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA2DA504E1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 17:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902523.1310516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpreL-0002Tw-Lf; Wed, 05 Mar 2025 16:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902523.1310516; Wed, 05 Mar 2025 16:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpreL-0002R1-Ib; Wed, 05 Mar 2025 16:31:13 +0000
Received: by outflank-mailman (input) for mailman id 902523;
 Wed, 05 Mar 2025 16:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpreK-0002Qq-2w
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 16:31:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e875792-f9df-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 17:31:09 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso45652405e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 08:31:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42b7245sm22213515e9.17.2025.03.05.08.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 08:31:08 -0800 (PST)
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
X-Inumbo-ID: 3e875792-f9df-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741192269; x=1741797069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dcAgKJgMpmj2yyPGS9Y/YDSt+29t0xKu9l4o2aWLoRM=;
        b=VvEdjMhbrJ/KWFlIPGsPtXEceCvLQSR38lux8iVnZOEIF+6Ic6Ps/ABeAZrGTQsvZL
         mMqE93TxY7dl8mBthgHJSYwIjygrM0X1eWWqsxmlRM5NrLHZFB/x5sncO61ziZVA7tJW
         R8y/4FA8BW2FC/t8rYeezK80mVUOmKQTXobbGz4CbN3rTF9mUEihPwP4AAoA0NSI3k7J
         ZLOPO3C3ePo0r3XHzKyEAry/KlZ9BKSIzVKSWL1WJaDaYqeO6RgKuG0jM1V5epbxaOWX
         81nX/+ucC9vTstHyrN7zy9sRsgDqomfmsi47IeW0OFEKp1IhBpADQP5hOtqyQFlzpUQ/
         XP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741192269; x=1741797069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcAgKJgMpmj2yyPGS9Y/YDSt+29t0xKu9l4o2aWLoRM=;
        b=mlc2qHBU3bulqPqmKv8ryGMiTgaVSHhMM2mK9eGxl6iPavDlAz1/q/ao9N8BWZPEOR
         JzJqtKmYpp/oHEMQ/C0xXSV1F3SfHWAp3XR0YF+tZa6giO6vMuSDAivF1Sl2N+8E8olF
         /FumQEhJct6vu7T3AEwBh+jxYFaj+5w9Q/LuAHo3Bu0S/R3+9TIjsNYDoMDx1xx/7DzQ
         qU+nRpic9u/22q0pYWpzzmKWxIMO1HOqGmhRbgFDKTalvaEUEdUQIfkEI/4Og1oeUuaX
         rrA8aVHZVIRZjhQn0wW2VpyOKk2TFr2WTw4sKluf4O8h/7Rs0rU33ZZWi64a1KoMR5eh
         CfQw==
X-Forwarded-Encrypted: i=1; AJvYcCW1kuDSMymezxfnP1GDMe+hf85B+24px55+y0h33Z8huIYjSuV6vEdQX//w0kiO+oZberQpd7RkMQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyb6jX6GO2O97RH39s4McHmIxlA39Iqxxyf92YCGz9/IgRT7GjH
	x8/kwOn2qBmO5IXzkloj3cdcuaCXR0ym68zZMzuQ+hZ6K4atiHDA5TYHzWJ3Ng==
X-Gm-Gg: ASbGncuOo6nss/Szg9ufvBtPZp26NKP9s4bp1JuMiBvS+9HA3yZvWboGeQ9wPuLsGDi
	O8nVM5hbNT1lL22R/90YDmcJ6QeaJhNoTd1/6n/JGRihLEb/wQ3mm8nBtj4Xr7halwM9XZyNQ7O
	IyOd2pOKaVzhG/SajZliHdXF2nc1UVPID5iCtnHamCLodhwle+bR/57BItrZzTKBSV9vLPFXMkS
	pi2XSye26PO8IhnagzJgm/1i2z490JsfOKSW1ZNb56cn5MkXaBDCHXuN2Ckia6Np9VVKtVIq7a6
	QnbsANR8HSUXD6pL+A7pqfh7AiNZq6jVi/Rp9wlt+z/2QALLqsd9mT+tuFXdphpiS0tl1yYWX0W
	ilgfnYgCgETJcPz0bFsBBVAfp15GAQQ==
X-Google-Smtp-Source: AGHT+IGVPsbm+14D6cenBIc4UxuFOtzTR4x/kTsV7dMPMnKXJYcoXLvdLni2oXGNf9x68/RnQ9XYPg==
X-Received: by 2002:a05:600c:190d:b0:43b:ca39:6c81 with SMTP id 5b1f17b1804b1-43bd2989fa3mr26018585e9.9.1741192268943;
        Wed, 05 Mar 2025 08:31:08 -0800 (PST)
Message-ID: <9ee03a32-f645-4873-8d75-1fe2090bc2f5@suse.com>
Date: Wed, 5 Mar 2025 17:31:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/consoled: clean up console handling for PV shim
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250226224642.728198-1-dmukhin@ford.com>
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
In-Reply-To: <20250226224642.728198-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 23:47, dmkhn@proton.me wrote:
> @@ -562,10 +560,9 @@ static void __serial_rx(char c)
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

With this being the only call site of consoled_guest_tx(), ...

> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -1,12 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef __XEN_CONSOLED_H__
>  #define __XEN_CONSOLED_H__
>  
>  #include <public/io/console.h>
>  
> +#ifdef CONFIG_PV_SHIM
> +
>  void consoled_set_ring_addr(struct xencons_interface *ring);
>  struct xencons_interface *consoled_get_ring_addr(void);
> -void consoled_guest_rx(void);
> -void consoled_guest_tx(char c);
> +int consoled_guest_rx(void);
> +int consoled_guest_tx(char c);
> +bool consoled_is_enabled(void);
> +
> +#else
> +
> +static inline int consoled_guest_tx(char c)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -ENODEV;
> +}

... why is this stub needed when we have ...

> +#define consoled_is_enabled()   (false)

... this compile-time-constant predicate? All that's needed is a visible
declaration of the function, for compilation to succeed. DCE will then take
care of eliminating the function call, and hence things will link fine.

Jan

