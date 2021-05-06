Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2A37586F
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 18:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123649.233272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1legqg-0006xC-0V; Thu, 06 May 2021 16:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123649.233272; Thu, 06 May 2021 16:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1legqf-0006uh-Tc; Thu, 06 May 2021 16:27:37 +0000
Received: by outflank-mailman (input) for mailman id 123649;
 Thu, 06 May 2021 16:27:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1legqe-0006ub-UU
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 16:27:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1legqe-0004Mx-Rg
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 16:27:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1legqe-00050f-Qe
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 16:27:36 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1legqb-0004TI-BZ; Thu, 06 May 2021 17:27:33 +0100
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
	bh=T1O6LXfc5jVUnaMVIQVHoBhu8P1I5m/Y1cyYd7XUx7U=; b=SNDVgZmIgzXLs8/M2y1IfnjOF1
	kIe0eB55q9eTDYJ7z8tkQpWPIf6ZnS44oxjztUiJ9Rfl/SW48IlNEmqs5g249WhrV906GmEjP1O1P
	i5tOyit7bdb3UXQdHmL/ue6CsutTOq5FE/yc6CqP8dd9U+nxMYrdS/rdRtjABcHjUqA0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24724.6389.95487.1868@mariner.uk.xensource.com>
Date: Thu, 6 May 2021 17:27:33 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [xen-4.12-testing test] 161776: regressions - FAIL
In-Reply-To: <osstest-161776-mainreport@xen.org>
References: <osstest-161776-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

osstest service owner writes ("[xen-4.12-testing test] 161776: regressions - FAIL"):
> flight 161776 xen-4.12-testing real [real]
> flight 161806 xen-4.12-testing real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/161776/
> http://logs.test-lab.xenproject.org/osstest/logs/161806/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl-qcow2    19 guest-localmigrate/x10   fail REGR. vs. 159418

This has been failing for 48 days.

  http://logs.test-lab.xenproject.org/osstest/logs/161776/test-amd64-amd64-xl-qcow2/19.ts-guest-localmigrate.log

shows this:

  libxl: error: libxl_dom_suspend.c:377:suspend_common_wait_guest_timeout: Domain
6:guest did not suspend, timed out

as the first thing that goes wrong.  This is after the guest has
acknowledged the suspend request.

osstest tried to bisect it but was not able to reproduce the basis
pass.  That means either that we got (un)lucky with the basis pass, or
that something not version-controlled by osstest is responsible.  In
this case I think the dom0 and domU kernels, as well as the usual
pieces, are all properly version controlled by osstest.  The non-Xen
userland tools are not but I doubt they are the cause.

So I think this is not a real regression.  In lieu of a fix, I propose
to force push 5984905b2638df87a0262d1ee91f0a6e14a86df6 to stable-4.12.

Ian.

