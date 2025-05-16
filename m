Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85510ABA679
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987709.1372921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4Mr-0005cI-24; Fri, 16 May 2025 23:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987709.1372921; Fri, 16 May 2025 23:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4Mq-0005aS-VV; Fri, 16 May 2025 23:21:28 +0000
Received: by outflank-mailman (input) for mailman id 987709;
 Fri, 16 May 2025 23:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQOe=YA=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uG4Mp-0005aL-3Y
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:21:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bda57db-32ac-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 01:21:24 +0200 (CEST)
Received: from CH2PR10CA0029.namprd10.prod.outlook.com (2603:10b6:610:4c::39)
 by CYYPR12MB9015.namprd12.prod.outlook.com (2603:10b6:930:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 23:21:20 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::71) by CH2PR10CA0029.outlook.office365.com
 (2603:10b6:610:4c::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Fri,
 16 May 2025 23:21:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 23:21:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:19 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 May 2025 18:21:18 -0500
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
X-Inumbo-ID: 7bda57db-32ac-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axNM8jPWFowmv5DoR89xAkdDQYfU9k6vgFQ1kL6kyUDYPvqxsiJSDoEKmTaLdPysGI1m229rifQXUMeI7cJH6s+YuzLAsZm9SAzxy0aUjTiU5D9SECiV+FBtBXu2mig3scTqMgQ17xBfvHgrH2HGsyPrCHIbDNFYk4Yj6Sypuan5zoUmATeK17oTAROLS0YWB45qabB2GSJkCMXUd7+C5tiTtRchi+PedEKvLLFjaymw17u5rlj30SsVwpl7CeAgfq6K6uU5ndrUNQhwWiLk/j2yCF0bFOKRfjbimcItq7LdmMjoXa8buvJryVar+zhCvjDxmRUwNoHlSPiMO3qcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rw4/nff0CJxYiSOlOBcxXpmB+5/RpVGAfVJzqxDSIug=;
 b=MFEdArR/IHFjyXt+lbGpyukyu84CmDuUWSOnxNgrfP/qJ5hgWRS/7hUhMXmG8nC01tZgIr7tBMEyZ9EsTdeyyiFVLe4mGOgQGz3FZ2featAXFdStZTHnBp76vb1fM2Il89E4ZFptfWgRUXMbSXYvIMDLAZ5u7Rxl2SRkWoWLED1JNRbjxtRKQES69EXxaxf9b1krpf4Y8c49xzFlRk+pD3f+TKx9ZBMIqR4jHEfGjdW+kMBjE6ABDs0U9rYwQFy58SHFS5p4Qyaf9hnP1+V82YpSeAuoQPQpVbUpCBbOdDgZtGFkprdwH1jiCyxJ3nsgQq2fg/JVAzOCe1EY3DBaDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw4/nff0CJxYiSOlOBcxXpmB+5/RpVGAfVJzqxDSIug=;
 b=uDksWBD6W+312hGPGA8Quq0y2rvbhMn8hCgH4G4wdjy/UTTPJjQPRM+djwchjWLTs/UzpWQuLEzJOD5ZOSuU8wWaU9gJlpfYJBsm/WAQxy9ujvldWw8NcssNSz3T2ePbZ/q3TCWWsBlFvqzHJ0Po0HtWjMxtsJ8k7/JNwnHnGVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Fri, 16 May 2025 16:21:12 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <michal.orzel@amd.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>
Subject: [PATCH 0/6] MISRA D4.10: fix header guards 
Message-ID: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CYYPR12MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b41fdbc-6c45-4cc5-9cb9-08dd94d05d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eC4BKzz8rVVpWy+oJpO6kxGNlOQ0lk2JouL7YSIDlw3tg3Sxrkg5ioTxXyxZ?=
 =?us-ascii?Q?2HH4orzqiz+5DQQSXjU4uDAVf+8j2eBh4ljKPxiSZMgdrsC/JMP8YW31sOo2?=
 =?us-ascii?Q?T1upnHxKvbktktiZSsJyQB1Rch1zpcBQGJWjaylEMnUp0gQnCtBPdHhCf7/P?=
 =?us-ascii?Q?dDWwIVeM9opo5R5ddYb5BXOntezNp/lf/uu2KmHnhys2pMDMT+wavw115y9j?=
 =?us-ascii?Q?bIj1Sf+nKecKW8BLxUZNdKlBhE5d+tdc+5QeF09e1lDMNT8K5xbc35bQn5IR?=
 =?us-ascii?Q?eMEykMJs2iksGLkMNP7enU5eXp0GhbX/bSyYarhOWIoVqhlFREdsmEw1ztbD?=
 =?us-ascii?Q?LgJ/QHPOP6GP1hLDXCjgP/EziiB7lS2jrBvWHuG1vGiknTYL1g6D3yVqaKhq?=
 =?us-ascii?Q?NBqnq2KPhzRqacSVIZpxZEdlZwrGByXcCYf4jFtkKGS/haVYC0KYVFWocS5j?=
 =?us-ascii?Q?eWYPAHdC8t60+q56UF5DlfWGox41Wx+P5IeU5NwfFKo/4mBCZzNAjd/up7Co?=
 =?us-ascii?Q?tmAWHZgC/bPEzdxmhvcJZdGx0qnz9YaYPYVVW+wzoijHRxzdYrzYAo/tY0rU?=
 =?us-ascii?Q?yZ+jBqpCoDs1DOFCy/+E4FWHDyZuA/z3nqB9MnBz5+e8kyCzTHxetFYLMZO5?=
 =?us-ascii?Q?G5EbLKBCcvimdiadXwoKAv7erbC8awKjOzHe+9q90qAyOHGJeLKNVl+UnTAG?=
 =?us-ascii?Q?QtGrG+GGCGqoD6q5+7oA+fzbnR9UiC3VskwnB7ApgVLaXDZpxua34qfWj2DK?=
 =?us-ascii?Q?rkKqcefmWSIdb5vDoNUQh01dCAvX7Yc6k+Vs/FjF+1YSy0NFL1xZuCSKT/r8?=
 =?us-ascii?Q?I/qzcugZZgxifsVrN8vuBsKyyApJmrBkxlXk+IyNTxj4kZWZnWTf9zK07Oms?=
 =?us-ascii?Q?fONlDkCBWUf83Z09b+9bQFAB5u34KdeY/qDIr2eh9WtvdaP8YfiAqVP6u2vA?=
 =?us-ascii?Q?Lcwkid+r944137nHKcm9QD16ommuZQLuF7qBLpamq6Vzk3Ml79wK6QGEGN+e?=
 =?us-ascii?Q?9AFfILx/K4mhMDQLJFWjo63ZpHtdmYJ7FNenU7jW+HxXv5XMsqK3CkzMdeJX?=
 =?us-ascii?Q?hXXU7+wg5HD6J17BO1PEQrvSrJjashrvX0Q8FI+V7hLjdH39nxe4XvZaSxoU?=
 =?us-ascii?Q?t1EsRFmooPqRne15sBLjARPg3suET4uvLRRDvqbdEtjgWRmafaobiByXOpQ5?=
 =?us-ascii?Q?yeCifr+jZvR5jwmZKWdrEEHAsmt3eLgp03LKZAfqOnOd9BzChP+k4EvilLuq?=
 =?us-ascii?Q?ydMg5Uo5kwy6xtoMJKiZTCJLNt/vgIvvIdWqducRhtcjYw9sWdBl2C+v7bQv?=
 =?us-ascii?Q?rrZ0UjiI39IMVedRmrVcUbxoOUvpm6RtW8uvVjpH7VKF/KyXUeNiROJy6F6w?=
 =?us-ascii?Q?arXC/hazUKCtQlxhhmhGffbX/0xjMbQrmVFExq3ysaMHZsWLnZef2hwOK4hR?=
 =?us-ascii?Q?K8ZQUM3wYuxaPke2PJoB6syN6rDb1KgwFgHAHv2csyjjsd/ThK391usMpDVl?=
 =?us-ascii?Q?gTLrMSxL0etoRszXlPZMbcNj+haMyzH19zyG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 23:21:19.5590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b41fdbc-6c45-4cc5-9cb9-08dd94d05d50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9015

MISRA C Directive 4.10 states that "Precautions shall be taken in order
to prevent the contents of a header file being included more than
once".

Fix few remaining header guards, and update ECLAIR configuration

Federico Serafini (6):
  xen/arm: add inclusion guards
  xen/x86: add inclusion guards
  xen: add inclusion guards
  xen: refactor include guards
  x86/asm: refactor inclusion guards
  automation/eclair: update configuration of D4.10

 automation/eclair_analysis/ECLAIR/deviations.ecl | 14 +++++++++++---
 automation/eclair_analysis/ECLAIR/tagging.ecl    |  1 +
 docs/misra/deviations.rst                        | 15 +++++++++++++++
 xen/arch/arm/efi/efi-boot.h                      |  6 ++++++
 xen/arch/arm/include/asm/efibind.h               |  5 +++++
 xen/arch/x86/Makefile                            |  8 ++++----
 xen/arch/x86/cpu/cpu.h                           |  6 ++++++
 xen/arch/x86/efi/efi-boot.h                      |  6 ++++++
 xen/arch/x86/efi/runtime.h                       |  5 +++++
 xen/arch/x86/include/asm/compat.h                |  5 +++++
 xen/arch/x86/include/asm/efibind.h               |  5 +++++
 xen/arch/x86/x86_64/mmconfig.h                   |  5 +++++
 xen/arch/x86/x86_emulate/private.h               |  5 +++++
 xen/common/decompress.h                          |  5 +++++
 xen/common/efi/efi.h                             |  5 +++++
 xen/common/event_channel.h                       |  5 +++++
 xen/include/xen/err.h                            | 10 +++++++---
 xen/include/xen/pci_ids.h                        |  5 +++++
 xen/include/xen/softirq.h                        | 10 +++++++---
 19 files changed, 113 insertions(+), 13 deletions(-)

-- 
2.25.1

