Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5CB13B9B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061516.1427111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugO3g-00074D-CU; Mon, 28 Jul 2025 13:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061516.1427111; Mon, 28 Jul 2025 13:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugO3g-00071w-9p; Mon, 28 Jul 2025 13:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1061516;
 Mon, 28 Jul 2025 13:38:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugO3e-00071q-UL
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:38:26 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22a1d7c7-6bb8-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 15:38:24 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so892074f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:38:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2402efa3500sm20573305ad.31.2025.07.28.06.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:38:23 -0700 (PDT)
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
X-Inumbo-ID: 22a1d7c7-6bb8-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753709904; x=1754314704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YvKNvOqv2m1Zgi33Q0pm5hDGdMHHffBzRtXS4u2kcAI=;
        b=hESC4ixvhA7EuXc0SRcO9/+q125mI8Sig6yL4jv1jcDR0qpv0kUkJ8GFWNB8n9Rlsi
         LoVuVUr19uYQ5f7hrHZg32MZDQKdPSQLP4W4PY4JINYIlBnL/3e0Udub2M+/cyIt7ss/
         HYFVUsRq8jwp20XU3eh2SachBJaUWrXiM4oTbPL9Ty17QgfijwfgsOpj2GyLee/L7b7e
         PH0Cqwq2bPdArED0kBcXtw6TsMNnixqRjr8QDksOiQ78PJRzQrhrRPVIapNfbHoG6mDu
         VQHQKPG7Q6es5GlekTXsxRDhNZWYX5Pg2zN5UI7zcapARVTnkTYPJ/ldrDk+vNPZ1dET
         buRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753709904; x=1754314704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvKNvOqv2m1Zgi33Q0pm5hDGdMHHffBzRtXS4u2kcAI=;
        b=g+3zLsam7m/qPb3yTUyHep4bCekXgmlkzG58q4vyrX0E8t1s10n3s4wNVv9GkGbTvg
         Ab7wY0vLHaMiER2NsHRHfMaJUVmIsemvruKBKdybrjwDRsi7vTECIZGqg6QtmA+XUAj1
         riU0y6XmwMk2GAavzEBmH7/TwMncQMjmt+mJL1hsZcQbRHImPxwju81LuD5Hu7T1pau1
         TypnhnAPO5iypHpnsoL5VeY8brP9BezISsdYlj22Hfoo8oDOi/Zlt2tLViL75jTI5eah
         Ok7vf1oEWPSKpRWLRyLRYuBIrpu2TsN6xKeEaA9gI1B7KQOtpRYCChcm/vykkCySeWiW
         mDnw==
X-Forwarded-Encrypted: i=1; AJvYcCXeCWZPy6yfsGS/r+A4QrpkO4qhdR1A+BgQgeFml1/vDE1IrLE57ERSx1VfdTYKK7qp0wuTzfDHJt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGDqMa62DVyP3cJtGnhp4Zk9iQjDwbxNUtiVX1M6waT8+dM+14
	F9Z71ZT9ZPtyixq7AM/kZTwmsmeZY5wZG2MCfaW5hnfdRN634IFcv5zsnhn68YdO9Q==
X-Gm-Gg: ASbGncuSk+HA3mSwzYQKPSk2pCNhcvByiBwAYclofTlGQr7QB0j0mz2/9gRC5tHcyha
	4MXUE8QwtotR3evffpI1+58zWl1w8oK8jdw0jfeXQU+giTu7ZpysGcJhzkGiafyLmi8RKH3Hnd5
	QCc0GqFyhZOQJDMeVZbeonO/W9Ymp7LtMjkyxVkaKV5LXpM8y/u6unKAfpuChPZYNNPxkZP3Cb+
	fpPctoDb6SGs7woCXophIB4yUoJFsBwSvWLCzaaXtLMaDHd1MQ67o1e9Ep7fl5tRQZ+QsEAdqKq
	qXWPJ9dRlY0imQSeZnTJ4gC+/N5C6bp69VkqBOv1qUeiBliX8VyrcCp6x8isYevku1yZdk2TxFn
	n8xGiIv49eeeXtjPLtqNmCAx53koO7dNoN4sN/8gTlV8c2TMV41s4MPWFj/7dFAqSaXQPi9Ge9/
	eQ4w2vS3yyOwryCdmzWQ==
X-Google-Smtp-Source: AGHT+IGZNVbveCVttPrv4eE5NtTX2VassIaDqFKbSvCTjAfMEZ3LQD13PMq/8HBYDzkKXlFYFI7XeA==
X-Received: by 2002:a05:6000:381:b0:3a5:3930:f57 with SMTP id ffacd0b85a97d-3b77667ac3amr8796707f8f.51.1753709904033;
        Mon, 28 Jul 2025 06:38:24 -0700 (PDT)
Message-ID: <125c3d78-974a-479d-a61c-96e4c848b438@suse.com>
Date: Mon, 28 Jul 2025 15:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 stefano.stabellini@amd.com
References: <20250725063039.2526488-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250725063039.2526488-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2025 08:30, Penny Zheng wrote:
> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
> a few functions, like domctl_lock_acquire/release() undefined, causing linking
> to fail.
> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
> /hypercall-defs section, with this adjustment, we also need to remove
> redundant vnuma_destroy() stub definition to not break compilation.
> Above change will leave dead code in the shim binary temporarily and will be
> fixed with the introduction of CONFIG_DOMCTL.
> 
> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


