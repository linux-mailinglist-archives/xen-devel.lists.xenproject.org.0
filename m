Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C263C2BC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449410.706118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01iF-0002f2-BO; Tue, 29 Nov 2022 14:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449410.706118; Tue, 29 Nov 2022 14:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01iF-0002dF-7r; Tue, 29 Nov 2022 14:35:55 +0000
Received: by outflank-mailman (input) for mailman id 449410;
 Tue, 29 Nov 2022 14:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBYr=35=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p01iD-0002d6-Mt
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:35:53 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e88::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f2b3ef3-6ff3-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 15:35:52 +0100 (CET)
Received: from DM6PR11CA0031.namprd11.prod.outlook.com (2603:10b6:5:190::44)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 14:35:47 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::98) by DM6PR11CA0031.outlook.office365.com
 (2603:10b6:5:190::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Tue, 29 Nov 2022 14:35:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.22 via Frontend Transport; Tue, 29 Nov 2022 14:35:46 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 29 Nov
 2022 08:35:46 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 29 Nov
 2022 06:35:46 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 29 Nov 2022 08:35:44 -0600
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
X-Inumbo-ID: 1f2b3ef3-6ff3-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBXblZEm4mQBrX3TNylt5XnJ2AhEeZ2gBMbnTxLh6cfUTIi/pmENnRnYkgn2L5LBjqqQOOb4J/K7ayjov00AcrdBTfiH9Y6acPSDUZUdj53geYKrEBLYpo6CtYAGqiXnOBgSKaCTJxOyZc+h0fTp/SJEaQO45c1k3Shy1ASVjiMjreNUGNOB8epdSOxJ2/o5zHGjPCpGNUqdk7pMsa53dyATTMrPOX/qW4/0New/q+f1vIvghwmfbkCpnHU/gnq6aUQT8IxoTKF7BRJyBUHpRziUYu4KJYvD5na1NJm/EM79rRwtBkItEMA42NRzrDOOW1cik9il8O2IDEmWTvvMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SaO6BxjxVhpqpUkYC2eREnHIrzGVzLqh8S2ov/8Gg4=;
 b=UaQLSrirjsI+j8oC0fOn7nZs3juRHuEvOB5917DJPlRcarmxYR4AT5qQC1yoiS9U5s7GzKQx7yn4ZNyNt5YvHN9zkHgllRTlGowEpEYSb0qRE1J4xVYXHTQMsc/CLBbnrsN7N/8AFfaGwR3YtLGU9Cv1475UjyK84VpdPw2zMWqk5jTnT8yLA65C/ZU84M4U5tWHX5juBKTSJsQc424dGPQPMhFEjSm2LvFWm4WGnTkeeITQ+QpTCcg4EkGj2tiO7ymZPPasz3x8ZzTrcYPTXs3thgSj42+9vyERlKeF/L1I6aoh1yVJATNCPrvoJuz+BDdCiAC1FRRwwr4XHyREVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SaO6BxjxVhpqpUkYC2eREnHIrzGVzLqh8S2ov/8Gg4=;
 b=V90V09fgacsvP/0uMAKbkKrWyxYjsB3HZvSnJmcmxuWdukmwPGPZpj4qiGa0iT+n12H3aa2cfBmp6a2CB+crmeSAEOSNq6r060+sPVquwudZUy94rZSUUH9BDAoPMV6tZlYNdPx1BlSRcqUVTMyemWMaS5LasA5aP5MQ7sRpi2M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <16eafb2b-988a-4289-8660-ad5f764888d6@amd.com>
Date: Tue, 29 Nov 2022 15:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v4 08/11] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n>
 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-9-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221128155649.31386-9-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT021:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 39aecda4-70a5-4c9a-6940-08dad21700f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zorjisd5E+8UjZI1TprkW8nH3QIkzpsExGsxH52KztfSEsUO00isIU5mvLX8NpSrmzDNCsbmnqkwGzPu+Q9eJyImX4ANjn4jhNvJArVrSNqx5w0QPzEExL/nKOO5FdifucmA2ePoMQNIkQSBpMb4owjB/dh5kkdoNWT/eJSqLAp/mpWiYamrnak3t8LbqAFp3jxwnFC1TXt8OsHKPyAoMXM/2ajv4fdoXJls0i4YQyDSHisK7vLZTI5FgeI0QjSaGnl1HrZjO1i35ga1zolQqro+ryAxH2JONTa8Hy7Q5ljaUOXExfu/eYOSpCUjqESFgV9AZPRp0yDUwjXXvIICPsSZEvnfgVYj5HunUb77KYMNHkhmVDgijlR5BPUKps2BQPeIqTRgMvdmAxmiivDnCAirz+9vBKQ91OCPC8+BO6sCIc+CtYMbMIQTd2SbY8b/zpExcKgQNTo4JbD3mV7heoWUTiaXnvcbMN0XICp2UE8mGzJQSzZas7UXyn2yAaiyhX1lKTll22ZfdcrUXzbV5poCJoPtczABHirRxRlKdXRWp0U5H5WDyRH/Vtd+V0Ucu+pjl8+iSuwwrX8+QMAba63cOS8d3+XPCwBVGDfhY2FsPBtryvprq48tSqiBLoUVj49oRY1VWgQnDp7DsTzC/ZHxTkeGIfbBTGyGsUyKwiZYhNivL/PUesaV0q+BTzlKh5lOihUFXZL8D6ewDGthQ2EjjYR1XixsC6HVxggFB4SL1zEdRSyPt5Cb1rNZeCMNFkAKdIWduB0Qu3t2kGB9uA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(41300700001)(8936002)(44832011)(8676002)(4326008)(4744005)(31686004)(356005)(54906003)(110136005)(81166007)(40460700003)(478600001)(70586007)(316002)(2906002)(70206006)(16576012)(336012)(36756003)(86362001)(53546011)(31696002)(26005)(2616005)(186003)(83380400001)(36860700001)(82310400005)(47076005)(426003)(40480700001)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:35:46.7991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aecda4-70a5-4c9a-6940-08dad21700f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073

Hi Ayan,

On 28/11/2022 16:56, Ayan Kumar Halder wrote:
> Adapt save_aprn_regs()/restore_aprn_regs() for AArch32.
> 
> For which we have defined the following registers:-
> 1. Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
> 2. Interrupt Controller Hyp Active Priorities Group1 Registers 0-3
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


