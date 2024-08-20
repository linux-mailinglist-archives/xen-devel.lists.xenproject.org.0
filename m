Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883279588CB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780485.1190101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPfv-00056R-AR; Tue, 20 Aug 2024 14:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780485.1190101; Tue, 20 Aug 2024 14:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPfv-00053D-6E; Tue, 20 Aug 2024 14:17:31 +0000
Received: by outflank-mailman (input) for mailman id 780485;
 Tue, 20 Aug 2024 14:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgPft-00052u-8c
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:17:29 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee0a94d3-5efe-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:17:28 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8643a6bd55so135356466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:17:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935636sm765467766b.108.2024.08.20.07.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 07:17:27 -0700 (PDT)
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
X-Inumbo-ID: ee0a94d3-5efe-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724163447; x=1724768247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xIFu3eXXC6BZWMtQvTcfkJ9FTyBOmbeQdTdtEp0Sch8=;
        b=cHyT56E3v81oPNBEmkMiUtLE5UQrip47OIPImFRSwI7e5FSpPisRq+v3avlCjmUdNz
         4R0XfgpyRKAykQpOqmubHAg0F3VkJ0bXHdNZyzxZybYEJ9WYJoXqamahJF9BM+igPxLB
         vHJMQ+PW/D32u6Uk8wNsuTIKKPuS+Vo/AKMDKe9QQQ6m8VKeLyULcNo7etgO/0iOiQwh
         8lWnKyC/YHkkuhOGrS9Mdt5eg7KO7G0UzqR2yrGR3Vwq8RwW/smoAIThsUE9G8bMVPsn
         po37Z/V9ZJkxHMC3DpL4J57brJ/Rz5iq9a8r8TWKhVwzn7drznr1qTusV+lmrkWqp2Pt
         EmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724163447; x=1724768247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIFu3eXXC6BZWMtQvTcfkJ9FTyBOmbeQdTdtEp0Sch8=;
        b=wGwWL6CVKuk2W0tGW7V8iMx7KnWdWTR/2Sfqpmtg9t6vaDymikaoO5lF467IxDWQJY
         KvI5w6Luc4bnkg6Fxd0/ccUlYK4IrKivK5QIFM9uijABXyUzf6ve4WRKjtr2SzLA6OIZ
         cahr19NDdOYacEeEssUZMyzanduVSkSDqBpjEnqF7JJbbcIiMuGJGvH6UHYvjORrsUuU
         yxfKaE/x5ggwBGj/NaM16yDle9nC12AT0RuwqeL2JlcL863QPspXPR8qpjwD3Th5N4Ta
         2+gM8v9kAtDweX0dGrYkQ1/uom164nWw6o7rpjt6PV8DHEUvzFZbn6fsmFxsqyDCfSlc
         m4lw==
X-Forwarded-Encrypted: i=1; AJvYcCUOVLEF5VEhX8mT92eWHGp0Yqs+ELkM3eE6m7pFfLvE/PatiLCKAAV8cSG2eF1mefGf4UwL/JSez4s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUmXpY5oK/DXImyNtimTnCDq5uZ4zCtcpZzt8L+QzZy4W7RZUG
	iMT8VLdjLCE+kixrlKmHetLGbR8HrUPDd/T06AJv/q8/QkmQKiYnVcJNm6aeKw==
X-Google-Smtp-Source: AGHT+IFU4QOgvTusAyGVO9nsb/NTDKNuuPSsoNaSykI7s319YjH2juS6on/uTmstZZRx2aczxHfupA==
X-Received: by 2002:a17:907:e663:b0:a72:af8e:15af with SMTP id a640c23a62f3a-a83929f12bcmr1035284266b.49.1724163447406;
        Tue, 20 Aug 2024 07:17:27 -0700 (PDT)
Message-ID: <6e9715ba-7c49-426e-bff4-7569638c0a4b@suse.com>
Date: Tue, 20 Aug 2024 16:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mini-os: mm: introduce generic page table walk
 function
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-2-jgross@suse.com>
 <20240820115248.34qg23znyx5qoh37@begin>
Content-Language: en-US
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
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
In-Reply-To: <20240820115248.34qg23znyx5qoh37@begin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 13:52, Samuel Thibault wrote:
> Juergen Gross, le mar. 13 août 2024 15:41:56 +0200, a ecrit:
>> In x86 mm code there are multiple instances of page table walks for
>> different purposes.
>>
>> Introduce a generic page table walker being able to cover the current
>> use cases. It will be used for other cases in future, too.
>>
>> The page table walker needs some per-level data, so add a table for
>> that data. Merge it with the already existing pt_prot[] array.
>>
>> Rewrite get_pgt() to use the new walker.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: SAmuel Thibault <samuel.thibault@ens-lyon.org>

Samuel - I've taken the liberty to convert the odd upper-case A.

Jürgen - looking at the mini-os short-log is quite odd, and increasingly
so. In the mini-os repo surely all commits are about mini-os; the
subject prefixes are kind of pointless. To nevertheless identify such
patches on xen-devel@, may I suggest to use (taking this patch as an
example) "[PATCH MINI-OS] mm: introduce generic page table walk function"
instead (or, of course, whatever variation thereof you may like better)?

Jan

