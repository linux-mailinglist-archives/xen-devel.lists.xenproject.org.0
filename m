Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6731CA9C935
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967946.1357666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8ITc-0000N1-Cj; Fri, 25 Apr 2025 12:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967946.1357666; Fri, 25 Apr 2025 12:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8ITc-0000KK-9U; Fri, 25 Apr 2025 12:48:20 +0000
Received: by outflank-mailman (input) for mailman id 967946;
 Fri, 25 Apr 2025 12:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8ITa-0000KC-Qm
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:48:18 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ed304bf-21d3-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:48:16 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so9583965e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 05:48:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5cffasm2279286f8f.96.2025.04.25.05.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 05:48:16 -0700 (PDT)
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
X-Inumbo-ID: 8ed304bf-21d3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745585296; x=1746190096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IFJsEFyMY4lr5rGy2zN5KfdVgZbEMiUuALH+7SWEOAQ=;
        b=COPpQe519N0dgPkKimnRLcIECmXBUtOyFyMHHuBbZye0/e5VsRodrUXV/xYw1bM9hL
         rO4WEx6FW/xNEAupqIk4HJ//pLVsghjdDRkFCv3dQsuqBGMSK3XnE1OTrhQYoEq4NOC5
         N2D7OdGgqvJ+9kQMOMcnOu9X27KBGPu5rnH1qewJgmF37oiT+OYE+TY1xwEbiShh1yfl
         ugORwypBDn/u7YM8e1g7v4fo0nQzPutpDyEmPlLbFLb59r6DN8oI20AV93QLeyiywxdu
         2WxP9LLNuTEqxQq0M42AA4pqzCfq32hXQ4tzPOVzrQQ49kAtt07/xmE1bcAi2WK8D9Ps
         h6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585296; x=1746190096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFJsEFyMY4lr5rGy2zN5KfdVgZbEMiUuALH+7SWEOAQ=;
        b=xM21PBr1L3bwHXEc+YEGGAS7QVUigbOXg5O+2lGj42KDiRP/RBtuCPZo6I8rQr7+MR
         wN5RicsMYbkoYSG1a51qrNcAAk7LoYK0zuetWtqZtTWRCKIv0aGRAjLKFPP3AEbauKxK
         TxLBo2yywlPmOyFyXuYiaCxEiBigWp50pr0rNUIQ10TbgBmq6i+KDmzU4YWrH0iS9qkX
         /mPJjcwA97UBF2R8YeGnEq/K2UE5AAsKZogRnjacXksSVMLFysykoq016f0oldJaLh45
         yye6CML2Kb4WtAr+exViFUeWbxaMFgbxjIBECWk2Uxyr4FArkiG6oDw5WliU+of+Bs65
         A81Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdXiZBcoofjZJZOAzjgqDZJrHeHLjaqkQjA1yt3r+rkzL8yHmXRCx1cBFN+laNCt6ij7bXlNBjnk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhvvpHsfA+iOuBGv6jfMO0gmugFT2Bm33dr0Gyxko9SEeSUh7B
	RYsgktTL6AFbf6fmdE37iM43zxd2KAZ1hzn6aswLLa2SxtprK7P7Xa4mVlWKqA==
X-Gm-Gg: ASbGncsKo0CsGIn0CuFGX9yDit/sn9ZZaiN4beaba5x5XG4pBWeYqTvzPR+wIeqr6iZ
	Cr4ZQEdjmRQBAmGGZYrz4c+QWQLM7FYXoa9AikdnYpza9nipWTRzcVaZ6i9RX0+xQzjag5lwTYk
	+qFeA1hKU7TJs8Y7vDoq8Lz/xT0wzPrhjG21cUef/BJ6FYt3B0e4TYhYv9iGg1Rnr+yz0WpRKEh
	3FYQZWupheBO12DwatMCaQJuzGpDMIuo7GtoX5gB8vE/grc+IjqFlINlr7XZjfmcRPcLRjCf9Pj
	gD96MGtpvNDN9lMoqimm3OlO/vsuDZy/GC99i0nPT1r/tBQL6wRFzZr9jpYpvNttpaseEylaQoN
	n3oSvSCiydFESdB9L5zKx5d6Rag==
X-Google-Smtp-Source: AGHT+IF+xy2Lyv4v4sCbFfpnctAcZrSPjA+tQlpvinX38olUd1p+A62Ty1UjxY+Pg8ed2RXmP3DBuQ==
X-Received: by 2002:a05:6000:2409:b0:391:253b:4046 with SMTP id ffacd0b85a97d-3a074e1f465mr1936735f8f.16.1745585296389;
        Fri, 25 Apr 2025 05:48:16 -0700 (PDT)
Message-ID: <e5c6b448-945c-4c93-a3d6-e6e598102c2b@suse.com>
Date: Fri, 25 Apr 2025 14:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250425112415.245585-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2025 13:24, Andrew Cooper wrote:
> The type used for pagetable attributes/permissions is currently unsigned int,
> but needs to become architecture dependent as PPC needs unsigned long.
> 
> Introduce mm-types.h to house pte_attr_t.
> 
> Given the new toolchain baseline, we can use __has_include() now to remove the
> need for boilerplate on most architectures.

That's true now, when it's just pte_attr_t that's there. Memory management,
however, is pretty different between architectures, so I wonder if in the
longer run any one will remain that actually can use the common header.

Jan

