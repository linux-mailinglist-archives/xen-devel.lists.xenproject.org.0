Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E151D70422E
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 02:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534903.832387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyiMl-0006ZQ-Vp; Tue, 16 May 2023 00:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534903.832387; Tue, 16 May 2023 00:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyiMl-0006W7-Su; Tue, 16 May 2023 00:16:35 +0000
Received: by outflank-mailman (input) for mailman id 534903;
 Tue, 16 May 2023 00:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyiMk-0006Vz-Ju
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 00:16:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e89fb8f0-f37e-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 02:16:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2C27611EE;
 Tue, 16 May 2023 00:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5767AC433EF;
 Tue, 16 May 2023 00:16:29 +0000 (UTC)
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
X-Inumbo-ID: e89fb8f0-f37e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684196190;
	bh=vHzC7PTPgkpZdzLyFNybngmOcYC3HM7pRTDTAG1k4/U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QAdZ7EZOi+BA6c7OCxtP7sXksNg9xvcFGyRb5X1DcgNNkSwDmUJ1zlWNiQLs1S+fR
	 wAgRMnNteFEKEHxVJYJGx9w+rCX5YwtxVdAofTUdfcED8kAWKwIUYqGt4K4KZGhCQ1
	 PpKJF/doa1K8g3eGWnND1eoQTDUrX5bD9Ot2RrBVrGGc6Y+QUEo5LD/YyG6lVABXso
	 3Udk2iSOk4I/+KBctfaUVgouUHJ2aNqLcLSvnsWIOaXxMhY2heP5SZwAbTSGr4FmJP
	 T1cW/J8bmFzImGv46cyvQlk83sp8wxA92LZkkqV3wNMOoXV7Ve7WgAKTCKf0KGLIZq
	 sJWNlNnvsi0Jw==
Date: Mon, 15 May 2023 17:16:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
In-Reply-To: <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop> <20230513011720.3978354-1-sstabellini@kernel.org> <ZGHx9Mk3UGPdli1h@Air-de-Roger> <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1714508303-1684196189=:4125828"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1714508303-1684196189=:4125828
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 15 May 2023, Jan Beulich wrote:
> On 15.05.2023 10:48, Roger Pau Monné wrote:
> > On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
> >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> >>
> >> Xen always generates a XSDT table even if the firmware provided a RSDT
> >> table. Instead of copying the XSDT header from the firmware table (that
> >> might be missing), generate the XSDT header from a preset.
> >>
> >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >> ---
> >>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
> >>  1 file changed, 9 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> >> index 307edc6a8c..5fde769863 100644
> >> --- a/xen/arch/x86/hvm/dom0_build.c
> >> +++ b/xen/arch/x86/hvm/dom0_build.c
> >> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >>                                        paddr_t *addr)
> >>  {
> >>      struct acpi_table_xsdt *xsdt;
> >> -    struct acpi_table_header *table;
> >> -    struct acpi_table_rsdp *rsdp;
> >>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
> >>      unsigned long size = sizeof(*xsdt);
> >>      unsigned int i, j, num_tables = 0;
> >> -    paddr_t xsdt_paddr;
> >>      int rc;
> >> +    struct acpi_table_header header = {
> >> +        .signature    = "XSDT",
> >> +        .length       = sizeof(struct acpi_table_header),
> >> +        .revision     = 0x1,
> >> +        .oem_id       = "Xen",
> >> +        .oem_table_id = "HVM",
> > 
> > I think this is wrong, as according to the spec the OEM Table ID must
> > match the OEM Table ID in the FADT.
> > 
> > We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
> > possibly also the other OEM related fields.
> > 
> > Alternatively we might want to copy and use the RSDT on systems that
> > lack an XSDT, or even just copy the header from the RSDT into Xen's
> > crafted XSDT, since the format of the RSDP and the XSDT headers are
> > exactly the same (the difference is in the size of the description
> > headers that come after).
> 
> I guess I'd prefer that last variant.

I tried this approach (together with the second patch for necessity) and
it worked.

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index fd2cbf68bc..11d6d1bc23 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
         goto out;
     }
     xsdt_paddr = rsdp->xsdt_physical_address;
+    if ( !xsdt_paddr )
+    {
+        xsdt_paddr = rsdp->rsdt_physical_address;
+    }
     acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
     table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
     if ( !table )
--8323329-1714508303-1684196189=:4125828--

