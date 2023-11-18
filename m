Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD627EFD5B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 04:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635510.991486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4Be3-0008QO-TV; Sat, 18 Nov 2023 03:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635510.991486; Sat, 18 Nov 2023 03:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4Be3-0008OM-Q7; Sat, 18 Nov 2023 03:05:19 +0000
Received: by outflank-mailman (input) for mailman id 635510;
 Sat, 18 Nov 2023 03:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zOoK=G7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1r4Be2-0008OG-Ku
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 03:05:18 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4caae8c6-85bf-11ee-98dd-6d05b1d4d9a1;
 Sat, 18 Nov 2023 04:05:17 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3AI34peD005712
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 17 Nov 2023 22:04:56 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3AI34pHC005711;
 Fri, 17 Nov 2023 19:04:51 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 4caae8c6-85bf-11ee-98dd-6d05b1d4d9a1
Date: Fri, 17 Nov 2023 19:04:51 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Fri, Nov 17, 2023 at 11:12:37AM +0100, Neowutran wrote:
> On 2023-11-07 11:11, Elliott Mitchell wrote:
> > On Mon, Oct 30, 2023 at 04:27:22PM +01
> > > On Mon, Oct 30, 2023 at 07:50:27AM -0700, Elliott Mitchell wrote:
> > > > On Tue, Oct 24, 2023 at 03:51:50PM +0200, Roger Pau Monne wrote:
> > > > > diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
> > > > > index 707deef98c27..15632cc7332e 100644
> > > > > --- a/xen/arch/x86/genapic/x2apic.c
> > > > > +++ b/xen/arch/x86/genapic/x2apic.c
> > > > > @@ -220,38 +239,56 @@ static struct notifier_block x2apic_cpu_nfb = {
> > > > >  static int8_t __initdata x2apic_phys = -1;
> > > > >  boolean_param("x2apic_phys", x2apic_phys);
> > > > >  
> > > > > +enum {
> > > > > +   unset, physical, cluster, mixed
> > > > > +} static __initdata x2apic_mode = unset;
> > > > > +
> > > > > +static int __init parse_x2apic_mode(const char *s)
> > > > > +{
> > > > > +    if ( !cmdline_strcmp(s, "physical") )
> > > > > +        x2apic_mode = physical;
> > > > > +    else if ( !cmdline_strcmp(s, "cluster") )
> > > > > +        x2apic_mode = cluster;
> > > > > +    else if ( !cmdline_strcmp(s, "mixed") )
> > > > > +   
> > > > > +    else
> > > > > +        return EINVAL;
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +custom_param("x2apic-mode", parse_x2apic_mode);
> > > > > +
> > > > >  const struct genapic *__init apic_x2apic_probe(void)
> > > > >  {
> > > > > -    if ( x2apic_phys < 0 )
> > > > > +    /* x2apic-mode option has preference over x2apic_phys. */
> > > > > +    if ( x2apic_phys >= 0 && x2apic_mode == unset )
> > > > > +        x2apic_mode = x2apic_phys ? physical : cluster;
> > > > > +
> > > > > +    if ( x2apic_mode == unset )
> > > > >      {
> > > > > -        /*
> > > > > -         * Force physical mode if there's no (full) interrupt remapping support:
> > > > > -         * The ID in clustered mode requires a 32 bit destination field due to
> > > > > -         * the usage of the high 16 bits to hold the cluster ID.
> > > > > -         */
> > > > > -        x2apic_phys = iommu_intremap != iommu_intremap_full ||
> > > > > -                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
> > > > > -        
> > > > > -    }
> > > > > -    else if ( !x2apic_phys )
> > > > > -        switch ( iommu_intremap )
> > > > > +        if ( acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL )
> > > > >          {
> > > > 
> > > > Could this explain the issues with recent AMD processors/motherboards?
> > > > 
> > > > Mainly the firmware had been setting this flag, but Xen was previously
> > > > ignoring it?
> > > 
> > > No, not unless you pass {no-}x2apic_phys={false,0} on the Xen command
> > > line to force logical (clustered) destination mode.
> > > 
> > > > As such Xen had been attempting to use cluster mode on an
> > > > x2APIC where that mode was broken for physical interrupts?
> > > 
> > > No, not realy, x2apic_phys was already forced to true if
> > > acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL is set on the FADT (I
> > > just delete that line in this same chunk and move it here).
> > 
> > Okay, that was from a quick look at the patch.  Given the symptoms and
> > workaround with recent AMD motherboards, this looked
> > 
> > In that case it might be a bug in what AMD is providing to motherboard
> > manufacturers.  Mainly this bit MUST be set, but AMD's implementation
> > leaves it unset.
> > 
> > Could also be if the setup is done correctly the bit can be cleared, but
> > multiple motherboard manufacturers are breaking this.  Perhaps the steps
> > are fragile and AMD needed to provide better guidance.
> > 
> > 
> > Neowutran, are you still setup to and interested in doing
> > experimentation/testing with Xen on your AMD computer?  Would you be up
> > for trying the patch here:
> > 
> > https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw
> > 
> > I have a suspicion this *might* fix the x2APIC issue everyone has been
> > seeing.
> > 
> > How plausible would it be to release this as a bugfix/workaround on 4.17?
> > I'm expecting a "no", but figured I should ask given how widespread the
> > issue is.
> 
> I just applied the patch on my setup ( https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw ) 
> It seems to fix the x2APIC issue I was having. 
> 
> I only did some quick tests: 
> 
> I tried all the differents values in my bios for the X2APIC settings. 
> Now the system successfully boot in all the cases, without needing
> manual override of the x2apic_phys/x2apic_mode parameter in boot commandline .

In light of this issue effecting a large number of people with recent
hardware, I formally request the patch
"x86/x2apic: introduce a mixed physical/cluster mode" be considered for
backport release on the 4.17 and 4.18 branches.

(I'm unsure whether it is realistic for a 4.17 update, but I figure I
should ask)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



