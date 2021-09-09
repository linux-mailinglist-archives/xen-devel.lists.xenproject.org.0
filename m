Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D4404844
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182948.330823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOH3E-0004e2-97; Thu, 09 Sep 2021 10:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182948.330823; Thu, 09 Sep 2021 10:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOH3E-0004bb-5L; Thu, 09 Sep 2021 10:13:00 +0000
Received: by outflank-mailman (input) for mailman id 182948;
 Thu, 09 Sep 2021 10:12:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOH3D-0004bV-EE
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:12:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOH3D-00035D-9Z
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:12:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOH3D-0003yU-8M
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:12:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mOH39-00063F-Ku; Thu, 09 Sep 2021 11:12:55 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=BTdbwlBdvgKBjs9z5IbKaBeIwb8EDVvgQhr+rx+gmhI=; b=yuI11NUbofmgb+1HjaBMum0Tzg
	R3cB397K761kT+SKLBcVP2LBaYbvyb42KMTNWDhN3/v4JE7SRcwpSXkKo0qoa8ymdGbq6mnMMy9pS
	HnASf8XwmHXfRoQXwMDKgPpmZvZxDcCHkqMNynUQpPrPgJlB9s62G9BIUsa9OUy8npWY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24889.56871.267994.502191@mariner.uk.xensource.com>
Date: Thu, 9 Sep 2021 11:12:55 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
Subject: Re: [xen-4.13-testing bisection] complete build-amd64
In-Reply-To: <c3664ec4-dcc3-f7ed-9701-f08d291efd37@suse.com>
References: <E1mOGjd-0004AY-0t@osstest.test-lab.xenproject.org>
	<c3664ec4-dcc3-f7ed-9701-f08d291efd37@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-4.13-testing bisection] complete build-amd64"):
> On 09.09.2021 11:52, osstest service owner wrote:
> >   commit 9f3eda177a4b2d4a33ff1b0307cad42906396562
> >   Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
> >   Date:   Tue Aug 31 09:29:48 2021 +0800
> >   
> >       OvmfPkg/OvmfXen: add QemuKernelLoaderFsDxe
> >       
> >       Without QemuKernelLoaderFsDxe, QemuLoadKernelImage() couldn't download
> >       the kernel, initrd, and kernel command line from QEMU's fw_cfg.
> >       
> >       Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3574
> >       Signed-off-by: Gary Lin <gary.lin@hpe.com>
> >       Acked-by: Anthony PERARD <anthony.perard@citrix.com>
> >       Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
> >       Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> >       Tested-by: Jim Fehlig <jfehlig@suse.com>
> 
> I'm really curious as to how this could have been identified as the
> culprit, when the build issue was a plain hypervisor side one (which
> Andrew did supply a fix for yesterday).

It's a bisector.  It doesn't look at error messages.  So it can't tell
whether a build failure is "the same" as another build failure.

What it starts out knowing is this:


  --good---------------------------------------------------------bad
   (long ago)                                                   [gfn_t]

It picks some random spot ~halfway[1]

  --good-------------------------bad-----------------------------bad
   (long ago)                   [ovmf]                          [gfn_t]

And then of course it's bisecting the ovmf build failure.

Or to put it another way, the build has been broken since the ovmf
change broke it.

[1] It has actually identified the change in the ovmf tree.  For the
purposes of bisection it bisects over a constructed graph whose nodes
are tuples of versions of all the relevant tree.

Ian.

