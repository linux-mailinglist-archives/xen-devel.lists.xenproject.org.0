Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E283677CD5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 14:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482845.748586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJx8H-0004RP-0a; Mon, 23 Jan 2023 13:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482845.748586; Mon, 23 Jan 2023 13:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJx8G-0004OT-TS; Mon, 23 Jan 2023 13:45:08 +0000
Received: by outflank-mailman (input) for mailman id 482845;
 Mon, 23 Jan 2023 13:45:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozL9=5U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pJx8E-0004ON-PB
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 13:45:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a84a0d-9b24-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 14:45:04 +0100 (CET)
Received: from MW4PR04CA0223.namprd04.prod.outlook.com (2603:10b6:303:87::18)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:45:01 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::27) by MW4PR04CA0223.outlook.office365.com
 (2603:10b6:303:87::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 13:45:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 13:45:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 07:45:00 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 07:45:00 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 23 Jan 2023 07:44:58 -0600
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
X-Inumbo-ID: 23a84a0d-9b24-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwCsJl8wTm7D5xSni+ituoZssK2dCbqGy0cRUrtT38O/BqlENlUfo/4aiPguI0PTYAfvC5VXfkq84gHJQrpwIBC7Z36f2tIBz8krCTd4I+IJ9YlTppmZPu1ai4i/AnJVmpC9x0CdU3mOqf4lK8AzkJUdmrh3kqgcweCCTk1/UrytsBDVpy/hsSMD880TXjubh6Ucx/KIDCic/w8dp/HaeHUXhLSTESriMh9phvESJbSbjoMQm66UW2ZA8KVnZCj2LojrxqarbEoyfL7Hv15Hch4Q9zrT+tFpINjEIcSJKO0V4f+1BjJmvYr3YX/1aSw7LX3SA3A9yxPPvGyRo92RQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJS9P+WkaGORvzmO1vjpZgshINLWMYaWGWtqwGVphZs=;
 b=k6KMxbISOXyWmZamXI4uOJmtw601P0yXVvsrxwWHa3r46ViO69JCUzbKkwOXpdq81kpagHjd483IX8am937ERr9xAQLFzei+xo91+ThBENL33dVHbIVtChdA9lVHupEHSb0iv1qQu8++5ncbtFDDWPkL7uoH0OYoIk+mgl5DVQdJvf2amPkgFC7IDfT9MQNnfRYmjWVif/+l2YbCz/KAC9vTVe4SRrNTkMIRQMJP65sbYnaJstfxLSL8SJBBD2nhkv4fJo0G8cLkWOSdXVBiwKjW3qWxSbSLelqwNbh0tOLigBbMNSvt5b0iENrAHnIcPQSOiwO+jNQg6xj0ub8urg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJS9P+WkaGORvzmO1vjpZgshINLWMYaWGWtqwGVphZs=;
 b=kWJttfKIiIXz4irjmK9yqrRSzc50QrbTiOCb+UH8FKE72s7dVsdc3o0crguuTSnABOWaKxxTaQCLWyNL5LfLgSyjefsrzDgN4Zi6JRiYg/WdGgGYs78CEIhljQ8tOng+IAAL85AfzHBkNsKA5NhC5syT+nRag43zfHuYsJlTI7U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <xuwei5@hisilicon.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 0/3] Pre-requisite patches for supporting 32 bit physical address
Date: Mon, 23 Jan 2023 13:44:48 +0000
Message-ID: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT026:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: 31cf5429-1d36-404e-e4fa-08dafd480673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HruGfItwQrks3SvKe+lioDqVXfrWY0QgWhneSxj1+FZDX2vTSJUO9ohoB1LcSI63ZG3iR0+Hw+Zn3JJ6KFEgfZrDjiVEJAeIgyFdWskulC92cfGl/SOSAVM3Sd8fruxo0cpKXRxNdo5uCGv/d9F4sbGXVCCHV/q5QbT9hMCe5CaB/pvJygSNDge9lDUM6kjIPILz+81QBnKCRS3Al2MDFLJg1QC5z5I+gmh+qSe6RCvP51wz9qV7HUL81nt2KZ6Vnp7FItROHwCVx3ADL+gUeyCV300DRf0gA5uuA0UjWE/yT0zcRAQtvUFSqtVDAY7fsGb2uipR+NzDoLWlrVbTL+8Egyjex4dk0vMbO7434wXMg52FHhtVcjd16Oz2z9IpVgW03vTWra2bNwjoDDB1F9cOOjOEWlfaNzLBhM342hncn9b64nyJMRnLGJe1Ov273W8JdaxklJTyspb3glnppgORkUjwW30h7NzTw0fV0woHGUbXz9nrfSp+VL7eoPURVu2Nd28vLy0sIjN17l1TioiO5DmU2aTXE2NqsmAjNsI3SP3YG+lPG2WrRx/bU2C/yk3IOFW8wQZgbUzOCGLH3ye45BXgng8fIugcdJ5lfje4isrVPgcW3BGx7JrKGq8oZVdzBKQ3mBhiIIvYqWQ+SkaAmMlteYTmZIuggaHOFYfkOWT0Bx1luwpdZGtH64AqScOlvUoiBdALEluATJT3toYfmyWLHzOpkdAAYdX+QHM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(2906002)(7416002)(5660300002)(8936002)(83380400001)(70206006)(70586007)(8676002)(6916009)(4326008)(36756003)(54906003)(103116003)(316002)(336012)(86362001)(41300700001)(82310400005)(186003)(1076003)(2616005)(26005)(40460700003)(6666004)(81166007)(356005)(426003)(47076005)(36860700001)(478600001)(40480700001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:45:01.2359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cf5429-1d36-404e-e4fa-08dafd480673
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117

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

 xen/arch/arm/domain_build.c | 45 +++++++++++++++++--------------------
 xen/arch/arm/gic-v2.c       |  6 ++---
 xen/arch/arm/mm.c           |  2 +-
 xen/drivers/char/ns16550.c  |  6 ++---
 4 files changed, 28 insertions(+), 31 deletions(-)

-- 
2.17.1


