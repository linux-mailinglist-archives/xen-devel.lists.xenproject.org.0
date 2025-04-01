Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10954A77E52
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934548.1336222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzd4E-0005q3-SY; Tue, 01 Apr 2025 14:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934548.1336222; Tue, 01 Apr 2025 14:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzd4E-0005oW-Pi; Tue, 01 Apr 2025 14:58:18 +0000
Received: by outflank-mailman (input) for mailman id 934548;
 Tue, 01 Apr 2025 14:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzd4D-0005oA-Mj
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:58:17 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd52d2d0-0f09-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 16:58:15 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3996af42857so4481591f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 07:58:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6588dbsm14109392f8f.2.2025.04.01.07.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:58:14 -0700 (PDT)
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
X-Inumbo-ID: bd52d2d0-0f09-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743519495; x=1744124295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=moOEq0i4YR5eTPTCurPycpqYpNHfEuCTEUwN+p0a7Sg=;
        b=fWAUAx+AOC5Pagq3XDkBLd3OQgkgg7eyG+K/8yW42/rFwn9MXILPFVkP/HooI8Qk0b
         Kf7d+Nhhcv+wpBqOQoNnNWFP4cn2nsNGpiHokzwCD/F86a0TONcxtkLyvYt1bEMPlMlI
         SXolDDjRzeKNQKfrkhsH33JMjE0O7lTRmjX9meoQnecKGaLVFI1RRcyYY6nI1UBxe9GC
         cj4C2pwl/00VS0kJ+YREYONFkgCeZTzWfEJKNBBtZcoh195WBCCP27wyHQgeLtifVtlo
         fGavwhEc/LTTnHHgTkAIjO2KVMgVuS+MJpMe7LCsVL80B06ZbXj7BHze8migav30keiC
         vJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743519495; x=1744124295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moOEq0i4YR5eTPTCurPycpqYpNHfEuCTEUwN+p0a7Sg=;
        b=OSmOz7QuiE/sg79INPY62wSWpFYvysa5COSLRYa1X9YMSi72AWzrLFncM5wGdBrjIr
         B1K2JAER7oM6Krcc7ybPsuLvd0g+OH7ATQMxO5C8AqPsH90eenMFhYhBVLaw8B8bXxsR
         sIFG61imIqRvU50RdQbbMQuj196I7KLhEdeyy0hSrtQ+y+NmNpxh/oIrvIUbqOqwdhHv
         DrmZvKpjld6YPewPYyRqua/AxaACM2JbCnPy17I397LLlqnA5uq7B8VUlZLABVVQqhcw
         4+7Kjpb1/AuQqloVGcV41ZyuqmtgJEh/YnhhOzeVSGWwRH8DGuZYeIgZcTZDf2QI84B3
         Pzow==
X-Forwarded-Encrypted: i=1; AJvYcCU2M3Rc57ttfeqSWgj5Z2NxM2TypZrqA5QCioGyB6s5nCdrfzSH/asSqHLpq6e4k+3RcBG9Z1R3vWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoOo7r/JFPHCB3bAP1NpevoJP8fgVC4aMiw1PyQtobPo9OPgtr
	IKbsyoj55GtGFTaaP9l1YKGht9mkFtPwu0ukyoS3cWUVwVnHm6EhuvKtYsC48A==
X-Gm-Gg: ASbGncv6JoPzg3ZcUlt17KND5DNVvQhBAXy2jsrkUoSHWhYWIUVtJhbCp88Ov92ISJv
	QvGMeurlH2tSI6wnkGTxPWn498GIFL7HQY3MmcZRc1cNpAEXxmcglHxa+lUcu++IvJ1ee/4AT3/
	Iqb/cTi/8xQyrLRkC3IVH+jKo3HewIAGsjrNmgtHii8sQht4GTcv3or/zVQgCFi7M8rXobX2gr8
	AtFHxXMMVZ3D6mEh1kqMRGaz2S7BbVGnbVdV2fVnjjfYfQEiFTVMc6DmYRpXON7M3rg0WAFpIjC
	MarNWsjI9LG5x9JJuoVG05Yw+WcDZApEN9pUd4CszRvEEKw/OIfIdHTDNaW9CQMjbD9KjBBSMfX
	AoxiARTWEMdmDJESnFudIJVyvaSl7xQ==
X-Google-Smtp-Source: AGHT+IFnuSLWTwb9vDaRPkWHPhKTD6e0YcTBUlh7wz8Dy6A6tB6WKCasweujTtIRiT4fiLlm6pKAJg==
X-Received: by 2002:a5d:584c:0:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39c27ee611bmr339646f8f.11.1743519494967;
        Tue, 01 Apr 2025 07:58:14 -0700 (PDT)
Message-ID: <5a314d13-fad7-4448-b629-bd7d614a09a8@suse.com>
Date: Tue, 1 Apr 2025 16:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arch: Simplify $(TARGET)-syms rule
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250401144703.961836-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250401144703.961836-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 16:47, Andrew Cooper wrote:
> In all cases, "-T $(obj)/xen.lds" can be factored out by appending to
> XEN_LDFLAGS.  This takes the $(LD) commands from multi-line to single-line.
> 
> x86 uses $(build_id_linker) for all links, so factor that out too.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/arm/Makefile
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -138,21 +138,19 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
>  
>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>  
> +$(TARGET)-syms: XEN_LDFLAGS += -T $(obj)/xen.lds $(build_id_linker)
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> +	$(LD) $(XEN_LDFLAGS) $< $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>  	$(NM) -pa --format=sysv $(dot-target).0 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>  		> $(dot-target).0.S
>  	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -	    $(dot-target).0.o -o $(dot-target).1
> +	$(LD) $(XEN_LDFLAGS) $< $(dot-target).0.o -o $(dot-target).1
>  	$(NM) -pa --format=sysv $(dot-target).1 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
>  		> $(dot-target).1.S
>  	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -	    $(orphan-handling-y) $(dot-target).1.o -o $@
> +	$(LD) $(XEN_LDFLAGS) $< $(orphan-handling-y) $(dot-target).1.o -o $@
>  	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map

... any reason not to do the same for xen.efi's EFI_LDFLAGS and its
-T $(obj)/efi.lds? I'd really like to keep the two rules as closely in sync
as possible, to make it a little easier to eventually split them into a chain
of smaller rules.

Jan

