Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F28BFE828
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 01:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148531.1480510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi4X-0002AG-Da; Wed, 22 Oct 2025 23:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148531.1480510; Wed, 22 Oct 2025 23:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi4X-00027A-AW; Wed, 22 Oct 2025 23:16:49 +0000
Received: by outflank-mailman (input) for mailman id 1148531;
 Wed, 22 Oct 2025 23:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYne=47=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vBi4V-000274-RA
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 23:16:47 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d133d8e-af9d-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 01:16:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 42C0F63E43;
 Wed, 22 Oct 2025 23:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07170C4CEE7;
 Wed, 22 Oct 2025 23:16:42 +0000 (UTC)
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
X-Inumbo-ID: 2d133d8e-af9d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761175003;
	bh=sqeJ5K/8TClTsHGg91dfCmt8BAWwZh8OLebzvwh1gzA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qGFxpuK5qeS+H/doapkgwfAouuBHWhfNFauNHEOKIMum7CenuqA1psvC9BifCaCU2
	 etne6N1sX7I+0Jw99gg4aCXPRWcUFavHT2wzcpXk1ZcxZFWyAuhDYMc9DQ5Zy+hs72
	 LOhdnsdyI0flUM0arBq6GOP6/wqrYAfDLy+dtOURwjpuQhdOW77lyRpqbHqE/kDwxq
	 seDCaMV4RC2jeB4Sy4D0k73NMtw69pdK0YRIVhw9x05uh3IgQEndboPHd8eFPbNYeP
	 SnjU7eRFLl0dxuCCHa7weCWC7M/bQ5fXzqKr9sOp5RqQnefXN6OFSCkYJBPdKYraC/
	 YW37lYcA30JVg==
Date: Wed, 22 Oct 2025 16:16:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, sstabellini@kernel.org, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, Penny.Zheng@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: fix randconfig build problems after introducing
 SYSCTL
In-Reply-To: <8b995718-26b3-4b66-9c0f-84855019366b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2510221615060.495094@ubuntu-linux-20-04-desktop>
References: <20251022043947.949583-1-stefano.stabellini@amd.com> <8b995718-26b3-4b66-9c0f-84855019366b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Oct 2025, Jan Beulich wrote:
> On 22.10.2025 06:39, Stefano Stabellini wrote:
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -144,8 +144,7 @@ config XEN_IBT
> >  
> >  config SHADOW_PAGING
> >  	bool "Shadow Paging"
> > -	default !PV_SHIM_EXCLUSIVE
> > -	depends on PV || HVM
> > +	depends on (PV || HVM) && !PV_SHIM_EXCLUSIVE
> >  	help
> 
> On top of what Andrew said,

I wasn't aware of it. I'll drop this change and...


> I fear this is an issue I introduced. I just sent
> a fix for it. Clearly with the pre-existing issues related to domctl_lock_*()
> I failed to realize that some of the randconfig failures were due to a change
> of mine rather than Penny's.

... and use your patch instead.


> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -653,6 +653,7 @@ menu "Supported hypercall interfaces"
> >  
> >  config SYSCTL
> >  	bool "Enable sysctl hypercall"
> > +	depends on !PV_SHIM_EXCLUSIVE
> >  	default y
> >  	help
> >  	  This option shall only be disabled on some dom0less systems, or
> 
> Didn't we say we'd drop the prompt? That would more cleanly be "going back to
> what it was before 34317c508294".

I prefer this change as it looks simpler and less intrusive. I am OK
with the alternative you suggested but I have tested this version.

For our own convenience I'll resend the two patches that I tested together.

