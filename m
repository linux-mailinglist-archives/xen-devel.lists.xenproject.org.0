Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74FB76D97B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575421.901140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJNb-0007Tp-81; Wed, 02 Aug 2023 21:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575421.901140; Wed, 02 Aug 2023 21:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJNb-0007Sj-1y; Wed, 02 Aug 2023 21:27:39 +0000
Received: by outflank-mailman (input) for mailman id 575421;
 Wed, 02 Aug 2023 21:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJGb-0003L7-Jc
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:20:25 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64102d71-317a-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:20:23 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LKEVN008367
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:20:19 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LKE6T008366;
 Wed, 2 Aug 2023 14:20:14 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 64102d71-317a-11ee-8613-37d641c3527e
Message-Id: <6a645ebcf70c46df5a3ce0d8539d1108d9927d19.1690990427.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Sat, 29 Jul 2023 16:04:18 -0700
Subject: [PATCH 05/22] tools/utils: update Bison parser directives
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Update per Bison's obsolete warnings.  Testing indicates these are simple
and safe.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Someone check for acceptable Bison versions?

I'm testing with Flex 2.6.4 and Bison 3.7.5.
---
 tools/libs/util/libxlu_cfg_y.y | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg_y.y b/tools/libs/util/libxlu_cfg_y.y
index 020fc63eb3..e53d8ed337 100644
--- a/tools/libs/util/libxlu_cfg_y.y
+++ b/tools/libs/util/libxlu_cfg_y.y
@@ -28,9 +28,9 @@
 }
 
 %locations
-%pure-parser
+%define api.pure
 %defines
-%error-verbose
+%define parse.error verbose
 %name-prefix "xlu__cfg_yy"
 %parse-param { CfgParseContext *ctx }
 %lex-param { ctx_scanner }
@@ -48,7 +48,7 @@
 file:  stmts
  |     stmts assignment
 
-stmts:  /* empty */
+stmts:  %empty
  |      stmts stmt
 
 stmt:   assignment endstmt
@@ -67,13 +67,12 @@ value:  atom                         { $$= xlu__cfg_string_mk(ctx,$1,&@1); }
 atom:   STRING                   { $$= $1; }
  |      NUMBER                   { $$= $1; }
 
-valuelist: /* empty */           { $$= xlu__cfg_list_mk(ctx,NULL,&yylloc); }
+valuelist: %empty               { $$= xlu__cfg_list_mk(ctx,NULL,&yylloc); }
  |      values                  { $$= $1; }
  |      values ',' nlok         { $$= $1; }
 
 values: value nlok                  { $$= xlu__cfg_list_mk(ctx,$1,&@1); }
  |      values ',' nlok value nlok  { xlu__cfg_list_append(ctx,$1,$4); $$= $1; }
 
-nlok:
-        /* nothing */
+nlok:   %empty
  |      nlok NEWLINE
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




