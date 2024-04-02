Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C5F894C99
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700002.1092520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVP-0005Hm-FZ; Tue, 02 Apr 2024 07:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700002.1092520; Tue, 02 Apr 2024 07:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVP-0005Cf-A9; Tue, 02 Apr 2024 07:24:27 +0000
Received: by outflank-mailman (input) for mailman id 700002;
 Tue, 02 Apr 2024 07:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrYVM-0003jD-MO
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06b4bb90-f0c2-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 09:24:22 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id DEF644EE073F;
 Tue,  2 Apr 2024 09:24:21 +0200 (CEST)
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
X-Inumbo-ID: 06b4bb90-f0c2-11ee-afe5-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [XEN PATCH 6/7] xen/vm-event: address a violation of MISRA C:2012 Rule 16.3
Date: Tue,  2 Apr 2024 09:22:09 +0200
Message-Id: <fcf24478d1f56c6159489fe65f8b8be2c07beab3.1712042178.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712042178.git.federico.serafini@bugseng.com>
References: <cover.1712042178.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add break statement to address a violation of MISRA C:2012 Rule 16.3
("An unconditional `break' statement shall terminate every
switch-clause ").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/vm_event.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index ecf49c38a9..fbf1aa0848 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -770,6 +770,7 @@ int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
 
     default:
         rc = -ENOSYS;
+        break;
     }
 
     return rc;
-- 
2.34.1


