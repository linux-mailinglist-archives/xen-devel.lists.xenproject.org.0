Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005979516FE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776910.1187099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9ht-0003WU-Rz; Wed, 14 Aug 2024 08:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776910.1187099; Wed, 14 Aug 2024 08:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9ht-0003TZ-P5; Wed, 14 Aug 2024 08:50:13 +0000
Received: by outflank-mailman (input) for mailman id 776910;
 Wed, 14 Aug 2024 08:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9hs-0003TT-FJ
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:50:12 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 372fd2d1-5a1a-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:50:11 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so7496911a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:50:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd187f4fe2sm3647534a12.9.2024.08.14.01.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:50:10 -0700 (PDT)
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
X-Inumbo-ID: 372fd2d1-5a1a-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723625411; x=1724230211; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7hLxkBxMMzkiBCwdwoQ+smbiR9BM8Nnccc5v7YtMhc4=;
        b=N/Ge2nZD7er923msD75jemeRT81juTWazVP2X3twrJirp/wwV0t4tLnUg1pqUgpFzF
         R4shkiKTX9QhNc3XXXBo7Qps3Civpm/e4zIoN9R/PbLVQjygvpKy7/Tt/W0EjVh+IL9j
         e3wgG6YhpP+lNken2Vq7+lp+Mra5nKroOUcWvZhrs7dfqXk06wzC5VJVs1a6d9nmtRnp
         FH7dnYT+2Uc5sMEzBjO/B5+Eht+JkjECxdivmbKG06WI1Vcg1K7y3j3il+yX3F8TNTFe
         plHLgg0/3NZUDp8zD/19258RTLO12/AlcVHo3QV17SMBJhSpCf5ZT473yZGt4FKKluZO
         pp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625411; x=1724230211;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hLxkBxMMzkiBCwdwoQ+smbiR9BM8Nnccc5v7YtMhc4=;
        b=S+WvQpcueiL21nwyWp1sDZHY+uWFH5zVzw8IRq+IzahmBKwTxgHgWywdivF7eBX1td
         Oy/vxqV+T7My6dpj8XLgLTYDB/lk0g16BVncr3XDdlDo5V8nRTbC+Sk5q9ZCHWNFV1Qx
         o/ZTLAEQQiSeGKX5Bz077fX8iSU0BSncwssP421ZFLwhdWy3fWZt0NI/I0GHUtwIfqPn
         MadcUU4wG+OepjV+PgtUdOjc8BBoAzpDTT4FFDhQsF0kAFW/Nfy/2apIAOIgkCPnMMTi
         hJrm3rx508md98Q9j718KlT5FholpJ0fYTO1jfoD5lkXRmAXFjkeZAGC9usZBLtMa+wW
         pZlQ==
X-Gm-Message-State: AOJu0YwJNME0WS36c+4FaSeKhiCNlz4d2/aa8s+lTcXK6mrILY6Jx7KB
	hO8MNh7a4J9NHLtVY48XbzolD3un2oxJYXgxpOyNGTt3/AOMYNAN7rVbWsxfbie5RWSI4xjVNK8
	=
X-Google-Smtp-Source: AGHT+IGFYN7ca9CPjRnjpz5/qBpgucjG/0mTwoA++Uor+985PHG6j1Whe85l42qWpq8iCtJz/MfGNA==
X-Received: by 2002:a05:6402:5205:b0:5be:9bc5:f6b3 with SMTP id 4fb4d7f45d1cf-5bea1c6a749mr1270245a12.2.1723625410733;
        Wed, 14 Aug 2024 01:50:10 -0700 (PDT)
Message-ID: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
Date: Wed, 14 Aug 2024 10:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/9] x86: support AVX10
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

AVX10.1 is just a re-branding of certain AVX512 (sub)features, i.e.
adds no new instructions. Therefore it's mostly relaxation that needs
doing, plus dealing with the 256-bit-only case that AVX512 itself
does not allow for. Luckily an unnecessary restriction on the mask
register insns was taken out again, simplifying the actual emulator
adjustments quite a bit.

AVX10.2 is going to require quite a bit more work; the new patch in
v2 is merely the relatively simple start thereof.

While it probably can be rebased ahead, the series in this form
depends on the previously submitted "[PATCH v5 0/3] x86/CPUID: leaf
pruning".

I've tried to be very careful in rebasing ahead of other emulator
patches I've been carrying, but almost all testing I've done is with
all of those collectively in place.

1: x86/CPUID: enable AVX10 leaf
2: x86emul/test: rename "cp"
3: x86emul: introduce a struct cpu_policy * local in x86_emulate()
4: x86emul: support AVX10.1
5: x86emul/test: use simd_check_avx512*() in main()
6: x86emul/test: drop cpu_has_avx512vl
7: x86emul: AVX10.1 testing
8: x86emul/test: engage AVX512VL via command line option
9: x86emul: support AVX10.2 256-bit embedded rounding / SAE

Jan

