Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9D3752E1A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 02:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563416.880635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK6EL-0004vJ-IT; Fri, 14 Jul 2023 00:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563416.880635; Fri, 14 Jul 2023 00:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK6EL-0004sk-Ey; Fri, 14 Jul 2023 00:00:17 +0000
Received: by outflank-mailman (input) for mailman id 563416;
 Fri, 14 Jul 2023 00:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uaxh=DA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qK6EJ-0004kA-7I
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 00:00:15 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 662cde7b-21d9-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 02:00:11 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36DNxpoa098867
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Jul 2023 19:59:56 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36DNxn4e098866;
 Thu, 13 Jul 2023 16:59:49 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 662cde7b-21d9-11ee-8611-37d641c3527e
Message-Id: <d71c1ddd04de64222579fe312c6fdcdb8f95abf5.1689292729.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 13 Jul 2023 16:53:57 -0700
Subject: [PATCH] tools/xl_parse: remove message for tsc mode string
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Normal behavior is to be silent.  Generating a message for the preferred
input can be mistaken for an error.  As such remove this message to match
other conditions.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
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
2.30.2


