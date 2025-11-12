Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474FEC50C2D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 07:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159485.1487803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4gE-0001yu-Gd; Wed, 12 Nov 2025 06:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159485.1487803; Wed, 12 Nov 2025 06:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4gE-0001wO-Cn; Wed, 12 Nov 2025 06:50:10 +0000
Received: by outflank-mailman (input) for mailman id 1159485;
 Wed, 12 Nov 2025 06:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJ4gD-0001wI-1Z
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 06:50:09 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2eaa389-bf93-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 07:50:07 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b32a5494dso165979f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Nov 2025 22:50:07 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a60:8d0a:6473:d951:bd22?
 (p200300cab70c6a608d0a6473d951bd22.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a60:8d0a:6473:d951:bd22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac675ca86sm32389144f8f.31.2025.11.11.22.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 22:50:05 -0800 (PST)
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
X-Inumbo-ID: d2eaa389-bf93-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762930206; x=1763535006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i1GLyRhvFZlmUdvAsV3vRpeqfv9Dtimp8WWjTBXjIe0=;
        b=TDMMqb7ifcn0/Hyuzvv3zo0QQ0na0ssCOSYJOKVIJYc8MOWPdhdYTF1pGqkpD1KG8s
         a8tZq8oqukyqDZEmLB1Qb0n4LLNfG7vVO66XfFa0Dc9QxZLR859wosppBN2iSYeufff+
         2qvZZBGaNfaFs5T1TiG92wMdH9qU+wHFEMlHDRIubExVuojzgeE3K+D6bhTgyLmozQwX
         8nK94mFBDXzFbVOVbDnw0cXicHTIST6KbQ1ylxbWheCCp57xr7co7PQcME3rORPoqvi6
         EaAyCGkubCaAhZw3oXl5xVgX13/0r3u49hrCIqwoJFpVZbA4WsfgDiAbr9vUsIOaJYGP
         KvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762930206; x=1763535006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1GLyRhvFZlmUdvAsV3vRpeqfv9Dtimp8WWjTBXjIe0=;
        b=suVE8BaV+7mI3iOZfSlBn4MbtcKLViAqDSYXFuDcSrDixVtUcCHOahd0MQLv9eHf6b
         tkB+dGaG9GoN59dyRf9Jb+3FbT/UjZ0kexyuPtwgNFyzUAzRVc5eSVEHL0SfVg7evBAa
         PzyLcJKbkNNcfjx5sxSrQzN2uca0r3wnndXrKEk2KJSPAOKWOk2iRFJM33iFhgkxOEck
         WYITYbQAVHNiOZPnSdoVXcKMz9LKViZIdr425n0ypR2pk4eV19Cy2LJYoTvQA0L4/V17
         Za8vH2TBB9yy7Ae4/v1B4JnqPWMUZHOWc9a4ZVQqW4JHDz4kxYBXXjfcq/DY/hkHBVkB
         g1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX3gfw3WSb64v4INnxpn3a17NWtxh5BfhqprvEJEQlqefYn6brMdGTT7ERXAIPNOSFfTXIZA+2Djuc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzROL00B9QjOEMjoxaBeFDWtBlkkHL5xLrAD/k/6Xg1VPNaRZtu
	tJZkgeK/OhwLW+4CnoB0G7uUtUe+PYeS5PpAguqtxreN+LYh+C38dsMF9P7JAIEZEg==
X-Gm-Gg: ASbGncsqghrhOMbtZUeZdazPTZikv7bks318WfLDAF9aV4h22MzawlsANJZVHzrcGzj
	JrpGctmk2LOPGVmDfoyrWZ9rCGOMbEcDJPR2BEoqLo5C211zO3U56xTBYKMHzHXGn6OGigxjT6O
	QUQJVzCWeV0n0AOi4pTONWkMKHTQpelGnmsbDME+zuLipajI58WfnE1KI6NIhC3HEIhp/lK95S0
	U6bydSw+VlDaSmd+oo/uxyubWFSdi5z9xMlV+61kOPgPJ5BpVkkPsed7B/jYTZZ2KDIizdWGjt0
	CXcvfywWEbwZryM1xr3zLrEj/KCG8kDXMM200QG95itndfzOYO6qig5czrpa2nPuAL8XTdX/uw0
	mN5ZYkpnBRY6dqLwW88XL6fUnmlf7JEH4+gF1IJkohM2iuVpga/WhiateYJ0stGIcbAEkEjsjox
	RsQtW/5GMDTs56oDDy53J35WWJDGP68u0SD1dt+2EBPa+ZHh8rBq6wn9Tb+2D1q6ZVy98v/hjgc
	/Mqr2X0umRspZShllp4573JAlVGSWunFXEC8A==
X-Google-Smtp-Source: AGHT+IEmfHopHTPbHjU0mIYNFLlG1Qm0pdFllJth2uauvyYK1Qwfnk+7j3htuZTTxzCizkBNr9Aoig==
X-Received: by 2002:a05:6000:2888:b0:42b:3da6:6d32 with SMTP id ffacd0b85a97d-42b4bb94f09mr1323542f8f.23.1762930206333;
        Tue, 11 Nov 2025 22:50:06 -0800 (PST)
Message-ID: <cea9d2cc-ba33-4483-92e9-4aa31c24960b@suse.com>
Date: Wed, 12 Nov 2025 07:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/5] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251111175413.3540690-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 18:54, Grygorii Strashko wrote:
> This series introduces possibility to disable 32-bit (COMPAT) interface support
> in the following cases:

The use of plural here ...

>       - Only PVH domains are used
>       - Guests (OS) are started by using direct Direct Kernel Boot
>       - Guests (OS) are 64-bit and Guest early boot code, which is running not
>         in 64-bit mode, does not access Xen interfaces
>         (hypercalls, shared_info, ..)

... makes this an OR list, which I don't think would be correct. PVH domains,
for example, can well be 32-bit ones, can't they? Otoh the latter two points
look as if they really enumerate alternatives. Can you clarify please what is
meant?

Jan

> If above criterias are met the COMPAT HVM interface become unreachable and can be disabled.
> Coverage reports analyze and adding guard (debug) exceptions in hvm_hypercall/hvm_do_multicall_call
> and hvm_latch_shinfo_size() confirm that COMPAT HVM interface is unused for safety use-case.
> 
> Grygorii Strashko (5):
>   x86: hvm: dm: factor out compat code under ifdefs
>   x86: hvm: compat: introduce vcpu_is_hcall_compat() helper
>   x86: hvm: factor out compat code under ifdefs
>   x86: pvh: allow to disable 32-bit interface support
>   x86: constify has_32bit_shinfo() if !CONFIG_COMPAT
> 
>  xen/arch/x86/hvm/Kconfig          | 19 +++++++++++++++-
>  xen/arch/x86/hvm/dm.c             |  2 ++
>  xen/arch/x86/hvm/hvm.c            | 22 +++++++++++++-----
>  xen/arch/x86/hvm/hypercall.c      | 37 +++++++++++++++++++++++--------
>  xen/arch/x86/hypercall.c          |  6 +----
>  xen/arch/x86/include/asm/domain.h |  3 ++-
>  xen/common/kernel.c               |  2 +-
>  xen/include/xen/sched.h           |  9 ++++++++
>  8 files changed, 78 insertions(+), 22 deletions(-)
> 


