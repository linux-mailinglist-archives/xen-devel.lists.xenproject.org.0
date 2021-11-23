Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E78645AE10
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 22:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229944.397546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpd1C-0005Ge-70; Tue, 23 Nov 2021 21:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229944.397546; Tue, 23 Nov 2021 21:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpd1C-0005Es-41; Tue, 23 Nov 2021 21:07:58 +0000
Received: by outflank-mailman (input) for mailman id 229944;
 Tue, 23 Nov 2021 21:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mpd1A-0005EW-89
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 21:07:56 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6baa330c-4ca1-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 22:07:54 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6925D6023D;
 Tue, 23 Nov 2021 21:07:51 +0000 (UTC)
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
X-Inumbo-ID: 6baa330c-4ca1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637701671;
	bh=fmNL3u7OnTxHOXgiEAfETI2VUP4gGL2FJ5fr15s9qbA=;
	h=From:To:Cc:Subject:Date:From;
	b=Rxsf9g172XeXrnTMElnISWoUxpvJaJP4/7s1u7MpinNCISK6oeUbHJW/lpgH8JGsB
	 puD4+oFyzmduElLopaiyTeolLisu1Xf48UOOd4Un7crdq7xpFMv57i1F0JviSNa/cZ
	 jcXfA0lzTIp+uyHcrihkikmb99s425RVXRl7DVQhONTi4A8d606fnVMK1Xr1srsjUQ
	 24+5RmfZXbOsHUaWs7Wi/yKoWYF0eePtcIGng1H8cU3Hgm+STQZLefqQwQUOisJ3Ro
	 PVh6ejIW8QkefCdwF19gP37QgiNPsfHFGc7TIbjDvT5LESWy4QMWr6vgzF/whZ+9pK
	 xlFCgZB5syF1Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] xen: detect uninitialized xenbus in xenbus_init
Date: Tue, 23 Nov 2021 13:07:48 -0800
Message-Id: <20211123210748.1910236-1-sstabellini@kernel.org>
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

Also recognize all bits set as an invalid value.

For 32-bit Linux, any pfn above ULONG_MAX would get truncated. Pfns
above ULONG_MAX should never be passed by the Xen tools to HVM guests
anyway, so check for this condition and return early.

Cc: stable@vger.kernel.org
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v4:
- say "all bits set" instead of INVALID_PFN
- improve check

Changes in v3:
- improve in-code comment
- improve check

Changes in v2:
- add check for ULLONG_MAX (unitialized)
- add check for ULONG_MAX #if BITS_PER_LONG == 32 (actual error)
- add pr_err error message

 drivers/xen/xenbus/xenbus_probe.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 94405bb3829e..251b26439733 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -951,6 +951,29 @@ static int __init xenbus_init(void)
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
+		 * Also recognize all bits set as an invalid value.
+		 */
+		if (!v || !~v) {
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


