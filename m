Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA8ADE58D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 10:30:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018971.1395849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRoAD-00063u-Hy; Wed, 18 Jun 2025 08:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018971.1395849; Wed, 18 Jun 2025 08:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRoAD-00062T-F3; Wed, 18 Jun 2025 08:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1018971;
 Wed, 18 Jun 2025 08:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRoAB-00062N-To
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 08:28:55 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4463e883-4c1e-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 10:28:54 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so10100435a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 01:28:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365e0cffffsm93944795ad.248.2025.06.18.01.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 01:22:41 -0700 (PDT)
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
X-Inumbo-ID: 4463e883-4c1e-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750235332; x=1750840132; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpxvw8i+JRCZShJeI1r+FrzPafAxEdWvg0TDgLnUWD0=;
        b=CrwqbWJwizWAyMRn/PzSw0kZeEsect12tHjwUpBXW9Y3uYCcp7UME1N264VLoAbbbU
         gVVBsMgQikZ/qRruOB2VRNt7LsZjZkXGyrbbKrJ60T+XsKOX6bH7t0W52aOMFNRewmPF
         PAejzH5fCo7l/lcXLpxzoD0MiWf9INmsG568h94JbsxGThACWLcYo+ScpVEoqS9ir4cl
         2pbqUsPNKzpFmaGBAaq+k6I/7OCiQAqjREA4xIKiUYvkEPlLwrGhYW5dG4vAE+DUS3rI
         YYImPJ4CBH5/GgSl2k2RBA2kXpQ8BaVqAcaF+ksqU8Z+d6qG6iiKPdhuOvNhv/bSJWsF
         nGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750235332; x=1750840132;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpxvw8i+JRCZShJeI1r+FrzPafAxEdWvg0TDgLnUWD0=;
        b=LhIYeXu4O0xzWk00NpvDndREx7esbgBI1TPPg/3ClzMdoyjCL2V7RWcE/hjPByppt8
         Nq1tkpsM5vPcKzg72438tHY52x8SP96m4fyTMqfly84RvKDu4Qx3+dQG9PWso3zG97+g
         0LbKdSGRT9xX8sSH223mdoI+rNMZsmRrIeT80mVTBnXAMm3g4Ny/GpuIZW6/KJRUyP/F
         b4EJBc+1KImRUeqiYR4uVvIHX8515P3b/iJAS4IYndfORXTVqiJX0VCyCe8U899VnWs1
         8rOOfAHGQ4jqbNNDxtl1jSaFJOep24db1GEi81f+P77jbMF0hvMA/T05ALUrDUgJMKHV
         GWYQ==
X-Gm-Message-State: AOJu0Yznta/wc5yXQaFNhlXobdJv4jxWyrf2yBWtgIroWEwPP168oAjJ
	Zk7uyrrhRMC6H/cIqiRJO7PD7Vx29E4EfdowdIHNonSy7eAyrN9+mrQ9M/yqFkVM3p2LF3iuwIh
	BL/0=
X-Gm-Gg: ASbGncueYdNrUpHYseG0mifgZoz8TvTLuGGXA/pPAb58qe4yLDoQxaXYUbuyOIW6v1G
	bcpi8s3HHNZxWXbAyVWWCWeC4WZh8zipF+VIqqQmKGBlZcYHgE9xJ99h/O62INRgtseA/b6ODn/
	dVjfuQLb9mLVist7GiteRe0gEbkCORfqrBi4yt3ZA9j4DkclhhBLzQ64d6LZzNLoBB/7nhixiON
	XPl1hpPCJenSGR6zP5J7X7rjZL8uXj5FdLqr3wwpr5t0LfCr5d3tpKe1bm3fVXX3LeFknsYXiS9
	2otZMjJSrUjAkwI6WC9OCj1biy+TSyOcfyQ9d4iBihiNGO/DqhVx0GDMwbpiD4Jg445JSSM7C52
	l4qrtdEbZJftwKA339IkXq6L+8uz1wNfpv4GcvNm05wv26ZetMGAZaVZD6Q==
X-Google-Smtp-Source: AGHT+IH3AZ2OPnAfPra3LUaK/1dD6GEEVvepeivu8b7/ZzQci5mAFN6jhgJmYgFwnbVBx5yKtY1BlA==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a572e8bfb1mr12246224f8f.44.1750234962175;
        Wed, 18 Jun 2025 01:22:42 -0700 (PDT)
Message-ID: <a48edc0d-6a5a-4410-974b-a4342fee1387@suse.com>
Date: Wed, 18 Jun 2025 10:22:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/build: pass -fzero-init-padding-bits=all to gcc15
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

See the respective bullet point in the Caveats section of
https://gcc.gnu.org/gcc-15/changes.html.

While I'm unaware of us currently relying on the pre-gcc15 behavior,
let's still play safe and retain what unknowingly we may have been
relying upon.

According to my observations, on x86 generated code changes
- somewhere deep in modify_bars(), presumably from the struct map_data
  initializer in apply_map() (a new MOVQ),
- in vpci_process_pending(), apparently again from the struct map_data
  initializer (and again a new MOVQ),
- near the top of find_cpio_data(), presumably from the struct cpio_data
  initializer (a MOVW changing to a MOVQ).

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
apply_map() being inlined is kind of against our intentions, seeing that
it's marked __init. Should we add noinline there? After all post-init
this is effectively unreachable code, which Misra opposes to.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -396,6 +396,7 @@ endif
 CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
+$(call cc-option-add,CFLAGS,CC,-fzero-init-padding-bits=all)
 CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
 CFLAGS += -Wdeclaration-after-statement -Wuninitialized
 $(call cc-option-add,CFLAGS,CC,-Wvla)

