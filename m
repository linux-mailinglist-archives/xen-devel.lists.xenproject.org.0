Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D638C6A01
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722541.1126611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GuB-0006Cl-Bn; Wed, 15 May 2024 15:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722541.1126611; Wed, 15 May 2024 15:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GuB-0006BF-8i; Wed, 15 May 2024 15:50:59 +0000
Received: by outflank-mailman (input) for mailman id 722541;
 Wed, 15 May 2024 15:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Gu9-0006B9-K8
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:50:57 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea461344-12d2-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 17:50:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e69a51a33so1752361a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:50:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01968sm875337866b.166.2024.05.15.08.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 08:50:54 -0700 (PDT)
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
X-Inumbo-ID: ea461344-12d2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715788255; x=1716393055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gCBH8tcSc17q3r2TgdLdiA8tYhMQC+mdJZ2R4Rxncy8=;
        b=VNHQzaXGtgzKQZEqwhL7EMmEGNVul3x3VpbPurhqMB7BSpoY1nUJjv+kVaDm/fknQW
         ip5ADBFzwzFED7idp6kmRm4STpzTLEctD/FQpqFMvmY46BpYkIXs6Ca3OJxELGAJf4Aw
         KpBH3L34+Dmpg/1JXwZpsgzImHZmFqDsc0ViM78Mu9/PxHgsl4IrZPdw9DzwdOM6flKc
         2Na+TXVZ1kqOHbEPT0KhcV3HwXSwh1uKpezMqudvATXY6fJ5zOc/j0Kvj/EMlMgbkrOP
         flhlsQdrXK8xESvVjTLqvD5mdDXx7rz3x83lkTCZx+/xNT3ETLe+K+b+waoNmCF0Qvrm
         KsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715788255; x=1716393055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCBH8tcSc17q3r2TgdLdiA8tYhMQC+mdJZ2R4Rxncy8=;
        b=rlD6/ls3MFxxgIF4bAc62fjE2mFQNqE92L68zhTMjU0jmXC9BDU2MJNMZcw/l6qRuv
         THOPp02iOf5bmhC5CkGPuLPqrut3P7ht/TvFvzupNsV+q3ppKpocX/eHU1JAYm+UVtFf
         1nzdtEAUIByPbDlv1EKenerpfzHiBx+7/fGMq/I1tnt5X9NXWmeBHocTcechh4dYDA1O
         9b548sb37bAHT0oU4ScPwIrWKriG49wUxL6AqMtDwt+5zTket2FeufHpEHQuOReK1K1j
         tqRKItt4aNCeG3vsPetmq59mbXH9/YKwzZNbob7+H1GEtv9sTi0Ic6BOtWnQS4tekIdJ
         VrRg==
X-Gm-Message-State: AOJu0Yzj92GdpAojmO/ux2aejQ4KcOTrRjm6E6MWZaGKyb/m/U267GR1
	yfNnbiX53czcX6oQlpZ+8Tfw0MtUBFTgduCnEzSEchcBMg1VmKBYj69EXOdU9g==
X-Google-Smtp-Source: AGHT+IFQRA/khRP0tEFvlCmdIDIlH4A5ofEHWuCXHkO+6/yE3ODVRsFf/6tqw8VBH9pl00Wna3R6mw==
X-Received: by 2002:a17:906:1406:b0:a5a:7a4e:7e80 with SMTP id a640c23a62f3a-a5a7a4e7effmr540744366b.72.1715788255171;
        Wed, 15 May 2024 08:50:55 -0700 (PDT)
Message-ID: <256495e6-cd0c-4b6f-a1c0-78cce2338eb5@suse.com>
Date: Wed, 15 May 2024 17:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 13/19] x86/setup: Do not create valid mappings
 when directmap=no
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-14-eliasely@amazon.com> <ZkOFqFrSs41UtjIU@macbook>
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
In-Reply-To: <ZkOFqFrSs41UtjIU@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 17:39, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 01:40:40PM +0000, Elias El Yandouzi wrote:
>> +        {
>> +            l4_pgentry_t *pl4e = &idle_pg_table[l4_table_offset(vaddr)];
>> +
>> +            if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
>> +            {
>> +                mfn_t mfn = alloc_boot_pages(1, 1);
> 
> Hm, why not use alloc_xen_pagetable()?
> 
>> +                void *v = map_domain_page(mfn);
>> +
>> +                clear_page(v);
>> +                UNMAP_DOMAIN_PAGE(v);
> 
> Maybe use clear_domain_page()?

Or else use unmap_domain_page(). v is going out of scope just afterwards,
and UNMAP_DOMAIN_PAGE() is intended to be use when that's not the case.

Jan

