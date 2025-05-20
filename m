Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773ECABDE98
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990911.1374837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOhl-00014o-Bv; Tue, 20 May 2025 15:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990911.1374837; Tue, 20 May 2025 15:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOhl-00012M-97; Tue, 20 May 2025 15:16:33 +0000
Received: by outflank-mailman (input) for mailman id 990911;
 Tue, 20 May 2025 15:16:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHOhj-00012G-2v
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:16:31 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 675fb031-358d-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 17:16:29 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso977033466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 08:16:29 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4466e2sm751054966b.93.2025.05.20.08.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 08:16:28 -0700 (PDT)
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
X-Inumbo-ID: 675fb031-358d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747754188; x=1748358988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Jt+WaOF32QEGnOX5C/q6DxL5WTTbmP1R82M8CRIHk8=;
        b=Ilh5EHkuNXEtTQfsOWktnW1/jPIsjGKLtL1PIumu9JnQ27w5sjrvYIhGL0BsOgTwQb
         Cpc16+xwLLL5Zn0AgCIJsL1ApQKeLnx70Abk7sMeiepogH3y3NNUhwONOxZqK4F0vavt
         5TXOkIrcXKavscN37JI55kN+glF14VdFUHhOg8I71eFofGhOLZX7X42mlgW6jfRbE7VS
         KMT2kf8B/+DbFQhhB5s7goWxXv+bhOmNx0UCSO/x5NwrOC/GmPq5hcr7e6WVfxvb0t+6
         clEhUhXZk6HAY+b0tgvnxGC4jfp4V6l+N0leSYNHd6J2r1b0aR5xVjYlur/tc/HuTSoX
         EuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754188; x=1748358988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Jt+WaOF32QEGnOX5C/q6DxL5WTTbmP1R82M8CRIHk8=;
        b=GqswUnmO9jEQDhTC2t2PD+nYKA8TtY8wkjAl9gLCkWAEGAhlG8aUcBe7G63RQOlACn
         TWnEH23EdkPQjDaQfZVVZns7WvLcIZNFeYDeZeTWrkdk9NrrhEXxRmvfiaW6AsVl94fB
         j8P/R4PsrIImIyeNhLdauolF5FyzzRZwIFHRGbj6FJllPFYyoI5vjTenFhz305CZU1So
         lkBk2w7E1s9ksTW9kFZHyS3Ue7bwFcHjOaKoKEUyP7ePERw/xdtUGW8Udr59UuAszN8/
         u9JJ8XWI4wSZmkQz7LiU5fJ68Upr+jmpap5lcJ0tCLGMLWHHkQ/CSfFJI7rI5tzQ4hEV
         CINA==
X-Forwarded-Encrypted: i=1; AJvYcCVYHtOPwbnAweKp1aInok2wme/xn7xdhceEYwfw0dEI72nbz7Ei/+XUwmN5txhvD5r3amoqDQsuZK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXLMWHVuE0fhV/7kNtHMa7FCWpwed2JfNv8Eptu76QHgIgIJ5f
	eK5YXuprcMtGP5vh021/W1lY25mfvtTgHhdDi8vq0jBGTzAsvm7eUZdP0wfL0DTSbw==
X-Gm-Gg: ASbGncsXE0P1o9H/wIF1dXQiu1gKnw+GoTGWStMoIjSnckzq2Kfw3N6tvo9AujJa+jx
	0M0UnIK8nGONDPPsO4AVoTYQDNqAbgk6nAbd40v/cuBQgvo09W2f53mNFxxV8Xc6CCTmnFPsJCR
	9UVnQ6bY7HkK8IKHtiZvvVLlP5IcgBCEOKBQx6jpwoUMiLmaW2koyfZ7bEuRjdT/HkuuEGa+6nw
	iDEIDYluD/MZqbltadc/rgVB8QExj8VJJcdvlmABeDtyzJoFAGwjQBdM/FJEEo6MMsv7iz08w3k
	BMXkwIDMxOA9mY5Pt14yntYrLphLgr3AGytGk8UiwGzYhYFvgnJBWmU6kYgI1g==
X-Google-Smtp-Source: AGHT+IFTzpq7GkH+rn9eTznDioQ1F3+UPnAL6VC+75nuB2+N2j+FmfinA5Pg6BbJhKEY/DzKJBoIOQ==
X-Received: by 2002:a17:906:c148:b0:ad2:3f1f:7971 with SMTP id a640c23a62f3a-ad52d43839amr1543360566b.8.1747754188463;
        Tue, 20 May 2025 08:16:28 -0700 (PDT)
Message-ID: <701620bf-b76f-4f21-8703-4a6d172eb812@suse.com>
Date: Tue, 20 May 2025 17:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: implement p2m mapping functionality
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <c6324b268bf985e8a5e7254a4b181842a860dd94.1746805907.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c6324b268bf985e8a5e7254a4b181842a860dd94.1746805907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 17:57, Oleksii Kurochko wrote:
> These utilities are needed for building and managing RISC-V guest page
> tables and MMIO mappings by using functions map_regions_p2mt() and
> guest_physmap_add_entry().
> 
> To implement p2m mapping functionality the following is introduced:
> - Define P2M root level/order and entry count.
> - Introdude radix type for p2m types as it isn't enough free bits in pte
>   and the helpers (p2m_type_radix_{get,set}()) to deal with them.
> - Introduce p2m_is_*() helpers() as  pte_is_*() helpers are checking
>   the valid bit set in the PTE but we have to check p2m_type instead
>   (look at the comment above p2m_is_valid() for some details).

May I suggest to name them at least p2me_is_*() then, as they check entries
rather than entire P2Ms? Same perhaps elsewhere.

> - Introduce helper to set p2m's pte permission: p2m_set_permissions().
> - Introduce helper to create p2m entry based on mfn, p2m_type_t and
>   p2m_access_t.
> - Introduce helper to generate table entry with correct attributes:
>   page_to_p2m_table().
> - Introduce p2m page allocation function: p2m_alloc_page().
> - Introduce functions to write/remove p2m's entries: p2m_{write,remove}_pte().
> - Introduce function to allocate p2m table: p2m_create_table().
> - Introduce functions used to free p2m entry.
> - Introduce function for table walking: p2m_next_level().
> - Introduce function to insert an entry in the p2m (p2m_set_entry()).
> - Introduce superpage splitting: p2m_split_superpage()).
> - Introduce page table type defines (PGT_{none,writable_page}, etc).
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/mm.h   |  32 +-
>  xen/arch/riscv/include/asm/p2m.h  |  17 +-
>  xen/arch/riscv/include/asm/page.h |  11 +
>  xen/arch/riscv/p2m.c              | 780 ++++++++++++++++++++++++++++++
>  4 files changed, 829 insertions(+), 11 deletions(-)

It's imo too many things you do in one go here.

Jan

