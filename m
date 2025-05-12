Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66090AB3A21
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981520.1367919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETt0-0003Zj-51; Mon, 12 May 2025 14:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981520.1367919; Mon, 12 May 2025 14:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETt0-0003YH-2E; Mon, 12 May 2025 14:12:06 +0000
Received: by outflank-mailman (input) for mailman id 981520;
 Mon, 12 May 2025 14:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uETsz-0003YB-HU
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:12:05 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13fc3cc9-2f3b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:12:03 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54fcd7186dfso2597597e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:12:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd2c0sm620776866b.130.2025.05.12.07.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 07:11:51 -0700 (PDT)
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
X-Inumbo-ID: 13fc3cc9-2f3b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747059123; x=1747663923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lWEcYkHkTxvckQRlU57M5o6O+Ermhnn7bjn+A02xAY8=;
        b=aR/VF3+VlFKMQvn4egzfTZfNykURy6UL6wTytGKw41oWhm4lEYnm3XDQeAVWk2tWcf
         GgLzVtzl6YO7IHhCNiseGylF4UYhtW6dlSiovl8TBCJkOhl3NrkaxBPil2a2v5xYVZV/
         RH4e6ySfOfBN3SwwHz9q+9RXRwXdIEMUEpTTK1TL8CpSbGMMxVRtcDSLYDHiWONPEpff
         j6JnoGFqau6dtejRtYwWzrrzDBmsrr90mZ8dTKK6/a8uQtYZh0F7YIlvM3n6KL64UNJD
         CNuceKR0Sm4Hl9QwFRHlfIhZWBl6Qr9gTaNnjcG0EOdUb2wtzwQf6Idpp26KIvuX58t+
         7p7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059123; x=1747663923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWEcYkHkTxvckQRlU57M5o6O+Ermhnn7bjn+A02xAY8=;
        b=t1UkmiUPNeYzdOQe1x5sYfwiggnbUwf/qdZwi31gmnLx3qbZkPNqOYk0yodlrozdLN
         8FHond6CeRD9H3REkg9HYXFdulKAdCFA+GYaOqjwJ3z7yWQuXpEyOpsUTVGrg7UpP9sX
         fpa+lYo5kr1tEaft7emtFkWI7ZlWfEGx4l9M4WQhrymZMJs1WtV+Ik7w/MUBEE/VGFcH
         JWCnarcVE4QNdQUsqXs/XXf3CfDdIzUZrBgdxvhL68ldRGb8UzN5tgDWhG8nw3XcHOre
         fcT3/anRezIcaE3HGoE1vNUr145oPIPgqljm82YE5+EKkkT+iN8asWgQadsHj4AF9EjH
         dRwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/DaR669SxzwziCEZJF4/pB7VsSxrbFAx1gE4b5j+FUf/SxAITJ9jZ/+cu5amQ2dRNXWPMTzkH5NE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNA6LZLAgQQw8MLIttShFGggNAZy0j4IOU2WIFTz3qnF0qkQcT
	YFR3kVW0ufHyHc5Ip/DV4E62XqcGiyvIBfNeTa6kJ6g2jc2nzGvWqUFd87mZcxWaOy+9FXP6RF4
	=
X-Gm-Gg: ASbGncseP6CIWBHk94PAz3gQ0nxm8/VT/IK0MDE88czSZzlN3n934hAF80xSUvCGQSc
	at8iBUQQfiMtcnzk4NG76Pj91DYJVtWh51f01TrP/9nOh3yptsCrM9UBpX10P/AyTGOKoBsScAW
	m2Fh2B+jZ057WS6IiQ/H9lfuyJUL5PAoDAKt0hcT8QIuozRsG4csa3Hb7QykbA1QXQyakswNFOB
	rrykqQJ1gpDOCtzQIP1fmZLT/sAjMcGvcMf6cSv+r11EfaUO1HffnuLzdKEEtVcCxkqkNacb/yd
	kFEYtONWGeD43TlQEwJvApilqtPEbe4he8OZHIbENwdOD6eBTvCct9+t1uml+BFguXwySvjyY4C
	puNbJSlHCiA51hTwxJzD4tcLRKI9c8OnWMrTv
X-Google-Smtp-Source: AGHT+IEGyjYoIc8cSC1xhOIpQ9+Idd3o4q0Fy2ouqKpbgImZH7dZC899Y6zAu/SkrBwCLTlphqPQrg==
X-Received: by 2002:a17:907:1c08:b0:ad2:2ed0:74a9 with SMTP id a640c23a62f3a-ad22ed07544mr1013416166b.59.1747059112024;
        Mon, 12 May 2025 07:11:52 -0700 (PDT)
Message-ID: <66f5d1f8-7d46-43e8-989a-040c3b1022bc@suse.com>
Date: Mon, 12 May 2025 16:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] x86/pv: fix MMUEXT_FLUSH_CACHE to flush all pCPU
 caches
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-2-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> The implementation of MMUEXT_FLUSH_CACHE is bogus, as it doesn't account to
> flush the cache of any previous pCPU where the current vCPU might have run,
> and hence is likely to not work as expected.
> 
> Fix this by resorting to use the same logic as MMUEXT_FLUSH_CACHE_GLOBAL,
> which will be correct in all cases.
> 
> Fixes: 534ffcb416bb ("Fix WBINVD by adding a new hypercall.")

Oh, and: I've looked up this hash, and found a "trivial merge". Are you sure
here?

Jan

