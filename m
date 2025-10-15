Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C43BE0C1B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 23:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143986.1477545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v98gN-0008Hg-Ap; Wed, 15 Oct 2025 21:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143986.1477545; Wed, 15 Oct 2025 21:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v98gN-0008FN-7y; Wed, 15 Oct 2025 21:05:15 +0000
Received: by outflank-mailman (input) for mailman id 1143986;
 Wed, 15 Oct 2025 21:05:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v98gM-00081U-GL
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 21:05:14 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3949678-aa0a-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 23:05:13 +0200 (CEST)
Received: from BLAPR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:36e::28)
 by PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 21:05:08 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::5f) by BLAPR05CA0013.outlook.office365.com
 (2603:10b6:208:36e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.5 via Frontend Transport; Wed,
 15 Oct 2025 21:05:06 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Wed, 15 Oct 2025 21:05:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 14:05:02 -0700
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 14:05:01 -0700
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
X-Inumbo-ID: a3949678-aa0a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc8GDV/hWjOVa0KuQckPjQXlPEn4RlN0kHqfuF6M4kXuSKyfpHtGOjUGPkDaEcOtfQ5azl+nKHwNPAhkwhVp9Haeb6Bo65Uphmo06iWg3E6GCSjGzma8uZt/soABp5m6dHdDBbkFXd9hFH3SbY1cYSyeRu/FyHCryuq2yISG2f10pyA7g98DGDIQVNwUQO1klH47Wkknu+KxdsJvEb9QWoM61rZbZil+u1JdgraDoGgqS2wZEe4pp+71LS3RdwNMIdghU1BSC++XKdBIpxeMb1zlHnR+fIzU++TiQs6p71gik8SrNE0jBHHUJvmvy7WxcO/wD1hi6D3QtGIIkYJNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaZUyhNxVa7d9OFxTEmdJIOr6CU9ub8d3ETcT6pczTw=;
 b=LlpxIn5PRkDLPdJoGtpDtrqTOKzbue/eWVAFGCyuUfYccSvJTXy9HwMIjYV0aYDoNi/xwmZTOmFu3Hd3ZOG3HAb1E1QHjxSbL/jG2z6fsGjL6CLOS1EUJ4W6WMLDEuhlHP0aiFlAUA5RpbxeX9d+a2qlztiJcGW4jXsxoe1b5A4JYBPtHD/vHAE73UF6brEx9qC85dj355LH8HJZK+RHEd2Jv/q/OU9/mPHQhyChlzdYqI5r00BqnlCUOSFksDHiXX8x3mLJAnO2ZLhxCSeJndz1E5RhqeuQyoAQsdpH4wRi3M6sDq0e7/3WYca4OT0/wDS2ByYVALpiuL6s7hxonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaZUyhNxVa7d9OFxTEmdJIOr6CU9ub8d3ETcT6pczTw=;
 b=P0JpMENNgH5HWfkllvSAlqwLHVEYsU2aM7b0epSBTl/JTBX29eLIn/YV3O+C90TRoXX69Q733zmn5i5zOHrLt0AJeZDnZMOrV6yMMVgk+VbHprJpT4L7uxrp/uO4E5Ai0pqcQ0Rs7MUhif8Kgo37Os2zY6iCu2UPI92QbYpGaX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21 v3 1/2] x86/apic: Avoid infinite loop in io_apic_level_ack_pending()
Date: Wed, 15 Oct 2025 17:04:53 -0400
Message-ID: <20251015210454.95381-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015210454.95381-1-jason.andryuk@amd.com>
References: <20251015210454.95381-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: bff9bea1-a95f-495d-7e94-08de0c2e8564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pkg5LlcuiYYKxdbEH5rjhSsLT68H/+AFCa3t8JLL26D7DQwT2iKFC3XNBYR8?=
 =?us-ascii?Q?58+ImaVVe7u7VnBa41x7yO5lFrj3Dkds+oKQ6was7j40elCK9eihtnf8T8PK?=
 =?us-ascii?Q?pel5S9avSLzXYJuH3kY7/E5F7EH0B81lNywz15Etzj8KpDUH5N4RYxZhdpU+?=
 =?us-ascii?Q?K+Z6erL+ylTBAay5Zu8W8zYmPJ0dVOB/MnMDV/wvI7UtWJERiY1S26XDGpsv?=
 =?us-ascii?Q?3sWgFuB/IqpoVf/ThaLWafWwctR5KNtwSF9zSQvnpjGlN/kNSE4FTI4s+xRv?=
 =?us-ascii?Q?P8/MMjlLCEyQV8kX8iIstYRBJon3kcFyS+B8jixMJq10TmfrwQz7ptxtOEP7?=
 =?us-ascii?Q?316t5Jv5DwFfEeu+hsb+sBw2kLl8x6EOV7AIseqZW2wSD5D8LS+oyBgl+kO9?=
 =?us-ascii?Q?ePi4LKodcKfb4pKE2hifOy3L5Sqm7nY9qeGIxiuIztCOm750tkyHDNGGYV4l?=
 =?us-ascii?Q?nBWJqj+iRBKRM9rXjUeG+mj45Q2TMSpCar8RVSell6KtG0PLHc8vxvrDE384?=
 =?us-ascii?Q?ixqgRP0cmqU0zTvH6SoFmJqtXhxlP+pWxr/93AVqIWj55UB55oVm76F3Mz6o?=
 =?us-ascii?Q?+5K5pvslr66tzEKNYLLShQTfQLz1vWeNQ+SVXObzXa03476i8QPj+1y/hWxL?=
 =?us-ascii?Q?OlkPu5iMPwQatQVqfaOffBR9ezhxubRwR59nMjBQqliYU8QuZ7whm0B3mhLr?=
 =?us-ascii?Q?1EPTqrbpJ0+dkbTs+4zHODdHDWpKIDh99rNKld8727a2VVquA8IkoIlwbfKJ?=
 =?us-ascii?Q?mnmJwffAvOE5wSZDzixyhXJtu3iTFi+iziWH/J69sm6PJtZDO17/wxLpmbwe?=
 =?us-ascii?Q?QMccO7Ax4jAihXYOk7zVyFqXFEnNOkf8xm4yLytuwQNRl5c/TWuH2y2+/KGX?=
 =?us-ascii?Q?ndvNI40DSf0BXP7fRGipsymdMlCw/svdRQ7NzApuQFOhtwriLXztmKuw38fI?=
 =?us-ascii?Q?8WeeJQ59xbcGefA7t57D9R+regdPxFTUFGtlTzYe1BByCuS6B9e8iZ40kUyu?=
 =?us-ascii?Q?H61vDY5ZSU+g6sUTndcuedJrVdq6KkcaPYkXhNLOuLZheRCn09FfzIqTPCRQ?=
 =?us-ascii?Q?6xe6VrdaQ66KY/ZWvKP904PQgy5S4uCtPIG3u7edu+FC5pzUOpxxZI19ldK9?=
 =?us-ascii?Q?OAnhpU66hnz6oOS/kf88KK7/BGmCDgnqHzFRF7oMpUbLzasot9uXG9oyFs+K?=
 =?us-ascii?Q?rMrEVZtJldUuwxfokyt7EZZ0vS6qmjzDM1iGUlIQy2qCpDoFfknTmoemR5cn?=
 =?us-ascii?Q?A/o2i4xTU24iTynLYCelhlYB7Wp2g/NeYII3JxhkNodQOdwCxwQWIadAN7pw?=
 =?us-ascii?Q?Xda+VSdEmH3NyZTlHzVaHCOwz3L+6ld5Y9xDsBn2LqY27ElNuTG2yjnmLU8h?=
 =?us-ascii?Q?JFjOZFZRtFfQ6NRm6DH0sOYEKt1ofi75w5qfP8WKfEMcMQBe2dBOdG9eXNuO?=
 =?us-ascii?Q?bmDnxWNTClz+hB9OY0JThHj06OhJH6vxENohIugxH67b4FAFdKTJPgV1bCz6?=
 =?us-ascii?Q?q0sBPLfWkPci0THny0Ipk+bYQuz25d3PD8fpHJYnxL+AI6kog7+pv+UE2Ed5?=
 =?us-ascii?Q?TMYmxu+K9KVgdwMywyE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 21:05:07.8744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bff9bea1-a95f-495d-7e94-08de0c2e8564
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

io_apic_level_ack_pending() will end up in an infinite loop if
entry->pin == -1.  entry does not change, so it will keep reading -1.

Convert to a proper for loop so that continue works.  Add a new helper,
next_entry(), to handle advancing to the next irq_pin_list entry.

Noticed during code inspection.  The infinite loop was not observed.

Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
v3:
const on next_entry() parameter
Remove spaces inside for loop braces
Remove inner if (!entry) check
Expand commit message to state noticed during code inspection

v2:
continue (not break) for pin == -1.

I added the next_entry() helper since putting the expression in the for
loop is a little cluttered.  The helper can also be re-used for other
instances within the file.
---
 xen/arch/x86/io_apic.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c384f10c1b..c35d611ecf 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1586,20 +1586,24 @@ static int __init cf_check setup_ioapic_ack(const char *s)
 }
 custom_param("ioapic_ack", setup_ioapic_ack);
 
+static struct irq_pin_list *next_entry(const struct irq_pin_list *entry)
+{
+    if ( !entry->next )
+        return NULL;
+
+    return irq_2_pin + entry->next;
+}
+
 static bool io_apic_level_ack_pending(unsigned int irq)
 {
     struct irq_pin_list *entry;
     unsigned long flags;
 
     spin_lock_irqsave(&ioapic_lock, flags);
-    entry = &irq_2_pin[irq];
-    for (;;) {
+    for (entry = &irq_2_pin[irq]; entry; entry = next_entry(entry)) {
         unsigned int reg;
         int pin;
 
-        if (!entry)
-            break;
-
         pin = entry->pin;
         if (pin == -1)
             continue;
@@ -1609,9 +1613,6 @@ static bool io_apic_level_ack_pending(unsigned int irq)
             spin_unlock_irqrestore(&ioapic_lock, flags);
             return 1;
         }
-        if (!entry->next)
-            break;
-        entry = irq_2_pin + entry->next;
     }
     spin_unlock_irqrestore(&ioapic_lock, flags);
 
-- 
2.51.0


