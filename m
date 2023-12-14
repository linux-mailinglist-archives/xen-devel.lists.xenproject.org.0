Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E132B81361F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654685.1021875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoW0-0006iI-Mo; Thu, 14 Dec 2023 16:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654685.1021875; Thu, 14 Dec 2023 16:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoW0-0006gH-K4; Thu, 14 Dec 2023 16:24:48 +0000
Received: by outflank-mailman (input) for mailman id 654685;
 Thu, 14 Dec 2023 16:24:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDoVz-0006gB-C6
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:24:47 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af298b7-9a9d-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 17:24:45 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc49101044so4191341fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:24:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 di5-20020a056402318500b0054cea9f91e9sm6864276edb.20.2023.12.14.08.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:24:44 -0800 (PST)
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
X-Inumbo-ID: 4af298b7-9a9d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702571085; x=1703175885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9hobUheEx6nxl7wlXkAx0RzSOd0Ksqy+4tISQdL4DQ=;
        b=HKLsIbZSetoXUI3VTYwZcQ4nB9AZZBYlsdVYJblD2aRWsoFGdbBvYcuJ0lOMV/FAOE
         8Y241CSglmK21SuWQbvB3JqiYJnrVnvWoj+iuMENby8204GazmxxrZGgSZ8NxFy8Wpgu
         LjipZPEdqd5TlcfHHd/h6+97vUUk8JbrD/i+hFFBdSIwP+idutbY4e/rgetcZpksY05p
         /iBg05PX508hQA2JuS76XeJ6mVv3d7QIac25vt5LkUPPdAeHswVhXIUuJDXbvMWxLz2d
         hl5WrFbJPrP5J2/vnpV3dKnQaeXQ/mF2WvsMOdu9TT81IBYjrsaYMqivZuHd+YXNdwPp
         qAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571085; x=1703175885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9hobUheEx6nxl7wlXkAx0RzSOd0Ksqy+4tISQdL4DQ=;
        b=QX9FTfCzIrqaemNq5O/JI/NAX9EMw5ydOwa8M3TVfNVi285B5mvKhrEtSNN+YD0+ck
         pEgaihoMrzavyVeffXJT3MC0ubhyCPyk4VIwfCV628bAScpW882XqefFjD4pBiNiZ4tG
         gUJ3JHFqfwKPc2auKelnPXNddObf1bxVldHwVN/9d9152noYrM8vM9VKQMWuilgex/N3
         WQlouv7dZ+TQFn2/tgofS8vc4Y6oaL1JWfqNdLcUwL9c9AJHMnuqZubhQCHNoHGVxE01
         rkbxKF0NFHvfJYsPqF3CB2YVrf5t/Xri3r6mwMiIb6FimJAAJD5mMEDnEIVBc+GCe+Gm
         x7PA==
X-Gm-Message-State: AOJu0YxLNdNzEWoGzw/AVVqwleXwSSHP4U7OcJJU1GDfLSQXQrfixE6v
	e8sWLEjtjCtMRg8ub9VPwWjw
X-Google-Smtp-Source: AGHT+IE48Co3kC0DbWtV8Ra70VR/Fvo8zVCCSOpgYpXGcdIeJ8iSwnM4rjFg38Rq7IMaUTu/Ok10SA==
X-Received: by 2002:a2e:a4ce:0:b0:2cc:3da1:8e1c with SMTP id p14-20020a2ea4ce000000b002cc3da18e1cmr495979ljm.74.1702571084945;
        Thu, 14 Dec 2023 08:24:44 -0800 (PST)
Message-ID: <7150b1fb-5deb-4d4d-9de1-fd5abb18ca3d@suse.com>
Date: Thu, 14 Dec 2023 17:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/39] xen: fix compilation issue of serial.c
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <6e1f19de1e8a276d487e8517810da3e8e68104ff.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6e1f19de1e8a276d487e8517810da3e8e68104ff.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> The following issue occurs on RISC-V platforms:
> drivers/char/serial.c: In function 'serial_tx_interrupt':
> drivers/char/serial.c:88:9: error: implicit declaration of function 'cpu_relax' [-Werror=implicit-function-declaration]
>    88 |         cpu_relax();
> 
> cpu_relax() is defined in <asm/processor.h> so it was added
> an inclusion of the header to serial.c.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I think this needs moving ahead at least by one patch in the series,
but I guess I'll put it in ahead of most of the rest anyway.

Jan

