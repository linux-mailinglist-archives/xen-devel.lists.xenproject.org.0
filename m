Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565187E2ADA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 18:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628240.979468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r03Gy-0005VH-IA; Mon, 06 Nov 2023 17:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628240.979468; Mon, 06 Nov 2023 17:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r03Gy-0005Sq-F3; Mon, 06 Nov 2023 17:20:24 +0000
Received: by outflank-mailman (input) for mailman id 628240;
 Mon, 06 Nov 2023 17:20:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r03Gx-0005Sk-9X
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 17:20:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r03Gw-0007UL-SK; Mon, 06 Nov 2023 17:20:22 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.14.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r03Gw-0002oo-KR; Mon, 06 Nov 2023 17:20:22 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=IDnGh/AYMoQD8T3di00ptgrEEFC0VvzvYfbGbs9gsqU=; b=zgX4jg35fhz95gl0i5F3UkB86K
	JZJcifjKvBDZXZW+at9SUMeiIGh7aCxJUQTXOtWndoktpdaPqHPhDF8olnIb0Boy4pUehU3u4SB4Q
	0qPeX9F3iZAW6j0WaCN1JH9jtpIJgnPN+ahOpVpkmjd+nBgT9NQdwcgQlLXcGM7BP/Hs=;
Message-ID: <63c5c386-ccff-4688-a335-3983129392b8@xen.org>
Date: Mon, 6 Nov 2023 17:20:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm32: head Split and move MMU-specific head.S
 to mmu/head.S
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@arm.com,
 henry.wang@arm.com, Volodymyr_Babchuk@epam.com
References: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
 <20231103173436.3912488-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231103173436.3912488-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 03/11/2023 17:34, Ayan Kumar Halder wrote:
> The MMU specific code in head.S will not be used on MPU systems.
> Instead of introducing more #ifdefs which will bring complexity
> to the code, move MMU related code to mmu/head.S and keep common
> code in head.S. Two notes while moving:
>   - As "fail" in original head.S is very simple and this name is too
>     easy to be conflicted, duplicate it in mmu/head.S instead of
>     exporting it.
>   - Use ENTRY() for enable_secondary_cpu_mm, enable_boot_cpu_mm and
>     setup_fixmap as they will be used externally.
> 
> Also move the assembly macros shared by head.S and mmu/head.S to
> macros.h.
> 
> Note that, only the first 4KB of Xen image will be mapped as identity
> (PA == VA). At the moment, Xen guarantees this by having everything
> that needs to be used in the identity mapping in .text.header section
> of head.S, and the size will be checked by _idmap_start and _idmap_end
> at link time if this fits in 4KB. Since we are introducing a new head.S
> in this patch, although we can add .text.header to the new file to
> guarantee all identity map code still in the first 4KB. However, the
> order of these two files on this 4KB depends on the build toolchains.
> Hence, introduce a new section named .text.idmap in the region between
> _idmap_start and _idmap_end. And in Xen linker script, we force the
> .text.idmap contents to linked after .text.header. This will ensure
> code of head.S always be at the top of Xen binary.
This paragraph doesn't make much sense as you don't introduce 
.text.idmap. Instead, you piggy back on a previous commit. So I would 
suggest to delete it.

[...]

> +.macro create_mapping_entry, ptbl, virt, phys, type=PT_MEM_L3
> +        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
> +        lsr   r1, \virt, #THIRD_SHIFT
> +        and   r1, r1, r2             /* r1 := slot in \tlb */
> +        lsl   r1, r1, #3             /* r1 := slot offset in \tlb */
> +
> +        lsr   r4, \phys, #THIRD_SHIFT
> +        lsl   r4, r4, #THIRD_SHIFT   /* r4 := PAGE_ALIGNED(phys) */
> +
> +        movw  r2, #\type             /* r2:r3 := right for section PT */
> +        orr   r2, r2, r4             /*          + PAGE_ALIGNED(phys) */
> +        mov   r3, #0
> +
> +        adr_l r4, \ptbl
> +
> +        strd  r2, r3, [r4, r1]
> +.endm

Newline here please.

> +.section .text.idmap, "ax", %progbits

Cheers,

-- 
Julien Grall

