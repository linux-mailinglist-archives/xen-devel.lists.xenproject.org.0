Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7C43928C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 11:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215687.375029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mewOx-0008W7-Kl; Mon, 25 Oct 2021 09:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215687.375029; Mon, 25 Oct 2021 09:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mewOx-0008U8-Hg; Mon, 25 Oct 2021 09:36:19 +0000
Received: by outflank-mailman (input) for mailman id 215687;
 Mon, 25 Oct 2021 09:36:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mewOw-0008U2-Vn
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 09:36:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mewOw-0001hg-Sx
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 09:36:18 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mewOw-0002ye-Rt
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 09:36:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mewOt-00016E-DJ; Mon, 25 Oct 2021 10:36:15 +0100
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
	bh=+r0WrWT0n7yrCi1J9JHMuoyyx+8D4LIMj353aFttoMI=; b=BnOKVnjGMItHw0fm4RaQDw0Y1m
	zjkVR4P330zU9bAawWMxjQhgmb02Ud//4Td/zl6uN68QGr/ssOAgDh1oU5BuoM0+kDFwyw5IZ+mXj
	lAJ0kmBnQmQkIVqVpbgUIH9j6KvcsI3f1ru75evhvVhVE0xklkBLNamRdwdd3phfQg6o=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24950.31374.956099.106459@mariner.uk.xensource.com>
Date: Mon, 25 Oct 2021 10:36:14 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] OSStest: explicitly enable building qemu-traditional
In-Reply-To: <152bf281-6921-42bd-a87a-054056a385ff@suse.com>
References: <20211019130211.32233-1-jgross@suse.com>
	<24942.49760.686147.851391@mariner.uk.xensource.com>
	<152bf281-6921-42bd-a87a-054056a385ff@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH] OSStest: explicitly enable building qemu-traditional"):
> On 19.10.21 15:04, Ian Jackson wrote:
> > OOI, have you done any kind of test on this ?
> 
> No, this was a pure "lets do things in a similar way as the other
> options" approach.
> 
> > I'm kind of inclined to just push it and let osstest's pre-production
> > self-test test it.
> 
> You are in a far better position than me to decide this. :-)

Well, I did a quick test to see that it DTRT on x86 and that looked
OK.  So I pushed it to pretest.  However, unfortunately, it breaks on
ARM:

http://logs.test-lab.xenproject.org/osstest/logs/165843/build-arm64/info.html

That one gets as far as actually trying to build qemu-xen-traditional,
and then fails like this:

Unsupported CPU = aarch64
make[2]: *** [Makefile:167: subdir-all-qemu-xen-traditional-dir] Error 1

I think this needs to be made conditional.  In the perl script,
$r{arch} contains osstest's idea of the architecture (which uses
Debian arch names).

Can you send a new patch which compares $r{arch} with 'i386' and
'amd64' ?

Thanks,
Ian.

