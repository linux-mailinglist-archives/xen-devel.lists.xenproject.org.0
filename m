Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916DD507F1B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308712.524513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0RU-0000Mu-Ok; Wed, 20 Apr 2022 02:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308712.524513; Wed, 20 Apr 2022 02:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0RU-0000Kb-Lo; Wed, 20 Apr 2022 02:51:44 +0000
Received: by outflank-mailman (input) for mailman id 308712;
 Wed, 20 Apr 2022 02:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh0RT-0000KV-7V
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:51:43 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce4a77b6-c054-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 04:51:42 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2pWaH093128
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:51:38 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2pWbm093127;
 Tue, 19 Apr 2022 19:51:32 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: ce4a77b6-c054-11ec-a405-831a346695d4
Message-Id: <cover.1650422517.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 19 Apr 2022 19:41:57 -0700
Subject: [PATCH 0/2] Allow use of JSON in domain configuration files
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

While the traditional domain configuration file format works acceptably,
I can see uses for having full JSON support.  As such add "-j" and "-J"
to `xl create` to specify format.  The traditional format is the current
default.

While attempting this, it came up that options for `xl create` aren't in
a consistent order.  I'm concerned about moving the VNC options apart,
but the others have been sorted.

Elliott Mitchell (2):
  tools/xl: Sort create command options
  tools/xl: Allow specifying JSON for domain configuration file format

 tools/xl/xl.h           |  5 ++++
 tools/xl/xl_cmdtable.c  | 12 ++++++----
 tools/xl/xl_vmcontrol.c | 51 ++++++++++++++++++++++++-----------------
 3 files changed, 42 insertions(+), 26 deletions(-)

-- 
2.30.2


