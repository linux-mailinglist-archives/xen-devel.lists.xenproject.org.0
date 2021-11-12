Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3844EE56
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 22:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225429.389289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mldj9-0004ea-Uz; Fri, 12 Nov 2021 21:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225429.389289; Fri, 12 Nov 2021 21:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mldj9-0004c0-Ru; Fri, 12 Nov 2021 21:04:51 +0000
Received: by outflank-mailman (input) for mailman id 225429;
 Fri, 12 Nov 2021 21:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x1Nn=P7=kernel.org=luto@srs-se1.protection.inumbo.net>)
 id 1mldj8-0004bu-3V
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 21:04:50 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b3f7bc8-43fc-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 22:04:49 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E791961073;
 Fri, 12 Nov 2021 21:04:46 +0000 (UTC)
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
X-Inumbo-ID: 2b3f7bc8-43fc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636751087;
	bh=2qqkfvtrJGfj9ZmJlWd38i/WX7gF70C3dBf8RQ5wumo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nWKXnUDGWsUMLljZWwy6cLNXVB7K6pvM4TVC63shKrCJ5ntl7jiI7TyjgjN/DaUgG
	 1tszX3FTcILOCU+Nzwm1U1DTeeCfmc/WUEkmjj0f2OPtZuWxsclChON1UpBvydc0VV
	 4NhNTvosABJqwc7rr070zxyPklpS/MA+wM61TaEwbyFSLKlpKflfSgfjzebN7VrtDp
	 Olj/uhTTwVazAwg4w2O8yXqbf3mnsbcd++WIU1H6g9zf7z2EhgQoVCfrBTIgSNHU4X
	 Tzyg3w+4BNBZsfP4xd3pLcCvxFOtB5vPBNK2VyW4vLOnAv9iFTU+8bLAw0Zw0cp0A5
	 kWvXSr6aG3QmA==
Message-ID: <d7c27a98-a2da-17c8-22c3-e13fadbb9a8c@kernel.org>
Date: Fri, 12 Nov 2021 13:04:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/2] Nuke PAGE_KERNEL_IO
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20211021181511.1533377-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/21 11:15, Lucas De Marchi wrote:
> Last user of PAGE_KERNEL_IO is the i915 driver. While removing it from
> there as we seek to bring the driver to other architectures, Daniel
> suggested that we could finish the cleanup and remove it altogether,
> through the tip tree. So here I'm sending both commits needed for that.
> 
> Lucas De Marchi (2):
>    drm/i915/gem: stop using PAGE_KERNEL_IO
>    x86/mm: nuke PAGE_KERNEL_IO
> 
>   arch/x86/include/asm/fixmap.h             | 2 +-
>   arch/x86/include/asm/pgtable_types.h      | 7 -------
>   arch/x86/mm/ioremap.c                     | 2 +-
>   arch/x86/xen/setup.c                      | 2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
>   include/asm-generic/fixmap.h              | 2 +-
>   6 files changed, 6 insertions(+), 13 deletions(-)
> 

Acked-by: Andy Lutomirski <luto@kernel.org>

