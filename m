Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3DA10C64
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 17:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871549.1282532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXjtH-0003a2-2E; Tue, 14 Jan 2025 16:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871549.1282532; Tue, 14 Jan 2025 16:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXjtG-0003Y7-Vm; Tue, 14 Jan 2025 16:35:42 +0000
Received: by outflank-mailman (input) for mailman id 871549;
 Tue, 14 Jan 2025 16:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXjtF-0003Y1-8A
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 16:35:41 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 959ba7ca-d295-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 17:35:37 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so40005625e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 08:35:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03f49sm178365645e9.19.2025.01.14.08.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:35:36 -0800 (PST)
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
X-Inumbo-ID: 959ba7ca-d295-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736872537; x=1737477337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eLI6m1UyCV7Fxc+m0Jv39LxsjApB+SjT9xf81IjrwbI=;
        b=P4PJFS1BnOuUOuz+5fFTu2TYU2LPiw8Ktx0sGB5mpYX0a8QbqMk7gBCNW8zATn/Wpi
         CcwhZ8cZ3v9lwWX7B1u73kUnXuWtvjGOpWDAiG9Y/vHYK67PNVGgDlLLKvpDb5P7wxLN
         s8eemn3MTnZva7hvDgtnaKZCjT6my9T6l6Hqrplj/8H+r5I2LP2WSRGamj21VDOJjJgQ
         IbPKmtJ6m51kgaAcO5wsf+9kZdaSaxGPZmThtlLhSDC5nlil1DRImiQU/tIbyBKaXlhD
         i0anj3iJPnRVZRgvrMK20NOhcMGyAzi0aot/v4yUDz8ZNcjVR674d6ykJXyMTDzO6+fv
         nQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736872537; x=1737477337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLI6m1UyCV7Fxc+m0Jv39LxsjApB+SjT9xf81IjrwbI=;
        b=tX0LQjAOxLjH+nhDGzF/sUL/ZU4/Jgas9Aa+JDDPXx3e+H0q3EOtpHD8xKVX37AWYQ
         botGR1VTWTLYPeDQ84WDMgpROxmK3NIXyiyNPZ0b5Y1qNgWSbKlT1U1sNkmNUCjvWTwP
         3c8MN97tMd9CUaFDT9cFpk1iDLpj+4+LYiSarNZnuWfVfQotoIU6/YUE+nf3Cdm0Bnfc
         IeziC1Hj50OQZdi6TGDo+NvIDS2CjinFn8xdTkAOfVKNBaJLpdr1iEn76FuEVpdIRI6Y
         LfTs8qvDg5rMJn79ZQfjPQS2mgateAYRpksjMV9NsjCpzF5vqu/CDeuAhSKPJTkTdKDS
         1fLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGgjcJthP6fANHD9b+4IV43PKakfIRqn73femJSFE890Jw6EdeuHJz40MJtimCB8qBSyR6mlcK3QE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWnFYlbT8rzY78g4uAhBJNalIt7bWg80c3F7jCegCMzTxqsrBp
	i5PZysoJvnIK4p02Yhf1EYpHS2pWk2ovZJdvM5XCPzH8H2u2FXIVPEKb0A1QFQ==
X-Gm-Gg: ASbGncuuNeuuV0mdxvVjEl+WCTMahdIaxSkjzx0aMjlZFzk533/3L3t+O6ItpUFG3cY
	tnZUQaPKyswXbQOuQp+/MZ2gxb/WGzp+EkRBbuN3gGtgGusUtoHg1sYwM1j6MM64w4Woak2Q1wF
	qEbsSR4p0OTr5jmQkvwNllb0qJ6+ejlUitw70lmjIN8N/dmnIXwsW3OeEXwRy03aWeoNe2NE1cj
	UwYUwkDmT/mSGZZcsgAVm85H4pMd2LaM1RzEysz5qBKsFagpHRgsG/KkfH7/S7u8Z+or5bzBDQP
	pUiVbntCIo+dxPAR8DbLduXNOoYUgvZj5KMCTZD3VA==
X-Google-Smtp-Source: AGHT+IFWrEjVUgojsr4W9QTXEJ1E6lgio1O8cSKKVgOuYzWq+8dbeA+FOdkGxyqk2SF2cHBXDiT8hg==
X-Received: by 2002:a05:600c:354e:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-436e26a175cmr281915275e9.16.1736872536961;
        Tue, 14 Jan 2025 08:35:36 -0800 (PST)
Message-ID: <ca1bb9dc-a63f-4704-98bb-351f81aa6718@suse.com>
Date: Tue, 14 Jan 2025 17:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/10] x86: Add architectural LBR definitions
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-2-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-2-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -112,6 +112,8 @@
>  #define  MCU_OPT_CTRL_GDS_MIT_DIS           (_AC(1, ULL) <<  4)
>  #define  MCU_OPT_CTRL_GDS_MIT_LOCK          (_AC(1, ULL) <<  5)
>  
> +#define MSR_LER_INFO                        0x000001e0
> +
>  #define MSR_RTIT_OUTPUT_BASE                0x00000560
>  #define MSR_RTIT_OUTPUT_MASK                0x00000561
>  #define MSR_RTIT_CTL                        0x00000570
> @@ -193,6 +195,16 @@
>  #define MSR_UARCH_MISC_CTRL                 0x00001b01
>  #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
>  
> +/* Architectural LBR state MSRs */
> +#define MSR_LBR_INFO(n)                     (0x00001200 + (n))
> +#define MSR_LBR_CTL                         0x000014ce
> +#define  LBR_CTL_VALID                      _AC(0x7f000f, ULL)

While I can see that such a value may be useful at some point, I think it wants
introducing when needed and composing of definitions for the individual bits.

Jan

