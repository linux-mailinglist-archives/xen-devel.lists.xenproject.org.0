Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97E7F292A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637605.993550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NKA-0003zL-35; Tue, 21 Nov 2023 09:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637605.993550; Tue, 21 Nov 2023 09:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NK9-0003x2-W3; Tue, 21 Nov 2023 09:45:41 +0000
Received: by outflank-mailman (input) for mailman id 637605;
 Tue, 21 Nov 2023 09:45:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqtY=HC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5NK8-0003ww-Mj
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:45:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9c8fc30-8852-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 10:45:39 +0100 (CET)
Received: from SN4PR0501CA0017.namprd05.prod.outlook.com
 (2603:10b6:803:40::30) by BL1PR12MB5780.namprd12.prod.outlook.com
 (2603:10b6:208:393::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 09:45:36 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::d4) by SN4PR0501CA0017.outlook.office365.com
 (2603:10b6:803:40::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16 via Frontend
 Transport; Tue, 21 Nov 2023 09:45:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Tue, 21 Nov 2023 09:45:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 03:45:19 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Tue, 21 Nov 2023 03:45:18 -0600
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
X-Inumbo-ID: b9c8fc30-8852-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/40THl0N7xPzy46O7eH/PGV2aN80eyqWlV1RXL1Iw5z07wrlLOuGO4oIR8PMR85oTiTOBmsVV8C2vh7+xAhwTXi+anIqrIpIYst2uGL+Dsajv5jzrxN75vzcKp1jnKDR/BxiF6lgCLvVRvcXY8f45p82sE6dKYNKfatSIOamlamoCOMShf32Qk4Giit7QFBnE5VIWZELF5BuptknwUrfEFsxXO5vcgckPoiHOFB34FgpMyNgpdRV/gfyeyeqObJX+kJMh/xGGkRdcsQ9aIzb7cWkZelmDXByWaCIGHh2E0kq5sQZ27dfSHib41jO1vYfIXvOKq3bGPGUOmBv5vaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd1z/kiXuVHj6ejWQQOTzFWBSK5cwd3D/NCuyKV1pGc=;
 b=mOKb5fEd/OAMtn2NqmARTDfa8181GBFZ3AVcD4jIjb305axXIx/AWQPyOQwvE2NUHWkKpQMxMyGYzn/QIAJ021pvm+kQqE62WzEDdi+WV5SIIaP4LnboQblTn3zLssXoD0WXsCqYQtFCcA8/xJBmy+gEIVLGUryHzw14QRyKan2Fhj12ZF/SyZig8qAJfqy+IWtwYs29Q6VcUc9U2MBsyJY2c7+RcD+ywxz04AtCmPfwyxehZAHSqnDzYoSRCb8T0MiHEcdLsnZ9QlpJS3f05f/ZpqqW2LaPw7SVzfSGqwHD9QVwR5OoqHTvDRnmcs0dMTNTHcV4NU1vVwLbtqh58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cd1z/kiXuVHj6ejWQQOTzFWBSK5cwd3D/NCuyKV1pGc=;
 b=BoiTEP1LRIQJ728kujnqFfAJhjdI8GpBev5WDb3+By/cLxQZjFNL/8CCBn4e+sqkoAefpa3QmV5QLDCM365KCbj221D26LeqFXiPLTG45Z1cPsnWyOS3BK4LfpT9QnoXCymxvRc3TBxYk266fSKicOFbIUk/RYT7BzcogXgWiCw=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] xen/arm64: head: misc cleanup
Date: Tue, 21 Nov 2023 10:45:13 +0100
Message-ID: <20231121094516.24714-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: b12c9ff2-4d16-4ddf-b0a9-08dbea769c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TrTNCv+VVHV5lJNJ0xSmDq116JCA0LdAcICnp1tp1fptVC2+ZEdECJXq+BHEfRs/Pc3V0RR0Th0pP3Txi1E9sQ8r4g0imfuUAUUevAPZepH23rriAnmWK7WENK4vEPSr1YtOthYP8Crw8/XY2dfeh+bz0VI9z88RHLV5Gs/73nn19tKBPwVhiTwA04BmIbsTMu+Nyqr7+iMA4Lk+0N9FY8MeFY2Z7LRzrzptS2kmj/sN4mEZbno+EDUBAUctw0mh7WiRjSHkJcitk48a55PUuJAr3F+ak+/7jjyWF058FcSFnOzhp0tBXqXdxHvttYfYcXWFDOpMKxZhDgMVh/R526I7Qt7hIh1HLZ4WM3tE6lhKf2X/3jIqC2arKXjHF9Ro4hovJ3LOu2RILjwCGS6BZtND3pJq/cK8AwnSFKpqgmOQscHFrQZ7ywHfYdkWB4eldLNEKie5lmNbbFDyC22FeOHKPLxiYka03Slc7sIquVfOQ522hSDpaqpmUaMEGxiZNOZ1AI6dMy3iPcPSDAj9pjJebp9Q2JAWWdzABCv26Yz77PQb05X/O5lTDoR2wfwkNH4m41XFNLCJuqz6GWGnEV5fRT1qShWQU1UsNBIcEveIPRuI/qbuKRfCFuIv1yXoTPonK8GFo+n/tIn9rEs4zMfFdNv0qaA06PCQ+VOud/jIoZZmCfQmXl8uDXscKU19iyBI2vOjw1K17rwx6q25D+RhTHScy+UewtLQKDo5QbNy4xQ3xwizQQfhOXwvgK7gznnfmOGgvDQZPgPEWkadYg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(46966006)(40470700004)(36840700001)(40460700003)(1076003)(83380400001)(426003)(336012)(26005)(36860700001)(41300700001)(8676002)(4326008)(8936002)(47076005)(2906002)(4744005)(44832011)(5660300002)(478600001)(6666004)(70586007)(70206006)(6916009)(54906003)(316002)(36756003)(81166007)(86362001)(82740400003)(2616005)(356005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:45:35.2923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b12c9ff2-4d16-4ddf-b0a9-08dbea769c5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780

Some cleanup and improvements for the assembly boot code to make the behavior
more consistent between arm32 and arm64.

Michal Orzel (3):
  xen/arm64: head: Move earlyprintk 'hex' string to .rodata.str
  xen/arm64: Move print_reg macro to asm/arm64/macros.h
  xen/arm64/mmu: head: Replace load_paddr with adr_l where appropriate

 xen/arch/arm/arm64/head.S               | 37 ++++---------------------
 xen/arch/arm/arm64/mmu/head.S           |  8 +++---
 xen/arch/arm/include/asm/arm64/macros.h | 15 ++++++++++
 3 files changed, 25 insertions(+), 35 deletions(-)

-- 
2.25.1


