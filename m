Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F318975E74
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 03:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796971.1206728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soYXg-0008Vm-Uc; Thu, 12 Sep 2024 01:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796971.1206728; Thu, 12 Sep 2024 01:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soYXg-0008SX-RP; Thu, 12 Sep 2024 01:22:40 +0000
Received: by outflank-mailman (input) for mailman id 796971;
 Thu, 12 Sep 2024 01:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soYXg-0008SN-7f
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 01:22:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f69cb0e-70a5-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 03:22:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEC9D5C0354;
 Thu, 12 Sep 2024 01:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DB2C4CEC0;
 Thu, 12 Sep 2024 01:22:36 +0000 (UTC)
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
X-Inumbo-ID: 7f69cb0e-70a5-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726104157;
	bh=jmEt8QuvGw9Eq5MMH+Pa41DnVKH4nijmeJver8UnfhY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JAjskAfNhBgK8QjxESl6N0AC/H0jeXbCriKXTpLbpoT4zh1GF5em8uqIRm2f0r6yC
	 G/2AeVMWqK/P/zTkzLRUqmmkKdBpc2eRopKy78Hcw1FAc02cQnVDfIYI49o0tlYBtR
	 TIAF3L7ddHPMU9FojKXhO9WyEw5HldQJd6ES5JwBviOAqN8rWEvfdalChhuDHSHn8p
	 lVGF1oTGhxUj1nyHo5jpCkjUk/08OQFUYxGFrouxGYg3nu5232EitFWk3Ct2HkjaCu
	 byBiAYaWXffJVmhKajg9QZRI92r5d9MSvEOIdTiI5wItm3YsG43FBVG1/uXUtRGi9f
	 2VLTgtMC27mhg==
Date: Wed, 11 Sep 2024 18:22:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0
 build
In-Reply-To: <ZuBKjkUeR3sAs7j6@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2409111821370.611587@ubuntu-linux-20-04-desktop>
References: <20240424191826.23656-1-dpsmith@apertussolutions.com> <ZuBKjkUeR3sAs7j6@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-209989915-1726104104=:611587"
Content-ID: <alpine.DEB.2.22.394.2409111822270.611587@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-209989915-1726104104=:611587
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2409111822271.611587@ubuntu-linux-20-04-desktop>

I sent v4 here:

https://marc.info/?l=xen-devel&m=172610400409473


On Tue, 10 Sep 2024, Roger Pau Monné wrote:
> Ping?
> 
> I think this is a useful change, could we please have a new version
> with the proposed adjustments?
> 
> Thanks, Roger.
> 
> On Wed, Apr 24, 2024 at 03:18:26PM -0400, Daniel P. Smith wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Xen always generates as XSDT table even if the firmware provided an RSDT table.
> > Copy the RSDT header from the firmware table, adjusting the signature, for the
> > XSDT table when not provided by the firmware.
> > 
> > Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
> > Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > ---
> > 
> > This patch is used for development and testing of hyperlaunch using the QEMU
> > emulator. After dicussiong with Stefano, he was okay with me addressing Jan's
> > comment regarding the table signature and reposting for acceptance.
> > 
> > Changes in v3:
> > - ensure the constructed XSDT table always has the correct signature
> > 
> > ---
> >  xen/arch/x86/hvm/dom0_build.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > index ac71d43a6b3f..781aac00fe72 100644
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -1077,7 +1077,16 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >          rc = -EINVAL;
> >          goto out;
> >      }
> > -    xsdt_paddr = rsdp->xsdt_physical_address;
> > +    /*
> > +     * Note the header is the same for both RSDT and XSDT, so it's fine to
> > +     * copy the native RSDT header to the Xen crafted XSDT if no native
> > +     * XSDT is available.
> > +     */
> > +    if ( rsdp->revision > 1 && rsdp->xsdt_physical_address )
> > +        xsdt_paddr = rsdp->xsdt_physical_address;
> > +    else
> > +        xsdt_paddr = rsdp->rsdt_physical_address;
> > +
> >      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
> >      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
> >      if ( !table )
> > @@ -1089,6 +1098,9 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >      xsdt->header = *table;
> >      acpi_os_unmap_memory(table, sizeof(*table));
> >  
> > +    /* In case the header is an RSDT copy, blindly ensure it has an XSDT sig */
> > +    xsdt->header.signature[0] = 'X';
> > +
> >      /* Add the custom MADT. */
> >      xsdt->table_offset_entry[0] = madt_addr;
> >  
> > -- 
> > 2.30.2
> > 
> 
--8323329-209989915-1726104104=:611587--

