Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34124BF5773
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 11:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146896.1479239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB8W8-0005Dt-H2; Tue, 21 Oct 2025 09:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146896.1479239; Tue, 21 Oct 2025 09:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB8W8-0005B9-DO; Tue, 21 Oct 2025 09:18:56 +0000
Received: by outflank-mailman (input) for mailman id 1146896;
 Tue, 21 Oct 2025 09:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vB8W7-00059W-IL
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 09:18:55 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5f542df-ae5e-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 11:18:52 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4710683a644so47298875e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 02:18:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce3aesm19751841f8f.48.2025.10.21.02.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 02:18:51 -0700 (PDT)
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
X-Inumbo-ID: f5f542df-ae5e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761038332; x=1761643132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VJrom6d64dgZ+30a1s73gY+hvq5l5g97Qxx3m/Ozg/M=;
        b=Qvcut6jO8NSBdCs3ZIbksJXG1vOTXaarOt02BKgzyK8cL7q8bCdTOdIke0HfY31EgS
         lJPIBGXODFe72tSIMj/jNIjoZGJmHp5s6Aa4YtMXq5mGZ+ysINuYtciAeb4UL4mzG1w+
         EC6ofQhpOFPxas1oQNgL8mtOMNJ922pfzVuXRJEcqKhh6Zvgq5AtxsI2TgGULvxy6BGU
         Lxsh120yJnx3qXQ1lW37exTCWd8kkYZOEd78y+Yb/YT9aO3qFoVMVvWZT72KU0PyZNUa
         sqXx4gpV+1yp5UMS6KLjeID6NDMOi9XtbsP6ls3+K6Q4UzcPkp0PocjAvN67HVvwZx08
         Zp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038332; x=1761643132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJrom6d64dgZ+30a1s73gY+hvq5l5g97Qxx3m/Ozg/M=;
        b=l60DaGzsuMPRDOXT8608EqBJZuDOBQ/NXIjA0t/cYHqHTghJVDfQ5ElPdjtw5mtX0W
         PVnhqGO9YAiLWmUQPMgE3n8hAq0h3PAD9SXU94ATDfpTXp7Ju+ns2HjFF+jQ2SID6i/I
         xCcdI/aVTwyqMN/4naCBkCuvo/Bjf/Z1LDP9uwwS88UAVTBHoBbCkH8OfEb+EpMmdnoS
         eM2kpg7ZJrdWo3ie+fcGfhGZ3lk8cXRc+WCyNsErZTjf+XetZNlTHN17iDHPJHBSWlHT
         UY+CjBHtIjt6HMcKNX9B/Bz5cf/QQbR0XuvSV8mKzIsuFCQ9EYYbGdItar2g/JoHesAP
         d0jw==
X-Forwarded-Encrypted: i=1; AJvYcCVbJwwdVLtMAW1KlkAG2Gbw8YkKwJrS7hbLSg8Ri4rXHIm4O3ZMk8R2LoMk4VF7B8adiJibxaBKdmg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBXTAV+rktDRJk1CEyVCBV9a2M2nSHzbk1uJasqlya/0pcvYi4
	s9tx+MqaK+Kh5Hbl92oAA9REm1qw/j9ybi/CXTULvRhKfymSNTmHqAur8yV21zbraA==
X-Gm-Gg: ASbGncvbdjZSGUIfKaNWL5LRP+6mNvCBp3DTkVqGqHtIVbSL2YU8wPIVffQWivZgc3S
	GBlK1IPkfO8wyGrJimtJ17E5NKQHx3JW+J67SbOzQ5UVbPZ0DEzGN0SRmy+kIu4R2FfIqytD/WK
	jJjaBijuVZQZbdxyJh5jSNk9dNfDE/KG5f/4gN2V5PQj0o2QhbsMjCKtXrxIhaLQwjNA9pDZ9Y4
	9YT0GkjQxpDxfbzNq1aTMvKx7V3ST+dl/HjhncMKwx1DDPspQNN2DavUr/owWDyS/s34Fetzd8V
	sc9lpW81b2R6mItlhdAEjZZJvzirJkgYxzHSG1gxdHqz5aJ0R5Nv7O9aevfG08wZJvGcLvKZz7e
	9r5mZ8tnDXmL4vInEK9FshzxFwZU5Q7LZftf1L3StGZTW0SquxgnkUc1uFeuao328WTpFPWNUtK
	96ziV0Im5wYeQ0KG+v9e7Ern8idZPYr0hK+VRbY/Lzl7yDUnPKK0Zk0nzKq86G1Pj9cpTGouU=
X-Google-Smtp-Source: AGHT+IH8UDJxwVaVl2HIm59aPXpOppG/MGsZfzxvo8WI55nBfwPqGJyRYVhyUcZo9D7FFmM0AieKmg==
X-Received: by 2002:a05:600c:2a94:b0:45b:92a6:63e3 with SMTP id 5b1f17b1804b1-47109a24fddmr98455465e9.9.1761038332010;
        Tue, 21 Oct 2025 02:18:52 -0700 (PDT)
Message-ID: <fa9e5a03-0b25-42a5-a51e-6e1c4af7d4a4@suse.com>
Date: Tue, 21 Oct 2025 11:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/ucode: Cross check the minimum revision
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251020131955.2928261-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 15:19, Andrew Cooper wrote:
> For Zen3-5 microcode blobs signed with the updated signature scheme, the
> checksum field has been reused to be a min_revision field, referring to the
> microcode revision which fixed Entrysign (SB-7033, CVE-2024-36347).
> 
> Cross-check this when trying to load microcode, but allow --force to override
> it.  If the signature scheme is genuinely different, a #GP will occur.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Might be upgradable to R-b if only I knew where - if anywhere - this is
documented. I can't spot anything in PM vol 2 in particular.

Jan

