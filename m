Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53A453E48
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 03:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226591.391597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnAQT-0003N7-Pl; Wed, 17 Nov 2021 02:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226591.391597; Wed, 17 Nov 2021 02:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnAQT-0003L7-ML; Wed, 17 Nov 2021 02:11:53 +0000
Received: by outflank-mailman (input) for mailman id 226591;
 Wed, 17 Nov 2021 02:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4lz=QE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnAQS-0003Kv-5y
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 02:11:52 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7ec6bbb-474b-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 03:11:48 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7572761507;
 Wed, 17 Nov 2021 02:11:47 +0000 (UTC)
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
X-Inumbo-ID: b7ec6bbb-474b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637115107;
	bh=1sJR+x8QSuLwW/kR5p/1Dip3rvuByc6vAKciM3MxL+Q=;
	h=From:To:Cc:Subject:Date:From;
	b=g/XwgabaeLNS1AEjamMRtCcZFcGKZDMcoxKQ3cvC3A22/ImQv7CGvtc0Mbwi6m2sg
	 bGnHNmvAII0X2EyopbfdL9zDsV+ThTWDe94DVWl8N0tapFDZRHdicZj9fz0vsrjj8N
	 VmfvxLWhqkUJ46iL7GYKyKz/i6UnlQg7h+YukiqajqMKhFZvG88mdJLlgx67u2WPzc
	 7HqbDdrzIz6eIctAYlpHZjnbK/qqQZw58tD4eqc7gsCqJoi+Plj2W72D07W6LRtTkz
	 tHmnE7xJk4ZlwPG3Q7f2jvMt5q56osyqq9IUXemY6OKzM1r8Ad9L2KB3aMKPKdPBqR
	 lUJmhzwT0tR0g==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	stable@vger.kernel.org
Subject: [PATCH] xen: detect uninitialized xenbus in xenbus_init
Date: Tue, 16 Nov 2021 18:11:45 -0800
Message-Id: <20211117021145.3105042-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

If the xenstore page hasn't been allocated properly, reading the value
of the related hvm_param (HVM_PARAM_STORE_PFN) won't actually return
error. Instead, it will succeed and return zero.

Instead of attempting to xen_remap a bad guest physical address, detect
this condition and return early.

Note that although a guest physical address of zero for
HVM_PARAM_STORE_PFN is theoretically possible, it is not a good choice
and zero has never been validly used in that capacity.

Cc: stable@vger.kernel.org
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 94405bb3829e..c89de0062399 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -951,6 +951,18 @@ static int __init xenbus_init(void)
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
+		 */
+		if (v == 0) {
+			err = -ENOENT;
+			goto out_error;
+		}
 		xen_store_gfn = (unsigned long)v;
 		xen_store_interface =
 			xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
-- 
2.25.1


