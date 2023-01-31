Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB7683110
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 16:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487703.755362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMsKs-0004CX-SC; Tue, 31 Jan 2023 15:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487703.755362; Tue, 31 Jan 2023 15:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMsKs-0004AI-OI; Tue, 31 Jan 2023 15:14:14 +0000
Received: by outflank-mailman (input) for mailman id 487703;
 Tue, 31 Jan 2023 15:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPLs=54=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pMsKq-0004A7-U1
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 15:14:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8f91c62-a179-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 16:14:10 +0100 (CET)
Received: from BN9PR03CA0849.namprd03.prod.outlook.com (2603:10b6:408:13d::14)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 15:14:07 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::3f) by BN9PR03CA0849.outlook.office365.com
 (2603:10b6:408:13d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 15:14:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.22 via Frontend Transport; Tue, 31 Jan 2023 15:14:06 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 09:14:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 07:14:06 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 31 Jan 2023 09:14:04 -0600
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
X-Inumbo-ID: e8f91c62-a179-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYii56VkzqS28+UZJPaiPTJ3BV7q/dBkvxecgbeT+maRwUc7TL66wOCBWEikEybUhLAVkSCNYRtBcUG4sh32RIMRyUH1tsDMMibRU+CKDNOqtJfCrMvLi7l6BMOuoqxrK6xj78OIwbXh5kQQsvTYep0JD2Dypod6FzSfhOK9gULZb5dzvhEVnWYqh8WVR/SsYMZFS4IVuHe9xcHs4Ovml5PD6dQf4c2+tskbqUJ3FJasLLKQ7fFiKl795328WcvjUtI/tzzMnBDsUvM9P1UmdDMZR62SaG5OzPaPXBesnb3W2brTfi3vtqJr6i1ZkybmwpO8dCZzEUayONj6K/QBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N3qgUPJKYn/L7cjGhSZmyThGymjVPPS9OBhdt5y28Q=;
 b=Pg0sm5+MBd9Mdb3ajk9LGH2gEGHxSqwW9DPnertEJu5JDNo4DPE4pR+Bnwwx2jJ/SeoPTTGIVlxQwGjkDda6WOAoVyFk1ICjMFDK/tOFGSloXc6O/8FiTpynNn4/unnPWi2JirHUAJKTseFxo6sGYMLiZlemtOTPmtAEwjUEUMf0gNZ4MjT0pBQ5a7pfjitN9hgHIzJVVh07eig6MTaESmcQ55hmBEc4MiTCnYqwd8FwrzIg+E1MkWWwWiQgorx5/fNtDecxjxuznyJebYXXNK05243bweEZI/VzdwaJ5VaH+1jBs2kgEIf6xOIk7EwLtMkz7+YuOHn/Wo5aoQezOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N3qgUPJKYn/L7cjGhSZmyThGymjVPPS9OBhdt5y28Q=;
 b=paqseHn8+5tvjZdO6pMZUprMjIy19Ewb39F89qxSzy66L0I9oVYw083NNU9g+1f3nv6jzYnQ5kawlEUaZT+RmHkiIADKuYpmJkw2KltZfWqXc7gXL14Dngt5EcbwCrlck+syqu+ahEp79Zx3vi19bDR5or+fuPUa3X08hT6deRs=
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
Subject: [PATCH 0/2] xen/arm: Support compressed uImages
Date: Tue, 31 Jan 2023 16:13:52 +0100
Message-ID: <20230131151354.25943-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT063:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d53bf81-94d0-4f00-17a6-08db039dcbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OqGTT5C/VDwgnwpf0P706Dfxryohy3a1CEK1PSNo6+lmRtOF3aqwDVQjJow3WX6rjGOTPwfD/Mo3aVuGOpUm+0Dnqltl++4oXu2s/nnbMNGxLcaXRcKJLXbgkFPUf/hX4MBLpkXEWH3UrWolF3UtR/Jw0k0AfNPNvJbM//WWBTs6lpTTFEOaeqLjtc7UNQ9JvLqfk4hxzrsP0/LMdCIUwZcLwbGEsuPtqaWBpTePpH/sWOv/ThzoFB8ZKfZrAKrG0TaqfKJaAij9H5JzvAUzjHoTSN14FN28+ZTBdZwzY3CZlfZO10V1ZDBpNoa0z+fgS/9b1ITTNrdDdOR8ISv3wYnDhiMp001D6ImuSs/Gkvj33N3U6th+9Vw09/jIaO7LE0U7Oc8SncRhVANv33+O3Zmm3G8tmmMnlHVwbhFB6WiJycqLQshF4D8y8duji+tKcEJ/rcxS5hIXQGTnWiLMV/0GV060RQceEscxEg3tJs0rkh4RYkTIKviIEclArr4/Xwwa955jDwB7lxV8zkdqO5Ab2WGYZ3K5IiLcHfI7wcZw3qy++JBy2CcvN0RAl6q+cKzi79193s0nn1oM0ycZIculvb3IJ5yAULp2Rj/tahSaHiMJQK5agPIDrnIxuJ24lH4ws9kITnfS5XSE/5nI7bgfCGCPFqArza4bKDafY9obfNA4FYTDYPgvyPCj6/jei2J4hNCOkvlGerq0eJ7y2R8lReuzKLYgtw/82yWpbus=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(36756003)(40460700003)(82740400003)(316002)(5660300002)(54906003)(426003)(336012)(83380400001)(356005)(2616005)(47076005)(86362001)(40480700001)(81166007)(82310400005)(26005)(186003)(2906002)(478600001)(6916009)(4326008)(44832011)(70586007)(70206006)(1076003)(6666004)(8676002)(8936002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:14:06.8060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d53bf81-94d0-4f00-17a6-08db039dcbe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144

This series adds support for booting gzip compressed images with u-boot header.
Currently Xen does not support such images because we are trying to decompress
the kernel before probing uImage header.

The problem can be solved using 2 different approaches:
1) Split uImage probing into 2 stages. The first stage is called before
   decompression, does the usual probing and sets up correctly module start
   address and size by taking the uImage header size into account. The second
   stage is called after decompression to update the zimage.{kernel_addr,len}.

2) Call the decompression function from within the uImage probing to avoid the
   split and to make the function self-containing. This way the only case for
   falling through to try to probe other image types is when there is no u-boot
   header detected.

In this series the second approach is taken that results in a better looking
code.

Michal Orzel (2):
  xen/arm: Move kernel_uimage_probe definition after kernel_decompress
  xen/arm: Add support for booting gzip compressed uImages

 docs/misc/arm/booting.txt |   3 -
 xen/arch/arm/kernel.c     | 197 +++++++++++++++++++++++---------------
 2 files changed, 118 insertions(+), 82 deletions(-)

-- 
2.25.1


