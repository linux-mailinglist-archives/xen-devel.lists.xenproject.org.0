Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B677C914B
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616950.959359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRTv-0007Lk-AR; Fri, 13 Oct 2023 23:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616950.959359; Fri, 13 Oct 2023 23:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRTv-0007Jb-7j; Fri, 13 Oct 2023 23:22:11 +0000
Received: by outflank-mailman (input) for mailman id 616950;
 Fri, 13 Oct 2023 23:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRTu-0007JR-6F
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:22:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52354cbb-6a1f-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 01:22:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B17B0621BF;
 Fri, 13 Oct 2023 23:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45074C433C8;
 Fri, 13 Oct 2023 23:22:03 +0000 (UTC)
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
X-Inumbo-ID: 52354cbb-6a1f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697239324;
	bh=M303czI56qsf74+hRyGl5GbH+VNDYMPKt23eMUsxU2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k+8vs1aL8eWiI8HYQA/RKZ35X8q/4oRPWwUQCxsIsboCplr0FUpQ1G6yY/6JEIqVx
	 SiNojvXkJJ5D6oXouiEN2NvVHmV9N9PfECPxgv6OHPaVGX4LPexyTfVSJkjg5y3E/v
	 NeaMfxPbGTLj7kd7Od1G1crtoV6vUr6FQMIkOtPYJHe9GtZDthICh25mIYe2xXfwUF
	 xJEvr1BMOvc/ysMEgFzIehnX0TCBBH3sf9nZqfHuRH/a+WYHzqURM5ti+Qi671y6UP
	 0JH1sNnDGIEedtXsSXSrXc6BnUvo57I1tpVtQ2zr/gV0f7K5G5TlEzNhoXwaipaMPv
	 TyE0JPkys750Q==
Date: Fri, 13 Oct 2023 16:22:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
In-Reply-To: <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131621450.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter names, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

