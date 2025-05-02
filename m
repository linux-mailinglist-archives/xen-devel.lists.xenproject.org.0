Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3BAAA6B33
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 09:02:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974412.1362278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAkOT-0003gl-LS; Fri, 02 May 2025 07:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974412.1362278; Fri, 02 May 2025 07:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAkOT-0003f6-Hl; Fri, 02 May 2025 07:01:09 +0000
Received: by outflank-mailman (input) for mailman id 974412;
 Fri, 02 May 2025 07:01:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uAkOS-0003f0-9C
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 07:01:08 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 359bc21c-2723-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 09:01:02 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac289147833so295745366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 00:01:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891478fasm3433066b.26.2025.05.02.00.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 00:01:01 -0700 (PDT)
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
X-Inumbo-ID: 359bc21c-2723-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746169262; x=1746774062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fD+eqqXFcd8Femsme1dRMBRh8s1RquYYCBYeuPeNev4=;
        b=CB3CCNRmCIzXQi2vm54yKaXExdX1tzM7LwsZhtORR8X9CBjBPAIA3HNOFSOypwPRuv
         8EkvGs4+/ag7TqpOgyqapJUWRJsL+skGiplmI/jacwl0hxeU+1YKkCFeSEUkmfjQM3Xm
         Km6k1QlrrjLZvc5qP3logpd898xboyMCaQrlY+EnQjSQzftHlouk8yXcKLybOm8nlCBA
         xhOx5sAQpkY1zeVpbKmvF8sbOlOyGNT7jCtRAGrmpuLEIzrUXmoZco20xUwOUTTmcpow
         TWGExBx3N0tsUJcW+m9QKZqNiKto1uVRmOQz5i4u4mVeX6L6pW205WbEMxTIPKHo/Nwi
         YG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169262; x=1746774062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD+eqqXFcd8Femsme1dRMBRh8s1RquYYCBYeuPeNev4=;
        b=XyDgzGBY9d6i8nunH1RHRuAiuKOEyvgD3Jd9W3B7BiuJn6xN0HbLojBg+8/6tBuFqZ
         9CJkSFKvnAIqqQVDvSv1VAa0hvkqw4AwiWFCReVHei5J5tKdcGNbHTyllETnVgqDo81H
         a15sKocQMylYbQLwcka0CgsCSn7/3Gr0A5ItBUYlB0yLYnWTC5Y6jJSjinNAAGPk4EM3
         n/wAs4F1SEbgsCiI+GUtbyVo1rowqj7fhPd7bI8cthq3avcemvAbe2ZSDId3POTI0j9s
         dY4tZV2i3q2J5WT1gsJs15KXQgWVsv1nwjBGLmK43+oo/wXZHvbtp97DQB42qerk2eWi
         J+jA==
X-Forwarded-Encrypted: i=1; AJvYcCUZMZ2pxT2V4ASFSMYTSdzvsPREetvmtqc/VTyDpJ/c3vRLdZo45+cvGwcGa21cjx+XGrH5jpy6ZmQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYgRP7ZHDULsZb1+oHsFPM8zWnNvrUqgsJMdsaY1Ccs0dtXkp7
	XRXxON8MKc1ZC98gXiFR5LLt8SEovZRIkz9H3oLwKGprhAEnUe6m/IBU11OHpg==
X-Gm-Gg: ASbGncuXORiYFbG64pRT1q8er+5bgstzTp8UE5/Kh2VzT2LSczosXwuxv00SYV9WSEX
	FzXbN5Q/40yRPB3c+5PPwShvXzlY5bCu+mZ4wtydbaLbulOqynzx78m2PJroUEdny5b5XQk9uTs
	P1CjEnUN+ztzUghL6iedFK65w5EhdETWrgyVy/3oci2YfAzog8VbVVPdp2VCzahZWzo3wK/Lzs2
	+fpuAuTZEN81NimgBdWCVxXW5PWCI0wIuxLZTYUseXG5iBbG7myQ1sO4FS40iUbSAANTCndfaJI
	wloZSeQflQzw47/7su0qm2RJg7vEEJikZmrHGoStetuDXt8DohMcBXpXcXFPkbIkH2ktNUIlX4a
	TbWaF3xkBfPiNr0KfjY5nNMQang==
X-Google-Smtp-Source: AGHT+IGq4Y5tLHW3S1pWvjbWxoD7t/BudmkBGcj0rS5oHu9h2E/rpzaSTjQ87f2Hu+52WcQpyZSyZg==
X-Received: by 2002:a17:906:4fd0:b0:ac6:d0f6:c85c with SMTP id a640c23a62f3a-ad17ad463c9mr189103566b.20.1746169262243;
        Fri, 02 May 2025 00:01:02 -0700 (PDT)
Message-ID: <7fa7780d-4dfb-4e87-b65c-c9ce86ad7e67@suse.com>
Date: Fri, 2 May 2025 09:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] sbat: Add SBAT section to the Xen EFI binary
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20250501122322.230599-1-gerald.elder-vass@cloud.com>
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
In-Reply-To: <20250501122322.230599-1-gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.05.2025 14:23, Gerald Elder-Vass wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -58,6 +58,7 @@ obj-y += percpu.o
>  obj-y += physdev.o
>  obj-$(CONFIG_COMPAT) += x86_64/physdev.o
>  obj-y += psr.o
> +obj-y += sbat.o
>  obj-y += setup.o
>  obj-y += shutdown.o
>  obj-y += smp.o

This being x86-specific here without there really being anything x86-specific
about it - what about Arm?

It being EFI-specific, why put it here rather than in x86/efi/ (and/or, as
per above, in common/efi/, at least for the source file)?

> @@ -277,6 +278,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
>  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
>  	$(call if_changed_dep,cpp_lds_S)
>  
> +$(obj)/sbat.o: $(src)/sbat.csv
> +	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents $< $@

While it may seem unlikely now, both rule and dependencies may change going
forward. So perhaps better to use the if_changed_deps model right away?
Which of course will raise a source file naming question: We can't really
assume a .csv -> .o rule to be generically applicable. Therefore maybe the
source file extension would better be something less generic, like .sbat.

Jan

