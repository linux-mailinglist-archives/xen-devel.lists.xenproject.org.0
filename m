Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E18E6659BA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 12:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475205.736791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFYv9-0003JX-J9; Wed, 11 Jan 2023 11:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475205.736791; Wed, 11 Jan 2023 11:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFYv9-0003H3-F9; Wed, 11 Jan 2023 11:05:27 +0000
Received: by outflank-mailman (input) for mailman id 475205;
 Wed, 11 Jan 2023 11:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmZf=5I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pFYv7-0003Gx-TP
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 11:05:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8cb6fae-919f-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 12:05:24 +0100 (CET)
Received: from DM5PR08CA0030.namprd08.prod.outlook.com (2603:10b6:4:60::19) by
 CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Wed, 11 Jan 2023 11:05:21 +0000
Received: from DM6NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::fc) by DM5PR08CA0030.outlook.office365.com
 (2603:10b6:4:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 11:05:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT106.mail.protection.outlook.com (10.13.172.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.12 via Frontend Transport; Wed, 11 Jan 2023 11:05:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 05:05:20 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 05:05:20 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 11 Jan 2023 05:05:18 -0600
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
X-Inumbo-ID: d8cb6fae-919f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvoI+LKKpNIpbWF+69cGnGcwmVfLUXrk0G205/FYvXrRes1PQ7leFUMGeLiPnKYaFGEXd00LbUdefYCyS+OzudHrA0oLC9GwGC64lpnOhlHInXgJZoUtn6/iJJan+2q4h+Tduoit2bBcF/BVZsMjG1kgAPGn2kirisWOk8kgNsQ6rvAdwetKDrUwuxUH556VeS/UOX6gvq01PTlekIFO2fKKFzvZ6DdPb7rZRKb8z9lhM/eGfsgzolPmmp0Ks4QzVqVu+V2EcstzeJ4T5D+r93SXpvAsvRejWTzL+VrTyMdPJE2rqwBQ9CdB/RM04iAvwqQJvYVJUladcOjurZbWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wErCXnpAFasgVfkVOpDBs0NnPqWQPgKvRmIRDzVqRqE=;
 b=h1igtfL+nl1DcXM+8pgscvxxwrHFtl425vJFRyGWF+TV1tQ5xisNaaRl3Hbr8jkLpBLhsZk7y5auUKVjHXRPzJMzRccQ/cFzj1zyzonQp8Iu2/y56yWNpspdh+rfilgfoZ2Gg3bntUOe7/y23rZY8e396N3t7xTaI5myD+ZXgAQt+URc6uYpZT0SAytwFZLEQycFOQrO1wavbp7I2G1ZkOWyaRuWEmPaHsgb8Fi3sqDHk1BzSnlZLAEuDJ6M8LKAtTd2vzyA80AghssxyFjF/17Wt2vYm+g5h3+2JQoDr9IHTc/jU3PtjWEr0OgREtZ8U6BIS413tZ+glzC7kL6QJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wErCXnpAFasgVfkVOpDBs0NnPqWQPgKvRmIRDzVqRqE=;
 b=sjtRFrdwYTOg2oM8OV2YKX8zd/mUSBvUvD3ANjNlnPV77OpXhXj8uFmkWzH4oMRKQLDWkP83pke9OO+OTg7anBfof1leTh+ZhXGackzTazVQrCqk87I4oQCDUhl5VIBTEADLOpa5tjRRhy2+fO8Qrte9UkHP2er2QTrXfKjh14o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4bdb36a2-fda6-1949-d7db-7344a801fa50@amd.com>
Date: Wed, 11 Jan 2023 12:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] automation: rename RISCV_64 container and jobs
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
References: <cea2d287fd65033d8631bf9905ad00652bf11035.1673367923.git.oleksii.kurochko@gmail.com>
 <4f15fe80-9a60-76ce-9cf8-2143ea2d86eb@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4f15fe80-9a60-76ce-9cf8-2143ea2d86eb@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT106:EE_|CY8PR12MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5f3afc-9796-4fb7-7bd9-08daf3c3bb23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+KW+gWucd6aWaiHm9bR2pH024yR1CE5NEnhDcvwQHVR/A8RoHE+2gHYW3WzvszmTiq+Zmy+49sSZWWh4RR4ZM0JFA9D4meSEb74vaAx0u/dBrzuTgRIcVDtZ6BQhNjQ6Sr0dvQb/zpZT8hkBvgrpsoBOsAj1zziL3nStNstYBzOdAq6fqLXTGqNJBgbU4Lgtopas3IqSE7lZfmiLXaOEYa0paLYDakRe/ygqW10Wzo+TGhxoqWS5dVniO+jiB1YiC6ACvRNQRZxXxLYZAuafdbIF80cg3ka5zHKg8K7hEvG2jntYTV4tb0K5XJumUIjVjSUQ2+4Myv3n02ToJOCTtTTqFgeFJ19buv4jaJOnGeXLdfR6ga7H9Ci3Wuz4tCEKDAmLbReBTKwLa3iuAIpdwiYQZiX4QWmsWoX/vZR1L/Xtv2OkOEmBoQvMC2xdvZ/Lwonh3kbjg5e0EVaDZsAnJSUGATFZ9O0cvMe313orfopxlYRlSgwnp8xWxEwZOKQIVfkvhdmIAV1kho0ha2Z7pPNlFHCe8tCzLfD43I1MDIrn1ba7K4q/hCdgsZDk7q/RrPofTh1M3rHbhwKYXhXOgST21y1CDEdDwFHEzpv3d3yNgn8vl9bnfIZAKnwTMEThOdkcCFhiUrASSyxXcnEjeXLQvIaN3rOYrVqG3imLTMI7Sr8Ml4qWGx4yRMkUxhxDsQ5xNoLyH61Vy3SVAf3LHeWAlXivgY/Ta5IQxy03159ocOlQ6XXTQLTJcWWbwzhX/8PPCAiKilldIyQGb57Kng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(478600001)(82740400003)(47076005)(41300700001)(356005)(426003)(81166007)(40460700003)(86362001)(110136005)(316002)(54906003)(16576012)(31696002)(2616005)(186003)(40480700001)(70586007)(26005)(336012)(82310400005)(70206006)(8676002)(36756003)(5660300002)(53546011)(36860700001)(2906002)(4326008)(31686004)(4744005)(44832011)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:05:20.9402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5f3afc-9796-4fb7-7bd9-08daf3c3bb23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7435



On 11/01/2023 11:44, Andrew Cooper wrote:
> 
> 
> On 10/01/2023 4:25 pm, Oleksii Kurochko wrote:
>> All RISCV_64-related stuff was renamed to be consistent with
>> ARM (arm32 is cross build as RISCV_64).
>>
>> The patch is based on the following patch series:
>> [PATCH *] Basic early_printk and smoke test implementation
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  ...v64.dockerfile => current-riscv64.dockerfile} |  0
> 
> This rename will break Xen 4.17
I guess only if we decide to remove the old container from registry,
which we do not need to do. We already have a few containers in the registry
whose dockerfiles no longer appear in xen.git but are kept in gitlab for backwards compatibility.

> 
> Now, as 4.17's RISC-V support was so token that it wasn't even properly
> wired into CI, then this is probably fine.
> 
> But we absolutely do need to be aware of the consequence before taking
> the patch.
> 
> ~Andrew

~Michal

