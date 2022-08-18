Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA0598FDE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 00:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389820.626969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOnbz-00089E-IP; Thu, 18 Aug 2022 22:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389820.626969; Thu, 18 Aug 2022 22:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOnbz-00086s-Fa; Thu, 18 Aug 2022 22:03:35 +0000
Received: by outflank-mailman (input) for mailman id 389820;
 Thu, 18 Aug 2022 22:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pc6L=YW=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oOnbx-0007Yg-Mm
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 22:03:33 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98b8ea36-1f41-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 00:03:32 +0200 (CEST)
Received: from DS7PR05CA0041.namprd05.prod.outlook.com (2603:10b6:8:2f::8) by
 MN2PR12MB3728.namprd12.prod.outlook.com (2603:10b6:208:167::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 22:03:29 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f::4) by DS7PR05CA0041.outlook.office365.com
 (2603:10b6:8:2f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.7 via Frontend
 Transport; Thu, 18 Aug 2022 22:03:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 22:03:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 18 Aug
 2022 17:03:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 18 Aug
 2022 15:03:22 -0700
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 18 Aug 2022 17:03:21 -0500
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
X-Inumbo-ID: 98b8ea36-1f41-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9Olo+1fDjvZqiDoEBKmDR6eB4Qe4HdVZmscIJI9bCt1rPtjSPz4XC6DORvO+7Wc6ThSHjHJ+th82WYkEDQTG1yIk2QEcr+ssI+UdKS4noQxYy9mOgHKwZvqil+zhcVozyCPDvf8rFj7m5h4uHtiscS3FSgHvaI7e1uHNbUEyi0PrwVEhT2vwHlYPZsyQQNIE/Z0Z24FUzEDD60T2PuyImzMTgHTrdHpVOYf79YnEL9L+T9XwF5H0egHXb7GWEa1NPmnP1YXa1sMKHBl+kJdTFK/W6W3sviM632zpfuAo27cbJX47TUT2yeW9KNHXPY2RyVVJnk5Oo6cIEXzATXmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9xAtoAEfbE44r+znOUsO61Kytkse4K75wxHAkDzkqk=;
 b=e/vnJGovHp5kv+ZC8xDhsntmT/+cwiphU+04SC9XmNam/Srpl43f8jvSa9ZwOwIqxp4O6hps6wWL/Izp8krGeAI0HwnPr1ZtxuKvio6KYkSZPSyvUav112+7GaXHa1wIBBBipLZqvQHNxl3maf/0C11rWhEgyV1tzDr5WfE/oKko08Yde8RIicvL/PcjmjI6BVyRC7LYIL3jyF4STRDOerF7oKtgIfQqGTCB20cSStzAV1AIa818S2SwOYIy6LrPX5WRFzlHts1vNVS19u4gs3EVKbbNcT97CMA27EH0ya0IFZp5i0HWfBL8U9PahG3yEmbPRucWtnDH7Q2ayouWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9xAtoAEfbE44r+znOUsO61Kytkse4K75wxHAkDzkqk=;
 b=i+ZTNvPr+JSqqd9FtDeFy3/RTWGEA5JjCNkdY3NCrrF8vXwMuutquHeFY1TYvh+GbZ634L3S7x2ZbJWeV/WD3eBgRXGUpMDBrrD7rQJXdeghLjCXbmAmgkitIBV4El+QdWcCgUygnTbbhgVli5V3sjJqYmh0UV9klx8IugUnY8A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <wl@xen.org>,
	<jbeulich@suse.com>, <george.dunlap@citrix.com>, <andrew.cooper3@citrix.com>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>,
	<roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2 1/3] Add SPDX to CODING_STYLE
Date: Thu, 18 Aug 2022 15:03:18 -0700
Message-ID: <20220818220320.2538705-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c792252d-2385-4ce6-f1d6-08da81657b88
X-MS-TrafficTypeDiagnostic: MN2PR12MB3728:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7DAXXb5o1KpdbN4S987smN0yjLbG5F89jqRh9FNlAfi6K9d1P6U7bIjwSGq4oMeVk8c9g676okGrMINku5X5KT9m5cXyYAsRpnmzlyaV/D600l2WHVFrn32z+38RL/t2Ovv4966+rZPEQ4Bhc4JOD1kAhDPYFxsbL8f6LWZB8uGKw0wiw6Om0qC/+HQ+eUVcRNw/EmHqvGUM3iYkmtZJOPQ23yDOnKPL7Pg2lSnQGlvkWEg4MGRvC31vBtDzIOUxqqwh1nOOiwJL40M86lgTrqIbiHH83LytzP+VaCT/1tZZACbmqS7FEfKfAJVLYOyDuqLgaO5oacP0vWZzlfzZi52tjyKcKWdOF5ZPdQZwWoKHWtIdg3Kc1yrg0CAyz9s+tvkLmKMkRCCO5beSDflWXVIHMD9FU2bMOgeEm1tGIB4jUe1I92VdxK/TgfADSy8LDesRaq97vNJCBXhEJYDHDZ1Q45S5W0T5RXfBGVC8uVfsaG0NJR6pWxhBl8wh4reFiymbFjU7pZNttXCRJH5wc59vHdcbjb3JYhYRMSpDQf3YhO4efKDdsoDhcw61iPMZJZ0br6Z1UFwoFOqlFQ4EpPDLGAxJaRvlM2jmHhxykUuBw2Mxr1FVuGfD55b+LZ2TOFG/8EOTn0HLx6721kzI/MF7D6B7v68mk1y1FWTQ5rdeBXLiUhZX38X/TUgAMXDIs5ZUJ1Bxab3ou9AfjNbD4ngueVorsuPWuya2SDdsw3Ej3cZcKKCDvcTbY4h6sdoyWKNtzajaazROzDmTaslJNUXsAVwhKoPlsVqiRW8XUVZO34m51WVI7O3fbg71MSkT
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(40470700004)(46966006)(36860700001)(44832011)(2906002)(478600001)(70586007)(5660300002)(70206006)(4744005)(7416002)(8936002)(8676002)(82740400003)(356005)(81166007)(336012)(86362001)(6666004)(40480700001)(2616005)(26005)(36756003)(47076005)(54906003)(1076003)(426003)(4326008)(6916009)(41300700001)(186003)(40460700003)(316002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 22:03:28.9505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c792252d-2385-4ce6-f1d6-08da81657b88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3728

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 CODING_STYLE | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 3386ee1d90..5faf274b3a 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -14,6 +14,16 @@ explicitly (e.g. tools/libxl/CODING_STYLE) but often implicitly (Linux
 coding style is fairly common). In general you should copy the style
 of the surrounding code. If you are unsure please ask.
 
+SPDX
+----
+
+New files should start with a single-line SPDX comment to express the
+license, e.g.:
+
+/* SPDX-License-Identifier: GPL-2.0 */
+
+See LICENSES/ for a list of licenses and SPDX tags currently used.
+
 MISRA C
 -------
 
-- 
2.25.1


