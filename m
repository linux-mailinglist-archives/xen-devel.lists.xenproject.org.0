Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87815159DB
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 04:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317933.537479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkd2A-0003B0-P8; Sat, 30 Apr 2022 02:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317933.537479; Sat, 30 Apr 2022 02:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkd2A-00039T-Lo; Sat, 30 Apr 2022 02:40:34 +0000
Received: by outflank-mailman (input) for mailman id 317933;
 Sat, 30 Apr 2022 02:40:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yLwW=VI=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nkd29-00039N-Ux
 for xen-devel@lists.xenproject.org; Sat, 30 Apr 2022 02:40:33 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e725aba5-c82e-11ec-a405-831a346695d4;
 Sat, 30 Apr 2022 04:40:32 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23U2eKJQ061600
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 29 Apr 2022 22:40:26 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23U2eHq2061599;
 Fri, 29 Apr 2022 19:40:17 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: e725aba5-c82e-11ec-a405-831a346695d4
Message-Id: <cover.1651285313.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 29 Apr 2022 19:21:53 -0700
Subject: [PATCH v2 0/3] Allow use of JSON in domain configuration files
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

Due to one issue in the previous round I ended up examing the dom_info
variable in main_create().  The situation there is a bit tangled.  There
were shadow variables for everything in dom_info.  Unfortunately the
short-hand serves to confuse, so I believe the appropriate action is to
remove the shadows.  Appears .dry_run had effectively been deprecated,
but not fully removed; as such now fully remove it.

Rename everything "format" to "config_format".

Elliott Mitchell (3):
  tools/xl: Sort create command options
  tools/xl: Use sparse init for dom_info, remove duplicate vars
  tools/xl: Allow specifying JSON for domain configuration file format

 tools/xl/xl.h           |   6 ++-
 tools/xl/xl_cmdtable.c  |  14 ++---
 tools/xl/xl_vmcontrol.c | 114 +++++++++++++++++++++-------------------
 3 files changed, 73 insertions(+), 61 deletions(-)

-- 
2.30.2


