Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07DACD914
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 10:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005166.1384697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMj2F-0004eZ-2N; Wed, 04 Jun 2025 07:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005166.1384697; Wed, 04 Jun 2025 07:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMj2E-0004cM-W1; Wed, 04 Jun 2025 07:59:42 +0000
Received: by outflank-mailman (input) for mailman id 1005166;
 Wed, 04 Jun 2025 07:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMj2D-0004cB-2b
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 07:59:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd2375fb-4119-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 09:59:39 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2390016f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 00:59:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506d20bfasm98947275ad.235.2025.06.04.00.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 00:59:37 -0700 (PDT)
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
X-Inumbo-ID: dd2375fb-4119-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749023978; x=1749628778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=irP3jzCjhLiox3DaGK3fe8uEpmp2A76YqA4wKhD5kSI=;
        b=bW2TA6EY7RH6BpSEcSznazrRKiO1omnH5rMdqm8An/flUhyqhufMh5HCoZ45gtfhAz
         MnQsoepQfacpOG6lbzg5x+D+XjiWammTw+HT9V+BgSR5GyqUE8AmYA5Y6FAXqkoVx9Rz
         vTCNXZFOReqIdL7Z6+SChG+bMGrKfJ2WFeEtfSR13WqYqX2Ko4VeuaonKCjXRO0X/aET
         XAVgszMFSHmnfF15DtvtTEtVNjCeJcZ8vtbQzgXJQftKvcsd7gqCM6Obc9OWDU9Iw4pg
         v0vVpYctC8PqIx++hx2KmEQDtPawIF2Y6okhxUTXCmPegR8NOPa/BWao8xNwfy1Hczrd
         9a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023978; x=1749628778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irP3jzCjhLiox3DaGK3fe8uEpmp2A76YqA4wKhD5kSI=;
        b=Z68wRCG/1Fq80iMkf2kIcp3owCmxY71xPrcTKcdrZjSe2b8eI4///41Z+zROMoGZGi
         rbs5uxJQRuO96VJb9U4FlmZQs/h3Z2TKU7P8dn+fLiP3Ny+9+r7gwzJBfE9PEcnV7SYs
         ebgFtmW6C7k6DRhUS1qwq64UM1CPvkGSDk5auxK9/qlBCVw8TDU431mi2+HH0jrJ4aXu
         M49OxcVwjzye3yPT3kYy87+rTzZ6qVRo13wSEF31UeFtx4bZh7Lz8rfTQIgeBUm6YcXB
         9CDH3tLsJNdlwvosH1lpMSKe2Wow/+vDJzHwTEdhDcOrQKjF1RAI5LJoTL78cJi7nXd1
         63VA==
X-Forwarded-Encrypted: i=1; AJvYcCXTnKTDd5Ve/y4Ku8o7kTnWgOPHP4p7IgNfV5GyIMokv/xdrbggYIPWQdogfFp1wYY3pEQ3GIwckCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzZMEDfJ5AyGkDyyTyH/yzQuTgkt5BV6lDeJWCvXdUczWjXSEm
	5204ay7AtJwunz8z2qvepIAHDEKz33ueahiJJd2SakQxqrcBVERJqJg6r8G42tv2Xw==
X-Gm-Gg: ASbGnctzyngsGHcQb+1Jk3AlSdocIzCPCiR8f9WX+Lc4nB3ZHc0LKLqJk8QxnwSaA+p
	QBsFEKdNGMIrn1kAV7eMVRzVEJxa3Vgh7eBaIV42rHubGXRsliadpPRWx8R9EY7y0qP0vnsxEEO
	5VVT6m2kfKlVzuUA2PHBOv4PVJveErAb9oLlAjDIi4esUzZNUMapvb2gyFmJWrJ0AFBK2/Oazj2
	wAIQxXTBc2wppB0kAT4rDqq1xqbi0u9kC/PkXhHk0cJ6RecUAYNoz5KTYVJRs/iLyiDUrROBD2p
	dU1JCazUp73OvNzMqClrQeCwvF9j9daHrTbz16FlqrRAjYgB7MfTisO07Eb5THXtvkJODCpvpQ9
	6xBJ6euwlrxe+cPO7nwzJSgZkbuDzWCdxe+b8
X-Google-Smtp-Source: AGHT+IGrY50CqtMCczgXM+SVHPrh6Ru9ASkXq+24Hf4GO9BQFJDIqoF7Kh2tx4MLNpDCFJOaTWg8XQ==
X-Received: by 2002:a5d:5f42:0:b0:3a4:e6b4:9c4b with SMTP id ffacd0b85a97d-3a51d8f6bbfmr1206717f8f.1.1749023978350;
        Wed, 04 Jun 2025 00:59:38 -0700 (PDT)
Message-ID: <20a7bc79-2359-4ee1-9d42-fe8524a2d3e1@suse.com>
Date: Wed, 4 Jun 2025 09:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix domain_cmdline_size()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250603235628.2750156-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250603235628.2750156-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2025 01:56, Andrew Cooper wrote:
> The early exit from domain_cmdline_size() is buggy.  Even if there's no
> bootloader cmdline and no kextra, there still might be Xen parameters to
> forward, and therefore a nonzero cmdline.
> 
> Explain what the function is doing, and rewrite it to be both more legible and
> more extendible.
> 
> Fixes: 142f0a43a15a ("x86/boot: add cmdline to struct boot_domain")

I don't think this is correct. Iirc I even commented on this apparent anomaly,
being (validly) told that it preserved original behavior, where all the code
was inside "if ( bd->kernel->cmdline_pa || bi->kextra )". Since I had asked to
fix this already back then, ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with the Fixes: tag corrected (or dropped, for simplicity).

Jan

