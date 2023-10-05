Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E187BA8E5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 20:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613094.953397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoSuW-0005If-KO; Thu, 05 Oct 2023 18:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613094.953397; Thu, 05 Oct 2023 18:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoSuW-0005FT-GL; Thu, 05 Oct 2023 18:17:20 +0000
Received: by outflank-mailman (input) for mailman id 613094;
 Thu, 05 Oct 2023 18:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwJB=FT=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qoSuV-0004jk-73
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 18:17:19 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e83::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a908a56-63ab-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 20:17:18 +0200 (CEST)
Received: from DM6PR11CA0011.namprd11.prod.outlook.com (2603:10b6:5:190::24)
 by SA1PR12MB8093.namprd12.prod.outlook.com (2603:10b6:806:335::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 5 Oct
 2023 18:17:15 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::78) by DM6PR11CA0011.outlook.office365.com
 (2603:10b6:5:190::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Thu, 5 Oct 2023 18:17:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 18:17:14 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 13:17:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 11:17:10 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 5 Oct 2023 13:17:10 -0500
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
X-Inumbo-ID: 6a908a56-63ab-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hk5Q7zmxTeEefs94fBqp329rML9W7uIYqJEj/eeZqX5cDHiTusGDJRWSlC516STkj2loNtZQ2g2l8Gk4/nkgU3GwJPcCFP7CNAQ+PVCzQizr/d0ZyAHGpVxC+WqI5VSrlKgjoauMoC5nHeS2KFVmKxoXsXC84D9/kh5KtYZah1ews4lGH8Mj4VCyPkVcrMMewd6X+u7VuGHHphsOtWLNUYUF3Gd+qVzYLi/QxooYiVq+V7yY8Qz2o+EQKcZr4z+V7BBmxaivdJr1CnGz0C5VSnYxNk3f0AK6yUNb9MUcp4R8PWbBSjzehd475xWeYMF1kSIQNnFGw+VLc+Vvzymkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyNjWn5SJhWUmcBag3JIZwDCIV00tRHA7KorZZW17+o=;
 b=m2V/cBQNQ7FpxkFhEFp2isEeAiOVdPXhntHDoIIoTsQ/6fHabY+1bdIpRJy54hiblBVyO+oYTjFKMModd87g48QjneGK36GTQeQM6h26raIkapTqZOOeYdVLTNfBhwcHYm2vdaaDfyUh2g+5FVP0iIncbs7cecN1r/26lJNpklcqb6ma6rLOGhY4t1EaV67TQEyY0swSKi83w1+suomgtBt3C/mCrZewq7p9QfKwJZtyygdE09qaffRAvQhYT/yFgXbZwheIh7LoWhC24uIwS5hJw3Ra9UWIwfNldAlbpob54puF2BdKfZ8+3Ov+1/501e5XpwSzZeW7bvYT2VrYmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyNjWn5SJhWUmcBag3JIZwDCIV00tRHA7KorZZW17+o=;
 b=JBGUpzbv9KHDclsOgX3quNrt3U5EfRi+XeqDQM2hQuI7kG8K5b8PQmHWn9fnWQFnMbM23kwk0aEe7of0UclafYpgNO9Kg6cAozTqU+Hb90tQxoRUJXHF1tPEgMXM942JQcXjc1W5fefngI5axGbtVu0FRIxtkiMvwFDk6QA95+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open list:X86 Xen
 CPUs" <xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v1 4/7] xen: let xen_ram_addr_from_mapcache() return -1 in case of not found entry
Date: Thu, 5 Oct 2023 11:16:26 -0700
Message-ID: <20231005181629.4046-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005181629.4046-1-vikram.garhwal@amd.com>
References: <20231005181629.4046-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SA1PR12MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 233960d8-50bd-40e5-2cc2-08dbc5cf4d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uvJ/sQMkijaa6U7JaszCb8+h8nbmycnuRFytx4gc5JQ/xGPolzr+eWtZTPIS4nlcFi1awuH9BoTwfrrtGvbciSk35BjnwWTDeA2PqPJ+qvwTZujdM1Rsdis4immIE73QCiQCQRXTJ87vsRhwd5VW8fH9gXzDKr6SpF5EJy5tGKKligujhWfncxxfgduFc5vPKWAsTP2K/f1BUqr434S7gfHcHPIjS9R+Tw021uLF8Iy1zfD9rhDLLBeCTD9nrn80hS5bFF++D8W+s+Sui89vP1CfJ7W/hbjCYiXSU4CE2Kgp8LXOXuZqzKcGE1cGc94cY7OdO95nw5KpnOM2KYIeE7z0b9ISY8tH39xCoNKmaQ+nW1CDIuBVm9r15GP302txoyFpXBqL87IwLCZ5Qyor4AwVRyfnimgLHwcK+lTKsMatzvKylkp0AygK9JZxgLxAKyrfbPyY4uXI/hYJE/hl8/CaMrdAVBXRbex299C9TpIaBl40ARVlGZmRUgLadQquCtbYt1xri+BfeG5GXcka3hruUatZcV09pRlo+ZfO3dbrhuhHgDMF1plxrGzrEs+6v5KBatwFGcK3mOjg8bgiDr8ui/Nz2qwLiI3pwwPG7zOYzy0aEzwCS8WeDFxHU4vYoDYzaKypqjV6opjMXk5QmitA/4OAOauTblSNxafivNffF88NSgrMX9iQ1spnrEUqkCy03yxyTPWL1vLTsSWwH5apQFgX1kjXsJlJjK6YMiyM667EXg7ZNTC1j1PkyPMRq24LYGKc3GBDhMZeRQaWGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(82310400011)(64100799003)(451199024)(1800799009)(186009)(36840700001)(46966006)(40470700004)(1076003)(47076005)(478600001)(83380400001)(6666004)(40460700003)(36860700001)(26005)(426003)(336012)(40480700001)(356005)(81166007)(82740400003)(5660300002)(2906002)(86362001)(4326008)(41300700001)(2616005)(8936002)(36756003)(316002)(54906003)(70206006)(6916009)(70586007)(44832011)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:17:14.6705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 233960d8-50bd-40e5-2cc2-08dbc5cf4d38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8093

From: Juergen Gross <jgross@suse.com>

Today xen_ram_addr_from_mapcache() will either abort() or return 0 in
case it can't find a matching entry for a pointer value. Both cases
are bad, so change that to return an invalid address instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 hw/xen/xen-mapcache.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 8115c44c00..8a61c7dde6 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -404,13 +404,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         }
     }
     if (!found) {
-        fprintf(stderr, "%s, could not find %p\n", __func__, ptr);
-        QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "HWADDR_FMT_plx" -> %p is present\n", reventry->paddr_index,
-                    reventry->vaddr_req);
-        }
-        abort();
-        return 0;
+        mapcache_unlock();
+        return RAM_ADDR_INVALID;
     }
 
     entry = &mapcache->entry[paddr_index % mapcache->nr_buckets];
@@ -418,8 +413,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to find address %p that is not in the mapcache!\n", ptr);
-        raddr = 0;
+        raddr = RAM_ADDR_INVALID;
     } else {
         raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
              ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
-- 
2.17.1


