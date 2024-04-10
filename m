Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C8F8A0432
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 01:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703698.1099505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhek-0007un-MF; Wed, 10 Apr 2024 23:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703698.1099505; Wed, 10 Apr 2024 23:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhek-0007tG-JQ; Wed, 10 Apr 2024 23:47:06 +0000
Received: by outflank-mailman (input) for mailman id 703698;
 Wed, 10 Apr 2024 23:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHON=LP=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ruhei-0007t7-Cz
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 23:47:04 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0230dd7-f794-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 01:47:01 +0200 (CEST)
Received: from MN2PR08CA0021.namprd08.prod.outlook.com (2603:10b6:208:239::26)
 by DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.55; Wed, 10 Apr 2024 23:46:57 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::dc) by MN2PR08CA0021.outlook.office365.com
 (2603:10b6:208:239::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.21 via Frontend
 Transport; Wed, 10 Apr 2024 23:46:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 23:46:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 18:46:56 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 18:46:55 -0500
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
X-Inumbo-ID: a0230dd7-f794-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn7BOqFVZ2YCfbLLPAMbwEgyUHutLQ+dXUIz1WA7hS3/FE0PcBFWAkfyJ8M5nsLVzg6EHmlRFHrLLCdcRrJtScbFRyi2FztBAv5P9o4yIpZfo40lMgZn5m7nWl7/iMyzVt/CUz9rEw73b+bKFtYdGYIchX0am2JCyMie+PzaBcO5p6sWMPfGXmm3METutAc1qlp3YFhMIZ+VlDq/novNn6p4MNkATYPzMTPAHSBwA++qoI9/jXKqaPRADRAssZkxEyNZTOsCSiKHDtP9cjUoJv3IYNYZuz1wET4+1eP3/5EPxtIivqbwaRT4w/hEi3cqFUz2AsKK+/up3L0nI0ZMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leTZkBBDMUOQmiQ2SJOw/6i4poxD1KhJnVX+szn1yH0=;
 b=Vfzw29Y0JkvrFcUalTnGP9BZzVbIZML4PiDO+32Yymb1ycYTr9iHPGYpSk0WgkQiyTvknMaOEefYDM/Jj/y7uDLlPqG/itz/MlqsVs4OPbvqEfeVUfBFE/ib81W0IjmD+Ioid4KiJGA0mSHrVjEf72/9KKaj7kScLntJuOxHQZ0ZHKOohwQAkWPKK60eJFfswskSDOnppu9cgtmSoxRan/kENCUQLWruGaYUNl4+RzaBN6rynHaHqd1uX0iDaNi1z/n/Dz3qKrxDLaZlcR+JuXqyIw8j8foI4qvGwB6CZMFyBdhv4xoGwOop45EIkzP0BmS+v3S0GMo0xr2HwP+j3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leTZkBBDMUOQmiQ2SJOw/6i4poxD1KhJnVX+szn1yH0=;
 b=0eg61K1i+Vmt1wQSx3tXaaGfBSmemTt9mKZ5d4T0g2rNSf3BbPC8wbFwdqebjG+1dsk6ooJnwmhyKRtzIHMyUXfYTxsvpdVakNtmHzK/m27Fi55b4pRKsPs9M6yUUeU3eEeHyvVbW3l+kU387KkJMaPQ1pby+6hAht4XU9ztAOc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Wed, 10 Apr 2024 16:46:55 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	<bertrand.marquis@arm.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>
Subject: [PATCH v2 0/4] xen/public: use fixed-size integers
Message-ID: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef775c9-3a6f-4cae-de46-08dc59b8823a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4z3i26Zd9aU0VZSEz2uh3+SkPLtqPyqW9AkTQ2cI0zUFYZrnE8AXF0jB2u40hTuL0A6kA6/kXKnovOuaLFe6N87YEn9vei+NDM+M/4bK1uuoVzaHIhLzQoH9aCb/uPcyB7yQ9PkZRWxZhrd9IaESDja5VHUK8KGaTDDOPT0+ufO059YqE4hRYxT/25WrAPZZ70Dsr6Xu2qrvtlmCuj9ue2M/R8GscrhZypGXvl8o2FQBsTExg3e3+k9waxc2EfJnj1nNFM8nxrSfIbessGmYS7e8587G7QGqzhRm2kt2cjwJD61tDa6whUy1qvwwMP9qNlfpA3tejRf2nOvyk/vd1CRoLJBdiS7iNr08yL/eF1B2KqCjLiD0x3Q4yqFlr+mGTpN69uZZAoAlRdNlAVHYdFBHwybb2Ul81BcazlwOZKcHFNaionrAOc4FCvMGPYG3yp/jhv96b66AbyjAW5Vsz1JqCkkbtZCopk/WdpA3cgf6WdGugIkQ7E0HWsQ3G5ysACEtmnwjq//7UW8mgt1pWF8ggRe05FOA9/UIcXpk2LWTtZY5BJF+t2DlgnlzK+f6c9i5GCPlKVseJOt/S2qqEVHduNGqog0ztyxbu9oGdiZ/+NF2ZG5whlsojJAFpEfKxlyAgvQ40dNKi4x+J1WBGbQkUd10+i1XSUhqfJhpJH/dnZUFTeavj/3uuQ2+QIVriXD5wJoc2IPY0+qmNWOLinxwA0yCdwZcbGAkTpEQJV3ZfE35c5gWTai7i3hLoP14
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 23:46:57.3205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef775c9-3a6f-4cae-de46-08dc59b8823a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168

Hi all,

This short patch series replaces integers without a fixed size with
fixed-size integers in public headers.

Cheers,

Stefano

