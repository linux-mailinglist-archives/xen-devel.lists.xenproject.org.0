Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85857CF4413
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 15:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195463.1513399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclzt-0004m6-5Z; Mon, 05 Jan 2026 14:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195463.1513399; Mon, 05 Jan 2026 14:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclzt-0004jY-2p; Mon, 05 Jan 2026 14:55:53 +0000
Received: by outflank-mailman (input) for mailman id 1195463;
 Mon, 05 Jan 2026 14:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vclzr-0004jS-Fp
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 14:55:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b190ac3-ea46-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 15:55:42 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so93124225e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 06:55:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6c0c148bsm57757175e9.18.2026.01.05.06.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 06:55:41 -0800 (PST)
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
X-Inumbo-ID: 9b190ac3-ea46-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767624941; x=1768229741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UCbETxYKREBNzUds4ADq3xqV9KAq1CS2qCXv+CKwZd0=;
        b=K4wdpZ8Pg72LOv5xId5URHRgPbyQmdKiebkyETFt2XO0mLKUO48X1A0ecvbya6Pb1H
         tcowpx1aKjqvO2bBehxJOOcLM4+fqVSzMRL/x/1P/Kedp0PzTn64nX5ttxlO3Hp2M2iJ
         VzL9Y1qJMC/3+vNndElEO6W8r80tfftKh1p9tMD4RIUYuq4ojaG7O4r+pchsHPB+4RyR
         WrqkvPgXxauhNSs3Z7tPRMQrrDPwDBR5BkWwAZD3CGWXLRDkIBPYo7koRe2kUGW8C7fB
         H2wXShsQf7p2E50LaStN/UNOdlPtdvQZR4LqAxlhHSFYJmbmtT9xbZnWaktP4ANOoAGl
         WE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624941; x=1768229741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCbETxYKREBNzUds4ADq3xqV9KAq1CS2qCXv+CKwZd0=;
        b=oca/EzrDcr2IDt5p1xIomp4dRq2+3zgpT46K4OhBzo54mwsSHQ3FBBOQBz2/APxrFB
         4dOxWN3FXfcBinJ08wuhZF8vg1C1YrS2TZCJpJ2cTrsm6XP38USWKpi2LDi4tzExuK0K
         iq57f6CKMliqO+s+qnZdNQM3T5e0fLupjjB2L9E5we4vJCaVBfSvDfvwRr2M4TKSWT6f
         Rh4H6xd3cNgnPZ1OfAD625H/XZsjFcVdL9nR5UUw2Clo3bPLuMFaXqE+XVqEofHDqRwd
         tcDA+vPpDcM03bV/lmeMmanaLSEFVfZC9NMEFun+7hpwAILyv62oI9S6Ece+gBZe1/Wm
         WcNA==
X-Forwarded-Encrypted: i=1; AJvYcCXKB3WQD9DD3A4zFfQCiM1rIWNpRFps5/UP39ZKn3eibD4T6Z1KLoCj8XVomW7USZrsF96BQLwVwtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxV1rw6fKBDWi7+xzy3+eW8axCs+THnprkQXlILBPRUREkpUSi1
	cUQ9o4Bx5+z2k70mP9WEEFvjitwAURdimPBpFAUcJRsiwIy3YkKIRODNe0XW+zmPaA==
X-Gm-Gg: AY/fxX5Wxe1f2dI9eM1C9FBfRXa+EUJxalhNcuUK5FR0f6iN5JqXVkVDnxn6NyDW4Kn
	IRO+APcy8rXIzBnuEoVfTinzcpsWf3lzfTqMeHFf8mXSOEzwksRMU3lunvMsdrvFxX0KchsiDNY
	WIFMK4ctBcsLLmsVUVRNTkQuZrDx9PGLKFrH+b5fjNGwOBIGiipeCV5WMw+UqCq5SAUa8o9Y2AS
	R2GTMF/0yBfZvAIyrtvg9t+HyZFvLFEuHZPfugrl+fb4Rq792jj+pZEpY9LfJr8AeCb/06nHu0l
	SoJHgQkK1MR7cGf1N1RGWfg9wkfIIf6vJwJNKynotm2EOO1md0vkO3ViqHOq8dy2ZldNy3QXNPE
	TktlR46oZPnK6tnynCFvyiPeQ50PJNpHsqcz6bNsZ9SyOxKp7dAdQR6G52EQVIYxsTyw5/qG02h
	nafnE5084IKFitYrUl611NHNPPxEGzkvkZEF3cH2/emzdUeiy4EktXeTrxhcJfjavCaym1yBiAo
	XA=
X-Google-Smtp-Source: AGHT+IFHINvgnlyWbdUXWba9Q1jbPRcjuNR9PjTwa2ylez1K3thP6luycJ/GjS3nvfCnVtLjgbr6MQ==
X-Received: by 2002:a05:600c:548d:b0:477:79f8:da9d with SMTP id 5b1f17b1804b1-47d19584bf6mr687448085e9.24.1767624941457;
        Mon, 05 Jan 2026 06:55:41 -0800 (PST)
Message-ID: <b05b3746-6611-4aaa-820c-b45e9c6a8ed6@suse.com>
Date: Mon, 5 Jan 2026 15:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: rework deviation to address varargs MISRA
 violations
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.12.2025 12:22, Nicola Vetrini wrote:
> --- a/xen/common/libelf/libelf-private.h
> +++ b/xen/common/libelf/libelf-private.h
> @@ -84,7 +84,9 @@
>  #define elf_err(elf, fmt, args ... )                    \
>      elf_call_log_callback(elf, 1, fmt , ## args );
>  
> -void elf_call_log_callback(struct elf_binary*, bool iserr, const char *fmt,...);
> +void
> +__attribute__ ((format (printf, 3, 4)))
> +elf_call_log_callback(struct elf_binary*, bool iserr, const char *fmt, ...);

Just one tiny, nit-like request here: If already you touch this, can the
missing blank ahead of the first * please also be added at this occasion?

Jan

