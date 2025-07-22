Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E9B0D264
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051994.1420479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7EH-0001UZ-EP; Tue, 22 Jul 2025 07:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051994.1420479; Tue, 22 Jul 2025 07:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7EH-0001Rv-Bt; Tue, 22 Jul 2025 07:16:01 +0000
Received: by outflank-mailman (input) for mailman id 1051994;
 Tue, 22 Jul 2025 07:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue7EG-0001Rp-Ft
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 07:16:00 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b76b0183-66cb-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 09:15:59 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so3874495f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 00:15:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ff63104sm6357370a12.38.2025.07.22.00.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 00:15:58 -0700 (PDT)
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
X-Inumbo-ID: b76b0183-66cb-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753168559; x=1753773359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T8lNdzEynXUUcOj4vItC/6wTAYbtXu728+Ne1H0ai/s=;
        b=FWvAGtXMKA2jkHy4EVjHeAmAw3pzdZtxZcmzM1uIt4PRDmOp116QsTwGaI9IHpmKpC
         jT9ZBUe3wxeKBLqGG9Yw8tyspTn1munBuSk6Iv2vuiSlgGyVqth9PzJnA+QxECNF6nBy
         2gFunSrpPhGq0uN1VSBXrtDrRqSpabR1/esLDF0Jo+nBopnPJIq9WZwgQpet/3h9KHQk
         dHwyTwTT6b+WPB+Bgd1BQ/3QcBSiM3V5HDHhHC2tzOeoEfEjQ04FtMsxx1bD6NZ/yuNO
         k6+DigF1OHQxm4kTF+Xo6rXF5ZNdNRlFaIDpvpJZr/lJrobF6WrmfGbrmDqc6BgO7wF9
         Dvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168559; x=1753773359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8lNdzEynXUUcOj4vItC/6wTAYbtXu728+Ne1H0ai/s=;
        b=J8PCxqWYvLEwSpPO6nZqnRHvdOz2/isOvpYpTgGh3hTWL+OdwAZTGR2UlxEAMtkfKS
         DG8HejKVOhzbwuoMu9oqIAJr4w+9xmR3Bp1lXBqCS0SGXzIHzNrIkEUkHvpMhln9al6b
         BKNWd2gmEiZ55JNv25yPDdnQKIMkEMzJRstkdupDo2xJ4RNfCqbf7XHRkcFR6NFpjZQ+
         X6DLMJ0UA8GTce6Ke6+PdZQbIp/2NswYq0Pmej5rQ2j7oq3ejK512nNN7azdzUcYTCpr
         p/RwF0X8GNQtEvWNRO8F1oysIk1jIw7C0/NlbwRVtTpZV/oZwXpTu/ch0CgB3vA0cRTN
         wmqA==
X-Forwarded-Encrypted: i=1; AJvYcCUq0/hUdJJO5tbpj4liG1jxKE4G2ERFIl8M+elGKRkXmx1D2SyJIZzlS/Ut3xdOdzFqPoQCWmZGxDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyupNrYdAkgnd3Bs41XXgUMdV47SVXqddfPBwsFsb21dLp55BX1
	6ROreEwPwZ0tH5dKq0MGMM0lO2sYuYjFIdGvjX5DOsfaWjY6xJoQ/yBcfd/UhkKVeg==
X-Gm-Gg: ASbGncukd3kbPKgS8MGDRwg8ldf6yjeJjfBm0E4suEJd5ZE8iqidTnBv2q6W9GeH3WC
	u3wXD6y661qvT9RObWw3izO3lMTEUw8dY7R90NcpD+FVRsHAkLDCM0NvHoqGZbTMXM6OzLRd5Zv
	ytUAXDS1vMhKzLGL4bc/meRvO5ICZenFC4i45bYewc/SUMYL1AA5BFy4zSrSgbFM1GBbplQlmxD
	LW+dMGfiZPzIT4zKZmniExRL5fXD6iRlntLJeORzBz0fCDsCAnhcxWNoWPocw5Z2hR/Wm0jtu0N
	MSamPr9NU11p51zE1W/ZahDNiCzN+BCcYnp+wjogYcYUApwc3PGqbTrm9T8qI9sr703eAq8LyzT
	L7VSM59TUgzZOyyyrX00IQoLgkbSB8MjIZjI6b+lcSbFgBmNd5VvPSKV2hKySnsec9Sct2uJpsi
	3yNgTPJPI=
X-Google-Smtp-Source: AGHT+IFqsdALFLfhvIArvG1BUBosmHrQbQwjRiHnJbP0+Jjym1/kTbTgmPGZzL5Tq0Dv49Wa2kPsxA==
X-Received: by 2002:a5d:5f56:0:b0:3b7:5b40:703 with SMTP id ffacd0b85a97d-3b75b400d74mr5498730f8f.46.1753168558549;
        Tue, 22 Jul 2025 00:15:58 -0700 (PDT)
Message-ID: <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
Date: Tue, 22 Jul 2025 09:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move getdomaininfo() to domain.c
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250722050410.853783-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250722050410.853783-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 07:04, Penny Zheng wrote:
> Function getdomaininfo() is not only invoked by domctl-op, but also sysctl-op,
> so it shall better live in domain.c, rather than domctl.c. Which is also
> applied for arch_get_domain_info(). Style corrections shall be applied at
> the same time while moving these functions, such as converting u64 to
> uint64_t.
> 
> The movement could also fix CI error of a randconfig picking both SYSCTL=y
> and PV_SHIM_EXCLUSIVE=y results in sysctl.c being built, but domctl.c not
> being built, which leaves getdomaininfo() undefined, causing linking to fail.
> 
> Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

I'm not convinced of this approach. In the longer run this would mean wrapping
everything you move in "#if defined(CONFIG_SYSCTL) || defined(CONFIG_DOMCTL)",
which I consider undesirable. Without DOMCTL, the usefulness of
XEN_SYSCTL_getdomaininfolist is at least questionable. Therefore adding more
isolated "#ifdef CONFIG_DOMCTL" just there may be an option. Similarly, as
mentioned on the other thread, having SYSCTL depend on DOMCTL is an approach
which imo wants at least considering. And there surely are further options.

As indicated elsewhere, my preference goes towards reverting the final one or
two patches of that series. They can be re-applied once the dependencies were
properly sorted, which may (as per above) involve properly introducing a
DOMCTL Kconfig setting first.

Jan

