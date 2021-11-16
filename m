Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696E45366D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226412.391282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0lV-00058k-38; Tue, 16 Nov 2021 15:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226412.391282; Tue, 16 Nov 2021 15:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0lU-00055i-V5; Tue, 16 Nov 2021 15:52:56 +0000
Received: by outflank-mailman (input) for mailman id 226412;
 Tue, 16 Nov 2021 15:52:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0lT-00055c-FB
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:52:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0lT-0006qw-CF
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:52:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0lT-0006X0-B4
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:52:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn0lO-0000Uc-8P; Tue, 16 Nov 2021 15:52:50 +0000
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
	bh=QI1mSEKAJPJ0hJ5CC9su34UdFjwt1CzRe11OgKUNiw8=; b=Yz9Oq3EOI218wKFTm6QYkJl6iO
	dX1VcNAhk31KCi+TD6GcmSt5Jp2dsmB31UWjGrfH3o8Pg04TBd5ZBhq2O+BTUwI39m39iE+MVHLVl
	2NjbcmSrRatlX0DqkdulZlPoa6QvOTiayBD3cKNA9eOssv4qOF9dZ++V8REGCIbFVS8w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24979.54225.597392.929945@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 15:52:49 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [linux-linus test] 166151: regressions - FAIL
In-Reply-To: <42136e3f-5b77-3699-39f5-f720ba09174d@suse.com>
References: <osstest-166151-mainreport@xen.org>
	<42136e3f-5b77-3699-39f5-f720ba09174d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [linux-linus test] 166151: regressions - FAIL"):
> On 16.11.2021 05:42, osstest service owner wrote:
> > flight 166151 linux-linus real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/166151/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  build-i386-pvops              6 kernel-build             fail REGR. vs. 165976
> 
> I'm puzzled by this in two ways: First that this is being done at all,
> when 32-bit PV Xen support has gone away several releases back. If the
> purpose is to cover PVH and/or HVM, then I guess the test name has
> become misleading.

"pvops" refers to the branch of Linux, not the test configuration.  It
means "not that weird xenolinux thing".

> And second that this fails on a KVM related build error:
> 
> arch/x86/kvm/x86.c: In function â€˜vcpu_enter_guestâ€™:
> arch/x86/kvm/x86.c:9948:1: error: unsupported size for integer register
>  }
>  ^
> make[2]: *** [scripts/Makefile.build:287: arch/x86/kvm/x86.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> 
> To limit the risk of unrelated build breakage, wouldn't it make sense
> to keep off Kconfig settings which aren't really of interest?

I think "you can't build it with a perfectly normal configuration that
contains both Xen and KVM things" is a relevant thing to know.
Distros need to compile their kernels with many things enabled, some
of which might be mutually exclusive at runtime.

Ian.

