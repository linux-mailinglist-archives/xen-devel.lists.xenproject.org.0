Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC567AB58F0
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 17:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983057.1369418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEro9-0004PK-Ic; Tue, 13 May 2025 15:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983057.1369418; Tue, 13 May 2025 15:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEro9-0004NQ-FS; Tue, 13 May 2025 15:44:41 +0000
Received: by outflank-mailman (input) for mailman id 983057;
 Tue, 13 May 2025 15:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEro8-0004NJ-BV
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 15:44:40 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dea49c7-3011-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 17:44:39 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad2414a412dso485755566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 08:44:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219341d44sm806727966b.62.2025.05.13.08.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 08:44:38 -0700 (PDT)
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
X-Inumbo-ID: 2dea49c7-3011-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747151079; x=1747755879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vFwP/8iRTVnlCDSD6iQk1aNwKdEQiXgIzTPofz9iNJE=;
        b=DliwfiNMPfhBSrvvEZ10QgfsmlUFm2nNDsGRmVtyEkHthWYh1qYlmtoDKDFldyC1oW
         8snpUadRpnMGAJ19M7hKr12Ilaxr+sWjPdIIwzXsQlJdpIQZrWsYntH9FqBFhUc4C60Q
         tzzLvALdI3AFm2vprQBhUTNSwMD8B5lG/LHQnx0wTbu7Lap8n5+pZMLe7+O6BI2Idn+7
         TL1c+giDFPhDxie523dO+eHLE2pAIiogSrA42Xn1D5FalNUBxFCW5mrsntwU0G3EXr//
         OgOBkhBqtb2C72V3ehGOOFV2MBNklwLz2yxeXQETet/jNZ79z41cMqz/0DBwb1hX1JAc
         Ebow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151079; x=1747755879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFwP/8iRTVnlCDSD6iQk1aNwKdEQiXgIzTPofz9iNJE=;
        b=sViff6PUMa18TTEVPJRrmO9h2PKpQFtMCCyeGa7UurJVbnFzVJBmCE3KnpQy6rb7/G
         5nLnmzShRyJF/e+4ICuADr0VLVy/4/jW6wItmy6bMJaS6U3lqhNgMgYuhALI+2y0T6jV
         zqatwwuCkMdZlDgZ/Bn/vtI/cHtmNydvsK6ZRGf+nsBLjSNmcyK5x4IrCVufP8jqDvR1
         rdj4LwQr60Qz8czxMOIemcsdM+yTxUDL9JfnHvwY6zw0wgh48TvNp/o3ZTgLkJ5lGu/N
         2nYRgEZ2rihmV4f3CV6gKP1ERbDxI8q7AicxyG8AULIDhf4D6QC9EPvskANku+JGrbqD
         5Y2A==
X-Forwarded-Encrypted: i=1; AJvYcCXv6fXkSm/9qaiS9tTfx8VCGY9mLsaFW7qdfnBEnYd/YATrDMnlJ7QFhr85/ZhXynwcw2hKU6AVL7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfnlhsxTMBdok3k1dl/5TFiCw6EnvG0Xbbucaeds3Gpu86wcL/
	2rSKamMGfEvxcDth3Fa6GybaZrbgpHrQTyriP0eihoYgYTbRBw8sFC+CYQI3JA==
X-Gm-Gg: ASbGnctDRlZZhNM4YN2eOTFwmaFpyMfaE9zBkmmDE9PTBooJwaUJRvKI90RGyg0KTvi
	6Z9Yp4mdec5oQJUILOQEcoe6E6iWUew7waHkcNluE7zjEQeeV5R5xFP3B5Nba3wggp0F/tg61je
	T56OGQEwlrF5Ufe5n1J3Tk/ZPRFaOJ20zcwtgUe3GQaw/MDfw4DLR4sawQ96TQM61yLZVnim9Jz
	vt3awMHvvJbv1YwOhphUrOgGqId5He/G8QAAdZHTZhZRKYWdNhSK8UXKSYguPEvBEIhcGKkP85w
	Ce+aP7g5FU0OMEEEwhrN+hjXAv9PDduOGHN8DNs2aNe6WQnjw8COKhkia/RtfaVL5/xJ46DbIXc
	mU6fNwh177fMGe7wRyP3C+MCpPwXGiuvboGqx
X-Google-Smtp-Source: AGHT+IFe/xj8iNrTe37SZq8B8vGkugME0KpApANv35X3+GhnLUzU+nvYHyDscRpVyEJfuIt5iIqUOw==
X-Received: by 2002:a17:907:7b08:b0:ac7:edfb:5210 with SMTP id a640c23a62f3a-ad4f7114f16mr5798266b.20.1747151078641;
        Tue, 13 May 2025 08:44:38 -0700 (PDT)
Message-ID: <78c5a370-f17a-4940-aa5b-c18d52e4b6ea@suse.com>
Date: Tue, 13 May 2025 17:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] xen/riscv: initialize bitmap to zero in
 riscv_fill_hwcap_from_isa_string()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <21efdebac3d1c9797420a8c81fbbd6a06ecc9121.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <21efdebac3d1c9797420a8c81fbbd6a06ecc9121.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> The this_isa bitmap should be explicitly initialized to zero to avoid
> false positives when detecting supported ISA extensions. Without proper
> zero-initialization, the bitmap may retain non-zero values from
> uninitialized memory, causing Xen to incorrectly assume that certain
> extensions are supported.

Why "uninitialized" together with "retain values". Yes, the variable is
indeed uninitialized, like any automatic ones are when they don't have
an initializer. I'm not going to request re-wording, but to me the
above read as if you were concerned of a static variable ...

> This change ensures reliable detection of ISA capabilities.
> 
> Fixes: 0c2f717eae ("xen/riscv: identify specific ISA supported by cpu")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



