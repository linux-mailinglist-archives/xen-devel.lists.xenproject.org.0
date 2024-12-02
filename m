Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2F59DFB9E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 09:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846315.1261481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1S4-0005We-S0; Mon, 02 Dec 2024 08:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846315.1261481; Mon, 02 Dec 2024 08:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1S4-0005Th-Oe; Mon, 02 Dec 2024 08:06:40 +0000
Received: by outflank-mailman (input) for mailman id 846315;
 Mon, 02 Dec 2024 08:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI1S3-0005Tb-HJ
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 08:06:39 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d8c449-b084-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 09:06:36 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53e0844ee50so830963e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 00:06:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385d80a77a0sm10120305f8f.58.2024.12.02.00.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 00:06:35 -0800 (PST)
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
X-Inumbo-ID: 59d8c449-b084-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU5ZDhjNDQ5LWIwODQtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTI2Nzk2LjI5MjU3Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733126796; x=1733731596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PNkBisc0H7d3OdIXOLo+yVp58Nm+CYdzw1NpzqAOANY=;
        b=gb/MhobbSWdiTC8uuSoueyIcfnriKhtP7Sk0h4UA7kBRfY7XoHxg7jhX+T/C0zd6b2
         GoH/1kdaHr5KMsHpiTLrNSpL0iVUivqQs1+TPmaMjYFjyycQN7hXvpeVGflB9Qf+JBHm
         yX7a0W18sIjAZc7K//JvDk9jkogjYuk4Nton31F6gh1R2KZqzex11eOgmGOgz0CEZ6GW
         pgQer0Kem9pFnhC3eUsBHxidJy+9y1D+V502Nen7BHozZP4aiRyfc/xp6a08hGVq3cuQ
         5lBRcawHW8LP47hXR5r4UGkLfNdhWPHGckcPJ2ybbmVhpVY3u+f7g4ZZudHEY7G3GgUi
         Y5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733126796; x=1733731596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNkBisc0H7d3OdIXOLo+yVp58Nm+CYdzw1NpzqAOANY=;
        b=A99UC7OTOo5sXsMJrQC+EYQLmtkO7AmZj1HHNHvq1Jxwz3ZWftlPpBl3tgURlamoGY
         QJkRcb1XHjrok6ngX4dXL7k48ynjboW0fEZezv0tVfmQ4hKVxdOhsVANKIoigmoWxQty
         Pr7JY6JFmru0wb1sKjwQ3ksGsMQxX22tG6VUaDn96R5KaOXZiq6B0AVxg6mEry/MFQ5Q
         8fUMKKQ+lqPXeeYxlR6g3gd/YjJ/WEyJiNfaRuULUju+Z+mjHOzd24UgdC+/4DTEaDfP
         hfXPvjbtoluscomd6EEue5aJvbiBZjPjngYapqrHMulPBR53HTo5wYqBlKwxu3bjGDHA
         QdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/6lBElbD/zYD5546tSJh46q0h1Ybd+Cuxy5xqXS1hpqkuaYGhXXdcJMIl5Nl2j7aVuJRe6pfcpNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlT4OU3VmYimwERxXIRaPgZjX5rWR82Va7xxOUN/DY8gNtOf6h
	YeIcJdJeZRP25RSsUfH8G0+iN9pqvb0My9zR+9sO9U/de0bADjZyowXFfDkwYA==
X-Gm-Gg: ASbGncv+Q0r7JOL6R38etjFU92/vskZm8GN4AxmdKWeSZDZYTNM4eGfuW2J2PKadLYO
	ktwqGYX3zDsvRdOiZ9iQpYcr21OtmUVWN2BTOL35Pk+UktCBTtWgAmP0WV8LMqpSFH3k21TI4xX
	j7LU1YrSlINkqpfM63BiKqddMgAsUnRnSsifk2xzcjKLZGdSJVw0eFd++TvhkbYBxBroIY/azen
	Lf9JnuHaRdTI0ABzTVI/SVzTu9rF2GXI5tgj+CugVWfRb/GspFsrqBxG8FZL5sKZCf8UiJetT8O
	sx1oIqgWi0cFHZ+1Q9EG8HASGkKAny8lQso=
X-Google-Smtp-Source: AGHT+IEaJRhlMkMcSvBtTqqy9L/QuW0U3PEUk1gZ8RoEEdCgJmXI9NG1ljF5Owm9BtzT9fEyOgQfCw==
X-Received: by 2002:ac2:5399:0:b0:53d:f1d1:13c5 with SMTP id 2adb3069b0e04-53df1d11418mr9649074e87.16.1733126795653;
        Mon, 02 Dec 2024 00:06:35 -0800 (PST)
Message-ID: <56f5cf93-33fc-4314-8d38-93d9e0026429@suse.com>
Date: Mon, 2 Dec 2024 09:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241130010954.36057-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2024 02:10, Volodymyr Babchuk wrote:
> This patch is preparation for making stack protector
> configurable. First step is to remove -fno-stack-protector flag from
> EMBEDDED_EXTRA_CFLAGS so separate projects (Hypervisor in this case)
> can enable/disable this feature by themselves.

s/projects/components/ ?

> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -54,6 +54,8 @@ TARGET_CFLAGS += $(CFLAGS)
>  TARGET_CPPFLAGS += $(CPPFLAGS)
>  $(call cc-options-add,TARGET_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
> +$(call cc-option-add,TARGET_CFLAGS,CC,-fno-stack-protector)
> +
>  # Do not use host headers and libs
>  GCC_INSTALL = $(shell LANG=C gcc -print-search-dirs | sed -n -e 's/install: \(.*\)/\1/p')
>  TARGET_CPPFLAGS += -U __linux__ -U __FreeBSD__ -U __sun__
> --- a/tools/firmware/Rules.mk
> +++ b/tools/firmware/Rules.mk
> @@ -15,6 +15,8 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
>  $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
>  
> +$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
> +
>  # Do not add the .note.gnu.property section to any of the firmware objects: it
>  # breaks the rombios binary and is not useful for firmware anyway.
>  $(call cc-option-add,CFLAGS,CC,-Wa$$(comma)-mx86-used-note=no)
> --- a/tools/tests/x86_emulator/testcase.mk
> +++ b/tools/tests/x86_emulator/testcase.mk
> @@ -4,6 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
>  
>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
> +$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)

Is use of cc-option-add really necessary throughout here, when ...

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -432,6 +432,8 @@ else
>  CFLAGS_UBSAN :=
>  endif
>  
> +CFLAGS += -fno-stack-protector

... is isn't needed here? Iirc the compiler version ranges supported don't
vary between components. Then again afaics $(EMBEDDED_EXTRA_CFLAGS) is used
by x86 only right now, and with cc-options-add, so perhaps it (a) needs
using cc-options-add here, too, and (b) it wants explaining why this needs
generalizing from x86 to all architectures. Quite possibly hypervisor use
of $(EMBEDDED_EXTRA_CFLAGS) may want generalizing separately, up front?

Jan

