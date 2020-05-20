Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7831DB78F
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 16:58:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbQAR-0002n8-Aq; Wed, 20 May 2020 14:57:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NWk/=7C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jbQAP-0002mz-ER
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:57:57 +0000
X-Inumbo-ID: 497b7bc0-9aaa-11ea-aa32-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 497b7bc0-9aaa-11ea-aa32-12813bfff9fa;
 Wed, 20 May 2020 14:57:56 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nY5r0Gry+ldeq6TLb+N+71DylejcoRpA2XCOx0otUhMnDRhGdGYDFyMzpAGDBhkztINLB+SSrF
 +x3ZdZVxxTPct+8PD/yX3CHBSQq5NBTksy0zRMTohyc63m6g6LnWKgkLkXv6ZLhITzYiCHHF4v
 x3pngUcfoQSz3W0Ow9Bs94Ep6hrBRXKJz/jHuBUw5Xx6Fwg9OybTdbdNLjltk+Sgku0nSfqb/G
 IsdKAtKW3Ty2HPCrxKiW538KBPki5mZ15pCfpVKsRYV+NLm2BQ373wE2NR/B418ZIRVRTASCKq
 MB4=
X-SBRS: 2.7
X-MesageID: 18023814
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18023814"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24261.17765.769078.328560@mariner.uk.xensource.com>
Date: Wed, 20 May 2020 15:57:41 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [OSSTEST PATCH 34/38] buster: grub, arm64: extend chainloading
 workaround
In-Reply-To: <f3becdd7-a7e1-3e99-ca90-4ce0f74aa467@xen.org>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-35-ian.jackson@eu.citrix.com>
 <f3becdd7-a7e1-3e99-ca90-4ce0f74aa467@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [OSSTEST PATCH 34/38] buster: grub, arm64: extend chainloading workaround"):
> On 19/05/2020 20:02, Ian Jackson wrote:
> > multiboot[2] isn't supported.
> > 
> > Also link to the bug report.
> > 
> > CC: Julien Grall <julien@xen.org>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> > ---
> >   Osstest/Debian.pm | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
> > index 77508d19..151677ed 100644
> > --- a/Osstest/Debian.pm
> > +++ b/Osstest/Debian.pm
> > @@ -443,9 +443,10 @@ sub setupboot_grub2 ($$$$) {
> >       my $kernkey= (defined $xenhopt ? 'KernDom0' : 'KernOnly');
> >   
> >       # Grub2 on jessie/stretch ARM* doesn't do multiboot, so we must chainload.
> > +    # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=884770
> >       my $need_uefi_chainload =
> >           get_host_property($ho, "firmware") eq "uefi" &&
> > -        $ho->{Suite} =~ m/jessie|stretch/ && $ho->{Arch} =~ m/^arm/;
> > +        $ho->{Suite} =~ m/jessie|stretch|buster/ && $ho->{Arch} =~ m/^arm/;
> 
> FWIW, the next version of Debian seems to have a newer GRUB version with 
> Xen on Arm support.

Cool, we can drop this eventually then :-).

Thanks,
Ian.

