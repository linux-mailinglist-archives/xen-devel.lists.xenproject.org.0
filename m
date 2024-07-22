Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45E938974
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 09:00:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761490.1171419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVn1T-0004fP-7p; Mon, 22 Jul 2024 06:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761490.1171419; Mon, 22 Jul 2024 06:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVn1T-0004du-4l; Mon, 22 Jul 2024 06:59:51 +0000
Received: by outflank-mailman (input) for mailman id 761490;
 Mon, 22 Jul 2024 06:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVn1Q-0004do-RP
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 06:59:48 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faf9bd41-47f7-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 08:59:46 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a77abe5c709so378589166b.2
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jul 2024 23:59:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c922b3esm379427966b.184.2024.07.21.23.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jul 2024 23:59:45 -0700 (PDT)
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
X-Inumbo-ID: faf9bd41-47f7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721631586; x=1722236386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zAQSqkHKNWKln4PjMS1CXP+Ho8wB+BnNbBHJtPZejaI=;
        b=VrHS5n101tmcqWciPD119pvtcR/EutkOHcQsy36iathFk078BE1NpO6N1JHtcKVqkm
         F0US+/+ABRuvrP/K4bCaXe4qqlIFUbS03yPI3jc0MsDWeVVjmrSlQIcaGZB+44kG9RJG
         9DE3ZFVVZgREM7eEZxP4M5KldHb5Eq9spssHuCOLiEShB1KR1KZ+vGpEEupxXEheQ2XT
         UD1l6cxP35nSEajjXdJPJeSPdUnS2lQ9Nuqm48az3HVjkBJcvNCJpXY/O9lGd9TvnYdD
         TWVJi5Ae2tiH0MkNN2gFRo14fWxQkzdxKuBK8oMafwjohHUCMzgU8kr0ysGr8SSzAQhh
         cUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631586; x=1722236386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAQSqkHKNWKln4PjMS1CXP+Ho8wB+BnNbBHJtPZejaI=;
        b=Ystb8mZ/gCBw+Td8hfbvGIU4OHah0sGt0Ew1JKwXqSxGrqBdDZGIRPw2GekMXER7py
         tfZB5UFyoLqSZWEK1WYgv8Ygio8iFkTErSmNZs6El01W34rHkmtSfLPS0a0zT0VgAa5t
         U39HXLs5ea6kcpkaUsictLKziuI50XREpSdeku6BZtghF6pEBhYTtjpvUUK3YGhTwoHy
         e3t5cjNZf16Asa1W+oEfT+P+yrDDtxqbQYO2XwG8WojJFrqnvatfL6sx7mVnyCd1r2fi
         T6O7EVlBD78ZTvbUrR6t/xxlLobzAjUeTuB3Mdd8QyZwTY5xr2mjuT29umhVqihEWkgP
         nngA==
X-Forwarded-Encrypted: i=1; AJvYcCWlq+iSkK5o051wj7lkX3aB9gxm+qXXUo9louu1Gnn+8zdS/+MgujXGXJMOiT+YvhywFn4zMcjlh/KIVstxte1VamogyU2AEp/WpR5cVps=
X-Gm-Message-State: AOJu0YwBQXQvTBpcv9X9c8eN0RFw8L64dOGAdQ8jPUz6YY4ATh7FqiER
	uxP36hYG9TbleaIuC4ZxQZAzt6UAwWeKZagnFUB8B1MI4V/+p5vQlZfciOZpcA==
X-Google-Smtp-Source: AGHT+IFAyjQK+ffd8R7nbWOp5Fo3L9PjImt/ZVPSTW0lme6CeN7YnpjgOTQUtOoFp6k6n0eOq/Zv7g==
X-Received: by 2002:a17:907:968e:b0:a77:d85c:86fa with SMTP id a640c23a62f3a-a7a4bfe5ebcmr421189666b.13.1721631585926;
        Sun, 21 Jul 2024 23:59:45 -0700 (PDT)
Message-ID: <dcab8b1b-d775-4529-868c-e976344cf01d@suse.com>
Date: Mon, 22 Jul 2024 08:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] xen/riscv: introduce generic Xen page table
 handling
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <f2d7f538edb7db8990bf26b791df9da3d390bf05.1720799926.git.oleksii.kurochko@gmail.com>
 <5187f606-0a1c-4812-8f8c-13301f0aba8c@xen.org>
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
In-Reply-To: <5187f606-0a1c-4812-8f8c-13301f0aba8c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.07.2024 11:02, Julien Grall wrote:
> Hi,
> 
> On 12/07/2024 17:22, Oleksii Kurochko wrote:
>> At least, between Arm and RISC-V most of the code related to Xen page
>> table handling are common.
>>
>> This GENERIC_PT code is based on Arm's arm/mmu/pt.c except some minor
>> changes such as introduction of the following functions:
>>    * get_root_page()
>>    * xen_pt_check_contig()
>>    * set_pte_table_bit()
>>    * sanity_arch_specific_pte_checks()
>>    * get_contig_bit()
>>    * set_pte_permissions()
>>    * flush_xen_tlb_range_va()
>> It was done because not every functions has the generic pte_flags and
>> it could be a different positions of the PTE bits in a PTE.
> While I am always in favor of trying to avoid code duplication, I am not 
> sure the page-tables are one that should be.
> 
> For instance, you don't have the concept of contiguous page in RISC-V (I 
> see you introduce dummy flags, but IMHO this is a bit of a hack). All 
> the code was also written in a way to avoid temporary conflict mappings. 
> This is to avoid using Break-Before-Make. But on newer hardware this 
> could be relaxed.
> 
> I am interested to know what the others thinks.

I share the concern; I was rather surprised to see the title, but - not
having had the time to look at the patch yet - was kind of guessing
(hoping) it wasn't really what the title said. Page table handling quite
likely wants to remain arch-specific.

Jan

