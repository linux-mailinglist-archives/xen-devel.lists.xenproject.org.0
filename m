Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2DFB1C078
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 08:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071220.1434720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXho-0006gb-8A; Wed, 06 Aug 2025 06:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071220.1434720; Wed, 06 Aug 2025 06:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXho-0006eU-5Z; Wed, 06 Aug 2025 06:32:56 +0000
Received: by outflank-mailman (input) for mailman id 1071220;
 Wed, 06 Aug 2025 06:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujXhm-0006eO-Pn
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 06:32:54 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e0e87f1-728f-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 08:32:52 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af95b919093so527894666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 23:32:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a313esm1045583566b.32.2025.08.05.23.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 23:32:50 -0700 (PDT)
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
X-Inumbo-ID: 2e0e87f1-728f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754461972; x=1755066772; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W+3POFiTWJPosCnVbyuLVBcvLWQ2ts5jbd1+/lFk/Mc=;
        b=GXaAymyG9wEBePJDE8+61eSzNDH5VekOntnJwOoKk26Y2rA4JrbJtlW/qJN4W6T1ob
         8D/8noJxaYUpV5hQCJdO/0kit/OX/A/Ijp29qvuJ8NveWwlUHsIDE0Kio2vaoAf3U63h
         ohkkjYEBCIQbGlA2iRpV0ZRdDnaIyARghs9+AdgrnEL//5ZlVGMGgUYf1ZmggdsvrB+e
         MK4vgiqhOtSFAWlwnyn5k/FyMFRakDXs2b+FTfai/gTNn9TFADfR2KIYoIdzgE7/FUbP
         K65L/Xi+m0EzxJuHUnfynOTE5FWQyKMvItO+2YBawtClA1J8jK79AhmPPYznA0VB9Oyp
         yIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754461972; x=1755066772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+3POFiTWJPosCnVbyuLVBcvLWQ2ts5jbd1+/lFk/Mc=;
        b=vXCHLEsMWwTBpwaix6BEU31pDQCB+qRCKPxtEg0JW06Zr7h2p40Ln/km9MtxOQWho+
         +oy9uilN037OpT9b+QnnNDyEqI7hhEWbOslbzXNcDsLLYA1fvX0ChEfI51pn1oZeKN0W
         h3VxybYgOCYO2tByYQcLDT62UdK+B2XrKxiusmIovu1T/xZ7YJVmz3hhV5hsFd+cPe96
         Ek0p0VmZTxftlTg6tfWBw0K8eISIzAOYdCTvv9Kb3Ham0LTe+8wls/X2cQzsUX9tHceu
         Y05JKzcehwfxl4TAz8m4slgFcRxeXrU4CgcXt4P4CYadDcYvaozTBFF/HmMY4a6Omabx
         KemQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZNAzdh3IpwozNzm72bDWA2iI6lGd+kW/lQ8itm3FfuGO34bB0wrWLXddmujCfYBBhYlsjnXUABq8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWBOFWWHpmc+sGKC6yNO8vjwD5i22HMMPpv2bXXJ8wfINn4Uom
	D2T+j3T8K00tAFvnwskmqCrDqUnFWzrY9qoWKL3lSyfy4JwUEjrru4EKBE3g9Y8ESw==
X-Gm-Gg: ASbGncsZsDrPlQqKhwqRP10ReMtVoiaK+MMRcPSt5GRnSZZ9hicu01DkZYvdijyrYrL
	N7zJyt4C+8jA2/fDmRckodeKOI2BZGNDtBSDlHZibxXFkEsxEf7YETLjec7uZx5dY+D3aXEiVdD
	YWCGFUHfZpYu0pT1idyOKPkSaj52U9/outJptaIyIuWzPJBEA9NoBA+hVXNmRJ668j+CE597H+Y
	ugfFr74IZmTi9puxq8CzYiGoo9MO7Bu1hQlBI2LYvsJZUkFHnc+uVZO+feDiV368L+LfMfm7r+2
	AZ5QgzaW0D2KLELda1M0BEmbR7+j6s94ni/1okQ7wkgVf1QaqAIRLJ4rKcvEJiTkR4PxON8qjcS
	Lfv5Nbb1ogkGaD+gZJI7yuVAHrMYTN8prZ7WrtR8uOsTmKhQnV9Vx2d4R5lbzloUct2EkgGRqRS
	GZ6AVv81A=
X-Google-Smtp-Source: AGHT+IGD4F9lVQZNT9C85JyMM9KVqDhA1xbCDKfIl9/R+QpVRiprf9+Gi5SPUjS/CYPNiej8inVJ5A==
X-Received: by 2002:a17:907:c25:b0:aec:5a71:4513 with SMTP id a640c23a62f3a-af9901113b9mr140059366b.4.1754461970916;
        Tue, 05 Aug 2025 23:32:50 -0700 (PDT)
Message-ID: <3010ef8a-3d07-42f5-ac66-c62b7d50f745@suse.com>
Date: Wed, 6 Aug 2025 08:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] efi: Stop using StdErr
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
 <20250805163204.3631483-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250805163204.3631483-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2025 18:32, Ross Lagerwall wrote:
> Xen's use of StdErr is inconsistent. Some boot errors are reported using
> PrintErr() which uses StdErr and some are reported using blexit() which
> uses StdOut.

... with PrintErrMesg() having

    StdOut = StdErr;

apparently to address at least some of the inconsistencies. Perhaps
blexit(), when not passed NULL, should similarly override StdOut.

> On my test system using OVMF, StdErr is not displayed on the emulated
> screen. Looking at other EFI applications, StdErr is just used for debug
> messages if at all.

That's hardly how StdErr was meant to be used. And at the risk of being
flamed for saying so, looking at other EFI applications (without saying
of what prominence or origin they are) can hardly serve as a justification.
If OVMF doesn't set up StdErr correctly (despite being configured / set up
correctly), and if that can't be fixed there, imo what you want as a
workaround is a command line option to override StdErr by StdOut even when
SystemTable->StdErr is non-NULL.

Along the lines of the comment further up, inconsistencies in the use of
StdErr vs StdOut may want addressing (separately).

But of course, not being EFI maintainer anymore, all of what I said above
may be deemed entirely meaningless by the new maintainers.

Jan

