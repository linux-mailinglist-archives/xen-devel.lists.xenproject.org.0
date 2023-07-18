Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC756757D56
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565237.883218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkgK-0005rO-H8; Tue, 18 Jul 2023 13:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565237.883218; Tue, 18 Jul 2023 13:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkgK-0005pN-Du; Tue, 18 Jul 2023 13:24:00 +0000
Received: by outflank-mailman (input) for mailman id 565237;
 Tue, 18 Jul 2023 13:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLkgJ-0005pF-M0
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:23:59 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 595c706c-256e-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 15:23:57 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E9F215C0116;
 Tue, 18 Jul 2023 09:23:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 18 Jul 2023 09:23:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 09:23:54 -0400 (EDT)
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
X-Inumbo-ID: 595c706c-256e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689686636; x=1689773036; bh=wqxSF6NELZQ636ApwfBDInxaNjov5gTRnkU
	+PJvF+Sk=; b=hygdq87r2Sagevlck8AdxFXSvSsYgueq4HGCz+OJQq8Vk4SjTVt
	uqzUvClF0p5Cm0+Jrm4rfZGzgIMwlPgyZlCRMbdxhaQfB6aN1xMxPqMhOgPWXM7K
	5w0jxtrGIyTGeZ7fFgqjJT2YYOTJyioBKrQYmyeaQjou4seSynSFdoBKIBfTpjrM
	8RQE8FaTobe1KtiyXnUopFEMe3FDGeEPpZHNMhy9NN9lAolD9KpvQB5fQXhN5JnF
	LUcnVKa+EGulDOFVAn59xbrjuv4trlKOlTmGMmlJplMTVTI3q1nAr4RzzfVm5FnH
	5Hu9c/ij8CvKycT/nAJaJ7OzpTZs5V6kdMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689686636; x=1689773036; bh=wqxSF6NELZQ63
	6ApwfBDInxaNjov5gTRnkU+PJvF+Sk=; b=oFduCKpgRZBoEl9rosOi1V/7R2jqG
	Kkc+ko2RKJRwX/zPSGXft5Wxq8/Kbbmqc39wXzAi3VeA5W8OFu0V9FVFMUMiaNQe
	8yEMtHDa1L25s+jQTM8RnncfTH1uWS14Ltggp6ARiJO0z+xEQFsEV1n5/j5Vo/tV
	ccCxup+LBXnfVx51t0rUY4+IxHsh2FIcRZ77f2F1c4qeYAaZOlSd0alsaSsMiBEY
	Yy3PA0SaTHo0iwev48yv4q8hi9nhxqwoPLQFGlUQPximS7/BBvQcyOisWEiqWpPY
	/HZNgm7/ZSLd5pBah724fOO3qzoW9Ou3E3G80vo5EVpx7cbUS2NeWtohA==
X-ME-Sender: <xms:bJK2ZJR10Ec7sfKVBnzXhmlvPVv9Qcx25zaVKpg5PY9ieWRMcw1vQw>
    <xme:bJK2ZCwky-EsOJqkmgs18JefvXlENDFZ0FnpoJFCSBz2oMY3EXasZpHs7tJa1ccdB
    t631YswSMGLaXc>
X-ME-Received: <xmr:bJK2ZO1G7h0OSSZed6JrBmpMBllKL87qtDTkKXhPAI4ihdKgkbwuOxJt-LS_j0WbZAKbbRKXyAL1yPQp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepieevhfekveefjedvvdehhfdtudfhieegvdehveeffeet
    heekleejudeuieetudfgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:bJK2ZBCNjP9GQNeqk8yR1xj4fME49Z0dk8JH0glNSaLwgzC8dEc6Ig>
    <xmx:bJK2ZCg0mDz4Gux5hEN_FzJzmQtx-HBBy3BpzM_E3J8-7XGjycoeQw>
    <xmx:bJK2ZFrBcNHYIlqWUMluvFMbLV_2sB6m6-H9xh5mI0CmJH_zxVU3eQ>
    <xmx:bJK2ZKeSFogpVlxRArSUtg3jQRTguV3XARabx_6Nx_j5T111EiqlUQ>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder Lake
Date: Tue, 18 Jul 2023 15:23:34 +0200
Message-Id: <20230718132334.2087-1-simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 xen/arch/x86/acpi/cpu_idle.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 557bc6ef86..a6d3175156 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -155,6 +155,12 @@ static void cf_check do_get_hw_residencies(void *arg)
 
     switch ( c->x86_model )
     {
+    /* Tiger Lake */
+    case 0x8C:
+    case 0x8D:
+    /* Alder Lake */
+    case 0x97:
+    case 0x9A:
     /* 4th generation Intel Core (Haswell) */
     case 0x45:
         GET_PC8_RES(hw_res->pc8);
@@ -185,9 +191,6 @@ static void cf_check do_get_hw_residencies(void *arg)
     case 0x6C:
     case 0x7D:
     case 0x7E:
-    /* Tiger Lake */
-    case 0x8C:
-    case 0x8D:
     /* Kaby Lake */
     case 0x8E:
     case 0x9E:
-- 
2.40.1


