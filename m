Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76867AD51
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 10:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484013.750513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbks-0006sI-8p; Wed, 25 Jan 2023 09:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484013.750513; Wed, 25 Jan 2023 09:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbks-0006qI-5y; Wed, 25 Jan 2023 09:07:42 +0000
Received: by outflank-mailman (input) for mailman id 484013;
 Wed, 25 Jan 2023 09:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbaQ-00012q-VX
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:56:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7eaa::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16ed3462-9c8e-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 09:56:48 +0100 (CET)
Received: from MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::26)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 08:54:50 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::da) by MW4P223CA0021.outlook.office365.com
 (2603:10b6:303:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 08:54:49 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 00:54:48 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:47 -0600
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
X-Inumbo-ID: 16ed3462-9c8e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBr7wPoI9gyrbG/Lls5evEW14t00tRtwoX2TDDfOxEzCLOtGXQihdXSTeq3cgwiHNdGz9rPb4RHYMAqJ6SEArSUBo3908fXz53DYJTqUrSu+ZghrJbASeGI+7h64nBC1A3czsVTlegfNCDxAaiS36ZbO/cH+3FKSLPc6GHaNNPbtJivHmsPcsaQINQfYjZ0Od9Fd2PkgE4Xrjs8bvUgSgYeXEgkARskt9GJjPKBsZVgURcDMCtrnS1VMjWBpTCFyGvCOtszJVD7obAoOgM4nW1qbc1pI2482gPOVVNgPf26QQRqvR9szm6CaQ0Pt3VoewjWHksWaExvva6qSfxQwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmpuP41Ztn/lKlMcuw44+3sOiW4TYVQ+KI34gBksLz8=;
 b=TBld6471/HQGm7V0G/POxlUjS9XAXjpca2gLogIJ/1C4iIJRZrxzQ6K6DNOup2GaSLCE0KjN7LWqKlWTHT2ub33SWqbKus11bp1tjNlt4XmGnfMzKrOg58UbSALALPP8ixSrQraYWCa8v/33P1o2W0b8gvbJXMjGz+5WB/0v0QwTp6cbuamdhQETBKcwya9EmRv+P2yvz3yI4ZoIVcHfR343kdOi+m+b0iUc1p5G49AMit+8xB7IhxBeUqL4jl9IJ5r/Imq77yIrjNABFRYvkqk2+JtZ97Rv/ilplIz3spKKO+QPMjnYm7Nt3Ri/E3Sb7hZ1YNvp5GS6ZizkeYtrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmpuP41Ztn/lKlMcuw44+3sOiW4TYVQ+KI34gBksLz8=;
 b=xMW7ZuxoqDm7ruV8kMuNoAwdLg4q9yMzU4S0PUpd1mPzrxABlzgt/e/ElDUDeYNdct0jiJcpnntG3Ae8a1ZBHY6SWzlmQJ9CzlriJ+3P2FFXa9UFk6WWgClYO4lFud8jYE1e7PjTxdFFXoRzzXeqjwTPBJ8snzhIhoG41jL1sbk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
	<berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [QEMU][PATCH v4 08/10] meson.build: do not set have_xen_pci_passthrough for aarch64 targets
Date: Wed, 25 Jan 2023 00:54:05 -0800
Message-ID: <20230125085407.7144-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|MN0PR12MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e33193-298d-4928-0a9b-08dafeb1d136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JrU+L8fHBezUmbiy8yLf6TqoYHDBgtn2b8vkCyyZy6Cw7RyRyOj1eynGgBhTiJXoHZExtTbeCH4DW5DMM2l/8C20VVlsoh9SKysux2HmfHwq9pwDbBO1OqbJoaIwg0HXxNvCWJAb4W5OgCt/4Uzjv0hNKCzSFXODa1zLmOMc6WtSeNkGYRdAFEpLY9L1IhPUxRXQIL8Dm7JFO7vZanKQG3VhZLZgQwfpeH3Eo5NcwJ+JsIs0Veb2uj6+Xa6y2SOx+h5KYMuo/EUFB7INnb3Anx+s4V0PyVBwiRyHPUAhVmvM7FkAWy5TcBQovaWvHD4P8TLEqribioPtdeqqm9dMUK0iJPd/zGxNOd0Ytz110aIKlyEcpGsM1Tl5LpuoQykOOJeAS+yf5SYSMehkn5U/9WG1DQw1NOymkQa4JFN1FqqF1Md9N51pfC+GVwlKKn9HJ7pj4zN1ZjGVkL7SdNp9epGWwoHxg7RFvR64GTN48ZmPlAACbb5dZF0YY+BxVXTcvoDHJei8bVVYu57V1kItxZLc983OaqG227guANXDrRlp6tBfg2F1vm7jBwEEZqAyboA9nEHmBnbsDiKPEiMKLgbdhhsGyfncKF/91I7HUIwg8g9W0UJbiSKbaFsCsWr/TbMShen5Je1/yN2MdLuHRbTO3MUc/uJI8i/DOhyyBFwIHo7+Lr6S+lcmGl6h3zDwnajPDVwtJpvAVkYt3SHNQoPhSOTYFafa8CpSKGZbtFA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(2906002)(70206006)(6916009)(70586007)(4326008)(8676002)(41300700001)(478600001)(1076003)(6666004)(186003)(26005)(2616005)(336012)(426003)(83380400001)(82310400005)(47076005)(82740400003)(316002)(44832011)(54906003)(4744005)(81166007)(356005)(86362001)(36756003)(40480700001)(40460700003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:49.7274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e33193-298d-4928-0a9b-08dafeb1d136
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836

From: Stefano Stabellini <stefano.stabellini@amd.com>

have_xen_pci_passthrough is only used for Xen x86 VMs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 6d3b665629..693802adb2 100644
--- a/meson.build
+++ b/meson.build
@@ -1471,6 +1471,8 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
            error_message: 'Xen PCI passthrough requested but Xen not enabled') \
   .require(targetos == 'linux',
            error_message: 'Xen PCI passthrough not available on this platform') \
+  .require(cpu == 'x86'  or cpu == 'x86_64',
+           error_message: 'Xen PCI passthrough not available on this platform') \
   .allowed()
 
 
-- 
2.17.0


