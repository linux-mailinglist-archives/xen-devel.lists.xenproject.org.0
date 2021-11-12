Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C407E44EED7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 22:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225441.389311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mleOD-0000t9-GY; Fri, 12 Nov 2021 21:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225441.389311; Fri, 12 Nov 2021 21:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mleOD-0000qJ-Cv; Fri, 12 Nov 2021 21:47:17 +0000
Received: by outflank-mailman (input) for mailman id 225441;
 Fri, 12 Nov 2021 21:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3kqX=P7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mleOC-0000qD-Be
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 21:47:16 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18c98a3c-4402-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 22:47:15 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C1EC60EFD;
 Fri, 12 Nov 2021 21:47:13 +0000 (UTC)
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
X-Inumbo-ID: 18c98a3c-4402-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636753633;
	bh=f0st7MUDC/rGEPGAzPZrpsNr1ug4HHv2pbX+/641YvE=;
	h=From:To:Cc:Subject:Date:From;
	b=Z+RkjC+OWbEEAvRu5fd8dDZnWrQyUO0OTfr2nbtJCOpy+rlFxhfO5IwA0hUi4vbwb
	 G+c3QwUx5ZtClmzJSd+U25P1HGv9fwChWyY/2ggywgYKD8NvqfdGD3RAQdR+jlWh8B
	 ez+ntl459C52GTIchiJUN9lNQ71UX4mcpiq4lrzDIdF6iKfjC+KYq+cYa34LiGHF9+
	 VrotP+SK7TmgFNfJg36H3/6uSi8WDu6YX0kGPQPMseTzd9mZ5Ha1hA8HHIXeec+hct
	 PFMnk4bfVR8Uv+twH5nGQDfqOEUJkjxazWLlDxTTyNuKMQpLCKUOWy+CxEeNv2x7nP
	 SAswvbUHwFH1w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Stable@vger.kernel.org
Subject: [PATCH] xen: don't continue xenstore initialization in case of errors
Date: Fri, 12 Nov 2021 13:47:09 -0800
Message-Id: <20211112214709.1763928-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

In case of errors in xenbus_init (e.g. missing xen_store_gfn parameter),
we goto out_error but we forget to reset xen_store_domain_type to
XS_UNKNOWN. As a consequence xenbus_probe_initcall and other initcalls
will still try to initialize xenstore resulting into a crash at boot.

[    2.479830] Call trace:
[    2.482314]  xb_init_comms+0x18/0x150
[    2.486354]  xs_init+0x34/0x138
[    2.489786]  xenbus_probe+0x4c/0x70
[    2.498432]  xenbus_probe_initcall+0x2c/0x7c
[    2.503944]  do_one_initcall+0x54/0x1b8
[    2.507358]  kernel_init_freeable+0x1ac/0x210
[    2.511617]  kernel_init+0x28/0x130
[    2.516112]  ret_from_fork+0x10/0x20

Cc: <Stable@vger.kernel.org>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index bd003ca8acbe..34abf2b5967b 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -983,8 +983,10 @@ static int __init xenbus_init(void)
 	 */
 	proc_create_mount_point("xen");
 #endif
+	return err;
 
 out_error:
+	xen_store_domain_type = XS_UNKNOWN;
 	return err;
 }
 
-- 
2.25.1


