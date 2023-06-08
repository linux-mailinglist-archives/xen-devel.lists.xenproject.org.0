Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F572820B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 16:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545301.851660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7GAk-0001f3-IV; Thu, 08 Jun 2023 13:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545301.851660; Thu, 08 Jun 2023 13:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7GAk-0001aS-EW; Thu, 08 Jun 2023 13:59:30 +0000
Received: by outflank-mailman (input) for mailman id 545301;
 Thu, 08 Jun 2023 13:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjZV=B4=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q7GAi-0001YD-9j
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 13:59:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id acdd517b-0604-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 15:59:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F7491042;
 Thu,  8 Jun 2023 07:00:09 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14D2F3F6C4;
 Thu,  8 Jun 2023 06:59:22 -0700 (PDT)
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
X-Inumbo-ID: acdd517b-0604-11ee-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/2] tools/python: Fix memory leak on error path
Date: Thu,  8 Jun 2023 14:59:13 +0100
Message-Id: <20230608135913.560413-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608135913.560413-1-luca.fancellu@arm.com>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 56a7aaa16bfe introduced a memory leak on the error path for a
Py_BuildValue built object that on some newly introduced error path
has not the correct reference count handling, fix that by decrementing
the refcount in these path.

Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/python/xen/lowlevel/xc/xc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index e14e223ec903..d3ea350e07b9 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -919,11 +919,16 @@ static PyObject *pyxc_physinfo(XcObject *self)
         sve_vl_bits = arch_capabilities_arm_sve(pinfo.arch_capabilities);
         py_arm_sve_vl = PyLong_FromUnsignedLong(sve_vl_bits);
 
-        if ( !py_arm_sve_vl )
+        if ( !py_arm_sve_vl ) {
+            Py_DECREF(objret);
             return NULL;
+        }
 
-        if( PyDict_SetItemString(objret, "arm_sve_vl", py_arm_sve_vl) )
+        if( PyDict_SetItemString(objret, "arm_sve_vl", py_arm_sve_vl) ) {
+            Py_DECREF(py_arm_sve_vl);
+            Py_DECREF(objret);
             return NULL;
+        }
     }
 #endif
 
-- 
2.34.1


