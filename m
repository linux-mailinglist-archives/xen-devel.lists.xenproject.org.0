Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65218A333AC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 00:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886933.1296520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiMWK-0006eX-4I; Wed, 12 Feb 2025 23:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886933.1296520; Wed, 12 Feb 2025 23:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiMWK-0006cK-1T; Wed, 12 Feb 2025 23:51:56 +0000
Received: by outflank-mailman (input) for mailman id 886933;
 Wed, 12 Feb 2025 23:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiMWI-0006cE-8V
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 23:51:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d34915-e99c-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 00:51:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF6165C5909;
 Wed, 12 Feb 2025 23:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E4AC4CEDF;
 Wed, 12 Feb 2025 23:51:49 +0000 (UTC)
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
X-Inumbo-ID: 54d34915-e99c-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739404311;
	bh=6oa5ErM82APEg2WQJsdRu+LNSMCUUbW7Ej28bm2zLkc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t1pUW7kLxyGZxUDV/HY7Qc8NUUeL9q/PiJHJ4HAvjfEmBLbbY1TKMutlnO4wVXl+6
	 5zBQmbfUrIGZs8HLPEGQbleuyNMLVUg6rY5yUoKGNSa5+0vyE51J/qkkiPabc6gCHb
	 IBe3KuOwggRCb0P3NOU1+3LnvIicxzdUD2QD5OqAvpoix5Azacvy4QVxgSooISkOoj
	 7isFhboqxpbV6UPbdvyNd03y0h4OK4szbPiaOzZ5ROx+15R2Dmkq/MHG4/exTVgiCt
	 WHSp7OOmtyrouRIEEeXBmf38QRZ4ip2WNbwz53CEUI2xNBOT6mUwf5IAGwjkgJ2bw/
	 vRb5RSlmMk7lw==
Date: Wed, 12 Feb 2025 15:51:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xenia.Ragiadakou@amd.com, 
    dpsmith@apertussolutions.com
Subject: Re: [RFC] dom0less vcpu affinity bindings
In-Reply-To: <7e224bff-8f94-437c-bd4c-c72f7fc68d22@xen.org>
Message-ID: <alpine.DEB.2.22.394.2502121540570.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502101746240.619090@ubuntu-linux-20-04-desktop> <7e224bff-8f94-437c-bd4c-c72f7fc68d22@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Feb 2025, Julien Grall wrote:
> Hi Stefano,
> 
> On 11/02/2025 01:56, Stefano Stabellini wrote:
> > We have received requests to introduce Dom0less vCPU affinity bindings
> > to allow configuring which pCPUs a given vCPU is allowed to run on.
> > 
> > After considering different approaches, I am thinking of using the
> > following binding format:
> > 
> >      vcpu0 {
> >             compatible = "xen,vcpu-affinity"; // compatible string
> >             id = <0>;  // vcpu id
> >             hard-affinity = "1,4-7"; // pcpu ranges
> 
> This would be CPU logical ID, right? This is a value assigned by Xen based on
> how pCPU are brought up. So in theory it could change between Xen version as
> the order is not guaranteed. I know this is what the toolstack is currently
> using.
> 
> However, as we define a new binding, I wonder whether it would be better to
> instead have a phandle to the CPU device-tree node or just plain MPIDRs? This
> would guarantee that the vCPU will always land on a given pCPU (this could be
> important when taking into account the cache topology).

Yes I can see that your suggestions would make the configuration more
precise. I was hoping to be able to make the binding arch-neutral so
that it could be used the same way on x86 (and also on RISC-V).

I would prefer to avoid the link to the pCPU device tree node because
hyperlaunch doesn't have the pCPU nodes, and also even for ARM and
RISC-V I think it would be inconveniet to manage the phandle. But maybe
we can find a way to support the MPIDR.

We could add support to the MPIDR either directly to hard-affinity,
because it should be possible to detect whether the input is unsigned
integers or an MPIDR, or with a second arch-specific property, such as:

vcpu0 {
       compatible = "xen,vcpu-affinity"; // compatible string
       id = <0>;  // vcpu id
       arm-mpidr = <0x80000000>; // MPIDR

What do you think?

