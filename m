Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140132B9581
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 15:52:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30858.61029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflIM-0005Sr-Kx; Thu, 19 Nov 2020 14:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30858.61029; Thu, 19 Nov 2020 14:52:22 +0000
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
	id 1kflIM-0005SS-Hr; Thu, 19 Nov 2020 14:52:22 +0000
Received: by outflank-mailman (input) for mailman id 30858;
 Thu, 19 Nov 2020 14:52:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kflIL-0005SN-2a
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 14:52:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kflIJ-0005st-5I; Thu, 19 Nov 2020 14:52:19 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kflII-00039y-RC; Thu, 19 Nov 2020 14:52:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kflIL-0005SN-2a
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 14:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=VezKhLTcskDqjf5vN3pACojitNeVXOtWXoGo9wlVx5c=; b=hsqdXZaKgU+knug2crcBbr40TO
	TBzlwjmquQBv/36tjN8I6IzQxRbv/RH15d1raerlWXAaiaiK9WhKHMCqi/KJJuJoEMEYiJcH+uvNS
	a+KfOPwT05QZOE+bpKD5kRAe0k/zofQG6wzoG9fUC3joVEc+iuVUw2CsGOvkKwvE1epE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kflIJ-0005st-5I; Thu, 19 Nov 2020 14:52:19 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kflII-00039y-RC; Thu, 19 Nov 2020 14:52:19 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
Date: Thu, 19 Nov 2020 14:52:16 +0000
Message-Id: <20201119145216.29280-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

When booting Xen with CONFIG_USBAN=y on Sandy Bridge, UBSAN will throw
the following splat:

(XEN) ================================================================================
(XEN) UBSAN: Undefined behaviour in quirks.c:449:63
(XEN) left shift of 1 by 31 places cannot be represented in type 'int'
(XEN) ----[ Xen-4.11.4  x86_64  debug=y   Not tainted ]----

[...]

(XEN) Xen call trace:
(XEN)    [<ffff82d0802c0ccc>] ubsan.c#ubsan_epilogue+0xa/0xad
(XEN)    [<ffff82d0802c16c9>] __ubsan_handle_shift_out_of_bounds+0xb4/0x145
(XEN)    [<ffff82d0802eeecd>] pci_vtd_quirk+0x3d3/0x74f
(XEN)    [<ffff82d0802e508b>] iommu.c#domain_context_mapping+0x45b/0x46f
(XEN)    [<ffff82d08053f39e>] iommu.c#setup_hwdom_device+0x22/0x3a
(XEN)    [<ffff82d08053dfbc>] pci.c#setup_one_hwdom_device+0x8c/0x124
(XEN)    [<ffff82d08053e302>] pci.c#_setup_hwdom_pci_devices+0xbb/0x2f7
(XEN)    [<ffff82d0802da5b7>] pci.c#pci_segments_iterate+0x4c/0x8c
(XEN)    [<ffff82d08053e8bd>] setup_hwdom_pci_devices+0x25/0x2c
(XEN)    [<ffff82d08053e916>] iommu.c#intel_iommu_hwdom_init+0x52/0x2f3
(XEN)    [<ffff82d08053d6da>] iommu_hwdom_init+0x4e/0xa4
(XEN)    [<ffff82d080577f32>] dom0_construct_pv+0x23c8/0x2476
(XEN)    [<ffff82d08057cb50>] construct_dom0+0x6c/0xa3
(XEN)    [<ffff82d080564822>] __start_xen+0x4651/0x4b55
(XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x55

Note that splat is from 4.11.4 and not staging. Although, the problem is
still present.

This can be solved by making the first operand unsigned int.

Signed-off-by: Julien Grall <jgrall@amazon.com>

CR: https://code.amazon.com/reviews/CR-38873112
---
 xen/drivers/passthrough/vtd/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index a8330f17bc0c..8a81d9c9308b 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -435,7 +435,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
     case 0x3728: /* Xeon C5500/C3500 (JasperForest) */
     case 0x3c28: /* Sandybridge */
         val = pci_conf_read32(pdev->sbdf, 0x1AC);
-        pci_conf_write32(pdev->sbdf, 0x1AC, val | (1 << 31));
+        pci_conf_write32(pdev->sbdf, 0x1AC, val | (1U << 31));
         printk(XENLOG_INFO "Masked VT-d error signaling on %pp\n", &pdev->sbdf);
         break;
 
-- 
2.17.1


