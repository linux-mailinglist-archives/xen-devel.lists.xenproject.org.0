Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6324919845C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzzC-0005x8-EC; Mon, 30 Mar 2020 19:22:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzzA-0005wz-MD
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:12 +0000
X-Inumbo-ID: c0b69ec0-72bb-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0b69ec0-72bb-11ea-b4f4-bc764e2007e4;
 Mon, 30 Mar 2020 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3hOtP/jXPcCtes7l0jKraBeKHXjJ8jvdB/4BpY9Tk4=; b=ry2T9/59Z0GKkxLpHpaoeEFpZ0
 W/D5IRQopyYOy/39rSCrp8OMSUSkzUuStRSJLmY3/wIRPROLW6F8gc8yzkEGzGDlMnUnyZJnhPfmq
 D8DDGOQdd1ehyckpg0i7KGsNQdc0Q0A8EKcifa2mITwySHMMWAMlVIe17piHIdupy7x4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz7-0003l9-Aw; Mon, 30 Mar 2020 19:22:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz7-0007AJ-1R; Mon, 30 Mar 2020 19:22:09 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:51 +0100
Message-Id: <20200330192157.1335-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 2/8] xen/public: sysctl: set_parameter.params
 and debug.keys should be const
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, dfaggioli@suse.com,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The fields set_parameter.params and debug.keys should never be modified
by the hypervisor. So mark them as const.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I am not entirely sure whether we should bump the systcl version for
this change. Any thoughts?
---
 xen/include/public/sysctl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 3d72fab49f..3a08c512e8 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -170,7 +170,7 @@ struct xen_sysctl_getdomaininfolist {
 /* XEN_SYSCTL_debug_keys */
 struct xen_sysctl_debug_keys {
     /* IN variables. */
-    XEN_GUEST_HANDLE_64(char) keys;
+    XEN_GUEST_HANDLE_64(const_char) keys;
     uint32_t nr_keys;
 };
 
@@ -1037,7 +1037,7 @@ struct xen_sysctl_livepatch_op {
  */
 
 struct xen_sysctl_set_parameter {
-    XEN_GUEST_HANDLE_64(char) params;       /* IN: pointer to parameters. */
+    XEN_GUEST_HANDLE_64(const_char) params; /* IN: pointer to parameters. */
     uint16_t size;                          /* IN: size of parameters. */
     uint16_t pad[3];                        /* IN: MUST be zero. */
 };
-- 
2.17.1


