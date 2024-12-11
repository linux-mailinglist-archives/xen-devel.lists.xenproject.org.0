Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768809EC9FA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854248.1267499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJfF-0001rB-LB; Wed, 11 Dec 2024 10:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854248.1267499; Wed, 11 Dec 2024 10:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJfF-0001p0-Hg; Wed, 11 Dec 2024 10:09:53 +0000
Received: by outflank-mailman (input) for mailman id 854248;
 Wed, 11 Dec 2024 10:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJfD-0001ot-Mc
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:09:51 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b6f926f-b7a8-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:09:44 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434a766b475so62579995e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:09:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e438f169sm6054831b3a.168.2024.12.11.02.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:09:48 -0800 (PST)
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
X-Inumbo-ID: 0b6f926f-b7a8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733911789; x=1734516589; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9VF63jh67GR8YssO15HmIu+Lzqwn3Nr4Bl5Tf2bmtiA=;
        b=PH3glYjDzomB/kdTIVFqbiLAko4Rg0rLEk9o3bXld80NW+wHMVbgimmMQutyLmArp4
         wllD6zX5UUNDlGqmrjVSAq+amdk4IKJnbKgJknA/qIpbLrKAZCjIreJu/m4t26pRpsdx
         32ZAZ09ijcWNpHVZC3UIIIEq/uhYEzuGdI/PJ1MO2hdqBF/kSE4cQZOndGc4WEiyPDOP
         XhbFp/HRDhPtOtHrVM+fJTp0Z71I9LsmOxT+xzJiQbqzJmlKZbQVZsS69nd4f3JS1Z7r
         Uo2Yrcp/Zn6LZbfQFCx4iL2ERBko1VtrWM4oxIjbiIeqlDjzAv/OtQxKLOxbhEUStEhk
         Jieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911789; x=1734516589;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VF63jh67GR8YssO15HmIu+Lzqwn3Nr4Bl5Tf2bmtiA=;
        b=wImXkvBLocY9FK1FaLcYnYhktNQBqvPW7L9sy98Eag2f8fx1FkSTf8uognjroNOQ7m
         ouqP7s0vthPzyOYmyK8HuZTlmccHikRFO1nno/eLL2mxKRjZTPaySNS15L/b+QeJIvqi
         BldCZtiTQqhlxLfGXxO4FzOz9SgsCuBZ4XaOVr/QXuRKQ6sp8ef3A6YyPpCufZCMe3el
         ieOBQy8PuR2uSRuJcNH1HKf1YiDQx0Crxs08DBhp9nLRVu1xwQh6pGwYGTdr/aKzbM0U
         bsONbCNP1CiT1IOnqPq0Jt88zkqhml9k8tJepG8Xb1GEBkg1uCqNIWYvJv5mkqbebW3+
         vk9Q==
X-Gm-Message-State: AOJu0YwvrnbvVa6jMhsHKA3+aMkB5R5PzjOEqQam9HX1VnnRX+Dk55hF
	0jdqNo3thDfo3gj424OVwwr8oz69CtxqrtbddaoOtfYCe2AElTwfAJS2HgGfCYnIbyYTJU0fFWM
	=
X-Gm-Gg: ASbGncv5EAfH3gJ+W2eQQk3ojVd4k4jNSfgEoXxGNsXfBoNbGsm6/M0YWY06fC1IErE
	mw9Z1qa7gW43k81h3oBVbXAuP/vsov20k88fvMbikQeSrUOvVJNKsWgQwxy7pZIKXmjpEQDr+uK
	f2fMJKG6ykkCIXy/E530ckY2L5p40CmqgV4LQ/jLIERee81edr9j//vF3wcojMjBnz2aGqA0UVC
	3A6ixjkupyWBOnY7kkdGhN1/1u9k+SDk+MpMCAUWWl+I26VdopKaUtYQGwIsNJ24pHyeUPo5QLP
	sbAd2KSJR85GLK/5rtyNKJoJ2xuqZu2VhDU0sLk=
X-Google-Smtp-Source: AGHT+IFQAMjfwX9ZaaqGr30Rpz73/TDE348NQPYZonqo+z3puNHSuaFHwQF18KYZGXiXB4rEQgehEA==
X-Received: by 2002:a05:6000:2d85:b0:385:f3fb:46a5 with SMTP id ffacd0b85a97d-3864cecff63mr1306951f8f.52.1733911788969;
        Wed, 11 Dec 2024 02:09:48 -0800 (PST)
Message-ID: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
Date: Wed, 11 Dec 2024 11:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 00/16] x86: support AVX10
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
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

AVX10.2 is adding quite a few new insns, support for which (new in v3)
is roughly added chapter-wise as the spec has them (perhaps not in the
order of the chapters there).

While it probably can be rebased ahead, the series in this form
depends on the previously submitted "[PATCH v5 0/3] x86/CPUID: leaf
pruning". It also is assumed to go on top of "[PATCH v7 0/7] x86emul:
misc additions", albeit at most contextual dependencies ought to exit
there.

I've tried to be very careful in rebasing ahead of other emulator
patches I've been carrying, but almost all testing I've done is with
all of those collectively in place.

01: x86/CPUID: enable AVX10 leaf
02: x86emul: support AVX10.1
03: x86emul/test: use simd_check_avx512*() in main()
04: x86emul/test: drop cpu_has_avx512vl
05: x86emul: AVX10.1 testing
06: x86emul/test: engage AVX512VL via command line option
07: x86emul: support AVX10.2 256-bit embedded rounding / SAE
08: x86emul: support AVX10.2 scalar compare insns
09: x86emul: support AVX10.2 partial copy insns
10: x86emul: support AVX10.2 media insns
11: x86emul: support AVX10.2 minmax insns
12: x86emul: support AVX10.2 media insns
13: x86emul: support AVX10.2 saturating convert insns
14: x86emul: support other AVX10.2 convert insns
15: x86emul: support SIMD MOVRS
16: x86emul: support AVX10.2 forms of SM4 insns

Jan

