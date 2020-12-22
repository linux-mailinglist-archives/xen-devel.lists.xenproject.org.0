Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B117D2EA028
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:50:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61516.108341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYfm-0008Ao-IC; Mon, 04 Jan 2021 22:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61516.108341; Mon, 04 Jan 2021 22:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYfm-0008AP-El; Mon, 04 Jan 2021 22:49:58 +0000
Received: by outflank-mailman (input) for mailman id 61516;
 Mon, 04 Jan 2021 22:49:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYfl-0008AK-9t
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:49:57 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ddd7041-16bb-4727-8f76-744f2411eb11;
 Mon, 04 Jan 2021 22:49:56 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MnjqH071384
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:49:51 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MnjLA071383;
 Mon, 4 Jan 2021 14:49:45 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 5ddd7041-16bb-4727-8f76-744f2411eb11
Message-Id: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 22 Dec 2020 11:01:34 -0800
Subject: [WIP PATCH 00/16] Addition of formatting options to `xl list`
 subcommands
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

The first 8 patches should be fairly uncontroversial, and could be
preemptively applied before the rest are ready.  They fell out as part
of trying to implement my first step; splitting a few xl subcommands off
of xl_info.c.

Found several functions in libxl which could have arguments marked const.
Reorganized the interrelated set of printf_info(),
list_domains_details(), printf_info_sexp() and printf_info_one_json().

The problem was list_domains_details() (replaced/renamed
dump_by_dominfo_list()) was best suited towards remaining in xl_info.c,
but main_list() was moved to xl_list.c.

One concern with the split, I tested which headers were actually
required.  I expected some to be required by one or the other file, and
not both.  Yet in the process I found my system didn't need <sys/stat.h>,
<sys/types.h>, nor <libxlutil.h> in *either* resultant file.  I have a
concern these headers may be needed on other's systems even though my
build didn't require them.  In fact this is a concern for most of the
headers which my system only required for one file.


The goal of this series is to drastically increase the utility of the
`xl list` subcommand.  Prior to this the limit of control was merely
enabling the output of 4 groups of extra columns.  The order of columns
couldn't be specified, nor could specific subsets be specified.  There
was also no allowance for for using null line terminators.

With this series all of this becomes possible.  Additionally for more
flexible use with scripting, it is now possible to omit the initial
header and Domain 0.

Unfortunately the output isn't *precisely* what was produced previously,
but it is very similar.

Also, some of the output columns are things which I don't have tester
for.  I'm pretty sure I've got the "context", "claimed" and
"shutdown reason" fields right, but I'm not setup to reliably produce
those states.  Thus for these three my testing is minimal, but the code
is standard enough to be confident in.

The CPU Pool and NODE Affinity fields are things I haven't played with at
all.  While I'm hopeful I adapted the code appropriately, these *need*
testing by someone with an appropriate setup.


I fully expect the last 8 patches to be partially or fully merged
together when this becomes ready.


There is one big wart.  At this revision, format_node() makes two
allocations which are lost at exit.  This isn't a big issue since they're
only allocated *once*, but certainly isn't optimal.


Elliott Mitchell (16):
  tools/libxl: Mark pointer args of many functions constant
  tools/libxl: Tiny optimization of libxl__mac_is_default()
  tools/xl: Mark libxl_domain_config * arg of printf_info_*() const
  tools/xl: Rename printf_info()/list_domains_details() to dump_by_...()
  tools/xl: Merge down debug/dry-run section of create_domain()
  tools/xl: Split list commands off of xl_info.c
  tools/xl: Sort list command options
  tools/xl: Fix potential deallocation bug
  WIP: tools/xl: Implement generalized output formatting for `xl list`
  WIP: tools/xl: Implement output format option
  WIP: tools/xl: Replace most of list_domains with use of format()
  WIP: UNTESTED: tools/xl: Replace remaining options with format()
  WIP: tools/xl: Purge list_domains()
  WIP: tools/xl: Enhance "list" command
  WIP: tools/xl: Implement output format option for "vm-list" command
  WIP: tools/xl: Enhance "vm-list" command

 tools/include/libxl_json.h        |  22 +-
 tools/libs/light/gentypes.py      |   8 +-
 tools/libs/light/libxl_cpuid.c    |   2 +-
 tools/libs/light/libxl_internal.c |   8 +-
 tools/libs/light/libxl_internal.h |  18 +-
 tools/libs/light/libxl_json.c     |  18 +-
 tools/libs/light/libxl_nocpuid.c  |   4 +-
 tools/xl/Makefile                 |   2 +-
 tools/xl/xl.h                     |  10 +-
 tools/xl/xl_cmdtable.c            |  27 +-
 tools/xl/xl_info.c                | 251 +------------
 tools/xl/xl_list.c                | 587 ++++++++++++++++++++++++++++++
 tools/xl/xl_misc.c                |   5 +-
 tools/xl/xl_sxp.c                 |   6 +-
 tools/xl/xl_vmcontrol.c           |  14 +-
 15 files changed, 684 insertions(+), 298 deletions(-)
 create mode 100644 tools/xl/xl_list.c

-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




