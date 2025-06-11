Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9208AD5002
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 11:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011402.1389826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPHrr-0004JC-Ij; Wed, 11 Jun 2025 09:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011402.1389826; Wed, 11 Jun 2025 09:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPHrr-0004H8-G9; Wed, 11 Jun 2025 09:35:35 +0000
Received: by outflank-mailman (input) for mailman id 1011402;
 Wed, 11 Jun 2025 09:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPHrq-0004H2-6l
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 09:35:34 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b97c72e-46a7-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 11:35:33 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so6155711f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 02:35:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f66a7c9sm8009130a12.46.2025.06.11.02.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 02:35:31 -0700 (PDT)
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
X-Inumbo-ID: 6b97c72e-46a7-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749634532; x=1750239332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8EHVCwcFEIYICyE4iqiEl06OzG5rQF6TaxMoUmsnhr0=;
        b=U5Vj1N+VDsiogxFMplsqGUJYTUJy9JpRALaL5JIbEWd8AluAE7BWUOELLgXYPUKNuK
         FqyMloWwYYGP6XzS28GZDXbiAP9+UUQA20R9JuLiCrChitHFF6roVlZBq2U4/qrko/ZV
         zgtHlamYIHau5ixZwKvO9FjIusn32YCkCZH1izUZGPmJmsNGE6XtzEEnYd20lq339koC
         8OCT9K/8Ot3yDuoD7hP0HE9islEnZ6xPs+L1V+dq9Je3vg16U+IZWdcZYn+oTDtRhko6
         h4d/OOELTLs0ilUXuMquBkdE+hWSereXKTDTnNgPOv13/Fdj+zo4PEkyKmlobEBV9lCf
         xEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749634532; x=1750239332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EHVCwcFEIYICyE4iqiEl06OzG5rQF6TaxMoUmsnhr0=;
        b=GH0qaISa7YJOciUnSCI+PASSeK4T1kUjxgsuIfwk8AkIvNkyWf5ykhL7ZE11JdeC6d
         OakzlkYu477GAzAVrwxzXd5SI/HhALOqreLb6nzw56/tW/PobLD3/xT1uYdzRySzpM9b
         0ceutSF9/pMpS9kavA3JvRoAjK2U7aDHKeQiXZulP+ztgRdhBLHomGL5IhU20bRRsZ9q
         hX26quuOy7qNBA5C0xvgBgkz8gefcFpZWs6HBtdanEILkPlUTg3vyTSC4xZN80tRngzF
         8XaMKmEZ36pfgih5puBMSFLoFmKJp9apRsEsXH6QLcpmp+9rzwWVUTmqs2W6dmoLwm2z
         MKEA==
X-Forwarded-Encrypted: i=1; AJvYcCV+d+Op66oZEV3sqUZPa9C9TIECfWjXHzm59EZiLPslnPiQoQxXzKgRqTAyF6r752TJYu/UqICR3OQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY6zTlci5i4T1KBH/pJYFQZR3Lt/n1Whom83fSGfQpLcoPwQSG
	HWHuwcYFxNuamRay5qUhciF5uBUEnPH4jaP+W97FhkEqAV+p0/DDXTv7DXAaAub7JQ==
X-Gm-Gg: ASbGnctU+rCEZeRABxuVS5Y1STHKwMUrtgqnfB7XEJfE85P/yzPMRF7LWJEu/auECfQ
	SK4QixTIocfyjB4jZHb1Np25M+sew5J9w7f2aybweYtxo58iP9MMKG3ING0ScdDnxxdIykRenXx
	i0IWRsa568BVtowvZ30lvSPGW0l2GZ2ONTiLNgk1VMSv1lrAfeQbOBPH7ZsGGK6HY0fXFzVbjdn
	k7FSTa/g8giSCBuXzQtu6QPbkQ4HzowMn8j5D6ZGZlXHjnr9lyivgZzeFLB1UM0VSbjICDUpz6a
	91tJFG3ESb4WdGfHH8qDlUT//45zFVAQAYFfaqDKGrg5VCX0qKKMzHHz8OoCyQr7WzTXuZOnIrH
	VT+9KARGjDiLJIC+e5rISBg0d5Y4CjWRbgJ2KwIqSvHJgN4k=
X-Google-Smtp-Source: AGHT+IGcvbc+EkPoMmmun9GyngQUCI8fLYPSzEVv6eIkazDXBR9mtjOi3D4bwzFimRKDg6FKIlqUTQ==
X-Received: by 2002:a5d:5f91:0:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3a558ad6ddcmr1698986f8f.34.1749634532282;
        Wed, 11 Jun 2025 02:35:32 -0700 (PDT)
Message-ID: <02162717-25de-4ffb-a9c4-bf6d580c43bc@suse.com>
Date: Wed, 11 Jun 2025 11:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250610101228.24460-1-freddy77@gmail.com>
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
In-Reply-To: <20250610101228.24460-1-freddy77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 12:12, Frediano Ziglio wrote:
> For xen.gz file we strip all symbols and have an additional
> xen-syms file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.

And the other difference (compressed vs not) still remains.

> xen.efi.elf can be used for debugging.

Hmm, that's the result of ...

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -238,6 +238,7 @@ endif
>  		> $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@
>  endif
>  	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>  ifeq ($(CONFIG_XEN_IBT),y)

... objcopy. Having looked at the involved code in that utility, I mistrust its
output from such a conversion to really be an exact representation of the input.
IOW I'd much rather use the original file. As a possible compromise, could we
perhaps merely strip debug info, but retain the symbol table, matching the
prior default for $(efi-strip-opt)?

Jan

