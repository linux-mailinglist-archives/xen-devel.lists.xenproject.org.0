Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FF7C8C57
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 19:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616782.959044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrM00-0000To-QR; Fri, 13 Oct 2023 17:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616782.959044; Fri, 13 Oct 2023 17:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrM00-0000RH-Mn; Fri, 13 Oct 2023 17:30:56 +0000
Received: by outflank-mailman (input) for mailman id 616782;
 Fri, 13 Oct 2023 17:30:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrLzz-0000RB-B8
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 17:30:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrLzy-0007rz-Ul; Fri, 13 Oct 2023 17:30:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrLzy-0006rH-Po; Fri, 13 Oct 2023 17:30:54 +0000
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
	bh=jWgURzHApQplTiloNSchHe1ihWZEvxu2Xo/ys/eL/oE=; b=ZWzYzpiP+MU/0sdvuFbSsvK0Le
	Ia2yR7pX18DcY+/aB78bywVU5Cz8705YRUsil/4JFL+NZ53Fq2nuTi5TUPS5bFiSl3u23WF8yA/Fs
	rnbXmKwgU/vdabJNhzWPDHwQArq64IYuqQmS158pO31w3Hjm2ih+nbfWaRiHqqvlOwcQ=;
Message-ID: <59f35743-fa05-408d-9dca-789da9cd68c2@xen.org>
Date: Fri, 13 Oct 2023 18:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] xen/arm: Extract MMU-specific MM code
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-5-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-5-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/10/2023 02:03, Henry Wang wrote:
> Currently, most of the code is in arm/mm.{c,h} and arm/arm64/mm.c
> is MMU-specific. To make the MM code extendable, this commit extracts
> the MMU-specific MM code.
> 
> Extract the boot CPU MM bringup code from arm/mm.c to mmu/setup.c.
> While moving, mark pte_of_xenaddr() as __init to make clear that
> this helper is only intended to be used during early boot.
> 
> Move arm/arm64/mm.c to arm/arm64/mmu/mm.c. Since the function
> setup_directmap_mappings() has different implementations between
> arm32 and arm64, move their arch-specific implementation to
> arch-specific arm{32,64}/mmu/mm.c instead using #ifdef again.
> 
> For header files, move MMU-related function declarations in
> asm/mm.h, declaration of global variable init_ttbr and the
> declaration of dump_pt_walk() in asm/page.h to asm/mmu/mm.h
> 
> Also modify the build system (Makefiles in this case) to pick above
> mentioned code changes.
> 
> Take the opportunity to fix the in-code comment coding styles when
> possible, and drop the unnecessary #include headers in the original
> arm/mm.c.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

