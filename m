Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2074B966
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 00:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560628.876697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHths-00036E-2R; Fri, 07 Jul 2023 22:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560628.876697; Fri, 07 Jul 2023 22:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHthr-00034N-Vi; Fri, 07 Jul 2023 22:13:39 +0000
Received: by outflank-mailman (input) for mailman id 560628;
 Fri, 07 Jul 2023 22:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7rlb=CZ=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qHthq-00034H-G0
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 22:13:38 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 833d7b01-1d13-11ee-8611-37d641c3527e;
 Sat, 08 Jul 2023 00:13:35 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 367MD7H7068848
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 7 Jul 2023 18:13:13 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 367MD7tF068847;
 Fri, 7 Jul 2023 15:13:07 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 833d7b01-1d13-11ee-8611-37d641c3527e
Date: Fri, 7 Jul 2023 15:13:07 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Python in Domain Configurations
Message-ID: <ZKiN80e08QIojRSL@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

There is a distinct weakness in Xen which ends up dragging in domain
configuration limitations.  I was thinking of using Python for parsing
extra data out of domain configuration files.  Only to find sample domain
configuration files were in fact fully valid Python.

Having experimented, it appears entirely feasible to use libpython to
parse current domain configuration files.  Looking further it appears
Python was in fact used in the past to handle domain configuration files.

Why was this removed?

The only context I could find was 54fbaf446b and
https://wiki.xenproject.org/wiki/PythonInXlConfig which don't explain
the reasoning.

Would the maintainers be amenable to revisiting the decision to remove
support for full Python in domain configuration files?

The obvious reason is having full Python would increase the size of `xl`.
In most cases I'm unsure this would be too problematic.  The case where
it would matter is the daemon process.  Issue here is plenty of other
extra libraries are also bloating the runtime size of `xl`.  I suspect
the daemon process really needs to be split into a separate executable to
reduce overhead anyway.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



