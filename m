Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F9AB42CC
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 20:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982066.1368548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEXrB-0007pN-BD; Mon, 12 May 2025 18:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982066.1368548; Mon, 12 May 2025 18:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEXrB-0007n8-8M; Mon, 12 May 2025 18:26:29 +0000
Received: by outflank-mailman (input) for mailman id 982066;
 Mon, 12 May 2025 18:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mHvf=X4=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1uEXr9-0007n2-JC
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 18:26:27 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bf87a83-2f5e-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 20:26:24 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 54CIPtkg052256
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 12 May 2025 14:26:01 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 54CIPrN9052255;
 Mon, 12 May 2025 11:25:53 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 9bf87a83-2f5e-11f0-9ffb-bf95429c2676
Date: Mon, 12 May 2025 11:25:53 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Xen-devel <xen-devel@lists.xenproject.org>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Roberto Bagnara <roberto.bagnara@bugseng.com>,
        Nicola Vetrini <nicola.vetrini@bugseng.com>,
        "consulting @ bugseng . com" <consulting@bugseng.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: Use __auto_type
Message-ID: <aCI9MZRN1A753Nw9@mattapan.m5p.com>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
 <548430a5-fa4a-41d1-b5ba-ba45efa90bbc@suse.com>
 <7acc83a3-2b15-4557-b293-0832b35e3680@citrix.com>
 <35826c2a-4266-49d2-b1b8-1248aac227b5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35826c2a-4266-49d2-b1b8-1248aac227b5@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Mon, May 12, 2025 at 03:00:18PM +0200, Jan Beulich wrote:
> On 12.05.2025 14:09, Andrew Cooper wrote:
> > 
> > Now for the (new) controversial part.  Since sending this, Linux has
> > decided to just #define auto __auto_type for C < 23, in order to start
> > writing C23 compatible code from now.  It's more succinct, and has
> > better longevity.
> > 
> > We might want to consider the same, although it will introduce a new
> > example of defining a keyword, which we'd have to call out in the
> > MISRA/Eclair config.
> 
> I'm not outright opposed, as I don't think we use "auto" with its
> original semantics, but it feels somewhat odd.

Problem is "auto" already has a defined meaning in C.  Having this will
subtly break contributions from authors who weren't familiar with
everything in Xen's headers.  For anyone who does anything with projects
besides Xen this will encourage bad habits.

I believe many projects have a rule of *never* #define C keywords.  I'm
surprised such made it into the Linux kernel.  I expect it will be ripped
out in the near future.

MISRA *doesn't* absolutely forbid this?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



