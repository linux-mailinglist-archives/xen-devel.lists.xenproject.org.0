Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B86797DD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483524.749712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKILD-00047z-7R; Tue, 24 Jan 2023 12:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483524.749712; Tue, 24 Jan 2023 12:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKILD-00045R-4g; Tue, 24 Jan 2023 12:23:55 +0000
Received: by outflank-mailman (input) for mailman id 483524;
 Tue, 24 Jan 2023 12:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMs4=5V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pKILB-00045L-IY
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:23:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f55bea82-9be1-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 13:23:51 +0100 (CET)
Received: from BN9PR03CA0953.namprd03.prod.outlook.com (2603:10b6:408:108::28)
 by BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 12:23:48 +0000
Received: from BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::20) by BN9PR03CA0953.outlook.office365.com
 (2603:10b6:408:108::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 12:23:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT096.mail.protection.outlook.com (10.13.177.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 12:23:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 06:23:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 06:23:47 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 24 Jan 2023 06:23:45 -0600
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
X-Inumbo-ID: f55bea82-9be1-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiasAKgtQArF6j70wJj36I+BASH5iPP4RNLgrsuhsWY3IsarcpJ16PGwwzhjp0yW5bKFkxB9QBAHTemAN8Uno7uTDempEvrpAic6Xp8IS2/GT/zeG5RjSAdw8oCbW23k7DOW/kydbHK/lxn1jHpzsfZS+48ltpc/HFm0g9lpvGxc0906moqgXjzubDWqYDiWfnvDzDT/HRAU1vmx+6vvNuLsq7039M2fwkhyeyy5Ji2w70sgmPoSrP8K5ZKqXwTxMd+gh1+Rps6TYrc/7pFU9HGZP/Kha6ZBEU17yNjJDKf4/YOGdffAIYoN09nsC2ZEECQUbAfQ6NhCSw5SUwDbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNRhILNLfqW939U1RmkLOBvXHj+NzLs7DVp5r/4+RbA=;
 b=Ann4hREntyd3d2BdpjGgm57pS65EWe0Ar/IdFbFTWJSEVMEehQrPqDbJvS3POKYyKIsfdBOT74eK7KLbqBkNFYCj3lczpwtmwvDZfatBe0SQTcgD5D266+fkpo5+1QwtBenjhwAhPSkxK/cDATlrkdc7bb/v90ExuPqMftcUPqVXuLG+sMSe2yyN11t4tx0XHmYb+htzkiSSqv2BwotAYqHavethDjzISkV0K0rsPJ062fUJP98x9fwHWXd9EXIOcdT1S1DxtF1rlnvquy1T3xNE0SLZS+FE4lY+JEmxnwuRJ+Zwvb9ffiN1bhBm5f/IMHQY94+UtuZxw3zLVyI6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNRhILNLfqW939U1RmkLOBvXHj+NzLs7DVp5r/4+RbA=;
 b=JuaMcYM0UNjHx7LCQbC54271lAT0ZX/JyDBdFg9mZCkLaroeqhBVyCBzwZ7v+2mrmtYL/SSqniDuwbxnr1jMi6YqyClhePKRDEkD5RX49ZQz8y9YZCY5OHac4jIYV1Uib40d6gqUE5h6ohBokOBT6JsNIV0lpC37dTirv11xAeI=
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
Subject: [XEN v4 0/3] Pre-requisite patches for supporting 32 bit physical address
Date: Tue, 24 Jan 2023 12:23:33 +0000
Message-ID: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT096:EE_|BY5PR12MB4308:EE_
X-MS-Office365-Filtering-Correlation-Id: 33618034-cfe8-4c08-2b56-08dafe05d827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UhbqywAVyihLhRPrchx13O0Hzt4A0/4KwQGGBX83fqXpnFSMMpukjZklySRy3rOAvR2x6aS7bwUdEp7KHlG8Lisv4mGdsONqfC7wxTysxwyvjDj4wKwK3yFmbEp54EDteNupPzbt+H1sT04YhWSTLRrNxfk9/M+h4lPxTwomLKUBlCdBduMBeba24SlaHBghNHQoKgDF7xM3NUJv7hagdTM9XuQf8orYqQLSGhmCqaM3ZyZkro+f2FtjZjEqj3MuyNqSNMfeU4vfmijC2ju0BPX6w5wkpk+nB7Ho/H0baiJvBv6sDObh34Vc3Xd2pJnUnv8tQGVkztb9yNXsyInartiV6m21TOsGa2yjQE+gEhQ8SidHzC5XBnaFj0y3DUbWEYmoy/jgF27GYvJcvaDTzgVRnuTp5IDy/fbTYwclUE3symG8Fdsv7lVGugfNQtTkF98pbh4HYNUs5v5v3mitCwe6ssiphLSS/AFKWI0myfYYjLB+EudeM3ONxzURSpU+K8llDc+iGrAb+Y0wK+CSM+doBL9WNHmNujgVw6PBHMcj0Ea+w9Tlyv7KZ7iLqg0479bX7+hCqVRiZHVdkEvTMGmugVXphUSNXHIvqyZaGHOSJmKn4GZRmfhXkS8SEO7sEkBVY5Z3H81OimT9X3nWd4FkWwPacVnzn9ceJnzAdDgwvyJGiZM9ksf6an4T8dxlx1Ltpl7m+rKyYcgnbdl3ges+VHJ+7ngYubF02XZ/RPs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(82740400003)(103116003)(40460700003)(36756003)(356005)(40480700001)(82310400005)(86362001)(478600001)(316002)(336012)(8676002)(70206006)(6916009)(70586007)(4326008)(2616005)(426003)(47076005)(54906003)(1076003)(2906002)(8936002)(186003)(26005)(41300700001)(36860700001)(83380400001)(6666004)(7416002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 12:23:48.0615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33618034-cfe8-4c08-2b56-08dafe05d827
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308

Hi All,

These series include some patches and fixes identified during the review of
"[XEN v2 00/11] Add support for 32 bit physical address".

Patch 1/3 : The previous version causes CI to fail. This patch attempts to fix
this.

Patch 2/3 : This was pointed by Jan during the review of
"[XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size".
Similar to Patch 1/3, this can also be considered as a pre-req for supporting
32 bit physical address.

Patch 3/3 : This was also pointed by Jan during the review of
"[XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size".

Ayan Kumar Halder (3):
  xen/arm: Use the correct format specifier
  xen/drivers: ns16550: Fix the use of simple_strtoul() for extracting
    u64
  xen/drivers: ns16550: Fix an incorrect assignment to uart->io_size

 xen/arch/arm/domain_build.c | 64 +++++++++++++++++++++++--------------
 xen/arch/arm/gic-v2.c       |  6 ++--
 xen/arch/arm/mm.c           |  2 +-
 xen/drivers/char/ns16550.c  |  6 ++--
 4 files changed, 47 insertions(+), 31 deletions(-)

-- 
2.17.1


