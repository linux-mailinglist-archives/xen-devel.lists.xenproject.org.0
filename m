Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7CA39DE7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 14:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891432.1300470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkNxk-0002wd-6i; Tue, 18 Feb 2025 13:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891432.1300470; Tue, 18 Feb 2025 13:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkNxk-0002ux-3b; Tue, 18 Feb 2025 13:48:36 +0000
Received: by outflank-mailman (input) for mailman id 891432;
 Tue, 18 Feb 2025 13:48:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkNxj-0002ur-7C
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 13:48:35 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b3329b6-edff-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 14:48:33 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abadccdfe5aso681001966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 05:48:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abba278e1b1sm322089666b.99.2025.02.18.05.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 05:48:32 -0800 (PST)
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
X-Inumbo-ID: 0b3329b6-edff-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739886513; x=1740491313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IE/MJCEzIFlukpkN370O/1jijH/ouFB7dZXgc9B6vD8=;
        b=gy0RV8QPJ0E0rOV2inWHyRRpJFKxfPM2Fsl+pMKrbfAZfA9et4yyvyAyTCPws6FSmn
         GzRSndcdyMZsF2CZ/6uAeq9MKaPkjFOeqW9H8mxTOSoTZe8TkYDlZut6x5ZrfaoCjpww
         oWE+vowBJ9QOZZiEphmRRoDDHWNDK1YBB/+dLZdl8nX1BHsZL3Y7U8GUa2DRPB8+JzW9
         xTfai+CVayzZDhly4J6VS8gxg4yC3KLJZhws3rOalhyikLys9DDZpSZ9BkdxdmJBaTKL
         WI5j6uVYQHINkPSDLp+2DQJrsPJ8rc7fMrsKOzJWX2OdubTbI4aCd0oY6NMrwiIk/0tu
         2qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886513; x=1740491313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE/MJCEzIFlukpkN370O/1jijH/ouFB7dZXgc9B6vD8=;
        b=kvZZXF1zXHpGrvEW0tPKkAcUTyCZGZ+KVNMyof+tMcGcAprAU7YfsK0zNOrhMzoOh6
         VYFIeF/uNm9EuEcbDH9m9GGrsfajvdQpKPoGlsCV3fAv0d7nwIJqauj4k0rM64DZaels
         OVzCceP8OUBbiy2lDnMTPoCphXWah6Y6zjI2H44eWjVJSqPHk5BrzsdBdXYA9v3eTh3v
         M/79YYwMDStwpLhH0CzrIQW7Hd1NfPWlqaqk4Mu68APXQYHt5WZCg/goXAHPy//dZ9EP
         m1rel45aqTVjBQ6hUfy3v1Kke8ppsx3oyQ6BNHp7grwFE30klexlOVW5VMLcpOtCfKhq
         a4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWSQ8KxHPhxkDiy54KbgerzrWTVm2MA28fi4/0zf1aMu1C96Il+9kBpokc6duvXwMCRYyZTqFLQQhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzP2nacJl+bVbtxB2/sN7HNzz4SyUvvjSaFeP0ePWVXJhoaktJ7
	0C+u5zAISWzAGmWwFyQdlvIDds20Kc55NbKS4utxNLF5i3MFRXsKjy5M9m5DTg==
X-Gm-Gg: ASbGncszZAZbhDXhPhkzrJR8HJwabSVipcXTvikMR+Rfi7ex9rPHI6ooycEw/buXzWa
	pFgnnF4ffIDD8ETgGjBUJY4YSo50ao2n/I6r6DdgpXpHWQ0WAXzKqg/jLAvbNoQ9AkQMvvTollV
	l2ffrmU1RHM174s/u/NEJ6C/VNZ4uJ5N37/hjMqW9463RF1Md8YaaQaqiWXhKDqhHQP7QBYZyaV
	vu5z8VR5qhVw+HLbdQ95B0fVDp8/udfJ5vxzIzaQYS/2MHF9hu2m56etrqo/2LQtYYOi19hf4gr
	5oX/Wbo1FpVIGhfsCDOkC3ikRDD4yuZLkq1PHiI/idNDuxrAt2R0RO5jUqxCbmXx2UFE7e3d4GB
	v
X-Google-Smtp-Source: AGHT+IH3jZGe5qPp7zeXQoFqkVQEoiV1ooAUkxtKkMhTcAz0yvCGit2CS27lmieQXSIM/Bwo4u/qnQ==
X-Received: by 2002:a17:907:981:b0:ab7:b250:aaa with SMTP id a640c23a62f3a-abb70dd65dfmr1285667166b.54.1739886512663;
        Tue, 18 Feb 2025 05:48:32 -0800 (PST)
Message-ID: <83d25745-f385-492f-9482-05dc9e701a1d@suse.com>
Date: Tue, 18 Feb 2025 14:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 3/3] xen/ACPI: Drop local acpi_os_{v,}printf()
 and use plain {v,}printk()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250217194421.601813-1-andrew.cooper3@citrix.com>
 <20250217194421.601813-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250217194421.601813-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 20:44, Andrew Cooper wrote:
> Now that Xen has a real vprintk(), there's no need to opencode it locally with
> vsnprintf().  Redirect the debug routines to the real {v,}printk() and drop
> the local acpi_os_{v,}printf() implementations.
> 
> Amongst other things, this removes one arbitrary limit on message size, as
> well as removing a 512 byte static buffer that ought to have been in
> __initdata given that is private to an __init function.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



