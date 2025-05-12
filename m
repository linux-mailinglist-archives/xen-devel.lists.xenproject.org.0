Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9294AB395A
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981480.1367881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETIF-0004Qq-Jt; Mon, 12 May 2025 13:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981480.1367881; Mon, 12 May 2025 13:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETIF-0004Ni-Gu; Mon, 12 May 2025 13:34:07 +0000
Received: by outflank-mailman (input) for mailman id 981480;
 Mon, 12 May 2025 13:34:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uETIE-0004NZ-VT
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:34:06 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65485bf-2f35-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 15:34:05 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad23c20f977so297597466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 06:34:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23e8d4e88sm387769266b.99.2025.05.12.06.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:34:04 -0700 (PDT)
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
X-Inumbo-ID: c65485bf-2f35-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747056845; x=1747661645; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J4EnwZzLfcv96qOvyBFBSfmU5guZudzTcnhcVL3gWkI=;
        b=LIoEfX6yFZIFvm8mrxMpPzLCPYj/WzxXlOQFaLeoq6ZQdWhpeWdD6Q5QADP/9ygrd3
         4HUpBPB2zJtv6lSRGeEu5Ub3bWN0M8IYx4ZGd67o3UqBphJ/3qVpR7DnICqUG3NBvRgM
         0li0CGNIChyUV2U5btOMW/MEw01I5HoXcHqBHkLBIKYSN/yvLJC5RIN3KvNHEpRQnkuS
         Qquh+UuIbQGXVEUeGI8TwgpGHwbe0RKZNxHYhzOVyD4CCfIU/2d0irAzK4dlOSjXpRNv
         xeNQefB1gBMUNvytW0zFxKGKa6vJ2uxXZ+jP43phM/D+6BulJh4AlkX6hg09NPYK/Mmz
         IgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056845; x=1747661645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4EnwZzLfcv96qOvyBFBSfmU5guZudzTcnhcVL3gWkI=;
        b=L5yDEnhPUt/7SV5dQxhstApRdJIjwk3VlUQ1tuHO6pUrH5JVU2dHICCS+4b7J1Gy6v
         MlNSRtytjt74k6dCWzrskn8xjuwXvJCCaUuk1FKHU/BNAoMdRq9DnKqMCoYEyBR1X0Pt
         /ZXnpYWi49pUXbA0bBavmwAjEX/VRInUsg9I5rPr0EBmQMzvxtROR96/3A9iOg/uoQsF
         BpxRA0DVmMv+1DELR6pTysBtDfVrl0VFlqG1BODREKYIXnj/CDUZbv1xlB+vzq8fvRCg
         UPlPcupkJdFM6c2IA6mlMmXo+DTe5BQCGLQOCLLpkjJAjAnI7t3VK1A0l69KA5K0KVjZ
         2J5g==
X-Forwarded-Encrypted: i=1; AJvYcCWK1DEL74JzasGqRIkX9makqic6O4mHYVFqjVI0I1dIIgA3rB2+jf0YzhHVDHu2Ns51wtT6nGP3qS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBPQ1xNAKyoH7T4ZHMRIvNTZAShJqHpJOC9rYibmbxBI/Fk95W
	Y2Qav2hT+Et51hPhgn0WKbf4TdLItKnZY0c4BgOsJpDThyfkm7wWtfPL3fhElg==
X-Gm-Gg: ASbGncscnZZaoNd4+6vS+SBOILL2QsG7i+uyzBcVk0hhQD3vbPmIR+K0B0433b/1ufI
	+8fRLXJoyzKh7Ck6mlm6mPCqTZeVRMoBocajTIfRfgr6TaB5QhM7OxS0VlxCt+uVR0rpWYfYQ/f
	gS191nBPtSAV/uT1c/pPODGtCsqkWG+/MRDRs2YEwvh6j8A8kTAi66R0T0DOlqD2rKRQ3VzBkR6
	vztrjStqKZuihownj8tuPye8IORB8HHOpN0omzThoCfDopbqGwPKv49GOZQKFtTV2DcEVVOdcml
	6OFD6xXofmTttayjeePgjX3JOzPN3kiLrN5ZT8K0RmaUYAomMVVLP/vXYO+diZdYpD2wJxwhoN8
	352SSPE/Tl1D/cP297rN8BctOHDNzl1RcIMR+
X-Google-Smtp-Source: AGHT+IFxvl9xQWJenm01CS0uqYxAUHGrgGK1bQiEGWSHGb4P5dOovhuPkO4lYz8maBjfAl398CyBjA==
X-Received: by 2002:a17:907:c319:b0:ad2:595d:dd21 with SMTP id a640c23a62f3a-ad2595ddfcamr215965666b.60.1747056845126;
        Mon, 12 May 2025 06:34:05 -0700 (PDT)
Message-ID: <084a6583-a7c2-4f65-973f-4c403bb41263@suse.com>
Date: Mon, 12 May 2025 15:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] sbat: Add SBAT section to the Xen EFI binary
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: marmarek@invisiblethingslab.com, dpsmith@apertussolutions.com,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250512103942.173136-1-gerald.elder-vass@cloud.com>
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
In-Reply-To: <20250512103942.173136-1-gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 12:39, Gerald Elder-Vass wrote:
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -6,11 +6,19 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
>  $(obj)/%.o: $(src)/%.ihex FORCE
>  	$(call if_changed,objcopy_o_ihex)
>  
> +$(obj)/sbat.o: OBJCOPYFLAGS := -I binary -O elf64-x86-64 \
> +	--rename-section .data=.sbat,readonly,data,contents \
> +	--add-section .note.GNU-stack=/dev/null
> +$(obj)/sbat.o: $(src)/sbat.sbat FORCE
> +	$(call if_changed,objcopy)
> +
>  $(obj)/boot.init.o: $(obj)/buildid.o
>  
>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
>  $(addprefix $(obj)/,$(EFIOBJ-y) mbi2.init.o): CFLAGS_stack_boundary := $(cflags-stack-boundary)
>  
> +EFIOBJ-y += sbat.o
> +
>  obj-y := common-stub.o stub.o
>  obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
>  obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
> --- /dev/null
> +++ b/xen/arch/x86/efi/sbat.sbat
> @@ -0,0 +1 @@
> +sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -343,6 +343,8 @@ SECTIONS
>      *(.reloc)
>      __base_relocs_end = .;
>    }
> +
> +  .sbat (NOLOAD) : { *(.sbat) }

If NOLOAD really took effect, this placement would certainly be okay. Since
it doesn't (from all I know), I'm unsure though of putting this after .reloc.
Then again you don't have "alloc" in the renamed section's flags, so maybe
all is indeed fine as you have it.

Jan

