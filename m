Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A44C812EB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171251.1496267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXzo-0004nD-GK; Mon, 24 Nov 2025 14:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171251.1496267; Mon, 24 Nov 2025 14:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXzo-0004kv-Dd; Mon, 24 Nov 2025 14:56:52 +0000
Received: by outflank-mailman (input) for mailman id 1171251;
 Mon, 24 Nov 2025 14:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNXzn-0004kp-0a
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:56:51 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd8c1a81-c945-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 15:56:48 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so37087185e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 06:56:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1f365fsm201139525e9.8.2025.11.24.06.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 06:56:47 -0800 (PST)
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
X-Inumbo-ID: cd8c1a81-c945-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996208; x=1764601008; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tZlGyzEbG4hX4MO2kyHfamM2iNiDSDSGSPCff2cfVk0=;
        b=HBtGH0WNlTWer1vazRrLIOxRZdAUrCvR7FaSS17lBQw80ihn/SVBAThbFR+hKLzEqr
         gnQBEfSibRdNQrL3nw7x2Wst7GSDeAzCMNABqMScsUkKHXCRiFUaO8Vv9FNdCBprSI6T
         bp9yfScnsX2wjz/fbFeVdWLGihw0S+S5TGh0CXYIK+ObBiDb/Vj1kRit6KtjLDHE5zPM
         a2Ew5iuz8ukX7c/rm6ZEbutjW2kN2KdyiqvUTAc1yHWnimuSx9CvWzKIsgkpHy5jim+p
         QDfFT442QAtGoY39/EBCdR7dMjtBQ+F8No6YCvASitpNa+jWQ97+HHFyg8Ea2TiJBG+V
         cpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996208; x=1764601008;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZlGyzEbG4hX4MO2kyHfamM2iNiDSDSGSPCff2cfVk0=;
        b=CTcBfYeoRYd+8wn5shxtqdT2eOgvR2XfMBepzz1qeblEsnjjGrZtMKUnT9BAsvgR8U
         sBnU6yDPklTmJ7znDfvlt6zTagpRiQvnqCP0xv9c4nph+sNNXthVZCXbS7PPGAKeVhrj
         gE2iBMWLaWVaFymrGYa6PSg6u+tb1uC58f/or8AAMGMvqSjGMkypm5MrmS8zcmgHfAIh
         Y7k1nKJJT1thNl8Rk/WI+hugb+VHi0HlHMK/03HgzAdCxB7gpxNF7H5OMPKdUjyGqjNG
         HSYuiFl7RdhedomJuv/uPlA9pabTGfKGsXr/do09dF78BIkNX5WDf0fhlh6PuYEwqwyQ
         SijA==
X-Gm-Message-State: AOJu0YxsKIxwkKq2m1TagomNIFL9XA6XBvwtDPo07wrTJjko85/iZmh3
	OgubRerIFx4WwMcMHjXfFy3mygWiO1mebTTu95h2SsJbrUM0U9kJ4PknkDXuO+G0ff32vYKHONg
	Naso=
X-Gm-Gg: ASbGnct+gIrNNiw+UUtJeI2w6DNsEUBEr6NDl9dijbzra3y/GHK9yWG8tGtmUqyX41Y
	6Pskb7LGVxbV7GhXZY5FxCbS6Qr1xOFcUGk4a4UL8vYMdEoDhezmnrMk+0Cmn2o/t7hWZQCehjM
	xiusnj8KF3FxjvSsknF175cMMePYpsid6BNt7kzVmWN3YVVCKtQ0+PNd9woTUvwZ0mgPJKUgLU2
	9UBucY7pV8+vwcZdAFpoWzW+fUdkUgt3fb/Js6GfX51iMdTFqoE5Nx074qzpHM+1YNYlzPXv+sq
	RzWW3jyc+b9ezPGKJMRbWIlpFequtzipuZDr466ij2aZjM9GomYw5FvqgiE8lQgA6U2ScYMJ4TS
	8eXQErmx+qUWHC7yIzmNinrd8TTe33L6F1Bv9YhPiS2FT4J+Jod5u6s3ikHKbTmmc3yIJ7B4iVX
	+yVOrB/ERq56JMCjV8ofDnFqFHeLnhzFw+2AZhmjh5u8A4hSZCPZhJ342UNWQBAUsyv3wioGFV/
	RI=
X-Google-Smtp-Source: AGHT+IHJFXs3DcCRjf/gEgdJI8v5taOdiQ4ppngJKzQ7Nx+6xGEL7aLkvTHMha52S8o3qibseU4Vyg==
X-Received: by 2002:a7b:cb81:0:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-477c01be3e7mr81760915e9.22.1763996208185;
        Mon, 24 Nov 2025 06:56:48 -0800 (PST)
Message-ID: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
Date: Mon, 24 Nov 2025 15:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v9 10/10] x86emul: misc additions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

01: x86emul: support LKGS
02: x86emul+VMX: support {RD,WR}MSRLIST
03: x86emul: support USER_MSR instructions
04: x86/cpu-policy: re-arrange no-VMX logic
05: VMX: support USER_MSR
06: VMX: support MSR-IMM
07: x86emul: support MSR_IMM instructions
08: x86emul: support non-SIMD MOVRS
09: x86: use / "support" UDB
10: x86emul: support AVX512-BMM

Jan

