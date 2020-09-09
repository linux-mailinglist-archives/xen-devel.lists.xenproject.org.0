Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5268262CF0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:19:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFxC8-0002dF-27; Wed, 09 Sep 2020 10:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF/M=CS=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kFxC6-0002dA-GX
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 10:19:14 +0000
X-Inumbo-ID: 96f511ff-55a4-4b14-bac1-ca610eb51b26
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96f511ff-55a4-4b14-bac1-ca610eb51b26;
 Wed, 09 Sep 2020 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
 Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=Svj3tTJjlcKETdhBGlK5wZSi/qkj/oPzpodHpSAoeH4=; b=Y7Kp6+GqO/FE7Zef0PeGM5idLn
 SAQAbhITsBWrTQT8mYN8mvlltx5XbDsxtR8YySiepLQxvz9IIzrfoqmdpH+COTwe3vK1n4K4Bg7n9
 uCC2WijTylhWYq/twcq1ZmMqlzYPZtqa9vVJjaUC/gY6wjbOT+mmXz8D8AZiS6GFgZyg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kFxC5-0004qU-IY
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 10:19:13 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kFxC5-0006WW-Gy
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 10:19:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>) id 1kFxC3-0001Qq-Mj
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 11:19:11 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24408.44063.454729.995628@mariner.uk.xensource.com>
Date: Wed, 9 Sep 2020 11:19:11 +0100
To: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 153983: regressions - FAIL
In-Reply-To: <osstest-153983-mainreport@xen.org>
References: <osstest-153983-mainreport@xen.org>
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

osstest service owner writes ("[xen-unstable test] 153983: regressions - FAIL"):
> flight 153983 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/153983/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-libvirt-xsm  7 xen-boot                 fail REGR. vs. 152877
> 

Following discussion on irc (see below), I have force pushed this.

> version targeted for testing:
>  xen                  1e2d3be2e516e6f415ca6029f651b76a8563a27c


10:57 <andyhhp__> Diziet: force push on flight 153983?  There was only
                  one failure, and it laxaton1 which went down for
                  reboot and never came back

11:00 <julieng> andyhhp__: This suggests the PCI training failed on
                the board.  This is a known failure that happen time
                to time.
11:03 <andyhhp__> in this case, a force push will unbreak the mess we
                  have with the minios master branch, and should stop
                  the torrent of ovmf build failures
11:05 <julieng> Right, I was just confirming that the bug in laxton1
                can be disregarded (in the past we had to re-flash
                when the board when this happens).

11:10 <Diziet> andyhhp__: Let me look
11:11 <Diziet> julieng: I don't remember it happening recently.  I
               wonder what has changed.

11:13 <Diziet> Well, force pushing that would be betting that if it
               weren't for the laxton boot failure, the test would
               have passed.
11:14 <Diziet> It passed on b11910082d90
11:14 <Diziet> And the difference is     x86/pv: Fix assertions in 
               svm_load_segs()
11:14 <Diziet> OK, sold


