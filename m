Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B5CA2D301
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 03:17:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884220.1294010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgaOX-0003DH-67; Sat, 08 Feb 2025 02:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884220.1294010; Sat, 08 Feb 2025 02:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgaOX-0003B6-3J; Sat, 08 Feb 2025 02:16:33 +0000
Received: by outflank-mailman (input) for mailman id 884220;
 Sat, 08 Feb 2025 02:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgaOW-0003B0-7K
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 02:16:32 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b540be27-e5c2-11ef-a073-877d107080fb;
 Sat, 08 Feb 2025 03:16:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 83B41A436C8;
 Sat,  8 Feb 2025 02:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF609C4CED1;
 Sat,  8 Feb 2025 02:16:27 +0000 (UTC)
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
X-Inumbo-ID: b540be27-e5c2-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738980989;
	bh=g06vQtgcHFvwncRWyImlH6fDGW/EwXTlnO1z9DBLHCk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vKt4bXwJr4S9D2is6RlxSCLYWRKFRMrlBorMOZy59GPOxlsOFIbzbTR7OThPeV1z3
	 tqc3J5BQyanNVqwqEaRoMdZkrBHqMt69q/84gBX1x3NTSIBGUAp009ukdcCzTA4RoM
	 5hSVbOMS9te+Ytz0f9q4tz8ZlxyPL562DR+pYVzoxSiNjSeE1QSSl4rzQf+7i8kEih
	 xEeqkglJd/iBtbL0GXEOC+odffvcouWU/RQMrKiZW6QndPsq72gcdSbnh41rWOSPl5
	 eDh8k/ZwokGCnom2Ag1BnTfwVPmyFMew0EgjJ85m6z8LwgGHf3EM/VjXnWTba1On9f
	 KPaspOtLShxag==
Date: Fri, 7 Feb 2025 18:16:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <Michal.Orzel@amd.com>
cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 5/7] init-dom0less: allocate xenstore page is not
 already allocated
In-Reply-To: <fbe1bc68-e8d1-4bfc-b113-542529bc1cc0@amd.com>
Message-ID: <alpine.DEB.2.22.394.2502071805430.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop> <20250207015341.1208429-5-stefano.stabellini@amd.com> <fbe1bc68-e8d1-4bfc-b113-542529bc1cc0@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Feb 2025, Orzel, Michal wrote:
> NIT: commit title: s/is/if/
> 
> On 07/02/2025 02:53, Stefano Stabellini wrote:
> > We check if the xenstore page is already allocated. If yes, there is
> > nothing to do. If no, we proceed allocating it.
> The commit message lacks justification which is to support old unpatched/unfixed kernels.
> 
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v6:
> > - remove double blank lines
> > 
> >  tools/helpers/init-dom0less.c | 53 +++++++++++++++++++++++++++++++++--
> >  1 file changed, 50 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> > index 2b51965fa7..78c59ec5e7 100644
> > --- a/tools/helpers/init-dom0less.c
> > +++ b/tools/helpers/init-dom0less.c
> > @@ -16,8 +16,34 @@
> >  
> >  #include "init-dom-json.h"
> >  
> > +#define XENSTORE_PFN_OFFSET 1
> >  #define STR_MAX_LENGTH 128
> >  
> > +static int alloc_xs_page(struct xc_interface_core *xch,
> > +                         libxl_dominfo *info,
> > +                         uint64_t *xenstore_pfn)
> > +{
> > +    int rc;
> > +    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
> > +    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
> base already contains shifted value so why not use it?
> 
> > +
> > +    rc = xc_domain_setmaxmem(xch, info->domid,
> > +                             info->max_memkb + (XC_PAGE_SIZE/1024));
> > +    if (rc < 0)
> > +        return rc;
> > +
> > +    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
> > +    if (rc < 0)
> > +        return rc;
> > +
> > +    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
> > +    rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
> > +    if (rc < 0)
> > +        return rc;
> > +
> > +    return 0;
> > +}
> > +
> >  static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
> >                         uint64_t *xenstore_pfn)
> >  {
> > @@ -233,9 +259,30 @@ static int init_domain(struct xs_handle *xsh,
> >          return 0;
> >  
> >      /* Get xenstore page */
> > -    if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
> > -        printf("Error on getting xenstore page\n");
> > -        return 1;
> > +    if (get_xs_page(xch, info, &xenstore_pfn) != 0 || xenstore_pfn == ~0ULL) {
> If get_xs_page() returns != 0, then something is wrong and we definitiely should not try
> to allocate a page. The only reason the script should allocate a page is if xenstore_pfn is
> invalid i.e. ~0ULL or not set i.e. 0. At this point we already validated that guest is xenstore enhanced
> so the only possibility is ~0ULL. So the code should be:
> 
> if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
>     return 1;
> }
> 
> if (xenstore_pfn == ~0ULL) {
> ...
> 
> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks Michal, great catch! I made this change and all the other changes
you suggested and validated with a successful pipeline again. I'll
queue it for 4.21.

