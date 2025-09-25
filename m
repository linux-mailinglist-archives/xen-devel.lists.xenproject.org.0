Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D978FB9DD2D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130012.1469676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gBJ-0002lC-LK; Thu, 25 Sep 2025 07:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130012.1469676; Thu, 25 Sep 2025 07:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gBJ-0002ji-Ic; Thu, 25 Sep 2025 07:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1130012;
 Thu, 25 Sep 2025 07:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1gBI-0002jc-Aq
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:14:20 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fb09e33-99df-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 09:14:17 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b29ebf9478bso86524366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 00:14:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a364fd05sm727080a12.13.2025.09.25.00.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 00:14:16 -0700 (PDT)
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
X-Inumbo-ID: 3fb09e33-99df-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758784457; x=1759389257; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F2sXIVpQ2sRQqf9olGrpp/u0HOjr6xauSwIcL3FIM2k=;
        b=Zwl265KS52DFMO5zzSgnT7sLwN1VYTwZvTsheIHXG974jCFoScDXh0lwvqckX5OYAZ
         DcCS19k74gGlBliCPhy9ZQ8zVJAbJGyKfezkeQgEvDVqr2Ds8NXqJxfYrEYcBYu3UkBt
         Zs+wbb6yOyl1hblAtq2TXDqVGjEBvdKhk9RhJk6bFi91z1ISVr414rjLex8iuk1uY2e5
         QsXDatFsmwXVyqxDihZnzzOM0Axcc80Co1J8YPoMWd128rBXEmuk6oh48bi1e51/w+wi
         1aFaXRACGW+vZqCIiJW7xTy91n7b7SUrpn3wM7hVNOc5gMMVLUsgAHCTYfmEFojl1JIk
         fNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758784457; x=1759389257;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2sXIVpQ2sRQqf9olGrpp/u0HOjr6xauSwIcL3FIM2k=;
        b=NJ4hxMTcrZ26aYCX7sAVHSM8mCVMEv7SK3jZuJ0sUMLc+ZkhcuR1ZoR6jtlZ7kd3fw
         PPDodDDfqYBb4b/UiukaVHA/NLGaIGngi34n+olBUgS+pRrnfuJg7dqTQtJrs/tWPG5s
         0VYl2PMyaaRz0QHztt6e+p9jlw7msu+C96D4ATve13ac/Xr96bwG1rAiaUaeBG6fXDl+
         z54E8VaDGLLKgGxgdUeNuVq7XGj6C/5xmhJNo006npewVKqNiEPhUW0xGa3TSK3tX3Rs
         XCXLMfr+YeWwTkUMwqSFpcejguY2+xbfRcPv+anzHDt4gosWcWEvtxE0JhQUkt8ybbMf
         0NgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWUDoxCXGdoXQhyS5UF/D+M1c0NTcV+tDBun5+EHbXNPH2liUYZL4mm16zL9xCJSzraMBcBN7gUmw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBYfviHVYeUlR5sVuTRB9W/1D5kxS4/iynLlKmUZ0LbrB8uth0
	bvqAI3b4LXBu0RYnOX5ZgruFh2TTXpivqcVDL6Vf+kBHmCTDdmxH7ZnWQctAkVREXQ==
X-Gm-Gg: ASbGncue4kF7bRxUby5AtLk/fSWUt7lPbrr1p1N/phuUitkI2fGknyS17b00OeWmczs
	/GR6fa41Sejl+rF/ym3Jkn3lLoBQylzXPfDif0cCzGQbnGCNaSCD3GQUivGTuF6Gz6uaKSY79w7
	5zNSHdXXT/2ZRXi+UHPjtPs04LpBw9O43afZBr7mLnthUf1xkHVqyqH0OAqjjfo2Z9ILTc8Gu1d
	8PxAN9rMCkHPbfhsm3DGtibFYJL7rP5aOvYh1ieFpN4+QG9tlGuSBDDBRqcMzB6h4hiX2FrPV7I
	0uGpTVFT895AQtx//hAM1+a6iPAK8OJ4OVJceQsd24oX9hs+NILcFrevoph2DzRpT7ft8mUotE3
	2qUJSmS1NdpGf4ZfNtiufP6ihZMTBRXOAcVJ9FmRdzDKUmnmUocIZb85Z8lWNspt832OSDWEnnc
	Jw+VS/qQ4KnUsjvAItmidy8omkb/Lqpl8XDEy0
X-Google-Smtp-Source: AGHT+IFMs4FlDj9UhXEMusS3nmd/2eu0qvNcfeL6FIUA+q5E9pqbKp7en4ff0YPxzegDbfwG3FwT+g==
X-Received: by 2002:a17:907:7f05:b0:b0c:8280:4f40 with SMTP id a640c23a62f3a-b34b7209e3bmr279727266b.4.1758784456843;
        Thu, 25 Sep 2025 00:14:16 -0700 (PDT)
Message-ID: <a6f724b2-ba7c-42be-bf00-94c350f59537@suse.com>
Date: Thu, 25 Sep 2025 09:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH 0/3] efi: Shim LoadImage improvements
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
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
In-Reply-To: <cover.1757519202.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 10:24, Gerald Elder-Vass wrote:
> A previous series for supporting Shim's LoadImage protocol had some
> outstanding comments after it had been accepted, and internal review
> revealed an improvement to be safe when unloading the image.
> 
> This patch series includes those changes.
> 
> https://gitlab.com/xen-project/people/geraldev/xen/-/pipelines/2032454096
> 
> Gerald Elder-Vass (3):
>   efi: Fix line length in init_secure_boot_mode
>   efi: Protect against unnecessary image unloading
>   efi: Limit Shim's Verify success to EFI_SUCCESS

Can there please be timely responses to small fixes like these ones?
Especially patch 3 wants to go in rather sooner than later.

Thanks, Jan

