Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F4B48800B
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254713.436532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv8-0007NF-2K; Sat, 08 Jan 2022 00:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254713.436532; Sat, 08 Jan 2022 00:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv7-0007GB-Q7; Sat, 08 Jan 2022 00:49:21 +0000
Received: by outflank-mailman (input) for mailman id 254713;
 Sat, 08 Jan 2022 00:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zv5-0006ZD-VP
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:49:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cee73143-701c-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 01:49:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 160E96204B;
 Sat,  8 Jan 2022 00:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EA5C36AEB;
 Sat,  8 Jan 2022 00:49:16 +0000 (UTC)
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
X-Inumbo-ID: cee73143-701c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641602956;
	bh=1DYdXK2tClbqaET4zfKHxmO/dU14+PSWtdLzPmYufVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLY7s9g3064cPYrRE0vNzRVXgTryktVR3QLtM4kE3r5euXcsNZ+6hrMLMK3HKx6ZG
	 s32FqQpLcoOFboQTzsT4d90prWOHQmyiFCpz44a+v2N2cztLwc5P20cGSie7sIwH1d
	 o2UQcGFaZ4G1llkvyRymE9gmjmE7w4QiJrTxXTSjYbjfjSqmCGFcl9orQnJ58v1QxF
	 q4s2K4b5RZYwkCdxR2rE4hhYubafK/qe//k3LHBTcTxRJlFFp/Xo8kD53Ri9iBERRc
	 e18UByRzR/lfAFIMS7AC/+/GvEh/SygHmg+g1FViVxIT9kMNSZ9nbSG7kg5KoxXAyU
	 tSH0sDepqMCJA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	wl@xen.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 6/7] xenstored: do_introduce: handle the late_init case
Date: Fri,  7 Jan 2022 16:49:11 -0800
Message-Id: <20220108004912.3820176-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

If the function is called with late_init set then also notify the domain
using the xenstore event channel.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: wl@xen.org
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: julien@xen.org
---
 tools/xenstore/xenstored_domain.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index d03c7d93a9..17b8021ca8 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -429,7 +429,7 @@ static void domain_conn_reset(struct domain *domain)
 
 static struct domain *introduce_domain(const void *ctx,
 				       unsigned int domid,
-				       evtchn_port_t port, bool restore)
+				       evtchn_port_t port, bool restore, bool late_init)
 {
 	struct domain *domain;
 	int rc;
@@ -461,6 +461,9 @@ static struct domain *introduce_domain(const void *ctx,
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
+		if (late_init)
+			xenevtchn_notify(xce_handle, domain->port);
+
 		if (!is_master_domain && !restore)
 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
 				     false, NULL);
@@ -479,9 +482,10 @@ static struct domain *introduce_domain(const void *ctx,
 int do_introduce(struct connection *conn, struct buffered_data *in)
 {
 	struct domain *domain;
-	char *vec[3];
+	char *vec[4];
 	unsigned int domid;
 	evtchn_port_t port;
+	bool late_init;
 
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
 		return EINVAL;
@@ -489,12 +493,13 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 	domid = atoi(vec[0]);
 	/* Ignore the gfn, we don't need it. */
 	port = atoi(vec[2]);
+	late_init = atoi(vec[3]);
 
 	/* Sanity check args. */
 	if (port <= 0)
 		return EINVAL;
 
-	domain = introduce_domain(in, domid, port, false);
+	domain = introduce_domain(in, domid, port, false, late_init);
 	if (!domain)
 		return errno;
 
@@ -723,7 +728,7 @@ void dom0_init(void)
 	if (port == -1)
 		barf_perror("Failed to initialize dom0 port");
 
-	dom0 = introduce_domain(NULL, xenbus_master_domid(), port, false);
+	dom0 = introduce_domain(NULL, xenbus_master_domid(), port, false, false);
 	if (!dom0)
 		barf_perror("Failed to initialize dom0");
 
@@ -1292,7 +1297,7 @@ void read_state_connection(const void *ctx, const void *state)
 #endif
 	} else {
 		domain = introduce_domain(ctx, sc->spec.ring.domid,
-					  sc->spec.ring.evtchn, true);
+					  sc->spec.ring.evtchn, true, false);
 		if (!domain)
 			barf("domain allocation error");
 
-- 
2.25.1


