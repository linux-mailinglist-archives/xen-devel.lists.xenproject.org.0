Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF18AF396
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710908.1110482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIkA-0001Hh-Kf; Tue, 23 Apr 2024 16:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710908.1110482; Tue, 23 Apr 2024 16:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIkA-0001Fi-HL; Tue, 23 Apr 2024 16:11:42 +0000
Received: by outflank-mailman (input) for mailman id 710908;
 Tue, 23 Apr 2024 16:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ID6+=L4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rzIk8-0000jr-Kv
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:11:40 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29d8e028-018c-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 18:11:39 +0200 (CEST)
Received: from CH2PR14CA0009.namprd14.prod.outlook.com (2603:10b6:610:60::19)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 16:11:35 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::25) by CH2PR14CA0009.outlook.office365.com
 (2603:10b6:610:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 16:11:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 23 Apr 2024 16:11:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 11:11:23 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Tue, 23 Apr 2024 11:11:22 -0500
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
X-Inumbo-ID: 29d8e028-018c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT+T4xvda4xkiSzm+D+W4bJGg+tmH/ifELXmjQmUX3DPd5b3O344OMK5I+O6GmNSt16NmHEk4lOH77ay2TPL+P31HWYqMqxW87xize7TQQztdA32WkA+MtvKC6VVbY6Gq+zcvZYTrCkZROFd9dTwJPZ0TwEUgw8mvqJ+hZg722beqQ4PznWRLL8PqIG3zbB0UQJiN5uB5DKNIxD2srkMV70Gam+KCrPNhW2Lxizy2IXotlfmYY2lDZLpyc5324uli7Jdu0KqWayhD90IxR9CUlvuYtrgWDebgyYTAskzlO1uEW15aNdzOlXu3LJSSid/2G4G+LlN+20IIYZbJXEOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5HED4XGgXNT30w9u7EIEfg4awv8EU5XK0kCv9rwuQ0=;
 b=hlNbYd5qIP4bjdfP6R8zHPc/zPagEc+UJi1Wl2cmRGJgAxAnF5sAIFvSPggGaVXiL6YmQCbwbDD3Dis+LsXKMJvsUGDzZzrlz1ysDLl45EuJ5qDp3y+dX1zYr5iOfzBnY9rNQCGVs3lz6kO2YsisJbnmwaU11SaybUX3pbC/pZ/Y5LjiexZB+I/obhRPTPUzxi2zO2MZ9jd3hh2o+KkmGXmlTOaFdEJBsxUDRX3NBQy62RkrhOHVBn40g/2F2fJ+lxP/7XxhYj1csldaSFpiR2k/ilARbOoGdtnZop0XN9Ou6HKmacX3aXTmqdEDtHUUBNJoMCAzx+j7J8iS3ZEShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5HED4XGgXNT30w9u7EIEfg4awv8EU5XK0kCv9rwuQ0=;
 b=n1hvJ3gfHUvJeP29QZ5QolTzxNIEPaq67MtnEUEojvNdgZClXmZY/aQ4FQgEgHBSe7RpMic3I6fXpq1dg4fHt0xoH9HW23IM4MGEg6Sjvq5Y038GtdmeEm+s3HwNRQq8k+lZ14Wbww4gbmHxTMHiNZ/DzLDr53Scl6Vvxja7Qwc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/3] automation: improve Arm coverage
Date: Tue, 23 Apr 2024 18:11:18 +0200
Message-ID: <20240423161121.138536-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|MN0PR12MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2899a0-3fbd-4f4d-6e79-08dc63b00b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400014|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SzXVKFe9E1cBHAMlvuEVpJaHMn9Wl60jZrGmRIQH6AGnaa6Af+y+HeHz255N?=
 =?us-ascii?Q?Z3KHMNGKBXbFyXj4OnasfVW9VWsuANoYoHS0ULm+dhurORlUWT22jwlgGv4X?=
 =?us-ascii?Q?gmQVk5u4pfN58TX26J3j0C/W1z7KLT6zDwIurCnk0Tnfd/UUlKlqBE1f6FPq?=
 =?us-ascii?Q?3fbfnNGjLiHfgQf3ULqgpLZEQsRzCo7GlUiUXr2cPJrjkiFedntfE/Rd94Lm?=
 =?us-ascii?Q?z2oFwslkEQscjqUTETWeizvpt9XiPtsdF+5Z3cAbUnphvPcLo7TUwCR7nbDO?=
 =?us-ascii?Q?yAKA8O6x+Fd51mOx1PPiZTpktb41XZv+KCHY/R5WSQPDNkN7mEPJPgQk7ERr?=
 =?us-ascii?Q?ps1i9yWFxK59NBHq8jiO3RaK0Hi3Tc8Bts98c1wW+NPgHxxdzpdyZwQrBuF6?=
 =?us-ascii?Q?2Znq4YYprSoZ6MiKiXrn405bJUdLYKj+8O/vAefMhYRT2V/EKjLAuxpS+8Ek?=
 =?us-ascii?Q?ti3SpjL8HhVf2GjeDJuZr0zoMh8V1fjZLpq17SU+3koIICoIfeXlOGr4W6T/?=
 =?us-ascii?Q?o0qAy2FS2f4emWjl6GGBGkfMl/Iuo7Kq5ZgBcveCdlkDjOIuGPsIIyR0QLLM?=
 =?us-ascii?Q?lJwvlgSVQ+51xcQsz+4GDyeFzhASUbG0bkLuHMfngKEpjaJKBzLCke/lvKfi?=
 =?us-ascii?Q?A7s8EUKl7D7DgRDm7CjfPrYD7EuxToTexsWGd0ROU7GIPIdhql69Hu2juyCd?=
 =?us-ascii?Q?WYlDoPDgyrcxu+9zE8nenuyircJLWSEbf87cRTRn4rsQWoVA8kOFfTAExrWG?=
 =?us-ascii?Q?m4LBfYdxq8o2xo+uG2FFjQqulypTOk/Uz6DgOokX9XXCxK8cg7FcJLfCwwbb?=
 =?us-ascii?Q?ZsaOs/2LCWWqrQGs+uFTji80NIVw37WDftvLehMVZoF+6PrJq9oOaI6PMWv3?=
 =?us-ascii?Q?lBCCE1Cro3wm3BbfPKWsxYnbmRfML0SBdvjoZZyEfOCuJ5sOt85PMyojsw0L?=
 =?us-ascii?Q?CItaqqK1OfZFCtlifUCXuXGzQLd6PlJ4CDF7TON7yNa7H00sk0QdrdVu2Q0F?=
 =?us-ascii?Q?ze6zbNl39KRhBKFVJtcQxV9UFI6YnQh1fm2YkCPiTvRe3asHtVS9z4xkbeJW?=
 =?us-ascii?Q?RGuME9/9zAJvdOC3R1QnjH4bS95x+ENyyZhTe3wB/XgOaOthNgxWw+XtNQnH?=
 =?us-ascii?Q?Uaz+9VZr2U1Fu2jXK12/hXJtCnOGMqfmYQDw8fySCeOxGF6S6t8BJPouHcp1?=
 =?us-ascii?Q?okZMGRj2xG/w+HmUFpJsrz1ZoT1Oy7ij0cXuu0VdfLWY2Q+w3Y7dyhII96y+?=
 =?us-ascii?Q?ZBGdItfo83zyig6ChlPB2jiNylfILffv98yA4wP8ieRKjeTM7zemV6K5LWkd?=
 =?us-ascii?Q?UkvsI4h2jaSMEOB9YVVbCdnbUmkqk8pEt0JHQqKrksNotZWuvew+VaWrimMZ?=
 =?us-ascii?Q?BxUgG24=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 16:11:33.7240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2899a0-3fbd-4f4d-6e79-08dc63b00b7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365

This came up as part of the following discussion:
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2402291108290.853156@ubuntu-linux-20-04-desktop/

Michal Orzel (3):
  automation: Drop some of the non-debug variants of the same Arm jobs
  automation: Add arm{64,32} earlyprintk jobs
  automation: Add arm64 test for running Xen with GICv3

 automation/gitlab-ci/build.yaml               | 41 ++++----------
 automation/gitlab-ci/test.yaml                | 56 ++++++-------------
 .../scripts/qemu-smoke-dom0less-arm32.sh      |  7 +++
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 24 ++++++--
 4 files changed, 52 insertions(+), 76 deletions(-)

-- 
2.25.1


