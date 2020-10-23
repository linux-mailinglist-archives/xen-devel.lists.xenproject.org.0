Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76E297290
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11091.29405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCk-0001xN-Fm; Fri, 23 Oct 2020 15:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11091.29405; Fri, 23 Oct 2020 15:42:10 +0000
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
	id 1kVzCk-0001wf-BM; Fri, 23 Oct 2020 15:42:10 +0000
Received: by outflank-mailman (input) for mailman id 11091;
 Fri, 23 Oct 2020 15:42:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzCj-0001sI-5x
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f66bf689-5611-4936-a33c-af2393b9d86d;
 Fri, 23 Oct 2020 15:42:08 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCh-0006qd-V6; Fri, 23 Oct 2020 15:42:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCh-0007wb-Jh; Fri, 23 Oct 2020 15:42:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzCj-0001sI-5x
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:09 +0000
X-Inumbo-ID: f66bf689-5611-4936-a33c-af2393b9d86d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f66bf689-5611-4936-a33c-af2393b9d86d;
	Fri, 23 Oct 2020 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=e/uuoKFzFJnK8H8UoaneqmSTwLDi27UJbrlnGwgsDCk=; b=qUupofu5KDc3BkRqa8wjSrCme
	VGN/JetlsmJm/XyhwoFx3FKBjMMF4CVaS7qMbX+igDtyJ1/Qtx/smGiIlYso7dVL/ZVnF0FeWaKtk
	hC2+bdOst5Pe6OJRkZu6bcee/6YS/6fwI9wel6b7V32mHs3CUEeY41z1L+nnb4qT0WUfc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCh-0006qd-V6; Fri, 23 Oct 2020 15:42:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCh-0007wb-Jh; Fri, 23 Oct 2020 15:42:07 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	masami.hiramatsu@linaro.org,
	ehem+xen@m5p.com,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v2 3/7] xen/arm: Check if the platform is not using ACPI before initializing Dom0less
Date: Fri, 23 Oct 2020 16:41:52 +0100
Message-Id: <20201023154156.6593-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023154156.6593-1-julien@xen.org>
References: <20201023154156.6593-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Dom0less requires a device-tree. However, since commit 6e3e77120378
"xen/arm: setup: Relocate the Device-Tree later on in the boot", the
device-tree will not get unflatten when using ACPI.

This will lead to a crash during boot.

Given the complexity to setup dom0less with ACPI (for instance how to
assign device?), we should skip any code related to Dom0less when using
ACPI.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
    Changes in v2:
        - Add Rahul's tested-by and reviewed-by
        - Add Stefano's reviewed-by
---
 xen/arch/arm/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index f16b33fa87a2..35e5bee04efa 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -987,7 +987,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     system_state = SYS_STATE_active;
 
-    create_domUs();
+    if ( acpi_disabled )
+        create_domUs();
 
     domain_unpause_by_systemcontroller(dom0);
 
-- 
2.17.1


