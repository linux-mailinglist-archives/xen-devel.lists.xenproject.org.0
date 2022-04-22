Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAA350C096
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 22:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311221.528355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhzRn-00044e-3B; Fri, 22 Apr 2022 20:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311221.528355; Fri, 22 Apr 2022 20:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhzRm-00040p-Vz; Fri, 22 Apr 2022 20:00:06 +0000
Received: by outflank-mailman (input) for mailman id 311221;
 Fri, 22 Apr 2022 20:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pzHF=VA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nhzRl-0003wZ-MI
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 20:00:05 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc04de81-c276-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 22:00:03 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23MJxnvV012240
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 22 Apr 2022 15:59:55 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23MJxnPr012239;
 Fri, 22 Apr 2022 12:59:49 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: cc04de81-c276-11ec-8fc2-03012f2f19d4
Date: Fri, 22 Apr 2022 12:59:49 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 0/1] Adjust odd Python bindings
Message-ID: <YmMJNV0T6K1ih79x@mattapan.m5p.com>
References: <cover.1650551486.git.ehem+xen@m5p.com>
 <YmICI1BPTBIqdgBq@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmICI1BPTBIqdgBq@mail-itl>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, Apr 22, 2022 at 03:17:23AM +0200, Marek Marczykowski-G??recki wrote:
> On Thu, Apr 21, 2022 at 07:31:26AM -0700, Elliott Mitchell wrote:
> > I'm unsure how widely the Python bindings are used.  Certainly they were
> > used for PyGRUB.  Have any other projects used them so far?  What I'm
> > doing is likely to be contributed to the Xen Project, and I suspect the
> > existence of other projects would be known...
> 
> Yes, Python bindings are used outside of xen.git. I'm aware of few
> places in Qubes OS, but I expect there are other users too. So, I'm
> afraid breaking the current import method isn't really an option. What
> you could try, is to make both versions work at the same time, but TBH
> I'm not sure how to do that with C extension.

Simplest would have been to address this in 2004, when the Python
bindings had insignificant usage.  Another handy time when things could
have been broken was the Python 2->3 transition.  Yet now both of those
points have passed.

I suspect this could be done by adding some Python code to an __init__.py
file.  Simply redirect attempts to load the old path to the new path.

Other thing I noted is the Python documentation indicates the first
argument to Extension() was wrong.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



