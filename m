Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D767257BD02
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 19:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372107.603907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEDiR-0001Br-DP; Wed, 20 Jul 2022 17:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372107.603907; Wed, 20 Jul 2022 17:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEDiR-00018N-AR; Wed, 20 Jul 2022 17:42:31 +0000
Received: by outflank-mailman (input) for mailman id 372107;
 Wed, 20 Jul 2022 17:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q8G4=XZ=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1oEDiQ-00017n-5u
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 17:42:30 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [2001:470:1f07:15ff::f7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53463a68-0853-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 19:42:29 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 26KHgBON036587
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 20 Jul 2022 13:42:17 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 26KHgBKA036586;
 Wed, 20 Jul 2022 10:42:11 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 53463a68-0853-11ed-bd2d-47488cf2e6aa
Date: Wed, 20 Jul 2022 10:42:11 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Mathieu Tarral <mathieu.tarral@protonmail.com>,
        Xen-users <xen-users@lists.xenproject.org>,
        George Dunlap <George.Dunlap@citrix.com>,
        George Dunlap <dunlapg@umich.edu>, Juergen Gross <jgross@suse.com>,
        xen-devel@lists.xenproject.org
Subject: Re: xen master: xl create hangs
Message-ID: <Ytg+c5acgw8WgmMD@mattapan.m5p.com>
References: <YtgRpBR0duVAqPZJ@perard.uk.xensource.com>
 <hF_ANsRE_9Sbu2AU-AYkf0uIMtOhY2NGK2eG1QOXsdL8uKwi7K9y3SrJAJ4UrHJ34Mpp2WXUGOh4F2vdtJpguCOVHn-K-XuwtYeISjijagk=@protonmail.com>
 <YtgsNi2cBjov36aZ@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtgsNi2cBjov36aZ@perard.uk.xensource.com>
X-Spam-Status: No, score=-0.0 required=10.0 tests=KHOP_HELO_FCRDNS,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Wed, Jul 20, 2022 at 05:24:22PM +0100, Anthony PERARD wrote:
> 
> I think that this `xl` process just wait for the domain to shutdown
> or die. When we run `xl create`, before exiting there's a fork/exec of
> xl which handle a few domain events, so it looks like this stack trace
> is expected (and look like the one I have). So it don't looks like to be
> the xl process that hangs.

I've got a patch to make use of `setproctitle()` to modify what shows as
the process name for this process.  Unfortunately `setproctitle()` is
*BSD-only, "libbsd" for Linux implements similar functionality and I've
been meaning to figure out how it works.

I definitely think this should be done, just haven't gotten around to
finding a proper way to do it.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



