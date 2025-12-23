Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92CACD9E58
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 17:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192670.1511799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4vD-0000cs-2a; Tue, 23 Dec 2025 16:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192670.1511799; Tue, 23 Dec 2025 16:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4vC-0000bP-W3; Tue, 23 Dec 2025 16:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1192670;
 Tue, 23 Dec 2025 16:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY4vB-0000bJ-Sz
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 16:07:37 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7df92acd-e019-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 17:07:34 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so38199125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 08:07:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be27b0d5asm303119575e9.13.2025.12.23.08.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 08:07:33 -0800 (PST)
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
X-Inumbo-ID: 7df92acd-e019-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766506054; x=1767110854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y2NYvTDdGpfWSiBAEHhov5XADOTREO/6HBvHqvC2q9g=;
        b=XcXfmfORavYoWlFxo9qrHR5Bdki8Z/2HH4dzJveEM9vHhtqAlugc0bmbXxk4Lk+K0X
         CSVGM0kroeS/0w9qu5uvC+vpV/k21UFoeM6fskSVhBvbL6vvYpilSOlCTkmiJ1lltZOP
         9t5XH3Uvs7P0XuE0tc2wMOjNSTLhtU26HvIqK/bKntWIEHqfpuEgrXRXQE6ufTG/mvmZ
         7iAx0BhGpCB4FUTPuHGEE7l9D0ke9YP9M+WcLqtB2WPX7FI5QdkZBS4K6xH2p460JaxO
         JDnQHSEwZZI8mNUaA825IIpmyiI2hphw/IrFWcRw8MbxDqxAZEyTgx4R0KdkTZhuQJ+B
         y9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766506054; x=1767110854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2NYvTDdGpfWSiBAEHhov5XADOTREO/6HBvHqvC2q9g=;
        b=q8btdEtLKRmOepKtaCch62NQhhbA6QskolSh1EZkHuJDNxB9jCaQhA27TL+C1nU8iU
         DscZq3rvowE7L84Engwah2vT+DsswPed7QlLVLsThyINpFXUfhel3N9RqJkbl52KAAea
         kYY+pKmoiav45T7cNG0jSlNafydsXGtxW0TfwITLdO5wCqq2jrqYP3EEGLaVpjXegTQ6
         SGxr3PDPiJRH6l2e3w6FeXpiotg9yuG+sYJZNS6UBSI+n8vKMeQVCTevCAqoZA7lcFpU
         uoRA6CcWoDcB6dMUBAL+XD7LT1nTPRKCd/pQzII3EIkmhmhIreJiGEYLFoV+iEzdSCbL
         mBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjC+Ef44IvK2/TOfQLEJpIvAyNzokONeMFeJnVpDFM4aKH23XMjYuMGUBE3YyEmU0m+F5DKTz/LTE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDE/wTNFx06AHpGJY00YJ5kbaanpZM9PHKR73Ps0dkOAp6TW/R
	2zjVefeuWZrc6m79yuo87l1olvNmOBnZnt7vt90NlfHO2AurhdFP6HnIcjWzO9HBXQ==
X-Gm-Gg: AY/fxX4nay01Q4BWu1s3M/k1jCaU7R99fxjocvf604B1OZz+W1B7r8cBPgqWxIQPaOJ
	XX8QicfiRmXVtOo95tlwzK08oPl82BeyXvTOpBPhD2V7viXMnDM6oQpVPBhLd7nqJJtdHdC0v9l
	gyBOoO9HuQJIrl9M06Bsl+8tettneYe6gn3AZdV7ec00JV6HE9Gv69ewNX+pagdiXTcOhB+es8M
	xGLtS0fr3t5OoKC4DQwdsFM4oYGZ06t15801yTq1PUOiBIvjwv9gUuS5Im/qouDR7yD7uRN9HN8
	GXGucy3D9QWCJKKhk5F2lE8zF9/xrCFy7V8s0S75M1OhRspzDOHojPzToAP9QIifVGhjRlv6Qp9
	oKSChqtMsaOyp/Yx0JTbcLX+2LJPYWR8mrXVDyHTfLHnqT67SkeNBEa2/DSsKmJlxrigJaMHpp2
	NsI3lEcWWXsKpfUKoKe/txEkD9Qh/DD064Cs3YfLo8ze+2OQSTdeQkCb3YVRawWfkuGOf6WRquW
	QQ=
X-Google-Smtp-Source: AGHT+IEqT718fsxVAsvcDWymrIpItWoo/i+5WfJkQuUmxojG2zlqk5ZXRaYuaSo7HcA6Mm7oip1dkA==
X-Received: by 2002:a05:600c:8b11:b0:477:55ce:f3bc with SMTP id 5b1f17b1804b1-47d2d273515mr81680775e9.19.1766506053528;
        Tue, 23 Dec 2025 08:07:33 -0800 (PST)
Message-ID: <74557019-d616-4724-a5d5-4ae3d5a6728f@suse.com>
Date: Tue, 23 Dec 2025 17:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
 <f4225d3134ec12a392a2e5d91414bfdf9d0665a1.1766399205.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f4225d3134ec12a392a2e5d91414bfdf9d0665a1.1766399205.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 17:37, Oleksii Kurochko wrote:
> This commit adds support for legacy SBI extensions (version 0.1) in Xen
> for guest domains.
> 
> The changes include:
> 1. Define all legacy SBI extension IDs (0x0 to 0x8) for better clarity and
>    completeness.
> 2. Implement handling of legacy SBI extensions, starting with support for
>    SBI_EXT_0_1_CONSOLE_PUTCHAR. SBI_EXT_0_1_CONSOLE_GETCHAR is marked as
>    not supported as legacy SBI console related stuff is expected to be used
>    only for early debugging of guest.
> 
> The implementation uses the existing virtual SBI framework to handle legacy
> SBI ecalls, ensuring compatibility with older SBI specifications in
> RISC-V guests.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Peeking ahead into patch 3, I notice that there you (properly) avoid saying
"this commit" in the description. Unlike here and in patch 1. Please try to
remember to avoid this and alike wording.

Jan

