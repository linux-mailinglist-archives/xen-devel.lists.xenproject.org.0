Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40D8B1E40D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 10:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074088.1436785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI57-0000e9-L9; Fri, 08 Aug 2025 08:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074088.1436785; Fri, 08 Aug 2025 08:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI57-0000bf-Gw; Fri, 08 Aug 2025 08:04:05 +0000
Received: by outflank-mailman (input) for mailman id 1074088;
 Fri, 08 Aug 2025 08:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRAb=2U=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ukI55-0000NJ-9D
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 08:04:03 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20629.outbound.protection.outlook.com
 [2a01:111:f403:2409::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f18ed9c-742e-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 10:04:02 +0200 (CEST)
Received: from MW4PR03CA0171.namprd03.prod.outlook.com (2603:10b6:303:8d::26)
 by SN7PR12MB7249.namprd12.prod.outlook.com (2603:10b6:806:2a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 08:03:58 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::cd) by MW4PR03CA0171.outlook.office365.com
 (2603:10b6:303:8d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Fri,
 8 Aug 2025 08:03:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 08:03:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:56 -0500
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:54 -0500
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
X-Inumbo-ID: 3f18ed9c-742e-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBqwU8uSX+sHBP4/kTblp/3ZB8etGJNoeP1j9wwmH2AAVg4jDyVx6Ffh7zP7TsKf62Z3aPEGjN0iF7A3JesNFxBjIW8ildFq8SMfKkQklEGKNJnNCW65h6qhtU1OCqXJ4c2NFhtDvu2RlKJcnJ/rozgKrSPbWuesYU8n4S0tsAbGN0Cy/iKK/lG5giaxf+ZedBh/+SHTiSJJWPUpLAL6wIGXC41Gpez0FydhdLds20CwzJiMeDtfLOr2HmYyTrKkYuiszPdWKHFgFneUz6QUxE+kg/+NPHkwcLwenaoTfORmP2e0vuDWga9vkeODrhiSOLyVMWFii3GD45u6NE+PIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy5ubspdr70xaDp9A3gBSFa0/3M4XGQrEgGFMcPaeo0=;
 b=Q+/p1NkBaNGCPc1gw4tXGJnthMfcoU5Rn10vg6P3b4eHjau/LG+qle8Pex9OZ4K6zOhv5JlHlxQkP3dzDfXRBTcXY71ZNmO1RdAR8Vb9NiI++4BpWDelOhYtV6izSfw+7QrrUqJ68ilZ167cV7n5nk8Pbute3hDAKYZIQt+BUpH8Pm0a7EE5xkq//PgH9TSrDklENLKBId6sgmXMYWcfhpXIsc5OMD2YDEzJb38fF4586zlfI/n1VJ6gQe5Qxmgfe4gQkvCDBaGOuFvAgJPga9nUVCLAebN1LPXNYvmNLkL7B3qNjqcZWMcKjwuWrLVrRRUg+yEIjl57GXbB4sxmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cy5ubspdr70xaDp9A3gBSFa0/3M4XGQrEgGFMcPaeo0=;
 b=YJMb2SuvT0PNOYEUksJKOo+X1dNP2dCkz3rDjtYn5fDNB+4QALUOAhInroLxWFKa/WXG7QKD+ZtdkZrTW/XMB1CR7P7mXEesaMCyGheVYvWmDqUtZ0XV3fA6qB/0wkIz98Uuq4NNx1Q7Rfb93PSpD5DeX2Wn26/dEKCuSEUS0yE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v11 2/5] vpci: Refactor vpci_remove_register to remove matched registers
Date: Fri, 8 Aug 2025 16:03:34 +0800
Message-ID: <20250808080337.28609-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808080337.28609-1-Jiqian.Chen@amd.com>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB05.amd.com
 (10.181.40.146)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|SN7PR12MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: f2145d63-8447-4ca6-d2f8-08ddd6522051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUZlOUxXZGZLd3lHMnpqU2JnZlZWV0Uzdm9sa1JhZzFVWitKZTN0MlFVdUwx?=
 =?utf-8?B?U3RBdFU5cnBTbkZiZCtKa3JGMFB5VW9ZYjBKRmtZd1dzUEtaWXF5Y2pKcFNx?=
 =?utf-8?B?VC9lUFg5Qnlyd1BoYkNqbHA2cTZoaWI5MlhjQVpIamkydm1KK2pnVlRTa0VY?=
 =?utf-8?B?V3FmUHV6anJVZTNxd0J5YnFIUWRTUVJTOUFlWVhpb3FiVlI4Vm9Xd3VWditG?=
 =?utf-8?B?YVloWStrS3MvckxEZDMrTFJEZ0V5QlI5UEhWdlQxaHVCbUptdXFuQ1Mza2hM?=
 =?utf-8?B?ZU5kUkNkdTk0dDYyUzB6TktMZitxQXc4eEl0UU5wcVBJNkRRWEw3cEs2d1hr?=
 =?utf-8?B?Qng3dk5IMjR1MHpNQXI0ZUNsVWlTR0orRkNJVFFHaVhxSHNzcVQ0VWhKZUt1?=
 =?utf-8?B?WjRRVUpPSE1GVjExNnZTR0Y2eC9lNHhjOERDKzRJYmZ2a0w5dVJ1SDBHcEp2?=
 =?utf-8?B?L3ZGVVh1Ykg5M0Rodi8yQitMd3kzc2NlT2FKakpKU2pHeklwWVVUTk1PMStp?=
 =?utf-8?B?SEo3c29vanhRYVZtQWcvR3U0cEhQZU4yWXFkWWwrekxvNVJjbjU4dW80MHdn?=
 =?utf-8?B?c0ZKREh2cnhaSzdpTm1LMG13a2hkR3BiRnNmUkpyM1g5bnVpb0dKVlZkQWVQ?=
 =?utf-8?B?Qnh0cGtiMlBIcXVlWE52Q0k5UXB5MXpsMGlXemgyKythblRxOUlXTlpmQTdr?=
 =?utf-8?B?aXhvd3MrajBkZkJOWUowMHZvVEM3U0hBL0MwZTNjVlMvNGFIbDNZYkRrekVO?=
 =?utf-8?B?RGdRR1BkOFkwRDU2anlZMGZNZTF2QVBMaG5IME1BWlhNS3k5UFNZSytZVTZu?=
 =?utf-8?B?eklOZzZDNUs3N05jekthMjZWNVo2T2pveGR4TStPZDBVOWdjQ21uRkkycE50?=
 =?utf-8?B?R1J0RFIyWHJzWTBkUEhYUW9hSDJuTTJ4N2doRlVhSzJqMUtqaHVqTktvUVJH?=
 =?utf-8?B?NmJoWWRzeXN3MXNNYnBUVmFLRzVxNXprRzBhYmZLdHFFSHdRNWJaSW0waVpI?=
 =?utf-8?B?dlJhcERmbWVBaGVBMGFzUDM3SnJTb2ZCcWRYdE5KZzVESVRucHR6ekFwUDRT?=
 =?utf-8?B?eHFkZHBBWkJHbFBaQ1NOcHpyeU1zRmR5NllUUjdvUHA5NG5EM0g5THM4L0ZI?=
 =?utf-8?B?U2tDUE1VeVlzOXdQWkJmbHkyV0pvN0NjZ3pGSFZ4SVhKbW5zM0YxTVB0RnRS?=
 =?utf-8?B?MkJrL0Y2NEpUcWJ2Rm53RzdLbVdLN21rK0dBTUxHZ1NLamdQYUpTZEo1c0hw?=
 =?utf-8?B?TTRsRFYySkdUMCtJbGQ1Sm9RUE9OeVFLMVk5Zm91bStyM3FINjl0TFl2aUpr?=
 =?utf-8?B?M1hJeGl1SWJqWVZ0Q0t3MGNDbHZvNldRSjVFd0lMNzNyeStYWFRCS01ranVS?=
 =?utf-8?B?akJybWxCVDVvbEVrTEkxSDRseC9BN201VU1CYlp5dDU3WlMrbkorYjBtQnpE?=
 =?utf-8?B?QlozLzlXaWVUMm1lUDJHN095VlVxZVI1VS9iZHVwblVUbkJmUjEzdldsSzVm?=
 =?utf-8?B?YXBZNXRJZG0vSlo2NkQ2SUpuVGFLZ1dhT0RuNlV2WmlwR2U3T1QxbU9kWWpt?=
 =?utf-8?B?TEVsQk9uRnJObFExOTNKVzFDL0tsSGhyRTdiL2dMU3N6dFkrYUhldVRGclRQ?=
 =?utf-8?B?cCtGcHkva1FHckM0MVJoU1czY1RGRjVMWjVIMHlPSlRHT2N3bjR5bVJkalZX?=
 =?utf-8?B?RjRuZU8zZGplM1ppV2R3bFhsN2VIbEdEVmZlZXBTL0ZCaDBYaEpHMWVJckRy?=
 =?utf-8?B?blVjcmcrTnZXRjJxT0podmZhT2xvSUQ4dStGNC9RSjBNZ2hwaE9MeHlSYS9j?=
 =?utf-8?B?c0JsOHVmT2lXejhTaEljbU5DdFhzTjdCbDZybUVWc2ZFdWVLNVdHblJVTzRK?=
 =?utf-8?B?KzRLSVV4SHppNEx3TkswMG0yVkY0c254djd3TmJKSzhGTlAvbDBja2Rkblpt?=
 =?utf-8?B?dlF1Nk9hZTR2Uk1RY1VzS3ZkRU1GcmFlTEhrUzQreTNueHdTTUt3cTFFK0hS?=
 =?utf-8?B?VnNLenFzcWtRMUtPWWRTQVFvZ0szd3lPeG5LR2dtUlpDUUMyRjZRNHdSQXRH?=
 =?utf-8?Q?350rpO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:03:57.3028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2145d63-8447-4ca6-d2f8-08ddd6522051
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7249

vpci_remove_register() only supports removing a register in a time,
but the follow-on changes need to remove all registers within a range.
So, refactor it to support removing all registers in a given region.

And it is no issue to remove a non exist register, so remove the
__must_check prefix.

Note: two test cases don't math the new logic of
vpci_remove_registers(), then modify them.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
v10->v11 changes:
No.

v9->v10 changes:
* Since logic change of vpci_remove_registers() affect the test cases of
  tools/tests/vpci/main.c, change them to match the new function logic.
* Remove Roger's Reviewed-by since patch changed.

v8->v9 changes:
v7->v8 changes:
v6->v7 changes:
No.

v5->v6 changes:
* Modify commit message.
* Add Roger's Reviewed-by.

v4->v5 changes:
No.

v3->v4 changes:
* Use list_for_each_entry_safe instead of list_for_each_entry.
* Return ERANGE if overlap.

v2->v3 changes:
* Add new check to return error if registers overlap but not inside range.

v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 tools/tests/vpci/main.c |  8 ++++----
 xen/drivers/vpci/vpci.c | 38 ++++++++++++++++++++------------------
 xen/include/xen/vpci.h  |  4 ++--
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index 33223db3eb77..2ef8d4e03f1d 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -132,10 +132,10 @@ static void vpci_write32_mask(const struct pci_dev *pdev, unsigned int reg,
                                   rsvdz_mask))
 
 #define VPCI_REMOVE_REG(off, size)                                          \
-    assert(!vpci_remove_register(test_pdev.vpci, off, size))
+    assert(!vpci_remove_registers(test_pdev.vpci, off, size))
 
 #define VPCI_REMOVE_INVALID_REG(off, size)                                  \
-    assert(vpci_remove_register(test_pdev.vpci, off, size))
+    assert(vpci_remove_registers(test_pdev.vpci, off, size))
 
 /* Read a 32b register using all possible sizes. */
 void multiread4_check(unsigned int reg, uint32_t val)
@@ -402,10 +402,10 @@ main(int argc, char **argv)
     VPCI_REMOVE_REG(28, 1);
     VPCI_REMOVE_REG(24, 4);
     VPCI_REMOVE_REG(12, 2);
+    VPCI_REMOVE_REG(16, 2);
+    VPCI_REMOVE_REG(30, 2);
 
     VPCI_REMOVE_INVALID_REG(20, 1);
-    VPCI_REMOVE_INVALID_REG(16, 2);
-    VPCI_REMOVE_INVALID_REG(30, 2);
 
     return 0;
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 120a919f08e3..6ecb70052b93 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -152,7 +152,7 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
 
     prev_r->private = next_r->private;
     /*
-     * Not calling vpci_remove_register() here is to avoid redoing
+     * Not calling vpci_remove_registers() here is to avoid redoing
      * the register search.
      */
     list_del(&next_r->node);
@@ -160,7 +160,7 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
     xfree(next_r);
 
     if ( !is_hardware_domain(pdev->domain) )
-        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+        return vpci_remove_registers(vpci, offset + PCI_CAP_LIST_ID, 1);
 
     return 0;
 }
@@ -572,34 +572,36 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
     return 0;
 }
 
-int vpci_remove_register(struct vpci *vpci, unsigned int offset,
-                         unsigned int size)
+int vpci_remove_registers(struct vpci *vpci, unsigned int start,
+                          unsigned int size)
 {
-    const struct vpci_register r = { .offset = offset, .size = size };
-    struct vpci_register *rm;
+    struct vpci_register *rm, *tmp;
+    unsigned int end = start + size;
 
     spin_lock(&vpci->lock);
-    list_for_each_entry ( rm, &vpci->handlers, node )
+    list_for_each_entry_safe ( rm, tmp, &vpci->handlers, node )
     {
-        int cmp = vpci_register_cmp(&r, rm);
-
-        /*
-         * NB: do not use a switch so that we can use break to
-         * get out of the list loop earlier if required.
-         */
-        if ( !cmp && rm->offset == offset && rm->size == size )
+        /* Remove rm if rm is inside the range. */
+        if ( rm->offset >= start && rm->offset + rm->size <= end )
         {
             list_del(&rm->node);
-            spin_unlock(&vpci->lock);
             xfree(rm);
-            return 0;
+            continue;
         }
-        if ( cmp <= 0 )
+
+        /* Return error if registers overlap but not inside. */
+        if ( rm->offset + rm->size > start && rm->offset < end )
+        {
+            spin_unlock(&vpci->lock);
+            return -ERANGE;
+        }
+
+        if ( start < rm->offset )
             break;
     }
     spin_unlock(&vpci->lock);
 
-    return -ENOENT;
+    return 0;
 }
 
 /* Wrappers for performing reads/writes to the underlying hardware. */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 4b7b9298c4e8..9ae75d946af4 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -70,8 +70,8 @@ static inline int __must_check vpci_add_register(struct vpci *vpci,
                                   size, data, 0, 0, 0, 0);
 }
 
-int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
-                                      unsigned int size);
+int vpci_remove_registers(struct vpci *vpci, unsigned int start,
+                          unsigned int size);
 
 /* Generic read/write handlers for the PCI config space. */
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
-- 
2.34.1


