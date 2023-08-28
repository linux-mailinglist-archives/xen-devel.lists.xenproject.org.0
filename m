Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A85278B328
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591524.923999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFs-0004iA-F2; Mon, 28 Aug 2023 14:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591524.923999; Mon, 28 Aug 2023 14:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFs-0004XZ-8p; Mon, 28 Aug 2023 14:30:12 +0000
Received: by outflank-mailman (input) for mailman id 591524;
 Mon, 28 Aug 2023 13:20:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacAV-00031h-FS
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:20:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab949e26-45a5-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 15:20:34 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 073734EE0739;
 Mon, 28 Aug 2023 15:20:33 +0200 (CEST)
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
X-Inumbo-ID: ab949e26-45a5-11ee-8783-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 13/13] x86/asm: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:20:10 +0200
Message-Id: <7af1f690e486e2872a645463b4ec9d4b07a6c23a.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amend generation script to address a violation of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

This patch adds a special comment to the beginning of the header
to make it explicit that the file is generated automatically.

The comment is recognized by ECLAIR and will cause the deviation of
the violation.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/tools/compat-xlat-header.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/tools/compat-xlat-header.py b/xen/tools/compat-xlat-header.py
index 2b805b23a8..9e336277ac 100644
--- a/xen/tools/compat-xlat-header.py
+++ b/xen/tools/compat-xlat-header.py
@@ -406,6 +406,8 @@ def main():
             line = line.strip()
             header_tokens += re_tokenazier.split(line)
 
+    print("/* Generated file, do not edit! */")
+
     with open(sys.argv[2]) as compat_list:
         for line in compat_list:
             words = re_tokenazier.split(line, maxsplit=1)
-- 
2.34.1


