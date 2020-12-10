Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E37480147
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 16:57:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252022.433048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMr-0002VS-Np; Mon, 27 Dec 2021 15:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252022.433048; Mon, 27 Dec 2021 15:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMr-0002S4-It; Mon, 27 Dec 2021 15:56:57 +0000
Received: by outflank-mailman (input) for mailman id 252022;
 Mon, 27 Dec 2021 15:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jnZ2=RM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1n1sMq-0000AO-L3
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 15:56:56 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d13fa6c-672d-11ec-bb0b-79c175774b5d;
 Mon, 27 Dec 2021 16:56:55 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1BRFujqi054523
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 27 Dec 2021 10:56:52 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1BRFujIk054522;
 Mon, 27 Dec 2021 07:56:45 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 9d13fa6c-672d-11ec-bb0b-79c175774b5d
Message-Id: <2d1335a4056558d172d9aa3e59982eb761647418.1640590794.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1640590794.git.ehem+xen@m5p.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 10 Dec 2020 15:09:06 -0800
Subject: [PATCH 5/5] tools/xl: Fix potential deallocation bug
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

There is potential for the info and info_free variable's purposes to
diverge.  If info was overwritten with a distinct value, yet info_free
still needed deallocation a bug would occur on this line.  Preemptively
address this issue (making use of divergent info/info_free values is
under consideration).

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 3647468420..938f06f1a8 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -579,7 +579,7 @@ int main_list(int argc, char **argv)
                      info, nb_domain);
 
     if (info_free)
-        libxl_dominfo_list_free(info, nb_domain);
+        libxl_dominfo_list_free(info_free, nb_domain);
 
     libxl_dominfo_dispose(&info_buf);
 
-- 
2.30.2


