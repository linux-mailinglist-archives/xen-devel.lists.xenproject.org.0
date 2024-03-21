Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ED3881A95
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 02:12:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696167.1086840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn6yy-0002wW-PJ; Thu, 21 Mar 2024 01:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696167.1086840; Thu, 21 Mar 2024 01:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn6yy-0002uE-Li; Thu, 21 Mar 2024 01:12:36 +0000
Received: by outflank-mailman (input) for mailman id 696167;
 Thu, 21 Mar 2024 01:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBWc=K3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rn6yx-0002u6-9o
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 01:12:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17f6e01b-e720-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 02:12:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 56CB061118;
 Thu, 21 Mar 2024 01:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D1FC433C7;
 Thu, 21 Mar 2024 01:12:29 +0000 (UTC)
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
X-Inumbo-ID: 17f6e01b-e720-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710983551;
	bh=zoMUlM69DxV9enxAWbPgoyG7oftA8/YCaDAjcAhyPDA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XoJ5Qe99u4bCBvmfSKuZYMamBQNvPuagc2UX3CmbFfZZ+VrOpGVANwqK/6cKH3imG
	 dexmXFkzESNqxmU/3HVzxEwGL3MnZ8gwrhRpANOMZhTlwbc8HADpnOv5GcBlUGgyS7
	 Pd4iqNv/iomrZxgYyG++qLraAWgzgdrLnO3rjpOo/QFl+UP4yTU9YdWtHs7knM/u86
	 u0JPT8Mxdn1FEWx8VsdRDdunSArUukN4bfuK4tHRu0re+8k+lz57PjQGYQocM0hAEP
	 qmLaXz5sCB1VYz1LfpUQCCVmN291u91vaf7deysgJrE1N/n/O5dmupsxbpumBmqoQZ
	 P/l/90AKlgKsg==
Date: Wed, 20 Mar 2024 18:12:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Jason Andryuk <jason.andryuk@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/PVH: Support relocatable dom0 kernels
In-Reply-To: <ad5ef9ee-d509-435d-943c-8d7005c823d2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403201258580.1569010@ubuntu-linux-20-04-desktop>
References: <20240319205849.115884-1-jason.andryuk@amd.com> <20240319205849.115884-4-jason.andryuk@amd.com> <ad5ef9ee-d509-435d-943c-8d7005c823d2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Mar 2024, Jan Beulich wrote:
> On 19.03.2024 21:58, Jason Andryuk wrote:
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -537,6 +537,97 @@ static paddr_t __init find_memory(
> >      return INVALID_PADDR;
> >  }
> >  
> > +static bool __init check_load_address(
> > +    const struct domain *d, const struct elf_binary *elf)
> > +{
> > +    paddr_t kernel_start = (paddr_t)elf->dest_base;
> 
> As before I think it is illegitimate to cast a pointer to paddr_t. The
> variable type wants to remain such, but the cast wants to be to
> unsigned long or uintptr_t (or else at least a comment wants adding).

uintptr_t is a good suggestion. uintptr_t is the recommended way by the
C standard and MISRA by extension to cast integers to points and vice
versa. In Xen we have used unsigned long for the same purpose although it
is not the best way any longer (something else to document).

