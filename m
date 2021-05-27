Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42653392E41
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133176.248289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFRe-0002Hr-PU; Thu, 27 May 2021 12:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133176.248289; Thu, 27 May 2021 12:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFRe-0002F5-MP; Thu, 27 May 2021 12:49:02 +0000
Received: by outflank-mailman (input) for mailman id 133176;
 Thu, 27 May 2021 12:49:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lmFRd-0002Ez-3t
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:49:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmFRc-0007nA-DB; Thu, 27 May 2021 12:49:00 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmFRc-00085G-6u; Thu, 27 May 2021 12:49:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=X4Zh/dC30NMhdSNeODepjxj3SVeV7Cnxn6uvTd/yxow=; b=gIrhj1CIYxMfzdVwi/f9hevkb+
	KJw1GBezu4xU+UIIeDWDhJebrB2v9M6gKaUd1AWaxHboj9IczSnvEcuMxjZo9FtKRcwj0L8X4/9+P
	7D/+YCtU5DkNTRRjDtVmyN8UZ9ukugNt1SbgmPJYsp63GWWgGNwUxl5dBz+5E6zirofs=;
Subject: Re: [PATCH v2 01/12] x86: introduce ioremap_wc()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <20abac99-609c-f4f6-1242-c79919f4c317@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b8035805-4f44-18ce-f4cb-4ce1d3c594fc@xen.org>
Date: Thu, 27 May 2021 13:48:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20abac99-609c-f4f6-1242-c79919f4c317@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/05/2021 13:30, Jan Beulich wrote:
> In order for a to-be-introduced ERMS form of memcpy() to not regress
> boot performance on certain systems when video output is active, we
> first need to arrange for avoiding further dependency on firmware
> setting up MTRRs in a way we can actually further modify. On many
> systems, due to the continuously growing amounts of installed memory,
> MTRRs get configured with at least one huge WB range, and with MMIO
> ranges below 4Gb then forced to UC via overlapping MTRRs. mtrr_add(), as
> it is today, can't deal with such a setup. Hence on such systems we
> presently leave the frame buffer mapped UC, leading to significantly
> reduced performance when using REP STOSB / REP MOVSB.
> 
> On post-PentiumII hardware (i.e. any that's capable of running 64-bit
> code), an effective memory type of WC can be achieved without MTRRs, by
> simply referencing the respective PAT entry from the PTEs. While this
> will leave the switch to ERMS forms of memset() and memcpy() with
> largely unchanged performance, the change here on its own improves
> performance on affected systems quite significantly: Measuring just the
> individual affected memcpy() invocations yielded a speedup by a factor
> of over 250 on my initial (Skylake) test system. memset() isn't getting
> improved by as much there, but still by a factor of about 20.
> 
> While adding {__,}PAGE_HYPERVISOR_WC, also add {__,}PAGE_HYPERVISOR_WT
> to, at the very least, make clear what PTE flags this memory type uses.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Mark ioremap_wc() __init.
> ---
> TBD: If the VGA range is WC in the fixed range MTRRs, reusing the low
>       1st Mb mapping (like ioremap() does) would be an option.
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5881,6 +5881,20 @@ void __iomem *ioremap(paddr_t pa, size_t
>       return (void __force __iomem *)va;
>   }
>   
> +void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
> +{
> +    mfn_t mfn = _mfn(PFN_DOWN(pa));
> +    unsigned int offs = pa & (PAGE_SIZE - 1);
> +    unsigned int nr = PFN_UP(offs + len);
> +    void *va;
> +
> +    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> +
> +    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
> +
> +    return (void __force __iomem *)(va + offs);
> +}

Arm is already providing ioremap_wc() which is a wrapper to 
ioremap_attr(). Can this be moved to the common code to avoid duplication?

Cheers,

-- 
Julien Grall

