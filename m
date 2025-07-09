Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B38AFEBFB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 16:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038308.1410804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVpQ-0006v1-Eo; Wed, 09 Jul 2025 14:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038308.1410804; Wed, 09 Jul 2025 14:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVpQ-0006tI-Aj; Wed, 09 Jul 2025 14:31:20 +0000
Received: by outflank-mailman (input) for mailman id 1038308;
 Wed, 09 Jul 2025 14:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZVpO-0006t2-Pv
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 14:31:18 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f6bd0f8-5cd1-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 16:31:16 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so4347899f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 07:31:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84351a69sm139776925ad.63.2025.07.09.07.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 07:31:15 -0700 (PDT)
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
X-Inumbo-ID: 5f6bd0f8-5cd1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752071476; x=1752676276; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jtQ1qyL9kxn8kybtovypFvUp7ltM6kwqf/1KsfDulas=;
        b=a7PlUkfr9kL3i5Tlkds084OnjmlOuA0VyLHm3H/sj04GsjwlMg0HL7kCqlRDXud68k
         VpZ4QkDRhyAmYlAo0zZD31vo7zXAdxj+lXBTgkeISR0FA5oEnHRuO/l9/xxLW3fbooRl
         PEHTQDsm40g/nzZB+JtxDrq64LL5cot0p0UsIgNI9q7E66UG3ts/3+d1q+OJwN1ovGjH
         xLTdjdenQQF/MpbvOpsJ7Wfgde9hMCmSGZ8LPjfn8rQiaCtRYr0WCKMHf06qpC+sEzLZ
         nP5DZ1gzPbxgFWmO3Sonn4LPwXRhSeCduoZU6YLpGTvk4Ojzx4893/EfbY2MYqy1zpeh
         o9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071476; x=1752676276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtQ1qyL9kxn8kybtovypFvUp7ltM6kwqf/1KsfDulas=;
        b=ZRJN7Ps/IWv7Xdlt1hr30obH6ieH6fb6TjLS0fA/UI40cjQolJZy4zU+5jSX1rYPz5
         L1ByrzHNGeKNwJ3YwcizQlhKo8w+jUGA8eCExIut+WOE926uhh+mz6P0yPfNrYOwr7LL
         TBcLXQOuGhO+GiCcZcP/j106REtK9f0nqz475INSxfL+lF7zGWoppYjs6Mt6z1OvD5XD
         R80vWB0sHEr642/whGqZK2045iqL0aRolaV5VrlUj2KasRagSyC1UQO533JphNts5J5M
         yfZFlqCfX2guia9dWOgi605UADpaIXSoUvOSCW/I51n/gnF4WiXL9EzhiV8zaVpz6pLY
         7zew==
X-Forwarded-Encrypted: i=1; AJvYcCUa6/KByvKMqFXDsRpqz3+rFbK54MMPzeu9Rzr/T23s/F+ViTNcMacl9rkYkKoHBly2zkoUUDhRnX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd9hFC0fwQ3CaNcGDYlI+4IgqWU4LDM7WC5FFCGeA1/qaC0n78
	ZUlLAKRGlYOzao78JlEuuDkM7pr49//9NyLmIAij+ZY7i27TVLDEGANyAAgQVZfrNQ==
X-Gm-Gg: ASbGncsBvNVMC/J6AEqssItDOY1FDqRUBUdsvsRTc9uArAf6TCw2Cj3UPa+TNUfhE7q
	iw/iHUT1qVKhgPez8BSWD2azH9GrgzJouoeCQD8BYz7P59g/Im3ZFRl4nAlDHnlllFboRsbarWF
	zAxxL6u7+SPscbvDXzYHlorGJzBrEvBZZgg79S5UA+q/wVH7vYA55NgBNH5p2+ow9GdIG39Rpwr
	5q5sYX1gdndT3YUI8eUKxcnE4aGx0YQpHDzz/QpmHVOFktk33NzDiiVNhryKe8ud7yJNp3Avdfg
	Y8oCptqT8dYvR/ADgeDwCKBF86joNLG9n+WoKuaM5kifbz6lB4FrkGWbIIgB6yTSqQMFxyn4Jo1
	YwMMH9NRb1Q7a9sECVPpPbG10+sGp+MM0Y1jPW9iJTdc5HBw=
X-Google-Smtp-Source: AGHT+IEm0HhQqyd1mqZHRIhYpQ1SOvvA/XojxlbV2Z3mGz9QrDmZg9DySBNF6uPD60LJzJUn84h0GQ==
X-Received: by 2002:a5d:5f8d:0:b0:3a6:ec1b:5742 with SMTP id ffacd0b85a97d-3b5e44e6a71mr2199104f8f.22.1752071476208;
        Wed, 09 Jul 2025 07:31:16 -0700 (PDT)
Message-ID: <43886f97-a243-4109-b072-97df06a882a4@suse.com>
Date: Wed, 9 Jul 2025 16:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/11] xen: Split HAS_DEVICE_TREE in two
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
 <20250708180721.2338036-10-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250708180721.2338036-10-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 20:07, Alejandro Vallejo wrote:
> From: Alejandro Vallejo <agarciav@amd.com>
> 
> Moving forward the idea is for there to be:
> 
>   1. Basic DT support: used by dom0less/hyperlaunch.
>   2. Full DT support: used for device discovery and HW setup.
> 
> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2) and
> create a new DEVICE_TREE_PARSE to describe (1).
> 
> Have DEVICE_TREE_PARSE selected by both HAS_DEVICE_TREE_DISCOVERY and
> DOM0LESS_BOOT.
> 
> Add a dependency on STATIC_MEMORY for discovery, as it relies on
> the memory map itself being described on the DTB.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # iommu


