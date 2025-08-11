Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D08B20948
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 14:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077572.1438616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulRyq-0000WA-Tz; Mon, 11 Aug 2025 12:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077572.1438616; Mon, 11 Aug 2025 12:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulRyq-0000T6-Qs; Mon, 11 Aug 2025 12:50:24 +0000
Received: by outflank-mailman (input) for mailman id 1077572;
 Mon, 11 Aug 2025 12:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulRyq-0000T0-3k
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 12:50:24 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be845a97-76b1-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 14:50:22 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af967835d0aso611209466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 05:50:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076aecsm2007165166b.9.2025.08.11.05.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 05:50:21 -0700 (PDT)
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
X-Inumbo-ID: be845a97-76b1-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754916622; x=1755521422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TCbyDIF94AlamRIYQYWfUDGlkZFGfhhbNuFZHDH84sU=;
        b=Y3eesaKGwAVfrDO3Rpqty953loYDodfHBZDbX5I77JGtPw5Z1uuDUFfr8yek4pRLPe
         F1ZLKCGLeBKTVCGH2eOj/Dq1Zh8COWwSoTZG+zeao7bT6uqDfcfGV4nxAeLOGAZd6RbR
         U/oP9kX2S92lykcf8yh9JQ1ksK1hMR70YPbaNQArEW/H2sif0NVI3tGbBZXzMUvhdIRN
         eYZNkbpZ6SAdxPa+Y2qXWq4sWRI+ntR4zohsFPTk2noayfUPbR4142Me1WhKo4f+v3FH
         N+xqxAzA11IyOUFu7+/S83GyeEnF680EaVKUNm91N5nJIHQPJATLGYIQ+/yCufIaqRBk
         jS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916622; x=1755521422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCbyDIF94AlamRIYQYWfUDGlkZFGfhhbNuFZHDH84sU=;
        b=lrPaIxDrIPfJQq2NQR2zmZYTCGjEd+jxYj4JY3znTCdSWhLHv/4zn/i+OUI2bk+xbN
         rmQQP0EwBDh/r4BAghvDoJ3bX135ywlUbMZhwthM4EE6lOtP7a/KZ1Ovx9rxejyweXQ3
         7OWJxPyV2+TNDA+52CpLYY1ZPQkevruHv0VNFYAKtqqSwA3XzlLd+yxeCcLDQ/vNU2aD
         1cRcNqW4qNMVK+WXPAMa3YpL6LvSKAqrZ201hdBXsoXg8AI4aWtDkziYW6VZIAJD5SYu
         o7kiG1O8FQXRHTDdgRHiQAv6ybQOpnZVvsq/PThf8p1VbFPZnxKRtCQ00BjH54Tiktav
         7q3w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/bVM4P6GHQpwqlboojBaYqU6w1jdb9GRgmD+UyAJI3bkYVT6xTMKespBrLIvOCVPLlWia6sbotY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMK20sfcXwUAOWeYdO6x96/FNmkYnEjCzppxfqYGZmq47USlZ7
	/INf1Q6NUqIBgpHbYUfoiwQWQcp+x1tKcRx1O59MuIPmDMCu2IlGMHMDk40iOWSzYA==
X-Gm-Gg: ASbGncufg8sQNB5fdr4LvUtVEGSuKXbtEDJd9Lljc+lOs0bBDgTGgh3ktOgx66Kgoq9
	kl7aK1uP+FkY5On54Nlw2YD1lckg2+vaZT5BjNgWGT3FeChXOUxUIwjr8kRx+1a44615b8D9Tf6
	EUkO5BLtakznkyeigg23Sc51iW0u25p89W5Mhk6lu4k+T4NVn9O2nYCDo4lFZ5jhkFFCpBjyrrv
	8LXVY7cntpGckri6DdAhkryVX4VmWG35CfglLZ2QJMA0lo1L0uUE6AjqioDELYrVN4LCPsyLhZZ
	aftqYbXJSkQ1hIk7Aavth/BVjpUA0mRHfQjoxa9hZ8Nw9p2T5uXUX/FW3s5HlRzt3sptSe7e0yS
	I5uRwK70TwHVCnasaphRQUAw1lEtCJUxyzw+RhxmmaCKbA/Ukuq4TrzuFOhx6rshwameREHQ+uR
	9CQFzzTlMNCHwt0eLw5w==
X-Google-Smtp-Source: AGHT+IHtsdPfHP4cx1aN6wUXGX/juk3gsHg1VJvYln/2taaYdfRrhghC6sucUAFbBARsShp6PysUDQ==
X-Received: by 2002:a17:906:a4b:b0:af9:d863:5ce4 with SMTP id a640c23a62f3a-af9d8635f81mr724326366b.15.1754916621980;
        Mon, 11 Aug 2025 05:50:21 -0700 (PDT)
Message-ID: <60a8be02-430b-4c37-bb4c-6285c2676c10@suse.com>
Date: Mon, 11 Aug 2025 14:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/20] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <fe455eac54b6c874b8ddb69e94703c9a28330a4c.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fe455eac54b6c874b8ddb69e94703c9a28330a4c.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Implement the mfn_valid() macro to verify whether a given MFN is valid by
> checking that it falls within the range [start_page, max_page).
> These bounds are initialized based on the start and end addresses of RAM.
> 
> As part of this patch, start_page is introduced and initialized with the
> PFN of the first RAM page.
> Also, initialize pdx_group_valid() by calling set_pdx_range() when
> memory banks are being mapped.
> 
> Also, after providing a non-stub implementation of the mfn_valid() macro,
> the following compilation errors started to occur:
>   riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
>   /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
>   riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
>   /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
>   riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
>   /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
>   riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
>   riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
>   /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
>   riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
>   riscv64-linux-gnu-ld: final link failed: bad value
>   make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
> To resolve these errors, the following functions have also been introduced,
> based on their Arm counterparts:
> - page_get_owner_and_reference() and its variant to safely acquire a
>   reference to a page and retrieve its owner.
> - A stub for page_is_ram_type() that currently always returns 0 and asserts
>   unreachable, as RAM type checking is not yet implemented.

For this latter part I can only repeat that the code is reachable, and hence it
is wrong to put ASSERT_UNREACHABLE() there. That's true for Arm's code as well.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

With said line dropped:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

