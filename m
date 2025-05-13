Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8283AB5734
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982971.1369336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqgC-0007R7-Uq; Tue, 13 May 2025 14:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982971.1369336; Tue, 13 May 2025 14:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqgC-0007PS-Re; Tue, 13 May 2025 14:32:24 +0000
Received: by outflank-mailman (input) for mailman id 982971;
 Tue, 13 May 2025 14:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEqgB-0007PK-DE
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:32:23 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1463fa52-3007-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 16:32:21 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54fc9e3564cso5592839e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:32:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c8608sm785104966b.26.2025.05.13.07.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 07:32:09 -0700 (PDT)
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
X-Inumbo-ID: 1463fa52-3007-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747146741; x=1747751541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tOyPmbukr/Ucl9sZNJb+v8hy5xEx+P98pxjX96YuxYg=;
        b=NUM1iIQeV2cbVvBk8gUFqigYul/RfwBByD9VmMRK51/xO95F44h30BD3Li+M+NVV+7
         Z8Fizg/Y0wTaU2CngGZam5Kifumy+siRJTtFrq+nF8M4l6iwzrWSwE5Tp6En2Z0AO3ib
         gxB5pSlYBtdG1GjA1djQolZ6o7O5k1y12mUuFIK9PACguc3mHdFRNwXXX2oSuER5PuL1
         01e47XgGIdjU3DNJBrmlfgPc1EYTdY4Y2aGnUxsZ8Q5jqef/XSLycr4Ge1l0jaDGHehA
         qkoB6OOcdNTrOQoFT2uGDJwKyM+RFKEOd9xy91Iv/S+VHOWmGhU7U3VMCsM6JVCPcczH
         pKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146741; x=1747751541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOyPmbukr/Ucl9sZNJb+v8hy5xEx+P98pxjX96YuxYg=;
        b=aWqssOshCbxCFt2m2KAP0HVX9t+c1+YYz5glWHZd2RPUktDJ1S/Sa/gViVnBgLnINt
         10rhkkCRlT4e3zP8obYM7OyV7d2dVqAUkjgxM7Ts34c8zO4koSL+FYr8e6x2imOtRVrA
         /Ru7WCZlGYSUkeMjdfYKYDZ5/8RhYfHfReEpespsxWRYT/m+qJ/LTs34vyXekmMCQ3Zo
         G7RK6/1d/n02jLr3KwHqlT6m8bijth5BrgJa6hXQYr175Y1H7Uom7iM/TFQYkJsovqf0
         1fy8dVt7U6+Rpq/iQVHbqoj2wdlRLdZoZ8BFb4TIKEQsXzF0tHMoPcp4Q4oI4qkgFq98
         ju3w==
X-Forwarded-Encrypted: i=1; AJvYcCXEraHvk2BUCYMt6t/3Aya3iWcwEvqg2YenvDSc3gphqtx9cutQojCQqRQ5nCoid7J8HSbECguxuLE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyq4PB5l52w+A4NkkUWoBxdaFK2ZFXSc29urH+vacADj8OWz91s
	FuLLPeNUot/UAmfSSS2ULAdxcgocHQYdKq0XWzOLoyzcHIEfvcNlrRHGLN652CNyfTWwnmU2PAM
	=
X-Gm-Gg: ASbGncsy2lqr3OzCDa1Fxx1yrz93J0enOJWmF8FLyWVrHRoMk3h5MR7pCc+2DnHVEg6
	TWzNH1ZP+KsyR6FqeB0niOtoGs64T8yWQoWROMfeqJLpzU3AYHILZ7J6jJmpdOd9cBLzC/7QPTC
	YHMHPLMAOXADdYJGcNI1jVYfJuDFMjGdEFlHlbAfwgmvLz3g5eQ1aI4mnRWP0DsxHXL2h0z2sKz
	yO/6SDYK/ljhKH9zjKRbEwCDTJ45QyWI5KZOGXs5/e0CD8SIJgmHXUjmgc29wUhXCFSnUs9W+/O
	IkpOOyN0chXkGKEapi+dAlgHtccO2sy5J4DNaUU9Lj7MB/Bz5BEWRhGllHOcpbZPI1TlRgTp/UG
	g54ouiSvfeT0HA6wxGn8MXytiqXMxPvMojSnE
X-Google-Smtp-Source: AGHT+IEaMEZNX6VuU1oRHLPekQF1Oy2mlC99rZzciYlr4cqC3uH3Pc2huFqD7lSwljCiNR0A0AUpwQ==
X-Received: by 2002:a17:907:3f9c:b0:ad2:3e8d:6440 with SMTP id a640c23a62f3a-ad23e8d64bbmr1240896766b.33.1747146729771;
        Tue, 13 May 2025 07:32:09 -0700 (PDT)
Message-ID: <d5e62b4f-816f-4948-a9ec-4a7dedcb31d2@suse.com>
Date: Tue, 13 May 2025 16:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
 <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com>
 <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
 <504f0be0-91fd-4847-8fcd-505771674814@suse.com>
 <CAHaoHxYojvmAe_jtwjHzCMKGKa_0fkGc-cbypRpKCRFQt0sbHw@mail.gmail.com>
 <55e73266-7727-4a1c-93e8-dd69712d64d2@suse.com>
 <CAHaoHxbvT5dbhVMnrPoWq3ma-maeLJh56N--B7svMXU+gY2Yrw@mail.gmail.com>
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
In-Reply-To: <CAHaoHxbvT5dbhVMnrPoWq3ma-maeLJh56N--B7svMXU+gY2Yrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2025 16:28, Kevin Lampis wrote:
> On Tue, May 13, 2025 at 12:09 PM Jan Beulich <jbeulich@suse.com> wrote:
>> I would like this to at least be considered.
>> I don't like that custom command line parsing very much.
> 
> I understand. Parsing code can be risky.
> 
> In this case I think the code is small and simple though.
> 
> My concern with asking the user to always put the `lockdown` argument first is
> that it opens things up to user error.  I am not aware of any other project
> that does this.

Well, it's easily possible to catch that error without any extra parsing.

Jan

