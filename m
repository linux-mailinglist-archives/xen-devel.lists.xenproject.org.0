Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8736DADE434
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 09:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018816.1395680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmq4-00041D-7O; Wed, 18 Jun 2025 07:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018816.1395680; Wed, 18 Jun 2025 07:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmq4-0003yd-4c; Wed, 18 Jun 2025 07:04:04 +0000
Received: by outflank-mailman (input) for mailman id 1018816;
 Wed, 18 Jun 2025 07:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRmq3-0003yX-10
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 07:04:03 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68ff6a90-4c12-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 09:04:00 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so2395105e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 00:04:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7488ffecce6sm10534181b3a.10.2025.06.18.00.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 00:03:59 -0700 (PDT)
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
X-Inumbo-ID: 68ff6a90-4c12-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750230240; x=1750835040; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WwiLSuNhnr4M4BxYNCLPFs9KKYxhMlfbdYVygsxw8F4=;
        b=agr3eItWSDT0Yj8j8vvPjombGYz+J2wVLrqI0H3uABfjayNTA+mDkXJJg14BD2eqhl
         THWZQLA1hCzgatuNcvfuEKQs+Df7FRre2Wcfnd29WbQiTIlfEufIU7szB/ONhoslt00O
         e8qOWywnrBfmNVIV/5AlDixSuljMsEfT+KgS7NStS52yGURp6wSBEnAsbOYZ8pX7a8x4
         +hXzAmK/MnX3Lh0IRgrT2x0ULYIntqjYwrwlzijIJPmVUQ2VlTe1/IN8yasRZy0CciN7
         Ri+pWd4bJ6JxifMveXyQifQura16Y2VxsCr6pI4IcaaUIIUrd2RVCry9VPX9YYuZXxCB
         lGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230240; x=1750835040;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwiLSuNhnr4M4BxYNCLPFs9KKYxhMlfbdYVygsxw8F4=;
        b=wO+S+3vlj9FhQ0DzeLxMqqofCDX7plcX4RuUcp5kIQbeZkGPK4GQ9a02VGgweCY8nR
         bIxDCQ+57IfBUEZrFHtar2L/zMMHVG5P0KMF6cuPtNVMgRH443mrG91LxxHjUvxbJsxw
         7RcOWjgtvgEvLpcTpYrU3JCQ2Fvn+0ZAG3rdPTSXPV9Tx2uElGeji6dZSAG72Vz5GKud
         UBGxlwZJqj3pDX4b70u6prlCT2EE4BifcJr4gmhwVqmH/oADEN0bBPLTBM/3Udg/o0/7
         nW73HIgPNFu3u8Q3jicS8QWghMYMyBT3H6IBsrQqy9o0Jc0O8Qtm2MUcGhfdz3pcp71F
         WJgA==
X-Gm-Message-State: AOJu0YxWZp1KDkOZVmKxZhV4kl2FvwN4l7fjLqTmbXHaM9chmbiQdEb5
	74XaZIs/us54mzMryJeyOs8mNB0qCyVHZ+AQNxSMDwoQ7C/7HEctKf5DGwrnHuksor4707yc9Ec
	HHk4=
X-Gm-Gg: ASbGncuJ15sC4hNJBraWScpkP3nA+l3LnzSh3GQBd6ss3YMbtT9oLbK+3OYrxMKOtct
	WkKzKNSCZjTO5kQ8SPfeuSdahA+VUfnrTi82dR8A6Ide352U8DJcZnjsxlu2CO0OvPZWiWkDCix
	ZPao5cuQGXltaU7OAMmy0OqT5rk+Jhey/6qWje+1i7e8NI4OgjWnhbX5HPy+2TvX/9ZU7XqiLo1
	BiSvTR6AgiotLmlIokvyzguq5L+kIHEKOHFPpRrpHzaN/1RS2QlfpM2DKTWpK5WHlPaZgSHZ26p
	yaPviiCe+7UDZKvvraL6C+99nmiSn16G/sGnhtVhbVqxNPVuzoGbgyez47ZQGsjP/ClEm76ApPU
	UEKfjglOF2yGU2ubfOehQi9Vn319eYKWWRxZf4oZL68BBerUzRCsWiUwDTA==
X-Google-Smtp-Source: AGHT+IHWWWMg55BdleC+j2/hzOYuL9wzoV2xmLxnYUz6rXYEVA9i7dMwfIQrqT6OyhC5YDdGFRrcfw==
X-Received: by 2002:a05:6000:2408:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a58e169b1emr1026150f8f.16.1750230239800;
        Wed, 18 Jun 2025 00:03:59 -0700 (PDT)
Message-ID: <585f1b0b-6768-4f9c-8f9f-bcf6e20fbfb7@suse.com>
Date: Wed, 18 Jun 2025 09:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 0/7] x86emul: misc additions
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

1: x86emul: support LKGS
2: x86emul+VMX: support {RD,WR}MSRLIST
3: x86emul: support USER_MSR instructions
4: x86/cpu-policy: re-arrange no-VMX logic
5: VMX: support USER_MSR
6: x86emul: support MSR_IMM instructions
7: x86emul: support non-SIMD MOVRS

Due to lack of specification the VMX counterpart for MSR_IMM continues to
be missing (unlike USER_MSR).

Jan

