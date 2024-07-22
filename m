Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197A938F9D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:03:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761928.1171991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVshY-0003gF-SN; Mon, 22 Jul 2024 13:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761928.1171991; Mon, 22 Jul 2024 13:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVshY-0003dk-Pc; Mon, 22 Jul 2024 13:03:40 +0000
Received: by outflank-mailman (input) for mailman id 761928;
 Mon, 22 Jul 2024 13:03:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1sVshX-0003de-JI
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:03:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1sVshT-0006Xn-TV; Mon, 22 Jul 2024 13:03:35 +0000
Received: from lfbn-lyo-1-451-148.w2-7.abo.wanadoo.fr ([2.7.43.148] helo=l14)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1sVshT-0002jl-Hm; Mon, 22 Jul 2024 13:03:35 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=HU/DtLBI9PeorLTyXzROt07pc9drFKDPdMTdi3WazlU=; b=6BbXYCxhWfJZ13XwlSA3f/H/VK
	OZaKVqddH5eqz+hb4VlX/J6j6oImhPzKusxc0OMXdCNEKhIboyM/ZmKoz5z116TyWuiCweooCBE3m
	7YMCspQsMN+5/CBBktkx6YKYHxzHw3iDfRjvvMU28LthqI1jDP479KgIuHGGwsD9IZgU=;
Date: Mon, 22 Jul 2024 15:03:32 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [linux-linus test] 186932: regressions - FAIL
Message-ID: <Zp5YpOt42lATLwQX@l14>
References: <osstest-186932-mainreport@xen.org>
 <39d87a30-7722-45ec-bc13-11111eb46483@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39d87a30-7722-45ec-bc13-11111eb46483@suse.com>

On Mon, Jul 22, 2024 at 09:05:43AM +0200, Jan Beulich wrote:
> On 22.07.2024 06:56, osstest service owner wrote:
> > flight 186932 linux-linus real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/186932/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 186827
> >  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 186827
> 
> There looks to be a basic problem as of flight 186925, yet a brief look at one
> of the logs doesn't really give any hint other than the system perhaps simply
> being slow. Ideas, anyone?

Well, yes, it's really slow to reach having a running ssh server. If I
let the machine boot, there's two reason in the log for the long time:

Jul 22 11:44:25.216867 Waiting for /dev to be fully populated...Timed out for waiting the udev queue being empty.
Jul 22 11:46:25.469002 done (timeout).

Jul 22 11:46:29.103350 Configuring network interfaces...
Jul 22 11:46:32.127350 ^@Timed out for waiting the udev queue being empty.
Jul 22 11:48:29.256918 [  403.298102] NET: Registered PF_INET6 protocol family
... more network kernel info after that.
Jul 22 11:48:33.204921 Waiting for xenbr0 to get ready (MAXWAIT is 2 seconds).
Jul 22 11:48:33.204984 done.

(on previous run, "configuring network interface" is followed by
"waiting for xenbr0")


So, we lost already 4 min waiting, out of a budget of 7min for full
reboot.

Also, "reboot" doesn't work with this newer kernel, the machine prints
"Will now restart." then nothing happen.

I have also try without Xen, it's the same behavior.

Cheers,

-- 
Anthony PERARD

