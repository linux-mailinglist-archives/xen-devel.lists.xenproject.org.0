Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4264B1F996E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 15:58:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpcJ-0005ZN-M7; Mon, 15 Jun 2020 13:57:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkpcI-0005ZI-DJ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 13:57:38 +0000
X-Inumbo-ID: 2b5c6530-af10-11ea-b7fc-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b5c6530-af10-11ea-b7fc-12813bfff9fa;
 Mon, 15 Jun 2020 13:57:37 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /g7kB7xlQDXVDMGCY9mY1UFQfZIdY85IjVFIHsq/rKrIr4WlzRjduLm+jmYJG/oXrYNj2sdY13
 ypa+3oLcrGdTAsPECN4Ox0+JvWjmG7ImBpXDEJEiLYPvwfrcNycw5d3HvOOXMkA4UdlhpDaItc
 esycCD4EVZyBRerwi1yQ6IAcyvt6r1xPBx35d3hLH7Ee6VdwllQ16VibiRXMKT4c5s0cPhgkGW
 pfdSYwLJXv7WQ7GXZGC6zF+3vAYVmGFnQabqQ/yeQtKsIuCz40B1MjZm3mY9KfjZsYD5EI2Lo1
 A0s=
X-SBRS: 2.7
X-MesageID: 20362233
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20362233"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.32330.508237.225844@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 14:57:30 +0100
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Subject: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved)
In-Reply-To: <24291.43673.301735.439410@mariner.uk.xensource.com>
References: <osstest-151033-mainreport@xen.org>
 <24291.43673.301735.439410@mariner.uk.xensource.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved)"):
> osstest service owner writes ("[xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved"):
> > flight 151033 xen-4.10-testing real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/151033/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 150039
> >  build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 150039
> >  build-i386-libvirt            6 libvirt-build            fail REGR. vs. 150039
> >  build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 150039
> 
>   ../../../gnulib/lib/fseeko.c: In function 'rpl_fseeko':
>   ../../../gnulib/lib/fseeko.c:110:4: error: #error "Please port gnulib fseeko.c to your platform! Look at the code in fseeko.c, then report this to bug-gnulib."
>      #error "Please port gnulib fseeko.c to your platform! Look at the code in fseeko.c, then report this to bug-gnulib."
>       ^~~~~
>   make[3]: *** [Makefile:2473: fseeko.lo] Error 1
> 
> http://logs.test-lab.xenproject.org/osstest/logs/151033/build-amd64-libvirt/6.ts-libvirt-build.log
> 
> In principle maybe we could fix this by generating a private libvirt
> branch with the build fixes ?  Or maybe we should simply try plucking
> a new version of libvirt ?  We could update the pinned version in Xen
> 4.10 to the one from 4.11 ?  We might have to do the same for 4.9
> then.

No-one has commented on this.

I propose to update in
  http://xenbits.xen.org/gitweb/?p=libvirt.git;a=summary
the refs
  refs/heads/osstest/frozen/xen-4.10-testing
  refs/heads/osstest/frozen/xen-4.9-testing
from
  681bc423e823ab86b20748db311721bdef20defe
  981e2c70973454cad360f7c9eec2d6ded0a86747
respectively to
  076a2b409667dd9f716a2a2085e1ffea9d58fe8b
which is current value of
  refs/heads/osstest/frozen/xen-4.11-testing

Both of those will be fast-forward updates.

Ian.

