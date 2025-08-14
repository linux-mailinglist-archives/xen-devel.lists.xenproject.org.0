Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FCFB26A89
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 17:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081923.1441879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZby-0007jF-SH; Thu, 14 Aug 2025 15:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081923.1441879; Thu, 14 Aug 2025 15:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZby-0007ha-PA; Thu, 14 Aug 2025 15:11:26 +0000
Received: by outflank-mailman (input) for mailman id 1081923;
 Thu, 14 Aug 2025 15:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umZbw-0007g5-SC
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 15:11:24 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1040618-7920-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 17:11:23 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so158031866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 08:11:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3361sm2606439366b.39.2025.08.14.08.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:11:23 -0700 (PDT)
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
X-Inumbo-ID: f1040618-7920-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755184283; x=1755789083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XiqG6syEu5NE5DSo6tHfHj4RGng8dGnnAbVSapbdEB4=;
        b=gadKEO/t4wGoIn1NTFTvq4ClSTfR9jOG3QhuLotk6iZlVdMBgm7NQHkwG0PPMVK9Rw
         tkT6J5wK1ZqhiwpHsNQIoeyxlNum+LvKn30BOzNJU38ZKUjidK802msfgeow+DirVe4a
         xi9nnJYsUVToUgJOX4YZvTal3clyN/TUCx1LHreVpEbNcCtHKBOCB9TiAhhfnCNtedIH
         zXy8ejH8AFOUNTk6jmXOWi8Jmw+QUcv1dAKBdf5oxtT6Yi3Fcw/tcE7DDGtwBM827ssQ
         +Na9w3WYmSMpKuw0VyFJk5ibgsybP23xpE2sesguMJwibZksCgk0S5tSbv5dhou2b65v
         rZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184283; x=1755789083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiqG6syEu5NE5DSo6tHfHj4RGng8dGnnAbVSapbdEB4=;
        b=sw1hX7lJvDNKl+2J374BgDII0c0PBbGS69hqHF01c4uCzOh7k+FHdVixvXnW9BArHE
         30uSuzqk2uupZeuw2iaC7WpjqJ8UtQ/6yo4I7AEHvn367NHzE66NyhO6Sy0Yo42E8pSF
         CeDrPbTnVUT9LrIiQ9r9KlsLj8hmzQbnUtyeHxi9/wIb+QX4CaFKFoWs3Re3KnGTQc66
         NC/TvlRrRedrLpm/E1K9jt01Xjh3jJw4sxqabCfOxWTYEmOm8i0DdQwUXpqXrI3oP3cI
         NPUPsKjlyoV4J+BwdRUN6m/2U79Lj0X1/BcMY+s3PiphrsXRBq7I2S/9QJ5BO7ifFuYm
         +92g==
X-Forwarded-Encrypted: i=1; AJvYcCUphlt7NWb5vUu2dhhFeTad818X0SmL4zMesreb1mMS8vNsQfr2KFjz/FTjfIxNGf2XwgTfK1R5RF8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz105RlJVS/7DWtXfeP+063Nxlqty4k1iZr/mao03e7aOTr2jES
	ooXpvFUnkSpypLgacMwkn1bfLk3dcK0u3PV6N4thiR4TxfMB/CQ9fxm5yL/kpnbxYA==
X-Gm-Gg: ASbGncslNPJSmcUdHCoTBVOTAcrFXQC7p3KicRhb5GDTyiB7jALzOoxYuSdxxUAijIK
	YsiXGfDyO41Rhxa+9KBxk0sN7q1v1sPkZ2FAS5jWV39qvZdEZtC/4FNJ3XJ+mAv6/dyw616ouSo
	C98qjrZ1zu52zvHNr5Wyzg1YDTb6ThooIsqIs7G5sLXg1YLn+VcooG9DvZ/P6qEm1SIyxzYr4cz
	q0uIZDkSaH5J1EMRH+kipRrr6au1Kv0zMfgOxsdOhnTfdcimudUPdHPYxnXpjv/5SgsU4JqJBRz
	l20JgGgGlJBPrglzL8Robxm6BxI6hFBh6ZcINAqbnqcAda2lJZlUZDpOfY4UEd8NhReu/aIS1iL
	B+q77JUCu50c8HgHXIqGCjVZEDJhX6nJmYyIcL41Lh2Vo5Z4MgfXePYembvIz/XLqCKnQVyrg83
	jZde3HQj1p3+97JCx4Lw==
X-Google-Smtp-Source: AGHT+IFAeKDXK1MTeOP5PSI13Ck7/CoAEBsnTVZhp+TZnNmHVGjpHFaw6jMGkKF0N2yqJDjgrpFAmA==
X-Received: by 2002:a17:906:c147:b0:add:fe17:e970 with SMTP id a640c23a62f3a-afcb9398153mr321231866b.14.1755184283302;
        Thu, 14 Aug 2025 08:11:23 -0700 (PDT)
Message-ID: <5ad64534-514c-412a-b2a2-23adaf835f60@suse.com>
Date: Thu, 14 Aug 2025 17:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] x86/boot: Use RSTORSSP to establish SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-20-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-20-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> Under FRED, SETSSBSY is unavailable, and we want to be setting up FRED prior
> to setting up shadow stacks.  As we still need Supervisor Tokens in IDT mode,
> we need mode-specific logic to establish SSP.
> 
> In FRED mode, write a Restore Token, RSTORSSP it, and discard the resulting
> Previous-SSP token.
> 
> No change outside of FRED mode.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Why is it that in patch 17 you could use identical code, but here you can't?

> @@ -912,10 +913,30 @@ static void __init noreturn reinit_bsp_stack(void)
>  
>      if ( cpu_has_xen_shstk )
>      {
> -        wrmsrl(MSR_PL0_SSP,
> -               (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);

Does this removal perhaps belong elsewhere, especially with "No change
outside of FRED mode" in the description?

Jan

