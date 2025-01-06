Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C51A0322F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 22:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866023.1277316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUumO-0000Dc-Sb; Mon, 06 Jan 2025 21:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866023.1277316; Mon, 06 Jan 2025 21:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUumO-0000Am-Pm; Mon, 06 Jan 2025 21:36:56 +0000
Received: by outflank-mailman (input) for mailman id 866023;
 Mon, 06 Jan 2025 21:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tUumN-0000Ag-7L
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 21:36:55 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57e8ca60-cc76-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 22:36:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 14027A41EEE;
 Mon,  6 Jan 2025 21:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0582BC4CED2;
 Mon,  6 Jan 2025 21:36:50 +0000 (UTC)
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
X-Inumbo-ID: 57e8ca60-cc76-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736199411;
	bh=9ssZsreN+2+2OYrS7HKzWEcvutpMzydOWq/SoLGM3TQ=;
	h=Date:From:To:cc:Subject:From;
	b=gREIQjFTHAfIPMvHL+Cl6KJpuMdwfnazPGskJv4ThQguibpX+2RJ4Z6RMMPYObjvp
	 +rUv5crmVx19dhNBask9ky9d1Gnq3grHAYuH/kJXcU2HSF6DSRTHBKBfZE9nWCpnvD
	 xOuQ5o8G4zmPgjI82/dTxDyF6FuHLXG1vY8ASnhXZ5vwOPMVFIhm82IOoS5mv8MhxN
	 j6QIZhO9aHrdURVFkx8/nBwDDWyq2rTw9capb56vj6xH7NoJ17ep7umV4/owZdjTim
	 qTBLKEnnf3RWc5KgaHnOuPHSoZXxmwFGAaOs6ZD5HtH/1g+iIu4uPALD6kFwN6t9Ev
	 IETTDROXCiKSw==
Date: Mon, 6 Jan 2025 13:36:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: linux-kernel@vger.kernel.org
cc: sstabellini@kernel.org, jgross@suse.com, xen-devel@lists.xenproject.org
Subject: [PATCH v2] xen: update pvcalls_front_accept prototype
Message-ID: <alpine.DEB.2.22.394.2501061335161.133435@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

xen: update pvcalls_front_accept prototype

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---

Changes in v2:
- also update pvcalls-front.c

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index b72ee9379d77..cab480059731 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -769,7 +769,8 @@ int pvcalls_front_listen(struct socket *sock, int backlog)
 	return ret;
 }
 
-int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
+int pvcalls_front_accept(struct socket *sock, struct socket *newsock,
+			 struct proto_accept_arg *arg)
 {
 	struct pvcalls_bedata *bedata;
 	struct sock_mapping *map;
@@ -788,7 +789,7 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
 		return -EINVAL;
 	}
 
-	nonblock = flags & SOCK_NONBLOCK;
+	nonblock = arg->flags & SOCK_NONBLOCK;
 	/*
 	 * Backend only supports 1 inflight accept request, will return
 	 * errors for the others
diff --git a/drivers/xen/pvcalls-front.h b/drivers/xen/pvcalls-front.h
index f694ad77379f..881ef14660bc 100644
--- a/drivers/xen/pvcalls-front.h
+++ b/drivers/xen/pvcalls-front.h
@@ -12,7 +12,7 @@ int pvcalls_front_bind(struct socket *sock,
 int pvcalls_front_listen(struct socket *sock, int backlog);
 int pvcalls_front_accept(struct socket *sock,
 			 struct socket *newsock,
-			 int flags);
+			 struct proto_accept_arg *arg);
 int pvcalls_front_sendmsg(struct socket *sock,
 			  struct msghdr *msg,
 			  size_t len);

