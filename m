Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9531A2B679
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 00:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883192.1293252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgB4O-0006bB-HD; Thu, 06 Feb 2025 23:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883192.1293252; Thu, 06 Feb 2025 23:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgB4O-0006Y1-DY; Thu, 06 Feb 2025 23:14:04 +0000
Received: by outflank-mailman (input) for mailman id 883192;
 Thu, 06 Feb 2025 23:14:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ypua=U5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgB4N-0006Xt-CI
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 23:14:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cde9b31-e4e0-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 00:14:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D4905C5648;
 Thu,  6 Feb 2025 23:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78892C4CEDD;
 Thu,  6 Feb 2025 23:13:59 +0000 (UTC)
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
X-Inumbo-ID: 0cde9b31-e4e0-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738883640;
	bh=deseiJuSRvYJ7zkS8rp2VqQ12eK3qKosgngh6g5Zg1I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ANCF3Me/GGABMYUEg0DnQg5xmBHrXNoxldQOsJRnVK5ceWqaYX/gbuI/tdzwlRhGg
	 CFzq57lvmfFhktcrjJYVMHb3gbk7lnsAw57T07K72whP54fWCm4c1cdIBZberna1TI
	 MPlU5la76rWrl62wMn79Vhw7O8EJqHntdmo6PGQzLypcZBekJ9+QcoYXTGyt2kJgiu
	 1MQmMFg8enlyzBnnbFK3GEZmlBDSBHUMd9v7lEuobTrQHiAUe4GdNI1+1DelQNQuju
	 vCS8Ai0P8UdErF4sLFCxMHcZgDb70CMh5XWhtIsydQe1IW+4x/M4kVxNERdD55f5HU
	 zbfV0kwPuWIfg==
Date: Thu, 6 Feb 2025 15:13:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    Henry Wang <xin.wang2@amd.com>
Subject: Re: [PATCH v5 2/9] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
In-Reply-To: <9e65b38c-20bd-4e4b-8bf2-5eb0510f9e4d@amd.com>
Message-ID: <alpine.DEB.2.22.394.2502061513450.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop> <20250206010843.618280-2-stefano.stabellini@amd.com> <9e65b38c-20bd-4e4b-8bf2-5eb0510f9e4d@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Orzel, Michal wrote:
> On 06/02/2025 02:08, Stefano Stabellini wrote:
> > From: Henry Wang <xin.wang2@amd.com>
> > 
> > Currently, users are allowed to map static shared memory in a
> > non-direct-mapped way for direct-mapped domains. This can lead to
> > clashing of guest memory spaces. Also, the current extended region
> > finding logic only removes the host physical addresses of the
> > static shared memory areas for direct-mapped domains, which may be
> > inconsistent with the guest memory map if users map the static
> > shared memory in a non-direct-mapped way. This will lead to incorrect
> > extended region calculation results.
> > 
> > To make things easier, add restriction that static shared memory
> > should also be direct-mapped for direct-mapped domains. Check the
> > host physical address to be matched with guest physical address when
> > parsing the device tree. Document this restriction in the doc.
> > 
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Acked-by: Michal Orzel <michal.orzel@amd.com>
> This patch has already been committed (see 0a0f30c1b55e) and later on fixed (see 988f1c7e1f40).
> 
> DO NOT COMMIT.

Thanks Michal!! I'll take off the series.

