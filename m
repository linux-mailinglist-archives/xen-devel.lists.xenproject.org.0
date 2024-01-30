Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A146A84258C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 13:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673329.1047675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnej-0003op-GA; Tue, 30 Jan 2024 12:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673329.1047675; Tue, 30 Jan 2024 12:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnej-0003nG-DW; Tue, 30 Jan 2024 12:56:01 +0000
Received: by outflank-mailman (input) for mailman id 673329;
 Tue, 30 Jan 2024 12:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUnei-0003nA-5V
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 12:56:00 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e98427bf-bf6e-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 13:55:58 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cf2fdd518bso35596231fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 04:55:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e13-20020a056638020d00b0046e48ce8605sm2193647jaq.130.2024.01.30.04.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 04:55:57 -0800 (PST)
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
X-Inumbo-ID: e98427bf-bf6e-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706619357; x=1707224157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88kOMxpRh5tAObRmPXyCk/QNnNc3+Rv4rm/m6cAfp0o=;
        b=HtMGoMSP1ts11Rv10ewcRFGch9dWXlOSXQB2Et7MFkxqckXAKnZRdbuuJRRWvGBjNW
         s3wsIB/FsLTZlpVChnCuYKPazzBczyTd/iD+f+VD4qm0o0x8cffCiuSU/uoLNYly5lWD
         G/VuGXVw2PeDr0pXHzLi1NtP71KxH/D0CxweDQFwzpTOxycLTLAh7Sh7C+jO4PzjQ3P9
         RabcDbvJkKJNATBUrCrLPcANacjDPfAWv50Ug62mXOr/0nHyjwdm12NksjEPTuJ6uZiK
         fgtD9693OHaOzR/AhZ6lZLz/TQ9H+MFovBLgeJjhzyItHGPl1Di/u3oeXytfKDrBMAB3
         9XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706619357; x=1707224157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88kOMxpRh5tAObRmPXyCk/QNnNc3+Rv4rm/m6cAfp0o=;
        b=BM/p7CXA5gg8VzzidmX6GtMRzC2yJMz7tv0mCcKW7ZVJ5K/nnUQaIQ32uf02QPb13W
         UBtKJ1xdzpP6wajjU/ynzvDEsljeae9VVlPNNt/8PFpZa8igg9LTaJVmnZUrb8A7LcSu
         tzYlgMPITH4DRhPHMHfMGe9hRa3m7Tdqj7N3RQ6vLcJ5i8q73GCCL1MpyAOJbK3MuzQM
         ynhVH1tu3NDsC2g6wmWbftOUbDwBXyE+bWSmA8p+oQNdHbijj9lfuId45JjbTevqthAg
         6SjmaVqRzz8adtbko7c1kObYTsL1x/7JpOinE+PIrR8mJndmcBUC6Lt1F4D4tVe4FAVx
         +3ag==
X-Gm-Message-State: AOJu0Yyf/t7mZsvtv9c7+zdEydLEoVhDwf9FYi5DHnGL97P/HIE8hLNi
	LiZTqysu8TMy1mbt+35k3LzadSRexHGtidxdjWLZ/YnBx8HnoouYeQtNHpZ7jg==
X-Google-Smtp-Source: AGHT+IGF9V5XLEZipbvW5/1HBV5SqmzX96/WKl7UpPsi5xotG9GxTuPORqIAvUWQxIY8UZrzW5RtKQ==
X-Received: by 2002:a05:651c:b29:b0:2d0:4c1c:4c10 with SMTP id b41-20020a05651c0b2900b002d04c1c4c10mr3987364ljr.53.1706619357643;
        Tue, 30 Jan 2024 04:55:57 -0800 (PST)
Message-ID: <2ded2ffa-70cb-4d91-8c52-d36bc2ee3705@suse.com>
Date: Tue, 30 Jan 2024 13:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XTF: tests SPEC_CTRL added bits
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130102719.51150-1-roger.pau@citrix.com>
 <7f514c59-dbf1-44ea-a589-dbc43f0b4ee4@suse.com> <Zbjhica05LIMB9zX@macbook>
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
In-Reply-To: <Zbjhica05LIMB9zX@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2024 12:46, Roger Pau Monné wrote:
> On Tue, Jan 30, 2024 at 11:42:43AM +0100, Jan Beulich wrote:
>> On 30.01.2024 11:27, Roger Pau Monne wrote:
>>> Dummy set/clear tests for additional spec_ctrl bits.
>>> ---
>>>  docs/all-tests.dox  |   2 +
>>>  tests/test/Makefile |   9 ++++
>>>  tests/test/main.c   | 100 ++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 111 insertions(+)
>>>  create mode 100644 tests/test/Makefile
>>>  create mode 100644 tests/test/main.c
>>
>> I'm puzzled: Why "test"? That doesn't describe in any way what this test
>> is about.
> 
> That's just my place holder for random XTF stuff.  I don't intend this
> to be committed.

Could have been said then one way or another.

Jan

