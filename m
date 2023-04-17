Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D886E4558
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521956.810988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMDe-00070I-Uh; Mon, 17 Apr 2023 10:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521956.810988; Mon, 17 Apr 2023 10:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMDe-0006xk-Qv; Mon, 17 Apr 2023 10:36:22 +0000
Received: by outflank-mailman (input) for mailman id 521956;
 Mon, 17 Apr 2023 10:36:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1poMDe-0006xe-0g
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:36:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eab::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b02d240d-dd0b-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 12:36:20 +0200 (CEST)
Received: from DS7PR03CA0109.namprd03.prod.outlook.com (2603:10b6:5:3b7::24)
 by IA1PR12MB7495.namprd12.prod.outlook.com (2603:10b6:208:419::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:36:16 +0000
Received: from DS1PEPF0000E650.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::48) by DS7PR03CA0109.outlook.office365.com
 (2603:10b6:5:3b7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 10:36:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E650.mail.protection.outlook.com (10.167.18.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.17 via Frontend Transport; Mon, 17 Apr 2023 10:36:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 05:35:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 03:35:51 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 05:35:50 -0500
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
X-Inumbo-ID: b02d240d-dd0b-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoegPqCECVB+31NpdAssC+ntHE38qSx74K7xM46AjYPadlwIEV/HEkBCflXGd3kkTumKf+oZpE6w7E2zg5Hhm/x+0MQxW8uR1fdM3Yn044hFfvNger7vjI6VQcWaY9GEGohkA0hYL2FdcYUiZ+EF7UhAv4F0aaeA3qDk+4/HpYaOzmkUZnfgBI/xJ3e7hDCvEfPndSre3BB7k+GAbllp4TeCYCfbvaGv8PVb/8vBbCFbXjVvpNusxE7llyXFzblpd8hDcqk5fHON05WeUXSJY5LQu1JtB0g13gfxOLjUnVgl91Sh7EH9f7Js53Td/pVxYAvtda6HZJ4EXYFVVshnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlAqRTivRxolPbI376THeEP0s7asZIDGX9hWp4yMI4Y=;
 b=Cgh7lsAiDjK9k18fJxDi3w6ivRy45XRWa8dOXWuDaWHy1wfjteNpDdZM0N7EYiMvmK/JcN357ajlVfbYPw7s7ZI8aWt+JlTpkLF+XGgFkZfQhAADk+bbNusWkEmFMkr2BSf9Rb66iG7mPJC5YbWglqIQbB3/v9zOaIM/okPake8u8YVcmx84CQwwE2HOVhdwn8r9b/em6U2YmOG0XUltXmEjfqp9TQNXLTq31/eK6VXxLuTkdOQpFWVPU2JEDtos6qjyCIKQOMyDOatDCz25WPWXJ+KX4sRFvxVMhltHFJBWpq9iKP0eQnPCPrr/iwQmk/95m6eXSROpsiSlVa9yfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlAqRTivRxolPbI376THeEP0s7asZIDGX9hWp4yMI4Y=;
 b=SK3LSsOAr5muphMNmJP0YrqYjJbjEuAUUSZtt0peoMMXhtrFZceGL1Gs0RTRHinVEXW4h8jvZpDs5CzJYo/OcFCTChVlLX9gJNW+4us2eOoTrHGENDQnI6/WFzyZc6ZvKlnRph95x4ZgBGeQUGTwFKHAkADPKEO47kOadNYMRaw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8667c4cf-e974-6107-8a98-4a14a89f9266@amd.com>
Date: Mon, 17 Apr 2023 12:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 09/17] xen/iommu: protect iommu_add_dt_device()
 with dtdevs_lock
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-10-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E650:EE_|IA1PR12MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 93dcc17e-e85e-4b32-2512-08db3f2f92c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r3vAnhNHEi9LycE1W+3q2pRsk57Xpqbq5B7KwFryu48qVIAnDO1ltClay5NnGXobFveTM7ApW6esnwCc8nRnWHHOrJ6xrg1ab2ux5ie/caXO5og/vKSwa93mSGPfiTjfMbqBc/pw6rRQ+3ovv2FLYcJiobeErRPtydIHnaBTrNsolZhTaGaAcYAcJLZSbROeJuwzyp3uyJ8ZYxyV63nFUN75Cqn9+FXFjsnP+vuhhCxBaJ6zlm/TYS1EUtcJvDjqtpTOJF7A6fKbOIRpHipe1Xu/ICLInTe/tc2psNlB9Aps6aHOJjLN/d0PGIyKOyZ8VksOeQ6FOQF9eD+2615rwR45FrAVHVR+yZjMCooK7xWp7WDXGN4QieAh2mZSD1I17lbGkZypeyugWeqPFmSZjp5VyM9nDTzmsX15qmXZDy3zbT1tsJX2CbZ5imm4s5gO+dioM0Yu5GgJy+EY28n6j+6ZnH6fcrNRaLEWezO21kzxFjgERHTfnlCaClLNmdVPWd8hPMmkxmix0x4MW/uJJjJhvaqsHNb6J7+pdQ8t8oxbI8wMG3jdkRCziHN8k3h0aKTGtni+7u/FtgDxKSnCPkscT1Epo/andP+AyClF39y35JwAHc6wLlWVwvZHk+vqErFHWuEZkC/FbSnI0+PTb0ein7U58z7nM1JzqYtu66cq1Q3wWimrAQ2eZgCxegiXpmlWUotZbEAqkWBE8ch8NcW1seheg2dCHsMtsRyoq0Kpg6+ztbyyl7vTFGlILn5w8cqRKOHADjCvBlj+cU3cTg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(478600001)(8936002)(8676002)(316002)(41300700001)(82740400003)(4326008)(40480700001)(70586007)(70206006)(81166007)(54906003)(110136005)(356005)(40460700003)(186003)(4744005)(2906002)(36756003)(53546011)(26005)(336012)(86362001)(31696002)(83380400001)(426003)(47076005)(82310400005)(2616005)(36860700001)(31686004)(16576012)(5660300002)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:36:16.0747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dcc17e-e85e-4b32-2512-08db3f2f92c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E650.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7495

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access add.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


