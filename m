Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9242EA033
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61554.108425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYhv-0001A1-0t; Mon, 04 Jan 2021 22:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61554.108425; Mon, 04 Jan 2021 22:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYhu-00019W-TS; Mon, 04 Jan 2021 22:52:10 +0000
Received: by outflank-mailman (input) for mailman id 61554;
 Mon, 04 Jan 2021 22:52:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYht-00018z-06
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:52:09 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 476ca007-97e6-4a19-b946-41a7d28fb412;
 Mon, 04 Jan 2021 22:52:08 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104Mpvt3071451
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:52:03 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104Mpv9A071450;
 Mon, 4 Jan 2021 14:51:57 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 476ca007-97e6-4a19-b946-41a7d28fb412
Message-Id: <3433bf049b9d626282e49824a744c9264a6db215.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 10 Dec 2020 15:09:06 -0800
Subject: [WIP PATCH 08/16] tools/xl: Fix potential deallocation bug
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

There is potential for the info and info_free variable's purposes to
diverge.  If info was overwritten with a distinct value, yet info_free
still needed deallocation a bug would occur on this line.  Preemptively
address this issue (making use of divergent info/info_free values is
under consideration).

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_list.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index 8b391a9056..e30536fd9a 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -200,7 +200,7 @@ int main_list(int argc, char **argv)
                      info, nb_domain);
 
     if (info_free)
-        libxl_dominfo_list_free(info, nb_domain);
+        libxl_dominfo_list_free(info_free, nb_domain);
 
     libxl_dominfo_dispose(&info_buf);
 
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




