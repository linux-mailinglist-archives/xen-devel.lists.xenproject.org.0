Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED8A940085
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 23:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767152.1177737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYY3v-0005Pr-5f; Mon, 29 Jul 2024 21:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767152.1177737; Mon, 29 Jul 2024 21:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYY3v-0005NX-2a; Mon, 29 Jul 2024 21:37:47 +0000
Received: by outflank-mailman (input) for mailman id 767152;
 Mon, 29 Jul 2024 21:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYY3t-0005NR-GW
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 21:37:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c85d9c83-4df2-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 23:37:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34401CE0E21;
 Mon, 29 Jul 2024 21:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248DFC32786;
 Mon, 29 Jul 2024 21:37:36 +0000 (UTC)
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
X-Inumbo-ID: c85d9c83-4df2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722289057;
	bh=uy2o00y8vz8yHCeg/30hSFJ52S6q1HTe0dNw7tIY1wQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NuC0vebLw3LGsqdbZ9qDow2dHIj1fflgikO8y3s7249/p8AkcGDoi+8INQNi3cVl2
	 ZOpanrl8tcSqZrpZgwWcDFFkqrIjSnTaSvDrXTwlXigAdDYXbxHB0BZOdXOJ8pgZvf
	 SavXVUyJCyZG2jTsxYiUw2JUyx2KCiHUTldtRM3pyNVgSrKNj0osDnwDoAN08Yylbk
	 SAMxOcnSXU82S2U+FFEwuv4JlNJSzkHs1iAnnYeqCQag/QdKtjnTmpzwy3STkVtdV4
	 uUjUqrDj5W+gSbHWoSlmvIQRhyEkuTdDMmHjkxU+09yndHERVwq2DaIHeHnCpJ1WJ2
	 lzT4OMHVEf97A==
Date: Mon, 29 Jul 2024 14:37:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH 0/3] Stack checking on Arm
In-Reply-To: <2cfb4a5c-dff8-4202-80dd-c546d5d6bc6d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2407291333550.4857@ubuntu-linux-20-04-desktop>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com> <2cfb4a5c-dff8-4202-80dd-c546d5d6bc6d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jul 2024, Julien Grall wrote:
> Hi,
> 
> On 29/07/2024 15:24, Stewart Hildebrand wrote:
> > This series introduces stack check instrumentation on Arm. This is
> > helpful for safety certification efforts. I'm sending this in an RFC
> > state because I wanted to gather opinions on the approach of using
> > -finstrument-functions.
> 
> This looks ok for an initial approach. I wonder if longer term we want to
> implement stack guards on Arm. We would need to allocate an extra "virtual"
> page per stack that would be unmapped.
> 
> The advantage is this could be used also in production and doesn't rely on any
> support from the processor.
> 
> Any thoughts?

I think we need both. We should implement stack guards on Arm. In
addition, it is also beneficial to have -finstrument-functions for
profiling, debugging, and also so that we can retrieve detailed call
graphs from execution runs. As an example, -finstrument-functions can
help with offline analysis to prove that we don't have unbounded
recursion, on both arm and x86 too. On the other hand, stack guards help
with protecting the stack in production.

