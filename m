Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89FAEE1B7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 16:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029184.1402940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFyv-0004oH-AG; Mon, 30 Jun 2025 14:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029184.1402940; Mon, 30 Jun 2025 14:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFyv-0004lF-7E; Mon, 30 Jun 2025 14:59:41 +0000
Received: by outflank-mailman (input) for mailman id 1029184;
 Mon, 30 Jun 2025 14:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWFyt-0004l9-AL
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 14:59:39 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d756a36c-55c2-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 16:59:37 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so4080851f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 07:59:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57f2770sm9520962b3a.167.2025.06.30.07.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 07:59:36 -0700 (PDT)
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
X-Inumbo-ID: d756a36c-55c2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751295577; x=1751900377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oykwCydEbwnc4wF+hPt542csUxV4rVAvezWt5mUYJ1g=;
        b=TjMRluc8d1qRvkd+H2F2GcxCYLhTPYQrlhDaT/OcB4yoUccHUzuDzRtHRZoIw5/HUb
         OXASSZdOq2gFxCxrTdjfx5sZ3NqC9Zxgo46JguafC7+4CUC+iV9YMTRbxvrDKC6AtgSL
         gWdj/hgIfAOr4IkRvES+WpQoAeaMb/HvDN/eSFSo5Ds66yHrQ6J1eeAZwxEssVXiXFZ7
         kH6VaQKxXvByEl/x7mRBySSfNFXf7GK5FFSw9i2D2wDqkgjEEvTsdYzkbLlyQhFUVRNa
         OMbtROWeeQXd9xSnlfcXeCHWq0/FEfgSz1rMvzTO0uIyUAp5U55mGJMtaDlpO24B4a3l
         qAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295577; x=1751900377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oykwCydEbwnc4wF+hPt542csUxV4rVAvezWt5mUYJ1g=;
        b=LRztYyy5jtWJuFqfQeETM7CfmB9BhzuVgBMpVSd/Au3jeBp6JyIbRDd/glc+cb6klF
         6gcP/nEJ3btyKDMIFN8pRyVX5lk3Jq+MkuO8ztQOodzFhdXgB0DFGIuUTSo9GKznceSK
         kFXzLaZrlK1T4P5jlnb2NgEn9ELuXRrAb6Nqr3w6hOev5lzy/Z8wcL61B3fLkRty8wpM
         QLo+R/YN2Wpd3bazCP28lw5V8wNTDVQL/CBB1Z80gD0BA+Th6BUXYXJdZQ5v9INAIdOJ
         9KAQqXcD/7Kk/KoWeOWnQaCXn9nVPTqxtHqWxWIsBF7MwOnE3JrZQirA/ncEaMiXLrGG
         i2WA==
X-Forwarded-Encrypted: i=1; AJvYcCW17osamQ7xuyyCoEWlz4wssckgwEfstQAoxjxxwmpqQSTl34mZ0eR0uRZ3Bx2OOipZYxIuo7MYRns=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxb5FJ9VO4XvgQgkN0Fjq/kh/3Way7MKHShcLBO04SD6h2EC24A
	y9sD1157aNqSOQ60TByUhaE1OZYia6/FBLPuZobE9PsH2zKNrDop3VPPi7ioft9s5A==
X-Gm-Gg: ASbGncvAeACwg94wpfjGNFZpuOv4JTUIVk0ATVwxn6F8TFaZKA4EC+uZWUiCIEmUU5N
	hOHmThhJgoSXX+CETNNKsEWh+snd5iz4hdhY/yvRYb4Su5+Plx1sBh8uNR5NL5TlmWV3pzmdfKH
	Z58xYii6gdz0thoKjMPUVFI7wBnKCEXT5Mnw064ulcfmId9x1luQilvuR8EBFj6AyIqqHswBpNa
	bdv71ZOsFVMn9ePMx6P3Xm1U2R7EMPqfMvtOWAZx4be7CC49OB5sFrwiFmGFBiyzCB0ymUq9ejh
	KkjytLsVYxmB/ToxCM/Rjn4dJCLX7npQf0wgpisWqvrXpv8EBoeJwrsNq+VVGBhpuSrZm4cO5Zk
	afbf16vqGeYUkj9W+VDPcaeUmt5g57auHT1vTSuH4uW69OLE=
X-Google-Smtp-Source: AGHT+IE5ZkWvG9JfWkqjyGK6DaFEKYkVG4Zkjo+WVgEOS6/p8cuRYHgfDTgDusYkFhtr0fWYzkSu9g==
X-Received: by 2002:a05:6000:dc5:b0:3a4:ea9a:1656 with SMTP id ffacd0b85a97d-3a90d0d6d1cmr9164228f8f.10.1751295576642;
        Mon, 30 Jun 2025 07:59:36 -0700 (PDT)
Message-ID: <dcedc8aa-35cc-4a80-a2a4-098a4bc6db53@suse.com>
Date: Mon, 30 Jun 2025 16:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] xen/riscv: implementation of aplic and imsic
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
 <47ca7a83e6320547378bb8bc690f5309a6eaf53c.1749825782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <47ca7a83e6320547378bb8bc690f5309a6eaf53c.1749825782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:48, Oleksii Kurochko wrote:
> Introduce interrupt controller descriptor for host APLIC to describe
> the low-lovel hardare. It includes implementation of the following functions:
>  - aplic_irq_startup()
>  - aplic_irq_enable()
>  - aplic_irq_disable()
>  - aplic_set_irq_affinity()
> 
> As APLIC is used in MSI mode it requires to enable/disable interrupts not
> only for APLIC but also for IMSIC. Thereby for the purpose of
> aplic_irq_{enable,disable}() it is introduced imsic_irq_{enable,disable)().
> 
> For the purpose of aplic_set_irq_affinity() aplic_get_cpu_from_mask() is
> introduced to get hart id.
> 
> Also, introduce additional interrupt controller h/w operations and
> host_irq_type for APLIC:
>  - aplic_host_irq_type
> 
> Patch is based on the code from [1].
> 
> [1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7390e2365828b83e27ead56b03114a56e3699dd5
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Just to mention, irrespective of this tag there's at least one instance of
comment style to still correct here (along the lines of what I just said
in reply to one of the earlier patches).

Jan

