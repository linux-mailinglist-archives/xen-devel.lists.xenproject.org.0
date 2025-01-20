Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51EBA17512
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 00:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875090.1285411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta1Lk-00043X-2w; Mon, 20 Jan 2025 23:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875090.1285411; Mon, 20 Jan 2025 23:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta1Lj-000423-WD; Mon, 20 Jan 2025 23:38:32 +0000
Received: by outflank-mailman (input) for mailman id 875090;
 Mon, 20 Jan 2025 23:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ta1Li-00041x-Gw
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 23:38:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a59f0e46-d787-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 00:38:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0311B5C4B41;
 Mon, 20 Jan 2025 23:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C64CC4CEDD;
 Mon, 20 Jan 2025 23:38:25 +0000 (UTC)
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
X-Inumbo-ID: a59f0e46-d787-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737416306;
	bh=TW9EPxz+4Go5O6VN3cVzyvM0MaYeMTbTiX7vYd4r3Ac=;
	h=Date:From:To:cc:Subject:From;
	b=pP3zfSwLBIe3m8rfK8nGYTcssAF2ne68X+PlwKUqloDMHVzUvjYzPncryY+/R3fo4
	 OME8FE372qhaUt8+y9zK0ZsEPDqmmwhFCYEjWrCSDhVrHtkf2L+aLthaGUVUZRU7Jk
	 qVOUuoiRbZPYfqhX4Uognbbxiwy64X1Oka/yVIBzpkWG/HsL84PS3YpwzoUMioZks5
	 kW8zKfrV/uXeESbmOX1CqfDl0ZFDRpadPTwf1bTKLQ/Smxw8+jTdoZcIyOPs+P6tyL
	 M0qlH1hOrONTP/7sXXDY/9qnNj7EDKmW5YI4p01w1t473FbsUP3s3/LnPqlOYzaDG1
	 FPmLLi0IseJ+Q==
Date: Mon, 20 Jan 2025 15:38:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: linux-kernel@vger.kernel.org
cc: sstabellini@kernel.org, jgross@suse.com, xen-devel@lists.xenproject.org, 
    jbeulich@suse.com
Subject: [PATCH v4] xen: update pvcalls_front_accept prototype
Message-ID: <alpine.DEB.2.22.394.2501201537560.11086@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

While currently there are no in-tree callers of these functions, it is
best to keep them up-to-date with the latest network API.

In addition, add the missing EXPORT_SYMBOL_GPL to the functions listed
in pvcalls-front.h.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v4:
- add the missing EXPORT_SYMBOL_GPL

Changes in v3:
- expand commit message
---
 drivers/xen/pvcalls-front.c | 14 ++++++++++++--
 drivers/xen/pvcalls-front.h |  2 +-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index b72ee9379d77..4926d4badc57 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -341,6 +341,7 @@ int pvcalls_front_socket(struct socket *sock)
 	pvcalls_exit();
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_socket);
 
 static void free_active_ring(struct sock_mapping *map)
 {
@@ -486,6 +487,7 @@ int pvcalls_front_connect(struct socket *sock, struct sockaddr *addr,
 	pvcalls_exit_sock(sock);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_connect);
 
 static int __write_ring(struct pvcalls_data_intf *intf,
 			struct pvcalls_data *data,
@@ -581,6 +583,7 @@ int pvcalls_front_sendmsg(struct socket *sock, struct msghdr *msg,
 	pvcalls_exit_sock(sock);
 	return tot_sent;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_sendmsg);
 
 static int __read_ring(struct pvcalls_data_intf *intf,
 		       struct pvcalls_data *data,
@@ -666,6 +669,7 @@ int pvcalls_front_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	pvcalls_exit_sock(sock);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_recvmsg);
 
 int pvcalls_front_bind(struct socket *sock, struct sockaddr *addr, int addr_len)
 {
@@ -719,6 +723,7 @@ int pvcalls_front_bind(struct socket *sock, struct sockaddr *addr, int addr_len)
 	pvcalls_exit_sock(sock);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_bind);
 
 int pvcalls_front_listen(struct socket *sock, int backlog)
 {
@@ -768,8 +773,10 @@ int pvcalls_front_listen(struct socket *sock, int backlog)
 	pvcalls_exit_sock(sock);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_listen);
 
-int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
+int pvcalls_front_accept(struct socket *sock, struct socket *newsock,
+			 struct proto_accept_arg *arg)
 {
 	struct pvcalls_bedata *bedata;
 	struct sock_mapping *map;
@@ -788,7 +795,7 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
 		return -EINVAL;
 	}
 
-	nonblock = flags & SOCK_NONBLOCK;
+	nonblock = arg->flags & SOCK_NONBLOCK;
 	/*
 	 * Backend only supports 1 inflight accept request, will return
 	 * errors for the others
@@ -904,6 +911,7 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
 	pvcalls_exit_sock(sock);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_accept);
 
 static __poll_t pvcalls_front_poll_passive(struct file *file,
 					       struct pvcalls_bedata *bedata,
@@ -1004,6 +1012,7 @@ __poll_t pvcalls_front_poll(struct file *file, struct socket *sock,
 	pvcalls_exit_sock(sock);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_poll);
 
 int pvcalls_front_release(struct socket *sock)
 {
@@ -1087,6 +1096,7 @@ int pvcalls_front_release(struct socket *sock)
 	pvcalls_exit();
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pvcalls_front_release);
 
 static const struct xenbus_device_id pvcalls_front_ids[] = {
 	{ "pvcalls" },
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
-- 
2.25.1

