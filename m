Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F109422F4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 00:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768100.1178844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYvM1-0002lH-S7; Tue, 30 Jul 2024 22:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768100.1178844; Tue, 30 Jul 2024 22:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYvM1-0002iU-PH; Tue, 30 Jul 2024 22:30:01 +0000
Received: by outflank-mailman (input) for mailman id 768100;
 Tue, 30 Jul 2024 22:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYvM0-0002e2-Iy
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 22:30:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 408cf509-4ec3-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 00:29:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD36B62114;
 Tue, 30 Jul 2024 22:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733B4C32782;
 Tue, 30 Jul 2024 22:29:55 +0000 (UTC)
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
X-Inumbo-ID: 408cf509-4ec3-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722378597;
	bh=iXwmhYCCcyRDw2DJIPfqL2B2J9LqKdHICiKlj40dCDM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VsnXh0cIy6MwRgYVov2Hu44Q4Oy3vb1WSweVdDxDaI97QumUZaMY8yvnIJ4nu3tdK
	 Qcah3xymNH1R6+gerYm9S2QtrUOH9w2EPp3hX0mLAcrTv5LEGF06PE/2BiHqakmqgR
	 oFfBFMVKfzS3GviRUTLV1g7i4AMqQMSgAGsE0gCWdxZwVJT1BJQ4CU6OrJlLpKoTbZ
	 YR95RfkHdzuAGmUh+mbn1vlQ5MkgdYiO0M0uz/m/fPVLkT/gzSGlgR5r/ymXcsHq3Y
	 bQv0u7POqU54AT+PkRoxBl5UNZ55ocumaEAdfM1yzfaMR+zvEkGgVAgyBp/NOH3BAB
	 vNr9zJ9isCXKg==
Date: Tue, 30 Jul 2024 15:29:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Amneesh Singh <a-singh21@ti.com>, mst@redhat.com
cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com, hch@infradead.org, 
    iommu@lists.linux-foundation.org, jasowang@redhat.com, jgross@suse.com, 
    konrad.wilk@oracle.com, linux-arm-kernel@lists.infradead.org, 
    linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com, 
    virtualization@lists.linux-foundation.org, x86@kernel.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
In-Reply-To: <20240730105910.443753-1-a-singh21@ti.com>
Message-ID: <alpine.DEB.2.22.394.2407301519330.4857@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.21.2007151001140.4124@sstabellini-ThinkPad-T480s> <20240730105910.443753-1-a-singh21@ti.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Jul 2024, Amneesh Singh wrote:
> Hi Stefano,
> 
> First off, apologies for bumping this dead thread.
> 
> I came across this patch signed off by you recently
> https://github.com/Xilinx/linux-xlnx/commit/72cb5514953be3aa2ac00c57c9eaa100ecc67176
> 
> and was wondering if a patch replacing xen_domain() with xen_pv_domain() in
> vring_use_dma_api() can be sent upstream? If not, is there a reason why?

Hi Amneesh,

Yes this patch is still required for Xen on ARM and it fixes a real bug.
Unfortunately the upstreaming process stalled so we had to keep the fix
in our Xilinx Linux branch. Here is the link to the start of this
conversation and to the last message:

https://marc.info/?i=20200624091732.23944-1-peng.fan%40nxp.com
https://marc.info/?i=alpine.DEB.2.21.2007151001140.4124%40sstabellini-ThinkPad-T480s


Hi Michael, I see you are CCed to this email. Would you be open to
acking this patch now that a 3rd independent engineer from a different
company (NXP first, then AMD/Xilinx, now TI) has reported this as a bug
fix?



