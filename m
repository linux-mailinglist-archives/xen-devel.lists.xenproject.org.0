Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B46E157D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520934.809089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn32S-0007Fo-Io; Thu, 13 Apr 2023 19:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520934.809089; Thu, 13 Apr 2023 19:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn32S-0007CJ-Fw; Thu, 13 Apr 2023 19:55:24 +0000
Received: by outflank-mailman (input) for mailman id 520934;
 Thu, 13 Apr 2023 19:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbVr=AE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pn32R-0007C4-3y
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 19:55:23 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e1c0413-da35-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 21:55:20 +0200 (CEST)
Received: from DM6PR06CA0083.namprd06.prod.outlook.com (2603:10b6:5:336::16)
 by DM6PR12MB4909.namprd12.prod.outlook.com (2603:10b6:5:1ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 19:55:17 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::85) by DM6PR06CA0083.outlook.office365.com
 (2603:10b6:5:336::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 19:55:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 19:55:16 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 14:55:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:55:16 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 14:55:15 -0500
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
X-Inumbo-ID: 1e1c0413-da35-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giPucoljItkLXmTWzh2BABJFAT5txkUAwDWrNXk0NdmxXMrULw3GB85YcmaTvxsqYr4KJ0CbUkbXTdsTVhU61C+x9br/ieUX9QxfxZjZmqJq7okvS9+H3NA4f97Igs1UcqmQ8EQFJHNyVW1wpdbH5Hkj12Y8J76STRGubPfXqsh4wpj3YodYR3LsJI36UGRBueNRqtEtIVc8fs4ezklnrVAfKNTdFs1kd9M0EQ6m9JYAft9yp35n8C1i3hrzYOuzi+Pg09ZpzWwemf0zwp1q0OakZmsmcxXxMRW8pbGgMr/tugOzrHnJkO+zOz6XdkBif6N0kgUFNTITh7wbTomKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbR0ZOV6YHp3unjdtxF89oo88L3tukNm7J1yJytBJd0=;
 b=QTMbF4uNartpWetvgEmx3ru55X6arkT+yBkDaX8mGDJ+vFgEZbKRDPeFdLbgDLseFrrGU6Wo0D+EL1Ggnf+sThQaio1j582NYVQ8XGYt1vb36Hzu+Xh6fxcs2+SVjC/686NvGhujk9Dhy4wgpA9+3aVLVlAoZjsnq1clYaBVC4h9V9+rSDIEG20oYEBJU0wSpjjtPRpgouJBvQ9cuO71nY8AeXfZ6ylA+ztcrjnz+AD2wkZmhAFVpGA8BTc7OA+wldiNH3E89xGLzNxNVuGm4276IxojDBFq/A/oBMTtZqUXDwwTB1oRC6FOlGphV/knxT3gLbZdO1o5QOfvGNHzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbR0ZOV6YHp3unjdtxF89oo88L3tukNm7J1yJytBJd0=;
 b=jI6tkFt4ParB2RTOiV9VERM+vn3Z1pQuohxOWfaI9mVHinTgf2hpCbeYwVuyaDEMdgDQ+RuLkHXwSk5Mw3De9uPRMgdEG0U4BT9sclGbJrUyW83+rXBKz9/PUpqxvRGmdY4SEGn4gQ9IOc5eK1YWuKKKbIGDIZZ48s0ZMb1/Trs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <19cf0a82-3b79-8548-44ba-1e4b2c6dbfe8@amd.com>
Date: Thu, 13 Apr 2023 15:55:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/8] xen/arm: re-define a set of data structures for
 static shared memory region
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230223054105.2357217-1-Penny.Zheng@arm.com>
 <20230223054105.2357217-3-Penny.Zheng@arm.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230223054105.2357217-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT054:EE_|DM6PR12MB4909:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c8cad1-84e6-49bd-9e3a-08db3c59010a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W+43QDT5QNModEEJq1UPIAOPOayoUtv+D5bYGGi3jGdnkmVLbYSmYYYeV6aielISstYfPOHkh3Qf5cGkC9lJt84prJfFfjSWwOdUI9ZSR4pan4UdHfPWLYEQqcTL66JZwO3MKrt6ukbqms+A+onRwzkLck4Vo1YOjjJu8RWaGk3UaK5gsDhK3titYfva2WRM1NfCv7Y7XzgH1/VPSCerw7ZsUeyli7+X7jdR6/kVzxgQrW6pcDIedYlURWoA3YFurZuhozpJdNAThbWEMa0aIZyYVcT0HIglrkWVRtotSvm1rz7WOmMqiaaiPRA6v8duTkUvwOqIypsrRIZNkdzlCAyJZXfYDZbrDwjUaeTi6cBdvwUX/yX7eAhIRB5jEg+C4l3GvSZNi+3LEp92OfYkoKWXW/rfhUxSSpE2LsKszVrWcX2s1z6QXXA/l9CFS/Vwfi00ZVqcdmftlAlbYSYhkxE8g+2VpWU597+uSRRMcFPbPDfP108MhITSIsHEgyUri69tyQu+hK9q65/mEnUw+xdnrvlbalfBNPFGNsKe77q91dBiaqrKc0PbQK808Q6JH+vsc4rsGestIKuP1eQYsRqaZ1rqVlILkcf9NtvMMjXi9TZkkr+PBnjkkcf0Sm7j3soNAaXIR76UHRDugmhSBU6KG1wPy3ofCY92AObUzCtOAwKgGWvl9ak5lVymJB9MQgH01lIRguvk6/h2YEgPS/E4yVqA4NRR3xwluNwkXwqYlqW7x9qUml+mFREYLLDkg7Y9P04yzNQomVHw82A+fw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(336012)(36860700001)(70586007)(426003)(70206006)(47076005)(83380400001)(2616005)(54906003)(26005)(110136005)(16576012)(478600001)(186003)(53546011)(44832011)(2906002)(36756003)(5660300002)(81166007)(356005)(41300700001)(4326008)(82740400003)(40460700003)(82310400005)(40480700001)(316002)(31696002)(8676002)(86362001)(8936002)(31686004)(66899021)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 19:55:16.9504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c8cad1-84e6-49bd-9e3a-08db3c59010a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4909

Hi Penny

On 2/23/23 00:40, Penny Zheng wrote:
> This commit introduces a set of separate data structures to deal with
> static shared memory at different stages.
> 
> In boot-time host device tree parsing, we introduce a new structure
> "struct shm_node" and a new field "shm_info" in bootinfo to describe and
> store parsed shm info.
> only SHMID and "nr_borrowers", which describes the number of borrower domain,
> are considered here for per shm node.
> We also introduce a new local global data "shm_data" in bootfdt.c, in which,
> reserved memory bank is recorded together with shm node, to assist doing
> shm node verification.
> 
> In order to apply above changes in acquire_nr_borrower_domain, we now use SHMID
> to iterate "shminfo" to find requested shm node, then acquiring the information
> of "nr_borrowers".
> 
> In the last, a new anonymized structure "shminfo", which is a array of
> compound structure that contains SHMID and a "struct membank membank"
> describing shared memory regions in guest address space, is created in "kinfo"
> when dealing with domain information.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> - As the original "struct shm_membank" was making reserving memory more
> complex and actually memory information could be still got from host Device\
> Tree when dealing with domain construction, we introduce a new simple structure
> "struct shm_node" in bootinfo to only store SHMID and "nr_borrowers"
> - Further restrict the scope of the local variable
> "struct meminfo *mem = &bootinfo.reserved_mem"
> - Introduce a new local global data "shm_data" in bootfdt.c. In which, reserved
> memory bank is recorded together with the shm node, to assist doing shm node
> verification.
> - Define a set of local variables that point to
> "shm_data.shm_nodes[i].membank->start", etc, to make the code more readable.
> - Use SHMID to iterate "shminfo" to find requested shm node, as we no
> longer store host memory bank info in shm node.
> - A new anonymized structure, which is a array of compound structure that
> contains SHMID and a "struct membank membank", describing shared memory region
> in guest, is introduced in "kinfo".

This patch no longer applies cleanly to master since 64c21916167e ("xen/arm: Use the correct format specifier")

