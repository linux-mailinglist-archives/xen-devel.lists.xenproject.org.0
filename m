Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A5677CD6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 14:45:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482852.748616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJx8u-0005gZ-1m; Mon, 23 Jan 2023 13:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482852.748616; Mon, 23 Jan 2023 13:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJx8t-0005ds-Ts; Mon, 23 Jan 2023 13:45:47 +0000
Received: by outflank-mailman (input) for mailman id 482852;
 Mon, 23 Jan 2023 13:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozL9=5U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pJx8r-0004ON-Lf
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 13:45:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b5f0ff9-9b24-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 14:45:44 +0100 (CET)
Received: from MN2PR20CA0058.namprd20.prod.outlook.com (2603:10b6:208:235::27)
 by IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:45:42 +0000
Received: from BL02EPF0000C404.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::8c) by MN2PR20CA0058.outlook.office365.com
 (2603:10b6:208:235::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 13:45:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C404.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Mon, 23 Jan 2023 13:45:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 07:45:40 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 23 Jan 2023 07:45:39 -0600
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
X-Inumbo-ID: 3b5f0ff9-9b24-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xlsf/ickAFk41BuHISbEuDiI2PDrdGvCfr7EJZyOLXESECohAQPhZTWAE+agYQu90QP9ZRV5XjzN+tRCtK61MwLToI2sy4mz8nPx2FlesQ6+BjR5z9PV1KiYQbPkFpb/DlzHYuzXFu6F41wY4/fxRr1lSiefTignbhWZL4mZUGDpEXReNUY8i2DMC0z1AUMjpG/LI0ZrFbtdKm2MfS1AzlzaNd4zsX5CZrRRt8o90sye0chIVbNkSWYs2Ei9QkK/Lhzjffs15/sVDiDLO3m3FGjxCGQXlbe/RL0HEOyR7AnamigT70joLZMYwrH6MbAdj+PyEOGsVOdEuBC9rIjniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mGRDEaxCT5Vc+hDapbIEiqvewhZapa+H6B636bxP5M=;
 b=MQnajVYMRuobPs107ohVlA1ehJRqh9Zyskmfs241nUvp5tpvhVB6WitBaw24fYCKCn38qZ/f8cSGAuCTtkerWBwuFkKhILUuqicWklTnTu4qYw6lbLeFOTd3PIQyXBCClAaJ2ZeoPxtojZEQiber9IaJnd3Vm3OWYOfdKtpAlqqUvr3O6EHaewal1s6/gWFx9pds3k4dsH7i/csOlNhpUBkOTL3Ow4tBZtntUHF3Wu9rBcIlxsuUziv2mRwohZpx9A463NbT9FXe6FEsRvJmk5B3IY1juqQh6IkPGjN2Vn3eO4VlXTib2D3xJVytrqsV5CAywMdcghw2GRVTjDbrnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mGRDEaxCT5Vc+hDapbIEiqvewhZapa+H6B636bxP5M=;
 b=fIF9l37l+P5/oG56WnqX+cAxtnnOPpsXFHjRG/dsLmudBoXTosES/Iyu9nUpUHbEsO/DKBvG4VB5xeqjon5nkfHpLAmKDMWaBLpavre/dt2yE2tY2fVqnYyRXlQXvc/FmUeynP6CmSiHwOUySgAgpd911en3x/odbFXnlkYD3CI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <xuwei5@hisilicon.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 3/3] xen/drivers: ns16550: Fix an incorrect assignment to uart->io_size
Date: Mon, 23 Jan 2023 13:44:51 +0000
Message-ID: <20230123134451.47185-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
References: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C404:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: af5965ca-5167-482d-6424-08dafd481e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AB7WWCZKD+eSNlfQKxUC+IDNe195ojdqn9k+dPhD6HT5fyFLMM7hTirllhUHGXnymi+kI8E5Or/odxrcNAKkTpDun+EHdN/Ga7URAKdwYJRkMDccxZsM3Pxv4v2eZxffuExdu2p5KX8yyLT8diHtuWmE3Jn3xWfU3IP3iO1kkZqBIJIIl/tLtd0EYvgZv56sRRbzdePELNG/Kq7zz9yiwJL0AD1K7uWt2+vc5nQedABCJqXeDKEd2HQsiuEkTnlrwZ6wyUHyDvY2HTXLpQ/gl+aUyOTNRz1xnp+mnTnzJHtGK2PoyOYtNfo+NplsjtRZsNzvCvk6uzoUcUcNojPrKvQpWibIwNztHxyBEBt/oHMiBB1S4NLolfxclZ3NwMLqwDnpCju/A6rBh/8Z7Bu/YEYPZvkehP3dkK9O/oJXINKPTHroRheMyZl7phvMv7wbTAMM/5wSUH94dHePC0r8JlScH8GpOU9l+5Efuv4iFmwmiM1mAGMHhATaTo2jcH8cwAYBvYosRC9nD7sIYwHwV6kSx3fEsMvTpmm9UdMMo6RmNNL4/2RFOlN+kZBxL3Q9ITojSEPafUYN1ZyYNNVwKBlI/Y0PjsHMRp77+WwUbCAGYfXVrAY/pJPx8Yx0FTxDp+68ScVtiD1Jg9iWHEc/8pMgS8h5AvTgScbAN7GPz+znlXD0P4c+51xmRskKJo819k6C6qZGIWa/z7FPD4wV8neWEFbfztbdPSitwCPlAqM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(36860700001)(103116003)(81166007)(82740400003)(7416002)(41300700001)(86362001)(356005)(2906002)(4744005)(8936002)(5660300002)(4326008)(82310400005)(40460700003)(40480700001)(6916009)(8676002)(26005)(186003)(1076003)(6666004)(426003)(47076005)(336012)(316002)(70586007)(70206006)(54906003)(2616005)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:45:41.5573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af5965ca-5167-482d-6424-08dafd481e69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C404.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225

uart->io_size represents the size in bytes. Thus, when serial_port.bit_width
is assigned to it, it should be converted to size in bytes.

Fixes: 17b516196c55 ("ns16550: add ACPI support for ARM only")
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1, v2 - NA (New patch introduced in v3).

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


