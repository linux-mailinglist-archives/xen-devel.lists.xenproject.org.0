Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF333CA672A
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 08:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178484.1502267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQKZ-0002ve-LV; Fri, 05 Dec 2025 07:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178484.1502267; Fri, 05 Dec 2025 07:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQKZ-0002sy-Hj; Fri, 05 Dec 2025 07:34:19 +0000
Received: by outflank-mailman (input) for mailman id 1178484;
 Fri, 05 Dec 2025 07:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRQKX-0002sq-CX
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 07:34:17 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caf8d720-d1ac-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 08:34:12 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477770019e4so17544775e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 23:34:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331a4fsm7393490f8f.33.2025.12.04.23.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 23:34:11 -0800 (PST)
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
X-Inumbo-ID: caf8d720-d1ac-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764920051; x=1765524851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pWanF+EN/1auBBnIdoqlxxRWzT2nFfkzpJk80udA3BQ=;
        b=c7e+hfiz7zjh+o5QZyWa+njMwYiowqd+T5y7z3tFE3FoZ8rtHqoAglNPBA/H00XUtL
         HRvZb7OTpKhs8MrjZGPZrIluBsau9hXurYLIgLCj1YBP889FKFpOLBPINtex8YpUg65z
         0NDbm1NXq+ZY2wHf3tgVBLhgEdS1j/DkKzMa3PmjuMvHGh1vr+t5RNoS2NAhv12fRYx5
         vNERrLheP9Li268LqXmT1mhnZMuLeUMAtrT+FOoW3/W0g2n0MwMQjkCb7yhREZ+x4I3I
         p9I4W6QUTG0QvYp4uSOvg945zwPf9ekpVjZcGzNJP4I/VStLnVfjg+76METv7ryM+jUU
         teAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764920051; x=1765524851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWanF+EN/1auBBnIdoqlxxRWzT2nFfkzpJk80udA3BQ=;
        b=Xgv9PwjbOSN9KmAP9+josuE4cFG3YcUoH/UYjh1wOKVacQ9tQeOR9m5UxhN/ONmFyl
         IAuK3pCXE/FkwbLYY4n9+ViPt7tRDtSqJXuu/uXSeTZsBI7h84MuVXnzgVDgm9ffJfyK
         h7EJt9NdI8/jeazBlmgILiLKSBJgKHQhiJZFqJu4ApYBQykuey3CWIbRLr7KLAcdytI/
         TrM9bB3PlZIU6HLtkf+87zUDsKFrmtgXb8Xbhue6G4YyyZqdweYZLpzSBOiF4Yv32Hx8
         FSXXZoym4nhR+LpLvUCePfOCQFrvOKqL/qsZVVYHHceItId4lw1CjZuQPsvx4hi5RrtW
         lYRA==
X-Forwarded-Encrypted: i=1; AJvYcCUeL92DpOh68GRlWANyMCjsWoMJqc9B9InlvjJ6Y1j9YfbpSPL43tFH9EGbAuhbVXMqUm2ju4yQEDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZW3Oh8c8GiRYnKZ1ynfZSn2IITURD+slqsp1V238X0hkJWkjc
	PIIcaFzrz8SRZ01rniSIyFOYw/xmhgs8hl0dfkex64MqHwvewjWAj4QAGHJPKmQgvQ==
X-Gm-Gg: ASbGncsMKKP1/nU9tJ60oEH3cIPqAIL23XXWgeoVJdlo09Bhbcoawl6m4gyue1mDOKl
	vHysWd1bwr2/EbPZ3yrIbFf6lrxFTTsjvXM/GH+4ohsm9+LciHU6IIFxJQgYpSA5AcIUdbAsqjr
	xq3oz+svpDburvvRTVoFci+rpVyOAnyon8ew6rlOlKJ/V2Npe8vaC8NtIib13X3qbIpLMRbY1E2
	tD/S4q6DJKjONqtb6HLAvkSjdBWOvaauwSSEvb7dQU1SHz1i7aDf7On61zjHGSRJ1/O4r3WuNaa
	mp2HTAzPO5eMzONljXazz5iemt3Ctfy9w+bjc+FSevyJpiaSwZaQ9XEGksSojkB7oklyKpZ6TWs
	dpnlWMW5bBdqrePLAC+RhhedbOKfNk6V9OUPV/2l7t0xF4bNLQM++vieOfQgFhVF1ZyYy+PuK85
	p8q3Xg+flDCbAlk0qB78FpENv9BLMSyofF16CyPF+VoT7DuYowJW8/P7RMsqWhA6jkWpK6Q7sGL
	7A=
X-Google-Smtp-Source: AGHT+IGjfZSpRxmy0d8Kz13TgIn/Y0jGJ8FtmF2Qwl0k1+fDeFjBQ81DemIWKqae+VW3O+peyKr7qg==
X-Received: by 2002:a05:600c:4711:b0:476:84e9:b571 with SMTP id 5b1f17b1804b1-4792f25f316mr56061445e9.14.1764920051342;
        Thu, 04 Dec 2025 23:34:11 -0800 (PST)
Message-ID: <16830f7a-1bc9-472a-adfc-1d959b6fa58e@suse.com>
Date: Fri, 5 Dec 2025 08:34:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Changes for several CI improvements
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.12.2025 17:37, Marek Marczykowski-Górecki wrote:
> - Alpine update
> - Debian trixie
> - Linux stubdom
> - test arbitrary linux branch
> 
> Technically, the last patch isn't strictly required, but it eases debugging.
> 
> Green pipeline: https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2196630637
> 
> Marek Marczykowski-Górecki (12):
>   Add Alpine 3.22 containers
>   Switch Linux builds to use Alpine 3.22 container
>   Add debian rootfs artifact
>   Add linux-6.12.60-x86_64
>   Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
>   Include git in the ARM64 build container too
>   Support building arbitrary Linux branch/tag/commit
>   Save Linux config to artifacts too
>   Add linux-stubdom dependencies
>   Prepare grub for booting x86_64 HVM domU from a disk
>   Prepare grub for booting x86_64 HVM domU from a cdrom
>   Setup ssh access to test systems

Like for the other series, where one patch is missing, I'd like to mention
that here patches 01 and 03 didn't make it.

Jan

