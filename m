Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5C150ACC2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 02:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310544.527447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhh6c-0001Sg-Bp; Fri, 22 Apr 2022 00:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310544.527447; Fri, 22 Apr 2022 00:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhh6c-0001Qp-8m; Fri, 22 Apr 2022 00:25:02 +0000
Received: by outflank-mailman (input) for mailman id 310544;
 Fri, 22 Apr 2022 00:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pzHF=VA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nhh6b-0001Qj-8G
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 00:25:01 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2f2f251-c1d2-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 02:24:58 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23M0OjT1006761
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 21 Apr 2022 20:24:51 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23M0Og3P006760;
 Thu, 21 Apr 2022 17:24:42 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: a2f2f251-c1d2-11ec-8fc2-03012f2f19d4
Message-Id: <dc05a59dc0e186f9dcec8d0e877ee80af168b6a8.1650551981.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Thu, 21 Apr 2022 07:35:14 -0700
Subject: [PATCH] scripts/add_maintainers.pl: add -o as an alternative to
 --patchdir
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=1.5 required=10.0 tests=DATE_IN_PAST_06_12,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

This matches the output directory option used by `git format-patch`.  I
suspect I'm not the only one who finds matching `git format-patch` more
intuitive, than -d for directory.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 scripts/add_maintainers.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/add_maintainers.pl b/scripts/add_maintainers.pl
index 5a6d0f631b..380e8da22a 100755
--- a/scripts/add_maintainers.pl
+++ b/scripts/add_maintainers.pl
@@ -32,7 +32,7 @@ $get_maintainer =~ s/add_maintainers/get_maintainer/;
 my $usage = <<EOT;
 OPTIONS:
 --------
-USAGE: $tool [options] (--patchdir | -d) <patchdir>
+USAGE: $tool [options] (--patchdir | -d | -o) <patchdir>
 
   --reroll-count <n> | -v <n>
     Choose patch files for specific version. This results into the
@@ -223,7 +223,7 @@ my $patch_ext           = ".patch";
 my $maintainers         = "MAINTAINERS";
 
 if (!GetOptions(
-                'd|patchdir=s'     => \$patch_dir,
+                'd|o|patchdir=s'   => \$patch_dir,
                 'v|reroll-count=i' => \$rerollcount,
                 'p|patchcc=s'      => \$plocation,
                 'c|covercc=s'      => \$clocation,
-- 
2.30.2


