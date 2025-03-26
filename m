Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B28A71A12
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927971.1330741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSYa-00044N-Vj; Wed, 26 Mar 2025 15:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927971.1330741; Wed, 26 Mar 2025 15:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSYa-00042u-SY; Wed, 26 Mar 2025 15:20:40 +0000
Received: by outflank-mailman (input) for mailman id 927971;
 Wed, 26 Mar 2025 15:20:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txSYZ-0003zf-SG
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:20:39 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deff86be-0a55-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 16:20:38 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso74660255e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 08:20:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9957efsm17372290f8f.14.2025.03.26.08.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 08:20:36 -0700 (PDT)
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
X-Inumbo-ID: deff86be-0a55-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743002437; x=1743607237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BrLD+oMALWIuty53zw1ovJPHyggj7Vf9MDFnlZCW1e8=;
        b=QVb7/wg2hZgefm02gkk5M8iVWGOFfNFY8VqPpfmE2tsVt+BXdL+QzeRzSQwUxtkyiy
         ycx6WOJuJbJ/ROlOFo0uUJLCnn8JY4xA0A7lc4VtDocL4NC48cv+vdwDxAd+4J6Hp7XA
         +RDHvXrbZQnILkvOuRRqArmB0w/G5yjc6pm+6Mcv0zuqUCmDsw8QK0XcnraL69FiMFBN
         UmavVyt1U38eIl+bLur4Sx6JP4rrpzlT/hV0vmvIMCG67lcGj9QYXlbsGRJSNWcnSZYk
         Pcsfb2NKDORdOIkXaFqltGqTFAmSG07eVYugp8l7sR7ASb+Mbhyg/441FIM54XBZeucR
         AU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002437; x=1743607237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrLD+oMALWIuty53zw1ovJPHyggj7Vf9MDFnlZCW1e8=;
        b=oTko1nB3j4FuPLSsyW/kW/UK1SRjJ5dEDHzOIdXB8iuWdePVrjcIDKgu20pZ6UHYy/
         CLPCXZPfceEWv3ujmLoLufIjERyj67RjaIwFsyujxEk+fQkBgqdgMN/dyO4yxYSxt2+n
         CIF0wWzSGU/AmtIyGCjjGJI30Mr9DnEyks/t5mv2j53lRw5EDuKEed3ZQMv+QmpyKgIr
         UK44g/jMiKfv4RotBxKfjWpi6lyVywnN9X3v4QnL4CyXIDgQXInD+qn+phjAHOGv3yOH
         zM/nToY+isGTDQAPv2yjDT5Pwu3DE03/6SnwAv0SFFZ06MvSb5smyaTEGgMgYhuVvu2C
         iOsw==
X-Forwarded-Encrypted: i=1; AJvYcCXLrXATconmqYHfgejsPlhafIJ8T+EoQyH3Wr0QbZ5mhzJalF42OpJq6xHdQEK1Aycif+OYIWFa1Lg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcu0FiI8/bHMfMauUTAzgGmlgyoC2Ge0Gz0hHlCVXyCpqiG1Cv
	m7fV480tGDv+AIfpQdIIOunQ9kQZ9FjAFjEJLN1FvmwOMES3Z2fsRerhM1Lc2w==
X-Gm-Gg: ASbGncuztPU/iGq/viv4xW5i5uomXcTrquwMfm9b0zyrGtKg9WCtrfsDGhc9frfvr5L
	o4CGIhE+AHW0qupymnourx/nwkxJEc0v1Y/1lj9mowkGxcVULkoBZtJnss/2u0gvY0//B9YWZ4s
	O+HRqmVuZKEzMXYi+Ol25eW5VPNMCYAD/aMHKbgfkV3vRfLwO+MA8TBrS8Tmu7d9XlWz/rs1MEQ
	eTZX+DlVX3ovQCQFq3L0gkuOIDty8Y49IX/GhfXB385K+xclk0s5lafAI/yv31xkmj+CUl1j8FR
	EE+inZQN0MU/9c/Jx50ZZayZnhFvB3RJQDEF3w/8EyLQCjeeXypeUBnTOoa0Lt9I+Vp+DwxQKgG
	roTBNdX3jZLA4VtMPbThT15Jm0tithg==
X-Google-Smtp-Source: AGHT+IEf6zI/e2wjthM3LFw9+WltV2w9aX7RtRpR9JgT5tHG9G0STC9z++CUhxJQNk/nMp7lgJXhWQ==
X-Received: by 2002:a05:600c:4512:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-43d509ed936mr217454295e9.12.1743002437295;
        Wed, 26 Mar 2025 08:20:37 -0700 (PDT)
Message-ID: <dbd821a9-2094-4193-bf76-0904fad0fdd5@suse.com>
Date: Wed, 26 Mar 2025 16:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/riscv: introduce intc_preinit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
 <eedcc238a88ca10e9d1733443d8ec07832e4e33e.1742918184.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <eedcc238a88ca10e9d1733443d8ec07832e4e33e.1742918184.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 18:37, Oleksii Kurochko wrote:
> Currently, only the device tree method is available to locate and perform
> pre-initialization steps for the interrupt controller (at the moment, only
> one interrupt controller is going to be supported). When `acpi_disabled`
> is true, the system will scan for a node with the "interrupt-controller"
> property and then call `device_init()` to validate if it is an expected
> interrupt controller and if yes then save this node for further usage.
> 
> If `acpi_disabled` is false, the system will panic, as ACPI support is not
> yet implemented for RISC-V.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



