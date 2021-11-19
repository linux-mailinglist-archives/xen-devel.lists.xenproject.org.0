Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BE4577BE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 21:30:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228260.394928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moAWN-0004Jy-Uv; Fri, 19 Nov 2021 20:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228260.394928; Fri, 19 Nov 2021 20:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moAWN-0004GU-Rn; Fri, 19 Nov 2021 20:30:07 +0000
Received: by outflank-mailman (input) for mailman id 228260;
 Fri, 19 Nov 2021 20:30:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVl8=QG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1moAWL-00044k-LK
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 20:30:05 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76098ce3-4977-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 21:29:59 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D08761108;
 Fri, 19 Nov 2021 20:29:56 +0000 (UTC)
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
X-Inumbo-ID: 76098ce3-4977-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637353796;
	bh=ToeTFTsoG8RQjmG78bJhuXqP6zSZHWT6qNk31D0MUoU=;
	h=From:To:Cc:Subject:Date:From;
	b=HY0Wc0K3QU2jjN81tsHd7ofj+cn8CV/0zrvORkAufQty7mgSC5HNLx5jH2utPuyqK
	 h1AgZo9MEqDHOPlWQ4Fk0NHudI/ZO67jSVP+0ZeIFY+fvBCdSYLjWyRy/3B4J9/DkO
	 XEldKjW38qyT8TNQiscbakt71vNHJxNaH4jXrGOtkyPEmStyMR0rWKSAUgLM4QwtyN
	 LdaKPCNa4n2T77M0QvxBUu9/5/gk0tS2+tvGwNEQKWIQ7Y2XWFX59lkdTzkO2qJ8vL
	 YbZzsrmxYctOuMNtFhv7qmdcxG/UIR7+AwJQMTL+7ixA1Lb1hDlG+lhL309Lm5rjfA
	 ak/Iv7GH6QuSw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] xen: detect uninitialized xenbus in xenbus_init
Date: Fri, 19 Nov 2021 12:29:51 -0800
Message-Id: <20211119202951.403525-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

If the xenstore page hasn't been allocated properly, reading the value
of the related hvm_param (HVM_PARAM_STORE_PFN) won't actually return
error. Instead, it will succeed and return zero. Instead of attempting
to xen_remap a bad guest physical address, detect this condition and
return early.

Note that although a guest physical address of zero for
HVM_PARAM_STORE_PFN is theoretically possible, it is not a good choice
and zero has never been validly used in that capacity.

Also recognize the invalid value of INVALID_PFN which is ULLONG_MAX.

For 32-bit Linux, any pfn above ULONG_MAX would get truncated. Pfns
above ULONG_MAX should never be passed by the Xen tools to HVM guests
anyway, so check for this condition and return early.

Cc: stable@vger.kernel.org
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- add check for ULLONG_MAX (unitialized)
- add check for ULONG_MAX #if BITS_PER_LONG == 32 (actual error)
- add pr_err error message

 drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 94405bb3829e..c7472ff27a93 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -951,6 +951,20 @@ static int __init xenbus_init(void)
 		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
 		if (err)
 			goto out_error;
+		/* Uninitialized. */
+		if (v == 0 || v == ULLONG_MAX) {
+			err = -ENOENT;
+			goto out_error;
+		}
+		/* Avoid truncation on 32-bit. */
+#if BITS_PER_LONG == 32
+		if (v > ULONG_MAX) {
+			pr_err("%s: cannot handle HVM_PARAM_STORE_PFN=%llx > ULONG_MAX\n",
+			       __func__, v);
+			err = -EINVAL;
+			goto out_error;
+		}
+#endif
 		xen_store_gfn = (unsigned long)v;
 		xen_store_interface =
 			xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
-- 
2.25.1


