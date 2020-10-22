Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA0D296395
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 19:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10617.28328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe9s-0003oD-Bz; Thu, 22 Oct 2020 17:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10617.28328; Thu, 22 Oct 2020 17:13:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe9s-0003no-8q; Thu, 22 Oct 2020 17:13:48 +0000
Received: by outflank-mailman (input) for mailman id 10617;
 Thu, 22 Oct 2020 17:13:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kVe9r-0003nj-0j
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:13:47 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f37ddf2-425e-488f-abae-491b82ac0e9e;
 Thu, 22 Oct 2020 17:13:44 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09MHDSPX081607
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 22 Oct 2020 13:13:34 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09MHDS9Z081606;
 Thu, 22 Oct 2020 10:13:28 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kVe9r-0003nj-0j
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:13:47 +0000
X-Inumbo-ID: 8f37ddf2-425e-488f-abae-491b82ac0e9e
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8f37ddf2-425e-488f-abae-491b82ac0e9e;
	Thu, 22 Oct 2020 17:13:44 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09MHDSPX081607
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 22 Oct 2020 13:13:34 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09MHDS9Z081606;
	Thu, 22 Oct 2020 10:13:28 -0700 (PDT)
	(envelope-from ehem)
Date: Thu, 22 Oct 2020 10:13:28 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
Message-ID: <20201022171328.GA81455@mattapan.m5p.com>
References: <20201021221253.GA73207@mattapan.m5p.com>
 <a960dd45-2867-5ef6-970c-952c03aa8cef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a960dd45-2867-5ef6-970c-952c03aa8cef@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Thu, Oct 22, 2020 at 09:42:17AM +0200, Jan Beulich wrote:
> On 22.10.2020 00:12, Elliott Mitchell wrote:
> > --- a/xen/arch/arm/acpi/domain_build.c
> > +++ b/xen/arch/arm/acpi/domain_build.c
> > @@ -42,17 +42,18 @@ static int __init acpi_iomem_deny_access(struct domain *d)
> >      status = acpi_get_table(ACPI_SIG_SPCR, 0,
> >                              (struct acpi_table_header **)&spcr);
> >  
> > -    if ( ACPI_FAILURE(status) )
> > +    if ( ACPI_SUCCESS(status) )
> >      {
> > -        printk("Failed to get SPCR table\n");
> > -        return -EINVAL;
> > +        mfn = spcr->serial_port.address >> PAGE_SHIFT;
> > +        /* Deny MMIO access for UART */
> > +        rc = iomem_deny_access(d, mfn, mfn + 1);
> > +        if ( rc )
> > +            return rc;
> > +    }
> > +    else
> > +    {
> > +        printk("Failed to get SPCR table, Xen console may be unavailable\n");
> >      }
> 
> Nit: While I see you've got Stefano's R-b already, I Xen we typically
> omit the braces here.

Personally, I prefer that myself, but was unsure of the preference here.
I've seen multiple projects which *really* dislike using having brackets
for some clauses, but not others (ie they want either all clauses with or
all clauses without; instead of only if required).

I sent what I thought was the more often used format.  (I also like tabs,
and dislike having so many spaces; alas my preferences are apparently
uncommon)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



