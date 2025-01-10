Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B80A09BBA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 20:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869975.1281418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWKWP-0005tM-Ah; Fri, 10 Jan 2025 19:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869975.1281418; Fri, 10 Jan 2025 19:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWKWP-0005rD-81; Fri, 10 Jan 2025 19:18:17 +0000
Received: by outflank-mailman (input) for mailman id 869975;
 Fri, 10 Jan 2025 19:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tWKWO-0005r7-2w
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 19:18:16 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a30a35ee-cf87-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 20:18:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BA6B8A42937;
 Fri, 10 Jan 2025 19:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34466C4CED6;
 Fri, 10 Jan 2025 19:18:12 +0000 (UTC)
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
X-Inumbo-ID: a30a35ee-cf87-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736536692;
	bh=P0rrENVupjljQAdNHY5ftg+WiSq/hBYySSWFBTXPMAs=;
	h=Date:From:To:cc:Subject:From;
	b=o+SkMv+WxyG/EEjY+nQRspih85RUi/osrEszU4HxebVOEBYWvT10dBUx2cmnpyvrf
	 PPtM+dTrVBkxBU2Hl7/VMjtFItbLy7KQ4eB+6lWwHewq/JuWF3qaYHdqHWt+x0spXn
	 dv+COtEnpoCfxPUpsbSjGyegBw1B5gatDG/emduwlg54Pn8q0nuhKK19Q4cAQ9S4Jl
	 eAoDcxEgsPXSdCuLrCzf/DtjvWED31YgPfIn7naAdno+wZEfRG6VUHz8dXK3O+6RC4
	 B92Lf0MPiWTpc7s2MBtg0Ku9u1HJHJAvveOYOERFRd1uN6Xr3qAwlLh0yW53VCkXva
	 nQSIpxgYoBMew==
Date: Fri, 10 Jan 2025 11:18:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: linux-kernel@vger.kernel.org
cc: sstabellini@kernel.org, jgross@suse.com, xen-devel@lists.xenproject.org, 
    jbeulich@suse.com
Subject: [PATCH v3] xen: update pvcalls_front_accept prototype
Message-ID: <alpine.DEB.2.22.394.2501101117030.1731534@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

While currently there are no in-tree callers of these functions, it is
best to keep them up-to-date with the latest network API.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
expand commit message
---
 drivers/xen/pvcalls-front.c | 5 +++--
 drivers/xen/pvcalls-front.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

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
-- 
2.25.1


