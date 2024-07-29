Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E108B93F456
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766643.1177143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOm9-0002CY-5Q; Mon, 29 Jul 2024 11:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766643.1177143; Mon, 29 Jul 2024 11:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOm9-0002AX-2a; Mon, 29 Jul 2024 11:42:49 +0000
Received: by outflank-mailman (input) for mailman id 766643;
 Mon, 29 Jul 2024 11:42:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYOm8-0002AR-6s
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:42:48 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad13d5f6-4d9f-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 13:42:47 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso3862095a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:42:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3a95sm5577095a12.61.2024.07.29.04.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 04:42:46 -0700 (PDT)
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
X-Inumbo-ID: ad13d5f6-4d9f-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722253366; x=1722858166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eoh+pQlB/FOFYYuseEPthjFuyrVQIAx5RhzLBlsRonY=;
        b=UiKVuN0IskYGNDwYMTu4msM4QhunkvWMn0cdHKwcR5571hT9MQ/FIFdd3vZwdXdBQ9
         d4+VWzNDH5XxTGF7DspEvlIewANKcbxkkwHRNwm3CpMM7YOQnxT3ZmXqCp3M2j8wdL1V
         VB9HwaRPrmg8ilYDo9bOVbYNk+XvmLf3XvPZKpztorY4NjiuGAwZBd2rBguLqCkIiARM
         dAKueLPFNzQLWgF1sTSzWyKjSKQR27v+vJ6cVPUI8vgsWcf1/hTObVf8+1Ty5i6sepri
         8U5g1KrKDFBXvk4Z93DD/eAYOOOyQfJy6FaoX4FSmik7Ilc1tNvwhtkYKk/9e6Ngdfj+
         iHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722253366; x=1722858166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoh+pQlB/FOFYYuseEPthjFuyrVQIAx5RhzLBlsRonY=;
        b=TDuSRAAxtFGBBAuIXXwnqBua3OG+DJr0EHQzWZVy65drIkfouaFUKA/EHbEm5wLrWe
         HasgS74kBVnapOu4k7eXpQ2PrPK8yPjEslV+u8sRVFUGAIndZzERYqkg9JA8uZf0+Bcu
         YSffiHNRTaWhWV6EQzo/gNt4Wc/nEIFDUTQobtWaHbkAPVAzRg6pOSj3R3kGC8ONgMFj
         BB78qaWh/58WR2gKfBzAzT7H1C5GaneZVBnyp7Jpqhg4u9V1k8hLY5q5A2wC7xsJ1ocP
         Ai/f2M8CHBCAYTq26vNA/gzFN81ldjlQGsWelcqh8NAAB0vA3aRWY4+XnGO/C0jZKob+
         XAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd8DU31e8/Ozby9fopDuf/sV/EyXh8jI9WrLPXGG4i1RJxMtkPjnb9D+qWtY2QQtvVp4oFh2C/9PS3i3h084Eh3p95VJjYzYDLHRz1yVg=
X-Gm-Message-State: AOJu0YwfNH1w4mC3CFwm4WpurUPOlnjaZgJ0AuARezOPX7itsiAnEBqR
	BEkBk17xPaXy0xsqCBMBoFfm/qOxXv3ZNegemfoSWDNiF6E7iW24/rTArmM+PQ==
X-Google-Smtp-Source: AGHT+IEVZpnFnfRORA/WBXGE9zo+TcV8KDql5ikDC5iJQ+BVODr3QjMeuuQAav6r5ETR7b28Rf8GIA==
X-Received: by 2002:a05:6402:34cc:b0:5a0:e61c:edfd with SMTP id 4fb4d7f45d1cf-5b0207cb548mr5807405a12.14.1722253366573;
        Mon, 29 Jul 2024 04:42:46 -0700 (PDT)
Message-ID: <1e898a3c-b881-4ca8-99f0-48f51ed28098@suse.com>
Date: Mon, 29 Jul 2024 13:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: PE/COFF image header
To: Milan Djokic <milandjokic1995@gmail.com>
Cc: oleksii.kurochko@gmail.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Milan Djokic <milan.djokic@rt-rk.com>,
 xen-devel@lists.xenproject.org
References: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
 <728bb10e944a7ec28a67c2e9e62910632eb2366b.1721758832.git.milandjokic1995@gmail.com>
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
In-Reply-To: <728bb10e944a7ec28a67c2e9e62910632eb2366b.1721758832.git.milandjokic1995@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 20:22, Milan Djokic wrote:
> From: Nikola Jelic <nikola.jelic@rt-rk.com>
> 
> Added PE/COFF generic image header which shall be used for EFI
> application format for x86/risc-v. x86 and risc-v source shall be adjusted
> to use this header in following commits. pe.h header is taken over from
> linux kernel with minor changes in terms of formatting and structure member comments.
> Also, COFF relocation and win cert structures are ommited, since these are not relevant for Xen.
> 
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 36e4fc57fc16
> 
> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
> Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>

This looks okay to me now, but I can't ack it (or more precisely my ack
wouldn't mean anything). There are a few style issues in comments, but
leaving them as they are in Linux may be intentional. Just one question,
more to other maintainers than to you:

> +#define IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE         0x0040
> +#define IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY      0x0080
> +#define IMAGE_DLL_CHARACTERISTICS_NX_COMPAT            0x0100
> +#define IMAGE_DLLCHARACTERISTICS_NO_ISOLATION          0x0200
> +#define IMAGE_DLLCHARACTERISTICS_NO_SEH                0x0400
> +#define IMAGE_DLLCHARACTERISTICS_NO_BIND               0x0800
> +#define IMAGE_DLLCHARACTERISTICS_WDM_DRIVER            0x2000
> +#define IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE 0x8000
> +
> +#define IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT         0x0001
> +#define IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT 0x0040

The naming inconsistency (underscore or not after DLL) is somewhat
unhelpful. Do we maybe want to diverge from what Linux has here? Note
that e.g. the GNU binutils header has at least a comment there.

What I'm puzzled by is IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT
having the same value as IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE. Are
these meant to apply to the same field? Or do these values rather
relate to IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS? Some clarification
may be needed here, or the two entries may simply want omitting for
now.

Jan

