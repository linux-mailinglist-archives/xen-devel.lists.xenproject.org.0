Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EB5B3A410
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099291.1453276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureP1-0001O5-Gj; Thu, 28 Aug 2025 15:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099291.1453276; Thu, 28 Aug 2025 15:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureP1-0001Ma-Dx; Thu, 28 Aug 2025 15:19:03 +0000
Received: by outflank-mailman (input) for mailman id 1099291;
 Thu, 28 Aug 2025 15:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ureP0-0000NU-0T
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:19:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 536dc354-8422-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:19:01 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso192127066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:19:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe7fd59b00sm892289666b.106.2025.08.28.08.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 08:19:00 -0700 (PDT)
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
X-Inumbo-ID: 536dc354-8422-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756394341; x=1756999141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qSlBg9tSAzI4MLuXRtLQVNaynsbTN9TPBSCDAcWxyeA=;
        b=Y0AqK49tZ9F9n8C+kqCILaxg9GHba+JZb+5ayA0griPBQTUmG/IEvLOuHIckvRD6Bb
         M4JT62kMdyHm8aaWuYSJzaoG2TAsAfTQ3KU+l09+D+wzO7PWvyFUhvy10r+JRhyn84Bv
         8giHCqhuHRokJ45KI+br5J1CIJJTQPwBPQq/EObRSjd8bWCfLOQnYSPhV66Hwszun4z0
         2cH+3qQ6gBV1lMcBRo98QCB6Zk5NMJu5cEE6i7d5L41mGUDhY647eWCJju8EY/n///Ym
         6FNRUvlm9o8JXQXd/Fc1taP/tWDmYx07UfdaZYXSAgF7kXlXRC+dt4FYALd4T+ZAFx/t
         38YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756394341; x=1756999141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSlBg9tSAzI4MLuXRtLQVNaynsbTN9TPBSCDAcWxyeA=;
        b=QhuTMcjV4DWLBN8cFOfwymhq+eyTfevnbBuB+1+zJS2s32Bq7KLPTmgNUr2tvif3X5
         tGjHt5RhxYsRXOpcoEngzxA8TBwPxokRV2lph4ZdAhXflEOaa99kbTO/H536UWribvoa
         91BKAmmOulH4fEZXCZ1z+A3GqCXZtapwrILcoKQ7eJMeMuyNm1TsSqmVNe4cgfODaHs4
         aOIlCkTNXTXBifs/GoKFF16jEE4i9WZvJQgTGJ4EdZvZJf1vN5BwiVv2ZMsQk+5aPujY
         20F/07dDJN31gFCPdk3spMDQtjpx4H/4vTQrAcc+f7FXQjmQxxKNb9oqfnUyYOcYi/fa
         2X6A==
X-Forwarded-Encrypted: i=1; AJvYcCUxBLBVds8ftE+H2Tjcgsh88kJMKL/qLwC/lXf4SFbCL1Fpr5Lpc7S17GKt8NMB/s1UM5yeiQZeF0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0e2IQu22KzmnU+rtitU8VVfYA1vNJRScFqiR9NWOwY98Rsys0
	A3UVg9YhErL+36H8sYjjiw+HtBPfiYpGlgshXd8RmYhVaHCtRatwfKu6ds6SUm3TEw==
X-Gm-Gg: ASbGncvNDMXW2iba54K8H1tOHIpCDBQr7+SiSFosu7bWc/NGww4bkoQfxrgzuqLvffL
	Qru2KPEzo/2gYQtrSgehl7IZoZtTS00A5nuApHIDTkfapMlTLjUDXT83yLujPEF18V3GXULxvPE
	+hkJyMvfCDwwriliWDb2zSYgF9xxkQCdygoPKVjKO06ee+T8DBhYk+GilCJ0T9kR+0L7JTG/UxA
	+A/4FzINX1ecmR05IOQUGqsdD0iotuwsxaCKvablT/6v8H7k8rlqKm0oCbI2nERM2DozV7gxL0o
	88hNIwJ2faAM2W2YxdJ2zpMtWz5ZCSN1lLENpexWCoYgb+LPqZJydGTJNrazrLT6w+V4YxvG5gU
	weCMZk1XSPZLBb/Fw/8p+2aW4E+KVTsJn2KMPgKI50yf+VS/aapS7ln6H1S1lFCCKtCFiz8zgGC
	xOtFotcL4=
X-Google-Smtp-Source: AGHT+IEwBIUHtZzqcRLzpdI7f+mHOo9XnlyQfZFTDjjtNzfzCElMeN3yKcj0f1F/tkWx/9m5ovN4ww==
X-Received: by 2002:a17:907:3f0f:b0:af9:706d:1e3e with SMTP id a640c23a62f3a-afe294417b5mr2168342466b.2.1756394340678;
        Thu, 28 Aug 2025 08:19:00 -0700 (PDT)
Message-ID: <6752a3b5-f012-4bcf-9f04-b1c1accb6024@suse.com>
Date: Thu, 28 Aug 2025 17:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] x86/traps: Extend struct cpu_user_regs/cpu_info
 with FRED fields
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> The FRED on-stack format is larger than the IDT format, but is by and large
> compatible.  FRED reuses space above cs and ss for extra metadata, some of
> which is purely informational, and some of which causes additional effects in
> ERET{U,S}.
> 
> Follow Linux's choice of naming for fred_{c,s}s structures, to make it very
> clear at the point of use that it's dependent on FRED.
> 
> There is also the event data field and reserved fields, but we cannot include
> these in struct cpu_user_regs without reintroducing OoB structure accesses in
> the non-FRED case.  See commit 6065a05adf15 ("x86/traps: 'Fix' safety of
> read_registers() in #DF path"). for more details.
> 
> Instead, use a new struct fred_info and position it suitably in struct
> cpu_info.  This boundary will be loaded into MSR_FRED_RSP_SL0, and must be
> 64-byte aligned.
> 
> This does add 16 bytes back into struct cpu_info, undoing the saving we made
> by dropping the vm86 data segment selectors.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


