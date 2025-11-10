Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D06C47BF6
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158542.1486879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUKv-0000dW-3g; Mon, 10 Nov 2025 16:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158542.1486879; Mon, 10 Nov 2025 16:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUKv-0000bA-0f; Mon, 10 Nov 2025 16:01:45 +0000
Received: by outflank-mailman (input) for mailman id 1158542;
 Mon, 10 Nov 2025 16:01:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIUKt-0000b4-Jq
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:01:43 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c61c7d4-be4e-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 17:01:42 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b72db05e50fso491466866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 08:01:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bd36csm1155270166b.61.2025.11.10.08.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 08:01:40 -0800 (PST)
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
X-Inumbo-ID: 8c61c7d4-be4e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762790501; x=1763395301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g4so7OLSY4DXQD42oGJC/cphEJsZdKiRBCvcc5b/+Js=;
        b=HQAwh7YSI79F+rJYXqdPe10Xpp0DX0moGYgZD089OMSpnwYSLXy0eF+ySLnIk1srd6
         mqQgp8lqYjPBdZzalNMcvyXgYODtyK5QH5/+ptF4lyFagMzm1UeXH66XA4naFK09Z4mN
         FkyCJcY8tQGFWJc2SipuvvbO4Z4rTHpPT7ZeYkT+D6R46w9wDiGuUdCBgsDAdeUh7Wnj
         VH6PAdxbB+NCmXJ413CcGUJboHTr2hi5X/eq+iDkjaanxsJN2ei3MVXxeEyV5pqsF22L
         hQoF3hDx6xHQ8ucYdCIyhKFX4yaqRMamJgJOraiZs3tAkwR8CrhtssTdY53nSxSZdMEa
         eukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790501; x=1763395301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4so7OLSY4DXQD42oGJC/cphEJsZdKiRBCvcc5b/+Js=;
        b=PKuZx0k3xRzxHsrgf9hhLdmBvVhA8FJ70IsXBbjgP8F9jy8gKYkmAr6O3g0jbOt7H8
         DiDCAieAl4+Pn18g0mKdRUyvb53GedvWaNhIEjOZ6jJGXioXBvvfjreQDbLuRUAaZi4X
         OTpC4zH3kXl2RywJ6rIKvkQFSt8BCHKZcUrJLYJY10B/TaMcvHFusMbi1qEf8O1D3Qy0
         QGwUGbu+In8HuX+Rf4ktMykDOcI81RF0+vzhSqxgN2wQ6wdrJ9X+nArCvqVX2uyLI9Pd
         uAO23F+B1y3lH4IpzW9ZvnYsDnY7DTEWWYwtPFEkJRmif/9p6xhYvArJLv8KbtWSEdJS
         goQA==
X-Forwarded-Encrypted: i=1; AJvYcCU6nRqOTsgJdh4VX2KDRN3bDYbElCM79u7xvEvhf7IlXxLTNcVtumABD6xkBUceOY6qsbGwbv9hmi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7RqtMyoTjgsrlolzWSINB/7U5I8WzzGfmfylDydorqHp/7a19
	qvTFw7b5Q52pqaUZ+umu1kzfVapp1d1GvAhTSVTUhU3KG0x8+c0MgeVqFP7ZWwiSvA==
X-Gm-Gg: ASbGncvufXAvH9OpdtlZQThiJ/9P/G4moo0Aj4f7VmbPCv3d0PoDZO1F1nQ8rj34XyM
	fPw4vXx58NrKHAugpYls0uyTGdaTpnZXTI1lgb7q5ZPcxA4XjtxHTnMlLjEbiX7KDCsp4v6H48S
	X/FIe/08/6JTM5B6lK6p2LraL7x2vOcdAWU3eP27eYmfU6eOSpQoyiNPnWu+aPqsvNF6fRqKXmk
	Cryqt6PLxcU8DF8OucYucvQcgzpv3y/fnPNK8F/eNQK9/R1KQbqL5jpZ88QzemfXx4r6mG/x9Wp
	VkuD3s+oZvXJt6VrS8abwTWp6cxDozS1D2qB+8tSbgNNKX8OVoAu498sw0Ee0lL2MJspWA5CmCC
	UBi88prhyR7+Kma1z0J2OREGCeJ2T5DIQlK0PXjrsFkN92/4NukLXZ4YucA5Yrre2YBtrC644Qh
	Bzck0FeDOe/E4Z8FQSdnOp+58eleOyvx+uEIwQ+Q0rE3E47+ULv/IkPSZrRyEeIW7z
X-Google-Smtp-Source: AGHT+IGMVOJT/D2CV5+kYq3OovFmdbNZBVBwFcyjRkmLKzQqgznWWLRUDckpU7ergnDnPF3MIv3jvg==
X-Received: by 2002:a17:906:6a20:b0:b72:a0f2:5f99 with SMTP id a640c23a62f3a-b72e0333d1emr947632066b.18.1762790501201;
        Mon, 10 Nov 2025 08:01:41 -0800 (PST)
Message-ID: <4ac8284c-e7f1-4d6a-9241-d6c30155551b@suse.com>
Date: Mon, 10 Nov 2025 17:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20251110153551.84813-1-frediano.ziglio@citrix.com>
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
In-Reply-To: <20251110153551.84813-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.11.2025 16:35, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - avoid leaving target if some command fails.
> 
> Changes since v2:
> - do not convert type but retain PE format;
> - use xen-syms.efi for new file name, more consistent with ELF.
> 
> Changes since v3:
> - update documentation;
> - do not remove xen.efi.elf;
> - check endbr instruction before generating final target.
> 
> Changes since v4:
> - simplify condition check;
> - avoid reuse of $@.tmp file.
> ---
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 19 -------------------
>  xen/arch/x86/Makefile | 16 ++++++++++------
>  4 files changed, 13 insertions(+), 39 deletions(-)
> 
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac3346..c66b18a66b 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
>  Once built, `make install-xen` will place the resulting binary directly into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> -match your system). When built with debug info, the binary can be quite large.
> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> -to any combination of options suitable to pass to `strip`, in case the default
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. This
> -binary will not be stripped in the process.
> +match your system).

This behavioral change likely also calls for a ChangeLog entry, btw.

Jan

