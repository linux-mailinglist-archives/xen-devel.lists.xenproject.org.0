Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E422947E70
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 17:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772268.1182718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazu0-0000RV-Ad; Mon, 05 Aug 2024 15:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772268.1182718; Mon, 05 Aug 2024 15:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazu0-0000PQ-7G; Mon, 05 Aug 2024 15:45:40 +0000
Received: by outflank-mailman (input) for mailman id 772268;
 Mon, 05 Aug 2024 15:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1saztz-0000PJ-4o
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 15:45:39 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2dfb6f3-5341-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 17:45:38 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa63so11957004a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 08:45:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e83e93sm459814766b.166.2024.08.05.08.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 08:45:37 -0700 (PDT)
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
X-Inumbo-ID: c2dfb6f3-5341-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722872737; x=1723477537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uTXiuz2E7nzM9sjWOqGHxzR6Zq6rjXqESyWGNGV1XJw=;
        b=ML37ttH0o4YVbi4NiMCGQ43b72Po9BpwQ3Qk/qgjAbcysDK6X4w8x3/2VjXGrSQHmg
         4CDEenJlf/jP+dmino06hISY3LbrRkBMp91t/fgs+TzzHa+hfWFd871C+1FLxn7UZrMR
         a91+oNynAfmuNKw0HgyupzR7GyzLxvUAZfXN/RViL+I1heRZ7QYrzF6p31iAGmDJA+LO
         SZ1ijUHJPIF0nCCUIGYyi3wf4b65bbGluc4WwthATsvMapBsi9qtC4HP4ZXM9MBUQ5wr
         paS1DLYzMliI0ZS0ebUAg9C+B+RjdxOkLFFtqcGAQPwPIysJOfR0qebXrZa89Rc9GVOY
         jIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872737; x=1723477537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTXiuz2E7nzM9sjWOqGHxzR6Zq6rjXqESyWGNGV1XJw=;
        b=hAoR9OYydfOJ9dETxBDHGXf40iaJEnGvH8waGEgbpr3Savx08UWL+TEbIIIXYKyKPk
         nLXmq0vRuKaEHuq8dEIkLStbalF8L5cM+zNc0KsQQNaAwCkF/m70Iajkx9FSorNU0dBd
         yQN2Q6j9Wl1NwJRx9nu+pCMq1VEzZkbWar0MM0uT0DVB+VEuIgVQWB9Ler5LwySSK39o
         PC0VwZpXOlnTUj15J+LRFUwrshzow8B2lZjvDf9aKQR2xA0L9DanaQK+ibRttankHYCi
         D7qEriAC+QlfKFoYLUO1XBeeu05ST34Y5aKBcw1A1FLnHPh1flX0WFlsmYDwgk3FPC4X
         Nudw==
X-Forwarded-Encrypted: i=1; AJvYcCVGP4/pZhqDPU3Lq3ktqP0F3IwYRJ6d+NDgXOCbIg+tu/jiWLUQLtjpIzgPf0khxnxloWnuc3rpnee0GIuuCc1YnNH+vPTBYB9me6q4KUE=
X-Gm-Message-State: AOJu0YwCTeNINduBb75LYHx7zimsqcb1cjHjovlGvCtRLZJ2tlJagntQ
	F3pqTct0nsTaYX83jYEBeMvnb92I6qItZR4VDykKAs21gI+dXcfaK89zkuQSZg==
X-Google-Smtp-Source: AGHT+IHg4tnknpAMo2XKplmqlo7xLD7h5Q1ouXahz3QlwrBz/DBSlsgsVh1ZaSlCmQdg892nnUzNVg==
X-Received: by 2002:a17:907:d25:b0:a72:8d40:52b8 with SMTP id a640c23a62f3a-a7dc4db57e9mr934882566b.3.1722872737414;
        Mon, 05 Aug 2024 08:45:37 -0700 (PDT)
Message-ID: <d68f3047-5b12-4802-aac3-bb0b9c76cb08@suse.com>
Date: Mon, 5 Aug 2024 17:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
 <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
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
In-Reply-To: <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2024 17:13, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
>>> +    }
>>> +
>>> +    BUG_ON(pte_is_valid(*pte));
>>> +
>>> +    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap),
>>> PTE_TABLE);
>>
>> I'm a little puzzled by the use of LINK_TO_LOAD() (and LOAD_TO_LINK()
>> a
>> little further up) here. Don't you have functioning __pa() and
>> __va()?
> Can __pa() and __va() be used in this case?
> 
> According to comments for other architectures, these macros are used
> for converting between Xen heap virtual addresses (VA) and machine
> addresses (MA). I may have misunderstood what is meant by the Xen heap
> in this context, but I'm not sure if xen_fixmap[] and page tables are
> considered part of the Xen heap.

I didn't check Arm, but on x86 virt_to_maddr() (underlying __pa()) has
special case code to also allow addresses within the Xen image (area).

Jan


