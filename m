Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CD336EA15
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 14:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119951.226792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5Vw-0003q6-UV; Thu, 29 Apr 2021 12:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119951.226792; Thu, 29 Apr 2021 12:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5Vw-0003ph-RA; Thu, 29 Apr 2021 12:11:28 +0000
Received: by outflank-mailman (input) for mailman id 119951;
 Thu, 29 Apr 2021 12:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+wV=J2=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lc5Vu-0003pc-RV
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 12:11:26 +0000
Received: from mx.upb.ro (unknown [141.85.13.200])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec14441a-45b1-4ed4-98a3-d91da804a1ee;
 Thu, 29 Apr 2021 12:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id BCA1AB560111;
 Thu, 29 Apr 2021 15:11:23 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dWKHISy5oTLp; Thu, 29 Apr 2021 15:11:21 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id DB37CB560113;
 Thu, 29 Apr 2021 15:11:21 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UyrHAYFsH8iD; Thu, 29 Apr 2021 15:11:21 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 1BC53B560111;
 Thu, 29 Apr 2021 15:11:21 +0300 (EEST)
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
X-Inumbo-ID: ec14441a-45b1-4ed4-98a3-d91da804a1ee
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ACPI: Fix build error when tboot is disabled
Date: Thu, 29 Apr 2021 15:11:16 +0300
Message-Id: <79df12ade0840338590f440cd064052a961fe23b.1619698239.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When tboot is disabled via menuconfig we get undefined reference error fo=
r
g_tboot_shared. This patch fixes that by disabling the causing source cod=
e
when tboot is disabled.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 xen/arch/x86/acpi/power.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 91a8c4d0bd..29d9775aed 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -407,6 +407,7 @@ static int acpi_get_wake_status(void)
     return val;
 }
=20
+#ifdef CONFIG_TBOOT
 static void tboot_sleep(u8 sleep_state)
 {
     uint32_t shutdown_type;
@@ -451,18 +452,21 @@ static void tboot_sleep(u8 sleep_state)
=20
     tboot_shutdown(shutdown_type);
 }
+#endif
=20
 /* System is really put into sleep state by this stub */
 acpi_status acpi_enter_sleep_state(u8 sleep_state)
 {
     acpi_status status;
=20
+#ifdef CONFIG_TBOOT
     if ( tboot_in_measured_env() )
     {
         tboot_sleep(sleep_state);
         printk(XENLOG_ERR "TBOOT failed entering s3 state\n");
         return_ACPI_STATUS(AE_ERROR);
     }
+#endif
=20
     ACPI_FLUSH_CPU_CACHE();
=20
--=20
2.20.1


