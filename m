Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80CA7DDA80
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 02:07:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626046.975958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxzgI-0004lL-VC; Wed, 01 Nov 2023 01:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626046.975958; Wed, 01 Nov 2023 01:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxzgI-0004iW-Rw; Wed, 01 Nov 2023 01:06:02 +0000
Received: by outflank-mailman (input) for mailman id 626046;
 Wed, 01 Nov 2023 01:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mpy9=GO=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qxzgH-0004iQ-ID
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 01:06:01 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d075067c-7852-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 02:05:59 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3A115N3Y025419
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 31 Oct 2023 21:05:29 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3A115K8c025418;
 Tue, 31 Oct 2023 18:05:20 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d075067c-7852-11ee-98d6-6d05b1d4d9a1
Date: Tue, 31 Oct 2023 18:05:20 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Neowutran <xen@neowutran.ovh>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZUGkUEvWwaOPMuYP@mattapan.m5p.com>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZT_LWjKgQxOE9lpj@macbook>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Mon, Oct 30, 2023 at 04:27:22PM +0100, Roger Pau Monné wrote:
> On Mon, Oct 30, 2023 at 07:50:27AM -0700, Elliott Mitchell wrote:
> > On Tue, Oct 24, 2023 at 03:51:50PM +0200, Roger Pau Monne wrote:
> > > diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
> > > index 707deef98c27..15632cc7332e 100644
> > > --- a/xen/arch/x86/genapic/x2apic.c
> > > +++ b/xen/arch/x86/genapic/x2apic.c
> > > @@ -220,38 +239,56 @@ static struct notifier_block x2apic_cpu_nfb = {
> > >  static int8_t __initdata x2apic_phys = -1;
> > >  boolean_param("x2apic_phys", x2apic_phys);
> > >  
> > > +enum {
> > > +   unset, physical, cluster, mixed
> > > +} static __initdata x2apic_mode = unset;
> > > +
> > > +static int __init parse_x2apic_mode(const char *s)
> > > +{
> > > +    if ( !cmdline_strcmp(s, "physical") )
> > > +        x2apic_mode = physical;
> > > +    else if ( !cmdline_strcmp(s, "cluster") )
> > > +        x2apic_mode = cluster;
> > > +    else if ( !cmdline_strcmp(s, "mixed") )
> > > +        x2apic_mode = mixed;
> > > +    else
> > > +        return EINVAL;
> > > +
> > > +    return 0;
> > > +}
> > > +custom_param("x2apic-mode", parse_x2apic_mode);
> > > +
> > >  const struct genapic *__init apic_x2apic_probe(void)
> > >  {
> > > -    if ( x2apic_phys < 0 )
> > > +    /* x2apic-mode option has preference over x2apic_phys. */
> > > +    if ( x2apic_phys >= 0 && x2apic_mode == unset )
> > > +        x2apic_mode = x2apic_phys ? physical : cluster;
> > > +
> > > +    if ( x2apic_mode == unset )
> > >      {
> > > -        /*
> > > -         * Force physical mode if there's no (full) interrupt remapping support:
> > > -         * The ID in clustered mode requires a 32 bit destination field due to
> > > -         * the usage of the high 16 bits to hold the cluster ID.
> > > -         */
> > > -        x2apic_phys = iommu_intremap != iommu_intremap_full ||
> > > -                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
> > > -                      IS_ENABLED(CONFIG_X2APIC_PHYSICAL);
> > > -    }
> > > -    else if ( !x2apic_phys )
> > > -        switch ( iommu_intremap )
> > > +        if ( acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL )
> > >          {
> > 
> > Could this explain the issues with recent AMD processors/motherboards?
> > 
> > Mainly the firmware had been setting this flag, but Xen was previously
> > ignoring it?
> 
> No, not unless you pass {no-}x2apic_phys={false,0} on the Xen command
> line to force logical (clustered) destination mode.
> 
> > As such Xen had been attempting to use cluster mode on an
> > x2APIC where that mode was broken for physical interrupts?
> 
> No, not realy, x2apic_phys was already forced to true if
> acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL is set on the FADT (I
> just delete that line in this same chunk and move it here).

I think I inverted the case in my speculation.  Perhaps AMD's firmware
SHOULD have been setting ACPI_FADT_APIC_PHYSICAL, but failed to?

Given the rough launch with AMD's latest, I could readily see there
being a goof like this.  Question will then be, will mixed mode work on
these processors?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



