Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F39ACAAB9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 10:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002919.1382330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM0fh-0002iQ-Ti; Mon, 02 Jun 2025 08:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002919.1382330; Mon, 02 Jun 2025 08:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM0fh-0002gA-Qz; Mon, 02 Jun 2025 08:37:29 +0000
Received: by outflank-mailman (input) for mailman id 1002919;
 Mon, 02 Jun 2025 08:37:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM0fg-0002g4-Sl
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 08:37:28 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d01f06da-3f8c-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 10:37:27 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so18297275e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 01:37:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bd92c7sm65941785ad.62.2025.06.02.01.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 01:37:25 -0700 (PDT)
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
X-Inumbo-ID: d01f06da-3f8c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748853446; x=1749458246; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s2CizzUvivBsJgNurFjR4ozFanrBFlQK/zlyrNxv9jE=;
        b=fXKK8JKrv3dHira05MdICWSCYPw2pNNvgEGq7SDpYmvtuG6lducVB3jBSC6BTvdhwO
         rLyQ+J9/ioAS6kEd+htnsv9KRASjy+HEUPeLVRt/uLQySVDf+zUICUPJs4nXHafJc+DI
         h6Zl/J5TIfoDgP96U5tiU0pBwd0/1NVFwSqjsR1faPlXGrjedq8uEq44OzmFkvbguiZY
         PvnkiX+TPWwTwtsfsQovS1xax3EgQdL9WwySI3IqOBnwg2xSONclWelmddLqJA1uM8RB
         PahC46BcqD8VyZMLDytm1s9701WPv3w2MOno73WVGfYFwkTVXxTQbqwNq+UEL0nvETfS
         PixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853446; x=1749458246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2CizzUvivBsJgNurFjR4ozFanrBFlQK/zlyrNxv9jE=;
        b=LVRZUstBm2d++IFHFpPPQTyu5j3B3q1Vd/9Qk3jB/5FbpOW+giEFmLCbZLDBKBPHNa
         H51DX+MZBkoEPRrIGYwYnxdew88hWz6y1m62KqDC3l7akaKOrpVSrP5S15IRZCcqd3fK
         cXF146oZUL2zy9bGDz14+KISRXJd4OV/M46lEkxHKg3LavZmKMNhzZ/ocGrulCjeiC4q
         XeqwCGjO4PWuYNtueT1+9WMjfXoydAqWn2lzOLEr/O2sWLGpTsFtZYpO7KBcd4b4E+vK
         AHFZ8zCyDBN7VcYq0dLgDCxJKjmfsMmTW+EoZvmea3kOKVmWxggNGmxeuGeM7ryWUsbm
         g+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcSeZFpfCE85qB6+HAzkvQuI2MGQxvpvrLPNhYopAcM4XC967ibwL1pW4njjm9yXwImYeVXvWxi24=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyStB6kwTwm+zY8qeHo5Rc1YAcN/ghNk5/jNJlUjeAhrpIUE9Pt
	6Qw0ckkEIHA35vQ6/GWeqVB7Vl7UTQmw/nhHeBeYm7A2cKv+1RaQpAlkWldxnTm7bw==
X-Gm-Gg: ASbGnctVOKvhwr6O6DMAa33ZGGzwoZFQY/C8wsS8KViION1PmVpkcVRjXJPjAac9Jhs
	r7/qpP5PjTw1L3pSzrBpekWoabdkVSCPBbNBX0DvjQAuyGfkSWk240uirhdEv1UJiJIIV0/3zP2
	OFCwXqW26X+5SIb4E1y6FtWWNOjCF3Pk30FKdW0VI2Zygxrep1/6ug4OPcvohY+mXroeCojyaC2
	5I99j8/GjkZVZ3Fr3aV+0xv9Td38qXyummCh9V9YQ37ubKTZYpfYkjar0o1ebwMcB6+yTJkQUIL
	duDQS7RxgIoJcCj07nwJMA4ytWYSs5i5CLrS4mu7wun9i7S/QcGP4onCLMiwG5vugKIP1H2ndK8
	iTgmFBjUYlfVt3OPX71C+rrKMNQBpKeqvrvZb
X-Google-Smtp-Source: AGHT+IFkApe44EvHCGqUgausq2lD8gYN51hsqftFsSXTAC6z/iteQWmoh0vEF5Nm/Lxz80TkinX9XQ==
X-Received: by 2002:a05:6000:22c3:b0:3a4:d9d3:b7cc with SMTP id ffacd0b85a97d-3a4eedceccbmr13240142f8f.28.1748853446269;
        Mon, 02 Jun 2025 01:37:26 -0700 (PDT)
Message-ID: <344823d0-eb05-48e5-80c5-9598104f3a3b@suse.com>
Date: Mon, 2 Jun 2025 10:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: Move Arm's static-evtchn feature to common
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250527082117.120214-1-michal.orzel@amd.com>
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
In-Reply-To: <20250527082117.120214-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:21, Michal Orzel wrote:
> There's nothing Arm specific about this feature. Move it to common as
> part of a larger activity to commonalize device tree related features.
> For now, select it only for ARM until others (e.g. RISC-V) verify it
> works for them too.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

I realize this was already committed, but ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -162,6 +162,14 @@ config STATIC_MEMORY
>  
>  	  If unsure, say N.
>  
> +config STATIC_EVTCHN
> +	bool "Static event channel support on a dom0less system"
> +	depends on DOM0LESS_BOOT && ARM

... I think we should strive to avoid such arch dependencies; they simply
don't scale very well. Instead (if needed) HAS_* should be introduced, which
each interested arch can select. In the case here, however, perhaps
DOM0LESS_BOOT alone would have been sufficient as a dependency?

Jan

