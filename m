Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137787309C9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 23:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549236.857668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9XxZ-0002Ml-Ea; Wed, 14 Jun 2023 21:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549236.857668; Wed, 14 Jun 2023 21:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9XxZ-0002K0-AC; Wed, 14 Jun 2023 21:23:21 +0000
Received: by outflank-mailman (input) for mailman id 549236;
 Wed, 14 Jun 2023 21:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBn8=CC=kernel.org=dinguyen@srs-se1.protection.inumbo.net>)
 id 1q9XxY-0002Ju-Ek
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 21:23:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc8c188-0af9-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 23:23:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34A296257E;
 Wed, 14 Jun 2023 21:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E219C433C8;
 Wed, 14 Jun 2023 21:23:12 +0000 (UTC)
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
X-Inumbo-ID: acc8c188-0af9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686777794;
	bh=sfZlQC0KRiU3VFMaS6H5djLiaDuaR3UyKKAHotXoEC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JSy2cjQ3EfZqDH+GRmJ+mjVAAcseGIvPUq3lquiQxXqEjjGqwU+HemD7F3wiC1btN
	 oSofDjGtfqLFUZE6+eF26LaNmlZ0XJSVLI8h3M4XLmim/HM29Na3QWm9DVPo2aVCXI
	 K79BAGLxK+0MfFwKGWozB9O2gr9yZd3Cu5CIDwhRjdpR3tn5b309NHjtR2IQGAy5FI
	 ii48Ct/zrPJGlO6GMB0nxU3tTn8XzvIvT2D58R4sk2Mn4rxTjXdkRPrgiKhp+20BR7
	 UEwrTSQZ099UBshJbATcCyWw+lXzjKCSDECSlkjbQFiwFpFsJU9nBH5UIC1JXPi4An
	 txkWeQKuOaEyQ==
Message-ID: <5729b45b-6a19-2aa8-8722-c50e6a1fceea@kernel.org>
Date: Wed, 14 Jun 2023 16:23:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Hugh Dickins <hughd@google.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-28-vishal.moola@gmail.com>
 <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
 <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/14/23 04:30, Geert Uytterhoeven wrote:
> Hi Dinh,
> 
> On Wed, Jun 14, 2023 at 12:17 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>> On 6/12/23 16:04, Vishal Moola (Oracle) wrote:
>>> Part of the conversions to replace pgtable constructor/destructors with
>>> ptdesc equivalents.
>>>
>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>> ---
>>>    arch/nios2/include/asm/pgalloc.h | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
>>> index ecd1657bb2ce..ce6bb8e74271 100644
>>> --- a/arch/nios2/include/asm/pgalloc.h
>>> +++ b/arch/nios2/include/asm/pgalloc.h
>>> @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
>>>
>>>    extern pgd_t *pgd_alloc(struct mm_struct *mm);
>>>
>>> -#define __pte_free_tlb(tlb, pte, addr)                               \
>>> -     do {                                                    \
>>> -             pgtable_pte_page_dtor(pte);                     \
>>> -             tlb_remove_page((tlb), (pte));                  \
>>> +#define __pte_free_tlb(tlb, pte, addr)                                       \
>>> +     do {                                                            \
>>> +             pagetable_pte_dtor(page_ptdesc(pte));                   \
>>> +             tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
>>>        } while (0)
>>>
>>>    #endif /* _ASM_NIOS2_PGALLOC_H */
>>
>> Applied!
> 
> I don't think you can just apply this patch, as the new functions
> were only introduced in [PATCH v4 05/34] of this series.
> 

Ah, thanks for the pointer!

Dinh

