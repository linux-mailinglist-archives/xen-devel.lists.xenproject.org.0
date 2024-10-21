Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E510A9A93F5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 01:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823995.1238089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t31bW-00049L-4B; Mon, 21 Oct 2024 23:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823995.1238089; Mon, 21 Oct 2024 23:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t31bW-00047Q-10; Mon, 21 Oct 2024 23:14:26 +0000
Received: by outflank-mailman (input) for mailman id 823995;
 Mon, 21 Oct 2024 23:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pwn9=RR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t31bV-00047J-0s
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 23:14:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34f9edf1-9002-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 01:14:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8BD87A43D1A;
 Mon, 21 Oct 2024 23:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CB9C4CEC3;
 Mon, 21 Oct 2024 23:14:20 +0000 (UTC)
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
X-Inumbo-ID: 34f9edf1-9002-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729552461;
	bh=T7fb8m8YIZ9OK+6EyD6YeKcOh9HhowUsSrDyQAKwUto=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J8sU/OwNbABTGgW0UAPG8Eg6XCRhCnmR6SOaXrEarbFLGssVdLzbg+WVipLKR/YVq
	 xlEcha03yOASsG+7C7/Fi1bg4Y2yhnHJrRyj18fEIkfn96DwFsy0pEQMJ+dsB9JgfR
	 ufEYp3enohnpT/Su3/kp56qPMn6d9CeWhbm+e4HtBZVZ3GKCC39JNvCm6PtMX+OpQV
	 6361fI+VfTQ8M/2NfBjIypha3qqHKuTk6yK9DD1rV2Jg+optP8ry7whXPrh4GXCLkJ
	 WPxnA/JhdIrDqPqENlCf9rkR2zy+jURYjb83nhCNa86I+UuhWSmNxj0evJFGIcYdy2
	 qdrAQrAPTL3NQ==
Date: Mon, 21 Oct 2024 16:14:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: [ImageBuilder] Fix device tree node naming
In-Reply-To: <76bfa4fe-bf09-4667-968f-890c8d917780@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410211614140.3833@ubuntu-linux-20-04-desktop>
References: <20241021110446.8633-1-michal.orzel@amd.com> <76bfa4fe-bf09-4667-968f-890c8d917780@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Oct 2024, Jason Andryuk wrote:
> On 2024-10-21 07:04, Michal Orzel wrote:
> > A device tree node is named as follows: node-name@unit-address. The
> > unit-address must match the first address specified in the reg property
> > or be omitted if there's no reg property.
> > 
> > Fix the following issues:
> > 1) domU modules are named as: node-name0xunit-address. Fix the naming to
> >     follow the device tree spec.
> > 2) dom0 kernel and ramdisk, despite having the reg property do not have
> >     unit addresses specified. Fix it.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

