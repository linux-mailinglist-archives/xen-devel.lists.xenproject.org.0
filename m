Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE039A45FB3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 13:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896502.1305235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGqM-0000Yx-Mj; Wed, 26 Feb 2025 12:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896502.1305235; Wed, 26 Feb 2025 12:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGqM-0000X4-Jx; Wed, 26 Feb 2025 12:48:54 +0000
Received: by outflank-mailman (input) for mailman id 896502;
 Wed, 26 Feb 2025 12:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnGqL-0000Wy-B1
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 12:48:53 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07fa2365-f440-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 13:48:52 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso42623215e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 04:48:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba571274sm20336025e9.31.2025.02.26.04.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 04:48:51 -0800 (PST)
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
X-Inumbo-ID: 07fa2365-f440-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740574131; x=1741178931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hhVICk/b+tlx8/JJ+m84IpHaH81/qZ+bAY/NiHq0HS0=;
        b=RlM2bkFsd0DCIXNYcC2Qcy3ZQDjsXXQuEjpFnraduQlxvODkAQD+jB0Lco2odjjKjx
         aFzh16X2eZdhHRS1gN+l2HkaCsN6jkovp5u6EID4ohgrFU8t5zJVSZc/fLeaefDTdwjN
         3mklfpyQj8DSAW0pTG0JwcWd6Mvh6LtwLEmKc0vnmzsYS2EwsvDLhinazXxMj7KRhlgw
         69WABRXZABB9opOkFxMWiolD+aDG/2eYeVtljovJHa8pDsQZVFOeV4Aiy2UArgHEOay1
         C7Od2mUYXp794rg+xuynlhqM6GGJbnJ3vUrL5frBlvMXjJYrDO14JyIJzJOuaca9JrgB
         Zs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740574131; x=1741178931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhVICk/b+tlx8/JJ+m84IpHaH81/qZ+bAY/NiHq0HS0=;
        b=ejPCs+xTq5TNr3yrk0/tqxBMrhHXvYsMlFCKGVXfTSooZ+8GUKPJBXSziXHrmZAGqq
         CvSliV2zb3FWzwX9wqHszoOcw7X3r+DErU5SlQBJlbQ1wVN5DuPa9xEilS+Cec62GX8I
         AOG7hRHOgG9Bi3H4PqjVBOy/4kWD7AN9JtyHNm1REwXnEocpsfbajb/4Qlwzlh9t2saE
         Yz6NnY/IsKf+jbYHEzNjzQgcwEoidOKmEsK2SVtQVViQ3+q/b6w4UVArV2x0MVwG7U78
         6cGZ77VX9FTN0sOKta5kN4lyaARjsQHzTWmbELM2xyfBihu9MrL3FTw3jEhKEqAVFD5o
         XZeA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/r462ntitOxN5f4bdDlEiKkK9AhtrLzie+gySdXJ7J7mE5U4KtTbO0G90HyJaQI66vDBhd3dWX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpsRhY9w0LYAabSPx1xma00/qAe+iVYX/QB2ZpnzJ54vQa3iC8
	0sKjtKwo/ZRdZdQXW1nKY/rKjbl38nj3DKDHc1Zb3Pmy8lhlPZTgMeX+02NERw==
X-Gm-Gg: ASbGncvLyrJUdQjj9VF4fOS/LKqEznrQPIxKJMvosXYvBDVb8nyr/TAJZ4FUjbzTwIe
	WufXEFyd+a/UAe69HK/Q0wZjs0WQj7k/1U3aSORkw4yJadXT61/nrC+dqsl45DlHx8FDsHg3UpF
	aAHfrzut3FtsNB4aoUepeAJV7dRaGYX/g/8DrM14GVLs6OdT70DWyCNGkZdkWj+GIxM+DkrTP31
	S/VMCeyy8I2xJ1Y6sjR252O6zL04lYaUuHnCkBG5YuDMckt5a92gYoR7133gccOwifMlwYPfAdk
	BD/cK5agwBgof8vCR6Jgrf/yjvr/XEaoZXHjxLzV6n7jplH/z9MiZyGdajDCJy6R0X/zBLmlBDC
	YHRoVb7M9uoU=
X-Google-Smtp-Source: AGHT+IHe8cNmOzn9+LwWla7CnY9Xs/K1XwSAxX6dOTPpqY3rFvNmP5HKlC131MpBrHCHE6nw9zTyEQ==
X-Received: by 2002:a05:600c:4ecf:b0:439:a88f:8538 with SMTP id 5b1f17b1804b1-43ab0f277efmr65763695e9.5.1740574131599;
        Wed, 26 Feb 2025 04:48:51 -0800 (PST)
Message-ID: <46bc8ff4-f33a-4736-b1c9-00dfdec554b7@suse.com>
Date: Wed, 26 Feb 2025 13:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/IDT: Don't rewrite bsp_idt[] at boot time
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250224160509.1117847-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 17:05, Andrew Cooper wrote:
> Now that bsp_idt[] is constructed at build time, we do not need to manually
> initialise it in init_idt_traps() and trap_init().
> 
> The only edit needed to the bsp_idt[] is to switch from the early #PF handler
> to the normal one, and this can be done using _update_gate_addr_lower() as we
> do on the kexec path for NMI and #MC.
> 
> This in turn allows us to drop set_{intr,swint}_gate() and the underlying
> infrastructure.  It also lets us drop autogen_entrypoints[] and that
> underlying infrastructure.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

The switching around of the #PF handler is of course getting in the way of
moving bsp_idt[] into .rodata.

Jan


