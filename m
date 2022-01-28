Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359714A02DE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 22:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262149.454326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDYrt-0002Ow-Sw; Fri, 28 Jan 2022 21:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262149.454326; Fri, 28 Jan 2022 21:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDYrt-0002K1-IT; Fri, 28 Jan 2022 21:33:17 +0000
Received: by outflank-mailman (input) for mailman id 262149;
 Fri, 28 Jan 2022 21:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDYrr-0001cx-6y
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 21:33:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e61555c2-8081-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 22:33:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C32B7B82712;
 Fri, 28 Jan 2022 21:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A333C340EE;
 Fri, 28 Jan 2022 21:33:12 +0000 (UTC)
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
X-Inumbo-ID: e61555c2-8081-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643405592;
	bh=uo5SD5LknaPvjJ9o9KYAlXFMnGBluvR70SgtsEcJmPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qS5bRtf9dV22ICIT+x5QZ2noHh8He9luIbktKoCmhY5OGZngy+eTM7I49jDQ/13Aw
	 yXcedtKzNAUUf6WosIsKmjXl8mZZtIDpGOBra2mhp6cunv2m58uCxxqCg8rPF42gZ/
	 sUig1fxB3dN3HycV8EfnhlxpUNWL8iaTMUWsNJSSf6fC6eYPAKCzA1W3U+IOR1zEWJ
	 w+XXBEs+MXyZFOSLft9ec/HAMer96h+tGmCNVTouhPrmkoLp0Ea5toXDAzgjcg0ze4
	 iNrV0Tr9ZiROtZis07SaK37Lq7dJXDtOEYT64hxqLI4WSQzMgCsfpf2NU4vEVkVKVh
	 He/BWwNTfYoIw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v3 4/5] xenstored: send an evtchn notification on introduce_domain
Date: Fri, 28 Jan 2022 13:33:05 -0800
Message-Id: <20220128213307.2822078-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When xs_introduce_domain is called, send out a notification on the
xenstore event channel so that any (dom0less) domain waiting for the
xenstore interface to be ready can continue with the initialization.

The extra notification is harmless for domains that don't require it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- drop the new late_init parameter
---
 tools/xenstore/xenstored_domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index d03c7d93a9..7487129e47 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -461,6 +461,9 @@ static struct domain *introduce_domain(const void *ctx,
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
+		/* Notify the domain that xenstore is available */
+		xenevtchn_notify(xce_handle, domain->port);
+
 		if (!is_master_domain && !restore)
 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
 				     false, NULL);
-- 
2.25.1


