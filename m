Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821BE425188
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 12:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203467.358598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYR29-0001LJ-3P; Thu, 07 Oct 2021 10:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203467.358598; Thu, 07 Oct 2021 10:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYR28-0001Hz-VZ; Thu, 07 Oct 2021 10:53:52 +0000
Received: by outflank-mailman (input) for mailman id 203467;
 Thu, 07 Oct 2021 10:53:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYR27-0001Ht-Mf
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:53:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYR27-000158-Lz
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:53:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYR27-0003bW-Kz
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:53:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mYR22-0006AI-Tw; Thu, 07 Oct 2021 11:53:46 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=5r18isox69HWOlErqX6kicas+rMNkHHt/kdttCLlODU=; b=zTA1T0J1SAS4bUTCgw3eKcLe/i
	DTAa0F6eBPSjFTB+DLX15mjMKJCVKNhMOgLYwFdRUpnf4WaVkJzUwvhuLfEs8ky701Y4SD3vQBYF0
	p7BtGloIGhSgRwtzMoDW/KI4gtNvmWD9IypEGRtSnBta13j4+51VNqmn26GQxsKaT9vs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24926.53690.621007.507249@mariner.uk.xensource.com>
Date: Thu, 7 Oct 2021 11:53:46 +0100
To: Julien Grall <julien@xen.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
    xen-devel@lists.xenproject.org,
    bertrand.marquis@arm.com,
    Andre.Przywara@arm.com,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
	<b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
	<7bdac405-a889-15e1-be19-5876f7253855@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in libxl"):
> On 06/10/2021 19:40, Rahul Singh wrote:
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 3f9fff653a..78b1ddf0b8 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >   
> >       ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> >                                  ("vuart", libxl_vuart_type),
> > +                               ("vpci", libxl_defbool),
> 
> I have posted some comments regarding the field in v4. To summarize, 
> AFAICT, this option is meant to be only set by libxl but you still let 
> the toolstack (e.g. xl, libvirt) to set it.
> 
> If you still want to expose to the toolstack, then I think the option 
> should be outside of arch_arm. Otherwise, this should be moved in an 
> internal structure (Ian, do you have any suggestion?).

If it should be in an internal structure, probably the libxl create
context.

But I'm not convinced yet.  In particular, if enabling VPCI is
necessary on ARM for hotplugged PCI devices[1], then there has to be
a way for the admin to say "while this domain may not have any PCI
devices right now, I may wish to hotplug some".  That's what the
"passthrough=" option is for.

See my other mail.

[1] I think this is all true even if PCI hotplug for ARM is not
currently implemented.

Ian.

