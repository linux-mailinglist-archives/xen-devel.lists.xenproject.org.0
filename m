Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7D29D0E5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 16:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13754.34512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXnp3-0000Sn-Ds; Wed, 28 Oct 2020 15:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13754.34512; Wed, 28 Oct 2020 15:57:13 +0000
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
	id 1kXnp3-0000SO-AV; Wed, 28 Oct 2020 15:57:13 +0000
Received: by outflank-mailman (input) for mailman id 13754;
 Wed, 28 Oct 2020 15:57:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61hT=ED=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kXnp1-0000SJ-N8
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:57:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe21a166-a0ac-47b0-9ecb-1e632dd5374e;
 Wed, 28 Oct 2020 15:57:10 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=61hT=ED=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kXnp1-0000SJ-N8
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:57:11 +0000
X-Inumbo-ID: fe21a166-a0ac-47b0-9ecb-1e632dd5374e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fe21a166-a0ac-47b0-9ecb-1e632dd5374e;
	Wed, 28 Oct 2020 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603900630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zDU992cp5Ht454n786TTTtaGj5ZbiRftTeUs1bN4v+g=;
  b=a7vzjditLZ/WTRFp8KVfDoMP6Ja0jikuESlAGVtQbHjGVdVOENeuOFJU
   hRLSOKhadkt8NrIA2W8ZnkJPSBei5tPZEfkGcxp05oYFxv+Y4AM4jXEp/
   HmPCWzaE9XXr87GBo7tjvXOAMyigG81fkiku94gEStVAS9XKQeylv0LrK
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oBq1SNoZ9u8Ky4rpMZ7lCGTuYwvzjZ4XAFarFF+kRX0zegxUsMUEZxK4f7vsnRvY8Cntlf7DmV
 3T60L4MajibiqTIPCEdqtab4XcURprScAIq26w91qgCzwTxZxqXb+UdHgOXzJHa9gkqlOy7P4g
 i4Lf3ZoqqerI6NqQWZ/ZrmsaYGhESIDXw7PzD6PP/7mclj7M1RUqugQiXCa7RVRbJvKlxII8lx
 2xt6O1f/u4FTJ4Sde4KCcAJ6PFhr+PMv9zWvQlBeQibZ/aI0mXMrifgIKMT7GWx8vr5sidq7E8
 VSU=
X-SBRS: None
X-MesageID: 31069753
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,427,1596513600"; 
   d="scan'208";a="31069753"
Date: Wed, 28 Oct 2020 15:57:06 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Jason Andryuk <jandryuk@gmail.com>, osstest service owner
	<osstest-admin@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [qemu-mainline test] 156257: regressions - FAIL
Message-ID: <20201028155706.GE2214@perard.uk.xensource.com>
References: <osstest-156257-mainreport@xen.org>
 <CAKf6xpss8KpGOvZrKiTPz63bhBVbjxRTYWdHEkzUo2q1KEMjhg@mail.gmail.com>
 <70d87480-6fcf-9fe0-34c0-30bd711406a4@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <70d87480-6fcf-9fe0-34c0-30bd711406a4@xen.org>

On Wed, Oct 28, 2020 at 02:49:15PM +0000, Julien Grall wrote:
> (+ Anthony and Stefano,)
> 
> Hi Jason,
> 
> On 28/10/2020 13:37, Jason Andryuk wrote:
> > On Tue, Oct 27, 2020 at 5:23 PM osstest service owner
> > <osstest-admin@xenproject.org> wrote:
> > > 
> > > flight 156257 qemu-mainline real [real]
> > > flight 156266 qemu-mainline real-retest [real]
> > > http://logs.test-lab.xenproject.org/osstest/logs/156257/
> > > http://logs.test-lab.xenproject.org/osstest/logs/156266/
> > > 
> > > Regressions :-(
> > > 
> > > Tests which did not succeed and are blocking,
> > > including tests which could not be run:
> > >   test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 152631
> > 
> > QEMU doesn't start with "qemu-system-i386: -xen-domid 1: Option not
> > supported for this target"
> > 
> > This happens if CONFIG_XEN isn't set.
> > 
> > QEMU is built with:
> >                    host CPU: aarch64
> >             host endianness: little
> >                 target list: i386-softmmu
> > 
> > commit 8a19980e3fc4 "configure: move accelerator logic to meson"
> > introduced this logic:
> > +accelerator_targets = { 'CONFIG_KVM': kvm_targets }
> > +if cpu in ['x86', 'x86_64']
> > +  accelerator_targets += {
> > +    'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
> > +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> > +    'CONFIG_HVF': ['x86_64-softmmu'],
> > +    'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
> > +  }
> > +endif
> 
> I always wondered when this would come to bite us :). I am surprised it took
> so long.
> 
> > 
> > I guess something like this would fix it:
> > if cpu in ['aarch64', 'arm']
> >    accelerator_targets += { 'CONFIG_XEN': ['i386-softmmu'], }
> > endif
> 
> Per the logic above, I think this correct. @Stefano, @Anthony, can you have
> a look?

Yes, that would probably do the trick and restrict to x86 and arm rather
than any host with xen support. I think this would need a comment
explaining why we enable xen for i386 target on arm (or at least a
comment that we use i386 target on arm).

Thanks for the investigation.

Cheers,

-- 
Anthony PERARD

