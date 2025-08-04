Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C00CB19CD8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068858.1432719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipqK-0003dn-Dn; Mon, 04 Aug 2025 07:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068858.1432719; Mon, 04 Aug 2025 07:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipqK-0003bP-AE; Mon, 04 Aug 2025 07:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1068858;
 Mon, 04 Aug 2025 07:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uipqI-0003bH-U9
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:42:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c8834b1-7106-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 09:42:46 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-adfb562266cso658753866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:42:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a219ecfsm692729266b.94.2025.08.04.00.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:42:45 -0700 (PDT)
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
X-Inumbo-ID: 9c8834b1-7106-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754293365; x=1754898165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nUV/OspnpdUEhNBy8q0/kDN0riBTCkRUEONT43aOycs=;
        b=VUR4JytaaiSYENfe6KgQVoE7zUNVaL06zYAMVOqifMw8q9BSUEW42I8GpH/SzacZBo
         e+KGFMSY411QiP/+IUt2xeawsIzCMOpbUi9s4+hXR5fyXvtyjbJwMKnldo9SB2WeWn1V
         PgBADI57uV30eqCfC7YV3CjYteWwj3+kMvscEZZLK2LiP13o50im9t/q7/mFwg2bcujG
         LmPJGwwlPzB3O9Qw6Qzppzc4Ds8bQ+2BGIhJ/4HKb0sJ/bdd07doFEB4yQnUuKcfKvg5
         5Grdm1GNdctj0tJ1jAjdqbT1uJYkVBvg3vNbva7rjetioeS4BYIyjZJRLp5xq/3d8miQ
         N6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754293365; x=1754898165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUV/OspnpdUEhNBy8q0/kDN0riBTCkRUEONT43aOycs=;
        b=nW5p7TvGDFFI+R8ScIfQW09Jrmxo5tWFF6l1LHLmR4t55fmTMa9rk6KuiPTsVqJq8i
         lY96Hcx/NFLpMzimUXNMBChXN22s+OOHX+6/Dc/AE9Mk9xdfRC4kGnNoFkTR+FWG6TTD
         kTpTiRTFnsvoe0zlXViaW9E7qEiZxcybugKaCa1+HVm32aLVHG+KYH3aMF4CxLl6d5fm
         Mpjgmahk0YdCMK2XzYvwdaDYARDme2zCVs/ileqiuPMmFphnk2TUNmieMSylb9l02z8E
         457s8pg6PVkLr/SFltAsk+axjiA1ByzicB8n6d/BUApOlWTXNSWTUSPQoXIq6mbLONVc
         UdEw==
X-Forwarded-Encrypted: i=1; AJvYcCVsZaZ0NxzeEQY+LnL+g+3svHpzngvswBO/O18t4X+tERh3eq2Vh8Jo6T9cg0iC5OIwJwkUZU3QZ2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFdgdLfVsq02kyt52tFmwE1ejv+ewNcpyn0ybHm7otlYvnOa0w
	fMcnQC7E00be2x08FwDh7gCrhA2IvhdUSs2I7HBXHbMVbYiY/oza/L9+eLFJ7I/0CA==
X-Gm-Gg: ASbGnctt2UtKS7l//PZZJQDIf1qbhfJIeuOLCJ7Sa7kM4ycOMCS2oLig7to5cx67p6l
	pB+nv1nDygddganHKXtcRl3H6tuZ3y5gjrcvj4AvUGrCM653BB/F+5W5jYTLTFUJRkyqpIdur+1
	X78b2FVXvK4H7+Q7/gJOzZCYMgNtmsMbkFDh+SrX3FKIFsYunIRqlAVlxDbyC54ygxYURcILyga
	BAlGNAdSzgvI4+W5mkcIlmoAFD92UbHVxOUx1lwo++bCf0QRhSwHdjJvwa9z7d7IA8VThUMSvyu
	Rp/n59I7rWJKU3Ndp85I70qElh+MfAheeEtNhRF8Yqy1gVjboAmJO9u9MpOycT19PGaPBY9KdPn
	vSnESY+nGnDHb2Fyu1hHhfyHJi8Eh/46OIYouUJk+vi/xOjvDI0ygYew5U8V5RLq88NujgtUAxe
	Rf7t+h+Mw=
X-Google-Smtp-Source: AGHT+IFOjux+LYfVhIt946IFpgEfKVmjOypXuRPto1LcwWRkHq4CuD5v+mgTKbcdnfX3BmRWfvuQBg==
X-Received: by 2002:a17:906:794a:b0:ae0:16c5:d429 with SMTP id a640c23a62f3a-af940248c62mr846235166b.58.1754293365330;
        Mon, 04 Aug 2025 00:42:45 -0700 (PDT)
Message-ID: <371bc812-acdb-41ef-950b-3c9e5feea48e@suse.com>
Date: Mon, 4 Aug 2025 09:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/25] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250803094738.3625269-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.08.2025 11:47, Penny Zheng wrote:
> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
> a few functions, like domctl_lock_acquire/release() undefined, causing linking
> to fail.
> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
> /hypercall-defs section, with this adjustment, we also need to release
> redundant vnuma_destroy() stub definition and paging_domctl hypercall-defs
> from PV_SHIM_EXCLUSIVE guardian, to not break compilation
> Above change will leave dead code in the shim binary temporarily and will be
> fixed with the introduction of CONFIG_DOMCTL.
> 
> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - remove paging_domctl hypercall-defs

And you've run this through a full round of testing this time, in isolation?

Jan

