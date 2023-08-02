Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E976D034
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574974.900656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzq-0007N3-2C; Wed, 02 Aug 2023 14:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574974.900656; Wed, 02 Aug 2023 14:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzp-0007J7-Us; Wed, 02 Aug 2023 14:38:41 +0000
Received: by outflank-mailman (input) for mailman id 574974;
 Wed, 02 Aug 2023 14:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzo-0006bO-Px
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45699fe4-3142-11ee-b260-6b7b168915f2;
 Wed, 02 Aug 2023 16:38:39 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 04B374EE0742;
 Wed,  2 Aug 2023 16:38:38 +0200 (CEST)
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
X-Inumbo-ID: 45699fe4-3142-11ee-b260-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 03/11] x86/uaccess: move declarations to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:09 +0200
Message-Id: <6d5e4f307b360393e29641d727ef78b697643f47.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable declarations inside macros {put,get}_unsafe_size are
considered unreachable code, as they appear in a switch statement, before
any clause. They are moved in the enclosing scope to resolve the violation.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/uaccess.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 684fccd95c..a2aaab1e87 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -191,11 +191,12 @@ struct __large_struct { unsigned long buf[100]; };
 
 #define put_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
+    long dummy_;                                                           \
+                                                                           \
     retval = 0;                                                            \
     stac();                                                                \
     switch ( size )                                                        \
     {                                                                      \
-    long dummy_;                                                           \
     case 1:                                                                \
         put_unsafe_asm(x, ptr, grd, retval, "b", "b", "iq", errret);       \
         break;                                                             \
@@ -218,11 +219,12 @@ do {                                                                       \
 
 #define get_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
+    long dummy_;                                                           \
+                                                                           \
     retval = 0;                                                            \
     stac();                                                                \
     switch ( size )                                                        \
     {                                                                      \
-    long dummy_;                                                           \
     case 1: get_unsafe_asm(x, ptr, grd, retval, "b", "=q", errret); break; \
     case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
     case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
-- 
2.34.1


