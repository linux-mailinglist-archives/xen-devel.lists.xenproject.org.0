Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51026AFBF17
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 02:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035883.1408295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYvrW-0008QM-3f; Tue, 08 Jul 2025 00:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035883.1408295; Tue, 08 Jul 2025 00:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYvrW-0008Oq-0b; Tue, 08 Jul 2025 00:07:06 +0000
Received: by outflank-mailman (input) for mailman id 1035883;
 Tue, 08 Jul 2025 00:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uYvrU-0008Ok-3m
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 00:07:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2416::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 786d4730-5b8f-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 02:07:01 +0200 (CEST)
Received: from MN2PR20CA0037.namprd20.prod.outlook.com (2603:10b6:208:235::6)
 by CH1PPFE5ACC0FD2.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::629) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 8 Jul
 2025 00:06:55 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:235:cafe::3e) by MN2PR20CA0037.outlook.office365.com
 (2603:10b6:208:235::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 00:06:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Tue, 8 Jul 2025 00:06:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 19:06:54 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 19:06:54 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Jul 2025 19:06:53 -0500
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
X-Inumbo-ID: 786d4730-5b8f-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yze5HjCGXYi/9VbbFMsfuO3dZyBW+7vZakbEoyymBrtj82TYDaUWrEg0NY9vgNZkPYOs+DoEODvwgVUijx/JhEIGSYclpbWvz6hANmFQjlq5kDFhGnzky3I+FB83kFEpHo8e7pwy16YFPuT3tpvlGL2WbkANvGkn3dgNDetOj3T8VGbxKO2M/cwnul+VNP4BGU2PU3lmtELEYF4v7PUAN9eS4j2BPktJleau0+cOGZgVYohB8JVuWbi8LYky38zyQsQQopP2UVrFpiIRWcvsaf4CcmAmz2VGoE1FnmyXOuXSPcVysj5ZRPcuZ5C5NzT8iGcFRCqbr7Y41u9Wupu58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXqDQtx+MwJ6MTIuVr4J7uO5DCFgu4S044r6J2qqwv8=;
 b=mIxOv+pVaC2YRtUwE+YXCOpHttmnSzy9QGVqd2G7Tl+NineeQ6tvuDoNryVHMmiPqPkUbtAPfnw1KhmsRJghIxri9Ab4FbRBxX+qCKNbzecfWuSHLAaR6qs8GASyrBjdGPwmAHULOqVHkYk3aQXSmnvIWTBdthDKXILdcqKiOQoMERgq9AlebXw0k0DrRwYFojzt5C/5X5HsMnVepzptrda9krXUjGX6gdl9Qvv1AG/TxdJi8XHQuFvUrWkXVLGln6XOXMf82fPrxgs/WYEe6WaJvX198gsSYn1oe/x69tUlb0rE6Lv7Ul+zYFVACjEqH4jZHX5BOd4U181DY4TxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXqDQtx+MwJ6MTIuVr4J7uO5DCFgu4S044r6J2qqwv8=;
 b=xNPHKxfiz5FZRFMxuhYWCSKqUKd7R0HPQKabH7AmFBpkFkKCygIhe+OhPNA9wUBG/9UX/+DY6ZUUcxqIghueOcc/+TVGIHM6+fA4BUZOQjy116lLUqucqe0NbmCYDdcbXy16/+8WNFjJy7s4rLRYLM1Fn0pssOmqp87ohbXk4lk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Mon, 7 Jul 2025 17:06:53 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <stefano.stabellini@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <alejandro.garciavallejo@amd.com>,
	<Jason.Andryuk@amd.com>
Subject: [PATCH 0/2] Xen real-time x86
Message-ID: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CH1PPFE5ACC0FD2:EE_
X-MS-Office365-Filtering-Correlation-Id: bde71ce9-7edb-4bc9-3b2c-08ddbdb35968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?is2KJ3bcI4iDmMISPAYAeAtfLCqPemfElYZZ4A0tSG6+77chWInLGWCPPRkU?=
 =?us-ascii?Q?+mAGsJ1Ah0YMu77T9dk23VuPgzjZ4aGLMjotRnUTyHGmw/BjmP8m9foIs3Mb?=
 =?us-ascii?Q?RXsa7qSbBmpmmGOrrbWyzDA0Diwrrt7vcDIjlQ4ydk/x6ndB+67gLH+nNMQd?=
 =?us-ascii?Q?MqqEsPyAP/2QvGOiHCGdmbwQ7wZTHsyRWwzWmEVQUr61dDJT1HgNh9+YUNzx?=
 =?us-ascii?Q?TVrIwAURizgTWCQ11/z4m3veaR74SK9cvqi/0ZtPuMg8oeeDOkffBQjX+mn7?=
 =?us-ascii?Q?1X+lEbW2/ioV7iZ/36ICmx6yxyo3wHeQF28RexwGEJ11oyRaknkLKng7xwxy?=
 =?us-ascii?Q?pgpuH1xN8nSL0y/Fb9itlHRaKeWbykYVRUHOHVmM+kakRgWMctFqPe6ZPvC8?=
 =?us-ascii?Q?k5ovJiciiYNkaCMs+NYk0EWYD8MP4swFSjbah4CEg73Qg4x0SLy8OqQCzbz3?=
 =?us-ascii?Q?7CGJw3eL/AJuWkqllJHVAA9lf2oUfhJ6BE361+O2b0pGueHWA1wgWiohYIHB?=
 =?us-ascii?Q?XEEPn59qHEwZcYYfYZimpozpbh4pittSvHRWntF3usoMALyN2D/MtzFjzRNm?=
 =?us-ascii?Q?UN7jjidDN53pbhWLaYziaLF21LyBg+EL9qNSm/bv1biXlBrKwH01H05stP1V?=
 =?us-ascii?Q?CH2ORgUfBG3kP3COq1hRaDlE3qW3DmGTu2YVJ8K4J5yDLbxRrD7lyhyytELx?=
 =?us-ascii?Q?jnPWR7CWs5omop/2IMV+4toX5cFh7ccL6g3/Mqaz45hQRXTIP2wYnwZKJsXi?=
 =?us-ascii?Q?xNaw2kM0atmKr8SiBnB1v3bFKlXY4ffxVwRhDx3oNcsaIhEtfvAXYu8MMCiH?=
 =?us-ascii?Q?KKTl7aNY4hnTekOn9zitWfJHrsmiZK7tnY75Ayr4KU6Y7HLjLNGOXTBfMAKS?=
 =?us-ascii?Q?rbzRE+l2A9JIKnq+uOAFM//KsH1jo9E2CA0jYMCk13ldquf+fCYd87tdESjg?=
 =?us-ascii?Q?9ddn9FIRvtSROhAEjIgzZ+1ZW662NwsCya8LrWQTqLBCZMhZ7YBTqNlpZKYp?=
 =?us-ascii?Q?RKDKzHz3piPX6uwzkhr9ukhEAj+WlH1o6/SrN+Pxya5cdl7XTenbyVWdQOC1?=
 =?us-ascii?Q?Z3YDPSuIOV3tHKZlmgylZcLo+ocHDwqkUbptHQH96STa9rGeklTgMUijvUto?=
 =?us-ascii?Q?adhF6No1zbgNdlx5WwISywFDlibKWr1P4BPnptjwViq6MKy1CqZxqLl3LVVX?=
 =?us-ascii?Q?bQe8ieHeGbKN/3xEpqtCi5OHSjnag6Ztp3I+GOj61R5ed+sq7iZw8kPpxPPe?=
 =?us-ascii?Q?7x8Vp1l/9FxPlXnrOZJ7V/1iKODxGLHMrgj5eIRCiopFVIE1xbOb2XBX0bIc?=
 =?us-ascii?Q?vx/AEAwuXm+JicEflDS1F4PM8cbAgembe/VEme2H55th1dHsBPqcrPVXDokx?=
 =?us-ascii?Q?qeazAhnN+pEpFBkphqp5A27rEe6zVvyvVB5HXvO0Bt55j/XlNd4QWWWcT+Su?=
 =?us-ascii?Q?aKfIPtZuhBDzXXY0Lun0CciORWOOsr6FXOUaQAlN5hQ+EmbzHdlyq+fx8CCx?=
 =?us-ascii?Q?S+bsbIenBt559BjlBTckQFCFUom0kXWC6HRq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 00:06:55.2855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bde71ce9-7edb-4bc9-3b2c-08ddbdb35968
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFE5ACC0FD2

Hi all,

This short patch series improves Xen real-time execution on AMD x86
processors.

The key to real-time performance is deterministic guest execution times
and deterministic guest interrupt latency. In such configurations, the
null scheduler is typically used, and there should be no IPIs or other
sources of vCPU execution interruptions beyond the guest timer interrupt
as configured by the guest, and any passthrough interrupts for
passthrough devices.

This is because, upon receiving a critical interrupt, the guest (such as
FreeRTOS or Zephyr) typically has a very short window of time to
complete the required action. Being interrupted in the middle of this
critical section could prevent the guest from completing the action
within the allotted time, leading to malfunctions.

To address this, the patch series disables IPIs that could potentially
affect the real-time domain.

Cheers,
Stefano


Stefano Stabellini (2):
      xen/x86: don't send IPI to sync TSC when it is reliable
      xen/x86: introduce AMD_MCE_NONFATAL

 xen/arch/x86/Kconfig.cpu               | 15 +++++++++++++++
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  3 ++-
 xen/arch/x86/time.c                    |  4 ++++
 3 files changed, 21 insertions(+), 1 deletion(-)

