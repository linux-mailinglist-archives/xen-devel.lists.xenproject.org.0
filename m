Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6F7B2A62
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 04:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610149.949437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm3ZX-0006e2-MN; Fri, 29 Sep 2023 02:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610149.949437; Fri, 29 Sep 2023 02:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm3ZX-0006ag-JR; Fri, 29 Sep 2023 02:49:43 +0000
Received: by outflank-mailman (input) for mailman id 610149;
 Fri, 29 Sep 2023 02:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xnwI=FN=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qm3ZW-0006aa-0M
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 02:49:42 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4984372-5e72-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 04:49:39 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 38T2nLxi008435
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 28 Sep 2023 22:49:26 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 38T2nIJL008434;
 Thu, 28 Sep 2023 19:49:18 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d4984372-5e72-11ee-878b-cb3800f73035
Date: Thu, 28 Sep 2023 19:49:18 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current issue is
the changes with the handling of the shared information page appear to
have broken things for me.

With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
of the 4.17 release, mapping the shared information page doesn't work.

I'm using Tianocore as the first stage loader.  This continues to work
fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
While Tianocore does map the shared information page, my reading of their
source is that it properly unmaps the page and therefore shouldn't cause
trouble.

Notes on the actual call is gpfn was 0x0000000000040072.  This is outside
the recommended address range, but my understanding is this is supposed
to be okay.

The return code is -16, which is EBUSY.

Ideas?

The obvious spot for EBUSY is from already having the shared information
page mapped.  Issue is I'm pretty sure it isn't mapped.

Did the policy change and now the shared information page *must* be
mapped within the recommended address ranges?

Is it a problem to map the shared information page at one address.  Unmap
it, then map it at another address?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



