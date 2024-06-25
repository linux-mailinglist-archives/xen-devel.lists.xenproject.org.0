Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D75916AE5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 16:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747859.1155369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7Qa-0003RE-4X; Tue, 25 Jun 2024 14:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747859.1155369; Tue, 25 Jun 2024 14:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7Qa-0003O4-13; Tue, 25 Jun 2024 14:45:48 +0000
Received: by outflank-mailman (input) for mailman id 747859;
 Tue, 25 Jun 2024 14:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM7QY-0003Ny-FE
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:45:46 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ececca-3301-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 16:45:45 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so64461721fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:45:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819a622f0sm8808593a91.8.2024.06.25.07.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:45:43 -0700 (PDT)
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
X-Inumbo-ID: 99ececca-3301-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719326744; x=1719931544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bDWoPZlQxmFrvHpt7YkCMFurjcft02gNTsFmOVmQ+nw=;
        b=UeXR2bm1QMndE0mvjQWIAg92zkhQ/j8Bx99j5valjsVmqLMO7kgze2whHaR20gXENt
         bEg9sgwatnmOBJR2dRiG8iOZIEPyprkF6GBHTpdemZTZDvqe8fA9qWN2PmZTZeZVdgcm
         4zlvXZKTWKNEVotIJMNR840Qgd1lwpa5dBgaRKj3DW62WLciWPiiAKS+CRWlr+bdL+3l
         aYtAFvSxrO9wVBY4NJgPkJRLHd3xVzpB1OocsujFXFhIDDSDh2Z2z4ezKCn3i8eON8Jg
         c9qF/Ijz3/F2m7TfcATukOSRY8bhJVcmb86PhWGGGFwnF7cU8a121PSsDl87LjLCJeVx
         4dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719326744; x=1719931544;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDWoPZlQxmFrvHpt7YkCMFurjcft02gNTsFmOVmQ+nw=;
        b=qamExB9pwLj+BTrKb/5nGdVlDTwa3eUzRJoyAlscLh9WhfP6rf1s1A4HgNgkGxEkg3
         H4q9CftZxZJdAgLvxL8/PweYHWxJNM5cEDfo2pV5WaI+Zj/aJ2uLs0v3yj2d7aeWWjMo
         +RpAGZe4qy7m+zdXE6DajRJxwyJNhOTGGqvfNIoPqhh3WPz9MsVA+RSB7lQ6eEg2jH/V
         gnUu4z0YskaFlh8R5atkF9Zp5oR0fTB9x63luf2y97nC/r8YiKB2QT2TZ02wvM51eMLM
         olz9rCiGTNxgjFqrmilL9qDVuMQKSYiF35YENYbpTiEAf6rw2iFpx/5cDb9WixtkocRt
         kbZw==
X-Forwarded-Encrypted: i=1; AJvYcCUAq+X7DV4qIndTDRdfjW/e83KuuI57ffSM9H3/k3VqdVDeO5fubnsHW+80RSdPlalF0fKwzNAAC6nezqb/1gdS8b3JsNDDSkAnOrfjKck=
X-Gm-Message-State: AOJu0Ywo8dx2/7KmBAoJsnobSAnVY9Xvi/4U6/yY60x119xVwHCyhOH+
	Z1TdB+ZR+YLssNOkQDkntUWhKYCOMXotyfMhc8p7Tj+S2kcLEDZjpxguqUpiNQ==
X-Google-Smtp-Source: AGHT+IEhkiGAbrctLw046GlK2bH4EE+v86d1kOd1UCNtcpG1EVEdS+sNMMIzk1ryKY2wMzPnce/GlA==
X-Received: by 2002:a2e:9090:0:b0:2ec:5621:b9f2 with SMTP id 38308e7fff4ca-2ec5936fb3amr62825101fa.41.1719326743736;
        Tue, 25 Jun 2024 07:45:43 -0700 (PDT)
Message-ID: <8be2c7c0-0aa0-44e0-b3d3-d422fecc29b6@suse.com>
Date: Tue, 25 Jun 2024 16:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/10] xen/riscv: change .insn to .byte in cpu_relax()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <b5ccb3850cbfc0c84d2feea35a971351395fa974.1719319093.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b5ccb3850cbfc0c84d2feea35a971351395fa974.1719319093.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 15:51, Oleksii Kurochko wrote:
> The .insn directive appears to check that the byte pattern is a known
> extension, where .4byte doesn't.

Support for specifying "raw" insns was added only in 2.38. Moving away
from .insn has other downsides (which may or may not matter here, but
that would want discussing). But: Do we really need to move away? Can't
you use .insn with operands that the older gas supports, e.g.

	.insn r MISC_MEM, 0, 0, x0, x0, x16

? I'm sorry, the oldest RISC-V gas I have to hand is 2.39, so I couldn't
double check that 2.35 would grok this. From checking sources it should,
though.

> The following compilation error occurs:
>   ./arch/riscv/include/asm/processor.h: Assembler messages:
>   ./arch/riscv/include/asm/processor.h:70: Error: unrecognized opcode `0x0100000F'
> In case of the following Binutils:
>   $ riscv64-linux-gnu-as --version
>   GNU assembler (GNU Binutils for Debian) 2.35.2

In patch 6 you say 2.39. Why is 2.35.2 suddenly becoming of interest?

> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -67,7 +67,7 @@ static inline void cpu_relax(void)
>      __asm__ __volatile__ ( "pause" );
>  #else
>      /* Encoding of the pause instruction */
> -    __asm__ __volatile__ ( ".insn 0x0100000F" );
> +    __asm__ __volatile__ ( ".byte 0x0100000F" );
>  #endif

In the description you (correctly) say .4byte; why is it .byte here?
Does this build at all?

Jan

