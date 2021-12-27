Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3CB480142
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 16:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252002.432981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sM7-00082T-Sw; Mon, 27 Dec 2021 15:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252002.432981; Mon, 27 Dec 2021 15:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sM7-0007zO-Q4; Mon, 27 Dec 2021 15:56:11 +0000
Received: by outflank-mailman (input) for mailman id 252002;
 Mon, 27 Dec 2021 15:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jnZ2=RM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1n1sM6-0007zI-DB
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 15:56:10 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f916d7b-672d-11ec-9e60-abaf8a552007;
 Mon, 27 Dec 2021 16:56:07 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1BRFttn6054480
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 27 Dec 2021 10:56:01 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1BRFttI6054479;
 Mon, 27 Dec 2021 07:55:55 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 7f916d7b-672d-11ec-9e60-abaf8a552007
Message-Id: <cover.1640590794.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Sun, 26 Dec 2021 23:39:54 -0800
Subject: [PATCH 0/5] Some misc from my tree
X-Spam-Status: No, score=1.5 required=10.0 tests=DATE_IN_PAST_06_12,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Some bits I had run across when looking at a piece of libxl.

Even though the purpose of the functions suggests they won't modify the
memory passed in via pointer, marking them constant provides better
reassurance.

While list_domains_details() and printf_info() had similar purposes their
interfaces were wildly different.  Make them more consistent.  I was
aiming to turn dump_by_dominfo_list() into a wrapper around
dump_by_config(), but didn't quite get there.

Having the functions named "printf" is wrong.  They are generating output
in a fixed format, there is no control over the format.  That is a write
or dump operation, not a formatted print.

Elliott Mitchell (5):
  tools/libxl: Mark pointer args of many functions constant
  tools/xl: Mark libxl_domain_config * arg of printf_info_*() const
  tools/xl: Rename printf_info()/list_domains_details() to dump_by_...()
  tools/xl: Merge down debug/dry-run section of create_domain()
  tools/xl: Fix potential deallocation bug

 tools/include/libxl_json.h        | 22 +++++++++++---------
 tools/libs/light/gentypes.py      |  8 ++++----
 tools/libs/light/libxl_cpuid.c    |  2 +-
 tools/libs/light/libxl_internal.c |  4 ++--
 tools/libs/light/libxl_internal.h | 18 ++++++++--------
 tools/libs/light/libxl_json.c     | 18 ++++++++--------
 tools/libs/light/libxl_nocpuid.c  |  4 ++--
 tools/xl/xl.h                     | 10 ++++++++-
 tools/xl/xl_info.c                | 34 ++++++++++++++++---------------
 tools/xl/xl_misc.c                |  5 +----
 tools/xl/xl_sxp.c                 |  6 +++---
 tools/xl/xl_vmcontrol.c           | 14 +------------
 12 files changed, 72 insertions(+), 73 deletions(-)

-- 
2.30.2


