Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC05F9978AD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 00:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815223.1228916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfSc-0002JY-3j; Wed, 09 Oct 2024 22:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815223.1228916; Wed, 09 Oct 2024 22:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfSc-0002Gj-0o; Wed, 09 Oct 2024 22:47:14 +0000
Received: by outflank-mailman (input) for mailman id 815223;
 Wed, 09 Oct 2024 22:47:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR2m=RF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1syfSa-0002Gd-P5
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 22:47:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b2be12e-8690-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 00:47:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74AA25C5E48;
 Wed,  9 Oct 2024 22:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12752C4CEC3;
 Wed,  9 Oct 2024 22:47:07 +0000 (UTC)
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
X-Inumbo-ID: 6b2be12e-8690-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728514029;
	bh=zezz4miSiEcAUWwCNxLP4M8HbD5Q3oG1LiX06x3IoAM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sZvkI5muk6awGGVdIHrLvoDRdzZ21X2AHklId6MA8LcOAk40rNThbq+RWFi+ZZAan
	 fyQmQD/z8xufkSYMulX16TXR81GuzFMTjAfIkcnHsPF1mH3b0z8CpSkyp/Ww4KG5bM
	 vdScIWAbluxij52vhCH9E+O+N338aMMd3s3A8Yk9SBNajU6GgHzMdQvm2/9YBomupa
	 yZoKu9bqw4pzvIs5pYDrzRMkRHrUiwA0a2cA6ht2isdML/EA+iJFFxjBy37zSvlT43
	 f5xAt5S6ETrJC+IFpVSBVEbWPcHAnZ1IOtAV4iDBpPCowxdmojpJo0YJQIqfmMLpCo
	 V+Ec4rCGtOfsg==
Date: Wed, 9 Oct 2024 15:46:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen: Remove config dependency in XEN_PRIVCMD
 definition
In-Reply-To: <73174eb0-380d-4f95-a2c3-097b86fac8db@suse.com>
Message-ID: <alpine.DEB.2.22.394.2410091539260.471028@ubuntu-linux-20-04-desktop>
References: <20241009062014.407310-1-Jiqian.Chen@amd.com> <73174eb0-380d-4f95-a2c3-097b86fac8db@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Oct 2024, Jan Beulich wrote:
> On 09.10.2024 08:20, Jiqian Chen wrote:
> > Commit 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
> > adds a weak reverse dependency to the config XEN_PRIVCMD definition, its
> > purpose is to pass the combination of compilation that CONFIG_XEN_PRIVCMD=y
> > and CONFIG_XEN_PCIDEV_BACKEND=m, because in that combination, xen-pciback
> > is compiled as a module but xen-privcmd is built-in, so xen-privcmd can't
> > find the implementation of pcistub_get_gsi_from_sbdf.
> > 
> > But that dependency causes xen-privcmd can't be loaded on domU, because
> > dependent xen-pciback is always not be loaded successfully on domU.
> > 
> > To solve above problem and cover original commit's requirement, just remove
> > that dependency, because the code "IS_REACHABLE(CONFIG_XEN_PCIDEV_BACKEND)"
> > of original commit is enough to meet the requirement.
> > 
> > Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> 
> This lacks a Reported-by:.
> 
> > --- a/drivers/xen/Kconfig
> > +++ b/drivers/xen/Kconfig
> > @@ -261,7 +261,6 @@ config XEN_SCSI_BACKEND
> >  config XEN_PRIVCMD
> >  	tristate "Xen hypercall passthrough driver"
> >  	depends on XEN
> > -	imply XEN_PCIDEV_BACKEND
> >  	default m
> >  	help
> >  	  The hypercall passthrough driver allows privileged user programs to
> 
> The report wasn't about a build problem, but a runtime one. Removing the
> dependency here doesn't change anything in the dependency of xen-privcmd
> on xen-pciback, as the use of pcistub_get_gsi_from_sbdf() continues to
> exist.
>
> Consider the case of XEN_PCIDEV_BACKEND=m and XEN_PRIVCMD=m, which
> I guess is what Marek is using in his config. Both drivers are available
> in such a configuration, yet loading of xen-privcmd then requires to
> load xen-pciback first. And that latter load attempt will fail in a DomU.
> The two drivers simply may not have any dependency in either direction.

The idea is that there should be no hard dependency on
pcistub_get_gsi_from_sbdf(). If it is available, the service will be
used, otherwise an error will be reported.

The problem is that IS_REACHABLE is a compile-time check. What we need
is a runtime check instead. Maybe symbol_get or try_module_get ?



