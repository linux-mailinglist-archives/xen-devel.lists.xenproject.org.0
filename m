Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E754EE56F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297154.506101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JV-0008B8-Q0; Fri, 01 Apr 2022 00:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297154.506101; Fri, 01 Apr 2022 00:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JV-00087o-MB; Fri, 01 Apr 2022 00:38:53 +0000
Received: by outflank-mailman (input) for mailman id 297154;
 Fri, 01 Apr 2022 00:38:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5JU-0007ot-Jc
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:38:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19dab748-b154-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:38:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95DB1617E0;
 Fri,  1 Apr 2022 00:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2444C340EE;
 Fri,  1 Apr 2022 00:38:49 +0000 (UTC)
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
X-Inumbo-ID: 19dab748-b154-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773530;
	bh=oYEfEy8l6U2mW9uUtnlJVJBSNPmHg0BOI3Jqw79zWpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LosAIRx8EKkGN5sN23o9zUGgfNfLlCKnRLhMacfccGCKaVcYxbYN3GzBUtPqO06HB
	 M47J9rOmaxAZVnwTFRwZt5ndc3rvuyZkljYDm3U1FP8VSg3hX3h5rBw9QGQhRgv59y
	 qQx6CSu13szrd64JCj83L/cMIh9tAvcFDMDAElns3ZFUoVg07vCssUeisidAInWzGw
	 1DfyTtKXHlOOqE03tvcjcnwYBeJXkH9nfvIll3vFK7hhhGLj3UphepbwUwd+RXxcxh
	 5hcmYMBAMo3czQM4ujHKzCpftNLgh3tBUXdOv4opoppiSZc6yaFmMKintJDGTarcE4
	 lc1JwRlNvj+DA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 1/9] xen/dt: dt_property_read_string should return -ENODATA on !length
Date: Thu, 31 Mar 2022 17:38:39 -0700
Message-Id: <20220401003847.38393-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

When the length is zero (pp->length == 0), dt_property_read_string
should return -ENODATA, but actually currently returns -EILSEQ because
there is no specific check for lenght == 0.

Add a check now.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/common/device_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 4aae281e89..db67fb5fb4 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -198,7 +198,7 @@ int dt_property_read_string(const struct dt_device_node *np,
 
     if ( !pp )
         return -EINVAL;
-    if ( !pp->value )
+    if ( !pp->value || !pp->length )
         return -ENODATA;
     if ( strnlen(pp->value, pp->length) >= pp->length )
         return -EILSEQ;
-- 
2.25.1


