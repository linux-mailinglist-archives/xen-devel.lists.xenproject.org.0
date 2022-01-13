Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D8548CFDC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 01:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256934.441221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oSD-00011R-At; Thu, 13 Jan 2022 00:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256934.441221; Thu, 13 Jan 2022 00:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oSD-00010E-6F; Thu, 13 Jan 2022 00:59:01 +0000
Received: by outflank-mailman (input) for mailman id 256934;
 Thu, 13 Jan 2022 00:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7oSC-0000Zm-3C
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 00:59:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd58511d-740b-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 01:58:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3343161BC8;
 Thu, 13 Jan 2022 00:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BF1C36AED;
 Thu, 13 Jan 2022 00:58:57 +0000 (UTC)
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
X-Inumbo-ID: fd58511d-740b-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642035537;
	bh=I7Qzw936fQaVQlipdIlxqTlxpstcgdZHzCA+avueHiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEYW2DJyBr5XxJTcrRIxaXLVJhXy12zhMQwI3GZFVjrZIjbboNUw5UcONuENn6wki
	 Cz8uV0n66gslF6z/4UHdgTlXYzmHYEJogxc2XzLcsMi3yE0TJO44pIFka5ggDNmhch
	 sfdIKmnYOgEJwDn8F8jvwyjA/vpHxRjp8y4nPgm/xMJ5fztnq7uWaV4Un/GHsico8x
	 fJP9wL9Nwv7ykhD5IiFuT9NAPCCW1Vk2MmKKtX+7Tj92lSFODbaZSLx8SXJLacHh4T
	 Vw5pl0C0kw5BQGw5ZRqpSsJlhwXHDJIBTcL0mjV4KV9DVgBUK0Aas0zn3VFD0c6fmo
	 BdTCmi36cOB6g==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2 2/5] xen: export get_free_port
Date: Wed, 12 Jan 2022 16:58:52 -0800
Message-Id: <20220113005855.1180101-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

get_free_port will soon be used to allocate the xenstore event channel
for dom0less domains.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/common/event_channel.c | 2 +-
 xen/include/xen/event.h    | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index da88ad141a..5b0bcaaad4 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
     return 0;
 }
 
-static int get_free_port(struct domain *d)
+int get_free_port(struct domain *d)
 {
     int            port;
 
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 21c95e14fd..0b35d9d4d2 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -71,6 +71,9 @@ void evtchn_free(struct domain *d, struct evtchn *chn);
 /* Allocate a specific event channel port. */
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 
+/* Get fix free event channel port */
+int get_free_port(struct domain *d);
+
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
 
-- 
2.25.1


