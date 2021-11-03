Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED24447FE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 19:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221103.382637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miKim-00040H-Tr; Wed, 03 Nov 2021 18:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221103.382637; Wed, 03 Nov 2021 18:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miKim-0003xg-Qt; Wed, 03 Nov 2021 18:10:48 +0000
Received: by outflank-mailman (input) for mailman id 221103;
 Wed, 03 Nov 2021 18:10:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miKik-0003xa-Lp
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:10:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miKik-0006g9-IX
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:10:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miKik-0006Py-Gy
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:10:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miKii-0000Ll-At; Wed, 03 Nov 2021 18:10:44 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=4pr86glgSNDczjsEO/ivaBNBPOwu/35tHqCoVrWtdHk=; b=lHFN7fzngX/sWK5rHaDeImT6UQ
	b4YAUp++2W5t6qrS9DP2N9TAgWm4H7Li1lKnNVylXDWK/zCluM7dSwbXdnnvtpKXPHVhx8Cw20roD
	dDpycMhILVyQmwjFKyUeyES+uq1YuY4ncWJijtN6O2lJrPCvdoxDkvS/4EQhoomqlkT8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24962.53411.573690.15547@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 18:10:43 +0000
To: xen-devel@lists.xenproject.org
CC: Anthony PERARD <anthony.perard@citrix.com>
Subject: qemu build failure on release tarball with python <= 3.5
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

The RC1 release tarball failed its test build on the rather old install
I was using.  I decided to release it anyway, but ideally this would
be improved.

The problem is that the version of qemu upstream we are now using
requires Python 3.6.  We don't want to downgrade it and trying to
improve the version support upstream is not going to be practical.

Most distro users won't use the qemu we ship.  It's there for the
benefit of users, to make sure we can provide one that is known to be
working.

It seems like the best available alternative for users who cannot
upgrade their python3 is to use --with-system-qemu and hope that the
system qemu works well enough.  (We have quite loose coupling here.)

I will look into improving the error handling, to try to give users
who encounter this problem some advice and save they trying doomed
approaches to fix it.

In the meantime, with my release technician hat on, I will do the test
builds in an environment with Python 3.6.

IRC conversation below.

Ian.

17:08 <@Diziet> anthonyper: My test build for the RC1 failed because I did it 
                in an environment whose python3 version was 3.5.3
17:08 <@Diziet> I decided to release it anyway.
17:08 <@Diziet> Now I debug it I discover that this is because qemu upstream 
                needs python 3.6
17:10 <@Diziet> Python 3.6.0 was released upstream a shade less than 5ya
17:11 <@Diziet> What is your opinion about this situation ?  (Feel free to cast 
                aspersions.)
17:13 <anthonyper> people can build older version of QEMU if their build 
                   environment is too old to build recent version.
17:13 <@Diziet> And not use the one we supply, you mean.
17:13 <@andyhhp> hmm - current CI has a check for Py3.5
17:13 <@andyhhp> so apparently we have no containers using Py3.5
17:14 <anthonyper> ah, I forgot we include QEMU in the release tarball :-(
17:15 <@Diziet> That is useful to people getting our stuff directly because 
                upstream qemu often breaks :-(
17:15 <anthonyper> Do you mean that released version of QEMU often break?
17:16 <@Diziet> I think we have sometimes failed to get regressions fixed 
                before upstream qemu released with them.
17:17 <@Diziet> (I would have to search through my records to be sure.)
17:17 <@Diziet> I doubt we want to try to fix our tarball so that it can build 
                that qemu with older python.
17:19 <@Diziet> That leaves: (i) don't put qemu in the tarball; (ii) ship it as 
                is and expect users with old python to disable it (iii) same 
                but disable the build by default
17:19 <@Diziet> In any case I should do the test build with newer python.
17:19 <@Diziet> Right now the failure mode is very poor: it runs through our 
                configure, and then our make runs qemu configure which bombs out
17:19 <anthonyper> I usually keep an eye on osstest flight, and would try 
                   harder to get QEMU fixed before it releases. But yes, it can 
                   happen that a release is broken. Hopofully, that doesn't 
                   happen too often.
17:22 <@Diziet> Do you see any other options besides my (i),(ii),(iii) above ?  
                Which do you think is best ?
17:22 <@Diziet> (I guess we could make whether we build qemu depend on the 
                python version we find but omg that is going to be fragile and 
                also quite surprising to people)
17:25 <anthonyper> I guess (ii) is fine for now. (i) would probably be best, 
                   but we would probably want to change the way we build xen 
                   and the tool I think. (iii) disable qemu by default would be 
                   supprising as well, I guess.
17:25 <anthonyper> I wounder how many distribution would have a separate build 
                   for qemu, and thus not using xen's tarball for qemu.
17:27 <anthonyper> I don't think we can disable qemu's build depending on 
                   python version, we might be building a qemu that have 
                   different requirement.
17:31 <@Diziet> I think distros will generally want to have only one qemu.
17:31 <@Diziet> Certainly that's true of Debian.
17:32 <@Diziet> So they won't use ours.  It's the people just getting our 
                tarball that might need our help.  If it won't build hopefully 
                their distro qemu will work and they can use --with-system-qemu
17:34 <@Diziet> I wonder if we can improve the UX here.  Ideally we would run 
                the upstream qemu configure as part of our configure but since 
                our Makefile is the thing which clones it that's not so easy.
17:34 <anthonyper> also, we need to start building the toolstack anyway (libs 
                   and include) before to call QEMU's configure.
17:38 <@Diziet> Mmm, yes
17:38 <@Diziet> And our configure doesn't know what version of qemu's it's 
                going to get
17:40 <@Diziet> Maybe I can improve the error message at least.
17:40 <@Diziet> anthonyper: Thanks for your help.  I will go away and think 
                about it.

