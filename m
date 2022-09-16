Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916EF5BA36F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 02:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407717.650308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYyx8-0006z0-JH; Fri, 16 Sep 2022 00:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407717.650308; Fri, 16 Sep 2022 00:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYyx8-0006w3-FJ; Fri, 16 Sep 2022 00:11:30 +0000
Received: by outflank-mailman (input) for mailman id 407717;
 Fri, 16 Sep 2022 00:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VamP=ZT=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1oYyx6-0006vA-Pe
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 00:11:29 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19b8aa75-3554-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 02:11:27 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1oYyx1-0003ks-Oy; Fri, 16 Sep 2022 01:11:23 +0100
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
X-Inumbo-ID: 19b8aa75-3554-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=chiark.greenend.org.uk; s=d.chiark; h=DKIM-Signature-Warning:References:
	In-Reply-To:Subject:Cc:To:Date:Message-ID:Content-Transfer-Encoding:
	Content-Type:MIME-Version:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=VxOwVn7em2fMK67pgBu6uBIF35SvIl1Jqln+63470P0=; b=aVS8PDV3KOES
	t9OW/l/dXFRwjpVKAOq4oM2QHWYZx232K3Bjq94WWTEMptWWtAoSFN13oPS1cFBqOejk66Yiph224
	QOlJOp4LFi6WP3cGs20d2O7xWu1mZP/C5oVBPmXgRKOJHTNn/hqCzjByFXYn18xj2usiWGctJUfDW
	u7dPyyF4SHTmVJ3rMBciFoAqPzRxhuWBDYT1F3XSWQQlcgjq+ZpPbaqMuL+QuVbbbTbnNUVx2RcT+
	1kvDkBvvKaIUEBFUct44JG7ZVhf/KQYz0bT63W4XkQ+UURm1WSmD0e/fBBdUGlWD80jHQX1c8wS8V
	pMkJpZYJzUYBFMFx+c823Q==;
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25379.48939.677933.809426@chiark.greenend.org.uk>
Date: Fri, 16 Sep 2022 01:11:23 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    <xen-devel@lists.xenproject.org>
Subject: osstest branch refs and self-push-gate Re: Sorting out osstest
In-Reply-To: <YyNHAUomrUHyyi+n@perard.uk.xensource.com>
References: <YyNDpi9vGiNE60v7@MacBook-Air-de-Roger.local>
	<YyNHAUomrUHyyi+n@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://www.chiark.greenend.org.uk/dkim-rotate/README.txt https://www.chiark.greenend.org.uk/dkim-rotate/df/dfe474b8ea4127edd09b653f3faec3f3.pem

Anthony PERARD writes ("Re: Sorting out osstest"):
> Yes, that plan sound good to me. Just one thing, `git checkout master`
> in testing.git as at the moment "pretest" is the current branch.

Yes.

Here's an overview of what's (supposed) to exist and happen.

There are:

   osstest:~osstest/testing.git #pretest

        Push here to update osstest.  Need not be fast forwarding.  So
	if something is doomed, or you cancel te self-test flight by
	killing sg-execute-flight, you can rewind it.  You can also
	update this while a self-test is running, like any osstest
	input branch.

	If it is not ff from #master, even a successful self-test
	won't be able to update master.

   osstest:~osstest/testing.git  #master
   xenbits:osstest.git           #master

        Tested version.  Normally, automatically updated
        from pretest after a successful self-test.
        Both refs are supposed to be updated in step.

        To force push, ie, push something manually without a
	self-test, you can use ./ap-push.  Don't use git push (ap-push
	updates both refs).

        For other trees, to perform a force push, ./mg-force-push
	is better since it can perform additional checks.

   xenbits:~osstest/osstest-massachusetts.git #refs/heads/flight-NNN

        Permanent record of the osstest code which ran some flight.
	Separated because of git's poor perf with trees with so many
	refs.

HTH.

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

