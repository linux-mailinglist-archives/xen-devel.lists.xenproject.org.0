Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA53333D2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 04:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95852.180933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJpSu-0002vi-VL; Wed, 10 Mar 2021 03:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95852.180933; Wed, 10 Mar 2021 03:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJpSu-0002vJ-SO; Wed, 10 Mar 2021 03:24:52 +0000
Received: by outflank-mailman (input) for mailman id 95852;
 Wed, 10 Mar 2021 03:24:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P6pI=II=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lJpSt-0002vE-J7
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 03:24:51 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 140ff447-608e-416e-9243-966fd0755461;
 Wed, 10 Mar 2021 03:24:50 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 12A3OXFc061128
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 9 Mar 2021 22:24:39 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 12A3OWB0061127;
 Tue, 9 Mar 2021 19:24:32 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 140ff447-608e-416e-9243-966fd0755461
Date: Tue, 9 Mar 2021 19:24:32 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()
Message-ID: <YEg78GtM82AmbbYh@mattapan.m5p.com>
References: <202103092114.129LEgZp059925@m5p.com>
 <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Tue, Mar 09, 2021 at 09:27:34PM +0000, Andrew Cooper wrote:
> On 08/03/2021 13:36, Elliott Mitchell wrote:
> > typeof() is available in Xen's build environment, which uses Xen's
> > compiler.  As these headers are public, they need strict standards
> > conformance.  Only __typeof__() is officially standardized.
> >
> > A compiler in standards conformance mode should report:
> >
> > warning: implicit declaration of function 'typeof' is invalid in C99
> > [-Wimplicit-function-declaration]
> >
> > (this has been observed with FreeBSD's kernel build environment)
> >
> > Based-on-patch-by: Julien Grall <julien@xen.org>, Sun Oct 4 20:33:04 2015 +0100
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> s!arm!xen/public! in the subject seeing as two thirds of the
> modifications are in non-ARM headers.

Gah!  Crucial little detail missing when rewriting the subject line.
Julien Grall's original patch/commit only did ARM, but when I checked I
found the other two and I did them too.


> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> This wants backporting as a build fix, so should be considered for 4.15
> at this point.
> 
> I wonder why our header checks don't pick this up.?? Do we need to throw
> a -pedantic around?

This came up since FreeBSD's kernel build uses Clang with
-std=iso9899:1999.  When I found FreeBSD was simply copying Xen's headers
it was clear this needed to be *here*.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



