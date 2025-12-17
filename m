Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D91CC90C7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 18:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189050.1510013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVvIf-0001a8-CZ; Wed, 17 Dec 2025 17:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189050.1510013; Wed, 17 Dec 2025 17:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVvIf-0001Yh-9K; Wed, 17 Dec 2025 17:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1189050;
 Wed, 17 Dec 2025 17:26:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vVvId-0001YZ-SW
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 17:26:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vVvId-00EUBg-1T;
 Wed, 17 Dec 2025 17:26:55 +0000
Received: from [2a01:cb15:80df:da00:10d0:b82f:72a2:ac5] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vVvId-00HRoz-1K;
 Wed, 17 Dec 2025 17:26:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From;
	bh=YKdZa4AhBMkMvm8eLm3m23ulduyONKMMUSpHwWVJzUI=; b=NjBs9XftDBmTrmxwmPzNSDaFNc
	YlmU01SNv0LQFJSJFJ5BvEk1rwDHXFq65KkeOy/1Yx3PVrOH1K+TOS26rDQo8hg9nK6BoUvBpvZVq
	vHSElSq0g5jiOOUF93B5Ur7wUW3kNqdnNJJPUseaPoZDwQf5+liwJou8e8t/fe+xBxmY=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN PATCH] tools/xl: Fix when config "cpus" is set, but "vcpus" is missing
Date: Wed, 17 Dec 2025 18:26:33 +0100
Message-ID: <20251217172634.47487-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

If we start a guest with 'cpus="all"' and without 'vcpus' or
'maxvcpus' (or sets them to 0), we execute parse_vcpu_affinity() with
`num_cpus=0`. This malloc "b_info->vcpu_hard_affinity" with a buffer
of size 0, which is implementation defined, and we still initialise
the "first" bitmap of this allocation, which mean we have a buffer
overflow.

On Alpine Linux, this result in a segv when the buffer is being
disposed of.

Since libxl will assume there's at least 1 vcpu, we default to 1 in
xl as well. (libxl sets max_vcpus to 1 if unset, and allocate
avail_vcpus if its size is 0.)

Link: https://gitlab.alpinelinux.org/alpine/aports/-/issues/17809
Fixes: a5dbdcf6743a ("libxl/xl: push VCPU affinity pinning down to libxl")
Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    The fixes tag is approximate, it looks like before that commit, having
    max_cpus=0 was ok, I mean no buffer overflow, but still malloc(0).

 tools/xl/xl_parse.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index af86d3186d..1a2ea8b5d5 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1518,14 +1518,22 @@ void parse_config_data(const char *config_source,
 
     if (!xlu_cfg_get_long (config, "vcpus", &l, 0)) {
         vcpus = l;
-        if (libxl_cpu_bitmap_alloc(ctx, &b_info->avail_vcpus, l)) {
-            fprintf(stderr, "Unable to allocate cpumap\n");
-            exit(1);
-        }
-        libxl_bitmap_set_none(&b_info->avail_vcpus);
-        while (l-- > 0)
-            libxl_bitmap_set((&b_info->avail_vcpus), l);
     }
+    if (vcpus < 1) {
+        /*
+         * Default to 1 vCPU, libxl is already assuming this
+         * when vcpus == 0 and parse_vcpu_affinity() also assume there's at
+         * least one vcpu.
+         */
+        vcpus = 1;
+    }
+    if (libxl_cpu_bitmap_alloc(ctx, &b_info->avail_vcpus, vcpus)) {
+        fprintf(stderr, "Unable to allocate cpumap\n");
+        exit(1);
+    }
+    libxl_bitmap_set_none(&b_info->avail_vcpus);
+    for (long vcpu = vcpus; vcpu-- > 0;)
+        libxl_bitmap_set((&b_info->avail_vcpus), vcpu);
 
     if (!xlu_cfg_get_long (config, "maxvcpus", &l, 0))
         b_info->max_vcpus = l;
-- 
Anthony PERARD


