Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F3A1030A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 10:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871048.1282092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdH8-0003JV-SJ; Tue, 14 Jan 2025 09:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871048.1282092; Tue, 14 Jan 2025 09:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdH8-0003Hm-PN; Tue, 14 Jan 2025 09:31:54 +0000
Received: by outflank-mailman (input) for mailman id 871048;
 Tue, 14 Jan 2025 09:31:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIyo=UG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXdH8-0003He-81
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 09:31:54 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62e28ab5-d25a-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 10:31:52 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaf8f0ea963so1031570766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 01:31:52 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905ed3esm604738366b.33.2025.01.14.01.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 01:31:51 -0800 (PST)
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
X-Inumbo-ID: 62e28ab5-d25a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736847112; x=1737451912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bfpf5mC3A9tITubeEOg+HMA9r6EKU3Pj+ywED/juqVU=;
        b=Fh8ubhqnl9pFEjGaspwSsPnRaSn9KN/kcmW3MPUujE27S5lN38sRoc0epEqU1hhMB6
         tbxWobVPvsXcFq/3H3bmU3ekZK/bpd/bfCI0bdP6oTx7De9BX3EQIQixx+2zCU6e1sRO
         ekoVkia7fBQLd2dCA4v2fGFRjhZarnsPM28pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847112; x=1737451912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfpf5mC3A9tITubeEOg+HMA9r6EKU3Pj+ywED/juqVU=;
        b=GqQ9aLR3SFC2s0w0b8o92IBSzf2yEw8Ywq25IhH1fvpuv9yUtVGujllSVB18fcZpPn
         8LkA4D8WSTg3KtGHxfM+FAJBqWB1dBfeLMh8/6b9NDerRygFw/tWmT4JnvcNhol4jkl/
         4QeSQpHHJhY0168QNxLmpzuPf870nIEjNvAdyLOIxMkcG8KVr6HSp7RUtTIWTYuu993V
         vlWbWyrvsVO5xKpNGTquWZmLRpJwYq0bPdwo5XzBXMSXCtQ7TZq5oXzI1wQzqReG02rU
         6nnHpHPacjEVhULsymUAXDBbjFopoeCsjBgrtjyzBSiei3cHTNHY5joSzkg0SlXiDqz8
         6HyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWek57J4uz2Eq4+ucE16S079lwzmKTI7hNKQ645qS6FgdEBnlYbBRGSx2XwjiK8/I8fW+EJNKScCYI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjYgaYrUa7B5oqeEKp9EJNjykbi/gbJ/y8DT5YtB8DKZOgmKt3
	7IeWV0e3TKJuynDhCWRJAXyxpBeSjsYkHElDqofFZuSeuvaNC1SBmLMApPgvpYU=
X-Gm-Gg: ASbGncsfCtloCo83TvCc6fXXEdwiMjpbQyiNhyFFKuHalQdn/SLxv74PQNrxI1IT9uN
	OjrtXlcWV5uf1zF5G7bFo+MbrCn4YJJlAi2yuaoxWcxAIJ6Ns+U0gzeFP5FM3/iYmwLXL2/+j1k
	3yjlgTxyDXrEYyPD2mkOuEJ47xA089u+jJ4LqBdSIo14ZVUCCY0UK6wMYHba82P5uz6q+LlfPHS
	PQk/PIk5tdoyQ72CeCN1ii3lrR9/Go+SS4sl6+/d3XKIbYsGu8jeMtAW2N4k3KEEomnvlrDMrlR
	ulYh+tFadI7HsqrDMGZT
X-Google-Smtp-Source: AGHT+IGgywRW1D4kzJynHyfoHVJiJzg5S9rocjnl4bXrSvF3zoGQWu4PTzTjC/K54ZKW44GZTtmeLw==
X-Received: by 2002:a17:907:d24:b0:aa6:7ab9:e24d with SMTP id a640c23a62f3a-ab2abc94efemr2176602666b.57.1736847111728;
        Tue, 14 Jan 2025 01:31:51 -0800 (PST)
Message-ID: <9ab180fa-91c3-416d-9b39-2a9b2970dcf9@citrix.com>
Date: Tue, 14 Jan 2025 09:31:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <20250114042553.1624831-3-volodymyr_babchuk@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250114042553.1624831-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
> diff --git a/xen/common/stack-protector.c b/xen/common/stack-protector.c
> new file mode 100644
> index 0000000000..8fa9f6147f
> --- /dev/null
> +++ b/xen/common/stack-protector.c
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/random.h>
> +#include <xen/time.h>
> +
> +/*
> + * Initial value is chosen by a fair dice roll.
> + * It will be updated during boot process.
> + */
> +#if BITS_PER_LONG == 32
> +unsigned long __ro_after_init __stack_chk_guard = 0xdd2cc927UL;
> +#else
> +unsigned long __ro_after_init __stack_chk_guard = 0x2d853605a4d9a09cUL;
> +#endif
> +
> +/*
> + * This function should be called from early asm or from a C function
> + * that escapes stack canary tracking (by calling
> + * reset_stack_and_jump() for example).
> + */
> +void __init asmlinkage boot_stack_chk_guard_setup(void)
> +{
> +    /*
> +     * Linear congruent generator (X_n+1 = X_n * a + c).
> +     *
> +     * Constant is taken from "Tables Of Linear Congruential
> +     * Generators Of Different Sizes And Good Lattice Structure" by
> +     * Pierre L’Ecuyer.
> +     */
> +#if BITS_PER_LONG == 32
> +    const unsigned long a = 2891336453UL;
> +#else
> +    const unsigned long a = 2862933555777941757UL;
> +#endif
> +    const unsigned long c = 1;
> +
> +    unsigned long cycles = get_cycles();
> +
> +    /* Use the initial value if we can't generate random one */
> +    if ( !cycles )
> +            return;

Indentation.  Can be fixed on commit.

Everything else LGTM.

~Andrew

