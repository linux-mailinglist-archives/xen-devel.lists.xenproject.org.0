Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C790786A842
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 07:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686327.1068379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfDB3-0007A9-W5; Wed, 28 Feb 2024 06:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686327.1068379; Wed, 28 Feb 2024 06:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfDB3-00074C-Rk; Wed, 28 Feb 2024 06:12:25 +0000
Received: by outflank-mailman (input) for mailman id 686327;
 Tue, 27 Feb 2024 22:35:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SVdi=KE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1rf62p-0002In-FL
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 22:35:27 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e77f67a-d5c0-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 23:35:23 +0100 (CET)
Received: from DS7PR05CA0050.namprd05.prod.outlook.com (2603:10b6:8:2f::9) by
 DM4PR12MB5085.namprd12.prod.outlook.com (2603:10b6:5:388::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.36; Tue, 27 Feb 2024 22:35:19 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::7f) by DS7PR05CA0050.outlook.office365.com
 (2603:10b6:8:2f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26 via Frontend
 Transport; Tue, 27 Feb 2024 22:35:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 22:35:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 16:35:09 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 16:35:09 -0600
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
X-Inumbo-ID: 7e77f67a-d5c0-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+wvoNjvHGV6H4AXYaKQcu5+HXvA/qX04A7HgEiw8Ee1G3W1xTPqU9uGvNJAjgdBwrMwhgC0v1cSHNelFOmlQgVrK2V8J//HnMQkb9ZLHUKnfqVlEA+r39CaCTEIfJdPs0G+1oDpNHlyzLIOzSQcA7QgdI0dNgfQzVe/CIdRPoKiJXZKAPLBYPoTucJ0YwRqjbBeYku4YfTLVs4vxFw85ybrYsOr/GrelOVm70hu05RdBteKot7Ys6QJG2y4KSF7jIFRTwYi/391JRhn8+exQYDf0PGv/ohrHKqqgawWPlWeMtqm+6Yp+h7+g6ggJlhvz7DbrLdkSaTZoYG/FRZ1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OZlucp+PoJdXp0H7/yZMTJ3c3snBOa8bo8Wnac6SL0=;
 b=aSZg+KfQynp/yG5GSBkWOE3vSOROC10yCZ/0LKp/HhoiZvSe3s7b8wSk7onKSGISECBVXBW+YFhTANBLWFVmKyDW+dqUd2Uxo3ZIPohC9NVUUQHlBq1PNYhJHDL4+ImcgLnv+Y5CbMtmd9L3zC0qmj4Umqw7de8Ee5oLYDrgibEWzSDTbi9sjMFt0uKd+qh52gSuDpogCvMRL/XMEiaP7UzyTGHjuCIg/1OrkKMXgn6Z0hzOtEKBHKAmK2N1D7m+CC4RuiK9aABTTyRIVYBYRMF6imTKM08RCDIozrSzoqKhx1cPWkpV51jlrX7szVLHZpshuNHQywKxvApbR0D3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OZlucp+PoJdXp0H7/yZMTJ3c3snBOa8bo8Wnac6SL0=;
 b=0k4dvU1NkQs9St7CQukJZRnyMZHs+mx8khDu3pNBnV1RVyNznnuwMmS/1J50ds7aa+/xzEDUcRrBbHno7F3DjOmVETfUpj9W5hxHO+8pa14et1iuSq8Q/d9pMvUFPi/Wd1gekkhYyU5+vx9bQt1XRDxKFWqHbNNRAnjztShBpzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>, <jgross@suse.com>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v3 4/7] xen: let xen_ram_addr_from_mapcache() return -1 in case of not found entry
Date: Tue, 27 Feb 2024 14:34:58 -0800
Message-ID: <20240227223501.28475-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240227223501.28475-1-vikram.garhwal@amd.com>
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vikram.garhwal@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DM4PR12MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: f800fa24-9cb5-4900-4018-08dc37e460c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ttUogOJd0iTIkqEQCd/nzbRBJYmOmeXxMNF3sPtwOTMiZB2RJ1iFEO5+Y4HxhBup+iPRbYAveHsIyKzCtkzLEuq8CReCndcXSrYV6xXSoNReTT01XTwawYlGO0/HEFwp6YTpMI7qFUuZO87nVn95QlBH5KwYehdA6b4Y4TH7oU0efT0gu1A8YyBj5PhM4MG3+pVjqYDouXJj+vzsOUwIt4R8fWyy++0QyEzDn8WkYDB4MQx4O+Jcz4cPsjuXwF1vbN1n8x0Kp++ULGQEoy+e5upFQxfLiuDJMKTAFyGbwnLbp5BbJh/gujrOFqLDTKRrk4Z9TCCp/SA6mArFcP4w9kzDiRLyW0Q2KXaOAmvyzbiasAkzdvHH64T2P4oNPXAG+D2eICaTUtji5o7b1YuaO35oBkFWL/Jeoiw9a2+jaYywe7houWkbOaf8XTPD+bTsreb35Go/mcAPpOGMc13uK7XeTx7TGNHanDj8JO656LmMFZNoQ4cMrqKqFSh4hw/YKigI2kJjmKqQcj5HMOdTacBbBI/Hw3CId9CVO0tn2/5smT1AXjnzrZQa/e4DxSAiPSI62Xr2bHQJYAsmw3ZeVwr4RZ8T3GW7VNAOPnZe/VMS8Ae9I7roiPU9Z+EWk4PEwpSOEOoe81ZQ0hrd9EIWiEV51e/h8PFG4LuSdE+T7q9p1hGABHhfaoWSv2MBrr7CTDFdjE6OyVPhzC74G3htX8EUIbE2pOD1i+Gzy75p0tNLQTLyMTd7540SqUw8MlaK
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 22:35:19.4088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f800fa24-9cb5-4900-4018-08dc37e460c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5085

From: Juergen Gross <jgross@suse.com>

Today xen_ram_addr_from_mapcache() will either abort() or return 0 in
case it can't find a matching entry for a pointer value. Both cases
are bad, so change that to return an invalid address instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-mapcache.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index dfc412d138..179b7e95b2 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -396,13 +396,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         }
     }
     if (!found) {
-        trace_xen_ram_addr_from_mapcache_not_found(ptr);
-        QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            trace_xen_ram_addr_from_mapcache_found(reventry->paddr_index,
-                                                   reventry->vaddr_req);
-        }
-        abort();
-        return 0;
+        mapcache_unlock();
+        return RAM_ADDR_INVALID;
     }
 
     entry = &mapcache->entry[paddr_index % mapcache->nr_buckets];
@@ -411,7 +406,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     }
     if (!entry) {
         trace_xen_ram_addr_from_mapcache_not_in_cache(ptr);
-        raddr = 0;
+        raddr = RAM_ADDR_INVALID;
     } else {
         raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
              ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
-- 
2.17.1


