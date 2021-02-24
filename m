Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95343243F7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 19:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89479.168578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEzBz-00026P-K8; Wed, 24 Feb 2021 18:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89479.168578; Wed, 24 Feb 2021 18:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEzBz-000260-Gz; Wed, 24 Feb 2021 18:47:23 +0000
Received: by outflank-mailman (input) for mailman id 89479;
 Wed, 24 Feb 2021 18:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AaNv=H2=rjwysocki.net=rjw@srs-us1.protection.inumbo.net>)
 id 1lEzBx-00025v-Iv
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 18:47:21 +0000
Received: from cloudserver094114.home.pl (unknown [79.96.170.134])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c1c6582-fdf3-432f-aec2-0efcf701e3b8;
 Wed, 24 Feb 2021 18:47:19 +0000 (UTC)
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_smtp) via UNIX with SMTP
 (IdeaSmtpServer 0.83.537)
 id f4fe5d91c4c6e91b; Wed, 24 Feb 2021 19:47:17 +0100
Received: from kreacher.localnet (89-64-80-80.dynamic.chello.pl [89.64.80.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by v370.home.net.pl (Postfix) with ESMTPSA id BF1AE661E2A;
 Wed, 24 Feb 2021 19:47:16 +0100 (CET)
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
X-Inumbo-ID: 2c1c6582-fdf3-432f-aec2-0efcf701e3b8
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: [PATCH v1] xen: ACPI: Get rid of ACPICA message printing
Date: Wed, 24 Feb 2021 19:47:15 +0100
Message-ID: <1709720.Zl72FGBfpD@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeejgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkggfgtgesthfuredttddtvdenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpeevudefgfeguedtjedvhfetveegleduveeuvedvjeekleefhfduhfefheekffefveenucfkphepkeelrdeigedrkedtrdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekledrieegrdektddrkedtpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhrtghpthhtoheplhhinhhugidqrggtphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghorhhishdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdp
 rhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-DCC--Metrics: v370.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

The ACPI_DEBUG_PRINT() macro is used in a few places in
xen-acpi-cpuhotplug.c and xen-acpi-memhotplug.c for printing debug
messages, but that is questionable, because that macro belongs to
ACPICA and it should not be used elsewhere.  In addition,
ACPI_DEBUG_PRINT() requires special enabling to allow it to actually
print the message and the _COMPONENT symbol generally needed for
that is not defined in any of the files in question.

For this reason, replace all of the ACPI_DEBUG_PRINT() instances in
the Xen code with acpi_handle_debug() (with the additional benefit
that the source object can be identified more easily after this
change) and drop the ACPI_MODULE_NAME() definitions that are only
used by the ACPICA message printing macros from that code.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/xen/xen-acpi-cpuhotplug.c |   12 +++++-------
 drivers/xen/xen-acpi-memhotplug.c |   16 +++++++---------
 2 files changed, 12 insertions(+), 16 deletions(-)

Index: linux-pm/drivers/xen/xen-acpi-cpuhotplug.c
===================================================================
--- linux-pm.orig/drivers/xen/xen-acpi-cpuhotplug.c
+++ linux-pm/drivers/xen/xen-acpi-cpuhotplug.c
@@ -242,10 +242,10 @@ static void acpi_processor_hotplug_notif
 	switch (event) {
 	case ACPI_NOTIFY_BUS_CHECK:
 	case ACPI_NOTIFY_DEVICE_CHECK:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
+		acpi_handle_debug(handle,
 			"Processor driver received %s event\n",
 			(event == ACPI_NOTIFY_BUS_CHECK) ?
-			"ACPI_NOTIFY_BUS_CHECK" : "ACPI_NOTIFY_DEVICE_CHECK"));
+			"ACPI_NOTIFY_BUS_CHECK" : "ACPI_NOTIFY_DEVICE_CHECK");
 
 		if (!is_processor_present(handle))
 			break;
@@ -269,8 +269,8 @@ static void acpi_processor_hotplug_notif
 		break;
 
 	case ACPI_NOTIFY_EJECT_REQUEST:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-				  "received ACPI_NOTIFY_EJECT_REQUEST\n"));
+		acpi_handle_debug(handle,
+				  "received ACPI_NOTIFY_EJECT_REQUEST\n");
 
 		if (acpi_bus_get_device(handle, &device)) {
 			pr_err(PREFIX "Device don't exist, dropping EJECT\n");
@@ -290,8 +290,7 @@ static void acpi_processor_hotplug_notif
 		break;
 
 	default:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-				  "Unsupported event [0x%x]\n", event));
+		acpi_handle_debug(handle, "Unsupported event [0x%x]\n", event);
 
 		/* non-hotplug event; possibly handled by other handler */
 		goto out;
@@ -440,7 +439,6 @@ static void __exit xen_acpi_processor_ex
 
 module_init(xen_acpi_processor_init);
 module_exit(xen_acpi_processor_exit);
-ACPI_MODULE_NAME("xen-acpi-cpuhotplug");
 MODULE_AUTHOR("Liu Jinsong <jinsong.liu@intel.com>");
 MODULE_DESCRIPTION("Xen Hotplug CPU Driver");
 MODULE_LICENSE("GPL");
Index: linux-pm/drivers/xen/xen-acpi-memhotplug.c
===================================================================
--- linux-pm.orig/drivers/xen/xen-acpi-memhotplug.c
+++ linux-pm/drivers/xen/xen-acpi-memhotplug.c
@@ -227,13 +227,13 @@ static void acpi_memory_device_notify(ac
 
 	switch (event) {
 	case ACPI_NOTIFY_BUS_CHECK:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-			"\nReceived BUS CHECK notification for device\n"));
+		acpi_handle_debug(handle,
+			"Received BUS CHECK notification for device\n");
 		fallthrough;
 	case ACPI_NOTIFY_DEVICE_CHECK:
 		if (event == ACPI_NOTIFY_DEVICE_CHECK)
-			ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-			"\nReceived DEVICE CHECK notification for device\n"));
+			acpi_handle_debug(handle,
+			"Received DEVICE CHECK notification for device\n");
 
 		if (acpi_memory_get_device(handle, &mem_device)) {
 			pr_err(PREFIX "Cannot find driver data\n");
@@ -244,8 +244,8 @@ static void acpi_memory_device_notify(ac
 		break;
 
 	case ACPI_NOTIFY_EJECT_REQUEST:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-			"\nReceived EJECT REQUEST notification for device\n"));
+		acpi_handle_debug(handle,
+			"Received EJECT REQUEST notification for device\n");
 
 		acpi_scan_lock_acquire();
 		if (acpi_bus_get_device(handle, &device)) {
@@ -269,8 +269,7 @@ static void acpi_memory_device_notify(ac
 		break;
 
 	default:
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
-				  "Unsupported event [0x%x]\n", event));
+		acpi_handle_debug(handle, "Unsupported event [0x%x]\n", event);
 		/* non-hotplug event; possibly handled by other handler */
 		return;
 	}
@@ -469,7 +468,6 @@ static void __exit xen_acpi_memory_devic
 
 module_init(xen_acpi_memory_device_init);
 module_exit(xen_acpi_memory_device_exit);
-ACPI_MODULE_NAME("xen-acpi-memhotplug");
 MODULE_AUTHOR("Liu Jinsong <jinsong.liu@intel.com>");
 MODULE_DESCRIPTION("Xen Hotplug Mem Driver");
 MODULE_LICENSE("GPL");




