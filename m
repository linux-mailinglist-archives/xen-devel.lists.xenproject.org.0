Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E601B0EF59
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 12:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053701.1422487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWOR-0001sO-Tn; Wed, 23 Jul 2025 10:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053701.1422487; Wed, 23 Jul 2025 10:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWOR-0001qq-RC; Wed, 23 Jul 2025 10:08:11 +0000
Received: by outflank-mailman (input) for mailman id 1053701;
 Wed, 23 Jul 2025 10:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueWOP-0001qk-MH
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 10:08:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecaa9dab-67ac-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 12:08:05 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso5761942f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 03:08:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c84e246asm9401958b3a.16.2025.07.23.03.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:08:04 -0700 (PDT)
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
X-Inumbo-ID: ecaa9dab-67ac-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753265285; x=1753870085; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J18F+FpHFBE5ODakRpeCdf2EfBHXqdvEF/79WN8knjs=;
        b=b3UfM0Rh/3XKcUbyuHIB6+WyDJWFWYTtIQ3W18Pe+R+qz8k9SEuiDT/wwMNuQM4+l+
         yw6+S6qe3LdrmVXFYbM2uwtNihBcpJrHeMrR3xIwQxkYb3LBi5WpxmEWhlsxqsEHh7DS
         7pYzYrXoj6twmycPeCBUZ9dxetZs4jrMLilffHG4UYD5VVtPzDh62WDiRZRBtMS/6p5g
         Kp64rDwzj2hqwXvWvfziBFnVzXxuWSq4zU7XPRjSnYWbDjC4Q8UmcY749vre+lRBkxGd
         lprIqSx5U1pHuHyZ35qNgNx4SwTLDATIRwIuBCLqgp06t5eF6Hl4COzKvVf169eOvPZo
         0G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265285; x=1753870085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J18F+FpHFBE5ODakRpeCdf2EfBHXqdvEF/79WN8knjs=;
        b=O8RyhgCOxhAW2vEsZzP9zGe/NVVuXS1ZtPElG2R7huZcHw5B77RYOlfif+DS5V8hoF
         v3bvc63IWEv9Ov/6O+nCEOikhJaPS/UMEEGHuNZUU92uQ7l4+cLuG6PcxslaEbqu6HX+
         LVHwJPJNFCnLL1X3BYRsY79fomVGAR74VCreHtDeKLoe1atMao4JAHMMvXWJDS+Ug5JY
         8q//dTL91Iavc6PppIvLcfP3Fu7wnB1OyEB7dEGWXeBLwBhUlU1pvk/O/+e2KuXRi3KE
         BJl1xRwJ4CO8Hbi24LHUEe44lZ8PRYZ6MLmJkt9AYYSPjnaoPnngpHHVKBSZRKoe5n5m
         N8CA==
X-Forwarded-Encrypted: i=1; AJvYcCW4z0oIVyLCIIWEpdO97YlIMMBx50CJFCADkHrA0+kdDmriqCUM6MArSVo46pHEl3jE/ZmFZb5zIAE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxh5oyA1hI9bhYFR66F9/MuRrdX7Vi6QTSfWXWjErusib1PepUO
	U3c5ReyaW7JUv4SuVh5Zj/azSpeyYqtocL9s7urfXMFvxckcFXl6/81dj2iO1V0GIw==
X-Gm-Gg: ASbGnct5rZfHpdw/K8MZJrK/aqM1vbmFmlRP72Zyilkvboe/ivnC3hqZuUQ4z5GJtnZ
	J+a3vnWNd0ks+Rkpp0Qg7tFkPlu6LdZi6psbOr7+dzp1vylvchDQJaP0f/f2YGMNsnWx34qYF5n
	H3+5uXWIQ2FjXzE6qmSFQWAyqEmTK5fnH0WBgHteeU9GG2u71HbzglIyIihqmppU6RfwmfJTt0q
	FYBzIsPVK+tXbGBj3VGVtiKVmQsI/VQSawBdHATUyDEMKoNk65FaOxJxV8igBpbWkDvoGB6Bpcy
	B6GyvZVn3qdek5Zv+G2eQp9Y7Bm3eXxiWx4lsqztonfNkXmbTpv6h4fvKnrEmNaXB38hHmrr58F
	RNFvDfzsio+60opN9LU52UQLD+vKJ5fCEbgWwYsaThYv5Jhvta9wmxM+H53Rtty/E3mAAbaZJPl
	iZ2xGQIkA5uwInZpDO2A==
X-Google-Smtp-Source: AGHT+IGjpfksVnVJEWbZIeUwF3ALSqRgEz8U0CYlq/PRl13zVt/AEmiH1CIAw2sq4mSd6oIIoUL/gA==
X-Received: by 2002:a5d:64e2:0:b0:3b7:5b40:703 with SMTP id ffacd0b85a97d-3b768f06ab7mr1672319f8f.46.1753265284561;
        Wed, 23 Jul 2025 03:08:04 -0700 (PDT)
Message-ID: <562ab480-ec95-49b8-9473-31e0805735f6@suse.com>
Date: Wed, 23 Jul 2025 12:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/domctl: make domctl_lock generic
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250723065325.1452007-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250723065325.1452007-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 08:53, Penny Zheng wrote:
> Not only domctl-op could do foreign updates to guest state, some hypercall,
> like HVMOP_set_param, could also do, and they all need domctl_lock for
> syncronization.

What's "all" here? HVMOP_set_param is the sole such case, and hence - aiui -
it uses the domctl lock only to lock out actual domctl-s. Of which there are
not going to be any with DOMCTL=n, ...

> Later, we will introduce CONFIG_DOMCTL to wrap domctl.c. In order to
> continue using domctl_lock when CONFIG_DOMCTL not defined, we'd like to move
> domctl_lock_acquire/release() out of domctl.c, and into more common space,
> domain.c

... as you indicate is where we're going to move to as a possibility. Hence
the domctl lock is meaningless without DOMCTL=y. At which point moving it out
of domctl.c is the wrong course of action. With DOMCTL=n, we'll rather need
stub domctl_lock_{acquire,release}(), which then likely would do nothing (or
alternatively "#ifdef CONFIG_DOMCTL" could be put around the two uses in
hvm_set_param()).

> The movement could also fix CI error of a randconfig picking both
> PV_SHIM_EXCLUSIVE=y and HVM=y results in hvm.c being built, but
> domctl.c not being built, which leaves domctl_lock_acquire/release()
> undefined, causing linking to fail.

If the work towards DOMCTL as a Kconfig control can't be progressed pretty
quickly (and I don't expect that to be much faster than the SYSCTL work),
then I expect our prime option (apart from reverting the earlier change) is
to accept a bunch of dead code in the shim binary again, by moving domctl.o
out of the PV_SHIM_EXCLUSIVE common/Makefile section as well (plus whatever
other adjustments are necessary to undo that earlier dead code elimination).

Jan

