Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF6AFB276
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 13:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035517.1407823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkDU-00075J-1M; Mon, 07 Jul 2025 11:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035517.1407823; Mon, 07 Jul 2025 11:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkDT-000738-V4; Mon, 07 Jul 2025 11:40:59 +0000
Received: by outflank-mailman (input) for mailman id 1035517;
 Mon, 07 Jul 2025 11:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paoO=ZU=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uYkDS-000732-Hg
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 11:40:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3dcf5348-5b27-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 13:40:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7C97168F;
 Mon,  7 Jul 2025 04:40:41 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.57.86.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 545083F694;
 Mon,  7 Jul 2025 04:40:53 -0700 (PDT)
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
X-Inumbo-ID: 3dcf5348-5b27-11f0-a316-13f23c93f187
Date: Mon, 7 Jul 2025 12:40:51 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm64: Panic if direct map is too small
Message-ID: <wegjwdamppi6eqxnwfgkxmesiwaljxbil34m7dm5zkscz4cair@vfvbtkbtsgpi>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-2-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075428.33485-2-michal.orzel@amd.com>

On Fri, Jul 04, 2025 at 09:54:27AM +0000, Michal Orzel wrote:
> Harden the code by panicing if direct map is too small for current memory

NIT: s/panicing/panicking

> layout taking into account possible PDX compression. Otherwise the assert
> is observed:
> Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
> 
> At the moment, we don't set max_pdx denoting maximum usable PDX which
> should be based on max_page. Consolidate setting of max_page and max_pdx
> in init_pdx() for both arm32 and arm64. max_pdx will be used in the
> future to set up frametable mappings respecting the PDX grouping.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Tested-by: Hari Limaye <hari.limaye@arm.com>

LGTM! Tested (compilation) via both Arm AArch32 and AArch64 builds.

Many thanks,
Hari

