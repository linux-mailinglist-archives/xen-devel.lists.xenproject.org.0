Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170DC45973D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 23:16:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229093.396489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpHc0-00057o-JX; Mon, 22 Nov 2021 22:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229093.396489; Mon, 22 Nov 2021 22:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpHc0-000562-Fq; Mon, 22 Nov 2021 22:16:32 +0000
Received: by outflank-mailman (input) for mailman id 229093;
 Mon, 22 Nov 2021 22:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+cX=QJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mpHbz-00055w-Rc
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 22:16:31 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7018849-4be1-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 23:16:30 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 222B260FE6;
 Mon, 22 Nov 2021 22:16:28 +0000 (UTC)
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
X-Inumbo-ID: d7018849-4be1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637619388;
	bh=kRlam7odlirF8W9djazKfCVOxAEG58oHirjbOnjelJI=;
	h=From:To:Cc:Subject:Date:From;
	b=oWsu7ISreFyJ3GjFm0Fsgen+xWF1YgeB24eOx63Y8aqGqj187MQBCbgP6l5BuzgBN
	 S5t2SsFvP8EBEm6Az9QyVWAwgOwrtFAMS5AEFNyE/MdDz68XaMfLY4r1UPkPNBWn0w
	 5kJDqgUoJ34/fMJnL6mui6AhttQnqMUeNd0j2C2hU7YPFYXRGaBgdE8SF1QkMymafi
	 U+tvXo1vIkEeU6wCKTK5ew7p3bEesfJTfzvHS6cBlynLJlhQ2eCE9jfdRM0mC4nBvy
	 TZL3SjoPbv86mtVd74JzTFa6TVqhvXLGK5DPZezsynAPvkidaf1YKP1Q5wS2vEScjv
	 R24zmreoizBww==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] xen: detect uninitialized xenbus in xenbus_init
Date: Mon, 22 Nov 2021 14:16:25 -0800
Message-Id: <20211122221625.1473164-1-sstabellini@kernel.org>
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
Changes in v3:
- improve in-code comment
- improve check

Changes in v2:
- add check for ULLONG_MAX (unitialized)
- add check for ULONG_MAX #if BITS_PER_LONG == 32 (actual error)
- add pr_err error message
---
 drivers/xen/xenbus/xenbus_probe.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 94405bb3829e..d3ca57d48a73 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -951,6 +951,30 @@ static int __init xenbus_init(void)
 		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
 		if (err)
 			goto out_error;
+		/*
+		 * Uninitialized hvm_params are zero and return no error.
+		 * Although it is theoretically possible to have
+		 * HVM_PARAM_STORE_PFN set to zero on purpose, in reality it is
+		 * not zero when valid. If zero, it means that Xenstore hasn't
+		 * been properly initialized. Instead of attempting to map a
+		 * wrong guest physical address return error.
+		 *
+		 * Also recognize the invalid value of INVALID_PFN which is
+		 * ULLONG_MAX.
+		 */
+		if (!v || !(v + 1)) {
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


