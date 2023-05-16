Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76704705A6E
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 00:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535716.833681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz2th-0007s9-A8; Tue, 16 May 2023 22:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535716.833681; Tue, 16 May 2023 22:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz2th-0007pc-6o; Tue, 16 May 2023 22:11:57 +0000
Received: by outflank-mailman (input) for mailman id 535716;
 Tue, 16 May 2023 22:11:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pz2tg-0007pW-72
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 22:11:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9ca3fee-f436-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 00:11:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7D8E615BC;
 Tue, 16 May 2023 22:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4E9C433D2;
 Tue, 16 May 2023 22:11:50 +0000 (UTC)
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
X-Inumbo-ID: a9ca3fee-f436-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684275112;
	bh=c6QxmY1/bQe/rmr+gHzlOo5C4lckEJsWri4UVuuqSt0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EM3xZwAXIOVnk9qBQ7KtiC1jE09hdaxfHH5DqxLxYgBW52E6611yXM+C7UIkYjeTj
	 AXq7tHhzlaK76+oU6cLt9YnNplSLEPTse1rOLW1Ai/XrGvsbhEJ/EbDqBxwgkqAfTT
	 QrvpYa6eyJxMaO3aGYiePQWpqJc5M7p3wj3vt12TA8e6Ou0BywEtHLKl0beKGz3oSv
	 CHYkdQE9hnmkzPBnzlsAi9xlQdy4MXrHzoLdgwuYdOSXHKNytKutY5NKqPBI19MhuY
	 5MA1Lh+w0mEXO0jAIWy1IBUJ4XlEFvVE7AJuFYnI17FCLx88civixCqJNGKAdcwpHc
	 v0ce7L6diE85g==
Date: Tue, 16 May 2023 15:11:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
In-Reply-To: <ZGM9vzwGm7Jv6i7M@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2305161509040.128889@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop> <20230513011720.3978354-1-sstabellini@kernel.org> <ZGHx9Mk3UGPdli1h@Air-de-Roger> <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com> <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
 <ZGM6X19p50oSqbNB@Air-de-Roger> <ZGM9vzwGm7Jv6i7M@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1454606356-1684275111=:128889"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1454606356-1684275111=:128889
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 16 May 2023, Roger Pau Monné wrote:
> On Tue, May 16, 2023 at 10:10:07AM +0200, Roger Pau Monné wrote:
> > On Mon, May 15, 2023 at 05:16:27PM -0700, Stefano Stabellini wrote:
> > > On Mon, 15 May 2023, Jan Beulich wrote:
> > > > On 15.05.2023 10:48, Roger Pau Monné wrote:
> > > > > On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
> > > > >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > >>
> > > > >> Xen always generates a XSDT table even if the firmware provided a RSDT
> > > > >> table. Instead of copying the XSDT header from the firmware table (that
> > > > >> might be missing), generate the XSDT header from a preset.
> > > > >>
> > > > >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > >> ---
> > > > >>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
> > > > >>  1 file changed, 9 insertions(+), 23 deletions(-)
> > > > >>
> > > > >> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > > > >> index 307edc6a8c..5fde769863 100644
> > > > >> --- a/xen/arch/x86/hvm/dom0_build.c
> > > > >> +++ b/xen/arch/x86/hvm/dom0_build.c
> > > > >> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> > > > >>                                        paddr_t *addr)
> > > > >>  {
> > > > >>      struct acpi_table_xsdt *xsdt;
> > > > >> -    struct acpi_table_header *table;
> > > > >> -    struct acpi_table_rsdp *rsdp;
> > > > >>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
> > > > >>      unsigned long size = sizeof(*xsdt);
> > > > >>      unsigned int i, j, num_tables = 0;
> > > > >> -    paddr_t xsdt_paddr;
> > > > >>      int rc;
> > > > >> +    struct acpi_table_header header = {
> > > > >> +        .signature    = "XSDT",
> > > > >> +        .length       = sizeof(struct acpi_table_header),
> > > > >> +        .revision     = 0x1,
> > > > >> +        .oem_id       = "Xen",
> > > > >> +        .oem_table_id = "HVM",
> > > > > 
> > > > > I think this is wrong, as according to the spec the OEM Table ID must
> > > > > match the OEM Table ID in the FADT.
> > > > > 
> > > > > We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
> > > > > possibly also the other OEM related fields.
> > > > > 
> > > > > Alternatively we might want to copy and use the RSDT on systems that
> > > > > lack an XSDT, or even just copy the header from the RSDT into Xen's
> > > > > crafted XSDT, since the format of the RSDP and the XSDT headers are
> > > > > exactly the same (the difference is in the size of the description
> > > > > headers that come after).
> > > > 
> > > > I guess I'd prefer that last variant.
> > > 
> > > I tried this approach (together with the second patch for necessity) and
> > > it worked.
> > > 
> > > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > > index fd2cbf68bc..11d6d1bc23 100644
> > > --- a/xen/arch/x86/hvm/dom0_build.c
> > > +++ b/xen/arch/x86/hvm/dom0_build.c
> > > @@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> > >          goto out;
> > >      }
> > >      xsdt_paddr = rsdp->xsdt_physical_address;
> > > +    if ( !xsdt_paddr )
> > > +    {
> > > +        xsdt_paddr = rsdp->rsdt_physical_address;
> > > +    }
> > >      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
> > >      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
> > >      if ( !table )
> > 
> > To be slightly more consistent, could you use:
> > 
> > /*
> >  * Note the header is the same for both RSDT and XSDT, so it's fine to
> >  * copy the native RSDT header to the Xen crafted XSDT if no native
> >  * XSDT is available.
> >  */
> > if (rsdp->revision > 1 && rsdp->xsdt_physical_address)
> >     sdt_paddr = rsdp->xsdt_physical_address;
> > else
> >     sdt_paddr = rsdp->rsdt_physical_address;
> > 
> > It was an oversight of mine to not check for the RSDP revision, as
> > RSDP < 2 will never have an XSDT.  Also add:
> > 
> > Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
> 
> Just realized this will require some more work so that the guest
> (dom0) provided RSDP is at least revision 2.  You will need to adjust
> the field and recalculate the checksum if needed.

But we are always providing RSDP version 2 in pvh_setup_acpi, right?
--8323329-1454606356-1684275111=:128889--

