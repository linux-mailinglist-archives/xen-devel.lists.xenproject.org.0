Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AAFAFD67B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037151.1409812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZD7X-0000Ea-76; Tue, 08 Jul 2025 18:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037151.1409812; Tue, 08 Jul 2025 18:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZD7X-0000D9-3G; Tue, 08 Jul 2025 18:32:47 +0000
Received: by outflank-mailman (input) for mailman id 1037151;
 Tue, 08 Jul 2025 18:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZD7W-0000D3-27
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:32:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2418::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef371c2d-5c29-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 20:32:43 +0200 (CEST)
Received: from DS0PR17CA0010.namprd17.prod.outlook.com (2603:10b6:8:191::26)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 18:32:34 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::ad) by DS0PR17CA0010.outlook.office365.com
 (2603:10b6:8:191::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:32:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:32:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:32:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:32:32 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Jul 2025 13:32:31 -0500
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
X-Inumbo-ID: ef371c2d-5c29-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCfYFjF6gYXevadzcm0m6kgdDTbtNt0EawAa4ATWA72K3jOuSzqcYMVO1yr3Ndb66aKD+ZBnQ6fNM0yCoWk28LFRK+YV3Ev3FceZWAUU65O6d8rr846elvrIatKcgCez9jiCGEWIJtKit6ycC8cgbcj9mo3U6W4Kxr1xby84XVwYrM8W0wGjqpzcc9SfB9tlCyz+gqAcIaNSVzRVPljIklrS5C6CzjZjwdiF4D1AfNDJGv87vkMY1Kor+h7+vr0EJrhyo8y0Cwmp2juFGHxtGTfff0CSLJDCiLxeO5zvp5NrmbPjw+egUVp0ou9LqIymZZ/2OZ6ws+uMnH8qpwbPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDzK2PaLAxehE4jqToTbXo9SpSv7K9LLsBbDs0bVq3A=;
 b=bDqTXEz0MzZ1VaUGqGpITatjO+0cl+CEkoA1czjL9twR41MP02yQCrZJ6D8TXf2sK8Z7tv6Y+JAsXDG81IOhNT3AeeDsWfIF6Y5MN/OfmESPwIUuJzbb14RCoO1xGk/FrOfAtE/o2/nhSd9i9Gj8RajfZUsCkVri8Lh6J3q8yTDZLOEzcG4MAo/i1q/5r8IfiDk1/69XwLv6jiadMfTV7gB2R6OjTDQIlkZZbYWnJTYU/bvPcP7qlrIrXIFXiGhMfH3tlen23f+2XvJKYV3sFFSnXxg3KaEWsvFrwSpvCkPEywMzQ6FSod89RAMcaGGs/1IE1z5N0A3JADdwFubAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDzK2PaLAxehE4jqToTbXo9SpSv7K9LLsBbDs0bVq3A=;
 b=oOk0lFfI0e1aMIzcd4vBqOw3DEnQ29umQsQdW8ldJMAqPn0euHANO7asOntHO0R6VayyhUdyeRpWmV6dNhTj1Gt30sCu/2zIxQ4vetQFGTHqZe1LcFjQNFiEr3eX3mRLSz34xrtC7s5NqREPp88SKieBbGEE1AJmmHi/o+rIx+U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Tue, 8 Jul 2025 11:32:30 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <stefano.stabellini@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <alejandro.garciavallejo@amd.com>,
	<Jason.Andryuk@amd.com>
Subject: [PATCH v2 0/2] Xen real-time x86
Message-ID: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 75239652-a0e4-4d9b-eb4a-08ddbe4dce06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1xBHhGz5W3OlzHZvPO8Sy60d3UGWNKj8XKI4SkCh5iadykTBCHH1pYqQ6T/a?=
 =?us-ascii?Q?WvCzzYhUOqXsEpalf2R5mdLiqwj4Y/1ggLRW1JZS/BR+Z+UyyPnPZ3+iY6xQ?=
 =?us-ascii?Q?rreVx53GXPpr55A5nmuq+Qa5DbX/7MiNTY1z+VxxP4z5dlkSysHwyDy2YEw2?=
 =?us-ascii?Q?gKL6XAO1uuOWPbQGjLKVGKvBSgZCPyZOWMeIBFYoo5n0XzfSbY4tHS9MKvIh?=
 =?us-ascii?Q?0EWTbPBRKffs1d+3iCxdcTnFAQ6nWwYdxowYGCzk6SG4hW66vT6paAU14M42?=
 =?us-ascii?Q?IhW/v9VozBDAJnGVNVKf5PxrnmkbxCkkC+x2TwcFGJH9T6SE2RJvCkecLGc+?=
 =?us-ascii?Q?1OMr9ShH4efJ6jIaxFrRlQ17aIvjWZfEpiz5iSDARSCpIgW0uWuFXnpxbj87?=
 =?us-ascii?Q?zWX6BPGvMiTXSazzAG5AlnGx9QAOlh9cKCS7PFJPwOwNHVcamMhc0To/NkSZ?=
 =?us-ascii?Q?nuL0ja7d+gTeVEWlxwJQl8UiHfH2LVEIBywknj0Tod/g3cWprIHqv2ByJfS9?=
 =?us-ascii?Q?MdQZQWksmnrcoh7XvFCi+Cte1taoUszOZOWdG2VLvGIV44f9W2rNxCgdgdxw?=
 =?us-ascii?Q?ZEDPybrbGVAAWcJWv7KWgzQKa32dsOAHAYphTuORLUKGk8UMPFSwK1BOl4uQ?=
 =?us-ascii?Q?nymX39K60pziakFYaT3O7ZG31VeKllC4ANU03uaSTT+B4L/qM06CUSEVM/6W?=
 =?us-ascii?Q?ivF/vxIqhFqk55bOxVnNjMaF9GqlWy6s4mvDJX54y4AMbCrdJ0H/jeGbHAby?=
 =?us-ascii?Q?Kcsn9OQFFQvsi8Y9CpLnOA0I1wgyZpevgm4yf14uXrS5oYseXOkye0qKEzDq?=
 =?us-ascii?Q?F445BuGmr69r+CtJSMMiIPIkJZXYXCch5qbu2Dhq1fvXa7yjjGNGsniHD7jH?=
 =?us-ascii?Q?sc6xTmFdoTXz8dIragGPdAOzSKh+QKGsOgL6ogyYytNX86fUNi1bqgkRT4G/?=
 =?us-ascii?Q?eqpnUw3JiM8I49z5cCmtXEeJtC1TEkfZ7LR1xlY6t9QHLZQ8YPFfJ2s4ufY+?=
 =?us-ascii?Q?/eqCI8ASCye+4sXPU330GrKvjutCudYdjMHNsHdr+opQaBdG3uU+11CQB20F?=
 =?us-ascii?Q?c6DlriUvADZh9iiSVHePZUvik8kP0D5m4FufHGlEg8mH7v1WS5ZmYYHvnzeG?=
 =?us-ascii?Q?QT4HASCZofbXIVuNZ38vkNhJ2TbedoX620PxBGzydhQ0a9BTH1HbDZ96X9Fd?=
 =?us-ascii?Q?zYM5oD+IU0ZBzWpD56+Qzvf0uS6hGsBE2fchT6rP/nwPDXL/JiLUlj8ARWyw?=
 =?us-ascii?Q?1u6Sva8qXr8qOqB0hCOmgi4i4Uge2o/+GUmqMeq2qrfliQ9PuhOm1BWHC8SB?=
 =?us-ascii?Q?Jf+EdrMRxO3Qm8rgKBX5otXaaOiFy4rWv0P2QH+PUZaj/slMJQbMDRsJRJK3?=
 =?us-ascii?Q?4WcFhF46N7mu8OYOZUoAXy2TjL5Ij4QyhstHcFnuClm5QanlIrmw0suWvxoU?=
 =?us-ascii?Q?SSvZQ+n46G4Z3yFP8tZktH+BaHfs5z1/knJPi0yVFz7LT1RHbSyR552KBKup?=
 =?us-ascii?Q?iLJmX2nL+JHtq/ubyQ8F6d+fxHaq/DJ4ZZLF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:32:33.3982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75239652-a0e4-4d9b-eb4a-08ddbe4dce06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

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
      xen/x86: introduce MCE_NONFATAL

 xen/arch/x86/Kconfig             | 14 ++++++++++++++
 xen/arch/x86/cpu/mcheck/Makefile |  6 +++---
 xen/arch/x86/time.c              |  6 +-----
 3 files changed, 18 insertions(+), 8 deletions(-)

