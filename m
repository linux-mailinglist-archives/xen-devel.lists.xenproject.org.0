Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA0451779
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 23:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226044.390512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmkRh-0003p1-VE; Mon, 15 Nov 2021 22:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226044.390512; Mon, 15 Nov 2021 22:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmkRh-0003lb-Rw; Mon, 15 Nov 2021 22:27:25 +0000
Received: by outflank-mailman (input) for mailman id 226044;
 Mon, 15 Nov 2021 22:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9Y9=QC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mmkRg-0003lT-J7
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 22:27:24 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a3e441-4663-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 23:27:23 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E25361B4C;
 Mon, 15 Nov 2021 22:27:21 +0000 (UTC)
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
X-Inumbo-ID: 33a3e441-4663-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637015242;
	bh=X4nf6zOoRNxUt/0DyKF3TZAqtdB9crSvaHwx2vHHoeg=;
	h=From:To:Cc:Subject:Date:From;
	b=pd4lBh9Jlq3BumV0u9ymaqhndjHBORLGS5XL4sE8bdkXdYujxQz0W1Cp7IeDY5kW5
	 j5bMrtjcNWiv00YhWPq7TQt2KUTcFj0DdoN/1fyqXxYlXXJAVobITAlE4vRaZvI4YY
	 5YsOA8z1+VgZPrJqFkyS6RIxbtCeV8hrr8mmaz8+xLCudLguch2u23Dyeq5lXDE2rK
	 JMLFNC9OawT+tuj14ujpzjU0czDvKd18Gt6qZT/+wSjZ/9AGj0zx8c7Rl1mA2Vzjji
	 6QBl0Tb515an6Ecu2B9EdVaxgZiCzdoDmrO6q5c2CTXNx2WrEYKFE8Q+pSDQIdn8Tq
	 VzzkvMiNvMAYw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Stable@vger.kernel.org,
	jbeulich@suse.com
Subject: [PATCH v2] xen: don't continue xenstore initialization in case of errors
Date: Mon, 15 Nov 2021 14:27:19 -0800
Message-Id: <20211115222719.2558207-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

In case of errors in xenbus_init (e.g. missing xen_store_gfn parameter),
we goto out_error but we forget to reset xen_store_domain_type to
XS_UNKNOWN. As a consequence xenbus_probe_initcall and other initcalls
will still try to initialize xenstore resulting into a crash at boot.

[    2.479830] Call trace:
[    2.482314]  xb_init_comms+0x18/0x150
[    2.486354]  xs_init+0x34/0x138
[    2.489786]  xenbus_probe+0x4c/0x70
[    2.498432]  xenbus_probe_initcall+0x2c/0x7c
[    2.503944]  do_one_initcall+0x54/0x1b8
[    2.507358]  kernel_init_freeable+0x1ac/0x210
[    2.511617]  kernel_init+0x28/0x130
[    2.516112]  ret_from_fork+0x10/0x20

Cc: <Stable@vger.kernel.org>
Cc: jbeulich@suse.com
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- use return 0 for the success case
- remove err initializer as it is not useful any longer
---
 drivers/xen/xenbus/xenbus_probe.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index bd003ca8acbe..5967aa937255 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -909,7 +909,7 @@ static struct notifier_block xenbus_resume_nb = {
 
 static int __init xenbus_init(void)
 {
-	int err = 0;
+	int err;
 	uint64_t v = 0;
 	xen_store_domain_type = XS_UNKNOWN;
 
@@ -983,8 +983,10 @@ static int __init xenbus_init(void)
 	 */
 	proc_create_mount_point("xen");
 #endif
+	return 0;
 
 out_error:
+	xen_store_domain_type = XS_UNKNOWN;
 	return err;
 }
 
-- 
2.25.1


