Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D0248304
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7ytH-00067M-Jj; Tue, 18 Aug 2020 10:30:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pr8P=B4=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k7ytF-0005zo-Mw
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:30:49 +0000
X-Inumbo-ID: 9e8c31ba-2ac6-408d-a3f2-7ae4f002bea8
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e8c31ba-2ac6-408d-a3f2-7ae4f002bea8;
 Tue, 18 Aug 2020 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=nABtIpE3ocPIbmrY/Y6TR8lqLGhPX2t/r6AUyXMJ7rQ=; b=IoU2922M7bsU8yeqsYH6tiihY2
 MshAGFNsqPc9jChRx63ddW1Tnzs1arwkJnNJf/hsJPYzd3UfT7dD8BL+cNST851In1hjxrAJPJ/Fm
 FfBQNVMEeuTNM5S1jG/VeVXy+7K3Z2M4gD3+GkSxUqNkRaduD9aUP/K8NUnoH/rp/vgc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7yt9-000145-1w; Tue, 18 Aug 2020 10:30:43 +0000
Received: from host31-48-92-96.range31-48.btcentralplus.com ([31.48.92.96]
 helo=u2f063a87eabd5f.home) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7yt8-0003Rw-Ql; Tue, 18 Aug 2020 10:30:43 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v7 6/9] tools/libxc: split restore handler
 handle_shared_info() functionality
Date: Tue, 18 Aug 2020 11:30:29 +0100
Message-Id: <20200818103032.3050-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200818103032.3050-1-paul@xen.org>
References: <20200818103032.3050-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

The code is invoked when a SHARED_INFO record is processed but actually
performs two functions:

[1] Copy the 'vcpu_info' and 'arch' substructures from the record into the
    new domain's shared_info
[2] Clear out any pending event channel state, mask all channels and also
    clear 'arch.pfn_to_mfn_frame_list_list'

To facilitate deprecation of the SHARED_INFO record in version 4 of the
migration stream, this patch splits the functionality, leaving [1] in
handle_shared_info() and adding update_shared_info() (called from
x86_pv_stream_complete()) to deal with [2].

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>

v7:
 - New in v7
---
 tools/libxc/xc_sr_restore_x86_pv.c | 31 +++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/tools/libxc/xc_sr_restore_x86_pv.c b/tools/libxc/xc_sr_restore_x86_pv.c
index d086271efb..1ed8cc66ca 100644
--- a/tools/libxc/xc_sr_restore_x86_pv.c
+++ b/tools/libxc/xc_sr_restore_x86_pv.c
@@ -880,7 +880,6 @@ static int handle_shared_info(struct xc_sr_context *ctx,
                               struct xc_sr_record *rec)
 {
     xc_interface *xch = ctx->xch;
-    unsigned int i;
     int rc = -1;
     shared_info_any_t *guest_shinfo = NULL;
     const shared_info_any_t *old_shinfo = rec->data;
@@ -911,6 +910,32 @@ static int handle_shared_info(struct xc_sr_context *ctx,
     MEMCPY_FIELD(guest_shinfo, old_shinfo, vcpu_info, ctx->x86.pv.width);
     MEMCPY_FIELD(guest_shinfo, old_shinfo, arch, ctx->x86.pv.width);
 
+    rc = 0;
+
+ err:
+    if ( guest_shinfo )
+        munmap(guest_shinfo, PAGE_SIZE);
+
+    return rc;
+}
+
+static int update_shared_info(struct xc_sr_context *ctx)
+{
+    xc_interface *xch = ctx->xch;
+    unsigned int i;
+    int rc = -1;
+    shared_info_any_t *guest_shinfo = NULL;
+
+    guest_shinfo = xc_map_foreign_range(
+        xch, ctx->domid, PAGE_SIZE, PROT_READ | PROT_WRITE,
+        ctx->dominfo.shared_info_frame);
+    if ( !guest_shinfo )
+    {
+        PERROR("Failed to map Shared Info at mfn %#lx",
+               ctx->dominfo.shared_info_frame);
+        goto err;
+    }
+
     SET_FIELD(guest_shinfo, arch.pfn_to_mfn_frame_list_list,
               0, ctx->x86.pv.width);
 
@@ -1122,6 +1147,10 @@ static int x86_pv_stream_complete(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     int rc;
 
+    rc = update_shared_info(ctx);
+    if ( rc )
+        return rc;
+
     rc = update_vcpu_context(ctx);
     if ( rc )
         return rc;
-- 
2.20.1


