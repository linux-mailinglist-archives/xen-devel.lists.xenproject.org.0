Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A08A25C688
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 18:17:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDrvN-0004Bf-TH; Thu, 03 Sep 2020 16:17:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqgv=CM=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kDrvM-0004Ba-DV
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 16:17:20 +0000
X-Inumbo-ID: 4280d950-d7c0-46d3-9722-18c79cdc8af3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4280d950-d7c0-46d3-9722-18c79cdc8af3;
 Thu, 03 Sep 2020 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=W+iPYjQgxqn7sZDY4p7M9qjh7XDcDfGLhI9U+6qIJkw=; b=ms/ma0h/wLD0W+t0dPkN3HtP40
 K57iNQAgjnEG2sv+hdXlCNLAdmb0wYsKNj4P9pbu3JsQAe2v7Ziyj78peCWZ/+4YgJ8S9EJtYM7SN
 n/HGv3Ot3qeGuQLHpgnKv0lFD1dWZAITmoJbR4VKmRYrPaqyALs+CDRrYsrnsGTuTxa4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kDrvK-0005Rc-Rg
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 16:17:18 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kDrvK-0007cA-QW
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 16:17:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kDrvD-0005SS-FJ; Thu, 03 Sep 2020 17:17:11 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24401.5895.115731.487189@mariner.uk.xensource.com>
Date: Thu, 3 Sep 2020 17:17:11 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
Subject: Re: [xen-unstable test] 153602: regressions - FAIL
In-Reply-To: <1bdbf90f-2150-cb86-63a2-37e5148ec34e@suse.com>
References: <osstest-153602-mainreport@xen.org>
 <1bdbf90f-2150-cb86-63a2-37e5148ec34e@suse.com>
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

Jan Beulich writes ("Re: [xen-unstable test] 153602: regressions - FAIL"):
> On 03.09.2020 12:24, osstest service owner wrote:
> > flight 153602 xen-unstable real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/153602/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
> >  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
> 
> While at least the hypervisor logs don't provide clear indication
> (and I don't know where else to look among the files osstest
> provides) I can't help thinking that stubdom apparently
> crashing is still fallout from the mini-os changes (and no-one
> really looks to care). In particular I think that this

I haven't looked at this in detail but I notice that I am having
build failures.

Prior to e013e8514389 "config: use mini-os master for unstable", the
version of mini-os used for builds was controlled by xen.git's
Config.mk.

Since then it has been mini-os master.  NB there is no push gate for
mini-os.  IIRC we discussed this at the time and it was thought that
breakage due to mini-os would be unlikely.

To unblock development in xen.git I suggest reverting the minios part
of 165f3afbfc3d "Config.mk: Unnail versions (for unstable branch)",
choosing some known-working version of minios to put in Config.mk.

Perhaps there should indeed be a minios pushgate.  Then osstest would
use the tested version.

Ian.

