Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09479A870
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599433.934857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhSf-0005PX-3F; Mon, 11 Sep 2023 14:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599433.934857; Mon, 11 Sep 2023 14:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhSf-0005NE-0T; Mon, 11 Sep 2023 14:00:21 +0000
Received: by outflank-mailman (input) for mailman id 599433;
 Mon, 11 Sep 2023 14:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S94K=E3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qfhSd-0005N8-9z
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:00:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 882ca240-50ab-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 16:00:16 +0200 (CEST)
Received: from SN7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::34)
 by MW3PR12MB4380.namprd12.prod.outlook.com (2603:10b6:303:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 14:00:12 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::a7) by SN7P220CA0029.outlook.office365.com
 (2603:10b6:806:123::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 14:00:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.17 via Frontend Transport; Mon, 11 Sep 2023 14:00:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 08:59:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 08:59:56 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via
 Frontend Transport; Mon, 11 Sep 2023 08:59:55 -0500
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
X-Inumbo-ID: 882ca240-50ab-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFwE8wRgid+5U5CEuhAuZdqHDIHJ2/7NGmAh1Sa9KtnzZrNzglDaqr74DLtWvmmFL5Knp1+nFIw69Dq0uNNivvASR1fR+u6vVLzf00WDnO7FyTCpG2lF7yMawl9Vg82vbdvT0uuaUIa6zUxiT7yG9dJi8r+rJVRibEKYP3tuxWrzs/Vqr2ly+zbHGTJF8j4mb/cXfjKUlHUAHS1J2biA717Xpwf5BzY/02oUiiRFwGpdGlHSHBsn808xUOVqlYy/L5vjkVklC7n3jsMoLp7S2tAS9Ad1sBcdvz84YM6D0iLxkLm6UMhv9raILWjAfIVoG6YAHlQH+CxxEstXF8Xc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QJNZ1fs5zGlW2Mef6vi6EnkUOoTASFTwNcCnlMh8WQ=;
 b=CO/1d2vgz2JHK4nb2Ry4ioaagmSBH1S+7vRhFikGOa9+GTduJlZts3U0MyifescEGpsM4aRU4FMPFUw7rqPn6xSUg6RxP+QFWwZvNERzvdBMUdVFx4CZoeCTZ6WaOObIVo6mm/ywEFmLv5Rs8ilIJ7gzj6ZSYbminHK5R/J1MQ4jVoqFBSpz5JHWY372qJtUQXhs4izjonz4mjguvASrheWdFXuriX3qcHBOtmc2cO2gGCDNYYqcppXAOuVzsB9pd3G44oHls32RTFgd26nZYEOn9c1dnUtSK1TF1a9hP8MxUG560l2Ehe1naW2MWbTjoQLIUfRbY/S6b72Eq10dVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QJNZ1fs5zGlW2Mef6vi6EnkUOoTASFTwNcCnlMh8WQ=;
 b=OzYvpZsxOtYxQx/tCcpg6/Rpit8r+DDdV5OUy1omKCtYlkjurNm4X0/aWwz004ot3vMbj74Qhwk8184x7sYkJmi/xg4MvdyS3PlOH61Q470+QX4tCVisqV4krjyfzDJCh/huPynNwAlKyEPJp87nEUGiE+XDBXDDYrFfGMaa+0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, <wei.chen@arm.com>,
	<penny.zheng@arm.com>, <henry.wang@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 0/4] xen/arm: Split MMU code as the prepration of MPU work form Arm32
Date: Mon, 11 Sep 2023 14:59:38 +0100
Message-ID: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|MW3PR12MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: 37418180-d3aa-4d1b-ffb9-08dbb2cf6ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	am9dTSa4DK5pdr8ngr1GueaFz/5cbpdVGdhGihaux0tIG1DxKOWA15V1JrGlCMO6KQ25lEW9q2EjiV79NtsdXg05K9SHLd8Slw0LzaO5Kv9YNHqNEMKARcKloFC7+1/UUWPWYA0CVtmTgqWR2JMZfJjq1wQCFO5zOVTXoN2mOBjKREkSyWdmIR3Y9FXzTP4IDcoM6C7T8i4bz+xbUIwn0PEHH5ISrXUQcEpTbuf7KwqnKxOc14ff5C0wTU6txZvq8CXoDyEbdMrE3AoaS6YCYdzhKJRvGxy8hL6uroDHPNGBHJ8MFlvNh7I3WKVYAMiHzPIoGJlva3NINqezlLgA84rLjv+r8O/lFUOELTCyte8rZyi69XuBUGuGh2/RRQRPp/HhxOHH8Q0r6B+13nl5ghiyWfH3nRjqtYhwEaYtGxEgyf7Zp24ZZ8zuy9FUH+c+/JP3uk6t6Rklt/ASaDnjroDLQ0cU3bavi7vWy3qyYdRboP64f2tCYUom1al4VB6ZdiOgitmSfXjUL/SDWTH0D+azI/Gdjkm0/iRv7OfMIK1h8pBNxU+tLQzhnLejAewSaTlNXXNepAPOBF++2sMcM0WWKuEL0iV/Fug+wBB0dpsYfy+yPUj9Orn8n+mw1/VwRZmIPk1k/57WgpEsML4EgBMpmewFXRhGySqD7joZIFlQ2EvpKK6rUpN5sSzYhPldmfb6n1QBeVhtU/LOhEkEHwfPpXmsGXFkRFPzj7ejyduJ814tjqW5yNbwOExYM057gEE3+keD84Xw4aAhai6lUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(1800799009)(82310400011)(451199024)(186009)(40470700004)(36840700001)(46966006)(5660300002)(54906003)(41300700001)(4326008)(8936002)(8676002)(6916009)(70206006)(316002)(70586007)(40460700003)(47076005)(81166007)(478600001)(36756003)(40480700001)(103116003)(2616005)(6666004)(2906002)(336012)(4744005)(86362001)(426003)(26005)(1076003)(83380400001)(82740400003)(356005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:00:12.1636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37418180-d3aa-4d1b-ffb9-08dbb2cf6ac3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4380

Hi,

These are the set of patches based on top of
"[PATCH v6 00/13] xen/arm: Split MMU code as the prepration of MPU work".
These patches aim to do similar MMU rework for Arm32.

Similar to the former series, this is the preparation work to add MPU
support for Arm32.

Ayan Kumar Halder (4):
  xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with
    other MMU functionality
  xen/arm32: head.S: Introduce enable_{boot,secondary}_cpu_mm()
  xen/arm32: Split and move MMU-specific head.S to mmu/head.S
  xen/arm: traps.c: Enclose VMSA specific registers within CONFIG_MMU

 xen/arch/arm/arm32/head.S               | 567 +-----------------------
 xen/arch/arm/arm32/mmu/Makefile         |   1 +
 xen/arch/arm/arm32/mmu/head.S           | 556 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/macros.h |  62 +++
 xen/arch/arm/traps.c                    |  17 +-
 5 files changed, 639 insertions(+), 564 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mmu/head.S

-- 
2.25.1


