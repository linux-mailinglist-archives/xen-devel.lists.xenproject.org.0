Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C3B14C74
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 12:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062398.1428053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughpZ-0004vD-Li; Tue, 29 Jul 2025 10:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062398.1428053; Tue, 29 Jul 2025 10:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughpZ-0004tC-Ix; Tue, 29 Jul 2025 10:45:13 +0000
Received: by outflank-mailman (input) for mailman id 1062398;
 Tue, 29 Jul 2025 10:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ughpY-0004t6-M1
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 10:45:12 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19f53756-6c69-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 12:45:11 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso4924660f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 03:45:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f0ec93069sm3346569a91.37.2025.07.29.03.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 03:45:10 -0700 (PDT)
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
X-Inumbo-ID: 19f53756-6c69-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753785911; x=1754390711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ym+Z7wkP5KNd5hdh+CjElt7xSFduYPpc3xjLbs4w310=;
        b=dwQkqkHVXvyJLSYX+9yHylq1sN014zmEFtzrwR2F6yWXD+VQAPKNWi+ztbCBpNzk9y
         F3dyQImq5VSpaz4Y6Zn7dxbaYJ7MJ8lW+7f8RiihHkpMUrcK3L36yVFmJN8IhlvAdtMm
         xvR4r/u8bcKDZ2n+mU8Q33yGoRSVh5IYcDuYBnOl4hj0eBI5YxpWAVnlKTTsfs/ZlXN3
         S7BV4mbUb3UCDewHja7nZxyqzBzG3aj4TZtu9U3X5sHaXrlVSvb8j+6AQuLN4F2z07Yh
         bAJVlpqMhtQ8k94mpH9PinPRSaOv3hRjzTgXR/Gr7MiAK5+z0B80LwllWZyeXNb59/Tv
         XDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785911; x=1754390711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym+Z7wkP5KNd5hdh+CjElt7xSFduYPpc3xjLbs4w310=;
        b=Iu979MPplshii9xm272SuSwyQhGMYbMU+ctce4EiuOAVuNkCiMC/LhZAKl5+o9FAl1
         1MXmF3mI2B+NdWvEFr90fA5L5yUjrjgPnKw5W2IlkwCLCAImJqyIXkvTeoFsNdVL+ah+
         pdI11e2BR+V9IZ7h8WnkKAf+DtID3yVXaAPoVtI+cY+xOGaWWHYjRkY1z2k26Z0D41pk
         JeB+XZMP0gCtQQG/eq0qxG+syJ49Efn8cyU5yp1Ffuf9w9JksRZNwrYgvnFVWEPwUewH
         VRZjXNbXsEzJUO/sR2SMCgSMDusdpQO63x+WB0zgtxNEuiJ1frqdYs2ZV6XPCZoBX4Z3
         w/UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh0u0C+Dukrd9Goj6pYQHofg6CRLbcdP9GPvitdZVItKbLSZkZfa/fI55SLkT9Gnmpj+6eheE0XtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7Txat9V+hgumG44yx90zVs93FnHEP+nzN+FLXfJP/mcBBit8b
	gYig4Z8N8HMmACYBio52r9LPLAa+0D8t71PbYJhySoZhtzyTv3hSifTjc4f4EaXQVA==
X-Gm-Gg: ASbGncuxHT4GugaScnpG9hwUY87I9rNc/o63FQviz3gi9k0bG0UXX4TTpwhMPifKDu9
	0U/SUJIaDRZrADWUzOZUXlIPkbV0/cxhCORsqzJnxDQmSHJ8SeLxM4AsPw8CbHHBwgC7zN2Z3fu
	RGf1ql8ak/La6d2kxta0OUu30YVjagyJBlLoohr/LiPKo2wQMhF0AhQrHBjxSDqbkXLmDelp3xK
	tEySdSONSva9qUjaRMhr151cR7wVmsYqmsQ1OPfxB1O4RhaNNJi4bzUfdj2s5QtSBgrYI3YP02J
	uOWFmMSdXbE6Kmx5dvvw/S8rLEJI0JXbamlOieIYdJbwUcYgCH4QslHBaoWCx35IdQ1U5Ukxjrh
	WBo3j9dnsXg8WVWYdDEhA75t6Xu6uOhzuhjnHR+IBM6/Nym+obdQddt2hbTZu6rhcQNLOrQcgn0
	FUR8vrDZg=
X-Google-Smtp-Source: AGHT+IGZ/QbR08JiqwvKs2uwYnM07813yLeXI8gMwYW4zL74uq2/jngJLJQ1erFaJdnvbOEQI23hog==
X-Received: by 2002:a05:6000:24c5:b0:3b6:1989:7199 with SMTP id ffacd0b85a97d-3b77667585fmr10977406f8f.45.1753785910760;
        Tue, 29 Jul 2025 03:45:10 -0700 (PDT)
Message-ID: <ba091eb3-f1d4-4786-ab6c-c8636628a0b2@suse.com>
Date: Tue, 29 Jul 2025 12:45:00 +0200
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

It seems pretty clear that this patch is what causes

ld: prelink.o: in function `arch_do_domctl':
(.text+0x5b85d): undefined reference to `paging_domctl'
(.text+0x5b85d): relocation truncated to fit: R_X86_64_PLT32 against undefined symbol `paging_domctl'
ld: ./.xen-syms.0: hidden symbol `paging_domctl' isn't defined
ld: final link failed: bad value

throughout the various build jobs in CI. Considering prior issues I feel
urged to ask whether you actually tested your change.

Jan

