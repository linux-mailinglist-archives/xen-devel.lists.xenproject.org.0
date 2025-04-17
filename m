Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F280A921B3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958134.1351084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5REG-0004ee-9x; Thu, 17 Apr 2025 15:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958134.1351084; Thu, 17 Apr 2025 15:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5REG-0004c7-7J; Thu, 17 Apr 2025 15:32:40 +0000
Received: by outflank-mailman (input) for mailman id 958134;
 Thu, 17 Apr 2025 15:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5REE-0004bz-E8
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:32:38 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30631950-1ba1-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 17:32:36 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso628769f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:32:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c21c61sm236356d6.109.2025.04.17.08.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:32:35 -0700 (PDT)
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
X-Inumbo-ID: 30631950-1ba1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744903956; x=1745508756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBrsL2wVw/vZseBqguFB9TIgJIzVN25yiOiPPaa3WYc=;
        b=DgAcHWflgrUyfGTV/HBGVKiy2Ehorn19fXJKPgBZHULqqwrL+oxX01Xz3Fn3LD6SSW
         oX/qwIQ4brTuEsnBbjp5L8RfAoskajGDY1rE280KLHHohhR611ByACpT3jFfKeKtI0ys
         vrGmR/DCOhWPrEDjlz5vol4AZYbvy1f91bAHYVqdhuxoTQ3c25aqYKDp94DvZEXIQlhT
         QZAygFOUzHv5bnP/KVXGQ74rFUWmTIShqxdi8aqWu/oX9M1P1X3aEBex8rjEklqrvh5a
         v4T1tb3hIaQlnyPhL5HvOPQzFfcHCLyFd+IF/1x/ocKuRrzgx27jLyoTod2Yx0GSMt4w
         iU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903956; x=1745508756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBrsL2wVw/vZseBqguFB9TIgJIzVN25yiOiPPaa3WYc=;
        b=bgAZOONerKWPs7SzDN+fnXto94DmDJJTjuggvP4q2tMQi+jg0ONkb95caKQMNv48UZ
         VvNGOcH5xlwmXZKxwwWsf0wOlvKAr7LZH854SnLtN1qtAF4bPkkwDyumRfOcpDzh8FDS
         Zze3Z4FDkVwHYUTrZ82N9XlQZJteCDN83REqrsSCNhDqYIMl74CO61AKyygAtlqXRYkd
         rwMI6z4SrlfhG9/4yisUi/2i/l8cSbXzZDF0REYkuyOVs3+LgzyR7pYWdJW4jq+9+BRu
         5j0aQpfUtRIzx2vq3dFUlo5QSB7E9fSOkG/O2MFiM4dEPVqNFKQP+9WcgtTBAofUALV7
         Z6iw==
X-Forwarded-Encrypted: i=1; AJvYcCWTgFSbIBJCZRB5W7h65B0w0u8GTnAoC/QKWvMXAyRGBlvZcZeqAbpVgEIjXUwB/XomP0p4qs5+3Ys=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3AX8S9n3j06COG39IV+8dWc6gVxUQEWvgePMzbVaOSgo5qcFk
	IwtKk/e47c/KV0KNMsQ7ghCWAeQdPU5I1SWKtW7gCHr0T0O4fbFo/KwY7LvpYA==
X-Gm-Gg: ASbGncvmbfU3i4M9FbY0DwYqO5vK3SKHJCKmRvjsDgfbUVPKWUTiiGsQoALd1yWQAUc
	IM6hpQKfL43sV582F1PwxLGwWtZcKU455JH6SpvmvzdiHw1ktIvycNpXbUvvdnfrz2YDEJSWeS8
	Xp8J8/zwSiDVZoJIBEHaAr3PXtgOkYbQq2IyeTYSNRMXSKQMYslUS8P+3afyEj0ygZNS/LQliVt
	TK8e4M8HLONkO3avu29fXf4cXpVU4DZCiVSy5WLSpnukqM2Pu7++9t837RhVbPTZyZheKi4LOrd
	zrtyd58tosxdu5UJ/Y61m1dTzrZCvI7cznCxBCyPBZ0HeVF4KnwY7Jx5ThcYde4tspXTx1dDdxe
	ADbGwk5GwMDF823EphocepxeqKw==
X-Google-Smtp-Source: AGHT+IEUot5Rn4K8oA+wDcuVm3BER8FxURR4y/IuemGBXCRymmnDb6evtIOLzCEsW7JakfKcRmNuZw==
X-Received: by 2002:a05:6000:40cb:b0:391:4559:8761 with SMTP id ffacd0b85a97d-39ee5b98edamr5653890f8f.36.1744903955967;
        Thu, 17 Apr 2025 08:32:35 -0700 (PDT)
Message-ID: <dfedd638-da52-42f5-b130-ad8f393c0659@suse.com>
Date: Thu, 17 Apr 2025 17:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/io: provide helpers for multi size MMIO
 accesses
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250417152514.13702-1-roger.pau@citrix.com>
 <20250417152514.13702-2-roger.pau@citrix.com>
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
In-Reply-To: <20250417152514.13702-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2025 17:25, Roger Pau Monne wrote:
> Several handlers have the same necessity of reading or writing from or to
> an MMIO region using 1, 2, 4 or 8 bytes accesses.  So far this has been
> open-coded in the function itself.  Instead provide a new set of handlers
> that encapsulate the accesses.
> 
> Since the added helpers are not architecture specific, introduce a new
> generic io.h header.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



