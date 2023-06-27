Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833147403EA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 21:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556255.868629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEE8e-0005WQ-18; Tue, 27 Jun 2023 19:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556255.868629; Tue, 27 Jun 2023 19:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEE8d-0005Ua-UW; Tue, 27 Jun 2023 19:14:07 +0000
Received: by outflank-mailman (input) for mailman id 556255;
 Tue, 27 Jun 2023 19:14:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZGQ=CP=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1qEE8c-0005UU-RN
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 19:14:06 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a885b3-151e-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 21:14:04 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-66869feb7d1so2817372b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 12:14:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s1-20020aa78281000000b0065a1b05193asm5742654pfm.185.2023.06.27.12.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 12:14:02 -0700 (PDT)
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
X-Inumbo-ID: c7a885b3-151e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687893243; x=1690485243;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kvHLvhv1Vboi73O1yp/Tlc9InhlPe7nOe1kq7T+MFRo=;
        b=bM9Je+tOekLovPkvT+/l7nbya5CmvdUQjXrADEm1UMcV4/Dft3yRiRDI0ZDflduo0a
         eCCHc/eGgHA3aTnPLKW75ZP3+msGkQAgAajr0fU475B6t9dnUbkeGDGaGhTQuEs9G8Em
         fP/NIDTeV8LmgxO8Ql0wOGFl7SgfrLikcvULFnS16kiPfzK7oAB1YpIUgqh/lMxpHyod
         tqWpPiE4/bUvsjhZfVbvFSWKmV4p5zoSojTJH1B4PXJkJ5GFHQt4ps0dwXEGoW/rFJ5j
         7OEFRkR/4WYv521gDAmtenL688/6yjI/zD/BFplexhWDCjqz/HwvAM7QaYSh0oWP3Dui
         ALeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687893243; x=1690485243;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvHLvhv1Vboi73O1yp/Tlc9InhlPe7nOe1kq7T+MFRo=;
        b=Ebi2coiLDpddHgaHm/2iYzCFQ3BcpcUfAVKgeUJ5pNr/3cxZVBF3GxLe+99FEmnXR/
         EO5/qBcC9m02jheCpaAZ//J5miyIfnD+vRKv0PK+hMhFZGNWNRF7wg0kW9vMRij+pkqE
         1E2gBC96ON9YeI1Z8964KN5J3gMngNv15Mter8nEK3oZGpGKnU0Bm7QijX9GzE+iCSiD
         WKnqCOOtUz8WdPDFDR66I9PteKgHIaKDkCTL+UTt/ustu0yCFWUjSlgQ3jCY/MK0bmzM
         yIhbgSCpGbCQ7Rvl8LbySlef1ZdLa00hwC8H4IQsV1FqMdEe2wwAmo/w91aBO+APJC2H
         BkKw==
X-Gm-Message-State: AC+VfDx4HNl2ylzUirMV2SMrYFzuH4SqOg4MMcDWbwPYF/J9JMOnHneu
	32hlnrTBR+uTCfYWgqp7QRQ=
X-Google-Smtp-Source: ACHHUZ7LJIGe+68y+/f7zW8IDz+Iq/yBUPpzssEQrXLR8wKbF9q9Wu20nywq5XNVdfXVbWMgiaxYCw==
X-Received: by 2002:a05:6a00:2490:b0:668:7209:1856 with SMTP id c16-20020a056a00249000b0066872091856mr26446249pfv.14.1687893243046;
        Tue, 27 Jun 2023 12:14:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
Date: Tue, 27 Jun 2023 12:14:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: Vishal Moola <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
In-Reply-To: <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/23 12:10, Guenter Roeck wrote:
> On 6/27/23 10:42, Vishal Moola wrote:
>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>>> Part of the conversions to replace pgtable constructor/destructors with
>>>> ptdesc equivalents.
>>>>
>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>
>>> This patch causes all nios2 builds to fail.
>>
>> It looks like you tried to apply this patch on its own. This patch depends
>> on patches 01-12 of this patchset to compile properly. I've cross-compiled
>> this architecture and it worked, but let me know if something fails
>> when its applied on top of those patches (or the rest of the patchset).
> 
> 
> No, I did not try to apply this patch on its own. I tried to build yesterday's
> pending-fixes branch of linux-next.
> 

A quick check shows that the build fails with next-20230627. See log below.

Guenter

---

$ git describe
next-20230627
$ git describe --match 'v*'
v6.4-12601-g53cdf865f90b

Build reference: v6.4-12601-g53cdf865f90b
Compiler version: nios2-linux-gcc (GCC) 11.4.0
Assembler version: GNU assembler (GNU Binutils) 2.40

Building nios2:allnoconfig ... failed
--------------
Error log:
<stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
In file included from mm/memory.c:86:
mm/memory.c: In function 'free_pte_range':
arch/nios2/include/asm/pgalloc.h:33:17: error: implicit declaration of function 'pagetable_pte_dtor'; did you mean 'pgtable_pte_page_dtor'? [-Werror=implicit-function-declaration]
    33 |                 pagetable_pte_dtor(page_ptdesc(pte));                   \
       |                 ^~~~~~~~~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
   666 |                 __pte_free_tlb(tlb, ptep, address);             \
       |                 ^~~~~~~~~~~~~~
mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
   194 |         pte_free_tlb(tlb, token, addr);
       |         ^~~~~~~~~~~~
arch/nios2/include/asm/pgalloc.h:33:36: error: implicit declaration of function 'page_ptdesc' [-Werror=implicit-function-declaration]
    33 |                 pagetable_pte_dtor(page_ptdesc(pte));                   \
       |                                    ^~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
   666 |                 __pte_free_tlb(tlb, ptep, address);             \
       |                 ^~~~~~~~~~~~~~
mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
   194 |         pte_free_tlb(tlb, token, addr);
       |         ^~~~~~~~~~~~
arch/nios2/include/asm/pgalloc.h:34:17: error: implicit declaration of function 'tlb_remove_page_ptdesc'; did you mean 'tlb_remove_page_size'? [-Werror=implicit-function-declaration]
    34 |                 tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
       |                 ^~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
   666 |                 __pte_free_tlb(tlb, ptep, address);             \
       |                 ^~~~~~~~~~~~~~
mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
   194 |         pte_free_tlb(tlb, token, addr);
       |         ^~~~~~~~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:243: mm/memory.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:477: mm] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile:2022: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

