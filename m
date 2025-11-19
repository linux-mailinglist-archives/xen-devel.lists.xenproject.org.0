Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E0C7156D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 23:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166461.1492995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLqwc-0005vN-GQ; Wed, 19 Nov 2025 22:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166461.1492995; Wed, 19 Nov 2025 22:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLqwc-0005nx-Ba; Wed, 19 Nov 2025 22:46:34 +0000
Received: by outflank-mailman (input) for mailman id 1166461;
 Wed, 19 Nov 2025 22:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3JJ=53=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLqwb-0005mA-47
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 22:46:33 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96a5a95b-c599-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 23:46:30 +0100 (CET)
Received: from BY3PR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:217::14)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 22:46:25 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::bf) by BY3PR04CA0009.outlook.office365.com
 (2603:10b6:a03:217::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 22:46:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 22:46:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 14:46:24 -0800
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 19 Nov 2025 14:46:23 -0800
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
X-Inumbo-ID: 96a5a95b-c599-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1Bzm4mYyRodsEcfMAw3HM9qIRAGE4Ud+s3bGgPiHkaf99SlcVIm92Y6TZrEokNdaGxiOGsK13PPvsUQuTJjgclh548gQPx9RDxHRiKAxfSKXNJuSOeiwF0Ee1n6MyKo9gyBrLdn2/Iv9bgWt6z2qv/gEcl9TIFlJBbG/vovRESVdL0/8/vVqxXmuNi0n2+xrTvzHQsCW1QVCLUO186DCHuW5J/IV+yPY7sCjdZkXa7RGGd20CNEAFkc7yIUp6yPA7mtxc0eN/Cp9U5LB27J/tCsa3bU7XjaxEVzKF8XUFAupOf16edjHZ6qw8GhroUzWWqAxFv2Q/nnEAoJlpIsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mr/274oyZ5Wa2jLCKf2Aq4943b2cFZOS6TfYwrRDfOY=;
 b=bIl9XnUwQrjIJ7wl+y4iHoXwSgh4ggH6mReM+R7ET23xOEp1wDvHNGObm3TwkiUyiCv5QaOS1TspyW0Fn4XvmkaQq2myW2FfUAWsQfBQoLkaJa4y/T0jRj1URjurQYcFP9uWj78jS9A/gpoJopEfwR41qKGS6WyCvi9VT81l+QgrTw50JTREQUyj9eny5X4CharIkv4oCCenVX0XPCo+AvXQS/LdL1sWe4NioQ0v0CfvlyWHSKNgAEXLn3jOUvsgvv1Rxq3alWHfT7w65Q3ZR2ebUVuMTMydw4tzdyStjAjfzsZOwE+sGhuphOvfbZty9NjGRMFvodz8hHsvk/xpJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mr/274oyZ5Wa2jLCKf2Aq4943b2cFZOS6TfYwrRDfOY=;
 b=bDxoAG8hrzJZPESeh629S2jgl6VIEDDSFCA+ya33wVKpGg5lb/vUIxBdHGx48/hVVqL/6gz6BHQgF1h95Azb+4bwZ8a3/sFrEZ1rKGfqOFYP8JC7m8CD23wZkwZmNbDhzXdVvPGBJ6lyJAK6XXwtoURqMMH59lVCUvnLb33UPAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Yann Sionneau <yann.sionneau@vates.tech>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] xenbus: Rename helpers to freeze/thaw/restore
Date: Wed, 19 Nov 2025 17:47:30 -0500
Message-ID: <20251119224731.61497-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119224731.61497-1-jason.andryuk@amd.com>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: d6046ba1-3f0b-4830-0456-08de27bd780b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XL6wnrk6aec0HA5EoxR82vcf0G4qpBk0CwymLfRdCaVngee8TdKTMH5I3vgk?=
 =?us-ascii?Q?rsYSamXvAII/3cwTrMUTml6+l+0uO32INg3veM0zXsiDWNRylALlw14IkTso?=
 =?us-ascii?Q?sX6tv6LDHhBwL7bor+00womrEydltyPaiLCzdJGInsMOPnEW+LY+jX/tGa0X?=
 =?us-ascii?Q?AmparFlYR2xxSgdH3xBE1eoLgH32jNPgYN/K5w/fYCdc4t2I6PFqaanmp4O5?=
 =?us-ascii?Q?Sw+xehItqwsnlsMkYEazoORBu+g3YMOnMJ7GSBwDMy6eNsvg8jIHe8bWAX+v?=
 =?us-ascii?Q?Pd9fCsUaGPOMPXxhlwZARrteXqp28+jMZkmORb8yipaTVPtX/nVvhsuaGzJ5?=
 =?us-ascii?Q?A4+QX3ACskGfM1gQOKR2hNBsWnllWoA4ly7IidiWsgOHI3h6S2EjSYH8h4pt?=
 =?us-ascii?Q?P6JsnRkv2rCH8GSay2ODVOkwXSwXterUsEAKWwrDIpulvqjOjAUPxZmQNIqY?=
 =?us-ascii?Q?WBWg4g3O33py28unfoiCAjH6A/wlc4loRSls0Jjwq7ZFmi38ahoSz/mZ3VHF?=
 =?us-ascii?Q?8ZLMBmeH86j/3YaQoSLHQLX8fsbi/DoEkCf5qPWb6lVUlCKXPNe1aTxZ1j5p?=
 =?us-ascii?Q?fgaKHUVLA8WQuQSEo+kfMwwLHtqvYob7XjfiImmed3qu7rHULiPx2DhPMzSw?=
 =?us-ascii?Q?xmjc7hkyFVMdE6c0rnAUz7O63Aj3gT8hqhPqA6XdYrSvLK9iehuaOvpGDMqL?=
 =?us-ascii?Q?yJiK0kOaxZtvPoCseL2oRV/jXKSaL2NDlEfiOr9m6qk0BGZc9PR1dubADF18?=
 =?us-ascii?Q?CkUx7Tmtbkt7dh24prOKXDp8X/tALBNzvnsyHxRZqcVrgxalGywnDIoGLm1O?=
 =?us-ascii?Q?g5GNd22eOs343l2HxQBG041VH4iHB/rCAYfOy0nFh73oZEgvNjQ9OHfpUeJW?=
 =?us-ascii?Q?V6j/tAefmkfku7jU3N+cgangaO7xK0eebsF3IwQ0A7LvJIWzrjfO9VSEHO6d?=
 =?us-ascii?Q?4fJ+nzpo/ueDKGZyBEQMZ5iYmcSZZziJMUjgEagEezN1zh3OOaZclIc+vJdy?=
 =?us-ascii?Q?1ZxqtP5gQ7qBUR5xCnH9pS6zqf/jb71teWgHgfU1LS53AQz4rlRZwipCt054?=
 =?us-ascii?Q?MJ8ddbEYzJjrADU3A3ZtJr+4uSKhYlr21vnK371WoB5hCW/1pZliG4583I/b?=
 =?us-ascii?Q?utifeQ64ErDNdEmbEm4SXVazT1Nm9O3ZH6U8NCYQVpAuH41GAgIDtgFhz9rK?=
 =?us-ascii?Q?BT3lm/GpstspD/Iw7LRAkVhgEx0P9zsV9KPKzq7192vaqrqopI6AGFFSAF+G?=
 =?us-ascii?Q?6eIOSuHh9iSVJaqkcL6qDhlpqmmHv6M33nMenIzaGZdh3nqDTSZJDLqjLRGB?=
 =?us-ascii?Q?8++0BzBUMecRahYN6xzHhscjqEMLjyAp7dGobwBUUZRnuc4btRZpwu7CRIMt?=
 =?us-ascii?Q?5d8TX9lhhv3wirOiHXffPTfk8XisVYIA30fyQu2EDIOaOY99WyebHpX//8tC?=
 =?us-ascii?Q?c8jvFtdiSw4cfwjgCryzvTaMmndr7orNEEhVnNc5HedRyqdY1akjOdm5d7SU?=
 =?us-ascii?Q?zqZcbcwlAcPTKSP0D1AnXvgYsTmZaiC4X832u7WVZIsg9gMLAmQ6Qo5QHaYJ?=
 =?us-ascii?Q?SCSm1U9505p6gL8VHcw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 22:46:24.8152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6046ba1-3f0b-4830-0456-08de27bd780b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461

Rename the xenbus helpers called from the .freeze, .thaw, and .restore
pm ops to have matching names.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
We could continue renaming and change struct xenbus_driver
.suspend/.resume to .freeze/.restore.  Thereis only the single callback,
and it would be more churn, so I did not do it.
---
 drivers/xen/xenbus/xenbus.h                |  6 +++---
 drivers/xen/xenbus/xenbus_probe.c          | 22 +++++++++++-----------
 drivers/xen/xenbus/xenbus_probe_frontend.c | 16 ++++++++--------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
index 9ac0427724a3..daba7f5e05c4 100644
--- a/drivers/xen/xenbus/xenbus.h
+++ b/drivers/xen/xenbus/xenbus.h
@@ -120,9 +120,9 @@ int xenbus_probe_devices(struct xen_bus_type *bus);
 
 void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
 
-int xenbus_dev_suspend(struct device *dev);
-int xenbus_dev_resume(struct device *dev);
-int xenbus_dev_cancel(struct device *dev);
+int xenbus_dev_freeze(struct device *dev);
+int xenbus_dev_restore(struct device *dev);
+int xenbus_dev_thaw(struct device *dev);
 
 void xenbus_otherend_changed(struct xenbus_watch *watch,
 			     const char *path, const char *token,
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 86fe6e779056..9f9011cd7447 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -668,7 +668,7 @@ void xenbus_dev_changed(const char *node, struct xen_bus_type *bus)
 }
 EXPORT_SYMBOL_GPL(xenbus_dev_changed);
 
-int xenbus_dev_suspend(struct device *dev)
+int xenbus_dev_freeze(struct device *dev)
 {
 	int err = 0;
 	struct xenbus_driver *drv;
@@ -683,12 +683,12 @@ int xenbus_dev_suspend(struct device *dev)
 	if (drv->suspend)
 		err = drv->suspend(xdev);
 	if (err)
-		dev_warn(dev, "suspend failed: %i\n", err);
+		dev_warn(dev, "freeze failed: %i\n", err);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(xenbus_dev_suspend);
+EXPORT_SYMBOL_GPL(xenbus_dev_freeze);
 
-int xenbus_dev_resume(struct device *dev)
+int xenbus_dev_restore(struct device *dev)
 {
 	int err;
 	struct xenbus_driver *drv;
@@ -702,7 +702,7 @@ int xenbus_dev_resume(struct device *dev)
 	drv = to_xenbus_driver(dev->driver);
 	err = talk_to_otherend(xdev);
 	if (err) {
-		dev_warn(dev, "resume (talk_to_otherend) failed: %i\n", err);
+		dev_warn(dev, "restore (talk_to_otherend) failed: %i\n", err);
 		return err;
 	}
 
@@ -711,28 +711,28 @@ int xenbus_dev_resume(struct device *dev)
 	if (drv->resume) {
 		err = drv->resume(xdev);
 		if (err) {
-			dev_warn(dev, "resume failed: %i\n", err);
+			dev_warn(dev, "restore failed: %i\n", err);
 			return err;
 		}
 	}
 
 	err = watch_otherend(xdev);
 	if (err) {
-		dev_warn(dev, "resume (watch_otherend) failed: %d\n", err);
+		dev_warn(dev, "restore (watch_otherend) failed: %d\n", err);
 		return err;
 	}
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(xenbus_dev_resume);
+EXPORT_SYMBOL_GPL(xenbus_dev_restore);
 
-int xenbus_dev_cancel(struct device *dev)
+int xenbus_dev_thaw(struct device *dev)
 {
 	/* Do nothing */
-	DPRINTK("cancel");
+	DPRINTK("thaw");
 	return 0;
 }
-EXPORT_SYMBOL_GPL(xenbus_dev_cancel);
+EXPORT_SYMBOL_GPL(xenbus_dev_thaw);
 
 /* A flag to determine if xenstored is 'ready' (i.e. has started) */
 int xenstored_ready;
diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index 199917b6f77c..f04707d1f667 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -91,14 +91,14 @@ static void backend_changed(struct xenbus_watch *watch,
 	xenbus_otherend_changed(watch, path, token, 1);
 }
 
-static void xenbus_frontend_delayed_resume(struct work_struct *w)
+static void xenbus_frontend_delayed_restore(struct work_struct *w)
 {
 	struct xenbus_device *xdev = container_of(w, struct xenbus_device, work);
 
-	xenbus_dev_resume(&xdev->dev);
+	xenbus_dev_restore(&xdev->dev);
 }
 
-static int xenbus_frontend_dev_resume(struct device *dev)
+static int xenbus_frontend_dev_restore(struct device *dev)
 {
 	/*
 	 * If xenstored is running in this domain, we cannot access the backend
@@ -112,14 +112,14 @@ static int xenbus_frontend_dev_resume(struct device *dev)
 		return 0;
 	}
 
-	return xenbus_dev_resume(dev);
+	return xenbus_dev_restore(dev);
 }
 
 static int xenbus_frontend_dev_probe(struct device *dev)
 {
 	if (xen_store_domain_type == XS_LOCAL) {
 		struct xenbus_device *xdev = to_xenbus_device(dev);
-		INIT_WORK(&xdev->work, xenbus_frontend_delayed_resume);
+		INIT_WORK(&xdev->work, xenbus_frontend_delayed_restore);
 	}
 
 	return xenbus_dev_probe(dev);
@@ -148,9 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct device *_dev)
 }
 
 static const struct dev_pm_ops xenbus_pm_ops = {
-	.freeze		= xenbus_dev_suspend,
-	.thaw		= xenbus_dev_cancel,
-	.restore	= xenbus_frontend_dev_resume,
+	.freeze		= xenbus_dev_freeze,
+	.thaw		= xenbus_dev_thaw,
+	.restore	= xenbus_frontend_dev_restore,
 };
 
 static struct xen_bus_type xenbus_frontend = {
-- 
2.34.1


