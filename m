Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F5B29C4A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085626.1443944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvH9-0002Ep-Si; Mon, 18 Aug 2025 08:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085626.1443944; Mon, 18 Aug 2025 08:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvH9-0002BW-OE; Mon, 18 Aug 2025 08:31:31 +0000
Received: by outflank-mailman (input) for mailman id 1085626;
 Mon, 18 Aug 2025 08:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unvH7-0001ku-UU
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:31:29 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1987b0-7c0d-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:31:28 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so591039666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:31:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53eccsm758883766b.19.2025.08.18.01.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 01:31:27 -0700 (PDT)
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
X-Inumbo-ID: bc1987b0-7c0d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755505887; x=1756110687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ufTV9yb7EWwTifzkKQGotfy3d0T3We0zou2B9TTj27w=;
        b=ZcyEexFjNzm5wRKEUYO8OM4c2noBJRRnZI/29h+HqFzMpXqj5eXg1Acsythu4eX2/j
         RWW04/fsXdn85eSiWRJOxOvwui2PG9sh/eCmyRkx5LPFRL7DuKY0wrHSj92wAfiRRHpM
         IKnN3R5JPaDVDUb+JxR7BMNaHuMFnG2bodUEgCrmri6vy4DDuNvx7PfS2VWAefBQD2L2
         OMKReKoXb43z5PHoZZEPZbUgMyA3dOM1rmWrhm0TcOgjENHgViI6OZHzy1nn6clGHJah
         3lGKmgJVOh+CD72MIZEEwDlTFYtNEt+Vf+K9ehxdXCLqXuMlVYb9zZWS0BcXyWPgUL6s
         DeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505888; x=1756110688;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufTV9yb7EWwTifzkKQGotfy3d0T3We0zou2B9TTj27w=;
        b=XHqEv5/PtxpUxNiAn8Y1wWZ/+VF8/WWUH66c40OIkDNC4UOdDT345bDK9p80+7Ardf
         iMIoetliItH7STXKEfglCNGavN3vBwgV0sIOlo5hd7xShiVCLewsEHX+PU/TFaOSL4Yh
         ZMSCt45A9m9siwQq2RWWckUSpN1RQLK6awFwwT3MeMCq0vagfEVy4B/ZlWwY2wOJVM6N
         0JkjoHG8mkjPB+EUdvrN22SWCRkmN1F2vc1CO5u9anNI6lnQRhcHbD7fiDR1Rgmw07oM
         tkFgEWNHNsDW8ZSCnXvpvbJh+mRuPLyYU0FvvgH6GWteyEa9GBB3f/Bx9IgUXbsD088M
         UTZA==
X-Forwarded-Encrypted: i=1; AJvYcCUImUnt3i6QJuib/acHotpQAp0GvMdOgf0X4W1OLuma2mZhwZmRpKs9NFBSyLVbBkEuYEM4E+nzIFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxam4FItq/XtE0upltKuYoqE9id2gZYTERWl66f4MFSh2AYyACU
	j/oHXFMADDm4LqmBjPX2h05m+lNd+zj3ARq1R5uMJN24mFa3NIm8HRGKR6YgB3sF7g==
X-Gm-Gg: ASbGncskYEaGMPQQ+uVmD/j0UlOG5yFEN79s56oZzb6SnNZ4VHbgaI4TVwIDiQSzZ+z
	2xcPMSwglV5CIeXa/GQiy3tCdGhzmibM5qyVPh1NcHFHDg7YMcKfaukKRTnm7yvI840Nqdrx/33
	KR/WWrsNoETv8FTZCCaWoDh14wyZ0p14BqB75WPla0bhhJfiheSU7RRPj5FQvZJEvgeEYuv3aaC
	WWWHcAJu8eK4Gu20vDI+cusOTev4nHQshTylaYiKgWFiQcmZuFA6Hsy6pfgfgw40VAXeNhGzIP1
	Lz7VFw8SRG0lNkHBqP9zXOeaNOHlbFSUBpZ/e6bj61rhgVByd4esLKBfG0djZEm0VXgOsG7eJiW
	+BdaL3GCFXhodWmsu+p9Nv3hBuK+3te7kosE86Q6rcQpAZADFH7FPOcxzZJUr9dtQ/eyn9N0CEw
	OhHEqrprI=
X-Google-Smtp-Source: AGHT+IGGNdpqZtCrSiKl7h+/rKglrRsKPfqLFVI3z+wkQRl2W6nNtVFJCW/OJD8tcdJNgotSRMdx0Q==
X-Received: by 2002:a17:907:7ea8:b0:af9:38ed:5b49 with SMTP id a640c23a62f3a-afcdc2062c1mr1027390966b.5.1755505887483;
        Mon, 18 Aug 2025 01:31:27 -0700 (PDT)
Message-ID: <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
Date: Mon, 18 Aug 2025 10:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Penny Zheng <Penny.Zheng@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250815102728.1340505-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 12:27, Penny Zheng wrote:
> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
> a few functions, like domctl_lock_acquire/release() undefined, causing linking
> to fail.
> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
> /hypercall-defs section, with this adjustment, we also need to release
> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
> to not break compilation
> Above change will leave dead code in the shim binary temporarily and will be
> fixed with the introduction of domctl-op wrapping.

Well, "temporarily" is now getting interesting. While v1 of "Introduce
CONFIG_DOMCTL" was submitted in time to still be eligible for taking into
4.21, that - as indicated elsewhere - is moving us further in an unwanted
direction. Hence I'm not sure this can even be counted as an in-time
submission. Plus it looks to be pretty extensive re-work in some areas.
Hence I'm somewhat weary as to 4.21 here. IOW question, mainly to Oleksii,
is whether to
1) strive to complete that work in time (and hence take the patch here),
2) take the patch here, accepting the size regression for the shim, or
3) revert what has caused the randconfig issues, and retry the effort in
   4.22.

> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

My earlier question (when the patch still was part of a series) sadly has
remained unanswered: You've run this through a full round of testing this
time?

Jan

