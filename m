Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AD6797DE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483531.749742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKILz-0005By-5D; Tue, 24 Jan 2023 12:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483531.749742; Tue, 24 Jan 2023 12:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKILz-00058w-1h; Tue, 24 Jan 2023 12:24:43 +0000
Received: by outflank-mailman (input) for mailman id 483531;
 Tue, 24 Jan 2023 12:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMs4=5V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pKILx-0004Vt-SC
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:24:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12d5bbbb-9be2-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 13:24:41 +0100 (CET)
Received: from DM6PR05CA0065.namprd05.prod.outlook.com (2603:10b6:5:335::34)
 by MN0PR12MB5882.namprd12.prod.outlook.com (2603:10b6:208:37a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 12:24:38 +0000
Received: from CY4PEPF0000C973.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::a0) by DM6PR05CA0065.outlook.office365.com
 (2603:10b6:5:335::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Tue, 24 Jan 2023 12:24:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C973.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.14 via Frontend Transport; Tue, 24 Jan 2023 12:24:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 06:24:36 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 24 Jan 2023 06:24:34 -0600
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
X-Inumbo-ID: 12d5bbbb-9be2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqCmN4op8+KBFwNOy5VK+5EJxoGcsCTuQCyakfyh/MehtmCpxTGYE03XuFiq3nzsU7f3z8AmYBc4hfOadY2N0b6AygyuuwGVIkJn6IRVMLmNBKv6ntOYWJH5Aqqz+ZaIY87epZpRuiHYJZO+6GZPYgw3E0Szg0sYMMRiTr+c2ssXVLN1R8b4rq66qmKXztxxtCEWP4azXaw5bfrIOFrabfHnH0yzyPKu/+66kMXmLWmsTI5PrH8DZBmp9L58iISCcs5MCKPBJSPCNFvhvMxEnWA+EqGZdtgt1ASwtabunY3sFX0dxdL3b4l7OcjkUGSOauT6JKtNjkwVxGTB7B8KAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYkmJ/OdKUndVT1CuPr9J8refiPRMUq7ilyeAaA5ma8=;
 b=YmAgGG+17SjCNW82QeyVPWml+YBWZy3s5jVsy5AtbXIXJZoo3e9X9EhKO3fGOP/fFG3huUInGvor3MgwQ8Mvxzj6UUUDQiq8dpuqleUD+og2T4Rb0BbyeijTuHkgLbyT63c3nIme14UZCkGbnLe9ck4TdfSCgVG8eTKLPNylFUCC4pVbFPaXcdYR7Oy80bp4Udg1/xtdyQrMZ2nuv9wyU5UbGnqQXcWkCOxaKwcoTGReE7iMjvU1lA+1QHLbHyuKZmcxBl6KqnWTRokqDIJ7d4XRqWvzuxoN9DkunAJ2cYwKCecMxHpdY//rsuu67dDisFAkv1XFXa8BzhqWbM0AjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYkmJ/OdKUndVT1CuPr9J8refiPRMUq7ilyeAaA5ma8=;
 b=h9MgXR/zNNjYmYAeodUvrt3UgOjnQJf3KTBwvr3M2r/4k1qeH3hBV/uh45Slmk0uWgGe2DAsf/5HHL6dPiqd0Wx9GAdOnStc28FjrDvhyzZSjLu0tY8SKK1rmnk0Fh78alK+JEZwwPN/DGcxEBzLEuPuVpOPLDKKhgbIF+30TX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <xuwei5@hisilicon.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 3/3] xen/drivers: ns16550: Fix an incorrect assignment to uart->io_size
Date: Tue, 24 Jan 2023 12:23:36 +0000
Message-ID: <20230124122336.40993-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
References: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C973:EE_|MN0PR12MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 6139d27d-a81e-49cd-c9e0-08dafe05f557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kG+zs+z5V4QE6umXtsi1ccsDnE99BjO/4xR8nbjQ39LFWlBsUdu5ZW7oTaVmtZxW6fnrM+lv+jtLmYaxWk3pnicOBW+RuR6GsOI8b5vsC9OSrigtVRZxMnvMJBXOijDIO0E5XVs5PZkbCcemrwat/eNWXCOBOpa/7I4aaoDdQiO5raSWfdBEo+kPjg9BhsC9pSS9AMBZZ1uueiifygdfTI7MuU0WfPvujdJ1cjLtwctTYJyH1PTRXQiPCbpBl8EpsOC2CqBL8oRa8vYRltDqaQvzfbUtSXnXx7rx36DFg6KSfOIORR5fyYfOmk3gN8XnY0S/uSrDRV1IhLlLkeiFCW6EZLyDzkESdgSQFcHOgbrLqT9Xi0lQU2W0in9U9Ak+gVB7nuhe8VKj4faCf/5NTAF1MH9QXluUPuxgxAHys4YiAPsQYz0UhfELtqBRSmsy8ZelU/U1AdN81of1vYKez31UdshdGvQYInafr7orjjUGoJeihBQJ2hJcP1E3DnpZ5gdTRhBrDP7K2vOzcjZ1jHuu2CsiN92g/1YEv/BkiT/ZSc5Hdvz1WfN9z+sn6STkM2kZdme5SF5r/og6nIaKip6A/yr1VM6s9IjVrn/4GAjrUJ5sjfHsSFYzBRpYo/seBPfE6egyrjxRQb0v88aw9omI5ZScjoL6YxmBSqgPyZGJBgt8azqjO6dCPQf73frEtyxkGuWDbYEtWfcl7N/qlKAJq1Z11MaKDeK0R1fVNGY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(36756003)(316002)(8676002)(86362001)(70586007)(4326008)(70206006)(6916009)(54906003)(186003)(26005)(40480700001)(83380400001)(356005)(478600001)(336012)(81166007)(2616005)(103116003)(1076003)(7416002)(5660300002)(47076005)(8936002)(40460700003)(41300700001)(426003)(2906002)(82740400003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 12:24:36.9715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6139d27d-a81e-49cd-c9e0-08dafe05f557
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C973.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882

uart->io_size represents the size in bytes. Thus, when serial_port.bit_width
is assigned to it, it should be converted to size in bytes.

Fixes: 17b516196c ("ns16550: add ACPI support for ARM only")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes from -

v1, v2 - NA (New patch introduced in v3).

v3 - Added Reviewed-by and Reported-by tags.

 xen/drivers/char/ns16550.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 43e1f971ab..092f6b9c4b 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1870,7 +1870,7 @@ static int __init ns16550_acpi_uart_init(const void *data)
     uart->parity = spcr->parity;
     uart->stop_bits = spcr->stop_bits;
     uart->io_base = spcr->serial_port.address;
-    uart->io_size = spcr->serial_port.bit_width;
+    uart->io_size = DIV_ROUND_UP(spcr->serial_port.bit_width, BITS_PER_BYTE);
     uart->reg_shift = spcr->serial_port.bit_offset;
     uart->reg_width = spcr->serial_port.access_width;
 
-- 
2.17.1


