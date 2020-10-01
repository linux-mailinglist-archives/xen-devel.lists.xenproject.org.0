Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9027FE97
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 13:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1228.4131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNx0U-0006Sv-D2; Thu, 01 Oct 2020 11:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228.4131; Thu, 01 Oct 2020 11:44:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNx0U-0006SW-9Y; Thu, 01 Oct 2020 11:44:18 +0000
Received: by outflank-mailman (input) for mailman id 1228;
 Thu, 01 Oct 2020 11:44:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNx0S-0006SR-1I
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:44:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d298d769-59a1-48ff-8b23-1550c7644c63;
 Thu, 01 Oct 2020 11:44:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNx0S-0006SR-1I
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:44:16 +0000
X-Inumbo-ID: d298d769-59a1-48ff-8b23-1550c7644c63
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d298d769-59a1-48ff-8b23-1550c7644c63;
	Thu, 01 Oct 2020 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601552655;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tJRjOyj67coC9I1KBFkaDAyK+2JtNm5ot/Bl9MArNYU=;
  b=V8YptN4AKjZump4ntlhmSJwuGESSwLmsN4McI+tvPoU4h0ToCs4WjTIy
   wremLWisit5byV1a6zn4p0b45HtblohcJrN+c8NaY353LAQhRD70hgkWa
   3ZwnV8F9hujVkLfNShzTFvzT2IItKYKopKHWat3+fepq8SWl4KGcOC8kc
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /sz+1GR8BlwRGpqm2nq9eXQ6gZrPBqn/w/JdlMRYO0ty1LGTNKNAR1m2MStChVAupFloO6AA60
 Yggz88sq8W1yJVPl2r5ZwXjyTLWjfPErlzmTKw2hKfkpRiN75xaK9UBAvOQONLpdgpJSkRWddT
 BV8TFzp8U7wswV4WEMRfuWIBpdNf1zwOOHvn2psmK+IoiYwCIiVf/03eT6Ss+JL69X1vk6eezh
 unwtGmr2qBLcs7A0Gb+Y90HUw1VZkxk7dHa5Zoq6XQjdqhNDbm83ji8vZGni4uOcx+xjx27g3V
 XLk=
X-SBRS: None
X-MesageID: 28393153
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28393153"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] xen/domain: check IOMMU options doesn't contain unknown bits set
Date: Thu, 1 Oct 2020 13:44:07 +0200
Message-ID: <20201001114407.44532-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/domain.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8cfa2e0b6b..c4a480fa14 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -310,6 +310,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
+    {
+        dprintk(XENLOG_INFO, "Unknown IOMMU options %#x\n", config->iommu_opts);
+        return -EINVAL;
+    }
+
     if ( !(config->flags & XEN_DOMCTL_CDF_iommu) && config->iommu_opts )
     {
         dprintk(XENLOG_INFO,
-- 
2.28.0


