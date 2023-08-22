Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076478375D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 03:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587987.919406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGDv-00013Z-Jf; Tue, 22 Aug 2023 01:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587987.919406; Tue, 22 Aug 2023 01:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGDv-0000zK-Cj; Tue, 22 Aug 2023 01:30:23 +0000
Received: by outflank-mailman (input) for mailman id 587987;
 Tue, 22 Aug 2023 01:30:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiiM=EH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qYGDt-0000x4-9o
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 01:30:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72979f87-408b-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 03:30:18 +0200 (CEST)
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 01:30:13 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::1d) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 01:30:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 01:30:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 20:30:10 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 21 Aug 2023 20:30:08 -0500
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
X-Inumbo-ID: 72979f87-408b-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP0zm67+1B4m35uORS/grVn/DkDd8FJeh/nsU2MVb9nFeuBO4CFZXXbAJK9xEjxiTLf5Zqi3eLlg3mpYmSG1wdhRs6PfJYSkNjJIEqagJpBzIy5t5PL82xo8glOTIWiCbOcT/7bmGR8R4M8GKxDc4y4FEMXLyLobp4vJPyck1rCYdSBh1fxr1DMweFTwLS4bxUX6ofBmWRlyq94wtZgvt1c1gO/zvTLCYSQs9k+exSeZ5Z4BLl/Y9vHetkecJ5Ervk+++uqO+bWdOURZIynh+IheyMF1OwiXWvf5XQjwtKZrTcAdj1A0baCnHO7N5KVhisMJi07XEjWzE/e8mhCCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VL6lMQVeMDc9PDrdGemq8BetWEBzdrBiDPf1TKvHKwo=;
 b=n34YAKLAvY/z7MH9KQW1D1+65RO62aCdcuayRxq/3ZpyGO3GXAkswRURaQII27jH2176CC0HtWElriDZnWBvmuqFEqVrEpvQWOvNMXTaGWQ5F+4dBhY0LgCAAaM53UWMgggFlSCILDof94lxDP7AM8936RkfU2ffSDbu5hUpJID/u7z+p8iOqdAAADfQQRm7yFbz5mYd55lGraj6D5nv4ELgD6Bkg3AFCX+V/SD+10MQ5yEhUpRO8OZQhX7KvtwvGVXga8PL+e2+TRAUpwaNwpdPFqJooqCYetDBRfBccRB9AuvErXFgmCMjYUWcrUJk37PtkHVTWwCd7iPkMn8Opw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VL6lMQVeMDc9PDrdGemq8BetWEBzdrBiDPf1TKvHKwo=;
 b=pCJSMgRu14HXaTtcBweUAwcAkBMXUCSEMtbEIql9TzLV3oAtBIoxmOC2NedZHIJzB9JbmMg2QCDLbitVEZL7VAxze2qPm4mRGDduhjeFmflGTW25K/IITBWPTpcl1Ox41hbh4Fm4iQ65rrcmg7R96185AcyXd9McYF0rAeZV5ik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 0/4] vPCI capabilities filtering
Date: Mon, 21 Aug 2023 21:29:48 -0400
Message-ID: <20230822012955.312930-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: b196264d-ae01-4631-d8b4-08dba2af5486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YQA9CwIotRzSoOh5NxcbH+bIEW7GfZV+g5Z0HCWxNnEqGpLeEMQWP0R8SKzxvU+eK/JByoUCfY47IHUzJSyBQHSpoUwHI7PJlmO4ENTWabWMgC5zma/X5cuvB5XVZQNmPo1KH58q4Mzp0s0kCZzrcs0UtLzkqbhqE/Ww1gAA9liXt+gVEzYEYp2HLbgoNJMhNZyjJJWGdYi6ENjOrzfi+6q8g6+TSCxu/x0MVAZw2Snu6KaPWGFHdYlQ3cLoEWcPZr1rps0HcvmaCscDvtogwzUgKuys/62JeBbL7ArtHSc3QG1zuGdMLCFnlO9OXo8lzi2zcop9GZEdhfk5Y3LLHM7MVWAcUNY1GvckW8T2n6zksosC67ynUelonLqeIaJzIocjKCBHq+XxPkCjdr61I5YB35AFk70einf5PhGqP+nW7sgJNRLvOgu6UZbWOm9Chy9Q+wCqzPLBvuzzeiW9frJKaNZ+gLDwEE6QOUqNmIH5qLCB6Ez0E0u+hFCMS/6asOXmQxS009Xvun5NX3mzT6S9bdnod1Uhd/Z5qcUZFiX9oWJawrElct6clJfXfXJzZ/MCnANb3wGy3Av3aUVudev69EFKU54HxwSxcjJlbV9+wJAwpngcG/xl/hpL9RzwPzdsYwSvfVJCpN7e9tve6rQ+qVQEtyvQInMgUHUGWUNMr7CCYB8PQH53AwUN7q01Jpd2nsd5gWF3K86PTVmpgcSqvlaRqoh9A/bKhAfIIDpqpR/XEu5L05CC+yk5E9MJ3IqsxmnOQlzaepPluvS9iA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(54906003)(70586007)(6916009)(66899024)(70206006)(316002)(8936002)(8676002)(2616005)(4326008)(1076003)(40460700003)(41300700001)(36756003)(82740400003)(356005)(81166007)(478600001)(966005)(6666004)(40480700001)(2906002)(7416002)(83380400001)(86362001)(47076005)(36860700001)(336012)(44832011)(426003)(5660300002)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:30:12.2438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b196264d-ae01-4631-d8b4-08dba2af5486
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766

This small series enables vPCI to filter which PCI capabilities we expose to a
domU. This series adds vPCI register handlers within
xen/drivers/vpci/header.c:init_bars(), along with some supporting functions.

Note there are minor rebase conflicts with the in-progress vPCI series [1].
These conflicts fall into the category of functions and code being added
adjacent to one another, so are easily resolved. I did not identify any
dependency on the vPCI locking work, and the two series deal with different
aspects of emulating the PCI header.

Future work may involve adding handlers for more registers in the vPCI header,
such as VID/DID, etc. Future work may also involve exposing additional
capabilities to the guest for broader device/driver support.

v2->v3:
* drop RFC "xen/vpci: header: avoid cast for value passed to vpci_read_val"
* minor misra C violation fixup in preparatory patch
* switch to pci_sbdf_t in preparatory patch
* introduce status handler

v1->v2:
* squash helper functions into the patch where they are used to avoid transient
  dead code situation
* add new RFC patch, possibly throwaway, to get an idea of what it would look
  like to get rid of the (void *)(uintptr_t) cast by introducing a new memory
  allocation

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01281.html

Stewart Hildebrand (4):
  xen/pci: address a violation of MISRA C:2012 Rule 8.3
  xen/pci: convert pci_find_*cap* to pci_sbdf_t
  xen/vpci: header: filter PCI capabilities
  xen/vpci: header: status register handler

 xen/arch/x86/msi.c                         | 47 +++--------
 xen/drivers/char/ehci-dbgp.c               |  3 +-
 xen/drivers/passthrough/amd/iommu_detect.c |  2 +-
 xen/drivers/passthrough/ats.c              |  4 +-
 xen/drivers/passthrough/ats.h              |  6 +-
 xen/drivers/passthrough/msi.c              |  6 +-
 xen/drivers/passthrough/pci.c              | 20 ++---
 xen/drivers/passthrough/vtd/quirks.c       | 10 +--
 xen/drivers/passthrough/vtd/x86/ats.c      |  3 +-
 xen/drivers/pci/pci.c                      | 50 +++++++-----
 xen/drivers/vpci/header.c                  | 93 ++++++++++++++++++++++
 xen/drivers/vpci/msi.c                     |  4 +-
 xen/drivers/vpci/msix.c                    |  4 +-
 xen/drivers/vpci/vpci.c                    | 53 +++++++++---
 xen/include/xen/pci.h                      | 11 ++-
 xen/include/xen/vpci.h                     | 14 ++++
 16 files changed, 221 insertions(+), 109 deletions(-)


base-commit: 3fae7c56b313a12288a05e0a8c14c47bfd4dc40e
-- 
2.41.0


