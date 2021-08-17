Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016DC3EEB89
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167767.306273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxAf-0007Ib-Bw; Tue, 17 Aug 2021 11:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167767.306273; Tue, 17 Aug 2021 11:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxAf-0007Fw-8n; Tue, 17 Aug 2021 11:22:17 +0000
Received: by outflank-mailman (input) for mailman id 167767;
 Tue, 17 Aug 2021 11:22:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFxAe-0007Fq-HC
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:22:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFxAe-0004Gc-FM
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:22:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFxAe-0006JJ-EE
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:22:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mFxAa-0003nr-Tu; Tue, 17 Aug 2021 12:22:12 +0100
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
	bh=/TiuqKn+LlngV3HJuZ7gkhbeixw5tUnVYzdMdGUn6Lw=; b=OSkg71nzWyyg4WEM3oeMw6hx+4
	Vr6nvilbccQqmJTBPAhS3ufGyeOUMa4LyPrwbZ3S9AFSja5ssgPgTGc8pQYpOPp8j6Ko2xCx28aAF
	VA3m7p5FMeJ2VHCk93rNYDd/JP6UOeAQ17shy2TfZSRGmNZrCvUcs523yabF6Q3wp8aA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24859.39908.610782.208603@mariner.uk.xensource.com>
Date: Tue, 17 Aug 2021 12:22:12 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 164195: FAIL
In-Reply-To: <0ee3f99c-0ca1-18e3-f8ab-e2f10f435720@suse.com>
References: <osstest-164195-mainreport@xen.org>
	<0ee3f99c-0ca1-18e3-f8ab-e2f10f435720@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-unstable test] 164195: FAIL"):
> On 16.08.2021 07:50, osstest service owner wrote:
> > flight 164195 xen-unstable real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/164195/
> > 
> > Failures and problems with tests :-(
...
> > Tests which are failing intermittently (not blocking):
> >  test-amd64-amd64-amd64-pvgrub 12 debian-di-install         fail pass in 164186
> >  test-amd64-amd64-i386-pvgrub 12 debian-di-install          fail pass in 164186
> 
> Are the last two perhaps connected to
> 
> Checking the Debian archive mirror  ... 25%... 50%... 75%... 100%
> Choose a mirror of the Debian archive
> -------------------------------------

Very likely.  Debian bullseye was released at the weekend;
I guess the mirror network might have had some trouble.
As the report says, this was an intermittent failure; I think it's
fine to expect this to pass on the retry.

As I reported on irc, the main problem right now is the hardware
failure on arndale-bluewater, which looks like an HDD failure
from the logs.

I've taken it out of the pool and hopefully things will have sorted
themselves out by tomorrow.

Ian.

