Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B58984B2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 12:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700781.1094444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsK09-0008VF-MH; Thu, 04 Apr 2024 10:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700781.1094444; Thu, 04 Apr 2024 10:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsK09-0008TM-Jf; Thu, 04 Apr 2024 10:07:21 +0000
Received: by outflank-mailman (input) for mailman id 700781;
 Thu, 04 Apr 2024 10:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsK08-0008TG-6K
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 10:07:20 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d698517-f26b-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 12:07:18 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4e60a64abcso322263866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 03:07:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u8-20020a170906b10800b00a473774b027sm8805075ejy.207.2024.04.04.03.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 03:07:15 -0700 (PDT)
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
X-Inumbo-ID: 1d698517-f26b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712225236; x=1712830036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTyQGhChjhHGamMVwINvFE9t6PWt490PDvkX3lKLNIM=;
        b=Bqyee7tOyspXz7gMnmCynLSfCBUy8NmL3SUjADD0vTByvDrZt302JZU6jDaCUImbw6
         PCwVDVmf78T+oIs1lD+j9gWEDgb9IdBCqjXdU/DiRIsluR9PKSXQroVCqENpEEFNDSYI
         aJKfJ3uQ5plGRaaYuUOeGFj3mwsvpNlY8F3RbQa1MhhDmB67VX8V2QO/E8abQHeBuE05
         auSLsz5UE6hcfW0NofLPnDRjvsYNuzf3DMoDRbDnmyv3sYSV40jdeU2V458+h0utS9Y/
         78efb7Yv83MzbM5jiboKaSSIEMo6RaOBfFQT1MBYr0dUtUpWqP9XN6tG4P6XlSv3Ea67
         ujag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712225236; x=1712830036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTyQGhChjhHGamMVwINvFE9t6PWt490PDvkX3lKLNIM=;
        b=OfBDIhgq3H/caXW2BOkQoSVkJuQrv33IJIyH/h6TGvNye4+N1718O7JhVCIZShItBs
         wRb9QSdIZMPZAdzak93Y/VIQcRiglSyYIy3S6/nQYeDoCQqLq2VhFljrIj+7rsw7s+XR
         l+TXfLfMjDkN7pZxJi/Fn+k/AJSU/8tietzafw57kOlvpBmbmDgJBOySUoRQwbmlznCd
         SB0IhpPbdCPLPNPNHB3OShd2I+hVWta4L6rxtgSz6D4kft/7k+QHwB+CKSqmSIssuLiF
         0udQXSajw/zMIbWx0cIFN47XyhqsIbIfOspFaRbQ7ozSGc+V0tiMs9H+DZnQiRIdGuZm
         sGJA==
X-Forwarded-Encrypted: i=1; AJvYcCVHgn9ujkk1SLts/6yQRTRDrF84M45EzdUt2NXIycAu1nLtKvj0EhWeKUVig09zTtS9GBqw01drQuqyAsBH8TKPVVEAdr3X3FZMP1O8V8w=
X-Gm-Message-State: AOJu0YwOopY9dQPErtOiRrJvKulfRfcqdNH2gluQP+8l+jsxDoNReTP5
	Hefm+JMf//le8b9DWVBwmu1Mzu/bIwuiRCrDfh1w0CTYA56g0S+01Dm6xOe/iQ==
X-Google-Smtp-Source: AGHT+IH6+Ivy9sVh8N8vV+HxfECCvYIVZMTTnT5YYzxsoFbDgHseXXnsXS9r7Db3U2YUtRB5j/8HSg==
X-Received: by 2002:a17:906:bc95:b0:a4e:5a1a:9077 with SMTP id lv21-20020a170906bc9500b00a4e5a1a9077mr1868253ejb.16.1712225235960;
        Thu, 04 Apr 2024 03:07:15 -0700 (PDT)
Message-ID: <bda70742-04b7-4bab-8cdd-6b5a3d45dc3c@suse.com>
Date: Thu, 4 Apr 2024 12:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/19] xen/riscv: introduce extenstion support check by
 compiler
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:19, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -3,16 +3,27 @@
>  
>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
> -CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
> +riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
> +riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>  
>  riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>  riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>  
> +riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
> +
> +zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)

While committing another question popped up: Why "" (i.e. no insn) here, ...

> +zihintpause := $(call as-insn,\
> +               $(CC) $(riscv-generic-flags)_zihintpause,"pause",_zihintpause)

... but "pause" here?

Jan

