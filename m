Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MF1A3pNtWmzywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2026 12:58:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EAA28CF6D
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2026 12:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254742.1550341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1Nca-0000oJ-7r; Sat, 14 Mar 2026 11:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254742.1550341; Sat, 14 Mar 2026 11:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1Nca-0000lO-1L; Sat, 14 Mar 2026 11:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1254742;
 Sat, 14 Mar 2026 11:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TBtM=BO=kernel.org=rafael@srs-se1.protection.inumbo.net>)
 id 1w1NcY-0000lI-Nv
 for xen-devel@lists.xenproject.org; Sat, 14 Mar 2026 11:57:30 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9012a89-1f9c-11f1-b164-2bf370ae4941;
 Sat, 14 Mar 2026 12:57:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2171340A8B;
 Sat, 14 Mar 2026 11:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6D2C116C6;
 Sat, 14 Mar 2026 11:57:25 +0000 (UTC)
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
X-Inumbo-ID: f9012a89-1f9c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773489447;
	bh=EsHwFVcOQ4Wxdsc84ge5jVHkcdmVeRF8NmEV5Gg+6aM=;
	h=From:To:Cc:Subject:Date:From;
	b=aW7ABgskz2oAgNzm8fnf8LB55FmzAiNcm0elrONcrIDR65uTXre2ggvfMmsoYUXfh
	 WrGrLkeMycyXDSf9ueVWkC8h6OXcx4Czntq/O4k2TbobKR8YZPCRdtPFkLBNomGyv4
	 C79II8XwT/wG3jjNmwuOrjy1ziw7LfSkffV8Qx4lG/BOcy3FEPwjs7HenWS3BEzCiA
	 th1ddIjewuvG8P8Q4em6kv1XMb+L0MzSHFOaQNrCF5yOeHNXYDFwNFX5tMmosXzPFB
	 MPUjFexIuRqT7WlzAtH2lxSHxWOioGIDhOfpe3uofJr/zVc01uHyS0tRhG5y/Th42N
	 aVBHbjGd5XN2w==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>, xen-devel@lists.xenproject.org
Cc: LKML <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v1] ACPI: PAD: xen: Convert to a platform driver
Date: Sat, 14 Mar 2026 12:57:23 +0100
Message-ID: <8683270.T7Z3S40VBb@rafael.j.wysocki>
Organization: Linux Kernel Development
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.69 / 15.00];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,rafael.j.wysocki:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-acpi@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rafael@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A6EAA28CF6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

In all cases in which a struct acpi_driver is used for binding a driver
to an ACPI device object, a corresponding platform device is created by
the ACPI core and that device is regarded as a proper representation of
underlying hardware.  Accordingly, a struct platform_driver should be
used by driver code to bind to that device.  There are multiple reasons
why drivers should not bind directly to ACPI device objects [1].

Overall, it is better to bind drivers to platform devices than to their
ACPI companions, so convert the Xen ACPI processor aggregator device
(PAD) driver to a platform one.

While this is not expected to alter functionality, it changes sysfs
layout and so it will be visible to user space.

Link: https://lore.kernel.org/all/2396510.ElGaqSPkdT@rafael.j.wysocki/ [1]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---

Note that the original ACPI PAD driver has been a platform driver for
quite some time already.

---
 drivers/xen/xen-acpi-pad.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/xen-acpi-pad.c b/drivers/xen/xen-acpi-pad.c
index ede69a5278d3..75a39862c1df 100644
--- a/drivers/xen/xen-acpi-pad.c
+++ b/drivers/xen/xen-acpi-pad.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/acpi.h>
+#include <linux/platform_device.h>
 #include <xen/xen.h>
 #include <xen/interface/version.h>
 #include <xen/xen-ops.h>
@@ -107,8 +108,9 @@ static void acpi_pad_notify(acpi_handle handle, u32 event,
 	}
 }
 
-static int acpi_pad_add(struct acpi_device *device)
+static int acpi_pad_probe(struct platform_device *pdev)
 {
+	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 	acpi_status status;
 
 	strcpy(acpi_device_name(device), ACPI_PROCESSOR_AGGREGATOR_DEVICE_NAME);
@@ -122,13 +124,13 @@ static int acpi_pad_add(struct acpi_device *device)
 	return 0;
 }
 
-static void acpi_pad_remove(struct acpi_device *device)
+static void acpi_pad_remove(struct platform_device *pdev)
 {
 	mutex_lock(&xen_cpu_lock);
 	xen_acpi_pad_idle_cpus(0);
 	mutex_unlock(&xen_cpu_lock);
 
-	acpi_remove_notify_handler(device->handle,
+	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev),
 		ACPI_DEVICE_NOTIFY, acpi_pad_notify);
 }
 
@@ -137,13 +139,12 @@ static const struct acpi_device_id pad_device_ids[] = {
 	{"", 0},
 };
 
-static struct acpi_driver acpi_pad_driver = {
-	.name = "processor_aggregator",
-	.class = ACPI_PROCESSOR_AGGREGATOR_CLASS,
-	.ids = pad_device_ids,
-	.ops = {
-		.add = acpi_pad_add,
-		.remove = acpi_pad_remove,
+static struct platform_driver acpi_pad_driver = {
+	.probe = acpi_pad_probe,
+	.remove = acpi_pad_remove,
+	.driver = {
+		.name = "acpi_processor_aggregator",
+		.acpi_match_table = pad_device_ids,
 	},
 };
 
@@ -157,6 +158,6 @@ static int __init xen_acpi_pad_init(void)
 	if (!xen_running_on_version_or_later(4, 2))
 		return -ENODEV;
 
-	return acpi_bus_register_driver(&acpi_pad_driver);
+	return platform_driver_register(&acpi_pad_driver);
 }
 subsys_initcall(xen_acpi_pad_init);
-- 
2.51.0





