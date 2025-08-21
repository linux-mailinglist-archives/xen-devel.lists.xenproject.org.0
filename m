Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777FAB3089B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 23:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089324.1446942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upD6g-0006HG-3N; Thu, 21 Aug 2025 21:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089324.1446942; Thu, 21 Aug 2025 21:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upD6g-0006EM-0g; Thu, 21 Aug 2025 21:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1089324;
 Thu, 21 Aug 2025 21:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTf3=3B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upD6e-0006EG-MV
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 21:46:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36706552-7ed8-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 23:45:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7FBF35C5996;
 Thu, 21 Aug 2025 21:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17748C4CEEB;
 Thu, 21 Aug 2025 21:45:51 +0000 (UTC)
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
X-Inumbo-ID: 36706552-7ed8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755812753;
	bh=DCt+YiCT7MrQ67lU9VJhpbKpOpsnR8Pl7ZSoi/ZciPc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kvwWffXKgcfd1Ms+BFlbGfArlQxpKR0jqvOPRYoL5GqFguyGT+Bz9ysLyF/kjvn4J
	 k6SI103Pe6VC8s9NTiAzlERGk0d3PXOdVJGXN8XhPFbfT/NB2yc1XM8AD4ZtFLYrxD
	 J+URFUPLle9p4GT5gWi3+T5SMAe2wapRX8JkLFfhFg6gYhTYUz27yJvTbwliQszWYg
	 L5/gLDq3Wa0yVidJ8BKC6i3SZvFihb7xueM9dZ89/V3AFedV68Negmq6cNRVO/04gZ
	 3VAPvr3+rg2SP8hGUuV3+A0avySYkQC0foImlwVUM8bTPLLxNwkEva7Vxm/Ir3Hd7K
	 29O1qNQRqYP+A==
Date: Thu, 21 Aug 2025 14:45:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
In-Reply-To: <267bd33a-70d4-417f-b26f-32de863f1d2d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508211445370.2743087@ubuntu-linux-20-04-desktop>
References: <5ecb3da69ba1581971197388c6b9062b46900cff.1755775255.git.mykyta_poturai@epam.com> <267bd33a-70d4-417f-b26f-32de863f1d2d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Aug 2025, Jan Beulich wrote:
> On 21.08.2025 13:23, Mykyta Poturai wrote:
> > With PCI disabled the build fails due to undefined struct
> > pci_host_bridge.
> > 
> > Add ifdef guard to pci-host-rcar4.h to not require the stuct being
> > defined when PCI support is disabled. All call sites are already covered
> > by HAS_PCI check, so no dummy implementations are needed.
> > 
> > Also move includes under the header guard to not break MISRA rules.
> > 
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> Along with the Reported-by I thought a Fixes: tag would go without saying.
> Can likely be added while committing.

I added Fixes and my Reviewed-by

