Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A350A79065
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 15:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935732.1337126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyZY-0005Gb-Qq; Wed, 02 Apr 2025 13:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935732.1337126; Wed, 02 Apr 2025 13:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyZY-0005Db-NH; Wed, 02 Apr 2025 13:56:04 +0000
Received: by outflank-mailman (input) for mailman id 935732;
 Wed, 02 Apr 2025 13:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzyZX-0005DV-Cb
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 13:56:03 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 368bc8b4-0fca-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 15:56:02 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so1790784f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 06:56:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0d1sm17039553f8f.70.2025.04.02.06.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 06:56:01 -0700 (PDT)
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
X-Inumbo-ID: 368bc8b4-0fca-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743602162; x=1744206962; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZX3nFh5HbaqnfPwak8MkT9aP3MsYz6LqGQBNR1uuhiw=;
        b=E212LmGvxSFgZO5mblRrXLGQqDsuEcrAglb+pBxV0FItgHl/BxJCjPP5rjRhCkzZIS
         jh+d4S9/l0vHxLosyPvCsWdneu1zvsuJpKFNVcusx6t1MlxuRm3LsTs8bSePECOHkrCu
         EMmu9Sl1bqFcQ1A42fYRAaKJhHyfZ2LUgq/TTIGWCqgdLly7LR7gxWJYTwRy34M5W4/6
         kFEQ02ewlfvQwttFOv3yrsRuDdwx/+Isf/nE03y3sCNZ6W7TjWkTjaxEGgM8nxenyksl
         Y47jeLFN7evY8G1cXUYPUUZke6n/ZbUy6NpFKXz3W+j/Qg4RSTHvSDDqHZ3kalT9ODAB
         dKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602162; x=1744206962;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZX3nFh5HbaqnfPwak8MkT9aP3MsYz6LqGQBNR1uuhiw=;
        b=nzXjZ+9Ulk9PxhWAO/weV7n48ZeFi89EIRQujwSOedDM5Hv1eC/jQA3Bh4BdAIP323
         hEsFO5WmQ2R/iqSCt9YDTyARe698Qf2vZgOMnKOsT97fapJiN8DIVa5zBfxooP/e/TbM
         FpsnWewCgGQOQ1dxGCpSpmTXOIUXwzJmi6nB8BwNKT+8sju7+FzOm670zjOlg9YmpH3o
         59B8KfEE+4EK5edvakm16VeLD8Rng5pok6lkAbfTceA4wUYj7DKip9n4TK87l7oNEa12
         kLbbDZGgNjOAR10kHaXV/gdcDaRtd46E8rbhcu33NFgYEx6/PQ8mMiQpahApraOIbRuD
         xjYg==
X-Gm-Message-State: AOJu0YxRprUedYgfHtCnWR3tuthOZEpqpgSxzpUGO6vNJlRIT7ylaaX9
	OQdz0YZ+k2Wo4Sz+ZPM/h/ehc9Qwsbg1r0guv+YfudzdiU4iaWhw3bEtVmMd2fcGZOKqynDeyUI
	=
X-Gm-Gg: ASbGnctpZAyDGwH7qHtZMBelSa26iMFSN5UvFUgx2LYDd9C9V5eqgNx8jZWOiQ2pl7w
	NKydWsedt0T2LlX5HIiWuHE1hYUU/v/Nfw3ksbDlwAeUY2UWYwXWqHqJ6d6x/iuZGWgyNvrPhvg
	Fuj80Lt0cJ4uSMZIAODM3YnFmRf78fwkPC1+vR1xntoxNMqQEMXRabr0sshs03xnOX3E1fvhVvH
	lW1LnHqPxX07oiEm/2lMxi/aSNhCmahXmUJXYj9rAC2Qw7RrtVDOyxiSrV8LDkEbtIqqwFNU9TE
	hmKuElzCiscdPh5Vv+wrlRy+B3lPfagTfFcY6T+Sn7IwVjD6ZsIvTH5oGs6wujXp0t0zBWnI7HI
	2tySZUuwFHTRKDSwDqJSDASTZD1F3qw==
X-Google-Smtp-Source: AGHT+IFYf7xjs2J4xX3XrP5JnnIDZF25OBcET/HLi3k4MilG5Dd73fQOfqcnpPoyW+g8e24seNnVlA==
X-Received: by 2002:a05:6000:1a85:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39c120dd0d3mr11137841f8f.22.1743602161679;
        Wed, 02 Apr 2025 06:56:01 -0700 (PDT)
Message-ID: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
Date: Wed, 2 Apr 2025 15:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] symbols: assorted adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Content-Language: en-US
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

The main goal was what patch 3 does, but on the way there various other
things became noticeable, and some preparation was necessary, too.

1: add minimal self-test
2: split symbols_num_syms
3: arrange to know where functions end
4: centralize and re-arrange $(all_symbols) calculation
5: prefer symbols which have a type

Jan

