Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AB54EBC3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 23:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350881.577311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1wae-0001f1-Cm; Thu, 16 Jun 2022 20:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350881.577311; Thu, 16 Jun 2022 20:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1wae-0001d0-8g; Thu, 16 Jun 2022 20:59:44 +0000
Received: by outflank-mailman (input) for mailman id 350881;
 Thu, 16 Jun 2022 20:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hdZ4=WX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o1wad-0001cu-C0
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 20:59:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d6e8f7b-edb7-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 22:59:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51DA061E0C;
 Thu, 16 Jun 2022 20:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81956C34114;
 Thu, 16 Jun 2022 20:59:39 +0000 (UTC)
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
X-Inumbo-ID: 3d6e8f7b-edb7-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655413179;
	bh=0tqifvP35073FfX2wW6spHcNRhUwWYpuViv/UJmaiIg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hWiLGw75IACeHLt2CnY/wkmQBcIJ2VUgJ91ki9PT94UjcuR02wrl+W4a6qww3h8uT
	 EJoWhkAW9r/4L4BGxU86/dNBOWAAKofp4y97LXe6vz/km4LHlRq31pY1lHIpZQrlnf
	 HvpEtk4z/NdxRSwrhGjI7+kF/9YzlnIBS4u7Ve/ErNjn0gewCrE+xtVWibTdeSYyNv
	 GO3F5kq0LxaL1PcCSdy5LdEZuHlkW3sbbIaQrLmlx77gTQZDYBN+H8NnAmxS90PwKl
	 J+JDo2xq5RvVxYXu7WGEVGXWlKFIr/31WKH9xAU6Zqip01qyape3+8zv++Ocmsbhny
	 9wsGESJ93vb7A==
Date: Thu, 16 Jun 2022 13:59:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    viryaos-discuss@lists.sourceforge.net
Subject: Re: [ImageBuilder] [PATCH v3] uboot-script-gen: Add
 DOMU_STATIC_MEM
In-Reply-To: <20220616095639.305510-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206161359100.10483@ubuntu-linux-20-04-desktop>
References: <20220616095639.305510-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jun 2022, Xenia Ragiadakou wrote:
> Add a new config parameter to configure a dom0less VM with static allocation.
> DOMU_STATIC_MEM[number]="baseaddr1 size1 ... baseaddrN sizeN"
> The parameter specifies the host physical address regions to be statically
> allocated to the VM. Each region is defined by its start address and size.
> 
> For instance,
> DOMU_STATIC_MEM[0]="0x30000000 0x10000000 0x50000000 0x20000000"
> indicates that the host memory regions [0x30000000, 0x40000000) and
> [0x50000000, 0x70000000) are statically allocated to the first dom0less VM.
> 
> Since currently it is not possible for a VM to have a mix of both statically
> and non-statically allocated memory regions, when DOMU_STATIC_MEM is specified,
> adjust VM's memory size to equal the amount of statically allocated memory.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed and committed, thanks!

I added a check for DOMU_MEM != DOMU_STATIC_MEM on commit.

Cheers,

Stefano


