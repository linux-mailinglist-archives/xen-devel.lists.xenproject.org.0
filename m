Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4FF819C1D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 11:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657592.1026545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtTb-0000SD-30; Wed, 20 Dec 2023 10:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657592.1026545; Wed, 20 Dec 2023 10:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtTa-0000Pj-W4; Wed, 20 Dec 2023 10:06:54 +0000
Received: by outflank-mailman (input) for mailman id 657592;
 Wed, 20 Dec 2023 10:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFtTa-0000OJ-9R
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 10:06:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f2e87bb-9f1f-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 11:06:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so69056655e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 02:06:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b0040d128e9c62sm6761130wmo.18.2023.12.20.02.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 02:06:51 -0800 (PST)
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
X-Inumbo-ID: 7f2e87bb-9f1f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703066812; x=1703671612; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGL1vybcF2qZj64Irbe5qdy2a6Tb1z/WAMJzgQlnykI=;
        b=RZETiUq8HNtI0nRnJofgvEZ5LqVC81CD79PpP9JaLndK1aVXN1OL5nYIOt2qEd5xdF
         NsajUf6OkJ3/i2th5TDz+cQEzVBEsAARV/LWHhaeQpze23lI+oIsGU8n/KONmh4PE/JK
         7XQWd1e72dVSoxX7zXo+QfELtChk+/k0zCPfq/38/C1jh3DC+6x1l2MblovUG5vEuMKR
         Vn8wMbz1jJsYS+pI4O4VrSGqHwfbQ47BtWSjzR8lrApBp6z/t95otvrOb2qmhoKq07xB
         MCqMLUSPUx6nOmoTew9ESNA9/WRlh0F8GxdGIiDShzUKO+RRLcRMtS/lQ1PcGMj6/mcW
         LXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066812; x=1703671612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGL1vybcF2qZj64Irbe5qdy2a6Tb1z/WAMJzgQlnykI=;
        b=NM8RAfIwAnCXEbUwoeZ+09sj4/cGJbW1KsnzGUAegM3m3K6WtPCR71lf++Ynjx6Tod
         G7TuU6Jb10eO1Iii6swjmwFyfXrg2F29DHaq1iEjbp137Z88Zy+Unhlfcwnke7RD73tJ
         8YhhbwFXPADn10pNjMPPK2p5/Inw376QnybfnHRUUgYsCeeuVRlgz6mavsTqGU23qG0C
         88z3t1xKbt8ZgvglC4WKhSonYxWIqOqyfwImBZDMGCUEDTsh1qL9RoE2VK0FRytb7PXW
         2+hTFgfsX3DqoYuAucPziJ+kj0zJMr9ASbuBBpXoOfiPp28bBFO2T1flOfTiCnBJ/wyK
         FIXg==
X-Gm-Message-State: AOJu0YwW/Sf1lJwBOZNMAJVhoZ38rNpVSc843UVTtzbniY97Sscdk95v
	G49wuRdj6ejZW3NHf+GXuV0N
X-Google-Smtp-Source: AGHT+IH8S8vlAa5rjcKA35k4+ObP5tOaXjKCTtQ/T+EAZZZdyNMtmJb0xixW4EiM6uLTaJqrfEKzRw==
X-Received: by 2002:a05:600c:19d3:b0:40d:123a:4f26 with SMTP id u19-20020a05600c19d300b0040d123a4f26mr3071146wmq.230.1703066811683;
        Wed, 20 Dec 2023 02:06:51 -0800 (PST)
Message-ID: <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com>
Date: Wed, 20 Dec 2023 11:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
 <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
 <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com>
 <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
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
In-Reply-To: <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 01:23, Sébastien Chaumat wrote:
> I had to triple check:
> 
> The first call is from xen_register_pirq()  and seem to originate from
> early_irq_init()  : triggering is 1
> in this first call the HYPERVISOR_physdev_ops is called with triggering 1
> shareable 0
> 
> The second call is from xen_register_pirq() called from xen_register_gsi() :
>   trigger=0 polarity 1 at the start of  xen_register_pirq()
> but then trigger=1 polarity=1 just before the call to PHYSDEVOPS_setup_gsi

I'm sorry, but this is getting extremely confusing. Can you please supply
a complete kernel log, where also other potentially relevant messages
would be present (like those issued when PHYSDEVOP_setup_gsi has failed,
as ought to happen when invoked the 2nd time for the same GSI)? It's fine
if you want to leave your extra printk()s in place for this, but please
be sure (perhaps by way of also supplying the patch you use) to make clear
where exactly they live, so we can make sense of those extra log messages.

Jan


