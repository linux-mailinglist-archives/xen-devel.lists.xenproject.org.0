Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070137620C3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 19:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569858.891011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOMI1-0007Qi-HA; Tue, 25 Jul 2023 17:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569858.891011; Tue, 25 Jul 2023 17:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOMI1-0007Og-EY; Tue, 25 Jul 2023 17:57:41 +0000
Received: by outflank-mailman (input) for mailman id 569858;
 Tue, 25 Jul 2023 17:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+7o=DL=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qOMHz-0007Oa-Tf
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 17:57:39 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1c6d4a-2b14-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 19:57:36 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36PHvBrk067089
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 25 Jul 2023 13:57:16 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36PHvAFL067088;
 Tue, 25 Jul 2023 10:57:10 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: bc1c6d4a-2b14-11ee-8613-37d641c3527e
Message-Id: <8891bdfb2378187cfcaa8ed6f49817404db15924.1690307465.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 13 Jul 2023 16:53:57 -0700
Subject: [PATCH RESEND] tools/xl_parse: remove message for tsc mode string
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Normal behavior is to be silent.  Generating a message for the preferred
input can be mistaken for an error.  As such remove this message to match
other conditions.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
This looks like a bit of printf()-debugging which never got removed.  The
message serves to discourage use of the named tsc_mode values.  I suspect
this is the ooposite of the desired result and therefore should be
purged.
---
 tools/xl/xl_parse.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index f036e56fc2..7b1369f098 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1658,7 +1658,6 @@ void parse_config_data(const char *config_source,
         }
         b_info->tsc_mode = l;
     } else if (!xlu_cfg_get_string(config, "tsc_mode", &buf, 0)) {
-        fprintf(stderr, "got a tsc mode string: \"%s\"\n", buf);
         if (libxl_tsc_mode_from_string(buf, &b_info->tsc_mode)) {
             fprintf(stderr, "ERROR: invalid value \"%s\" for \"tsc_mode\"\n",
                     buf);
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445


