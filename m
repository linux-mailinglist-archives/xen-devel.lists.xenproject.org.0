Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D367AA9CFB
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 22:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976377.1363544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC265-0003PG-JC; Mon, 05 May 2025 20:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976377.1363544; Mon, 05 May 2025 20:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC265-0003Mq-G4; Mon, 05 May 2025 20:07:29 +0000
Received: by outflank-mailman (input) for mailman id 976377;
 Mon, 05 May 2025 20:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC264-0003Mk-EV
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 20:07:28 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b20c8e7-29ec-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 22:07:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BD5BA61F1B;
 Mon,  5 May 2025 20:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C4DC4CEE4;
 Mon,  5 May 2025 20:07:14 +0000 (UTC)
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
X-Inumbo-ID: 8b20c8e7-29ec-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746475636;
	bh=0VGf1wA6wrUQNAP1iK28C/pi619OQRj+cVV0YQpDCss=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CBn/qjyWKUnpvGn+nQWaFdb1kRaSPtpwGDTIc1BRfs9f3stLMXnCoyiHSO1pc6KBo
	 8kJRbmJ2gjkozgMv3lllh3M6H2+tQsoPEjsx+Bk920tm+Za7ghdMGEdtrYZ5Rn3pJN
	 A9Ks/utWXbk5o2dSyknDIuJlZ/XheIGAaxoi2YcUl/2oIz479+MlTpZaYloOhrRmjb
	 yw/343Q0oiepvL6oMAgGto6wNE6R3R6cQ+JmoGb4TEdHpnUbmuEMreRt8KsuwQp+F4
	 8QbdRsbUMApiwnCCmRSgKlVnupsHrCkEhoq28lw2YSJ2R5mOyV3xNhuELWkxlbMBZM
	 Tue5oLLfFyg4g==
Date: Mon, 5 May 2025 13:07:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 7/8] xen/common: dom0less: introduce common
 domain-build.c
In-Reply-To: <0bfc572f0d82e9d81bbc07bab5b6b7fb0d7634f8.1746468003.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505051306290.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com> <0bfc572f0d82e9d81bbc07bab5b6b7fb0d7634f8.1746468003.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Oleksii Kurochko wrote:
> Some functions of Arm's domain_build.c could be reused by dom0less or other
> features connected to domain construction/build.
> 
> The following functions are moved to common:
> - get_allocation_size().
> - allocate_domheap_memory().
> - guest_map_pages().
> - allocate_bank_memory().
> - add_hwdom_free_regions().
> - find_unallocated_memory().
> - allocate_memory().
> - dtb_load().
> - initrd_load().
> 
> Prototype of dtb_load() and initrd_load() is updated to recieve a pointer
> to copy_to_guest_phys() as some archs require
> copy_to_guest_phys_fluch_dcache().
> 
> Update arm/include/asm/Makefile to generate  domain-build.h for Arm as it is
> used by domain-build.c.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

