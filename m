Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE550ACC4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 02:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310552.527460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhh7t-00023O-N0; Fri, 22 Apr 2022 00:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310552.527460; Fri, 22 Apr 2022 00:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhh7t-0001zt-JN; Fri, 22 Apr 2022 00:26:21 +0000
Received: by outflank-mailman (input) for mailman id 310552;
 Fri, 22 Apr 2022 00:26:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pzHF=VA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nhh7s-0001zi-Et
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 00:26:20 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3f30e4f-c1d2-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 02:26:19 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23M0Q68r006777
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 21 Apr 2022 20:26:11 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23M0Q5WC006776;
 Thu, 21 Apr 2022 17:26:05 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d3f30e4f-c1d2-11ec-a405-831a346695d4
Message-Id: <cover.1650551486.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
Date: Thu, 21 Apr 2022 07:31:26 -0700
Subject: [PATCH 0/1] Adjust odd Python bindings
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=1.5 required=10.0 tests=DATE_IN_PAST_06_12,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

First off, this isn't properly tested.  I know it compiles, but that may
not mean much when this encounters the Real World.

I'm doing initial exploration for a project involving Xen.  Python seems
a good language for the project, so I'm trying out the Python bindings
for Xen.

What I've noticed is the bindings seem wrong.  Importing xen.lowlevel.xc,
then creating a xen.lowlevel.xc.xc() object has too many layers.  The
extra ".xc" is a distinct mismatch for comparable tools.  As such I'm
trying to get rid of the duplicated layer for both xc and xs.

The Python documentation indicates the name given to Extension() should
be the full name, not just the package name.  As such that is being
adjusted too.

I haven't yet done testing beyond confirming this builds, since further
checking will take some time to do...

I'm unsure how widely the Python bindings are used.  Certainly they were
used for PyGRUB.  Have any other projects used them so far?  What I'm
doing is likely to be contributed to the Xen Project, and I suspect the
existence of other projects would be known...

Elliott Mitchell (1):
  tools/python: move lowlevel packages one level up

 tools/pygrub/src/pygrub                 |  4 ++--
 tools/python/setup.py                   | 12 ++++++------
 tools/python/xen/lowlevel/{xc => }/xc.c |  0
 tools/python/xen/lowlevel/{xs => }/xs.c |  0
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename tools/python/xen/lowlevel/{xc => }/xc.c (100%)
 rename tools/python/xen/lowlevel/{xs => }/xs.c (100%)

-- 
2.30.2


