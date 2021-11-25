Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE645DA2F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 13:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231073.399556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqDzy-0007E4-V9; Thu, 25 Nov 2021 12:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231073.399556; Thu, 25 Nov 2021 12:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqDzy-0007An-Ra; Thu, 25 Nov 2021 12:37:10 +0000
Received: by outflank-mailman (input) for mailman id 231073;
 Thu, 25 Nov 2021 12:37:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqDzx-0007Ah-5S
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 12:37:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqDzx-00027d-4f
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 12:37:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqDzx-0000ib-3c
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 12:37:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mqDzt-0006yu-RV; Thu, 25 Nov 2021 12:37:05 +0000
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
	bh=WNRL2a8LWSx5TBAtQFZcHhZNdIxbP6PdAGE/+ONBtC4=; b=cSgI/YlfUuXe2Ckapnsv1cAnoC
	JQlS+NtXOCRteUC+ovF6nttNo4OflwpTrzRbQ9UeDVq3e/7PCdCEUvY69wGAACsFfNBFF2Y/d2iqP
	3u9W42eylPTPwiWk4A1AUymoM3OyOfJB6rmgI3ttm7y5U1wvd4ZYoja31ROY98ZRwyTY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24991.33649.462352.914912@mariner.uk.xensource.com>
Date: Thu, 25 Nov 2021 12:37:05 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [xen-4.15-testing test] 166311: regressions - FAIL
In-Reply-To: <b3e1b1d6-9dc0-9692-d08d-64553f723666@suse.com>
References: <osstest-166311-mainreport@xen.org>
	<b3e1b1d6-9dc0-9692-d08d-64553f723666@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-4.15-testing test] 166311: regressions - FAIL"):
> On 24.11.2021 03:00, osstest service owner wrote:
> > flight 166311 xen-4.15-testing real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/166311/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 166198
> 
> At the example of this, I find:
> 
> Err:1 http://ftp.debian.org/debian buster/main amd64 genisoimage amd64 9:1.1.11-3+b2
>   Could not connect to cache:3143 (172.16.148.6). - connect (113: No route to host)
> Err:2 http://ftp.debian.org/debian buster/main amd64 rsync amd64 3.1.3-6
>   Unable to connect to cache:3143:
> E: Failed to fetch http://ftp.debian.org/debian/pool/main/c/cdrkit/genisoimage_1.1.11-3+b2_amd64.deb  Could not connect to cache:3143 (172.16.148.6). - connect (113: No route to host)
> E: Failed to fetch http://ftp.debian.org/debian/pool/main/r/rsync/rsync_3.1.3-6_amd64.deb  Unable to connect to cache:3143:
> E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
> 
> Network issue (hopefully just a transient one)?

No.  That report reflects a networking problem internal to the colo.
But the colo's internal networking is completely reliable.[1]

I investigated, and the host that job run on, italia0, has some kind
of Problem:
  http://logs.test-lab.xenproject.org/osstest/results/host/italia0.html

Meanwhile italia1 has been out of service due to a PDU fault, and we
were working on recomissioning it.  I have unblessed itaila0 and asked
Credativ to investigate.

Ian.

[1] After many allegations of random flaky, every test now has a ping
test that would fail if there was any packet loss.

