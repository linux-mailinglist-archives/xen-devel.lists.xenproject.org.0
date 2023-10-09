Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE7F7BEB16
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614453.955528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwO4-0003Dg-4e; Mon, 09 Oct 2023 19:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614453.955528; Mon, 09 Oct 2023 19:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwO4-0003Be-21; Mon, 09 Oct 2023 19:57:56 +0000
Received: by outflank-mailman (input) for mailman id 614453;
 Mon, 09 Oct 2023 19:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjZ2=FX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qpwO2-0003BY-Ec
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:57:54 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20a73433-66de-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 21:57:52 +0200 (CEST)
Received: from DS7PR03CA0271.namprd03.prod.outlook.com (2603:10b6:5:3ad::6) by
 CH3PR12MB9393.namprd12.prod.outlook.com (2603:10b6:610:1c5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Mon, 9 Oct 2023 19:57:46 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::6a) by DS7PR03CA0271.outlook.office365.com
 (2603:10b6:5:3ad::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Mon, 9 Oct 2023 19:57:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 9 Oct 2023 19:57:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:57:43 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 14:57:41 -0500
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
X-Inumbo-ID: 20a73433-66de-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRBqeYB75obSSLcvybMQXZCbWnm5/SJ3RXtJw+MGYMO2BXiYtKG85H9v23NbEXVvXPP/AeKQDVXSJ+cT57+ihUoOLw7sOwmFdu0tKgMZuNXXV1+QihrAy2N3lKtdbOZpoc9f4/b9rS1F8LM4tyEo7GtUPmsf89DFxYWLuKJ3HLKJPgDXZ8vknhTeVOnUHaqrnviEzbSmXShA9SD83GqXQntnvzFh6BnxxFozfibxAFzd2CAip91R2alFo5dgYll8jKI3IwmPtTZmNNDOmHvmy8h/nIzYAJxp8gifoQDQNPeUsm3z2ORGnT59vntpBhnp46oRWuk37Dh6gehPOWjhCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSZDHImSqdRuigQkfHjF59Q9D7kMTqQsrqFqKJCnv9I=;
 b=kCMWvGiNBKqfitBR0ZNsd9u6kw/iVbfDswxiNV5H6UM84XmkKBy3JxWI0/iYTvNe87lKxcHqo6ZRP6rJIuEj6omVhMV5/bbbKCVy+hqo5uoXbB09a4zOp51x6a40VdI/LqRgDIu+LVvvEjwsTv/22I0y8hxdXUwP/CH4ZJaforsorckwhXLD0WANgyoRgoKFJNcC0wi7xEJbMjG2Psb9wMlyUKzVRPXVCujiNXlHPy7nzlzCHpz1KYMTRbmeVP2RpIqDI1WcOGmCi5PlYiepluw11RVJGpEHa+D8Uel2pT2emKRWKPZZomUZUP9vBPInwzLOx3Q4A2RaBs5NWkyTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSZDHImSqdRuigQkfHjF59Q9D7kMTqQsrqFqKJCnv9I=;
 b=Ayd/0+WiHZx8jk0uGWPaqDH9uFubpt1xyJjgW+4esrscFhAnIXtwh6vLolYsyR7Lp1q4Ly2Kh9Cc9H9QNrm2kfRlKF0mNxUw8H/HUX4LAtvITh8LInMdTcWu9mzizvoLvyqhc3OuEa0J7TReZR/QdFpxD+14M8QW/hU9fed74NU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 0/5] Kconfig for PCI passthrough on ARM
Date: Mon, 9 Oct 2023 15:57:39 -0400
Message-ID: <20231009195747.889326-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|CH3PR12MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d27864e-eac8-4f3a-c646-08dbc90201c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zX0EITC9L8KAaFQmirf2HxFi8KkvF39iYWf8CLmtOFtpBnHcYI8WZJn6bLhKtNXpHqStdU3qG9ge/AWcj/syhC/JO/dMxBQGV70Qy/ZpRicIoGtnte+ue4ibi2RjNrdcBUzUAkxsU18bvYEJz00sjLQTxG02iLhHPcU6kt6zdscrtPWYxuT7IGv4MJla26s24PK3Ons0BxUfCfF4cAUt/cpNDqovIFOV+88M4eGqWtlNXl9YnGqFJhgynQ12Ch7+IlZGuQG9AYzXR2A01tBlRVlU9iC/W1tXnF5lmqooYvds6rilD+G+k1hEVlAuMo7a4x9asjQ/2yCkpzNu4UZERItP4Zgj2rVVL3F83pa3neGrXAGGD9aMP3gJ4teKQDGbdcq0X4PGwCxUBWvbtAXKak6AiAdFjPARMdUtvuKBz21YPPuklmYP4h6TFiM/PNwiuNFCnpQlcIKZ7tY/QE19XM6E3kNfVrw3mzubPr5ze1KcJu+kPfzgrOMm1iDN0RZliKU/+YXO+WsOmjql4NcCw1oIUmf8FEUzComQQivtg9P22lpiHhysd0z7GURyCkN0buCds6xyktn//Voe3ER9TWAJZPdOnlbj/2gH0ERLemBvLmKOgld49AkmYzFQDmUfNKpm0amgTGFqEanNpBz1TQJQuNsI0ERIgNuQpvhhwGmGVg8RXS7NZU9qWJ18jOl3b71S8RKPtnWBL/RRhi7OPfw/NcrA/WRFJhV2gewJd24e0zHxoZJ7Ud1bruAnQqhkF4PQ80uo7aaFyylAbueyCw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(64100799003)(40470700004)(36840700001)(46966006)(81166007)(86362001)(356005)(36756003)(40480700001)(2906002)(478600001)(966005)(82740400003)(5660300002)(41300700001)(8936002)(44832011)(4326008)(8676002)(426003)(83380400001)(336012)(1076003)(2616005)(40460700003)(54906003)(70206006)(6916009)(70586007)(7416002)(316002)(26005)(47076005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:57:45.8885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d27864e-eac8-4f3a-c646-08dbc90201c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9393

There are multiple series in development/review [1], [2] that will benefit from
having a Kconfig option for PCI passthrough on ARM. Hence I have sent this
series independent from any other series.

v2->v3:
* add ("xen/arm: pci: plumb xen_arch_domainconfig with pci info")
* rename ("xen/arm: make has_vpci depend on CONFIG_HAS_VPCI")
      to ("xen/arm: make has_vpci() depend on d->arch.has_vpci")
* add ("xen/arm: enable vPCI for dom0")

v1->v2:
* add ("[FUTURE] xen/arm: enable vPCI for domUs")

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html

Oleksandr Andrushchenko (1):
  xen/arm: make has_vpci() depend on d->arch.has_vpci

Rahul Singh (1):
  xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option

Stewart Hildebrand (3):
  xen/arm: pci: plumb xen_arch_domainconfig with pci info
  xen/arm: enable vPCI for dom0
  [FUTURE] xen/arm: enable vPCI for domUs

 tools/libs/light/libxl_arm.c      |  3 +++
 xen/arch/arm/Kconfig              | 10 ++++++++++
 xen/arch/arm/domain.c             | 10 ++++++++++
 xen/arch/arm/domain_build.c       |  3 +++
 xen/arch/arm/include/asm/domain.h |  5 +++--
 xen/include/public/arch-arm.h     |  4 ++++
 xen/include/public/domctl.h       |  2 +-
 7 files changed, 34 insertions(+), 3 deletions(-)


base-commit: ffa1437686712045953c33c5e77a4ebdd9973916
-- 
2.42.0


