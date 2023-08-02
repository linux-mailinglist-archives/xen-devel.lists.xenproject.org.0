Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C39576D94D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575245.901056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJCe-0001mr-AR; Wed, 02 Aug 2023 21:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575245.901056; Wed, 02 Aug 2023 21:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJCe-0001js-6y; Wed, 02 Aug 2023 21:16:20 +0000
Received: by outflank-mailman (input) for mailman id 575245;
 Wed, 02 Aug 2023 21:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJCc-0001jm-Q3
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:16:18 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfd17f12-3179-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:16:15 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LFrXm008271
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:15:59 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LFrg0008270;
 Wed, 2 Aug 2023 14:15:53 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: cfd17f12-3179-11ee-8613-37d641c3527e
Message-Id: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 2 Aug 2023 08:33:47 -0700
Subject: [PATCH 00/22] Cleanup and splitting of xl.cfg parsing
X-Spam-Status: No, score=1.5 required=10.0 tests=DATE_IN_PAST_03_06,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Is there a freeze on that I'm unaware of?  Is there so much traffic from
other developers that smaller output ones are being missed?  I'm
wondering about the initial revision of this series not getting any
feedback:
https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01264.html


Due to the lack of news on the first thread, I've done some looking to
assess the feasibility.  The xl.cfg parser looks a bit jumbled.  Too many
things are visible to too many places.  In general some pieces have
really needed some TLC for a long time.

Note, some portions of this are semi-WIP.  The first 5 patches are simply
overdue maintenance.  Not particularly urgent, but should probably be
done.

Patch #06 is rather more urgent maintenance.  While it might not explode
soon, that is a landmine.

Patch #07 is the first big issue.  The roles of the various headers had
never been sorted out.  The underlying issue was more the contents of
"libxlu_cfg_i.h" needed to be merged into "libxlu_cfg_y.h".  Bison 2.3
may not have had the ability to embedded things into its header in 2010,
but the functionality appears to have been present in Bison 3.3.

There is an issue of what level of indentation should be used in
libxlu_cfg_y.y?  Normally the sections being added wouldn't be indented,
but normally they would be directly in headers.  I'm unsure of which
direction to go here.

Patch #08 seemed best to leave after #07 due to overlap and difficulty
with reordering.  I'm a bit worried about the interfacing with flex.


Then comes the issue of moving things out of libxlu_internal.h which
should never have been there.  The XLU_Config* values should have been
placed in libxlu_cfg_i.h instead.  Since I'm doing a thorough job,
they're instead moving to libxlu_cfg.c.

I'm unsure splitting libxlu_cfg.c is worthwhile.  The resultant reusable
libxlu_cfg.c is rather small.  Yet avoiding the need to reimplement the
small portion is handy.


Is the decision to keep in-tree copies of current Flex/Bison output still
valid?  I would be awful tempted to remove them from main/master, even
if copies are maintained on release branches.


Elliott Mitchell (22):
  tools/utils: cleanup formatting of libxlutil.h
  tools/utils: rename "n" arguments to "key"
  tools/utils: remove old declaration of xlu__cfg_yyparse()
  tools/utils: enable all Bison warnings
  tools/utils: update Bison parser directives
  tools/utils: remove libxlu_cfg_i.h from libxlu_disk.c
  tools/utils: merge contents of libxlu_cfg_i.h to libxlu_cfg_y.y
  tools/utils: Bison: switch from name-prefix to api.prefix
  tools/utils: move CfgParseContext to top of libxlu_cfg_y.y
  tools/utils: move XLU_ConfigSetting to libxl_cfg.c
  tools/utils: move XLU_ConfigValue to libxl_cfg.c
  tools/utils: remove YYLTYPE definition from libxlu_internal.h
  tools/utils: move XLU_ConfigList to libxl_cfg.c
  tools/utils: introduce xlu_cfg_printf() function
  tools/utils: move XLU_Config to libxlu_cfg.c
  tools/utils: move XLU_Operation to libxlu_cfg_y.h
  tools/utils: move setting free loop to xlu__cfg_set_free()
  tools/utils: spread xlu_cfg_printf() over libxlu_cfg.c
  tools/utils: add pointer to in-progress settings to CfgParseContext
  tools/utils: add wrapper for readfile()/readdata() functions
  tools/utils: add settings get function
  tools/utils: break flex/bison parser away from main config file

 tools/include/libxlutil.h                     |  31 +-
 tools/libs/util/Makefile                      |   3 +-
 tools/libs/util/libxlu_cfg.c                  | 679 ++----------------
 .../util/{libxlu_cfg.c => libxlu_cfg_i.c}     | 196 +++--
 tools/libs/util/libxlu_cfg_i.h                |  59 --
 tools/libs/util/libxlu_cfg_l.l                |   2 +-
 tools/libs/util/libxlu_cfg_y.y                |  58 +-
 tools/libs/util/libxlu_disk.c                 |  15 +-
 tools/libs/util/libxlu_internal.h             |  59 +-
 tools/libs/util/libxlu_pci.c                  |  11 +-
 tools/libs/util/libxlu_vif.c                  |   4 +-
 11 files changed, 223 insertions(+), 894 deletions(-)
 copy tools/libs/util/{libxlu_cfg.c => libxlu_cfg_i.c} (78%)
 delete mode 100644 tools/libs/util/libxlu_cfg_i.h

-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




