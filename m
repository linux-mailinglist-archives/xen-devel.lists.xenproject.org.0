Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F0C963A8
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 09:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175585.1500209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzVz-0006aj-KF; Mon, 01 Dec 2025 08:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175585.1500209; Mon, 01 Dec 2025 08:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzVz-0006Yn-Hf; Mon, 01 Dec 2025 08:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1175585;
 Mon, 01 Dec 2025 08:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vPzVy-0006Yh-2F
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 08:44:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6fc6465-ce91-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 09:44:09 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42e2e08b27eso480095f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 00:44:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a38bsm25372242f8f.24.2025.12.01.00.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 00:44:08 -0800 (PST)
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
X-Inumbo-ID: e6fc6465-ce91-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764578648; x=1765183448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b775cYLZSy3NITk66Jvd/6m4NnP3BHfiydigwGNd4YA=;
        b=D2C48Kg9VOoLtYIzFBiEGn5c2yK6vLgbVveSdh3KcxqDdWaW7HKmxRxxQlQlIaAADo
         tVR0xVdM3ZWTVlLav1k33HXPmDcqIpxaaWQ/bk9+XXjJ9lVcrv/9wxP9SCZlL7upQc4J
         fVxKfdUll/CXcIjrxdHMlvNTmD1kZ+pxWp0+6PqVz/jRoSLcvZWtc3CWVU3vLK/5/6lF
         +wKdFcZVzDiaG9fumK+vXAKnlIhbwQfa9tags7WRADDh2wKBy7rVDkPnIPOFpYQPysKi
         rmgkYKej7Yk22j4FZHh+a9urpxF/BejHTuOu/QrgRLVoXHR+QM8Zrfmga459yB/ONrdj
         LV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578648; x=1765183448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b775cYLZSy3NITk66Jvd/6m4NnP3BHfiydigwGNd4YA=;
        b=Cu48ztSEIleespFZkz83XPmJ5bg4XACfZrF1yLfA2cW50LM9MC6MrkxDoil497sB9R
         Wj6HHq3R8I8tRD+OFOIxNTo21pWJ64L9Txywpo+eUReQrF4uAewDQuanwFTfQiqI70YC
         tOkiGHMmpSrvc6d/XI6fTxKGb9daRyUXtlEu/DUvU7235O+tzpwX8Nkm6K2Cvm7YJ3Jj
         T194pl1RBT32xAOklOspXXFudYbFXKt+PS6IyhSJuAcGtMXTYYmPz1yB+R/zf2LEu3d6
         HmeO+RD7JB7xmdbIVSvGRxvlGOvNdeWqC6OD9wWPAHA21XcosIEjGwX83oiiCxVSaUuP
         zooQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8B1t+oVOI9PX472GQg8HrwsO+LyIvbFVYTGgTqc0P3CWJmNY8ojPVp7smaDS25nIiZaz0+JpF3aE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTUE3Vbh+d2ysJ/P5cOZcHJ4D2DTH535zvVfUVisjrYbqQWANJ
	9fY39TkYuV2MtSJr8RVnK9DZJ+40ShJgR3+lYI29a37ymf1CqLu7rFOVD2zvUtdw7A==
X-Gm-Gg: ASbGnctbSohYR3bRHjzkrhAYJG851FyWlhjWD6XeLIbR7qAq12HAlqbk2/VDD/dxSQF
	Lact+pNjyRGo4Jv3je37qEf2FX3pm7YzcEaw4TzfYSlwVAvNC6OojZToPaUQzzJUaM0LKZi3rtM
	ppTPrUyYiBfM8vLKXTnxBUntWOg4+qlY3fAj4DeZTbj/nsW1Muw+yb/hXdrFQc/q7nk+M7nYLnZ
	bZeUK4g++Xhv2Q2nfPcqcZJ+5rnZHLxVGxZIMThuM1Rk6lLUyoK+QzdrJo4jTyjUC0E1eyaB0y2
	jkqtLpqaQr4ZrUTLAVmREM24xM9qkRbSXcOUwKysnhDwSe/G32sSljD8zN70YQGT5JzqzJZyf/4
	Rlq4A1QkJhBe0juOVME/fZltOunG4zXn9iYrY8C8B3Jhqs+0rpEI4bprWVzwRMHbqlUANhjB7my
	xOJzJ6hAVE/ajla4hORKcceR/L2JjeOc8DNurykXVH6WWoC6gNaJaUeU0w1RchhjGzfV9W/GZyh
	uo=
X-Google-Smtp-Source: AGHT+IGP0wfFU+pzC9XiRW0PTpPkd6JpxhflSAbnl7bqXjEQtPIdpPBl3Iw8qItp2yUbo2ARML/EKg==
X-Received: by 2002:a05:6000:26cc:b0:429:cce9:9b76 with SMTP id ffacd0b85a97d-42cc1d14161mr35896367f8f.50.1764578648515;
        Mon, 01 Dec 2025 00:44:08 -0800 (PST)
Message-ID: <6d85a12e-f689-4336-ac40-ac872f21d6df@suse.com>
Date: Mon, 1 Dec 2025 09:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/lib: SHA2 cleanup, and SHA1 support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Krystian Hebel <krystian.hebel@3mdeb.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 19:47, Andrew Cooper wrote:
> Pulled out of the Trenchboot series.
> 
> Andrew Cooper (1):
>   xen/lib: Misc SHA2 cleanup
> 
> Krystian Hebel (1):
>   xen/lib: Introduce SHA-1
> 
>  xen/arch/x86/cpu/microcode/amd.c |   2 +-
>  xen/include/xen/sha1.h           |  14 ++
>  xen/include/xen/sha2.h           |   4 +-
>  xen/lib/Makefile                 |   1 +
>  xen/lib/sha1.c                   | 215 +++++++++++++++++++++++++++++++
>  xen/lib/sha2-256.c               |   8 +-
>  6 files changed, 237 insertions(+), 7 deletions(-)
>  create mode 100644 xen/include/xen/sha1.h
>  create mode 100644 xen/lib/sha1.c

Acked-by: Jan Beulich <jbeulich@suse.com>

I'll raise one question on patch 2, but that's not to make the ack above
conditional in any way.

Jan

