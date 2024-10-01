Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B334498C213
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808325.1220240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svfCs-0004hd-GZ; Tue, 01 Oct 2024 15:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808325.1220240; Tue, 01 Oct 2024 15:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svfCs-0004ej-Cd; Tue, 01 Oct 2024 15:54:34 +0000
Received: by outflank-mailman (input) for mailman id 808325;
 Tue, 01 Oct 2024 15:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svfCq-0004ed-Sf
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:54:32 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7297235f-800d-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:54:31 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a98f6f777f1so15596366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:54:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775c2dsm731582166b.38.2024.10.01.08.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:54:31 -0700 (PDT)
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
X-Inumbo-ID: 7297235f-800d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727798071; x=1728402871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=drE2WmsZrTEqp5q6o0pgSzRjvGJLyPArM1st1iYNJOo=;
        b=cvznw9xA8pDbmUxxBYaS+bEdYsqxCTYWkyQJo/EyJNR2HnoQt26KasOhrRBv14Xh7/
         99GhLq9WxnFxdtYKLDHCDvCrn3ElBmNPbJGgUnLy/sgUikaECPTjHTZ7dHQQMz2cvz79
         XB89QlkLdZbP+eHP5NpxfR2hIJTFGJobuxGb9wL8tSfJ5llo877Ji0SnXExM11Ga0C3k
         sBb3gUQexx9Of4MTUxRII4ER679YT7M3TNLsXokZ/8MQ9DHu3Opa9toDZQ3hyRfGEPpK
         uYFvehsMN9n5e+XZkwGXW0iC/vfmmy7lexmfI6LDpI0iB1CwLpxYhpHCFWlbB1nI7gBu
         wgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798071; x=1728402871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drE2WmsZrTEqp5q6o0pgSzRjvGJLyPArM1st1iYNJOo=;
        b=J5umTryjoNK+RZA5rE9Vem44mA+R/LyMf4E2vSc/KanfAMg8pVObjbG+AJFt2uzKuQ
         cJBrrsNu/xW0qO5xzfNhHWAEkpNylNIa5kPYSZef98yHrYwOZpDqYpbQfq4M0UgvAqgJ
         GgftZBAjSIelYGTUQZYkigTv3cB/J5d6x4kh+SnSs7pwSsugxSm+eIUqiAGmeZFjT9jc
         RBmxGLANpNBDy9gDtrjtifzFy/1dS27sgrI4m/qbmMnx3MbJyjR69l7goJuFW6QkmQ0J
         0AXteGG32BufxYXnIafJXNBhmIkMezsUC6aXdjcfQpcNDeZeM13XyK2x8U449RuTfwH2
         2mgw==
X-Forwarded-Encrypted: i=1; AJvYcCVMvyXYMcMCPYZoM4CgZgoKvGCM8JTDmMUcrgvuWlBc15nwnpc258lPneh6OmFaYev6I78Ld/b6Kqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywrw85dAN56bz1KvRWf1j9fyPku81DHJsUb6ABoqAtslGHVN0E7
	3mYk/IwHrdZKEciGWPdEYWRbeldmMt/ba30AbrVbSf8oQ/DiNvPdxtBwakO4ZQ==
X-Google-Smtp-Source: AGHT+IE2w36jxuIUA0eucIryh8EK2sAAp0GA/DBo/07YFX4E4Bc30fHvhmySzkz0j4GOuiW2/261zw==
X-Received: by 2002:a17:907:745:b0:a91:1592:f5cf with SMTP id a640c23a62f3a-a98f8225973mr4553066b.15.1727798071314;
        Tue, 01 Oct 2024 08:54:31 -0700 (PDT)
Message-ID: <18cfcda5-d2b4-47d6-9f5e-a240e46661c1@suse.com>
Date: Tue, 1 Oct 2024 17:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen/riscv: initialize bootinfo from dtb
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727708956.git.oleksii.kurochko@gmail.com>
 <f04a3cc3e543298f63845728c599410258a336ca.1727708956.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f04a3cc3e543298f63845728c599410258a336ca.1727708956.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 17:13, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -28,6 +28,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>                                 paddr_t dtb_addr)
>  {
>      struct bootmodule *xen_bootmodule;
> +    size_t fdt_size;
>  
>      remove_identity_mapping();
>  
> @@ -54,6 +55,9 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      BUG_ON(!xen_bootmodule);
>  
> +    fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
> +    BUG_ON(!fdt_size);
> +
>      printk("All set up\n");
>  
>      machine_halt();

Looks plausible, and judging from Arm code there'll be an actual use of fdt_size
down the road. Or else I would have asked what use the local variable is. In
fact, again from looking at Arm code, I now question the need for the
xen_bootmodule local var - that has no further use in Arm, and hence that's
likely going to be the case for RISC-V, too.

However, may I ask that you limit the dependency trees in what you submit? This
series depends on another series, which in turn depends on yet something else,
all not yet committed. That's getting unwieldy, I'm afraid.

Jan

