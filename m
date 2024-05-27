Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896678D0680
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 17:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730870.1136133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcZE-00019k-Pd; Mon, 27 May 2024 15:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730870.1136133; Mon, 27 May 2024 15:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcZE-000189-Mv; Mon, 27 May 2024 15:47:20 +0000
Received: by outflank-mailman (input) for mailman id 730870;
 Mon, 27 May 2024 15:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBcZD-000183-6u
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 15:47:19 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6591179a-1c40-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 17:47:18 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57863e2846aso2499341a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 08:47:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8adf3sm503577766b.152.2024.05.27.08.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:47:17 -0700 (PDT)
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
X-Inumbo-ID: 6591179a-1c40-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716824837; x=1717429637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ATlsmN+bmj/HiE0VTmIBWCuXSVFuzG7kUKN7+vs1uyA=;
        b=AREJred5v1C1MIVsQ+9N6XbraPg4lhwhf/zl6vxoyc6B/QNpLnkazU59xJ9nj2tTMi
         8yGow02Y2aPATL7bm9tna9C1bDmbet9QjmCAHI0IJVHG/obcevxYfYkbE8LCXCgdtq7h
         4OLmnXObVMMYYjW7PUsLCxY7u/MO1p7IniD4yHzFNz1bpkyTf01ZJsbyESC6jcCoH6J7
         vFcLFCVRtVzv+6rWjJk2+c2P69CPswGzw01rW3La1qNFuDiNH0WW07YJpUZpSrw59qsd
         P3fDJIT8nx4ZkigBEHZ5/WHi8zISBY2NRdnVN2PL7eVFjxi4m4rPcNRjlxizJYkcXfCM
         Q0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716824837; x=1717429637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATlsmN+bmj/HiE0VTmIBWCuXSVFuzG7kUKN7+vs1uyA=;
        b=FGPYvuJxiFNXFTBQ4NLlG+LpoH4svKbJuGpve2Y8sHwo5Ukvgvziy7oD0Im2K65B4s
         BL720KJ6Li7nMJlEAt5kdoonpE+8qtArkEyUdwhjbojiL2Sk5GfQ5W4nqoA8o+iuag3j
         pyVpsjwqxcDGWr8+funYEdvkk+qabsROLmq8siZ5AHVmMf7R3jY2M3T60LNaxRdwQZbP
         lXAFOjTcsxX9J6zH8RPem5f7PzQUp9mo5wJgkRAGo8qjWTULTwgCrZZzK8J91TGnJg0A
         aypF8XOyvfDPQ727FiFPwooulCSoFfx74Mbc82j33nBHEtz6PoFgyCNUEfSjo5P6CwSo
         GQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK49i4dzKjgUvEq5sOHpf8S0FxucrhpZuaIOccCKlc7ajvgVQAPhZCSiLgh2qKQ+X4JH69joa1BXdkIly+o6olvx1uQAoF43FYu8ShoIk=
X-Gm-Message-State: AOJu0YwagdRX1c2sUTxJHoJzogrTTIHXxOKk23JqvfCclMpqPMrYzCfJ
	v+4iAAyArd9EIDvjldeWeO134wsU78iMBqA1Af7C3cOnBM2aVYdHW6JM2U7cvQ==
X-Google-Smtp-Source: AGHT+IHfdG2Mi/nqGAejZUWAIpzGuWpq09htjd7hE3z91IIk7E9ZquVmK1AkDaOEztQxI3sK7paiYQ==
X-Received: by 2002:a17:907:868c:b0:a62:dfa1:c9ea with SMTP id a640c23a62f3a-a62dfa1caa7mr348286866b.3.1716824837585;
        Mon, 27 May 2024 08:47:17 -0700 (PDT)
Message-ID: <9b5890de-ce5b-424c-80f9-3be83e9b94f0@suse.com>
Date: Mon, 27 May 2024 17:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 0/3] x86: make Intel/AMD vPMU & MCE support
 configurable
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Oleksii,

On 22.05.2024 10:37, Sergiy Kibrik wrote:
> Three remaining patches to separate support of Intel & AMD CPUs in Xen build.
> Most of related patches from previous series had already been merged.
> Specific changes since v3 are provided per-patch.
> 
> v3 series here:
> https://lore.kernel.org/xen-devel/cover.1715673586.git.Sergiy_Kibrik@epam.com/
> 
>   -Sergiy
> 
> Sergiy Kibrik (3):
>   x86/intel: move vmce_has_lmce() routine to header
>   x86/MCE: add default switch case in init_nonfatal_mce_checker()
>   x86/MCE: optional build of AMD/Intel MCE code

As I'm apparently confused as to the state 4.19 is in, may I please ask
whether this series is still okay to go in, or whether it should be
postponed until after branching.

Thanks, Jan

