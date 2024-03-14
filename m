Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A45787BDC5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:34:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693231.1081070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklDQ-00048Y-RF; Thu, 14 Mar 2024 13:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693231.1081070; Thu, 14 Mar 2024 13:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklDQ-00046B-OE; Thu, 14 Mar 2024 13:33:48 +0000
Received: by outflank-mailman (input) for mailman id 693231;
 Thu, 14 Mar 2024 13:33:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rklDP-000464-EW
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:33:47 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7afa911e-e207-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 14:33:45 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a466c85ae5fso120689866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:33:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e27-20020a170906375b00b00a45bda3cbb8sm714344ejc.134.2024.03.14.06.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:33:44 -0700 (PDT)
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
X-Inumbo-ID: 7afa911e-e207-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710423225; x=1711028025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DV2fqh8fbe5eNL0l+uJ/zUcvgZUuCCoTF0s8xwQ1OVY=;
        b=VWwc4hHoHUxPRPEcmj2QqhM/itwrJLlr17u9+j0+NL8ksMSEVUFAWfQGQX8J/jEpUH
         pyc5j8CiMADwNe1LICsEtpUNkQKwjMdGDi5HlVUPs4baH989WMVtr8Y6VGS0ZYgz6AQI
         aM6ae+NBrPRMvnP9FLIwOSNYHxpyo9SCDBv6xTA/zYjETYQsyKbZGn9nADv+KifkZ00l
         6KGUqbLESycsiGU0QCbkCvOHm1LdJGsvkeDreNBHwYs93lD9ThYoFEhU6zKHgpMo4/Ze
         QVZ5HO0ZP8jBfGsIpV4SEYTGmA+vE0ky/PDmcwaiiC0v9/atOGYhKoJi+ow/AvnJIxtA
         z0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423225; x=1711028025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DV2fqh8fbe5eNL0l+uJ/zUcvgZUuCCoTF0s8xwQ1OVY=;
        b=vQgJ3sF2khulHPzRlIppo/b5yUD6cTEMXmDXKBoiurVNj4KkMxWG+x7CgvhkPvGbCO
         vpmbnmAWVRYdvBhHXRwFKMdWLkOM+FfUj5cvfg8PoAKHcq24UHb7ut9SD3D/Zwt1MNeb
         nXXUMzPTtV2ficu2DTKtMIdmnYBBEV5YUWL+Zw/BDYJrhCgj5gefo28ed9wCBSwK+o5o
         q4Uyrmu6BFVMAEFlVlQw2uoHBkjTszA3WzwvChHA2MvWlRaKIb4WZGRmJFpNDL0hSXjC
         a7rkFwYznXtQInAe9sACOVtfHFiFZ4BnNW6yffWNtUIOeAVsWMRBlpDygQUwC0ztWjTe
         VqOw==
X-Forwarded-Encrypted: i=1; AJvYcCXI5iRBUyGNSLfzHv8wbiyO51H3JrbEgfI+pKZfIG37K+n+bgjzel/WsLRuDq+b5EL/tqkbrLoyPxnH/NUPbnapdaUYLW09RLhn711uPEs=
X-Gm-Message-State: AOJu0Yx5+UI3QdTsG/pJSziKEbfrbdFeK9Z5A3cVqiYu0/c/1+IKiFmP
	dCdVwMUr6TK74elF2D0fJWHqzaAfEH4fDeXkZHxng6FpujPCA+3sIJD7sro+gg==
X-Google-Smtp-Source: AGHT+IHUmmMCC5Klqzndny8WXRumeBWz+dDrgskqFiTO4npK0S/3in0HysDamns5cEeBPmLMd1WpHw==
X-Received: by 2002:a17:906:298b:b0:a46:1861:ffdb with SMTP id x11-20020a170906298b00b00a461861ffdbmr1151279eje.35.1710423224767;
        Thu, 14 Mar 2024 06:33:44 -0700 (PDT)
Message-ID: <1ea3d5f9-d639-486f-af03-95c75597e7ae@suse.com>
Date: Thu, 14 Mar 2024 14:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "xen/x86: bzImage parse kernel_alignment"
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-2-jason.andryuk@amd.com>
 <82ae53ac-f2d1-4d86-8719-4e5cc2e5f57d@suse.com>
 <ec76d730-e8b8-4354-8d7d-7b6e923e2594@amd.com>
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
In-Reply-To: <ec76d730-e8b8-4354-8d7d-7b6e923e2594@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 14:01, Jason Andryuk wrote:
> On 2024-03-14 03:11, Jan Beulich wrote:
>> On 13.03.2024 20:30, Jason Andryuk wrote:
>>> A new ELF note will specify the alignment for a relocatable PVH kernel.
>>> ELF notes are suitable for vmlinux and other ELF files, so this
>>> Linux-specific bzImage parsing in unnecessary.
>>
>> Hmm, shouldn't the order of attempts to figure the alignment be ELF note,
>> ELF header, and then 2Mb?
> 
> This patch series makes Xen only relocate when the ELF Note is present. 
> Linux PVH entry points today are not relocatable, so that needs to be 
> specified some way.  This new note also includes the alignment, so there 
> is no need to try other means of obtaining the alignment.

Going yet beyond what I said in reply to the patch: The mere presence of
the note, with no data at all, could be sufficient to indicate the
kernel is relocatable, when no other restrictions (min, max, align) apply.

> Also, the ELF header values didn't change with CONFIG_PHYSICAL_ALIGN, so 
> that didn't seem reliable.

Well, that's an observation for Linux. But the interface here ought to be
OS-agnostic.

Jan

