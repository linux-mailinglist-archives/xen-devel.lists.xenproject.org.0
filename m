Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF199517C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:24:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813174.1226001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syB8C-0006CG-Ua; Tue, 08 Oct 2024 14:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813174.1226001; Tue, 08 Oct 2024 14:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syB8C-00069E-R8; Tue, 08 Oct 2024 14:24:08 +0000
Received: by outflank-mailman (input) for mailman id 813174;
 Tue, 08 Oct 2024 14:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syB8B-000697-L1
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:24:07 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9ed70b8-8580-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 16:24:06 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53995380bb3so6901612e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:24:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9941a697cesm431307466b.173.2024.10.08.07.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 07:24:05 -0700 (PDT)
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
X-Inumbo-ID: f9ed70b8-8580-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728397446; x=1729002246; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ntahxafuWpFzDvL54TPOY/ookNL6A4YtPZ/F0Y0SSfQ=;
        b=TdcbXl8ZDsihn6g14Lr8049oT7jRrEtGS+nvMr4L0muvwiUnSPSYEt/pdxL8x8LmHP
         1/fUE5v7/k+E4kXUNUlynywH/9KA/ORX0957Li7/44Z1SNFUIo1tvMqE289Ui8t2NSho
         v4zxLaap21ls7YTStFk/y7CqRs15TyooERhOHhGYVYlaGxsENvbXYkvghNc2rs9CGO7f
         uq7PAx+xmBoqoR9CjN3zaqKYAhLx9R9yMAWcdzEoeGZa48WBzY8+ubqRR1K2XKb6G3sl
         iNJCpGvVY4y3dwa3ibYYU6WZiYkWE2JB9HFi6Sg9CIK7KQAeFMTxNYC4U1JhIXPUOQuz
         V51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397446; x=1729002246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntahxafuWpFzDvL54TPOY/ookNL6A4YtPZ/F0Y0SSfQ=;
        b=ik/sc3kXZTUhu197rU6WtXctysN2UMqfWg0AbiuOywnP0Rtg5Ct/KWojFn8rWqKGUt
         Cksl7Q5f4gDP2ltQkPGapNqIMdJcrDBaIlgfz1EVgj2bpvt5N4cYUkUYwGG4ltSKqAZV
         0sDRCQxRbYqzxXuMslONmPEkk+UyMcHVqHekkghEOzk39AIHCeQx6SIGEv4XWJwnwaTX
         hRtSpZ4/2DDTD3hpaYxjviosulnVyInnOav6V135R5lONUEcRDr05hfCjKyNNCpelqTe
         f8Ti77wylN38O+kYEWikx7f917M2P70nRZZeF+hpsWmbocMmehjR02FVyo9luN/O5t4s
         Lq2g==
X-Forwarded-Encrypted: i=1; AJvYcCUqj7UA2YAjgiv0ZFOyWLQLDAWOregCZHWv6aF5Yogf0KCmPJrwuVgFGXk6AToPxjz8YogPytoGxkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTPraCd3CMKu07oQyQ9PPiFR5efDE8AJ3/eO8iyopSmULXFGnU
	l/v170l76o3Oq2urSY5ZbCpl/ayjh7I6PU5pAlWHISx5ICMhk+zi3TTu3dNHBQ==
X-Google-Smtp-Source: AGHT+IGM+r1YHDEJP+A3fDijRhMyeK1VAMZMybIvkiCGWGRZwXXVO/+l0B7P11ZPTl8S89xaXksIuQ==
X-Received: by 2002:a05:6512:33d2:b0:52e:767a:ada3 with SMTP id 2adb3069b0e04-539ab9e16femr8028309e87.47.1728397446196;
        Tue, 08 Oct 2024 07:24:06 -0700 (PDT)
Message-ID: <e70f475d-f373-4ab8-a4f7-5562d0d76c78@suse.com>
Date: Tue, 8 Oct 2024 16:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/19] xen: Update header guards - Kconfig
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
 <20241004081713.749031-12-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241004081713.749031-12-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 10:17, Frediano Ziglio wrote:
> Updated headers related to Kconfig.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/tools/kconfig/expr.h   | 6 +++---
>  xen/tools/kconfig/images.h | 6 +++---
>  xen/tools/kconfig/list.h   | 4 ++--
>  xen/tools/kconfig/lkc.h    | 6 +++---
>  4 files changed, 11 insertions(+), 11 deletions(-)

This is a standalone tool, and hence the guards used here can't conflict
with those used in headers involved the the building of the Xen binary /
binaries itself / themselves. I'd vote for leaving such alone, unless
there's an actual reason to alter their guards too.

Jan

