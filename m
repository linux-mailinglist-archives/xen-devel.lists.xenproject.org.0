Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21576519E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571008.893811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXt-0007Z6-V1; Thu, 27 Jul 2023 10:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571008.893811; Thu, 27 Jul 2023 10:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyXt-0007XJ-R1; Thu, 27 Jul 2023 10:48:37 +0000
Received: by outflank-mailman (input) for mailman id 571008;
 Thu, 27 Jul 2023 10:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOyXr-00072A-UA
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:48:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22dfe1fc-2c6b-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:48:35 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 25CF34EE0742;
 Thu, 27 Jul 2023 12:48:34 +0200 (CEST)
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
X-Inumbo-ID: 22dfe1fc-2c6b-11ee-b247-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/4] x86/emulate: move a variable declaration to address MISRA C:2012 Rule 5.3
Date: Thu, 27 Jul 2023 12:48:00 +0200
Message-Id: <bc3a28abf9f00bf67cf5ee64bd89e7d38e321c06.1690449587.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690449587.git.nicola.vetrini@bugseng.com>
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The declaration of local variable 'bytes' in 'hvmemul_rep_stos' causes
the shadowing of the same variable defined in the enclosing scope,
hence the declaration has been moved inside the scope where it's used,
with a different name.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/emulate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 75ee98a73b..0d41928ff3 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2024,15 +2024,15 @@ static int cf_check hvmemul_rep_stos(
 
     switch ( p2mt )
     {
-        unsigned long bytes;
         char *buf;
 
     default:
         /* Allocate temporary buffer. */
         for ( ; ; )
         {
-            bytes = *reps * bytes_per_rep;
-            buf = xmalloc_bytes(bytes);
+            unsigned long bytes_tmp;
+            bytes_tmp = *reps * bytes_per_rep;
+            buf = xmalloc_bytes(bytes_tmp);
             if ( buf || *reps <= 1 )
                 break;
             *reps >>= 1;
-- 
2.34.1


