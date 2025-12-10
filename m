Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F79CB3F68
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 21:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183295.1506041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTQqL-0007U4-5P; Wed, 10 Dec 2025 20:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183295.1506041; Wed, 10 Dec 2025 20:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTQqL-0007Rp-2Q; Wed, 10 Dec 2025 20:31:25 +0000
Received: by outflank-mailman (input) for mailman id 1183295;
 Wed, 10 Dec 2025 20:31:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TEw+=6Q=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTQqJ-0007Rd-AT
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 20:31:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302c4bef-d607-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 21:31:21 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 371C14EEBC5F;
 Wed, 10 Dec 2025 21:31:20 +0100 (CET)
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
X-Inumbo-ID: 302c4bef-d607-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765398680;
	b=W6jsjiZW8KAE9k0ybSpXaCbNmbxvz2VFvF/Iix9o7Q1jE5nRMyHEaAymSH9UHxnKcnX8
	 U5k53jODoV8jFdGTGl3Ovefp3w36Fhf5Xj/xTG7pDLfuS6d2WJEYzuYrx2wHIWCKIugyk
	 YZgUTxRpjOKXn2s219PSt92VT7vbVRkFZvtuVxDBwQKzN5e6UNJFYv3TIWi0nc6Molyhh
	 8PmcRQTYiG4T/CDNE4ScNKEBWhZzy9I425a92Af1d8+nM2cQBjfNs0mDau2YUcUKQV7sT
	 vI52L8ojy4WgBO2j5vWp/EMQYJCQMaqzC0HHhTmpqw4nQjrh9RztfI8oARpa3e9m5ZWPo
	 x4LG57KU2M/1N9SySXrxSQMFOaAVKEgy4kVe9ABn4jKXqKv08rzylrGDOaFNb8u+gv2FN
	 pWc3OlXApkpXBdL505wYdlZPSmtQEMiNPRYY6x3PriqK6QePoa/Og2jt9rRVjI/kFrJlQ
	 U1C5Qw91PFifXZMOB1O7HWQCDaz7YsoJLvjy6TocGW9zhcHr3NDFptItEHN92nvN2DOr5
	 QU/BIpat8FG6unk2P7ChgQNPpfS2rEbaP0b2+8O+FaN/tLvfrOd+ZQCGJOLZDx0uc4eR0
	 qmhiR7gR41sI+Hn+3TtkZ05ufx0T65p5WvftwTwc2TJLdD90tl5HruDEMeIrTes=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765398680;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=IFtPv0fRj5oPpDqSvLE2K7NjExoOL9e4enph3DpzsSU=;
	b=mnz4l73/omsAWnJJ2Y4jk8ZcYozSz/ywZP4u39zUz/JQPUjE2gahumTk4r/c2uaQFOvX
	 cjJvLmMy21S/AcLjaY7uy24xm8UYJmRvYExoRoa8/pPYnKz+dw1BB0ll81EybNI0gw2zP
	 03ajehwdCEYBIS5ui8wZihpcKEEhCNLwh8H/JjxDBzabniszCYVzaBq7Dln40AgASQTsW
	 5iWdKgFT9qwltPCNyKCKV6OlA2agsUOJK7/bKp1psTzKEGQtrxqEcygh1MarBkZIpQnCf
	 Cli0hyB+Yl4O514dKbl2uqLeJ6052Kj227DMrB8X4CVpaeBBUUHV7i0PP92qQb1tBr1sa
	 YhI5EzALsCVkvE1hRtelRZlTH4iF1ZPc/4U+tlEE2RVDvdGS4QrXGs246twsRfLbEGsV2
	 qGeoiJY1vfd0X3Iu9Yb/EAcQoiU6dIMO9NxfDJruxD1B99PNsBOolnfOmiwySFVPm0fsp
	 ZrR0fQ9DFTR0Kh1vDtpGB+pAWlGeykOC2iD48LNaixYW+bHCnn+EE1LmZYO6cBYh8csos
	 P4lUmrtPqwAfD941K0JjJv2TbwrHKYUoOIqA1wZJnJESv4AcaDvIBUaiSaDvqmfV0894S
	 TKn0+/+KPrj0UHqjU7PXA56iej6Asr9JuYAnpBXZKy423B8iscKfylsTBm5c2II=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765398680; bh=P4myQzANnSHpMz1cu7So0PL/s1C5e8Sj3KWrOgPhUl0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pmSYUhPJTjxoOwZ8QW/a4NgV1safMSPRTHTVgdw7MdcsGdTM+fTmNREj2o/ik8aBJ
	 c2XlKGotQ12t8IONceKC2xnrAUgmtomLUMkWVs3Qua7wAQc+PNEZkJ/QebxR3ojA9i
	 M+FmbAi8Y9T0b6AHy4erjJ1J6nf/jgj9asR/33bVOAkJINdg+er0DVflOls7TTVTWr
	 gr2ogDcXFWBHONt22jFqXPBkTdMXuzfCMDUAka/WErkyipK3WcDghYA+G9FwNIx7iS
	 T0NvPUOzc0OyCAuyODXRmLK5m06n7uj7zu4RNfRO2mJng3EbPmMC6bNNH6r3/McMSl
	 BmamYsWaYgHMw==
MIME-Version: 1.0
Date: Wed, 10 Dec 2025 21:31:20 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 1/5] x86: Misra fixes for U/L suffixes
In-Reply-To: <c9c7deeecc839295d04c5374691f848d@bugseng.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-2-andrew.cooper3@citrix.com>
 <c9c7deeecc839295d04c5374691f848d@bugseng.com>
Message-ID: <aa03d225a116bbb5db0e7a0df61161b5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-10 21:09, Nicola Vetrini wrote:
> On 2025-12-10 19:30, Andrew Cooper wrote:
>> With the wider testing, some more violations have been spotted.  This
>> addresses violations of Rule 7.2 (suffixes required) and Rule 7.3 (L 
>> must be
>> uppercase).
>> 
>> For ELF64_R_TYPE(), cast to uint32_t matching the surrounding 
>> examples.
>> 
>> No functional change.
>> 
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: consulting@bugseng.com <consulting@bugseng.com>
>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/x86/mm/shadow/common.c     | 4 ++--
>>  xen/arch/x86/pv/descriptor-tables.c | 2 +-
>>  xen/drivers/passthrough/vtd/iommu.h | 2 +-
>>  xen/include/xen/elfstructs.h        | 2 +-
>>  xen/include/xen/sizes.h             | 2 +-
>>  5 files changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/xen/arch/x86/mm/shadow/common.c 
>> b/xen/arch/x86/mm/shadow/common.c
>> index 0176e33bc9c7..423764a32653 100644
>> --- a/xen/arch/x86/mm/shadow/common.c
>> +++ b/xen/arch/x86/mm/shadow/common.c
>> @@ -1961,7 +1961,7 @@ int sh_remove_write_access(struct domain *d, 
>> mfn_t gmfn,
>>               /* FreeBSD 64bit: linear map 0xffff800000000000 */
>>               switch ( level )
>>               {
>> -             case 1: GUESS(0xffff800000000000
>> +             case 1: GUESS(0xffff800000000000UL
>>                             + ((fault_addr & VADDR_MASK) >> 9), 6); 
>> break;
>>               case 2: GUESS(0xffff804000000000UL
>>                             + ((fault_addr & VADDR_MASK) >> 18), 6); 
>> break;
>> @@ -1969,7 +1969,7 @@ int sh_remove_write_access(struct domain *d, 
>> mfn_t gmfn,
>>                             + ((fault_addr & VADDR_MASK) >> 27), 6); 
>> break;
>>               }
>>               /* FreeBSD 64bit: direct map at 0xffffff0000000000 */
>> -             GUESS(0xffffff0000000000 + gfn_to_gaddr(gfn), 6);
>> +             GUESS(0xffffff0000000000UL + gfn_to_gaddr(gfn), 6);
>>          }
>> 
>>  #undef GUESS
>> diff --git a/xen/arch/x86/pv/descriptor-tables.c 
>> b/xen/arch/x86/pv/descriptor-tables.c
>> index 02647a2c5047..26f7d18b11b5 100644
>> --- a/xen/arch/x86/pv/descriptor-tables.c
>> +++ b/xen/arch/x86/pv/descriptor-tables.c
>> @@ -216,7 +216,7 @@ static bool check_descriptor(const struct domain 
>> *dom, seg_desc_t *d)
>>               * 0xf6800000. Extend these to allow access to the larger 
>> read-only
>>               * M2P table available in 32on64 mode.
>>               */
>> -            base = (b & 0xff000000) | ((b & 0xff) << 16) | (a >> 16);
>> +            base = (b & 0xff000000U) | ((b & 0xff) << 16) | (a >> 
>> 16);
>> 
>>              limit = (b & 0xf0000) | (a & 0xffff);
>>              limit++; /* We add one because limit is inclusive. */
>> diff --git a/xen/drivers/passthrough/vtd/iommu.h 
>> b/xen/drivers/passthrough/vtd/iommu.h
>> index 29d350b23db6..4f41360c53c0 100644
>> --- a/xen/drivers/passthrough/vtd/iommu.h
>> +++ b/xen/drivers/passthrough/vtd/iommu.h
>> @@ -266,7 +266,7 @@ struct dma_pte {
>>  #define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
>>  #define DMA_PTE_SP   (1 << 7)
>>  #define DMA_PTE_SNP  (1 << 11)
>> -#define DMA_PTE_CONTIG_MASK  (0xfull << PADDR_BITS)
>> +#define DMA_PTE_CONTIG_MASK  (0xfULL << PADDR_BITS)
>>  #define dma_clear_pte(p)    do {(p).val = 0;} while(0)
>>  #define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} 
>> while(0)
>>  #define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} 
>> while(0)
>> diff --git a/xen/include/xen/elfstructs.h 
>> b/xen/include/xen/elfstructs.h
>> index eb6b87a823a8..8770e7454672 100644
>> --- a/xen/include/xen/elfstructs.h
>> +++ b/xen/include/xen/elfstructs.h
>> @@ -360,7 +360,7 @@ typedef struct {
>>  } Elf64_Rela;
>> 
>>  #define	ELF64_R_SYM(info)	((info) >> 32)
>> -#define	ELF64_R_TYPE(info)	((info) & 0xFFFFFFFF)
>> +#define	ELF64_R_TYPE(info)	((uint32_t)(info))

Actually I think this doesn't build:

arch/x86/livepatch.c: In function ‘arch_livepatch_perform_rela’:
././include/xen/config.h:55:24: error: format ‘%lu’ expects argument of 
type ‘long unsigned int’, but argument 3 has type ‘unsigned int’ 
[-Werror=format=]
    55 | #define XENLOG_ERR     "<0>"
       |                        ^~~~~
arch/x86/livepatch.c:332:20: note: in expansion of macro ‘XENLOG_ERR’
   332 |             printk(XENLOG_ERR LIVEPATCH "%s: Unhandled 
relocation %lu\n",
       |                    ^~~~~~~~~~
arch/x86/livepatch.c:332:69: note: format string is defined here
   332 |             printk(XENLOG_ERR LIVEPATCH "%s: Unhandled 
relocation %lu\n",
       |                                                                  
  ~~^
       |                                                                  
    |
       |                                                                  
    long unsigned int
       |                                                                  
  %u

the error location is a bit unclear, but the cast is the culprit

>>  #define ELF64_R_INFO(s,t) 	(((s) << 32) + (uint32_t)(t))
>> 
>>  /*
>> diff --git a/xen/include/xen/sizes.h b/xen/include/xen/sizes.h
>> index f7b728ddab06..d309ebf04406 100644
>> --- a/xen/include/xen/sizes.h
>> +++ b/xen/include/xen/sizes.h
>> @@ -43,6 +43,6 @@
>>  #define SZ_512M                         0x20000000
>> 
>>  #define SZ_1G                           0x40000000
>> -#define SZ_2G                           0x80000000
>> +#define SZ_2G                           0x80000000U
>> 
>>  #endif /* __XEN_SIZES_H__ */

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

