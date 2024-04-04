Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D66898BE9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 18:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700966.1094873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPjp-00021C-SV; Thu, 04 Apr 2024 16:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700966.1094873; Thu, 04 Apr 2024 16:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPjp-0001z9-Pu; Thu, 04 Apr 2024 16:14:53 +0000
Received: by outflank-mailman (input) for mailman id 700966;
 Thu, 04 Apr 2024 16:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsPjo-0001yz-L0
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 16:14:52 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7737916e-f29e-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 18:14:51 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-343cfe8cae1so268081f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 09:14:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h9-20020adffa89000000b003435e1c0b78sm8142914wrr.28.2024.04.04.09.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 09:14:50 -0700 (PDT)
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
X-Inumbo-ID: 7737916e-f29e-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712247291; x=1712852091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3L1VNOnyIkJwaBlwPryLK6UfXUKoC6MtT7cgNiF9p2Y=;
        b=Di0P/Phn+pXQb9y6BcvS9Z1gnt02R2GGst4v0uoSLfmd8++NbwZ10ILfhJ9hQvadO4
         nZhE0GTxa34bguL7LObBMXmfhDm3JyIIWjc45ShCee6HF7I/LstAPzb0MFdRMxVP1hOT
         g3kc+Yg3vTlUnoHEudMsqkF6kSBe9BAQ8jHbcgAT0GhYCmIYfwKVuuTFEjW/C4d0vHNV
         06UwpjrucxSenx2A+zA4Iof9W5aQ4qVdLfgU4p81ABxkHB4EwSKq0zD3eEqyt6QEEq9A
         qzoVYdcB2pFxm5n2XNvmZG+kfD3Tc7/auHwCuC230TubIKygZ3H/n/vxCGiVZXVri+hH
         oxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712247291; x=1712852091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3L1VNOnyIkJwaBlwPryLK6UfXUKoC6MtT7cgNiF9p2Y=;
        b=gJQuggJR2Hg+HVIc8GYBL01KSiEqGLo1HELshRglQQ/5AzyyHYH69CXaGepdiZLVvf
         65S1tPOu3Nzp/FbXgHb35buJ9Ik7vwjZE5hg1oBpOKRwozHyakaBT29YHafiZvlySu/4
         gpPatQ9oklGD/p8HHojWzD0mu1Cem1iFmLayLnxGy4Fd0hWUmothCmiPpn667KzWDHg3
         VqMciAahXx5kQXMRP4FiU99W7AY/8NsLliJOBEfzzrF5Yc3zNQ86zuO9vocnhqywKFC4
         JDQwhhFq8F0qJh5SEgTuTuXD/4uM/xUr0umCIZ+Ca4ZP2/d9VmpweQ2dERMWkq2rpwwJ
         g9VA==
X-Forwarded-Encrypted: i=1; AJvYcCXWRrxBDVbccA6Wv71CIGcUnTOzywZ5HKpqN6Uqm/LP1eT9Jj67yQm+JeI5oaSgkqSbpz+a9bN+c8/VkRd69vEdl5u14isFlIg834m0fQk=
X-Gm-Message-State: AOJu0YyjJj0mTRYPLRiQE/BFg361USWcBfwSySDRFAPH/cYrlm3RaFnK
	D1ovwmddd5lq9HAmRayRuLJlSNRSYbEbjLq/bAxUfKVdyu7ku2vaIWeS+csUMw==
X-Google-Smtp-Source: AGHT+IEszoQzx/4WC1C1GZwb2lBmHxrm+uNYf1ZW1qXFcYHkcyBc+qua47J+mcdzlQW6E0GTRpN1vQ==
X-Received: by 2002:a5d:4007:0:b0:343:98da:ad8d with SMTP id n7-20020a5d4007000000b0034398daad8dmr45512wrp.46.1712247291137;
        Thu, 04 Apr 2024 09:14:51 -0700 (PDT)
Message-ID: <a315c515-8f6a-4222-999b-865f19e15a28@suse.com>
Date: Thu, 4 Apr 2024 18:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/19] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <f0d836be5dbc04468a74cabf9b48a51921bf749b.1712137031.git.oleksii.kurochko@gmail.com>
 <d315dda1-f89e-4028-9aa0-98b4e80c81fc@suse.com>
 <0d09adbb0ac52e6e20252ddd6e599ee15030fad6.camel@gmail.com>
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
In-Reply-To: <0d09adbb0ac52e6e20252ddd6e599ee15030fad6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 18:04, Oleksii wrote:
> On Thu, 2024-04-04 at 17:01 +0200, Jan Beulich wrote:
>> On 03.04.2024 12:20, Oleksii Kurochko wrote:
>> Everything else okay-ish to me now, but I can't very well given an
>> ack for
>> a patch depending on things that haven't been committed yet and may
>> never be.
> Except 3 dependency ( which should be dropped as nothing anymore is
> used now from this headers ):
>    #include <asm/fence.h>
>    #include <asm/io.h>
>    #include <asm/system.h>
> 
> It seems everything else doesn't depending on other things, does it?

Didn't I see a STATIC_ASSERT_UNREACHABLE() somewhere?

Jan

