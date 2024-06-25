Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1910916A2C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 16:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747843.1155349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM75r-0005lg-7x; Tue, 25 Jun 2024 14:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747843.1155349; Tue, 25 Jun 2024 14:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM75r-0005iW-5G; Tue, 25 Jun 2024 14:24:23 +0000
Received: by outflank-mailman (input) for mailman id 747843;
 Tue, 25 Jun 2024 14:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM75o-0005iC-VP
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:24:20 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c6c1728-32fe-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 16:24:19 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2e72224c395so62824181fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:24:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb320b33sm82064345ad.83.2024.06.25.07.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:24:19 -0700 (PDT)
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
X-Inumbo-ID: 9c6c1728-32fe-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719325459; x=1719930259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OUwAoH1ZShYCC83aNyQ953GlT2vF568xgwpj2nltnoc=;
        b=DHLFBgFxWTZ1fYdEHp8wh1xl05HhShovWybJgrt41EZdk67OfPObyBV4E4CsibtBja
         3GcXVH8t1hi2fBLudN3OVmZbWL2XfllwbjT8vwdL45mnz+XezUK96Fvi6dSAsCXLT1fc
         CBl2Mjak2XyPoZZPwbTZjbT32hiaKkEXwt2eNu7c0F5NR3KKiIgUR0NLta3DHFan/pTy
         pNfwzWK+raZa1A6c/ORSaHzIDBFhxxmYxwMyhoD0AgJc6J5/ldeRJen3lAUSVV4zXyhw
         j978/mS2e2j7UXyos50xBXLJsKbdNZ3/ZVjrgvsixmwIgb6zwIlQ2Yf1RW67iHNi+3fs
         Mp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719325459; x=1719930259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUwAoH1ZShYCC83aNyQ953GlT2vF568xgwpj2nltnoc=;
        b=ZjMzSU8qlYJeviCv0brGS9oFsLL08gWuTgb9i/agHmV9M2bYSsovtbaOHvMFZXpS5s
         Z/Za0nl+YLljkVHUAT5Ae6N1j2s+db+vRPJMz52ezFlYm4VYjWmqawLw5V6iR0ZueDYA
         MXcSTLV/Euc5yRZbSRN2inrzVxRa9cslv46NksyASOM/se1p5MKFEL4YTJduN1qnD3kP
         iPfxjs5IP8eYGBkRisiBtOIhbuzA7d0z1UleTvZLHkOJ6rKDEvYvZQz0KdHmPlvypvri
         oR5s5Y0+7HJTIt2qyE4yoWJ5zsP+Mpoikzw0+DnAK/0Xm2oM+t3Ai+BA70hPSBSP61Qs
         owRA==
X-Forwarded-Encrypted: i=1; AJvYcCVp806IKE1f9on1UwQ5vKdUuVS3eoEO9TYt8PJBss1fzFNgtM43Ts8hJhqIB8HRW2XcezWyyQKBJVv1/MSWU0Pl4KK5zgnFzKUHz7CQYlA=
X-Gm-Message-State: AOJu0Yx0ro1hflptmIbrFdaXxUFPfDn744iYzOP8XXtipNZBZ4a1F+Wu
	lRg+RMVHQ5Sc6cb9GzK5F01JTx7I4W/i2DQDqVWYFmP7/NAZP/FoZ4cjsa0a7w==
X-Google-Smtp-Source: AGHT+IHOoU1ll2cOMc53LYPIlAzjEb+obs22SLapmiHzb5LCFSQLFWcm/K9JbvmV39a5Xio3BuKXcA==
X-Received: by 2002:a2e:8792:0:b0:2ec:5699:5e6 with SMTP id 38308e7fff4ca-2ec5b28ba0dmr45475321fa.26.1719325459491;
        Tue, 25 Jun 2024 07:24:19 -0700 (PDT)
Message-ID: <10d1f56c-6b27-47ab-bd5e-208a0938c3eb@suse.com>
Date: Tue, 25 Jun 2024 16:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 05/10] xen/riscv: enable full Xen build
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <b47a278c89eb436a7b88dc5c0b18a6be09c76472.1719319093.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b47a278c89eb436a7b88dc5c0b18a6be09c76472.1719319093.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 15:51, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
>  Changes in V13:
>   - implement get_upper_mfn_bound() as BUG_ON("unimplemented")

Odd, patch 4 also says this and also does so.

Jan

