Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1AD8CABF1
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 12:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726800.1131170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Mab-0000D8-1n; Tue, 21 May 2024 10:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726800.1131170; Tue, 21 May 2024 10:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Maa-00009n-Uk; Tue, 21 May 2024 10:19:24 +0000
Received: by outflank-mailman (input) for mailman id 726800;
 Tue, 21 May 2024 10:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9MaY-00009R-QH
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 10:19:22 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 965662cc-175b-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 12:19:20 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a620a28e95cso127818966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 03:19:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6214655b23sm62857266b.165.2024.05.21.03.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 03:19:19 -0700 (PDT)
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
X-Inumbo-ID: 965662cc-175b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716286760; x=1716891560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKVWzKv/ad9gW/9G47W+be3C1C1SddbZeJ0Z08V47f4=;
        b=Ecz0OKNkZHx4S4G/gs9IUDlfphciCw+WwI2JifODOubLxQ1tOFNk+6rlx+45dYfd7F
         Xt5/6cYzBNfZ/D7/tWM7vKt1Ai/htb9WDi6bkbx6bPi3nZJap6h6jrwIEqzPvCkHoQEE
         vjq7yqB7DwCicxJ+Lb1IeghtXkZ8tpuPabEYWuNNDwiPzuN/JM7Oh0fyiG7QCuq9YQAn
         JkueCs+fTutt+9/wQmJWV0LmGq382bDOwPBVTitZfP7ZLk7MeSGB+MqYcKjMkhCjjpcz
         UD89WpV91ygZ/3s8nFhumwIQoHLD3+RLHQxVuRkaMJyfHA9ieMXvxYal3Lo6bNbRO7Gq
         WJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716286760; x=1716891560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKVWzKv/ad9gW/9G47W+be3C1C1SddbZeJ0Z08V47f4=;
        b=VPmXQFgpTXuen44GC1VnH5KaAPOHN08q85NUu8dMkQuMMx9275NUBKMSUKRTxXYVyr
         FuJNxTgb5Hh1P8LDLL2FXDjEkQPJb/RA6SyU6PlhdbSOSyFyRBeJccZ5lytTFzo+t56g
         Ak5BWZ3N6BV6cicHGxE59PRjQFvJRWQHwGQOGfID6lJsIq1CaiZEpZ/KJioDjqV4ycXk
         TSXFFpkiDUBu6OBFqKm6+H4xDoKdNu3t5qBjgv3aqhbs/cqWozN9Kdg1o2GVywPX6zS6
         QhA/8LO3Sto/lPUMiSBAaD/7IlFsh4+3yISBA3gvLvtFjcujtGNNSYiyRd+XdC2ryel5
         +QMA==
X-Forwarded-Encrypted: i=1; AJvYcCXjlil8ySMOKVe1Wlu31kxyrMn9wpcKDE4f/JPQIVsd9lPdbJj05kLgtrJEw3nDjVGsoulpBtHZRf5f59ahqXMuw+eKCaXnfd5wF4WRC8Q=
X-Gm-Message-State: AOJu0YxML6Wkq2t7sSdVKKKqBagIQWafwSKNEPagWgoQ7oD1z4zE3Fgr
	PT/ds7hpeb4yJf5fBPkzUDhPeSobv3x8x+RDdYCpnQPQpN6qSjVVZ+eHTnErKg==
X-Google-Smtp-Source: AGHT+IGT7FQBMIpsgPKSLJ+EftdaStyRm7Q7Hx0yM8s8RMvxmUykZmlg5kx3goqkF6y6NybAocPwcw==
X-Received: by 2002:a17:906:1797:b0:a5a:8d07:6a00 with SMTP id a640c23a62f3a-a5a8d076e2cmr1223586566b.64.1716286759998;
        Tue, 21 May 2024 03:19:19 -0700 (PDT)
Message-ID: <9cf8e78c-7ce8-4c65-b312-c89b1061a1a7@suse.com>
Date: Tue, 21 May 2024 12:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/6] x86/intel: move vmce_has_lmce() routine to
 header
Content-Language: en-US
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <77bc29d74cdc43539a060bca26495a4115171f6e.1715673586.git.Sergiy_Kibrik@epam.com>
 <a21691b7-224e-446b-a2db-761ffa48107e@suse.com>
 <68e2b3b5-649f-4e53-8700-350bdb8e5b09@epam.com>
 <276192d0-9119-467c-ba8d-b4d808863364@suse.com>
 <19b1896d-459f-4963-9199-50a87d910605@epam.com>
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
In-Reply-To: <19b1896d-459f-4963-9199-50a87d910605@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2024 12:00, Sergiy Kibrik wrote:
> 21.05.24 09:05, Jan Beulich:
>>> This is because MCG_LMCE_P is defined in arch/x86/cpu/mcheck/x86_mca.h
>>> -- so either MCG_LMCE_P (+ a bunch of MCG_* declarations) has to be
>>> moved to common header to be accessible, or local x86_mca.h got to be
>>> included from common arch/x86/include/asm/mce.h.
>>>
>>> As for the MCG_* declarations movement I didn't think there's a good
>>> enough reason to do it; as for the inclusion of x86_mca.h it didn't look
>>> nice at all.
>> I'm afraid I don't follow the latter: Why's including x86_mca.h any worse
>> than what you do right now?
> 
> To include x86_mca.h from asm/mce.h something like this line would be 
> needed:
> 
> #include "../../cpu/mcheck/x86_mca.h"
> 
> I've found only two include-s of such kind, so I presume they're not common.

Indeed, and I have to apologize for not reading your earlier reply quite
right.

Jan

> Besides xen/sched.h includes asm/mce.h before declaration of struct 
> vcpu, so body of vmce_has_lmce(const struct vcpu *v) can't really be 
> compiled in asm/mce.h
> 
>    -Sergiy


