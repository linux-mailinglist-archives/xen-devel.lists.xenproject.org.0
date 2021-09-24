Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D0D417C1E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 22:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195641.348424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTrQo-00076l-9K; Fri, 24 Sep 2021 20:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195641.348424; Fri, 24 Sep 2021 20:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTrQo-00074y-6D; Fri, 24 Sep 2021 20:04:26 +0000
Received: by outflank-mailman (input) for mailman id 195641;
 Fri, 24 Sep 2021 20:04:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTrQm-00074s-FW
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 20:04:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54c40272-acab-4974-963a-765555693b00;
 Fri, 24 Sep 2021 20:04:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DC2B61107;
 Fri, 24 Sep 2021 20:04:22 +0000 (UTC)
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
X-Inumbo-ID: 54c40272-acab-4974-963a-765555693b00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632513862;
	bh=5g6F24eAkfUrluLlmCOMkaLhZyk84IZGlaFRfiC0LOE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lmDBZ9oIyS3njcFNZoPha7UcobA4aS2FQkVoccD3LUilnqmsyJrUfNqkmWR8yOB3t
	 8gbmOYvaF43D55psInmqaApM29ibqVjCF3q0iWMhNWZejhTBf16LlT8XDlYP/fnHMX
	 Dt5XOweabDGODl/B+KyIhLcaXT+S08vFjV90vk2cmsrtWNdgwXvWuviwLz/6byzySc
	 BeG8mbo13ZAdxU/T9llrJzg8G4nbQgevNASLL/ys8+F0tTqo6BRrzQP0D9Q5NZqahq
	 SaQeX5Hw8NIojx1AZbVFK0OufMlA62FfoHWWQ6n3vY5YqOehQqRG4GQEEnOAz6Uo7J
	 NFCZmDQbtjK2w==
Date: Fri, 24 Sep 2021 13:04:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "jgross@suse.com" <jgross@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
    "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, 
    Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
Subject: Re: [PATCH v3 2/2] xen-pciback: allow compiling on other archs than
 x86
In-Reply-To: <7310d23e-4193-3f4c-06da-606b30e73f24@epam.com>
Message-ID: <alpine.DEB.2.21.2109241258190.17979@sstabellini-ThinkPad-T480s>
References: <20210923095345.185489-1-andr2000@gmail.com> <20210923095345.185489-2-andr2000@gmail.com> <alpine.DEB.2.21.2109231252270.17979@sstabellini-ThinkPad-T480s> <f62a1e2c-4253-c998-c206-6bb0681a84fb@epam.com>
 <7310d23e-4193-3f4c-06da-606b30e73f24@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2142721594-1632513512=:17979"
Content-ID: <alpine.DEB.2.21.2109241258500.17979@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2142721594-1632513512=:17979
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109241258501.17979@sstabellini-ThinkPad-T480s>

On Fri, 24 Sep 2021, Oleksandr Andrushchenko wrote:
> On 24.09.21 08:46, Oleksandr Andrushchenko wrote:
> > On 23.09.21 23:00, Stefano Stabellini wrote:
> >> On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> >>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>
> >>> Xen-pciback driver was designed to be built for x86 only. But it
> >>> can also be used by other architectures, e.g. Arm.
> >>> Re-structure the driver in a way that it can be built for other
> >>> platforms as well.
> >>>
> >>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
> >> The patch looks good to me. Only one thing: on ARM32 I get:
> > WE do not yet support Xen PCI passthrough for ARM32

Keep in mind that it is possible to run ARM32 guests on an ARM64
hypervisor.


> >> drivers/xen/xen-pciback/conf_space_header.c: In function ‘bar_init’:
> >> drivers/xen/xen-pciback/conf_space_header.c:239:34: warning: right shift count >= width of type [-Wshift-count-overflow]
> >>       bar->val = res[pos - 1].start >> 32;
> >>                                     ^~
> >> drivers/xen/xen-pciback/conf_space_header.c:240:49: warning: right shift count >= width of type [-Wshift-count-overflow]
> >>       bar->len_val = -resource_size(&res[pos - 1]) >> 32;
> >>    
> >>    
> >> resource_size_t is defined as phys_addr_t and it can be 32bit on arm32.
> >>
> >>
> >> One fix is to surround:
> >>
> >> 		if (pos && (res[pos - 1].flags & IORESOURCE_MEM_64)) {
> >> 			bar->val = res[pos - 1].start >> 32;
> >> 			bar->len_val = -resource_size(&res[pos - 1]) >> 32;
> >> 			return bar;
> >> 		}
> >>
> >> with #ifdef PHYS_ADDR_T_64BIT
> >>
> > This might not be correct. We are dealing here with a 64-bit BAR on a 32-bit OS.
> >
> > I think that this can still be valid use-case if BAR64.hi == 0. So, not sure
> >
> > we can just skip it with ifdef.
> >
> > Instead, to be on the safe side, we can have:
> >
> > config XEN_PCIDEV_STUB
> >          tristate "Xen PCI-device stub driver"
> >          depends on PCI && ARM64 && XEN
> > e.g. only allow building the "stub" for ARM64 for now.

This is a pretty drastic solution. I would be OK with it but I prefer
the solution below >> 16 >> 16.


> Or... there are couple of places in the kernel where PCI deals with the 32 bit shift as:
> 
> drivers/pci/setup-res.c:108:        new = region.start >> 16 >> 16;
> drivers/pci/iov.c:949:        new = region.start >> 16 >> 16;
> 
> commit cf7bee5a0bf270a4eace0be39329d6ac0136cc47
> Date:   Sun Aug 7 13:49:59 *2005* +0400
> 
> [snip]
> 
>      Also make sure to write high bits - use "x >> 16 >> 16" (rather than the
>      simpler ">> 32") to avoid warnings on 32-bit architectures where we're
>      not going to have any high bits.

I think this is the best option


> This might not be(?) immediately correct in case of LPAE though, e.g.
> 
> 64-bit BAR may tolerate 40-bit address in some use-cases?

It is correct for LPAE too, it is just that with LPAE it would be
unnecessary.

--8323329-2142721594-1632513512=:17979--

