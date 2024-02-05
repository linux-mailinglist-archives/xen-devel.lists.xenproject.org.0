Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921284A993
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 23:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676563.1052719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX7sC-00042V-VA; Mon, 05 Feb 2024 22:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676563.1052719; Mon, 05 Feb 2024 22:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX7sC-00040S-SU; Mon, 05 Feb 2024 22:55:32 +0000
Received: by outflank-mailman (input) for mailman id 676563;
 Mon, 05 Feb 2024 22:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4S5=JO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rX7sB-00040M-RP
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 22:55:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a89edfac-c479-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 23:55:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A9DA960C7E;
 Mon,  5 Feb 2024 22:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A51C433F1;
 Mon,  5 Feb 2024 22:55:25 +0000 (UTC)
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
X-Inumbo-ID: a89edfac-c479-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707173728;
	bh=05cWxMhdq+n612fGlfifUOSf4CVxJkXMiIQ8goeMVxg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jwH4W4OVn0h2PrtXiB+6WfoLwpqkEltLq0ekgw5mdhLdVq3uQPeIfXsqSegxaIU/8
	 tXbZ0xs74D3pW+ca4uCrKGilSi9oKmIBLZB6zb76fOzH3JZhGEUkabh9ghiS4ain3k
	 +MJ6MAhfiQu859nqXrJyUI+YXP4bUI6Cnn4lAvvnz/vyr9WdI/LGW1DfVZn3xoy8+6
	 pKvJ0AK4/GlQ9rhP0vLa8tFC4WbE8riLKTGM9zwgs7u0O8iEb9U0wQ8xHK31D9uCfh
	 S4YoOfZ66XaMfUhWii4/R7T0cFNcUbHHFbqeKar/FHSvKPoM7trqiSFAC7TKfLD6a8
	 dgfjDtEZDWO4w==
Date: Mon, 5 Feb 2024 14:55:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Elias El Yandouzi <eliasely@amazon.com>, julien@xen.org, 
    pdurrant@amazon.com, dwmw@amazon.com, Wei Liu <wei.liu2@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    David Woodhouse <dwmw2@amazon.com>, Hongyan Xia <hongyxia@amazon.com>, 
    Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 (resend) 02/27] x86/setup: Move vm_init() before acpi
 calls
In-Reply-To: <6fc809af-9662-47fd-b91e-533fd75d0473@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402051455110.1925432@ubuntu-linux-20-04-desktop>
References: <20240116192611.41112-1-eliasely@amazon.com> <20240116192611.41112-3-eliasely@amazon.com> <6fc809af-9662-47fd-b91e-533fd75d0473@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jan 2024, Jan Beulich wrote:
> On 16.01.2024 20:25, Elias El Yandouzi wrote:
> > From: Wei Liu <wei.liu2@citrix.com>
> > 
> > After the direct map removal, pages from the boot allocator are not
> > going to be mapped in the direct map. Although we have map_domain_page,
> > they are ephemeral and are less helpful for mappings that are more than a
> > page, so we want a mechanism to globally map a range of pages, which is
> > what vmap is for. Therefore, we bring vm_init into early boot stage.
> > 
> > To allow vmap to be initialised and used in early boot, we need to
> > modify vmap to receive pages from the boot allocator during early boot
> > stage.
> > 
> > Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> > Signed-off-by: David Woodhouse <dwmw2@amazon.com>
> > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
> 
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -748,6 +748,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
> >  
> >      setup_mm();
> >  
> > +    vm_init();
> > +
> >      /* Parse the ACPI tables for possible boot-time configuration */
> >      acpi_boot_table_init();
> >  
> > @@ -759,8 +761,6 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
> >       */
> >      system_state = SYS_STATE_boot;
> >  
> > -    vm_init();
> > -
> >      if ( acpi_disabled )
> >      {
> >          printk("Booting using Device Tree\n");
> 
> ... with this change the title claiming x86 isn't quite right. Hopefully
> Arm folks will spot the need for an ack there nevertheless.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

