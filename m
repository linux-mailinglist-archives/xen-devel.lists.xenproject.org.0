Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2374EE574
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297157.506125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JZ-0000HY-7r; Fri, 01 Apr 2022 00:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297157.506125; Fri, 01 Apr 2022 00:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JY-0000Aw-Ua; Fri, 01 Apr 2022 00:38:56 +0000
Received: by outflank-mailman (input) for mailman id 297157;
 Fri, 01 Apr 2022 00:38:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5JW-0007ot-Jz
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:38:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b095c28-b154-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:38:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CEC9DB822B6;
 Fri,  1 Apr 2022 00:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27851C34111;
 Fri,  1 Apr 2022 00:38:51 +0000 (UTC)
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
X-Inumbo-ID: 1b095c28-b154-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773531;
	bh=I6q904V+oM8H31/r5qy2ckfV9oZRtQr/EXcn4FzU6PE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ONe7h6hEItE8BISUA855nbRyVlJGnEeOXzJPNEFJTGb6iRgBzjRzDd45bUkgXdk0U
	 ARH7PGJRRBM82+ziePeNFPhBanYNmyHDK6xwcPL6/DEEykRi9w/re8qLY0zb6M6Gw9
	 ZhhUeA802QTFvmYMpD0fjTOtYQD2KynMj+fnCezJN/1YlTAnODsp+rUlZQs7BHPZXn
	 duwBvStInn9OoP/pboY5bWf5sUtcKnQQrtTRP3yjxcYIcfPiFEVFrfk96nxb814hQ6
	 st3z7c/mZ1I4w/Q9r2nxMWX/kT07Ld1olEunc5zbGY2/wgwDU5voVMdN1C7oVGJvI5
	 9lSEszHas/9/Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 4/9] xen: export evtchn_alloc_unbound
Date: Thu, 31 Mar 2022 17:38:42 -0700
Message-Id: <20220401003847.38393-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

It will be used during dom0less domains construction.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/common/event_channel.c | 2 +-
 xen/include/xen/event.h    | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index ffb042a241..2f6a89f52d 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -289,7 +289,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
     xsm_evtchn_close_post(chn);
 }
 
-static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 {
     struct evtchn *chn;
     struct domain *d;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 21c95e14fd..987e88623a 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -71,6 +71,9 @@ void evtchn_free(struct domain *d, struct evtchn *chn);
 /* Allocate a specific event channel port. */
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 
+/* Allocate a new event channel */
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc);
+
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
 
-- 
2.25.1


