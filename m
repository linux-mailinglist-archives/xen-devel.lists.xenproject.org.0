Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA876877D7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 09:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488595.756727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNVHd-0004Dz-1E; Thu, 02 Feb 2023 08:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488595.756727; Thu, 02 Feb 2023 08:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNVHc-0004BX-Uf; Thu, 02 Feb 2023 08:49:28 +0000
Received: by outflank-mailman (input) for mailman id 488595;
 Thu, 02 Feb 2023 08:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8a/s=56=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pNVHb-0004BR-Vk
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 08:49:28 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e8c2c50-a2d6-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 09:49:25 +0100 (CET)
Received: from BN9PR03CA0635.namprd03.prod.outlook.com (2603:10b6:408:13b::10)
 by SA0PR12MB7092.namprd12.prod.outlook.com (2603:10b6:806:2d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 08:49:22 +0000
Received: from BN8NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::fa) by BN9PR03CA0635.outlook.office365.com
 (2603:10b6:408:13b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24 via Frontend
 Transport; Thu, 2 Feb 2023 08:49:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT080.mail.protection.outlook.com (10.13.176.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.25 via Frontend Transport; Thu, 2 Feb 2023 08:49:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 02:49:21 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 2 Feb 2023 02:49:19 -0600
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
X-Inumbo-ID: 7e8c2c50-a2d6-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekFfT8jY++frHPAdzxDLftK0xJsyhat1XmOaBf87Nt3t9DQ4bLlRv1G4sawboGhZDu/Ku4yWem6czwSO3uAdoiqqFFInggJ0QT7aGo6DLwDesGJgzQNnjq6kz/pluPFdc1wPZFu89nrwm1/jsgLQBsi2K3GsODrFTsC2id50pNDfTtq79yF5FASL3cjHuJyc8Im1+kbVvpH2B3dYJTvfOgIVsdw+E45OJlDkjC5fVStYlanON9EmxJROYyuDXAX8fW8lP4hpnI4Pl/EHyO1KLOhk/dMbS8TrjmZaYVT/oLe/Hpf9DtCIMZW7GHmrhL420OLbOBlECJpc0oZAIHF67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6Eo5jZUWqNLVzdk/vGpM1jEX2B1rRX1AXUhmQQCXhs=;
 b=BwTsKNk9iwvVGlEVpgEifjjfngN2uCjTxArBxM4T622sjhNEnPCX5GIU2wRk+JdBwDgC2hjNv5GGNznsoxI42HiRRrHPHMpPHtFBw8nR81kutNCPoDMvyuRjJqV5XWrsYRPEVw6B6QsoisZnVkf1PliVLlfjtL94I4NB9AgSXmJWJz3ZiL9v/0qlHMYKG1uANC1ntrcxnQz4B0U6OeDT77ChvdZw65/FX5exDHMxVWgedsY/zjIK9/72GXd2DaVAx5QLmrme/QKKtAsux6PbhK55Kpt6A7jjETgd0VKEdppY7WAsSXEtUCH+dOYTj1EiA4MPbT9hm83fUlTFcKmi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6Eo5jZUWqNLVzdk/vGpM1jEX2B1rRX1AXUhmQQCXhs=;
 b=g3x2Ww96wbCdBeWlxKZHWkg2zREUK0jb2pqRQtg4EmuXk0B8h9MJotgND8lyvbo3UQpoXxY5W3kYPJ8ofO6CLP9qtKCz+CMrQJxCecUVHqvxnxMFGTuKr3PCKdGmSwndaPy1HSC141Hk3Tq5CYyX0aXvgRNM+ruVZCq02RlnAL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
Subject: [PATCH v2 0/2] xen/arm: Support compressed uImages
Date: Thu, 2 Feb 2023 09:49:03 +0100
Message-ID: <20230202084905.6950-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT080:EE_|SA0PR12MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d1f9e4-7376-4f2c-c897-08db04fa60c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	carQG3Gw2jJm24uj+vddp0JZnsDMtW5qhf6S5aYxRVBM6X4+dMwrt2QAvI/1JnfIPEeNC+5IA/bikOlFIieHrwp+jLqV8gVhh3NroqrH8rtsq9APrXAm7ZDy+ETIR0amfIs87mP86thDzcRsg2qp3pGM0I5jCO+uJ6tlSTfJ4MVqdhj+uURw2pIaBY79Ol3LuyFIVBWxyZRmd/vN5EEAw73tuvJIrJYl2gFdo5wia3rjwzfumrPqQH1yIk73EM3DhJzCKRyvjNYweqZnvzbpJWbMXXo+cLMzZPCmMvM55URJ1Wp/fshc2ufd+4VOlKAAvXkTbVlCD1FBy0eostIAaYwOP05Cv/saUQHSpahf2+POBTHgV9kLNk9DcJkAMGlt25is2+sIM1alEkLbux6tp290nlnb5iYWNG3ujVfJ46ayHJHclhJAspaeIE7ZoX6A1tk1r9yb8xIfXWNc7CQrESeTHwRhwA9bvGlEZ0jr2F2DfYkYW6/Gpio+P/SMw621x9zCqG6xrhoTNVAT6RH/k/j4woOU5pVWrALnynYr60GOGQZ4hnk9SI4MiLzsu2kXNMLszbXh6uDGTMYl6gzIzXrQlMlD6/UpFjSTRawp7YVVotFmk5xcW3OV7eYPW5s369S73Z2weczHEScJi2i4TZd+6bIOEAnPPhkh9XOSDTxQjZ8e+KelFkWdfCv1EwoWRfUZAnxnpYkRQao7g52wrod0xtNkQk/RvZGO0K7MUqw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199018)(36840700001)(46966006)(40470700004)(8936002)(2616005)(54906003)(5660300002)(316002)(4326008)(2906002)(41300700001)(8676002)(70586007)(6916009)(70206006)(6666004)(478600001)(26005)(1076003)(186003)(426003)(83380400001)(336012)(82310400005)(356005)(81166007)(47076005)(44832011)(40480700001)(86362001)(40460700003)(36756003)(36860700001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:49:21.4432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d1f9e4-7376-4f2c-c897-08db04fa60c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7092

This series adds support for booting gzip compressed images with u-boot header.
Currently Xen does not support such images because we are trying to decompress
the kernel before probing uImage header.

The problem can be solved using 2 different approaches:
1) Split uImage probing into 2 stages. The first stage is called before
   decompression, does the usual probing and sets up correctly module start
   address and size by taking the uImage header size into account. The second
   stage is called after decompression to update the zimage.{kernel_addr,len}.

2) Call the decompression function (modified to take gzip offset) from within
   the uImage probing to avoid the split and to make the function
   self-containing. This way the only case for falling through to try to probe
   other image types is when there is no u-boot header detected.

In this series the second approach is taken that results in a better looking
code.

Michal Orzel (2):
  xen/arm: Move kernel_uimage_probe definition after kernel_decompress
  xen/arm: Add support for booting gzip compressed uImages

 docs/misc/arm/booting.txt |   3 -
 xen/arch/arm/kernel.c     | 225 ++++++++++++++++++++++++--------------
 2 files changed, 144 insertions(+), 84 deletions(-)

-- 
2.25.1


