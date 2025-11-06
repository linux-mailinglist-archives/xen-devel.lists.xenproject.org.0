Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3EC3989A
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 09:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156540.1485594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGv8X-0007vh-Nd; Thu, 06 Nov 2025 08:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156540.1485594; Thu, 06 Nov 2025 08:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGv8X-0007tl-Kz; Thu, 06 Nov 2025 08:14:29 +0000
Received: by outflank-mailman (input) for mailman id 1156540;
 Thu, 06 Nov 2025 08:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGv8W-0007tf-Ot
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 08:14:28 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c65f219-bae8-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 09:14:26 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b728a43e410so111959666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 00:14:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72896c3b6dsm151331966b.65.2025.11.06.00.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 00:14:25 -0800 (PST)
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
X-Inumbo-ID: 9c65f219-bae8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762416866; x=1763021666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cD9NbccOoXX2KeZ3wEd1+V0/gZs08Jq65CbAK1AlYVE=;
        b=CBvJzd2rTag/rT2UKHP3JqyJOjYJyBUql2ps8IZUqRjFZO3VBR1KlMBswgpA/6e0rP
         9ii8Pc81eIX5AYZNKX3GgoiLTX1U5csjTIr9SFGInyma610HMEkyJjqoUTu127MKFN7q
         pYhecu3FGWqN3FtZLSyU2oiVAFWJbbh0va9qCM0VNl3gCidVjPKN9jboWbM64PqWR2Iv
         xoqzkh2oJ19wmlOd5fYdIw6pM6WDrHlXcZEKDWz3dh7DCSBS30Q8E6f2Caj+mvXsZBDF
         e4ciQQY0Q7jy061KXZls09ltsNyMYd3Mhq1SLdoFfEaZojdJp2VPyZvy4g9p8NvLeL5N
         5Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762416866; x=1763021666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD9NbccOoXX2KeZ3wEd1+V0/gZs08Jq65CbAK1AlYVE=;
        b=Sc1+3BWvN2W7sSXrb8c8FiBwNoQvLt80HeahrvEJChF8+VId7JMmjGUCoemxfocGoe
         0JboGVAOs2N4cIAkyG8gjYao3B1p1yRH6IF2bFQB9Ad+NN3+W02WeqZchZpOXz3/y8y3
         MlV6BTMN/ZFwepxHyLByZnN+cBWYEPsHf3/XX2izD0qQv9ar7uf7Musgv4MNLBHi7g4M
         86nzEPoN1H/GP/Ir14s9pDf8cbvHUMP8HYG9G0jAiwIx9GvmLAK6Qi6NoQcbrSo1yVbY
         TWnsNm08bOBYtxLQaczwr0nOqciGXgD0FvUfRBsswqUU7eYJkbGJ++IN6EzowemxvZ1J
         PWvA==
X-Forwarded-Encrypted: i=1; AJvYcCVBic3Wq8hnxLmDIjO0xUHRhhTAIdEhprmFq/JsKvPibjdpk0B/cr2DO93cwC4fB3/5iBTM0FxjzQI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcqdI3e9vs4Y2lkVE4fXDyiJndcm/+gKnHUn1ouHrFa+Ec8yqS
	VDildSAZDG4BSht5qdYXxzzkZaO3dv0fNrRC/IndYh/OYQyHM7Spsc09yyK4CVtpZA==
X-Gm-Gg: ASbGncvQf4mpxrZ57JzL17YnR6rpRFNwZJep+w0l5eeo9ZJ/hMcs4tAT3dBlMYC0iyh
	4oQpEqFj2WN6gMBdvKmepTyP8mZV/E9rUiSgAyBi2GVh/UOQcqx/5zyeRIg2XuE/48Dx+3QWk8z
	oOW/dB/QfXMMpR34PBEyQ+7FfPSX+a2g4V68yNlGKoTCCHXPz7hwKiwd1wk0s95VZYKUbx2syS1
	3wqyV55/cI1BTRMotUTYJSGNV5qzijIk0lQQPUg6fnWiHdHmpFJeSsKoHHxa55sgeyK8HvCeGGC
	ecGNErDsP1+q1m9fQOmi19CMtdCvRNu4/Xnyw36I+T7LHoXTQKvM53P7EmSjzaPNy71OPdaEH1i
	OGeOFCm+159QUAJyGJTdhPKB7BBYK09WlpkeeITV51AGMrIG7AFzrI5tzPvc/PRWfEn7oyy8eYW
	/aiCzKvP+5qephJ1G6/b8mw7tR10EKbxGa8KwuBG4BCi4hJVbdxCYMKNHcGjXe53q5/BLuH9M=
X-Google-Smtp-Source: AGHT+IEu8ryeKBkW8025Qy6URAFALeTJqE/qvXT9jXbbp8UACBRYH9EhwwSdKrO/XfaUGsVC/BBZLw==
X-Received: by 2002:a17:907:868f:b0:b57:2d81:41f with SMTP id a640c23a62f3a-b72654e25acmr667786466b.40.1762416866142;
        Thu, 06 Nov 2025 00:14:26 -0800 (PST)
Message-ID: <2bfd6ba0-e793-4f19-a7c2-19ff5aee0fe0@suse.com>
Date: Thu, 6 Nov 2025 09:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 v2 2/3] x86/platform: Expose DTS sensors MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1761752801.git.teddy.astie@vates.tech>
 <1001287258cf9652c749c66c6565478085a8657c.1761752801.git.teddy.astie@vates.tech>
 <22e53531-73e4-40e9-a45e-2c5f59852ce4@suse.com>
 <ed81804d-16db-4fce-88b6-12dc165e73a0@vates.tech>
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
In-Reply-To: <ed81804d-16db-4fce-88b6-12dc165e73a0@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.11.2025 15:30, Teddy Astie wrote:
> Le 30/10/2025 à 14:54, Jan Beulich a écrit :
>> On 29.10.2025 16:59, Teddy Astie wrote:
>> I'd also like to note that unlike the two THERM_STATUS, MSR_TEMPERATURE_TARGET
>> (as per the absence if an IA32 infix in the SDM) isn't an architectural MSR,
>> and hence I'm not entirely convinced we can "blindly" expose it. (Interestingly
>> in Linux code there is an IA32 infix.)
> 
> We only perform rdmsr_safe on this MSR, so I don't think there is much 
> problem with it as I don't expect Intel to reuse this MSR number for 
> something else (at worst, it is going to not be implemented and would 
> gracefully fail).
> 
> Some parts of this MSR slightly change, but the one (tjmax) that is 
> interesting in here is consistent across the architectures.

Perhaps it's indeed okay here, but the aspect needs calling out / justifying in
the description.

Jan

