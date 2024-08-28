Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE80963564
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 01:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785281.1194709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjS4d-0004sL-4v; Wed, 28 Aug 2024 23:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785281.1194709; Wed, 28 Aug 2024 23:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjS4d-0004qN-1T; Wed, 28 Aug 2024 23:27:35 +0000
Received: by outflank-mailman (input) for mailman id 785281;
 Wed, 28 Aug 2024 23:27:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1ns=P3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sjS4b-0004qH-CD
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 23:27:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1828537d-6595-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 01:27:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D46DDCE19B3;
 Wed, 28 Aug 2024 23:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D328C4CEC0;
 Wed, 28 Aug 2024 23:27:23 +0000 (UTC)
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
X-Inumbo-ID: 1828537d-6595-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887645;
	bh=zNd+s1fuNWyF8PWk4IUpXo2o+9xqOA95kSrWOlAQIHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nPm0Hv2OmPuRgFnJadIvtQwCU182d38qvAQX3uym/EAyVbbv88CQAnCVbF6wTYBle
	 MrALyoWkDvYcfGG+wqy5zAvPb7SJtkVtv1I3RiP/r/a6phNdegrUaKBM+eMS0Acv5d
	 a7cjFZcM0ThDQ3geZfPKvvQsf4TAFWJH6d6jeqzihWFF4KSmOSbGSsqllroYcxzZcy
	 WhRV5ypjaI5DPnG7WqaKII6YweudU3HyJzVQRNQRlUi1m0je6s/j532ezVI+Ik45/s
	 wcYoCtO6Av/gLrV6+SZrEaLOk1t4vKJD6d1OoZeUMUoP137WXjtOCi+31syPVUZBSV
	 W6fNLQLA5SOOA==
Date: Wed, 28 Aug 2024 16:27:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 1/2] ioreq: do not build arch_vcpu_ioreq_completion()
 for non-VMX configurations
In-Reply-To: <2e71667a06ece7f0d045c309d69bb73b99d6caa5.1724842645.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2408281627030.53815@ubuntu-linux-20-04-desktop>
References: <cover.1724842645.git.Sergiy_Kibrik@epam.com> <2e71667a06ece7f0d045c309d69bb73b99d6caa5.1724842645.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Aug 2024, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> VIO_realmode_completion is specific to vmx realmode and thus the function
> arch_vcpu_ioreq_completion() has actual handling work only in VMX-enabled build,
> as for the rest x86 and ARM build configurations it is basically a stub.
> 
> Here a separate configuration option ARCH_VCPU_IOREQ_COMPLETION introduced that
> tells whether the platform we're building for requires any specific ioreq
> completion handling. As of now only VMX has such requirement, so the option is
> selected by INTEL_VMX, for other configurations a generic default stub is
> provided (it is ARM's version of arch_vcpu_ioreq_completion() moved to common
> header).
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


