Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475A60C7DF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 11:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429693.680853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onG8G-0006Et-DB; Tue, 25 Oct 2022 09:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429693.680853; Tue, 25 Oct 2022 09:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onG8G-0006CX-9y; Tue, 25 Oct 2022 09:22:00 +0000
Received: by outflank-mailman (input) for mailman id 429693;
 Tue, 25 Oct 2022 09:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5aB=22=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onG8E-0004ZS-1Z
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 09:21:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77c6ce2d-5446-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 11:21:56 +0200 (CEST)
Received: from DM6PR02CA0077.namprd02.prod.outlook.com (2603:10b6:5:1f4::18)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 09:21:53 +0000
Received: from DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::87) by DM6PR02CA0077.outlook.office365.com
 (2603:10b6:5:1f4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 09:21:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT086.mail.protection.outlook.com (10.13.173.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 09:21:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 04:21:50 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 25 Oct 2022 04:21:18 -0500
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
X-Inumbo-ID: 77c6ce2d-5446-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hS2Rx1p9bW7TQVJR0HiG97FpJxhQKsInhm3Zdqe/rHU994OcD2a5R80Clo+AdxZX2Mh8lCgyNL23ZJxuRo/w9R/TWPAvhxX486JIMXb2pnHOMlAOYaKLaTPN7EGKMEuM4TZWqsgcY0pCrylP0sv1iul66hgPOtJdWJWdiS2NBjkMU7JwA40foQrQEPd6rFVdzS4XOPJ7KzNU4yXFVOwODw+xK8ia/HxiZVzgEH6PcMXNWoeXM9p1JAwIugcM9ilQt3T2kLX3bngkdkiCI8w3JcTwuuhlcEfgZbEQD6K000AUvyfnKe77MDGaVHrEF6bbp4SC8N2RmEpyFWKkcWcLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc1OdzbUVoH/An6BsueD6Yy51rtby1vUctz6mo7jnHc=;
 b=lwnQSkpOXnkrHH8i9il3GA48s74Utuw+x7t4QH5E62dYWXm3kJA2Ldic2NpIyOSfsa6MIyJgqlIHTmq+okO4woS4H2abBZmnAqrmBwgVyKYuyC2Tkf28mQ6Q+As4PoffBfI3MLUpaDpSVhUYd9JI+D2OVIUjVk8JwAxMhhmOfFVNGh7PHgev2fbkSqNB2my9D5vYBejt6sAWZHeMJp5KjV02NjFw35n2qtjJ+BMlYuiv9BtD7YsMTjrjjDGV4ubMVNwlieE3WiHHorPvCExkd4IlybbKDfL3uMetErkvPeZrwZZn7aHieVgAjULyAjotbB2rHhfI/h7/drfMNmgvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc1OdzbUVoH/An6BsueD6Yy51rtby1vUctz6mo7jnHc=;
 b=M02ra2m1U6V20JTkxQWvtzueyxVvU/hq7A3LE4TGaSGRIwZVFstVKADW5Zh/1xDnXF05JXDRawIhOcgUti212Wk8H0f2wwF2ZowruvheslxBxTfVLYsmXLS912FR9L1xrF3DX1SVo0K9+oAI+qYSZhc12IdyNCIxcXRN5jSBO+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c5767718-bb00-da6b-8623-1bcb6c832f85@amd.com>
Date: Tue, 25 Oct 2022 11:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v2 01/12] xen/arm: Clean-up the memory layout
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <marco.solieri@minervasys.tech>, <lucmiccio@gmail.com>,
	<carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-2-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221022150422.17707-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT086:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: e10c64b3-686b-48d5-d5d6-08dab66a5add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zrk4N6JMzcVwJmRArmkDRDKUZruHMUtER6zZ6BVs+l3ZvOUjdXlhMfvvnKZ3W7APP7hAZf3hADkE6bYJonMFgCGg7Fym6vfIdR75pXwDttU38zxiTx9t3s0060tIj6lag3eLm4bThnEXrvTpyUKSURdWY8qZzQ5EqqnMxKx88WZs7SpGYwFQb1uZAJZl9AJTC4TrGiizg0KQz4EPqP1G9EhNwtS0FmEOUKh3WI8b8u/NYmGikGm2ZcaO8zl2Aw2KuRmLhQ8u+TmzDOSLjE9VgTsiV4tuD0NRoedpT1OYis7ahc3oT/Cw5qW6AdnqrD4AcMt9JP7AbqZrxTM+tFjwt61cTu2Q1wgzswYhs65g4ymKKN4SGDW4fZCiVUzO4T8bIANII2HiItbiSsPDtC1WV4M7QJVgGSNYPK8FkMsMEc9UXu5WUWtrUEiSGFijs/3CWjEzheZ7dDv0Ee6KEWlBUos8aw5PzsOROFzL3a8jtO8vB/7VmTb6W+4WtELtz7zmJl/Hgsrd1FWqBqtL3GFMsdXcpZqcPo46DdSWJAtYz7X2c4Tq8cpveMjbM1cN7axZi5r2p2qJjKfbiKh+OUV6NN357gsauOnWtf2+cN6yN9vEFCLV9yDqLIG7hmtHnZm5B9o2s4jiV+86lPUYiPrznsevkm2Hwm6bI0f/7eEyY86VG+tnno7wAA+kXnUPg6+dGd+fOjv46GBrsE+IrZcKD+bp7pzASTjs0GbTlmqFMqweYiUTyJ8mnhL+6GAAqou1HGd6c9wsq9fJALeJOGW2kUvt7CJ6by9TpzHI1pqDQ8SKVMICXqhEkGkVn0iuuUGWFK0yA/QH9zFPSy0qvuliQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(8676002)(70586007)(8936002)(31696002)(36860700001)(478600001)(70206006)(16576012)(41300700001)(316002)(2906002)(5660300002)(54906003)(4326008)(86362001)(81166007)(44832011)(356005)(4744005)(40460700003)(82310400005)(82740400003)(110136005)(36756003)(426003)(40480700001)(31686004)(2616005)(47076005)(53546011)(336012)(186003)(26005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 09:21:53.2841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10c64b3-686b-48d5-d5d6-08dab66a5add
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241

Hi Julien,

On 22/10/2022 17:04, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> In a follow-up patch, the base address for the common mappings will
> vary between arm32 and arm64. To avoid any duplication, define
> every mapping in the common region from the previous one.
Maybe the following title would be better suited if you only want to touch the common mappings?
"xen/arm: Clean-up the common memory layout"

> 
> Take the opportunity to add missing *_SIZE for FIXMAP_VIRT_* and
> XEN_VIRT_*.
> 
> Take the opportunity to add missing *_SIZE for some mappings.
I think this sentence can be removed as the previous one already covers it.

Apart from that, wouldn't it be useful to do the cleanup for the arm32 macros
as you are here (FRAMETABLE, VMAP, {XEN/DOM}HEAP) ?

~Michal

