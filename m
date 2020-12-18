Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE87480144
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 16:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252017.433037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMj-0001qZ-D0; Mon, 27 Dec 2021 15:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252017.433037; Mon, 27 Dec 2021 15:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMj-0001nm-9B; Mon, 27 Dec 2021 15:56:49 +0000
Received: by outflank-mailman (input) for mailman id 252017;
 Mon, 27 Dec 2021 15:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jnZ2=RM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1n1sMh-0007zI-48
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 15:56:47 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973dfb0a-672d-11ec-9e60-abaf8a552007;
 Mon, 27 Dec 2021 16:56:46 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1BRFuaGj054512
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 27 Dec 2021 10:56:42 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1BRFuaVn054511;
 Mon, 27 Dec 2021 07:56:36 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 973dfb0a-672d-11ec-9e60-abaf8a552007
Message-Id: <8f95e4a6664a24fd990cbb8162a1855c95cb6b66.1640590794.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1640590794.git.ehem+xen@m5p.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 17 Dec 2020 17:42:42 -0800
Subject: [PATCH 4/5] tools/xl: Merge down debug/dry-run section of
 create_domain()
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

create_domain()'s use of printf_info_sexp() could be merged down to a
single dump_by_config(), do so.  This results in an extra JSON dictionary
in output, but I doubt that is an issue for dry-run or debugging output.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_vmcontrol.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 435155a033..4b95e7e463 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -856,19 +856,7 @@ int create_domain(struct domain_create *dom_info)
 
     if (debug || dom_info->dryrun) {
         FILE *cfg_print_fh = (debug && !dom_info->dryrun) ? stderr : stdout;
-        if (default_output_format == OUTPUT_FORMAT_SXP) {
-            printf_info_sexp(-1, &d_config, cfg_print_fh);
-        } else {
-            char *json = libxl_domain_config_to_json(ctx, &d_config);
-            if (!json) {
-                fprintf(stderr,
-                        "Failed to convert domain configuration to JSON\n");
-                exit(1);
-            }
-            fputs(json, cfg_print_fh);
-            free(json);
-            flush_stream(cfg_print_fh);
-        }
+        dump_by_config(default_output_format, cfg_print_fh, &d_config, -1);
     }
 
 
-- 
2.30.2


