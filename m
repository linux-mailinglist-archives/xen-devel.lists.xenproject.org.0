Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BCB3743F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095128.1450237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uk-0006JX-5M; Tue, 26 Aug 2025 21:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095128.1450237; Tue, 26 Aug 2025 21:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uk-0006Hk-1F; Tue, 26 Aug 2025 21:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1095128;
 Tue, 26 Aug 2025 21:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0ui-0006HZ-BO
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2415::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5eae505-82c0-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 23:09:06 +0200 (CEST)
Received: from BY3PR05CA0022.namprd05.prod.outlook.com (2603:10b6:a03:254::27)
 by CH2PR12MB4102.namprd12.prod.outlook.com (2603:10b6:610:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 21:09:00 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::cb) by BY3PR05CA0022.outlook.office365.com
 (2603:10b6:a03:254::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Tue,
 26 Aug 2025 21:09:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 21:08:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:08:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 14:08:58 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:08:57 -0500
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
X-Inumbo-ID: e5eae505-82c0-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJkcfBWy7cncnOs3wBm9Oi3YghuyZzgATxNufdUpFsYZ6bt0qHenFdYpd1UBZ98COtHJeby7mrrodBvFowTavaMj9PEXIfDRq7ugyO9pkpK/PiYTq2PAkkBaSaswD1GjaFG3CEkEwEGmsyB7Njdc87Wgn3I66E4R6QUZj5Af+v4O9h1goagUewxZ0D3KZNs8OYgnD7mTI2Lc6ef293FkNWEP12uMIxq80wMi0mRTUfhOYuiYS5vCVQponi0iVk0uT/npbpPsu40EeMJVnjs9KG811OoOSvy0VipbOSdNTQcf9WN81REgdYkEOHwIge50Pcxf79dbgJNPK/Fzs+GCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLDVZsW2vOynKmFhkjPwuLl8ue1HLr8SARqLFSFlnsc=;
 b=nWu8GYrgEinjBPV3ZnsQjQHx1BpEyt5XZbouP8dqnmKMkFRsvrClvJ9SuAR9bazOPMQBqmO44/svGxUGfJ+Iv9sfyPDJ5v+kJxRu8uoqCFEvTLYuJtOlEuURiCnJiJFdQeD/Mg0HKaoUcA372xX0X6RiI5K1dnEEo6vtLrj+6jIcZWUMnZvZ3C80lEQOrtU0eM3WiNECmEkQtnN6nCnOVYvhDs4m1U1HG7GpgNZgOEwAmlLwuH8ThFXL5faGIKJdG03rT4ZaltO5EJ9nixVBEJTxBzaCl1/mznCTzrFD49HTWdgDgTh45mFhzFR7cluwckgE/JyYSo4da/7yr2J67g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLDVZsW2vOynKmFhkjPwuLl8ue1HLr8SARqLFSFlnsc=;
 b=PUxkkOMW78Q3mUjR5nv5Y2UnoKu/gPVUTZRYW21owDSMJDgSXNYNtPggincBwdE1xWJBEyY2mRfHxGdXnbFN7Uzn147w9ZqbOZ5aO85VlBRfFG/fEW0i2RK6MvgWoyIT6JCGu1LS3sDEO0vu0kmaJ4e2bOaBy8MLSangD6JEgAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 0/8] init-dom0less and dom0less xenstore evtchn
Date: Tue, 26 Aug 2025 17:08:39 -0400
Message-ID: <20250826210847.126015-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|CH2PR12MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: 8855f2ab-0583-4a2d-fdbb-08dde4e4c6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PmuwEXJ0DLXHkNmsuzDjOk5fQycTDV6ySf3FQ7qLHNf7WMGIMaFl5/LQgJjp?=
 =?us-ascii?Q?lnxii4nDuIrOUQCXEbPRNPCSuQEt7ufsVMJTiSeTs1ag90AX/52cnGSCB2Lh?=
 =?us-ascii?Q?T5zgTT2/yM3ZDQujbKXgDa5P+sM8Lypgvgwbgo3r3lIhZVkaOYvtOkJSR1ow?=
 =?us-ascii?Q?rOSIb5dIe6svs07hdWRpTa7d6e6qjpLDbnTD8PpdVQ+JxTRPfTCI0bxTfMkr?=
 =?us-ascii?Q?2973Q8zUPQl0CuxeRXBG4WakxTBFAcnNQqKgqf77rg40qnbP8gD+fFqs7lrv?=
 =?us-ascii?Q?sy4iaSCTcN//mmHZdfqqm7WRx2GF4QgdbHkeFkSsGc7ENUQjV5iYPn2cKSeO?=
 =?us-ascii?Q?wg2lLSKMrYXjRSplbYhr4eJVtjMdikQ7E23I1k9CB4D4Bv4KFixu1uZsknaZ?=
 =?us-ascii?Q?b15CsiK7lYmCumsSike1sNRwWLl6rwfaEn74kuvZT3rzV0n5xWqzpwTkZCaD?=
 =?us-ascii?Q?Nh6SJkT1EfBsLml9RZXfJaaQmRMgOY2LWdzaCPrxIzI8U60Ox6HuN1SJJWpH?=
 =?us-ascii?Q?I7qT5jtZU0w0JY8rX/DiznSoB3MBImJjGZcbWEdFLBIso7B6frDTHtPitW2/?=
 =?us-ascii?Q?KEhZ0BHuvYDtcneNeF3mfVQj6oip6W733TveW8JmlmmYph4rTp9KbhQuTnKE?=
 =?us-ascii?Q?B9qrcwmA72nU0uHF9yNgDbzpoPSR99nVV7KYfx2IFkBJWQ/4OBmf6Xe9bbh9?=
 =?us-ascii?Q?sJ9Qfm3DpnKfDvmFCr8Jc1mhUmQb0ODDbjM5L41e+c1IMAw+DluIq+V5TIxw?=
 =?us-ascii?Q?/ozIHbm5l/CEOnozz1hm+QWgA/vjPL8PKQ2rP4ZYDG4GGoeTU5VWF5phrKYd?=
 =?us-ascii?Q?LYewCYlc+cpfs070CrrIua7P99mmDiMdvC7F24KY1NmIVX2z2fB0kDbdK7jX?=
 =?us-ascii?Q?nyh2CTEEBRqkWYpyEWennfgK+kQ9HNGkcJ2rHF/Z0ROl5R4HxnS6Mp7anCkd?=
 =?us-ascii?Q?IFN4RB0o6SKrL5wcMv4vi9/8p7COZoZAiG59fLnaREB1esgA8bzX+b1w43dK?=
 =?us-ascii?Q?eg0+bmr8t5Fqn73PF1QKTqUI/Tk8OYbEJs3yATr2bqQUNUQOZYpPQfNQerx7?=
 =?us-ascii?Q?3TMv5HM+MkWfBZKTG4sEQDcwjVcz6X/sUhVaBcsUv1h+WB0djRIK59nb6jAU?=
 =?us-ascii?Q?TVYEjq3WSsuRr6qfaZSP7RQnnVh0iMk7yDS57plPYH4R8WcWkFtmjOLstT8q?=
 =?us-ascii?Q?DpjYnF2e8nPbtiJInm6Ajtx/GMUEpTzQSj0yOYik71b6ifMJBSmN5ud3/0Ez?=
 =?us-ascii?Q?ofPtdAzAglk8FvtrHdTU562y6sYjw+6l63zw9+PVeWl4FNBRek1FgdLJBL2m?=
 =?us-ascii?Q?3xVdeQQWc7ABYO3L4RGk/AVD8rtAp5gYiiB7uvY8DAyIrensLmQ7RQy54rOx?=
 =?us-ascii?Q?vBOCQYmnzBOGxZIjLn/j7ruay+BZjbCcskfC7hCfz8QRsy4p4dw8vFGS/8nx?=
 =?us-ascii?Q?wtL/wXiyeZgzzNXAoPxvku/vUDyxQWxbiiYimo4t5gqu2G4NRaZ3Beexau0p?=
 =?us-ascii?Q?ohbHWQ+4MgEzm5THizrUOc4qwQc5okltR+9X?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:08:59.6033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8855f2ab-0583-4a2d-fdbb-08dde4e4c6e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4102

These are the init-dom0less and dom0less xenstore evtchn changes split
from https://lore.kernel.org/xen-devel/20250716211504.291104-1-jason.andryuk@amd.com/

The xenstored changes have already gone in.

init-dom0less needs to be changed to handle auto-introduced domains,
which this series does.  Once that is done, dom0less code can populate
the event channel in the xenstore page (which triggers the
auto-population).  The previous posting's ordering of "xen/dom0less:
store xenstore event channel in page" before init-dom0less changes would
have been broken.

Jason Andryuk (8):
  tools/init-dom0less: Make handles global
  tools/init-dom0less: Factor out xenstore setup
  tools/init-dom0less: Only introduce un-introduced domains
  tools/init-dom0less: Switch domain_exists to check xenstore name
  tools/init-dom0less: Use introduced to determine no-enhanced
  tools/init-dom0less: Remove use of err()
  tools/init-dom0less: Continue on error
  xen/dom0less: store xenstore event channel in page

 tools/helpers/init-dom0less.c           | 127 ++++++++++++++++--------
 xen/common/device-tree/dom0less-build.c |   7 ++
 2 files changed, 95 insertions(+), 39 deletions(-)

-- 
2.50.1


