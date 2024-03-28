Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE4890622
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699134.1091735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsue-0003lK-0d; Thu, 28 Mar 2024 16:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699134.1091735; Thu, 28 Mar 2024 16:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsud-0003jI-UJ; Thu, 28 Mar 2024 16:47:35 +0000
Received: by outflank-mailman (input) for mailman id 699134;
 Thu, 28 Mar 2024 16:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpsuc-0003j9-DC
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 16:47:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id def5b1af-ed22-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 17:47:32 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-515c198e835so1338355e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 09:47:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g20-20020aa7c594000000b0056be0d1cd83sm1001487edq.97.2024.03.28.09.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 09:47:31 -0700 (PDT)
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
X-Inumbo-ID: def5b1af-ed22-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711644451; x=1712249251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NUSGp53zXS39twOaD8q2rRDIA05UIMipu8a42ZE1VMM=;
        b=HNm4UZdABEBOiaG1sjqrxmt9qTI40fLf+uhUem8YARzE7KNnDruiBkP07wgmLBLR7f
         z5Jo7oV8TZCWomWYJdn/9Ww2HFbuK/CbGYAgkKKlQKEUrTi1oRygAmycLmTpXOxblKHM
         NFhqfqX7h7c6SXGH0do04pT97D2lOUZtZche5i3KVjVVYjTji61ewJclj4ouY5g0Gg+V
         WfkAue54ZhCKoUmUm1DVQ7tOQR13Ocvisc1MFlsddPGYnrc+BjCWJoSefrjG0ksbu3rh
         Q0ndTLK8WFzPBkqw1QhFJM7XrqNFnh07s6ttuv3Dfq8qz1uN4AhRO0XtKPWMxG56LNuc
         wWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711644451; x=1712249251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUSGp53zXS39twOaD8q2rRDIA05UIMipu8a42ZE1VMM=;
        b=HHdM5KyHhZFNyRNkeRpNUNOW3j6OI6Yumms1QaplCCC8GwD83cNiHjQTLtWua6pLbZ
         G+IxxU+Jl8aXOtflLuZ0qPemg9fEMwbon4RnszIXc9+kk2fGp3V3a07HgwwX5FEimiUM
         VocfPiEON7ZHO/PvkWG865vaNvorz4oMT1G/jKcu2fpb/krvQ4j2rQ38jiBd2XBk1MaR
         9S4J3NFnjtIcfTsM2trd3kgD4TBcK++e03YG5Ae6yU1amPqY+CWqB5k1eIxoN4Kdkupl
         irazxV8chW7n67rfxLOJIPSYXZSBsJ7pilTqil90TJ9wB3Fu9FhkmkglkhqPQ9J8RsSh
         ytxA==
X-Forwarded-Encrypted: i=1; AJvYcCVWlZt/ZSEcEsWFs2CuQnsO0qjCod0g+hu/+ZnsSpwFC2lTU+6dENGl9CRLEiXEIkh7VC8pFIZg9/qzfJXwkipnNaN74WRdcEm4NyqPEvE=
X-Gm-Message-State: AOJu0Yzh0UGjodG6x9dkAqqKn2wiJfXxgPIxgliapIt/ztOo5c5l39Qu
	C2nljXaT8xxeydVkEl37BG/jxRGHWIPicsWX6U0xAowEihfMcy9UQaoKsJMWpQ==
X-Google-Smtp-Source: AGHT+IExHL+oouEiy81wXQ5PnTIbAhvsq/MsNh7tI21p2SS1p+Owbw6bCD21OJ2pn1jWrZ88i7ymlg==
X-Received: by 2002:a19:9117:0:b0:515:9abe:67c0 with SMTP id t23-20020a199117000000b005159abe67c0mr2212511lfd.58.1711644451634;
        Thu, 28 Mar 2024 09:47:31 -0700 (PDT)
Message-ID: <f2297a46-4d19-4b98-b986-e05ac9f7a2c5@suse.com>
Date: Thu, 28 Mar 2024 17:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] libelf: Store maximum PHDR p_align
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-4-jason.andryuk@amd.com>
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
In-Reply-To: <20240327215102.136001-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 22:51, Jason Andryuk wrote:
> --- a/xen/common/libelf/libelf-loader.c
> +++ b/xen/common/libelf/libelf-loader.c
> @@ -468,6 +468,7 @@ void elf_parse_binary(struct elf_binary *elf)
>  {
>      ELF_HANDLE_DECL(elf_phdr) phdr;
>      uint64_t low = -1, high = 0, paddr, memsz;
> +    uint64_t max_align = 0, palign;
>      unsigned i, count;
>  
>      count = elf_phdr_count(elf);
> @@ -481,17 +482,23 @@ void elf_parse_binary(struct elf_binary *elf)
>              continue;
>          paddr = elf_uval(elf, phdr, p_paddr);
>          memsz = elf_uval(elf, phdr, p_memsz);
> -        elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
> -                paddr, memsz);
> +        palign = elf_uval(elf, phdr, p_align);
> +        elf_msg(elf,
> +                "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 " palign=%#" PRIx64 "\n",
> +                paddr, memsz, palign);
>          if ( low > paddr )
>              low = paddr;
>          if ( high < paddr + memsz )
>              high = paddr + memsz;
> +        if ( max_align < palign )
> +            max_align = palign;
>      }
>      elf->pstart = low;
>      elf->pend = high;
> -    elf_msg(elf, "ELF: memory: %#" PRIx64 " -> %#" PRIx64 "\n",
> -            elf->pstart, elf->pend);
> +    elf->palign = max_align;
> +    elf_msg(elf,
> +            "ELF: memory: %#" PRIx64 " -> %#" PRIx64 " align:%#" PRIx64 "\n",
> +            elf->pstart, elf->pend, elf->palign);
>  }

Hmm, it's just this final logging change which I'm a little concerned by:
Having looked at Linux'es phdr, I noticed that the addresses there aren't
necessarily matching the corresponding alignment. Therefore I'm a little
concerned that the output here might raise questions when people see
seemingly inconsistent values in the log. Could you/we at least make it
read like e.g. "align (max): ..."?

Jan

